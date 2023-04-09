All: KPH C2F IN2FT
LIB=libConversions.o
CC=gcc

KPH: KPH.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

C2F: C2F.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

IN2FT: IN2FT.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
