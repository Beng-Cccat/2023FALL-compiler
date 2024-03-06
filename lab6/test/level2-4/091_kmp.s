	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global gn
	.type gn , %function
gn:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L99:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L105
.L105:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	bne .L106
	b .L111
.L106:
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	beq .L113
	b .L119
.L107:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L110:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L111:
	b .L107
.L112:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L113:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	b .L115
.L114:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	b .L115
.L115:
	b .L105
.L116:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	beq .L113
	b .L126
.L117:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L118:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L119:
	b .L116
.L124:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L125:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L126:
	b .L114
	.global KMP
	.type KMP , %function
KMP:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	ldr r4, =16400
	sub sp, sp, r4
.L130:
	ldr r4, =-16400
	str r0, [fp, r4]
	ldr r4, =-16396
	str r1, [fp, r4]
	ldr r4, =-16400
	ldr r5, [fp, r4]
	mov r4, #0
	ldr r6, =-16392
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl gn
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L137
.L137:
	ldr r5, =-16396
	ldr r4, [fp, r5]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	bne .L138
	b .L143
.L138:
	ldr r4, =-16400
	ldr r5, [fp, r4]
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, =-16396
	ldr r4, [fp, r6]
	ldr r6, [fp, #-4]
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [r6]
	cmp r5, r4
	beq .L145
	b .L154
.L139:
	ldr r4, =0
	sub r5, r4, #1
	mov r0, r5
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L142:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L143:
	b .L139
.L144:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L145:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r5, =-16400
	ldr r4, [fp, r5]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L155
	b .L161
.L146:
	ldr r4, [fp, #-8]
	ldr r5, =-16392
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	beq .L164
	b .L168
.L147:
	b .L137
.L152:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L153:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L154:
	b .L146
.L155:
	ldr r4, [fp, #-4]
	mov r0, r4
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L156
.L156:
	b .L147
.L160:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L161:
	b .L156
.L162:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L164:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L165
.L165:
	b .L147
.L166:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L167:
	mov r0, #0
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L168:
	b .L165
	.global rs
	.type rs , %function
rs:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L169:
	str r0, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L172
.L172:
	ldr r4, =1
	cmp r4, #0
	bne .L173
	b .L176
.L173:
	bl getch
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #10
	beq .L179
	b .L185
.L174:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L175:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L176:
	b .L174
.L177:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L179:
	b .L174
.L180:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L172
.L183:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L184:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L185:
	b .L180
.L186:
	b .L180
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	ldr r4, =32768
	sub sp, sp, r4
.L188:
	mov r4, #0
	ldr r5, =-32768
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	mov r0, r5
	bl rs
	mov r4, r0
	mov r4, #0
	ldr r5, =-16384
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl rs
	mov r4, r0
	mov r4, #0
	ldr r5, =-32768
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	ldr r6, =-16384
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl KMP
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	ldr r1, =32768
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
