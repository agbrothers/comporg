.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =F
    BL scanf

    # CONVERT F to C: C = (F - 32) * 5 / 9

    # SUBTRACT 32    
    LDR r1, =F
    LDR r1, [r1]
    SUB r0, r1, #32
    
    # MULTIPLY BY 5
    MOV r2, #5
    MUL r1, r0, r2

    # DIVIDE BY 9
    MOV r0, r1
    MOV r1, #9
    BL __aeabi_idiv

    # PRINT CELSIUS TO USER
    MOV r1, r0
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter the temperature in Fahrenheit: "
    output: .asciz "\nThe temperature in Celsius is: %d\n"
    F: .word 0
    formatString: .asciz "%d"
