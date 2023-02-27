.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =X
    BL scanf

    ## INSERT CUSTOM CODE HERE


    LDR r1, =X
    LDR r1, [r1]
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter the value for X: "
    output: .asciz "\nThe value of Y is: %d\n"
    X: .word 0
    formatString: .asciz "%d"
