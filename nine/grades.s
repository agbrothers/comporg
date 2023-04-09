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

    ## CALL GRADING FUNCTION
    LDR r0, =input
    LDR r0, [r0]
    BL grade

    ## PRINT GRADE TO USER
    BL printf

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter an average grade between 0-100: "
    input: .word 0
    formatString: .asciz "%d"
