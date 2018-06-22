%{
    #include "len.tab.h"
    #include "mem.h"
%}

%%
"("                             { return LBR; }
")"                             { return RBR; }
"Sea"                           { return LET; }
"igual"                         { return EQ; }
"mas"                           { return ADD; }
"equivale"                      { return EQUIV; }
"imprimir"                      { return PRINT; }
"INICIO"                        { return BGNP; }
"FIN"                           { return ENDP; }
"Si"                            { return IF; }
"entonces"                      { return THEN; }
"Mientras"                      { return WHILE; }
[0-9]+                          { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z][A-Za-z0-9_]*           { yylval.index = add_var(yytext); return NAME; }
[a-zA-Z_]?\"(\\.|[^\\"\n])*\"   { yylval.str = strdup(yytext); return STRING;}
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }
%%
