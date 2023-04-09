.text
.global main
main:

    ## PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]

    ## PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =input
    BL scanf

    ## CALL PRIMES FUNCTION
    LDR r0, =input
    LDR r0, [r0]
    BL primes

    ## PRINT PRIMES TO USER
    BL printf

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "I will return all primes between 3 and n, enter a value for n: "
    input: .word 0
    formatString: .asciz "%d"
