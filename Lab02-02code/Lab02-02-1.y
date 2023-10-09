%{
/*********************************************
YACC file
基础程序
Date:2023/9/19
forked SherryXiye
**********************************************/
#include<stdio.h>
#include<stdlib.h>
#ifndef YYSTYPE
#define YYSTYPE double
#endif
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}
//NUMBER [1-9]+[0-9]*|0
//注意先后定义的优先级区别，越靠下优先级越高
%token LPA RPA
%token MUL DIV
%token NUMBER
%token ADD MINUS

%left ADD MINUS
%left MUL DIV
%right UMINUS     
    
%%


lines   :       lines expr '\n' { printf("%f\n", $2); }
        |       lines '\n'
        |
        ;

expr    :       expr ADD expr   { $$=$1+$3; }
        |       expr MINUS expr   { $$=$1-$3; }
        |       expr MUL expr   { $$=$1*$3; }
        |       expr DIV expr   { $$=$1/$3; }
        |       LPA expr RPA     { $$=$2;}
        |       MINUS expr %prec UMINUS   {$$=-$2;}
        |       NUMBER {$$=$1;}
        ;

%%

// programs section

int isdigit(int a){
	if(a<='9' && a>='0')
		return 1;
	return 0;
}

int yylex()
{
    int t;
    while(1){
        t=getchar();
        if(t==' '||t=='\t'){
            //do noting
        }else if(isdigit(t)){
            //TODO:解析多位数字返回数字类型 
            int value = t - '0';
            while ((t = getchar()) != EOF && isdigit(t)) {
                value = value * 10 + (t - '0');
            }
            ungetc(t, stdin); // Push back the non-digit character
            yylval = value;   // Store the numeric value
            //yylval 是在词法分析器（lexer）和语法分析器（parser）之间传递词法值的一个特殊变量
            return NUMBER;
        }else if(t=='+'){
            	return ADD;
        }else if(t=='-'){
            	return MINUS;
        }//TODO:识别其他符号
        else if(t=='*'){
        	return MUL;
        }else if(t=='/'){
        	return DIV;
        }else if(t=='('){
        	return LPA;
        }else if(t==')'){
        	return RPA;
        }
        else{
            return t;
        }
    }
}

int main(void)
{
    yyin=stdin;
    do{
        yyparse();
    }while(!feof(yyin));
    return 0;
}
void yyerror(const char* s){
    fprintf(stderr,"Parse error: %s\n",s);
    exit(1);
}
