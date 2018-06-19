%{

	#include<stdio.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <math.h>
	#include "gram.tab.c"
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
%token<num> VAR_KEYWORD

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
| exp PRINT {}
;

function: NUMBER { $$ = $1; }
| NAME {$$ = variable_values[$1]; }
| TO function ADD NODE {variable_values[$1].add_node();}
| TO function ADD EDGE NUMBER SPACE NUMBER SPACE NUMBER {variable_values[$1].add_edge($5, $7, $9);}
| TO function VERIFY EDGE NUMBER SPACE NUMBER {variable_values[$1].verify_edge($5, $7);}
| TO function VERIFY PATH NUMBER SPACE NUMBER {variable_values[$1].verify_path($5, $7);}
| TO function REMOVE EDGE NUMBER SPACE NUMBER {variable_values[$1].remove_edge($5, $7);}
| TO function REMOVE NODE NUMBER {variable_values[$1].remove_node($5);}
| TO function CHANGE NUMBER SPACE NUMBER SPACE NUMBER {variable_values[$1].change_weight($4, $6, $8);}
;


%%

int main() {
	yyparse();
}
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}








