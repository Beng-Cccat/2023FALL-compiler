#include "Type.h"
#include <sstream>

IntType TypeSystem::commonInt = IntType(4);
IntType TypeSystem::commonConstInt = IntType(4, true);
VoidType TypeSystem::commonVoid = VoidType();
FloatType TypeSystem::commonFloat = FloatType(8);

Type *TypeSystem::intType = &commonInt;
Type *TypeSystem::constIntType = &commonConstInt;
Type *TypeSystem::voidType = &commonVoid;
Type *TypeSystem::floatType = &commonFloat;

std::string IntType::toStr()
{
    if (constant)
        return "const int";
    else
        return "int";
}

std::string VoidType::toStr()
{
    return "void";
}

std::string FloatType::toStr()
{
    return "float";
}

std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    buffer << returnType->toStr() << "()";
    return buffer.str();
}
