.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =in
    BL scanf

    # CONVERT INCHES TO FEET + INCHES
    
    # FIND THE NUMBER OF FEET
    LDR r0, =in
    LDR r0, [r0]
    MOV r1, #12
    BL __aeabi_idiv

    # GET THE NUMBER OF INCHES IN THOSE FEET
    MOV r4, r0
    MUL r2, r4, r1

    # SUBTRACT THOSE INCHES FROM THE TOTAL INCHES
    LDR r1, =in
    LDR r1, [r1]
    SUB r0, r1, r2 

    # PRINT OUTPUT
    MOV r1, r4
    MOV r2, r0
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter inches: "
    output: .asciz "\nThe distance in feet and inches is: %dft %din\n"
    in: .word 0
    formatString: .asciz "%d"
