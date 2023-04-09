.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    ## PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =C
    BL scanf

    # CALL CONVERSION FUNCTION
    LDR r0, =C
    LDR r0, [r0]
    BL celsius2fahrenheit

    # PRINT FAHRENHEIT TO USER
    MOV r1, r0
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
