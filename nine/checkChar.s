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

    ## CHECK IF THE INPUT INT IS A VALID ASCII CHAR

    ## CALL KPH CONVERSION
    LDR r0, =input
    LDR r0, [r0]
    BL isChar

    ## PRINT KPH TO USER
    MOV r1, r0
    LDR r0, =output
    BL printf

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter an integer: "
    output: .asciz "\nInput is a valid ascii char?: %d\n"
    input: .word 0
    formatString: .asciz "%d"
