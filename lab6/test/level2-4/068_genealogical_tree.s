	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm map, 400, 4
	.comm indegree, 40, 4
	.comm queue, 40, 4
	.text
	.global topo
	.type topo , %function
topo:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L88:
	str r0, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =1
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L94
.L94:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L95
	b .L99
.L95:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L100
.L96:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L127
.L97:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L98:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L99:
	b .L96
.L100:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L101
	b .L105
.L101:
	ldr r4, [fp, #-4]
	ldr r5, addr_indegree0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #0
	beq .L106
	b .L111
.L102:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, addr_queue0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, [fp, #-16]
	ldr r6, addr_indegree0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L113
.L103:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L104:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L105:
	b .L102
.L106:
	ldr r4, [fp, #-4]
	str r4, [fp, #-16]
	b .L102
.L107:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L100
.L109:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L110:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L111:
	b .L107
.L112:
	b .L107
.L113:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L114
	b .L118
.L114:
	ldr r4, [fp, #-16]
	ldr r5, addr_map0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	cmp r5, #0
	bne .L119
	b .L124
.L115:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L94
.L116:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L117:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L118:
	b .L115
.L119:
	ldr r4, [fp, #-4]
	ldr r5, addr_indegree0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, [fp, #-4]
	ldr r6, addr_indegree0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	b .L120
.L120:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L113
.L123:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L124:
	b .L120
.L125:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L127:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L128
	b .L132
.L128:
	ldr r4, [fp, #-8]
	ldr r5, addr_queue0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L127
.L129:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L130:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L131:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L132:
	b .L129
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L134:
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, =5
	str r4, [fp, #-12]
	b .L138
.L138:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L139
	b .L143
.L139:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L144
.L140:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl topo
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L141:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L142:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L143:
	b .L140
.L144:
	ldr r4, [fp, #-8]
	cmp r4, #0
	bne .L145
	b .L149
.L145:
	ldr r4, [fp, #-4]
	ldr r5, addr_map0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	ldr r5, addr_indegree0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	add r5, r4, #1
	ldr r4, [fp, #-8]
	ldr r6, addr_indegree0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L144
.L146:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L138
.L147:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L148:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L149:
	b .L146
addr_map0:
	.word map
addr_indegree0:
	.word indegree
addr_queue0:
	.word queue
