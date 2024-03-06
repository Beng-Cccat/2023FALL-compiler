	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global sum
	.align 4
	.size sum, 4
sum:
	.word 0
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.comm ans, 200, 4
	.comm row, 200, 4
	.comm line1, 200, 4
	.comm line2, 400, 4
	.text
	.global printans
	.type printans , %function
printans:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L90:
	ldr r4, addr_sum0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_sum0
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L92
.L92:
	ldr r4, [fp, #-4]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L93
	b .L97
.L93:
	ldr r4, [fp, #-4]
	ldr r5, addr_ans0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	beq .L99
	b .L104
.L94:
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L95:
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L96:
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L97:
	b .L94
.L99:
	mov r0, #10
	bl putch
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L101
.L100:
	mov r0, #32
	bl putch
	b .L101
.L101:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L92
.L102:
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L103:
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L104:
	b .L100
	.global f
	.type f , %function
f:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L105:
	str r0, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L108
.L108:
	ldr r4, [fp, #-4]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L109
	b .L113
.L109:
	ldr r4, [fp, #-4]
	ldr r5, addr_row0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #1
	bne .L117
	b .L121
.L110:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L111:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L112:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L113:
	b .L110
.L114:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, addr_ans0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	beq .L131
	b .L135
.L115:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L108
.L116:
	ldr r4, addr_n0
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	sub r5, r6, r4
	ldr r4, addr_line20
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L114
	b .L129
.L117:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	ldr r4, addr_line10
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #0
	beq .L116
	b .L125
.L119:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L120:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L121:
	b .L115
.L123:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L124:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L125:
	b .L115
.L128:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L129:
	b .L115
.L130:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L131:
	bl printans
	b .L132
.L132:
	ldr r4, [fp, #-4]
	ldr r5, addr_row0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	ldr r4, addr_line10
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, addr_n0
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	sub r5, r6, r4
	ldr r4, addr_line20
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	mov r0, r5
	bl f
	ldr r4, [fp, #-4]
	ldr r5, addr_row0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	ldr r4, addr_line10
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, =0
	str r5, [r4]
	ldr r4, addr_n0
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	sub r5, r6, r4
	ldr r4, addr_line20
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, =0
	str r5, [r4]
	b .L115
.L133:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L134:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L135:
	b .L132
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L136:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L138
.L138:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L139
	b .L143
.L139:
	bl getint
	mov r4, r0
	ldr r5, addr_n0
	str r4, [r5]
	mov r0, #1
	bl f
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L138
.L140:
	ldr r4, addr_sum0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
.L141:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
.L142:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
.L143:
	b .L140
addr_ans0:
	.word ans
addr_sum0:
	.word sum
addr_n0:
	.word n
addr_row0:
	.word row
addr_line10:
	.word line1
addr_line20:
	.word line2
