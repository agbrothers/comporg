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

    ## CALL FIB FUNCTION
    LDR r0, =input
    LDR r0, [r0]
    BL fib

    ## PRINT fib(n)
    LDR r1, =input
    LDR r1, [r1]
    MOV r2, r0
    LDR r0, =output
    BL printf

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Returns the nth fibonacci number, enter n: "
    output: .asciz "fib(%d) = %d\n"
    input: .word 0
    formatString: .asciz "%d"
