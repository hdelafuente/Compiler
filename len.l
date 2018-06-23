%{
    #include "len.tab.h"
    #include "mem.h"
    int line_num = 0;
%}

%%
"("                             { return LBR; }
")"                             { return RBR; }
"Let"                           { return LET; }
"equal"                         { return EQUIV; }
"+"                           	{ return ADD; }
"*"                      	{ return MUTL; }
"**" 				{ return POW; } 
":"				{return DIV;}
"-"				{ return LES; }
"Left"				{return LEFT;}
"Right"				{return RIGHT;}
"Print"		                { return PRINT; }
"INICIO"                        { return BGNP; }
"FIN"                           { return ENDP; }
[0-9]+                          { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z][A-Za-z0-9_]*           { yylval.index = add_var(yytext); return NAME; }
[a-zA-Z_]?\"(\\.|[^\\"\n])*\"   { yylval.str = strdup(yytext); return STRING;}
\n      { line_num++; return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }
%%
int add_var(char* var_name)
{
    int x; // Index var
    
    /* Search for the variable and return its index if found */
    for (x = 0; x<var_counter; x++) {
        if (strcmp(var_name, var_names[x]) == 0) {
            return x;
        }
    }
    
    /* Variable not found yet. */
    /* Define it and add it to the end of the array. */
    var_counter++;
    var_names[x] = strdup(var_name);
    return x;
}
