## 
## LIBRARY OF FUNCTIONS FOR HW9
##

## START FUNCTION isCharLogical
.text
.global isCharLogical

isCharLogical:

	## ARGUMENTS:
	## r0 ~ int char
	##
	## RETURNS: 
	## r0 ~ bool valid
	##
	## FUNCTION:
	## Return True if input is a valid ascii char
	## else false
	##
	## NOTE: 
	## This implementation relies on logical operators AND, OR

	## IF r0 GREATER THAN MIN UPPERCASE CHAR VALUE
	MOV r2, #0
	CMP r0, #0x41
	ADDGE r2, #1   

	## IF r0 LESS THAN MAX UPPERCASE CHAR VALUE
	MOV r3, #0
	CMP r0, #0x5A
	ADDLT r3, #1

	## CHECK IF INPUT IS UPPERCASE
	AND r2, r2, r3

	## IF r0 GREATER THAN MIN LOWERCASE CHAR VALUE
	MOV r3, #0
	CMP r0, #0x61
	ADDGE r3, #1

	## IF r0 LESS THAN MAX LOWERCASE CHAR VALUE
	MOV r4, #0
	CMP r0, #0x7A
	ADDLT r0, #1

	## CHECK IF INPUT IS LOWERCASE
	AND r3, r3, r4

	## CHECK IF INPUT IS CHAR
	ORR r0, r2, r3	

.data
## END isCharLogical



## START FUNCTION isChar
.text
.global isChar

isChar:

	## ARGUMENTS:
	## r0 ~ int char
	##
	## RETURNS: 
	## r0 ~ bool valid
	##
	## FUNCTION:
	## Return True if input is a valid ascii char
	## else false
	##
	## NOTE: 
	## This implementation relies on logical operators AND, OR

	## PUSH STACK
	SUB sp, sp, #4
    STR lr, [sp]

    ## MOVE R0
    MOV r5, r0
	
    ## RETURN FALSE BY DEFAULT
    MOV r0, #0

    ## IF GREATER THAN MIN UPPERCASE CHAR VALUE
    CMP r5, #0x41
    BGE upperMin
	## False condition
        B EndUpperMin
    upperMin:
	## IF r0 LESS THAN MAX UPPERCASE CHAR VALUE
        CMP r5, #0x51
	    BLT upperMax
	    ## False condition
	    	B EndUpperMax
	    upperMax: 
	    	## RETURN TRUE
	    	MOV r0, #1
	    EndUpperMax:
    EndUpperMin:

	## IF GREATER THAN MIN LOWERCASE CHAR VALUE
    CMP r5, #0x61
    BGE lowerMin
	## False condition
        B EndLowerMin
    lowerMin:
	## IF r0 LESS THAN MAX LOWERCASE CHAR VALUE
        CMP r5, #0x7A
	    BLT lowerMax
	    ## False condition
	    	B EndLowerMax
	    lowerMax: 
	    	## RETURN TRUE
	    	MOV r0, #1
	    EndLowerMax:
    EndLowerMin:


    ## POP STACK
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr


.data
## END isChar



## START FUNCTION findMaxOf3
.text
.global findMaxOf3

findMaxOf3:

	## ARGUMENTS:
	## r0 ~ int val1
	## r1 ~ int val2
	## r2 ~ int val3
	##
	## RETURNS: 
	## r0 ~ int maxVal
	##
	## FUNCTION:
	## Return the argument with the highest value. 
	## In the case of a tie, return the first 
	## argument with the max value.
	##
	## VARIABLS 
	## r4 temp storage
	## r5 ~ r0 >= r1
	## r6 ~ r1 >= r2
	## r7 ~ r2 >  r0
	## NOTE: RETURN r0 BY DEFAULT, ONLY NEED TO CHECK r1 and r2

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
## END findMaxOf3



## START FUNCTION grade
.text
.global grade
grade:

    ## CONVERT INTEGER GRADE TO LETTER
    ## 
    ## ARGUMENTS:
    ## r0 ~ int grade
    ## 
    ## RETURNS: 
    ## r0 ~ asciz letter grade

    ## PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]

    ## MOVE ARGUMENTS TO SAFE REGISTER
    MOV r5, r0

    ## RETURN ERROR BY DEFAULT
    LDR r0, =error
     

    ## CHECK IF A
    CMP r5, #100
    BLE gradeA
	## False condition
        B EndA
    gradeA:
        LDR r0, =A
    EndA:

    ## CHECK IF B
    CMP r5, #89
    BLE gradeB
	## False condition
        B EndB
    gradeB:
        LDR r0, =B
    EndB:

    ## CHECK IF C
    CMP r5, #79
    BLE gradeC
	## False condition
        B EndC
    gradeC:
        LDR r0, =C
    EndC:

    ## CHECK IF F
    CMP r5, #69
    BLE gradeF
	## False condition
        B EndF
    gradeF:
        LDR r0, =F
    EndF:

    ## CHECK IF VALID GRADE
    CMP r5, #0
    BLT gradeError
	## False condition
        B EndError
    gradeError:
        LDR r0, =error
    EndError:

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr


.data
    error: .asciz "\nGrade must be between [0-100]\n"
    A:     .asciz "\nThe average grade is A\n"
    B:     .asciz "\nThe average grade is B\n"
    C:     .asciz "\nThe average grade is C\n"
    F:     .asciz "\nThe average grade is F\n"

## END grade


