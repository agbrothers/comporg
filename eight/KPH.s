.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # PROMPT USER FOR INPUT
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =hours
    LDR r2, =miles
    BL scanf

    # CONVERT HOURS & MILES TO KM PER HOUR

    # CALL KPH CONVERSION
    LDR r0, =hours
    LDR r0, [r0]
    LDR r1, =miles
    LDR r1, [r1]
    BL kph

    # PRINT KPH TO USER
    MOV r1, r0
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter integer hours and miles: "
    output: .asciz "\nThat is approximately: %d kph\n"
    hours: .word 0
    miles: .word 0
    formatString: .asciz "%d %d"
