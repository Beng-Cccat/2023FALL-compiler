#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include "Operand.h"
#include "AsmBuilder.h"
#include <vector>
#include <map>
#include <sstream>

class BasicBlock;

class Instruction
{
public:
    Instruction(unsigned instType, BasicBlock *insert_bb = nullptr);
    virtual ~Instruction();
    BasicBlock *getParent();
    bool isUncond() const {return instType == UNCOND;};
    bool isCond() const {return instType == COND;};
    bool isRet() const { return instType == RET; };
    bool isAlloc() const {return instType == ALLOCA;};
    void setParent(BasicBlock *);
    void setNext(Instruction *);
    void setPrev(Instruction *);
    Instruction *getNext();
    Instruction *getPrev();
    virtual Operand *getDef() { return nullptr; }
    virtual std::vector<Operand *> getUse() { return {}; }
    virtual void output() const = 0;
    MachineOperand* genMachineOperand(Operand*);
    MachineOperand* genMachineReg(int reg);
    MachineOperand* genMachineVReg();
    MachineOperand* genMachineImm(int val);
    MachineOperand* genMachineLabel(int block_no);
    virtual void genMachineCode(AsmBuilder*) = 0;
protected:
    unsigned instType;
    unsigned opcode;
    Instruction *prev;
    Instruction *next;
    BasicBlock *parent;
    // 操作数
    std::vector<Operand *> operands;
    enum
    {
        BINARY,
        COND,
        UNCOND,
        RET,
        LOAD,
        STORE,
        CMP,
        ALLOCA,
        CALL,
        ZEXT,
        XOR,
        GEP
    };
};

// meaningless instruction, used as the head node of the instruction list.
class DummyInstruction : public Instruction
{
public:
    DummyInstruction() : Instruction(-1, nullptr) {};
    void output() const {};
    void genMachineCode(AsmBuilder*) {};
};

class AllocaInstruction : public Instruction
{
public:
    AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;
    Operand *getDef() { return operands[0]; }
    void genMachineCode(AsmBuilder*);
private:
    SymbolEntry *se;
};

class LoadInstruction : public Instruction
{
public:
    LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
    Operand *getDef() { return operands[0]; }
    std::vector<Operand *> getUse() { return {operands[1]}; }
    void genMachineCode(AsmBuilder*);
};

class StoreInstruction : public Instruction
{
public:
    StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb = nullptr);
    ~StoreInstruction();
    void output() const;
    std::vector<Operand *> getUse() { return {operands[0], operands[1]}; }
    void genMachineCode(AsmBuilder*);
};

class BinaryInstruction : public Instruction
{
public:
    BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    enum
    {
        SUB,
        ADD,
        MUL,
        DIV,
        MOD,
        XOR,
        AND,
        OR
    };
    Operand *getDef() { return operands[0]; }
    std::vector<Operand *> getUse() { return {operands[1], operands[2]}; }
};

class CmpInstruction : public Instruction
{
public:
    CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~CmpInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    enum {E, NE, L, LE, G, GE};
    Operand *getDef() { return operands[0]; }
    std::vector<Operand *> getUse() { return {operands[1], operands[2]}; }
};

// unconditional branch
class UncondBrInstruction : public Instruction
{
public:
    UncondBrInstruction(BasicBlock*, BasicBlock *insert_bb = nullptr);
    void output() const;
    void setBranch(BasicBlock *);
    BasicBlock *getBranch();
    void genMachineCode(AsmBuilder*);
    BasicBlock **patchBranch() {return &branch;};
protected:
    BasicBlock *branch;
};

// conditional branch
class CondBrInstruction : public Instruction
{
public:
    CondBrInstruction(BasicBlock*, BasicBlock*, Operand *, BasicBlock *insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock*);
    BasicBlock* getTrueBranch();
    void setFalseBranch(BasicBlock*);
    BasicBlock* getFalseBranch();
    void genMachineCode(AsmBuilder*);
    BasicBlock **patchBranchTrue() {return &true_branch;};
    BasicBlock **patchBranchFalse() {return &false_branch;};
    std::vector<Operand *> getUse() { return {operands[0]}; }
protected:
    BasicBlock* true_branch;
    BasicBlock* false_branch;
};

class RetInstruction : public Instruction
{
public:
    RetInstruction(Operand *src, BasicBlock *insert_bb = nullptr);
    ~RetInstruction();
    std::vector<Operand *> getUse()
    {
        if (operands.size())
            return {operands[0]};
        else
            return {};
    }
    void output() const;
    void genMachineCode(AsmBuilder*);
};

// ffc
class CallInstruction : public Instruction {
   private:
    SymbolEntry* func;
    Operand* dst;
   public:
    CallInstruction(Operand* dst,
                    SymbolEntry* func,
                    std::vector<Operand*> params,
                    BasicBlock* insert_bb = nullptr);
    void output() const;
    ~CallInstruction();
    void genMachineCode(AsmBuilder*);
};

class ZextInstruction : public Instruction {
   public:
    ZextInstruction(Operand* dst,
                    Operand* src,
                    BasicBlock* insert_bb = nullptr);
    void output() const;
    ~ZextInstruction();
    void genMachineCode(AsmBuilder*);
};

class XorInstruction : public Instruction {
   public:
    XorInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    void output() const;
    ~XorInstruction();
    void genMachineCode(AsmBuilder*);
};

//wjc arr
class GepInstruction : public Instruction {
   private:
   // m7
    bool paramFirst;
    bool first;
    bool last;
    Operand* init;

   public:
    GepInstruction(Operand* dst,
                   Operand* arr,
                   Operand* idx,
                   BasicBlock* insert_bb = nullptr,
                   bool paramFirst = false);
    void output() const;
    ~GepInstruction();
    // m7
    void genMachineCode(AsmBuilder*);
    void setFirst() { first = true; };
    void setLast() { last = true; };
    Operand* getInit() const { return init; };
    void setInit(Operand* init) { this->init = init; };
};

#endif