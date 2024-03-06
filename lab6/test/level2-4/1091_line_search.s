	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #76
.L58:
	ldr r4, =0
	str r4, [fp, #-72]
	ldr r4, =0
	str r4, [fp, #-76]
	b .L62
.L62:
	ldr r4, [fp, #-76]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L63
	b .L67
.L63:
	ldr r4, [fp, #-76]
	add r5, r4, #1
	ldr r4, [fp, #-76]
	mov r6, #-68
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-76]
	add r5, r4, #1
	str r5, [fp, #-76]
	b .L62
.L64:
	ldr r4, =10
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-24]
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	str r5, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-76]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L75
.L65:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L66:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L67:
	b .L64
.L75:
	ldr r4, [fp, #-76]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L78
	b .L81
.L76:
	ldr r4, [fp, #-76]
	mov r5, #-68
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	cmp r4, r5
	beq .L85
	b .L90
.L77:
	ldr r4, [fp, #-8]
	cmp r4, #1
	beq .L91
	b .L96
.L78:
	ldr r4, [fp, #-8]
	cmp r4, #0
	beq .L76
	b .L84
.L79:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L80:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L81:
	b .L77
.L82:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L83:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L84:
	b .L77
.L85:
	ldr r4, =1
	str r4, [fp, #-8]
	ldr r4, [fp, #-76]
	str r4, [fp, #-4]
	b .L86
.L86:
	ldr r4, [fp, #-76]
	add r5, r4, #1
	str r5, [fp, #-76]
	b .L75
.L88:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L89:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L90:
	b .L86
.L91:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L93
.L92:
	ldr r4, =0
	str r4, [fp, #-28]
	ldr r4, [fp, #-28]
	mov r0, r4
	bl putint
	b .L93
.L93:
	ldr r4, =10
	str r4, [fp, #-28]
	ldr r4, [fp, #-28]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L94:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L95:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L96:
	b .L92
