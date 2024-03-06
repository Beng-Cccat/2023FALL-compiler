	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word -1
	.global b
	.align 4
	.size b, 4
b:
	.word 1
	.text
	.global ia
	.type ia , %function
ia:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L46:
	ldr r4, addr_a0
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L48:
	ldr r4, =5
	str r4, [fp, #-4]
	b .L50
.L50:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movge r4, #1
	movlt r4, #0
	bge .L51
	b .L55
.L51:
	bl ia
	mov r4, r0
	cmp r4, #0
	bne .L59
	b .L61
.L52:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L53:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L54:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L55:
	b .L52
.L56:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	b .L57
.L57:
	bl ia
	mov r4, r0
	cmp r4, #14
	movlt r4, #1
	movge r4, #0
	blt .L69
	b .L75
.L58:
	bl ia
	mov r4, r0
	cmp r4, #0
	bne .L56
	b .L67
.L59:
	bl ia
	mov r4, r0
	cmp r4, #0
	bne .L58
	b .L64
.L60:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L61:
	b .L57
.L62:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L63:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L64:
	b .L57
.L65:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L66:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L67:
	b .L57
.L68:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L69:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	ldr r4, =2
	mul r6, r5, r4
	ldr r4, addr_b0
	str r6, [r4]
	b .L71
.L70:
	bl ia
	mov r4, r0
	b .L71
.L71:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L50
.L72:
	bl ia
	mov r4, r0
	cmp r4, #0
	bne .L76
	b .L78
.L73:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L74:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L75:
	b .L72
.L76:
	bl ia
	mov r4, r0
	bl ia
	mov r5, r0
	sub r6, r4, r5
	add r4, r6, #1
	cmp r4, #0
	bne .L69
	b .L81
.L77:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L78:
	b .L70
.L79:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L80:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
.L81:
	b .L70
.L82:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
addr_a0:
	.word a
addr_b0:
	.word b
