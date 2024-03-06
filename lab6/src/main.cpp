#include <iostream>
#include <string.h>
#include <unistd.h>
#include "common.h"
#include "Ast.h"
#include "Unit.h"
#include "MachineCode.h"
#include "LinearScan.h"

extern FILE *yyin;
extern FILE *yyout;
int yyparse();

Ast ast;
Unit unit;
MachineUnit mUnit;
char outfile[256] = "a.out";
dump_type_t dump_type = ASM;

int main(int argc, char *argv[])
{
    int opt;
    while ((opt = getopt(argc, argv, "Siato:")) != -1)
    {
        switch (opt)
        {
        case 'o':
            strcpy(outfile, optarg);
            break;
        case 'a':
            dump_type = AST;
            break;
        case 't':
            dump_type = TOKENS;
            break;
        case 'i':
            dump_type = IR;
            break;
        case 'S':
            dump_type = ASM;
            break;
        default:
            fprintf(stderr, "Usage: %s [-o outfile] infile\n", argv[0]);
            exit(EXIT_FAILURE);
            break;
        }
    }
    if (optind >= argc)
    {
        fprintf(stderr, "no input file\n");
        exit(EXIT_FAILURE);
    }
    if (!(yyin = fopen(argv[optind], "r")))
    {
        fprintf(stderr, "%s: No such file or directory\nno input file\n", argv[optind]);
        exit(EXIT_FAILURE);
    }
    if (!(yyout = fopen(outfile, "w")))
    {
        fprintf(stderr, "%s: fail to open output file\n", outfile);
        exit(EXIT_FAILURE);
    }
    yyparse();
    if (dump_type == AST)
        ast.output();
    ast.typeCheck();
    ast.genCode(&unit);
    fprintf(stderr, "111111111没问题？\n");
    if (dump_type == IR)
    {
        unit.output();
        fprintf(stderr, "222222222没问题？\n");
    }
    unit.genMachineCode(&mUnit);
    fprintf(stderr, "3333333333没问题？\n");
    LinearScan linearScan(&mUnit);
    fprintf(stderr, "4444444444没问题？\n");
    linearScan.allocateRegisters();
    fprintf(stderr, "5555555555没问题？\n");
    if (dump_type == ASM)
    {
        mUnit.output();
        fprintf(stderr, "66666666666没问题？\n");
    }
    return 0;
}
