#ifndef __OPERAND_H__
#define __OPERAND_H__

#include "SymbolTable.h"
#include <vector>

class Instruction;
class Function;


// class Operand - The operand of an instruction.
//指令的操作数
class Operand
{
typedef std::vector<Instruction *>::iterator use_iterator;
//迭代器

private:
    Instruction *def;                
    // The instruction where this operand is defined.
    //定义操作数的指令
    std::vector<Instruction *> uses; 
    // Intructions that use this operand.
    //使用这个操作数的指令
    SymbolEntry *se;                 
    // The symbol entry of this operand.
    //该操作数符号表入口点
public:
    Operand(SymbolEntry*se) :se(se){def = nullptr;};
    void setDef(Instruction *inst) {def = inst;};
    void addUse(Instruction *inst) { uses.push_back(inst);};
    void removeUse(Instruction *inst);
    int usersNum() const {return uses.size();};
    Instruction *getDef() { return def; };
    std::vector<Instruction *> &getUse() { return uses; };

    use_iterator use_begin() {return uses.begin();};
    use_iterator use_end() {return uses.end();};
    Type* getType() {return se->getType();};
    std::string toStr() const;
};

#endif