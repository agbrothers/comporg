All: multiply fibonacci
LIB=libFunctions.o
CC=gcc

multiply: multiply.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

fibonacci: fibonacci.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
