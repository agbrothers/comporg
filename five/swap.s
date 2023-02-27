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
    LDR r2, =Y
    BL scanf

    ## SWAP TWO REGISTERS IN PLACE USING XOR

    # LOAD VALUES
    LDR r1, =X
    LDR r1, [r1]
    LDR r2, =Y
    LDR r2, [r2]
    
    # SWAP r1 AND r2 DIRECTLY
    EOR r1, r1, r2
    EOR r2, r1, r2
    EOR r1, r1, r2

    # PRINT OUTPUT
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter two values to swap in place: "
    output: .asciz "Swapped: %d %d\n"
    X: .word 0
    Y: .word 0
    formatString: .asciz "%d %d"
