#include "SymbolTable.h"
#include <iostream>
#include <sstream>
#include <cassert>

//符号表构造函数
SymbolEntry::SymbolEntry(Type *type, int kind) 
{
    this->type = type;
    this->kind = kind;
}


ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int value) : SymbolEntry(type, SymbolEntry::CONSTANT)
{
    this->value = value;
}

//输出常量值字符串函数
std::string ConstantSymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << value;
    return buffer.str();
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, std::string name, int scope) : SymbolEntry(type, SymbolEntry::VARIABLE), name(name)
{
    this->scope = scope;
}

std::string IdentifierSymbolEntry::toStr()
{
    return name;
}

//暂时作用域的标签
//构造函数（暂时作用域变量标签号）
TemporarySymbolEntry::TemporarySymbolEntry(Type *type, int label) : SymbolEntry(type, SymbolEntry::TEMPORARY)
{
    this->label = label;
}

//转字符：标签t+标号
std::string TemporarySymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << "t" << label;
    return buffer.str();
}

//符号表
//默认构造函数
SymbolTable::SymbolTable()
{
    //初始化
    prev = nullptr;
    level = 0;
}

//链接前项的构造函数
SymbolTable::SymbolTable(SymbolTable *prev)
{
    this->prev = prev;
    this->level = prev->level + 1;
}

/*
    Description: lookup the symbol entry of an identifier in the symbol table
    Parameters: 
        name: identifier name
    Return: pointer to the symbol entry of the identifier

    hint:
    1. The symbol table is a stack. The top of the stack contains symbol entries in the current scope.
    2. Search the entry in the current symbol table at first.
    3. If it's not in the current table, search it in previous ones(along the 'prev' link).
    4. If you find the entry, return it.
    5. If you can't find it in all symbol tables, return nullptr.

·····描述：在符号表中查找标识符的符号条目
     参数：
         名称：标识符名称
     返回： 指向标识符的符号条目的指针

     暗示：
     1.符号表是一个堆栈。 堆栈顶部包含当前范围内的符号条目。
     2. 首先在当前符号表中查找条目。
     3. 如果它不在当前表中，则在以前的表中搜索它（沿着“prev”链接）。
     4. 如果找到该条目，请将其归还。
     5、如果在所有符号表中都找不到，则返回nullptr。

*/
//查找函数
SymbolEntry* SymbolTable::lookup(std::string name)
{
    // Todo
    SymbolTable* p=this;
    while(true){
        //在某个作用域中找到了
        std::map<std::string, SymbolEntry*>::iterator it = p->symbolTable.find(name);
        if(it != p->symbolTable.end()){
            return p->symbolTable[name];
        }
        //如果前面没有作用域了，查找失败
        if(p->prev==nullptr){
            assert(0);
            break;
        }
        //否则继续向前作用域查找
        p=p->prev;
    }


    // SymbolTable* p = this;
    // while (p != nullptr)
    //     if (p->symbolTable.find(name) != p->symbolTable.end()) {
    //         return p->symbolTable[name];
    //     } else {
    //         p = p->prev;
    //     }
    // return nullptr;

    // std::map<std::string, SymbolEntry*>::iterator it = this->symbolTable.find(name);
    // if(it != this->symbolTable.end()){
    //     return it->second;
    // }
    // //如果在本作用域中找不到，就到之前的作用域找
    // if(this->getPrev()!=nullptr){
    //     SymbolTable *prevp=this->getPrev();
    //     return prevp->lookup(name);
    // }
    //否则返回空指针
    return nullptr;
}

// install the entry into current symbol table.
//将符号表条目入口点插到当前的符号表中
void SymbolTable::install(std::string name, SymbolEntry* entry)
{
    //向符号表map中插入新条目
    symbolTable[name] = entry;
}
//符号表条目数量初始化
int SymbolTable::counter = 0;
//静态变量t（可以理解为符号表的head？）
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;
