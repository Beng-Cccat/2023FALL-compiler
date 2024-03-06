	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L25:
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L28
.L28:
	ldr r4, [fp, #-8]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L29
	b .L33
.L29:
	ldr r4, =10
	str r4, [fp, #-4]
	b .L35
.L30:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L31:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L32:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L33:
	b .L30
.L35:
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L36
	b .L39
.L36:
	ldr r4, [fp, #-8]
	cmp r4, #0
	bne .L43
	b .L45
.L37:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L28
.L38:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L39:
	b .L37
.L40:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L41:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	ldr r4, [fp, #-4]
	add r5, r6, r4
	str r5, [fp, #-12]
	b .L42
.L42:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L35
.L43:
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L41
	b .L48
.L44:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L45:
	b .L42
.L46:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L47:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
.L48:
	b .L42
.L49:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
