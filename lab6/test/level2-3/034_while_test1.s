	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global doubleWhil
	.type doubleWhil , %function
doubleWhil:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L19:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =7
	str r4, [fp, #-4]
	b .L22
.L22:
	ldr r4, [fp, #-8]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L23
	b .L27
.L23:
	ldr r4, [fp, #-8]
	add r5, r4, #30
	str r5, [fp, #-8]
	b .L28
.L24:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr
.L25:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr
.L26:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr
.L27:
	b .L24
.L28:
	ldr r4, [fp, #-4]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L29
	b .L33
.L29:
	ldr r4, [fp, #-4]
	add r5, r4, #6
	str r5, [fp, #-4]
	b .L28
.L30:
	ldr r4, [fp, #-4]
	sub r5, r4, #100
	str r5, [fp, #-4]
	b .L22
.L31:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr
.L32:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr
.L33:
	b .L30
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L34:
	bl doubleWhil
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr
