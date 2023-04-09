All: primes guess
LIB=libFunctions.o
CC=gcc

primes: primes.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

guess: guess.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
