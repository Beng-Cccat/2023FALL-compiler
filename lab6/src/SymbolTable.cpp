#include "SymbolTable.h"
#include <iostream>
#include <sstream>
#include "Type.h"
#include <string.h>

SymbolEntry::SymbolEntry(Type *type, int kind) 
{
    this->type = type;
    this->kind = kind;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int value) : SymbolEntry(type, SymbolEntry::CONSTANT)
{
    this->value = value;
    //检验数据类型
    assert(type->isInt());
}
//ffc
ConstantSymbolEntry::ConstantSymbolEntry(Type* type, std::string value)
    : SymbolEntry(type, SymbolEntry::CONSTANT) {
    assert(type->isString());
    this->strValue = value;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type* type)
    : SymbolEntry(type, SymbolEntry::CONSTANT) {
    // assert(type->isArray());
}

int ConstantSymbolEntry::getValue() const {
    assert(type->isInt());
    return value;
}

std::string ConstantSymbolEntry::getStrValue() const {
    assert(type->isString());
    return strValue;
}

std::string ConstantSymbolEntry::toStr()
{
    std::ostringstream buffer;
     if (type->isInt())
        buffer << value;
    else if (type->isString())
        buffer << strValue;
    return buffer.str();
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, std::string name, int scope, int paramNo, bool sy) 
: SymbolEntry(type, SymbolEntry::VARIABLE), name(name), sy(sy), paramNo(paramNo)
{
    this->scope = scope;
    //addr = nullptr;
    this->initial = false;
    this->label = -1;
    this->allZero = false;
    this->constant = false;// m7
}

void IdentifierSymbolEntry::setValue(int value) {
    if (((IntType*)(this->getType()))->isConst()) {
        if (!initial) {
            this->value = value;
            initial = true;
        } else {
            //error
        }
    } else {
        this->value = value;
    }
}

//wjc arr
void IdentifierSymbolEntry::setArrayValue(int* arrayValue) {
    if (((IntType*)(this->getType()))->isConst()) {
        if (!initial) {
            this->arrayValue = arrayValue;
            initial = true;
        } else {
            // 需要报错
        }
    } else {
        this->arrayValue = arrayValue;
    }
}

std::string IdentifierSymbolEntry::toStr()
{
    //return "@" + name;
    std::ostringstream buffer;
    if (label < 0)
    {
        if (type->isFunc())// m7
            buffer << '@';

        //ffhh
        const char *temp_name = name.c_str();
        char func_name[100];
        size_t length = strlen(temp_name);
        func_name[0]=temp_name[0];
        int func_index=1;
        bool func_flag=false;
        // 遍历字符串
        for (size_t i = 0; i < length; i++) {
            // 如果当前字符是下划线
            if (temp_name[i] == '_') {
                func_flag=true;
                // 如果下划线后有字符，取下划线后的字符的首字母并追加到输出字符串
                if (i + 1 < length) {
                    func_name[func_index++] = temp_name[i + 1];
                }
            }
        }
        func_name[func_index]='\0';
        if(!func_flag){
            if(name.length()>10){
                const char *temp_name = name.c_str();
                for(int i=0;i<10;i++){
                    func_name[i]=temp_name[i];
                }
                func_name[10]='\0';
                buffer << std::string(func_name);
            }
            else{
                buffer << name;
            }
        }
        else{
            buffer << std::string(func_name);
        }
        
        //buffer << name;
    }
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
SymbolEntry* SymbolTable::lookup(std::string name)
{
    // Todo
    SymbolTable* table = this;
    while (table != nullptr)
        if (table->symbolTable.find(name) != table->symbolTable.end()) {
            return table->symbolTable[name];
        } else {
            table = table->prev;
        }
    return nullptr;
}

// install the entry into current symbol table.
bool SymbolTable::install(std::string name, SymbolEntry* entry)
{
    // 检查重定义，如果表中已经存在这个名字
    if (this->symbolTable.find(name) != this->symbolTable.end()) {
        SymbolEntry* se = this->symbolTable[name];
        //如果是函数？TODO
        if (se->getType()->isFunc())
            return se->setNext(entry);
        return false;
    } else {
        //否则，尚未定义，可以正常定义
        symbolTable[name] = entry;
        return true;
    }
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;

//ffc
bool SymbolEntry::setNext(SymbolEntry* se) {
    SymbolEntry* s = this;
    long unsigned int cnt =
        ((FunctionType*)(se->getType()))->getParamsType().size();
    if (cnt == ((FunctionType*)(s->getType()))->getParamsType().size())
        return false;
    while (s->getNext()) {
        if (cnt == ((FunctionType*)(s->getType()))->getParamsType().size())
            return false;
        s = s->getNext();
    }
    if (s == this) {
        this->next = se;
    } else {
        s->setNext(se);
    }
    return true;
}