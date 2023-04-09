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
    LDR r1, =val1
    LDR r2, =val2
    LDR r3, =val3
    BL scanf

    ## CALL MAX OF 3 FUNCTION
    LDR r0, =val1
    LDR r0, [r0]
    LDR r1, =val2
    LDR r1, [r1]
    LDR r2, =val3
    LDR r2, [r2]
    BL findMaxOf3

    ## PRINT MAX TO USER
    MOV r1, r0
    LDR r0, =output
    BL printf

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter three integers with spaces between them: "
    output: .asciz "\nMax: %d\n"
    val1: .word 0
    val2: .word 0
    val3: .word 0
    formatString: .asciz "%d %d %d"
