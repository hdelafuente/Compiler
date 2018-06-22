%{
	#include <stdio.h>

	#include "mem.h"

	extern double var_values[100];
	extern int var_set[100];
	extern int line_num;
	int yylex();
	int yyparse();
	FILE *yyin;
	int yylex();
	void yyerror(const char *s);

%}

%union{
    int index;
    double num;
    char *str;
}


%token NUMBER NAME STRING
%token<num> EQ
%token<num> ADD EQUIV LEQ GEQ LET
%token<num> IF THEN WHILE AND OR
%token<num> EOL
%token<num> BGNP ENDP PRINT

%type<num> NUMBER
%type<str> STRING
%type<index> NAME
%type<num> program
%type<num> line
%type<num> stmt
%type<num> exp
%type<num> while
%type<num> assign
%type<num> conditional
%type<num> function

%left ADD
%left OR
%left AND
%left LBR RBR

%%
final_program: BGNP program ENDP EOL

program: { printf("  "); }
| program line
;

line:
EOL
| stmt EOL
;

stmt: exp
| assign
| conditional
| while
| function
;

assign: LET NAME EQ exp { $$ = set_var($2, $4); }
;

exp: NUMBER { $$ = $1; }
| NAME { $$ = var_values[$1]; }
| exp ADD exp { $$ = $1 + $3; }
| exp EQUIV exp { $$ = $1 == $3; }
| exp LEQ exp { $$ = $1 < $3; }
| exp GEQ exp { $$ = $1 > $3; }
| LBR exp RBR { $$ = $2; }
;

conditional: IF exp THEN stmt { if($2){$$ = $4;} }
;

while: WHILE exp  THEN stmt { while($2) { $$ = $2;} }
;

function: PRINT exp { printf("%.2f\n",$2); }
| PRINT STRING {printf("%s\n",$2); }
;
%%
int main(int argc, char **argv)
{
	FILE *input = fopen("code.jr", "r" );
	if(input==NULL) {
		printf("File not found\n");
		return -1;
	}
	yyin = input;
	yylex();
	yyparse();

}
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s found  in line %d\n", s, line_num);
}
