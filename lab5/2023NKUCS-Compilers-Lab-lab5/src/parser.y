%code top{
    #include <iostream>
    #include <assert.h>
    #include <stack>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror( char const * );
    std::stack<StmtNode*> whileStack;
    ReturnStmt *ret=nullptr;
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
%nterm <exprtype> Exp AddExp Cond LOrExp PrimaryExp LVal RelExp LAndExp MulExp EqExp UnaryExp FuncRParams InitVal ConstInitVal ConstExp
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
        fprintf(stderr, "Stmts\n");
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
    ;
AssignStmt
    :
    LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
BlockStmt
    :   LBRACE 
        {   fprintf(stderr, "要创建符号表了\n");
            identifiers = new SymbolTable(identifiers);} 
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
        fprintf(stderr, "cccccc这个总该进吧");
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
        $$ = new ReturnStmt($2);
        fprintf(stderr, "结束了？");
    }
    | RETURN SEMICOLON {
        $$ = new ReturnStmt();
        fprintf(stderr, "奇怪的结束点\n");
    }
    ;

BlankStmt
    : SEMICOLON {
        $$ = new BlankStmt();
    }
    ;

Exp
    :
    AddExp {$$ = $1;fprintf(stderr, "exp中的addexp\n");}
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
        fprintf(stderr, "这是lval\n");
    }
    | INTEGER {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        $$ = new Constant(se);
        fprintf(stderr, "创好了mo \"%d\"\n", $1);
    }
    | FLOAT {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, $1);
        $$ = new Constant(se);
    }
    ;

UnaryExp 
    : PrimaryExp {$$ = $1;fprintf(stderr, "unaryexp中的primaryexp\n");}
    | ID LPAREN FuncRParams RPAREN {
        SymbolEntry* se;
        //是这个lookup中找到的吗，他找到的没有参数？？
        //不会tm的是符号表吧，猜测：存函数的时候没有存参数（）
        //但是问题是这个玩意儿好像不是我存的
        //狗东西
        //所以是在l里面吧，putint那里
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        fprintf(stderr, "callexpr start!!\n");
        //调用了之后就直接插进list里面，但是没有参数，应该就是这个se出问题
        $$ = new CallExpr(se, $3);
        fprintf(stderr, "callexpr over!!\n");
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
    : UnaryExp {$$=$1;fprintf(stderr, "mulexp中的unaryexp\n");}
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
        fprintf(stderr, "addexp add mulexp\n");
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        fprintf(stderr, "addexp add mulexp————over1\n");
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
        fprintf(stderr, "addexp add mulexp————over2\n");
    }
    | AddExp SUB MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;
RelExp
    :
    AddExp {$$ = $1; fprintf(stderr, "recexp中的addexp\n");}
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
        fprintf(stderr,"!=\n");
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

/* a|a=1 */
VarDef
    :
    ID {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,$1, identifiers->getLevel(),false);
        if(se==nullptr){
            fprintf(stderr, "\"%s\"的符号表创建失败\n", (char*)$1);
            assert(se!=nullptr);
        }
        fprintf(stderr, "\"%s\"的符号表已创建\n", (char*)$1);
        identifiers->install($1, se);
        /* 没有expr，不用单独存 */
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ASSIGN InitVal {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,$1, identifiers->getLevel(),false);
        if(!identifiers->install($1, se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        $$ = new DeclStmt(new Id(se), $3);
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
        
    }
    
    ;

/* 必须有赋值 */
ConstDef
    : ID ASSIGN ConstInitVal {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel(),false);
        if(!identifiers->install($1, se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        /* */
        $$ = new DeclStmt(new Id(se), $3);
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
        
    }
    ;

FuncDef
    :
    Type ID {
        identifiers = new SymbolTable(identifiers);
        fprintf(stderr, "函数总该有吧\n");
    }
    LPAREN FUNCPARAMS RPAREN
    {
        fprintf(stderr, "dddddd!!!temp!!进0！\n");
        Type* funcType;
        std::vector<Type*> paramType;
        std::vector<SymbolEntry*> params;
        DeclStmt* temp = (DeclStmt*)$5;
        while(temp){
            fprintf(stderr, "dddddd!!!temp!!进1！\n");
            paramType.push_back(temp->getId()->getSymPtr()->getType());
            params.push_back(temp->getId()->getSymPtr());
            temp = (DeclStmt*)(temp->getnext());
        }
        funcType = new FunctionType($1, paramType,params);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, $2, identifiers->getPrev()->getLevel(),false);
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
    | %empty {
        fprintf(stderr,"这个是empty???\n");
        $$=nullptr;
    }
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
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel(),false);
        identifiers->install($2, se);
        /* 返回的是DeclStmt类型的节点 */
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    ;

/* expr; */
ExprStmt
    :
    Exp SEMICOLON{
        $$=new ExprStmt($1);
        fprintf(stderr, "exprstmt中的exp semicolon\n");
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
