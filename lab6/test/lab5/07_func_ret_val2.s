	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L6:
	str r0, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r5, r4
	str r6, [fp, #-4]
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L9:
	mov r0, #42
	bl func
	mov r4, r0
	mov r0, #0
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr
