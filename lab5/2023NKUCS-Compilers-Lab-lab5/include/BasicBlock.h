#ifndef __BASIC_BLOCK_H__
#define __BASIC_BLOCK_H__
#include <vector>
#include <set>
#include "Instruction.h"

class Function;

// 基本块，包含中间代码的指令列表
class BasicBlock
{
    typedef std::vector<BasicBlock *>::iterator bb_iterator;
    // 迭代器

private:
    // 前驱基本块pred，后继基本块succ（看pdf，可能有多个）
    std::vector<BasicBlock *> pred, succ;
    // 指令链表头节点
    Instruction *head;
    // 包含该基本块的父函数
    Function *parent;
    int no;

public:
    BasicBlock(Function *);
    ~BasicBlock();
    void insertFront(Instruction *);
    void insertBack(Instruction *);
    void insertBefore(Instruction *, Instruction *);
    void remove(Instruction *);
    bool empty() const { return head->getNext() == head; }
    void output() const;
    bool succEmpty() const { return succ.empty(); };
    bool predEmpty() const { return pred.empty(); };
    void addSucc(BasicBlock *);
    void removeSucc(BasicBlock *);
    void addPred(BasicBlock *);
    void removePred(BasicBlock *);
    int getNo() { return no; };
    Function *getParent()
    {
        fprintf(stderr, "哈哈 basicblock->getparent\n");
        return parent;
    };
    Instruction *begin() { return head->getNext(); };
    Instruction *end() { return head; };
    Instruction *rbegin() { return head->getPrev(); };
    Instruction *rend() { return head; };
    bb_iterator succ_begin() { return succ.begin(); };
    bb_iterator succ_end() { return succ.end(); };
    bb_iterator pred_begin() { return pred.begin(); };
    bb_iterator pred_end() { return pred.end(); };
    int getNumOfPred() const { return pred.size(); };
    int getNumOfSucc() const { return succ.size(); };
};

#endif