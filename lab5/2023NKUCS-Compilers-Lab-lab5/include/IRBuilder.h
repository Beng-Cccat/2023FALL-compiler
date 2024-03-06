#ifndef __IRBUILDER_H__
#define __IRBUILDER_H__

class Unit;
class Function;
class BasicBlock;

// 中间代码生成器，负责构建中间代码
class IRBuilder
{
private:
    Unit *unit;
    BasicBlock *insertBB;
    // The current basicblock that instructions should be inserted into.
    // 指令要插入的基本块，将生成的中间代码有序地插入到特定的基本块

public:
    IRBuilder(Unit *unit) : unit(unit){};
    void setInsertBB(BasicBlock *bb) { insertBB = bb; };
    Unit *getUnit() { return unit; };
    BasicBlock *getInsertBB()
    {
        fprintf(stderr, "哈哈 irbuilder getinsertbb\n");
        return insertBB;
    };
};

#endif