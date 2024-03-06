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
.L12:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	add r5, r4, #3
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	mov r0, r6
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L15:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	mov r1, #1
	bl func
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
