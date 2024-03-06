%code top{
    #include <iostream>
    #include <assert.h>
    #include <stack>
    #include "parser.h"
    #include <cstring>
    extern Ast ast;
    int yylex();
    int yyerror( char const * );
    std::stack<StmtNode*> whileStack;
    ReturnStmt *ret=nullptr;
    int paramNo = 0;//ffclab6
    //ffcarr
    ArrayType* arrayType;
    int idx;
    int* arrayValue;
    std::stack<InitValueListExpr*> stk;
    InitValueListExpr* top;
    int leftCnt = 0;
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

%union {
    int itype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
    SymbolEntry* se;
    float flotype;
}

%start Program
%token <strtype> ID 
%token <itype> INTEGER
%token <flotype> FLOAT
%token IF ELSE
%token INT VOID
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON
%token ADD SUB OR AND LESS ASSIGN
%token RETURN
%token CONST
%token MUL DIV MOD
%token EQU GE LE NE NOT GT 
%token CHAR
%token WHILE FOR BREAK CONTINUE
%token COMMA DOT FLOAT_DEF
%token LSBRAC RSBRAC SBSAND SBSOR

%nterm <stmttype> Stmts Stmt AssignStmt BlockStmt IfStmt ReturnStmt DeclStmt FuncDef ExprStmt WhileStmt BreakStmt ContinueStmt VarDeclStmt ConstDeclStmt VarDef VarDefList FUNCPARAMS PARAMS PARAM ConstDef ConstDefList BlankStmt
%nterm <exprtype> Exp AddExp Cond LOrExp PrimaryExp LVal RelExp LAndExp MulExp EqExp UnaryExp FuncRParams InitVal ConstInitVal ConstExp FuncArrayIndices ArrayIndices InitValList ConstInitValList
%nterm <type> Type

%precedence THEN
%precedence ELSE
%%
Program
    : Stmts {
        ast.setRoot($1);
    }
    ;
Stmts
    :{fprintf(stderr, "进没进去啊服了\n");
    } Stmt {
        $$=$2;
        fprintf(stderr, "进来了\n");
    }
    | Stmts Stmt{
        $$ = new SeqNode($1, $2);
    }
    ;
Stmt
    : AssignStmt {$$=$1;}
    | BlockStmt {$$=$1;}
    | IfStmt {$$=$1;}
    | ReturnStmt {$$=$1;}
    | DeclStmt {$$=$1;}
    | FuncDef {$$=$1;}
    | ExprStmt{$$=$1;}
    | WhileStmt{$$=$1;}
    | BreakStmt{$$=$1;}
    | ContinueStmt{$$=$1;}
    | BlankStmt {$$=$1;}
    ;
LVal
    : ID {
        SymbolEntry *se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new Id(se);
        delete []$1;
        fprintf(stderr, "LVal成功\n");
    }
    //wjc arr
    | ID ArrayIndices{
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
            fprintf(stderr, "id \"%s\" 未定义，不能做左值", (char*)$1);
        $$ = new Id(se, $2);
        delete []$1;
    }
    ;
AssignStmt
    :
    LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
BlockStmt
    :   LBRACE 
        {identifiers = new SymbolTable(identifiers);} 
        Stmts RBRACE 
        {
            fprintf(stderr, "是你吗哥\n");
            $$ = new CompoundStmt($3);
            fprintf(stderr, "你是哪里有毛病1\n");
            SymbolTable *top = identifiers;
            fprintf(stderr, "你是哪里有毛病2\n");
            identifiers = identifiers->getPrev();
            fprintf(stderr, "你是哪里有毛病3\n");
            if(top!=nullptr){
                delete top;
            }
            fprintf(stderr, "你是哪里有毛病4\n");
        }
    |
    LBRACE RBRACE
    {
        fprintf(stderr, "空");
        $$=new CompoundStmt(nullptr);
    }
    ;
IfStmt
    : IF LPAREN Cond RPAREN Stmt %prec THEN {
        $$ = new IfStmt($3, $5);
    }
    | IF LPAREN Cond RPAREN Stmt ELSE Stmt {
        $$ = new IfElseStmt($3, $5, $7);
        fprintf(stderr, "这么牛？！");
    }
    ;
ReturnStmt
    :
    RETURN Exp SEMICOLON{
        ret=new ReturnStmt($2);
        $$ = new ReturnStmt($2);
        fprintf(stderr, "结束了？\n");
    }
    | RETURN SEMICOLON {
        ret=new ReturnStmt();
        $$ = new ReturnStmt();
    }
    ;

BlankStmt
    : SEMICOLON {
        $$ = new BlankStmt();
    }
    ;

Exp
    :
    AddExp {$$ = $1;}
    ;
Cond
    :
    LOrExp {$$ = $1;}
    ;
ConstExp
    : AddExp {$$ = $1;}
    ;
PrimaryExp
    :
    LPAREN Exp RPAREN {
        $$ = $2;
    }
    |
    LVal {
        $$ = $1;
    }
    | INTEGER {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        fprintf(stderr,"creating TYPE Size: %d\n",se->getType()->getSize());
        $$ = new Constant(se);
        fprintf(stderr, "创好了mo \"%d\"\n", $1);
    }
    | FLOAT {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, $1);
        $$ = new Constant(se);
    }
    ;

