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


	## r5 ~ r0 is greater
	## r6 ~ r1 is greater
	## r7 ~ r2 is greater


	## RETURN r0 BY DEFAULT, ONLY NEED TO CHECK r1 and r2

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
	AND r4, r5, #1
	AND r4, r4, r6
	CMP r4, #1
	BEQ maxR1
	    ## False condition
	maxR1: 
	    MOV r0, r1

	## CHECK IF r2 IS MAX
	AND r4, r6, #1
	AND r4, r4, r7
	CMP r4, #1
	BEQ maxR2
	    ## False Condition
	maxR2: 
	    MOV r0, r2

.data
## END findMaxOf3



