#
# Program Name:   print.s
# Author:         Greyson Brothers
# Date:           02/16/2023
# Purpose:        Learning Assembly
#

.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =formatString
	LDR r1, =name
        MOV r2, #63
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #3
	MOV pc, lr

.data
	formatString: .asciz "Hello %s, are you %d years old?\n"
	name: .asciz "Chuck"

