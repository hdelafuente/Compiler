%{
#include "mem.h"
#include "grafo.h"
%}

%%

"NEW" {return LET;}
"(" { return LBR; }
")" { return RBR; }
"=" { return EQ; }
"ADD" { return ADD; }
"REMOVE" { return RM; }
"CHANGE" { return CHNG; }
"INICIO" { return BGNP; }
"FIN" { return ENDP; }


\n { return EOL; }
[ \t]   { /*ignore whitespaces*/ }
%%
