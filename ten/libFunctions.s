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
	## r4 temp storage
	## r5 ~ r0 >= r1
	## r6 ~ r1 >= r2
	## r7 ~ r2 >  r0

	## PUSH STACK
	SUB sp, sp, #4
	STR lr, [sp]

	## r0 >= r1
	MOV r5, #0
	CMP r0, r1
	ADDGE r5, r5, #1

	## r1 >= r2
	MOV r6, #0
	CMP r1, r2
	ADDGE r6, r6, #1

	## r2 > r0
	MOV r7, #0
	CMP r2, r0
	ADDGT r7, r7, #1


	## CHECK IF r1 IS MAX
	EOR r4, r5, #1
	AND r4, r4, r6
	CMP r4, #1
	BEQ maxR1
	    ## False condition
	    B EndR1
	maxR1: 
	    MOV r0, r1
        EndR1:

	## CHECK IF r2 IS MAX
	EOR r4, r6, #1
	AND r4, r4, r7
	CMP r4, #1
	BEQ maxR2
	    ## False Condition
	    B EndR2
	maxR2: 
	    MOV r0, r2
	EndR2:

	## POP STACK
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
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
        MOV r5, #0
	MOV r6, r4
	LDR r0, =prompt
	LDR r1, =current
     
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
        lower:   .asciz "\nThe number is lower than %d\n"
        higher:  .asciz "\nThe number is higher than %d\n"
        success: .asciz "\nCorrect! That took %d guesses\n"
        current: .word 0
	formatString: .asciz "%d" 

## END guess


