.text
.global main
main:

    ## PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]

    ## PROMPT USER FOR x
    LDR r0, =xPrompt
    BL printf
    LDR r0, =formatString
    LDR r1, =x
    BL scanf

    ## PROMPT USER FOR n  
    LDR r0, =nPrompt  
    BL printf
    LDR r0, =formatString
    LDR r1, =n
    BL scanf

    ## CALL mult FUNCTION
    LDR r0, =x
    LDR r0, [r0]
    LDR r1, =n
    LDR r1, [r1]
    BL mult

    ## PRINT OUTPUT
    LDR r1, =x
    LDR r1, [r1]
    LDR r2, =n
    LDR r2, [r2]
    MOV r3, r0
    LDR r0, =output
    BL printf

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    xPrompt: .asciz "Enter a number to multiply: "
    nPrompt: .asciz "How many time shall we multiply it?: "
    x: .word 0
    n: .word 0
    formatString: .asciz "%d"
    output: .asciz "%d * %d = %d\n"
