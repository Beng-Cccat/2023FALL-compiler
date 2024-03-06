	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global canJump
	.type canJump , %function
canJump:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #56
.L82:
	str r0, [fp, #-56]
	str r1, [fp, #-52]
	ldr r4, [fp, #-52]
	cmp r4, #1
	beq .L85
	b .L89
.L85:
	mov r0, #1
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L86
.L86:
	ldr r4, [fp, #-56]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-52]
	sub r6, r5, #2
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L90
	b .L96
.L87:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L88:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L89:
	b .L86
.L90:
	mov r0, #1
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L91
.L91:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L99
.L94:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L95:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L96:
	b .L91
.L99:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-52]
	sub r6, r5, #1
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L100
	b .L104
.L100:
	ldr r4, [fp, #-8]
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L99
.L101:
	ldr r4, [fp, #-52]
	sub r5, r4, #1
	mov r4, #-48
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	add r4, fp, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-52]
	sub r5, r4, #2
	str r5, [fp, #-8]
	b .L105
.L102:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L103:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L104:
	b .L101
.L105:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L106
	b .L110
.L106:
	ldr r4, [fp, #-56]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-52]
	sub r6, r5, #1
	ldr r5, [fp, #-8]
	sub r7, r6, r5
	cmp r4, r7
	movlt r4, #1
	movge r4, #0
	blt .L112
	b .L119
.L107:
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L108:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L109:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L110:
	b .L107
.L112:
	ldr r4, [fp, #-56]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	b .L114
.L113:
	ldr r4, [fp, #-52]
	sub r5, r4, #1
	ldr r4, [fp, #-8]
	sub r6, r5, r4
	str r6, [fp, #-4]
	b .L114
.L114:
	b .L122
.L117:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L118:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L119:
	b .L113
.L122:
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L123
	b .L127
.L123:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r4, #-48
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	add r4, fp, r5
	ldr r5, [r4]
	cmp r5, #0
	bne .L128
	b .L133
.L124:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L105
.L125:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L126:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L127:
	b .L124
.L128:
	ldr r4, [fp, #-8]
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	b .L129
.L129:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L122
.L131:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L132:
	mov r0, #0
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L133:
	b .L129
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #44
.L135:
	mov r4, #0
	mov r5, #-40
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #1
	mov r5, #-40
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #4
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #7
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-40
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-44]
	mov r4, #0
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-44]
	mov r0, r5
	mov r1, r4
	bl canJump
	mov r4, r0
	str r4, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	add sp, sp, #44
	pop {r4, r5, r6, r7, fp, lr}
	bx lr