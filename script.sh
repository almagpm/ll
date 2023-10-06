#!/bin/bash
clear
echo "<Inicio>"

flex lexer.l        # Genera lex.yy.c a partir de lexer.l
bison -dv parse.y  # Genera parser.tab.c y parser.tab.h a partir de parser.y
gcc -o main parse.tab.c lex.yy.c -lfl   # Compila el programa principal
./main < prueba.txt  # Ejecuta el programa principal con entrada desde prueba.txt
