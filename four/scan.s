.text
.global main
main: 
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =format1
	LDR r1, =name1
	BL scanf

	LDR r0, =format2
	LDR r1, =name1
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	format1: .asciz "&d"
	name1: .space 40
	format2: .asciz "Your name is %s"
