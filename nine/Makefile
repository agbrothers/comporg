All: checkChar grades max
LIB=libFunctions.o
CC=gcc

checkChar: checkChar.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

max: max.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

grades: grades.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