UnaryExp 
    : PrimaryExp {$$ = $1;}
    | ID LPAREN FuncRParams RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new CallExpr(se, $3);
    }
    | ID LPAREN RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new CallExpr(se);
    }
    | ADD UnaryExp {$$ = $2;}
    | SUB UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::SUB, $2);
    }
    | NOT UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::NOT, $2);
    }
    ;

MulExp
    : UnaryExp {$$=$1;}
    | MulExp MUL UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
    }
    | MulExp DIV UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
    }
    | MulExp MOD UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
    }
    ;

AddExp
    : MulExp {$$ = $1;}
    | AddExp ADD MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
    }
    | AddExp SUB MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;
RelExp
    :
    AddExp {$$ = $1;}
    |
    RelExp LESS AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $1, $3);
    }
    | RelExp LE AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LE, $1, $3);
    }
    | RelExp GT AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREATER, $1, $3);
    }
    | RelExp GE AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GE, $1, $3);
    }
    ;

EqExp
    : RelExp {$$ = $1;}
    | EqExp EQU RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQU, $1, $3);
    }
    | EqExp NE RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NE, $1, $3);
    }

LAndExp
    :
    EqExp {$$ = $1;}
    |
    LAndExp AND EqExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;
LOrExp
    :
    LAndExp {$$ = $1;}
    |
    LOrExp OR LAndExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;
Type
    : INT {
        $$ = TypeSystem::intType;
    }
    | VOID {
        $$ = TypeSystem::voidType;
    }
    | FLOAT_DEF {
        $$ = TypeSystem::floatType;
    }
    ;

FuncRParams 
    : Exp {$$ = $1;}
    | FuncRParams COMMA Exp {
        $$ = $1;
        $$->setnext($3);
    }

DeclStmt
    : VarDeclStmt {
        $$=$1;
        fprintf(stderr, "ff1\n");
    } /* int a,b; */
    | ConstDeclStmt {$$=$1;} /* const int a,b; */
    ;

VarDeclStmt
    :
    Type VarDefList SEMICOLON {
        $$=$2;
    }
    ;

/* const int a,b; */
ConstDeclStmt
    :
    CONST Type ConstDefList SEMICOLON {
        $$=$3;
    }
    ;

/* a,b,c,d */
VarDefList
    :
    VarDef {$$=$1;}
    |
    VarDefList COMMA VarDef{
        $$=$1;
        $1->setnext($3);
    }
    ;

ConstDefList
    : ConstDefList COMMA ConstDef {
        $$ = $1;
        $1->setnext($3);
    }
    | ConstDef {$$ = $1;}
    ;

//wjc arr
ArrayIndices
    : LSBRAC ConstExp RSBRAC {
        $$ = $2;
    }
    //多维数组
    | ArrayIndices LSBRAC ConstExp RSBRAC {
        $$ = $1;
        $1->setnext($3);
    }
    ;

