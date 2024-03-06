#include "BasicBlock.h"
#include "Function.h"
#include <algorithm>

extern FILE *yyout;

// insert the instruction to the front of the basicblock.
// 将指令插入基本块指令链表头
void BasicBlock::insertFront(Instruction *inst)
{
    insertBefore(inst, head->getNext());
}

// insert the instruction to the back of the basicblock.
// 将指令插入基本块指令链表的尾部
void BasicBlock::insertBack(Instruction *inst)
{
    insertBefore(inst, head);
}

// insert the instruction dst before src.
// 将dst指令插入src指令之前
void BasicBlock::insertBefore(Instruction *dst, Instruction *src)
{
    // Todo:OK
    // Instruction* srcprep=src->getPrev();
    // srcprep->setNext(dst);
    // dst->setPrev(srcprep);
    // dst->setNext(src);
    // src->setPrev(dst);

    // dst->setParent(this);

    src->getPrev()->setNext(dst);
    dst->setPrev(src->getPrev());

    dst->setNext(src);
    src->setPrev(dst);

    dst->setParent(this);
    fprintf(stderr, "aaaaa你有事吗？？\n");
}

// remove the instruction from intruction list.
// 从指令表中移除某条指令
void BasicBlock::remove(Instruction *inst)
{
    inst->getPrev()->setNext(inst->getNext());
    inst->getNext()->setPrev(inst->getPrev());
}

void BasicBlock::output() const
{
    fprintf(yyout, "B%d:", no);

    if (!pred.empty())
    {
        fprintf(yyout, "%*c; preds = %%B%d", 32, '\t', pred[0]->getNo());
        for (auto i = pred.begin() + 1; i != pred.end(); i++)
            fprintf(yyout, ", %%B%d", (*i)->getNo());
    }
    fprintf(yyout, "\n");
    for (auto i = head->getNext(); i != head; i = i->getNext())
        i->output();
}

// 添加后继基本块
void BasicBlock::addSucc(BasicBlock *bb)
{
    succ.push_back(bb);
}

// remove the successor basicclock bb.
void BasicBlock::removeSucc(BasicBlock *bb)
{
    succ.erase(std::find(succ.begin(), succ.end(), bb));
}

void BasicBlock::addPred(BasicBlock *bb)
{
    pred.push_back(bb);
}

// remove the predecessor basicblock bb.
void BasicBlock::removePred(BasicBlock *bb)
{
    pred.erase(std::find(pred.begin(), pred.end(), bb));
}

BasicBlock::BasicBlock(Function *f)
{
    // 暂时作用域符号表序号？
    this->no = SymbolTable::getLabel();
    // 函数插入基本块
    f->insertBlock(this);
    parent = f;
    head = new DummyInstruction();
    // 创建头指针，空指令
    head->setParent(this);
}

BasicBlock::~BasicBlock()
{
    Instruction *inst;
    inst = head->getNext();
    while (inst != head)
    {
        Instruction *t;
        t = inst;
        inst = inst->getNext();
        delete t;
    }
    for (auto &bb : pred)
        bb->removeSucc(this);
    for (auto &bb : succ)
        bb->removePred(this);
    parent->remove(this);
}
