flex lcompiler.l
bison -d scompiler.y
gcc lex.yy.c scompiler.tab.c -lfl -o aplicacion.exe
