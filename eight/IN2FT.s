.text
.global main
main:

    ## PUSH THE STACK
    SUB sp, sp, #4
    STR lr, [sp]

    ## PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =in
    BL scanf

    ## CALL THE CONVERSION FUNCTION
    LDR r0, =in
    LDR r0, [r0]
    BL inches2feet

    ## PRINT OUTPUT
    MOV r2, r1
    MOV r1, r0
    LDR r0, =output
    BL printf

    ## POP THE STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter inches: "
    output: .asciz "\nThe distance in feet and inches is: %dft %din\n"
    in: .word 0
    formatString: .asciz "%d"
