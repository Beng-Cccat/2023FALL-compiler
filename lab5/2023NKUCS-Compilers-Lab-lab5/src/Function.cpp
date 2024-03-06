#include "Function.h"
#include "Unit.h"
#include "Type.h"
#include <list>

extern FILE *yyout;

Function::Function(Unit *u, SymbolEntry *s)
{
    u->insertFunc(this);
    entry = new BasicBlock(this);
    sym_ptr = s;
    parent = u;
}

Function::~Function()
{
    auto delete_list = block_list;
    for (auto &i : delete_list)
        delete i;
    parent->removeFunc(this);
}

// remove the basicblock bb from its block_list.
// 从块链表中移除该基本块
void Function::remove(BasicBlock *bb)
{
    block_list.erase(std::find(block_list.begin(), block_list.end(), bb));
}

void Function::output() const
{
    FunctionType *funcType = dynamic_cast<FunctionType *>(sym_ptr->getType());
    Type *retType = funcType->getRetType();
    std::vector<SymbolEntry *> paramsSe = funcType->getParamsSe();
    if (!paramsSe.size())
        fprintf(yyout, "define %s %s() {\n", retType->toStr().c_str(),
                sym_ptr->toStr().c_str());
    else
    {
        fprintf(yyout, "define %s %s(", retType->toStr().c_str(),
                sym_ptr->toStr().c_str());
        for (long unsigned int i = 0; i < paramsSe.size(); i++)
        {
            if (i)
                fprintf(yyout, ", ");
            fprintf(yyout, "%s %s", paramsSe[i]->getType()->toStr().c_str(), paramsSe[i]->toStr().c_str());
        }
        fprintf(yyout, ") {\n");
    }
    std::set<BasicBlock *> v;
    std::list<BasicBlock *> q;
    q.push_back(entry);
    // 在集合中加入基本块，可以避免重复执行相同的基本块？
    v.insert(entry);
    while (!q.empty())
    {
        // 每次弹出链表中的第一个基本块
        auto bb = q.front();
        q.pop_front();
        bb->output();
        for (auto succ = bb->succ_begin(); succ != bb->succ_end(); succ++)
        {
            // 遍历基本块的后继基本块
            if (v.find(*succ) == v.end())
            {
                // 如果该基本块不存在于集合中，加入集合
                v.insert(*succ);
                q.push_back(*succ);
            }
        }
    }
    fprintf(yyout, "}\n");
}
