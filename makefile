final_compile:
	bison -d grammar.y
	flex regex.l
	gcc gram.tab.c regex.yy.c -lm -o graph_excecute
	
clean:
	rm gram.tab.c lex.yy.c gram.tab.h
