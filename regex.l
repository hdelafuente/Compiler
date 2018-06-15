%{
#include "mem.h"
#include "grafo.h"
%}

%%

"NEW" {return LET;}
" " { return SPACE; }
"START" { return BGNP; }
"END" { return ENDP; }

[A-Za-z][A-Za-z0-9_]*  { yylval.index = add_variable(yytext); return NAME; }

"add" {return ADD;}
"remove" {return RM;}
"change" { return CHANGE;}
"verify" {return VERIFY;}
"PRINT" {return PRINT;}
"node" {return NODE; }
"edge" {return EDGE; }
"To" {return TO; }
"\n" { return EOL; }

%%
