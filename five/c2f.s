.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =C
    BL scanf

    # CONVERT C to F: F = (C * 9/5) + 32

    # MULTIPLY BY 9
    LDR r1, =C
    LDR r1, [r1]
    MOV r2, #9
    MUL r0, r1, r2

    # DIVIDE BY 5
    MOV r1, #5
    BL __aeabi_idiv

    # ADD 32    
    ADD r1, r0, #32
    
    # PRINT FAHRENHEIT TO USER
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter the temperature in Celsius: "
    output: .asciz "\nThe temperature in Fahrenheit is: %d\n"
    C: .word 0
    formatString: .asciz "%d"
