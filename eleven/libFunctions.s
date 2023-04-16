## 
## LIBRARY OF FUNCTIONS FOR HW11
##

## START FUNCTION mult
.text
.global mult

mult:

    ## ARGUMENTS:
    ## r0 ~ int x
    ## r1 ~ int n
    ##
    ## RETURNS: 
    ## r0 ~x * n
    ##
    ## FUNCTION:
    ## Make recursive calls to sum x n times
    ##
    ## VARIABLES 
    ## r4 ~ int x

    ## PUSH STACK
    SUB sp, sp, #8
    STR lr, [sp]
    STR r4, [sp, #4]

    ## INITIALIZE VARIABLES
    MOV r4, r0
    

    ## BASE CASE 0
    CMP r1, #0
    BNE Else
	MOV r0, #0
	B ReturnMult
    Else:
        SUB r1, r1, #1
        BL mult
	ADD r0, r0, r4
	B ReturnMult
    EndIf:

    ## POP STACK AND RETURN
    ReturnMult:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8
    MOV pc, lr
    
.data

## END mult


## START FUNCTION fib
.text
.global fib
fib:

    ## ARGUMENTS:
    ## r0 ~ int n
    ##
    ## RETURNS: 
    ## r0 ~ nth fibonnaci number
    ##
    ## FUNCTION:
    ## fib(n) = fib(n-1) + fib(n-2)
    ##
    ## VARIABLES 
    ## r4 ~ n
    ## r5 ~ fib(n-1)

    ## PUSH STACK
    SUB sp, sp, #12
    STR lr, [sp]
    STR r4, [sp, #4]
    STR r5, [sp, #8]

    ## INITIALIZE VARIABLES
    MOV r4, r0

    ## BASE CASE 0
    CMP r0, #0
    BNE ElseZero
	MOV r0, #0
	B ReturnFib
    ElseZero:

    ## BASE CASE 1
    CMP r0, #1
    BNE ElseOne
	MOV r0, #1
	B ReturnFib
    ElseOne:

    ## RECURSIVE CASE
    SUB r0, r4, #1
    BL fib
    MOV r5, r0
    SUB r0, r4, #2
    BL fib
    ADD r0, r0, r5
    B ReturnFib

    LDR r0, =test
    BL printf

    ## POP STACK AND RETURN
    ReturnFib:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    ADD sp, sp, #12
    MOV pc, lr
   
.data
    test: .asciz "\n we reached here\n"

## END fib