/* a|a=1 */
VarDef
    :
    ID {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,$1, identifiers->getLevel());
        //改
        if(!identifiers->install($1, se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        /* 没有expr，不用单独存 */
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ASSIGN InitVal {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,$1, identifiers->getLevel());
        if(!identifiers->install($1, se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    //wjc arr
    //a[n]
    | ID ArrayIndices {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = $2;
        //vec存入需要初始化的数组（如果有多维的话有多个）
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getnext());
        }
        Type *type = TypeSystem::intType;
        Type* temp1;
        while(!vec.empty()){
            //每次从vec最后取出需要创建的数组，第一个构造的默认是int类型
            temp1 = new ArrayType(type, vec.back());
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            //如果是多维数组a[m][n],先创建后面的，嵌套创建前面的数组
            type = temp1;
            vec.pop_back();
        }
        arrayType = (ArrayType*)type;
        //用最后创建的type创建符号表
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        //设置全0，未初始化值
        ((IdentifierSymbolEntry*)se)->setAllZero();
        int *p = new int[type->getSize()];
        //先初始化了第一维的int数组
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);
        if(!identifiers->install($1, se))
            fprintf(stderr, "id \"%s\" 已定义,不能重复定义\n", (char*)$1);
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ArrayIndices ASSIGN {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = $2;
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getnext());
        }
        Type* type = TypeSystem::intType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        std::stack<InitValueListExpr*>().swap(stk);
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        $<se>$ = se;
        arrayValue = new int[arrayType->getSize()];
    } InitVal {
        ((IdentifierSymbolEntry*)$<se>4)->setArrayValue(arrayValue);
        if(((InitValueListExpr*)$5)->isEmpty())
            ((IdentifierSymbolEntry*)$<se>4)->setAllZero();
        if(!identifiers->install($1, $<se>4))
            fprintf(stderr, "id \"%s\" 已定义,不能重复定义\n", (char*)$1);
        $$ = new DeclStmt(new Id($<se>4), $5);
        delete []$1;
    }
    ;

InitVal 
    : Exp {
        // 检查是否为int
        if(!$1->getSymPtr()->getType()->isInt())
        {
            fprintf(stderr,
                "cannot initialize a variable of type \'int\' with an rvalue "
                "of type \'%s\'\n",
                $1->getSymPtr()->getType()->toStr().c_str());
        }
        $$ = $1; 
        //wjc arr
        if(!stk.empty()){
            arrayValue[idx++] = $1->getValue();
            Type* arrTy = stk.top()->getSymbolEntry()->getType();
            if(arrTy == TypeSystem::intType)
                stk.top()->addExpr($1);
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getElementType() != TypeSystem::intType){
                        arrTy = ((ArrayType*)arrTy)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitValueListExpr* list = new InitValueListExpr(se);
                        stk.top()->addExpr(list);
                        stk.push(list);
                    }else{
                        stk.top()->addExpr($1);
                        while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            stk.pop();
                        }
                        break;
                    }
                }
        }
        
    }
    //wjc arr
    | LBRACE RBRACE {
        SymbolEntry* se;
        ExprNode* list;
        if(stk.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::intType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitValueListExpr(se);
        }else{
            Type* type = ((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType();
            int len = type->getSize() / TypeSystem::intType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitValueListExpr(se);
            stk.top()->addExpr(list);
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        }
        $$ = list;
    }
    | LBRACE {
        SymbolEntry* se;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getElementType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getElementType());
        }
        InitValueListExpr* expr = new InitValueListExpr(se);
        if(!stk.empty())
            stk.top()->addExpr(expr);
        stk.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
    } 
      InitValList RBRACE {
        leftCnt--;
        while(stk.top() != $<exprtype>2 && stk.size() > (long unsigned int)(leftCnt + 1))
            stk.pop();
        if(stk.top() == $<exprtype>2)
            stk.pop();
        $$ = $<exprtype>2;
        if(!stk.empty())
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        int size = ((ArrayType*)($$->getSymbolEntry()->getType()))->getSize()/ TypeSystem::intType->getSize();
        while(idx % size != 0)
            arrayValue[idx++] = 0;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
    
    }
    ;

