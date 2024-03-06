	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L3:
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	mov r0, #0
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr
