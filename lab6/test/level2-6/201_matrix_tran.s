	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global M
	.align 4
	.size M, 4
M:
	.word 0
	.global L
	.align 4
	.size L, 4
L:
	.word 0
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.text
	.global tran
	.type tran , %function
tran:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #40
.L129:
	str r0, [fp, #-40]
	str r1, [fp, #-36]
	str r2, [fp, #-32]
	str r3, [fp, #-28]
	ldr r3, [fp, #28]
	str r3, [fp, #-24]
	ldr r3, [fp, #32]
	str r3, [fp, #-20]
	ldr r3, [fp, #36]
	str r3, [fp, #-16]
	ldr r3, [fp, #40]
	str r3, [fp, #-12]
	ldr r3, [fp, #44]
	str r3, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	mov r6, #2
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-36]
	mov r5, #2
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	mov r6, #1
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-36]
	mov r5, #0
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #1
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-32]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #2
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-40]
	mov r5, #2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	mov r6, #1
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-32]
	mov r5, #2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	mov r6, #2
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-40]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	mov r0, #0
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #64
.L167:
	ldr r4, =3
	ldr r5, addr_N0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_M0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_L0
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L178
.L178:
	ldr r4, [fp, #-8]
	ldr r5, addr_M0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L179
	b .L183
.L179:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-44
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-40
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-36
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-32
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-28
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-24
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L178
.L180:
	mov r4, #0
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #-40
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r4, #0
	mov r7, #-36
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	add r7, fp, r4
	mov r4, #0
	mov r8, #-32
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-48]
	mov r4, #0
	mov r8, #-28
	mov r10, #4
	mul r9, r4, r10
	add r4, r8, r9
	add r8, fp, r4
	str r8, [fp, #-52]
	mov r4, #0
	mov r8, #-24
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-56]
	mov r4, #0
	mov r8, #-20
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-60]
	mov r4, #0
	mov r8, #-16
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-64]
	mov r4, #0
	mov r8, #-12
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	mov r0, r5
	mov r1, r6
	mov r2, r7
	ldr r4, [fp, #-48]
	mov r3, r4
	push {r8}
	ldr r4, [fp, #-64]
	push {r4}
	ldr r4, [fp, #-60]
	push {r4}
	ldr r4, [fp, #-56]
	push {r4}
	ldr r4, [fp, #-52]
	push {r4}
	bl tran
	add sp, sp, #20
	mov r4, r0
	str r4, [fp, #-8]
	b .L185
.L181:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L182:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L183:
	b .L180
.L185:
	ldr r4, [fp, #-8]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L186
	b .L190
.L186:
	ldr r4, [fp, #-8]
	mov r5, #-20
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L185
.L187:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r4, =0
	str r4, [fp, #-8]
	b .L192
.L188:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L189:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L190:
	b .L187
.L192:
	ldr r4, [fp, #-8]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L193
	b .L197
.L193:
	ldr r4, [fp, #-8]
	mov r5, #-16
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L192
.L194:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L199
.L195:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L196:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L197:
	b .L194
.L199:
	ldr r4, [fp, #-8]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L200
	b .L204
.L200:
	ldr r4, [fp, #-8]
	mov r5, #-12
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L199
.L201:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L202:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L203:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L204:
	b .L201
addr_M0:
	.word M
addr_L0:
	.word L
addr_N0:
	.word N
