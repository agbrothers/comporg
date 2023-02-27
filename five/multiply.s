.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =X
    BL scanf

    # MULTIPLY INPUT INTEGER BY 10 USING LOGICAL SHIFTS AND ADDS

    # SHIFT LEFT 3 BITS (MULTIPLY by 8 in decimal)
    LDR r1, =X
    LDR r1, [r1]
    LSL r2, r1, #3

    ## ADD TO ITSELF (MULTIPLY by 2 in decimal)
    ADD r3, r1, r1

    ## SUM THE TWO VALUES
    ADD r1, r2, r3

    # PRINT OUTPUT
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter an integer: "
    output: .asciz "Multiplying by 10 gives: %d\n"
    X: .word 0
    formatString: .asciz "%d"
