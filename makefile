main:
	bison -d len.y
	flex len.l
	gcc len.tab.c lex.yy.c -ll -o len 
	
clean:
	rm len.tab.c lex.yy.c len.tab.h 
