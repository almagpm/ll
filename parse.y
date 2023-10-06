%{
#include <stdio.h>
extern int yylex(void);
void yyerror(const char *s);
extern int yylineno;
extern char *yytext;
%}

%name parse
%token IF ELSE ID NUM NEWLINE

%%

program:
    /* El programa puede estar vacío */
    | program stmt
    ;

stmt:
    IF expr NEWLINE stmt ELSE NEWLINE stmt
    | ID '=' NUM NEWLINE
    ;

expr:
    ID '>' NUM
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s at line %d, token: %s\n", s, yylineno, yytext);
}
