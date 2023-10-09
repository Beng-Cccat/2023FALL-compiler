%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>


int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);

struct SymbolEntry {
    char name[10];
    double data;
};

void insertSymbol(const char* name, double data);
int findSymbol(const char* name);

struct SymbolEntry symbolTable[10];
int symbolTableSize = 0;

%}

%token LPA RPA
%token MUL DIV
%token<DOUBLE> NUMBER
%token ADD MINUS
%token<STRING> IDENT
%token EQUALTO

%left ADD MINUS
%left MUL DIV
%right UMINUS


%union
{
	double DOUBLE;
	char * STRING;
}

%type <DOUBLE> expr

%%

lines   :       lines state '\n'
        |       lines '\n'
        |
        ;

state	:	IDENT EQUALTO expr  {insertSymbol($1, $3); }
	|	expr	{ printf("%f\n", $1);  }
	;
	
expr    :	expr ADD expr   { $$ = $1 + $3; }
        |       expr MINUS expr   { $$ = $1 - $3; }
        |       expr MUL expr   { $$ = $1 * $3; }
        |       expr DIV expr   { $$ = $1 / $3; }
        |       LPA expr RPA     { $$ = $2; }
        |       MINUS expr %prec UMINUS   { $$ = -$2; }
        |       IDENT { int index = findSymbol($1); if (index != -1) $$ = symbolTable[index].data; else $$=0;}
        |       NUMBER { $$ = $1; }
        ;

%%



void insertSymbol(const char* name, double data) {
    if (symbolTableSize < 10) {
        struct SymbolEntry entry;
        strncpy(entry.name, name, sizeof(entry.name));
        entry.data = data;
        symbolTable[symbolTableSize++] = entry;
    } else {
        printf("符号表已满，无法插入新的标识符。\n");
    }
}

int findSymbol(const char* name) {
    for (int i = 0; i < symbolTableSize; i++) {
        if (strcmp(symbolTable[i].name, name) == 0) {
            return i;
        }
    }
    return -1;
}

int isdigit(int a) {
    if (a >= '0' && a <= '9') {
        return 1;
    }
    return 0;
}

int isalpha(int a) {
    if ((a >= 'a' && a <= 'z') || (a >= 'A' && a <= 'Z')) {
        return 1;
    }
    return 0;
}

int yylex() {
    int t;
    while (1) {
        t = getchar();
        if (t == ' ' || t == '\t') {
            // do nothing
        } else if (isdigit(t)) {
            int value = t - '0';
            while ((t = getchar()) != EOF && isdigit(t)) {
                value = value * 10 + (t - '0');
            }
            ungetc(t, stdin);
            yylval.DOUBLE= value;
            return NUMBER; 
        } else if (t == '+') {
            return ADD;
        } else if (t == '-') {
            return MINUS;
        } else if (t == '*') {
            return MUL;
        } else if (t == '/') {
            return DIV;
        } else if (t == '(') {
            return LPA;
        } else if (t == ')') {
            return RPA;
        } else if (isalpha(t)) {
            char ident_name[10];
            int i = 0;
            ident_name[i++] = t;
            while ((t = getchar()) && (isalpha(t) || isdigit(t)) && i < 9) {
                ident_name[i++] = t;
            }
            ident_name[i] = '\0';
            ungetc(t, stdin);
            yylval.STRING = strdup(ident_name); 
            return IDENT;
        } else if (t == '=') {
            return EQUALTO;
        } else {
            return t;
        }
    }
}

int main(void) {
    yyin = stdin;
    do {
        yyparse();
    } while (!feof(yyin));
    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}

