## 
## LIBRARY OF FUNCTIONS FOR HW10
##

## START FUNCTION primes
.text
.global primes

primes:

    ## ARGUMENTS:
    ## r0 ~ int n
    ##
    ## RETURNS: 
    ## None
    ##
    ## FUNCTION:
    ## Loop from 3 to n and print out all primes
    ##
    ## VARIABLES 
    ## r4 ~ int n
    ## r5 ~ int i/2 + 1
    ## r6 ~ int outer counter i
    ## r7 ~ int inner counter j
    ## r8 ~ bool is_prime
    ## r9 ~ i mod j

    ## PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]

    ## INITIALIZE VARIABLES
    MOV r4, r0
    MOV r6, #4
    MOV r7, #2
    
    ## PRINT 3 BY DEFAULT
    LDR r0, =three
    BL printf

    ## OUTER LOOP 
    ## ------------------->
    startOuterLoop:

        ## CHECK OUTER LOOP END CONDITION
        CMP r6, r4
        BGT endOuterLoop

        ## SET IS_PRIME BOOL
        MOV r8, #1

	## SET INNER LOOP ITERATION COUNT
	MOV r0, r6
	MOV r1, #2
	BL __aeabi_idiv
	ADD r5, r0, #1

        ## INNER LOOP
        ## ------------------->
        startInnerLoop:

            ## CHECK INNER LOOP END CONDITION
            CMP r7, r5
            BGT endInnerLoop

            ## COMPUTE MODULUS OF i (r6) and j (r7)
	    MOV r0, r6
	    MOV r1, r7
	    BL __aeabi_idiv
	    MUL r10, r0, r7
	    SUB r9, r6, r10

            ## CHECK IF i IS DIVISIBLE BY j (mod == 0)
            CMP r9, #0
            BEQ notPrime
                B endNotPrime
            notPrime:
                MOV r8, #0
                B endInnerLoop
            endNotPrime:

            ## NEXT INNER ITERATION
            ADD r7, r7, #1
            B startInnerLoop

        ## <-------------------
        endInnerLoop:
	    MOV r7, #2

        ## PRINT IF PRIME
        CMP r8, #1
        BEQ printPrime
            B endPrint
        printPrime:
            LDR r0, =prime
            MOV r1, r6
            BL printf        
        endPrint:


        ## NEXT OUTER ITERATION
        ADD r6, r6, #1
        B startOuterLoop

    ## <-------------------
    endOuterLoop:

    ## ADD NEWLINE TO END
    LDR r0, =end
    BL printf

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    three:   .asciz "\n3"
    prime:   .asciz ", %d"
    end:     .asciz "\n\n"

## END primes


## START FUNCTION guess
.text
.global guess
guess:

	## ARGUMENTS:
	## r0 ~ int max
	##
	## RETURNS: 
	## r0 ~ int num guesses
	##
	## FUNCTION:
	## Randomly generate int between 1 and max and
	## prompt user input via a loop until they guess
	## the correct answer. Print hints (higher/lower)
	## for incorrect guesses and return the number of 
	## guesses total.
	##
	## VARIABLES 
	## r1 ~ int current guess
	## r4 ~ int max
	## r5 ~ int num guesses 
	## r6 ~ int answer

	## PUSH STACK
	SUB sp, sp, #4
	STR lr, [sp]

        ## INITIALIZE VARIABLES
	MOV r4, r0
        MOV r5, #1

	## GENERATE RANDOM NUMBER BY TAKING MODULUS OF PROMPT MEM ADDRESS
	LDR r0, =prompt
	MOV r1, r4
	BL __aeabi_idiv
	MUL r0, r0, r4
	LDR r1, =prompt
	SUB r6, r1, r0
	ADD r6, r6, #1
     
	## LOOP 
	startGuessLoop:
	
	    ## PROMPT USER FOR INPUT
	    LDR r0, =prompt
	    BL printf
	    
	    ## READ IN INPUT
	    LDR r0, =formatString
	    LDR r1, =current
	    BL scanf
	    LDR r1, =current
	    LDR r1, [r1]

	    ## CHECK LOOP ENDING CONDITION (Guess == Answer)
	    CMP r1, r6
	    BEQ endGuessLoop

	    ## CHECK IF INPUT IS HIGHER THAN ANSWER
            CMP r1, r6
            BGT ifHigher
		B endHigher
	    ifHigher:
	        LDR r0, =lower
	    endHigher:

	    ## CHECK IF INPUT IS LOWER THAN ANSWER
	    CMP r1, r6
	    BLT ifLower
	        B endLower
	    ifLower:
		LDR r0, =higher
	    endLower:

	    ## PRINT HINT
	    BL printf

	    ## NEXT ITERATION
	    ADD r5, r5, #1
            B startGuessLoop

	endGuessLoop:
	    LDR r0, =success
	    MOV r1, r5
            BL printf

        ## POP STACK AND RETURN
        LDR lr, [sp]
        ADD sp, sp, #4
        MOV pc, lr

.data
        prompt:  .asciz "\nGuess an int: "
        lower:   .asciz "\nThe number is lower than %d"
        higher:  .asciz "\nThe number is higher than %d"
        success: .asciz "\nCorrect! That took %d guesses\n"
        current: .word 0
	formatString: .asciz "%d" 

## END guess


