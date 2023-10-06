%{
#include "parse.tab.h"
%}

%%

"if"    return IF;
"else"  return ELSE;
[a-zA-Z]+    return ID;
[0-9]+   return NUM;
\n   return NEWLINE;
.    return *yytext;
<<EOF>> return 0;

%%
