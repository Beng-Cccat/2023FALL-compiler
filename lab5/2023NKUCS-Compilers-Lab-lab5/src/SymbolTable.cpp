#include "SymbolTable.h"
#include <iostream>
#include <sstream>
#include "Type.h"

SymbolEntry::SymbolEntry(Type *type, int kind)
{
    this->type = type;
    this->kind = kind;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int value) : SymbolEntry(type, SymbolEntry::CONSTANT)
{
    this->value = value;
}

std::string ConstantSymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << value;
    return buffer.str();
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, std::string name, int scope, bool sy) : SymbolEntry(type, SymbolEntry::VARIABLE), name(name), sy(sy)
{
    this->scope = scope;
    // addr = nullptr;
    this->initial = false;
    this->label = -1;
    this->allZero = false;
    fprintf(stderr, "IdentifierSymbolEntry coming!!%d\n", sy);
}

std::string IdentifierSymbolEntry::toStr()
{
    // return "@" + name;
    std::ostringstream buffer;
    if (label < 0)
        buffer << '@' << name;
    else
        buffer << "%t" << label;
    return buffer.str();
}

TemporarySymbolEntry::TemporarySymbolEntry(Type *type, int label) : SymbolEntry(type, SymbolEntry::TEMPORARY)
{
    this->label = label;
}

std::string TemporarySymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << "%t" << label;
    return buffer.str();
}

SymbolTable::SymbolTable()
{
    prev = nullptr;
    level = 0;
}

SymbolTable::SymbolTable(SymbolTable *prev)
{
    this->prev = prev;
    this->level = prev->level + 1;
}

// ffc
bool SymbolEntry::setNext(SymbolEntry *se)
{
    SymbolEntry *s = this;
    long unsigned int cnt =
        ((FunctionType *)(se->getType()))->getParamsType().size();
    if (cnt == ((FunctionType *)(s->getType()))->getParamsType().size())
        return false;
    while (s->getNext())
    {
        if (cnt == ((FunctionType *)(s->getType()))->getParamsType().size())
            return false;
        s = s->getNext();
    }
    if (s == this)
    {
        this->next = se;
    }
    else
    {
        s->setNext(se);
    }
    return true;
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
*/
SymbolEntry *SymbolTable::lookup(std::string name)
{
    // Todo:OK
    SymbolTable *p = this;
    while (true)
    {
        // 在某个作用域中找到了
        std::map<std::string, SymbolEntry *>::iterator it = p->symbolTable.find(name);
        if (it != p->symbolTable.end())
        {
            return p->symbolTable[name];
        }
        // 如果前面没有作用域了，查找失败
        if (p->prev == nullptr)
        {
            break;
        }
        // 否则继续向前作用域查找
        p = p->prev;
    }
    return nullptr;
}

// install the entry into current symbol table.
bool SymbolTable::install(std::string name, SymbolEntry *entry)
{
    // 检查重定义
    if (this->symbolTable.find(name) != this->symbolTable.end())
    {
        SymbolEntry *se = this->symbolTable[name];
        if (se->getType()->isFunc())
            return se->setNext(entry);
        return false;
    }
    else
    {
        symbolTable[name] = entry;
        return true;
    }
}

void IdentifierSymbolEntry::setValue(int value)
{
    if (((IntType *)(this->getType()))->isConst())
    {
        if (!initial)
        {
            this->value = value;
            initial = true;
        }
        else
        {
            // error
        }
    }
    else
    {
        this->value = value;
    }
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;
