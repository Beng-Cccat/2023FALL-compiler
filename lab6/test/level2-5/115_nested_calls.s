	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func1
	.type func1 , %function
func1:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L150:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	beq .L154
	b .L159
.L154:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L156
.L155:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	sub r7, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, #0
	bl func1
	mov r4, r0
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L156
.L156:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L157:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L158:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L159:
	b .L155
	.global func2
	.type func2 , %function
func2:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L160:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L163
	b .L167
.L163:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	mov r0, r6
	mov r1, #0
	bl func2
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L165
.L164:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L165
.L165:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
.L166:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
.L167:
	b .L164
.L168:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
	.global func3
	.type func3 , %function
func3:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L169:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	beq .L172
	b .L177
.L172:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L174
.L173:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r0, r6
	mov r1, #0
	bl func3
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L174
.L174:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
.L175:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
.L176:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr
.L177:
	b .L173
	.global func4
	.type func4 , %function
func4:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L178:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-12]
	cmp r4, #0
	bne .L182
	b .L186
.L182:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr
	b .L184
.L183:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr
	b .L184
.L184:
	mov r0, #0
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr
.L185:
	mov r0, #0
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr
.L186:
	b .L183
.L187:
	mov r0, #0
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr
	.global func5
	.type func5 , %function
func5:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L188:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub r6, r5, r4
	mov r0, r6
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
	.global func6
	.type func6 , %function
func6:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L190:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #0
	bne .L196
	b .L198
.L193:
	mov r0, #1
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
	b .L195
.L194:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
	b .L195
.L195:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
.L196:
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L193
	b .L201
.L197:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
.L198:
	b .L194
.L199:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
.L200:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
.L201:
	b .L194
.L202:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr
	.global func7
	.type func7 , %function
func7:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L203:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L205
	b .L210
.L205:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L207
.L206:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	b .L207
.L207:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L209:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L210:
	b .L206
.L211:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #76
.L212:
	bl getint
	mov r4, r0
	str r4, [fp, #-64]
	bl getint
	mov r4, r0
	str r4, [fp, #-60]
	bl getint
	mov r4, r0
	str r4, [fp, #-56]
	bl getint
	mov r4, r0
	str r4, [fp, #-52]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L219
.L219:
	ldr r4, [fp, #-8]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L220
	b .L224
.L220:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #-48
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L219
.L221:
	ldr r4, [fp, #-64]
	mov r0, r4
	bl func7
	mov r4, r0
	ldr r5, [fp, #-60]
	mov r0, r5
	bl func5
	mov r5, r0
	mov r0, r4
	mov r1, r5
	bl func6
	mov r4, r0
	ldr r5, [fp, #-56]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	ldr r5, [fp, #-52]
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r0, r4
	bl func5
	mov r4, r0
	str r4, [fp, #-72]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-68]
	mov r4, #1
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl func5
	mov r4, r0
	mov r5, #2
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #3
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func7
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func6
	mov r5, r0
	mov r6, #4
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r7, #5
	mov r8, #-48
	mov r9, #4
	mul r10, r7, r9
	add r7, r8, r10
	add r8, fp, r7
	ldr r7, [r8]
	mov r0, r7
	bl func7
	mov r7, r0
	mov r0, r6
	mov r1, r7
	bl func2
	mov r6, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func4
	mov r4, r0
	mov r5, #6
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r5, #7
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	mov r5, #8
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #9
	mov r7, #-48
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func7
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	ldr r6, [fp, #-64]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func1
	mov r4, r0
	ldr r5, [fp, #-72]
	mov r0, r5
	ldr r5, [fp, #-68]
	mov r1, r5
	mov r2, r4
	bl func4
	mov r4, r0
	ldr r5, [fp, #-60]
	ldr r6, [fp, #-56]
	mov r0, r6
	bl func7
	mov r6, r0
	ldr r7, [fp, #-52]
	mov r0, r6
	mov r1, r7
	bl func3
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r5, #0
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #1
	mov r7, #-48
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func1
	mov r4, r0
	mov r5, #2
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	mov r5, #3
	mov r6, #-48
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	ldr r5, [r6]
	str r5, [fp, #-76]
	mov r5, #4
	mov r6, #-48
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #5
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	mov r6, #6
	mov r7, #-48
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	mov r6, #7
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r7, #8
	mov r8, #-48
	mov r9, #4
	mul r10, r7, r9
	add r7, r8, r10
	add r8, fp, r7
	ldr r7, [r8]
	mov r0, r7
	bl func7
	mov r7, r0
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl func1
	mov r5, r0
	mov r6, #9
	mov r7, #-48
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	ldr r6, [fp, #-64]
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	mov r0, r4
	ldr r4, [fp, #-76]
	mov r1, r4
	mov r2, r5
	bl func1
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L222:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L223:
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L224:
	b .L221
