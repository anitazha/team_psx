all: main
	
CC = ccpsx -G 0 -Xo$80080000 -O3

main: main.obj
	$(CC) main.obj -omain.cpe,main.sym

main.obj: 
	$(CC) -c main.c
	dmpsx main.obj

load:
	pqbload sample.tmd 80100000
	pqbload sample1.tim 80120000
	pqbload sample2.tim 80140000

