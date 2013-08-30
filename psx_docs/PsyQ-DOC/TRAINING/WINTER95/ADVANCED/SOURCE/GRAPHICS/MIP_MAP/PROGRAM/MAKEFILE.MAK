OBJS     = tuto0.obj datg4_cm.o1

tuto0 :		$(OBJS) makefile.mak
	ccpsx -Xo$80010000 $(OBJS) -o tuto0.cpe,tuto0.sym

tuto0.obj :	tuto0.c
	ccpsx -c -G0 -O3 tuto0.c

datg4_cm.o1 :	datg4_cm.obj
	dmpsx datg4_cm.obj -o datg4_cm.o1

datg4_cm.obj :	datg4_cm.c
	ccpsx -c -G0 -O3 datg4_cm.c


load:
	pqbload earth8.tim 80100000
