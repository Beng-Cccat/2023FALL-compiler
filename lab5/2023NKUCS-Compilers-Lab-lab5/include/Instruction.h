#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include "Operand.h"
#include <vector>
#include <map>

class BasicBlock;

// 指令用一个双向循环链表存储
class Instruction
{
public:
    Instruction(unsigned instType, BasicBlock *insert_bb = nullptr);
    virtual ~Instruction();
    BasicBlock *getParent();
    bool isUncond() const { return instType == UNCOND; };
    bool isCond() const { return instType == COND; };
    // ffc
    bool isRet() const { return instType == RET; };
    void setParent(BasicBlock *);
    void setNext(Instruction *);
    void setPrev(Instruction *);
    Instruction *getNext();
    Instruction *getPrev();
    virtual Operand *getDef() { return nullptr; }
    virtual std::vector<Operand *> getUse() { return {}; }
    virtual void output() const = 0;

protected:
    // 操作数类型
    unsigned instType;
    // 操作符
    unsigned opcode;
    // 前一个节点
    Instruction *prev;
    // 后一个节点
    Instruction *next;
    // 包含这个指令的基本块
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
        XOR
    };
};

// meaningless instruction, used as the head node of the instruction list.
// 无用指令，用于指令链表开头
class DummyInstruction : public Instruction
{
public:
    DummyInstruction() : Instruction(-1, nullptr){};
    void output() const {};
};

// 分配内存指令
class AllocaInstruction : public Instruction
{
public:
    AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;
    Operand *getDef() { return operands[0]; }

private:
    SymbolEntry *se;
};

// 读取数据指令
class LoadInstruction : public Instruction
{
public:
    LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
    Operand *getDef() { return operands[0]; }
    std::vector<Operand *> getUse() { return {operands[1]}; }
};

class StoreInstruction : public Instruction
{
public:
    StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb = nullptr);
    ~StoreInstruction();
    void output() const;
    std::vector<Operand *> getUse() { return {operands[0], operands[1]}; }
};

class BinaryInstruction : public Instruction
{
public:
    BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
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
    enum
    {
        E,
        NE,
        L,
        GE,
        G,
        LE
    };
    Operand *getDef() { return operands[0]; }
    std::vector<Operand *> getUse() { return {operands[1], operands[2]}; }
};

// unconditional branch
class UncondBrInstruction : public Instruction
{
public:
    UncondBrInstruction(BasicBlock *, BasicBlock *insert_bb = nullptr);
    void output() const;
    void setBranch(BasicBlock *);
    BasicBlock *getBranch();
    BasicBlock **patchBranch() { return &branch; };

protected:
    BasicBlock *branch;
    // 跳转的基本块分支
};

// 条件跳转分支
//  conditional branch
class CondBrInstruction : public Instruction
{
public:
    CondBrInstruction(BasicBlock *, BasicBlock *, Operand *, BasicBlock *insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock *);
    BasicBlock *getTrueBranch();
    void setFalseBranch(BasicBlock *);
    BasicBlock *getFalseBranch();
    BasicBlock **patchBranchTrue() { return &true_branch; };
    BasicBlock **patchBranchFalse() { return &false_branch; };
    std::vector<Operand *> getUse() { return {operands[0]}; }

protected:
    BasicBlock *true_branch;
    // 真分支
    BasicBlock *false_branch;
    // 假分支
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
};

// ffc
class CallInstruction : public Instruction
{
private:
    SymbolEntry *func;

public:
    CallInstruction(Operand *dst,
                    SymbolEntry *func,
                    std::vector<Operand *> params,
                    BasicBlock *insert_bb = nullptr);
    void output() const;
};

// 零扩展
class ZextInstruction : public Instruction
{
public:
    ZextInstruction(Operand *dst,
                    Operand *src,
                    BasicBlock *insert_bb = nullptr);
    void output() const;
};

class XorInstruction : public Instruction
{
public:
    XorInstruction(Operand *dst, Operand *src, BasicBlock *insert_bb = nullptr);
    void output() const;
};

#endif