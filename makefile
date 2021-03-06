all: Parser Scanner BabyC
	gcc BabyC.tab.o lex.yy.o driver.o BabyC.o -o bcc

BabyC: BabyC.o driver.o

Scanner: BabyC.lex 
	flex BabyC.lex
	gcc -c lex.yy.c

Parser: BabyC.y  
	bison -d BabyC.y
	gcc -c BabyC.tab.c

%.o: %.c 
	gcc -c $<

clean:
	-rm -f *.o lex.yy.c *.tab.* bcc *.iloc

redo:
	-rm -f *.o lex.yy.c *.tab.* bcc *.iloc
	clear
	make
	./bcc test.bc