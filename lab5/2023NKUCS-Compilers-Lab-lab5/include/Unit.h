#ifndef __UNIT_H__
#define __UNIT_H__

#include <vector>
#include "Function.h"

// 编译单元
class Unit
{
    // 迭代器
    typedef std::vector<Function *>::iterator iterator;
    typedef std::vector<Function *>::reverse_iterator reverse_iterator;

private:
    // 存储全局变量的链表
    std::vector<SymbolEntry *> global_list;
    // 存储一个函数链表
    std::vector<Function *> func_list;
    // 存储一个定义链表
    std::vector<SymbolEntry *> declare_list;

public:
    Unit() = default;
    ~Unit();
    void insertFunc(Function *);
    void removeFunc(Function *);
    void insertGlobal(SymbolEntry *se);
    void insertDeclare(SymbolEntry *);
    void output() const;
    iterator begin() { return func_list.begin(); };
    iterator end() { return func_list.end(); };
    reverse_iterator rbegin() { return func_list.rbegin(); };
    reverse_iterator rend() { return func_list.rend(); };
};

#endif