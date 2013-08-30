# ----------------------------------------------------------------------------
# 
# 						2D ¸Þ×Ì¨¸½»ÝÌßÙ: MAKEFILE.MAK
# 
# 				Copyright (C) 1995 Sony Computer Entertainment Inc.
# 							   All Rights Reserved
# ----------------------------------------------------------------------------

CC			= ccpsx
CFLAGS		= -c -O4 -comments-c++
LINK		= ccpsx
LFLAGS		= -Xo$80010000

HEADS		= orghead.h
SOURCEC		= main.c func.c foe.c bg.c base.c debug.c
SOURCEOBJ	= main.obj func.obj foe.obj bg.obj base.obj debug.obj

main.cpe:	$(SOURCEOBJ) makefile.mak
		$(LINK) $(LFLAGS) $(SOURCEOBJ) -omain.cpe,main.sym,main.map

main.obj:	main.c $(HEADS) makefile.mak
		$(CC) $(CFLAGS) main.c -omain.obj

base.obj:	base.c $(HEADS) makefile.mak
		$(CC) $(CFLAGS) base.c -obase.obj

foe.obj:	foe.c $(HEADS) makefile.mak
		$(CC) $(CFLAGS) foe.c -ofoe.obj

bg.obj:		bg.c $(HEADS) makefile.mak
		$(CC) $(CFLAGS) bg.c -obg.obj

func.obj:	func.c $(HEADS) makefile.mak
		$(CC) $(CFLAGS) func.c -ofunc.obj

debug.obj:	debug.c $(HEADS) makefile.mak
		$(CC) $(CFLAGS) debug.c -odebug.obj

load:
		pqbload seminar.tim 80100000

clean:
		del *.obj
