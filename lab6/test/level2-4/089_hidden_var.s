	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global b
	.align 4
	.size b, 4
b:
	.word 5
	.global c
	.align 4
	.size c, 16
c:
	.word 6
	.word 7
	.word 8
	.word 9
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #220
.L36:
	ldr r4, =1
	str r4, [fp, #-220]
	ldr r4, =2
	str r4, [fp, #-216]
	ldr r4, =3
	str r4, [fp, #-216]
	ldr r4, [fp, #-216]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-216]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-220]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L39
.L39:
	ldr r4, [fp, #-220]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L40
	b .L44
.L40:
	ldr r4, =0
	str r4, [fp, #-212]
	ldr r4, [fp, #-212]
	add r5, r4, #1
	str r5, [fp, #-212]
	ldr r4, [fp, #-212]
	cmp r4, #0
	bne .L46
	b .L49
.L41:
	ldr r4, [fp, #-220]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r4, #2
	ldr r5, addr_c0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #0
	mov r5, #-208
	mov r6, #32
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =8
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	ldr r4, =2
	str r4, [fp, #-144]
	mov r4, #2
	ldr r5, addr_c0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #0
	bne .L86
	b .L90
.L42:
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L43:
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L44:
	b .L41
.L46:
	b .L41
.L47:
	b .L39
.L48:
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L49:
	b .L47
.L50:
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L51:
	b .L47
.L86:
	mov r4, #0
	mov r5, #-140
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =8
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-144]
	mov r5, #-140
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-144]
	mov r5, #-140
	mov r7, #20
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-144]
	mov r5, #-140
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, #2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	bl putint
	b .L87
.L87:
	mov r0, #10
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	mov r4, #0
	ldr r5, addr_c0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r4, #1
	ldr r5, addr_c0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r4, #2
	ldr r5, addr_c0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r4, #3
	ldr r5, addr_c0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L89:
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L90:
	b .L87
.L91:
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
addr_b0:
	.word b
addr_c0:
	.word c