/* 必须有赋值 */
ConstDef
    : ID ASSIGN ConstInitVal {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();//ffclab6
        if(!identifiers->install($1, se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        /* */
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    //wjc arr
    | ID ArrayIndices ASSIGN  {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = $2;
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getnext());
        }
        Type* type = TypeSystem::constIntType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it, true);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        std::stack<InitValueListExpr*>().swap(stk);
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        // m7
        ((IdentifierSymbolEntry*)se)->setConst();
        $<se>$ = se;
        arrayValue = new int[arrayType->getSize()];
    }
      ConstInitVal {
        ((IdentifierSymbolEntry*)$<se>4)->setArrayValue(arrayValue);
        if(!identifiers->install($1, $<se>4))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        identifiers->install($1, $<se>4);
        $$ = new DeclStmt(new Id($<se>4), $5);
        delete []$1;
    }
    ;

ConstInitVal
    : ConstExp {
        if(!$1->getSymPtr()->getType()->isInt())
        {
            fprintf(stderr,
                "cannot initialize a const of type \'int\' with an rvalue "
                "of type \'%s\'\n",
                $1->getSymPtr()->getType()->toStr().c_str());
        }
        $$ = $1;
        //wjc arr
        if(!stk.empty()){
            arrayValue[idx++] = $1->getValue();
            Type* arrTy = stk.top()->getSymbolEntry()->getType();
            if(arrTy == TypeSystem::constIntType)
                stk.top()->addExpr($1);
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getElementType() != TypeSystem::constIntType){
                        arrTy = ((ArrayType*)arrTy)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitValueListExpr* list = new InitValueListExpr(se);
                        stk.top()->addExpr(list);
                        stk.push(list);
                    }else{
                        stk.top()->addExpr($1);
                        while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            stk.pop();
                        }
                        break;
                    }
                }
        }
    }
    //wjc arr
    | LBRACE RBRACE {
        SymbolEntry* se;
        ExprNode* list;
        if(stk.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空
            // 此时也没必要再加入栈了
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::constIntType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitValueListExpr(se);
        }else{
            // 栈不空说明肯定不是只有{}
            // 此时需要确定{}到底占了几个元素
            Type* type = ((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType();
            int len = type->getSize() / TypeSystem::constIntType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitValueListExpr(se);
            stk.top()->addExpr(list);
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        }
        $$ = list;
    }
    | LBRACE {
        SymbolEntry* se;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getElementType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getElementType());
        }
        InitValueListExpr* expr = new InitValueListExpr(se);
        if(!stk.empty())
            stk.top()->addExpr(expr);
        stk.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
    } 
      ConstInitValList RBRACE {
        leftCnt--;
        while(stk.top() != $<exprtype>2 && stk.size() > (long unsigned int)(leftCnt + 1))
            stk.pop();
        if(stk.top() == $<exprtype>2)
            stk.pop();
        $$ = $<exprtype>2;
        if(!stk.empty())
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        while(idx % (((ArrayType*)($$->getSymbolEntry()->getType()))->getSize()/ sizeof(int)) !=0 )
            arrayValue[idx++] = 0;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
    } 
    ;

//wjc arr
InitValList
    : InitVal {
        $$ = $1;
    }
    | InitValList COMMA InitVal {
        $$ = $1;
    }
    ;
ConstInitValList
    : ConstInitVal {
        $$ = $1;
    }
    | ConstInitValList COMMA ConstInitVal {
        $$ = $1;
    }
    ;

