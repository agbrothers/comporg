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

    ## WRITE NEGATIVE VALUE VIA 2's COMPLEMENT

    # 1's COMPLIMENT
    LDR r1, =X
    LDR r1, [r1]
    MVN r0, r1
   
    # ADD 1
    ADD r1, r0, #1

    # PRINT OUTPUT
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter a positive integer value: "
    output: .asciz "\nThe negative value is: %d\n"
    X: .word 0
    formatString: .asciz "%d"
