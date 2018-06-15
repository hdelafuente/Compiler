%{

	#include<stdio.h>
	
	using namespace std;
    extern double variable_values[100];
    extern int variable_set[100];
    
    int yylex();
    void yyerror(const char *s);
    
%}

%union{
    int index;
    double num;
    char *str;
}

%token NAME
%token<num> BGNP ENDP PRINT
%token<num> LET
%token<num> ADD RM VERIFY

%type<num> NUMBER
%type<index> NAME
%type<num> NODE
%type<
//parametros del programa
%type<num> program
%type<num> line
%type<num> stmt
%type<num> exp

//asigancion y funciones del grafo
%type<num> assign
%type<num> function


%left TO
%left ADD
%left VERIFY
%left RM

%%
final_program: BGNP program ENDP EOL

program: {printf(" ");}
| program line
;

line:
EOL
| stmt EOL
;

stmt: exp
| assign
| function
;

assign: LET NAME NUMBER { $$ = set_variable($2, $4); }
| LET NAME { $$ = set_variable($2, 0); }

;

exp: NUMBER { $$ = $1; }
| NAME { $$ = variable_values[$1]; }
| exp PRINT {/*IMPRIMIR GRAFO*/}
;

function: NUMBER { $$ = $1; }
| NAME {$$ = variable_values[$1]; }
| TO function ADD type
| TO function VERIFY NUMBER SPACE NUMBER {/*VERIFICAR CAMINO*/}
| TO function REMOVE type
;

type: NODE NUMBER {/*agregar nodo*/]
| EDGE NUMBER SPACE NUMBER { /*agregar arco*/}
;

%%
int main() {
	yyparse();
}
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}








