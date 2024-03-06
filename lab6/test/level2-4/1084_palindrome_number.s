	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global palindrome
	.type palindrome , %function
palindrome:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L41:
	str r0, [fp, #-28]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L46
.L46:
	ldr r4, [fp, #-8]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L47
	b .L51
.L47:
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, [fp, #-8]
	mov r5, #-24
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	add r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv r6, r4, r5
	str r6, [fp, #-28]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L46
.L48:
	mov r4, #0
	mov r5, #-24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r5, #3
	mov r6, #-24
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	beq .L55
	b .L60
.L49:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L50:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L51:
	b .L48
.L52:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L54
.L53:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L54
.L54:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L55:
	mov r4, #1
	mov r5, #-24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r5, #2
	mov r6, #-24
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	beq .L52
	b .L65
.L58:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L59:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L60:
	b .L53
.L63:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L64:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L65:
	b .L53
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L66:
	ldr r4, =1221
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl palindrome
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #1
	beq .L69
	b .L74
.L69:
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	b .L71
.L70:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L71
.L71:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
.L72:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
.L73:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
.L74:
	b .L70
