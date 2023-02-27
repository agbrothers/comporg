.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =ft
    LDR r2, =in
    BL scanf

    # CONVERT FEET AND INCHES TO INCHES

    # MULTIPLY FEET BY 12    
    LDR r1, =ft
    LDR r1, [r1]
    MOV r2, #12
    MUL r0, r1, r2

    # ADD TO INPUT INCHES
    LDR r2, =in
    LDR r2, [r2]
    ADD r1, r0, r2

    # PRINT OUTPUT
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter the distance in feet and inches with a space in between: "
    output: .asciz "\nThe total number of inches is: %d\n"
    ft: .word 0
    in: .word 0
    formatString: .asciz "%d %d"