FuncDef
    :
    Type ID {
        identifiers = new SymbolTable(identifiers);
        fprintf(stderr, "函数总该有吧\n");
        paramNo = 0;//ffclab6
    }
    LPAREN FUNCPARAMS RPAREN
    {
        Type* funcType;
        std::vector<Type*> paramType;
        std::vector<SymbolEntry*> params;
        DeclStmt* temp = (DeclStmt*)$5;
        while(temp){
            paramType.push_back(temp->getId()->getSymPtr()->getType());
            params.push_back(temp->getId()->getSymPtr());
            temp = (DeclStmt*)(temp->getnext());
        }
        funcType = new FunctionType($1, paramType,params);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, $2, identifiers->getPrev()->getLevel());
        // identifiers->getPrev()->install($2, se);
        // 检验函数重定义
         if(!identifiers->getPrev()->install($2, se)){
            fprintf(stderr, "redefinition of \'%s %s\'\n", $2, se->getType()->toStr().c_str());
        }
        $<se>$ = se; 
    }
    BlockStmt
    {
        FunctionDef *f = new FunctionDef($<se>7, (DeclStmt*)$5, $8);
        fprintf(stderr, "是你是你1\n");
        f->setRet(ret);
        fprintf(stderr, "是你是你2\n");
        $$=f;
        ret=nullptr;
        SymbolTable* top = identifiers;
        fprintf(stderr, "是你是你3\n");
        identifiers = identifiers->getPrev();
        fprintf(stderr, "是你是你4\n");
        delete top;
        fprintf(stderr, "是你是你5\n");
        delete []$2;
        fprintf(stderr, "是你是你6\n");
    }
    ;

/* 函数参数->要么有，可以有多个，要么为空 */
FUNCPARAMS
    : PARAMS {$$=$1;}
    | %empty {$$=nullptr;}
    ;

/* 递归形式 */
PARAMS
    : PARAMS COMMA PARAM {
        $$=$1;
        $$->setnext($3);
    }
    | PARAM {
        $$=$1;
    }
    ;

/* 作为函数参数的int a */
PARAM
    : Type ID {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel(),paramNo++);//ffclab6
        identifiers->install($2, se);
        /* 返回的是DeclStmt类型的节点 */
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    //wjc arr
    //int a[n]
    | Type ID FuncArrayIndices {
        SymbolEntry* se;
        ExprNode* temp = $3;
        Type* arr = TypeSystem::intType;
        Type* arr1;
        std::stack<ExprNode*> stk;
        while(temp){
            stk.push(temp);
            temp = (ExprNode*)(temp->getnext());
        }
        while(!stk.empty()){
            arr1 = new ArrayType(arr, stk.top()->getValue());
            if(arr->isArray())
                ((ArrayType*)arr)->setArrayType(arr1);
            arr = arr1;
            stk.pop();
        }
        se = new IdentifierSymbolEntry(arr, $2, identifiers->getLevel(), paramNo++);// lab6arr
        identifiers->install($2, se);
        // end
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    ;

//wjc arr
FuncArrayIndices 
    : LSBRAC RSBRAC {
        $$ = new ExprNode(nullptr);
    }
    | FuncArrayIndices LSBRAC Exp RSBRAC {
        $$ = $1;
        $$->setnext($3);
    }
    ;

/* expr; */
ExprStmt
    :
    Exp SEMICOLON{
        $$=new ExprStmt($1);
    }
    ;

/* while(cond)stmt */
WhileStmt
    :
    WHILE LPAREN Cond RPAREN{
        WhileStmt *whileNode = new WhileStmt($3);
        $<stmttype>$ = whileNode;
        whileStack.push(whileNode);
    } Stmt{
        //获取上一个规则定义的whilenode对象
        StmtNode *whileNode = $<stmttype>5; 
        ((WhileStmt*)whileNode)->setStmt($6);
        $$=whileNode;
        whileStack.pop();
    }
    ;

/* for */


/* break */
BreakStmt
    :
    BREAK SEMICOLON{
        if(whileStack.empty())
        {
            fprintf(stderr, "\'break\' statement is not in while statement, so run failed.\n");
        }
        //取出栈顶的while，也就是匹配break的while
        $$ = new BreakStmt(whileStack.top());
    }
    ;

/* continue */
ContinueStmt
    :
    CONTINUE SEMICOLON{
        if(whileStack.empty())
        {
            fprintf(stderr, "\'continue\' statement is not in while statement, so run failed.\n");
        }
        $$ = new ContinueStmt(whileStack.top());
    }
    ;
%%

int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
