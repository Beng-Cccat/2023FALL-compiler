	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.comm array, 440, 4
	.text
	.global init
	.type init , %function
init:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L174:
	str r0, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L177
.L177:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mul r7, r5, r6
	add r5, r7, #1
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L178
	b .L182
.L178:
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, [fp, #-4]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L177
.L179:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L180:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L181:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L182:
	b .L179
	.global findfa
	.type findfa , %function
findfa:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L183:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	cmp r4, r5
	beq .L185
	b .L191
.L185:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L187
.L186:
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-4]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L187
.L187:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L189:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L190:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L191:
	b .L186
	.global mmerge
	.type mmerge , %function
mmerge:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L194:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bne .L199
	b .L203
.L199:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	b .L200
.L200:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L201:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L202:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L203:
	b .L200
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L204:
	ldr r4, =1
	str r4, [fp, #-36]
	b .L209
.L209:
	ldr r4, [fp, #-36]
	cmp r4, #0
	bne .L210
	b .L213
.L210:
	ldr r4, [fp, #-36]
	sub r5, r4, #1
	str r5, [fp, #-36]
	ldr r4, =4
	ldr r5, addr_n0
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, addr_n0
	ldr r5, [r4]
	mov r0, r5
	bl init
	ldr r4, addr_n0
	ldr r5, [r4]
	ldr r4, addr_n0
	ldr r6, [r4]
	mul r4, r5, r6
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L218
.L211:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L212:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L213:
	b .L211
.L214:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L218:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L219
	b .L223
.L219:
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	ldr r4, [fp, #-16]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L224
	b .L228
.L220:
	ldr r4, [fp, #-16]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L297
	b .L301
.L221:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L222:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L223:
	b .L220
.L224:
	ldr r4, addr_n0
	ldr r5, [r4]
	ldr r4, [fp, #-28]
	sub r6, r4, #1
	mul r4, r5, r6
	ldr r5, [fp, #-24]
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-28]
	cmp r4, #1
	beq .L231
	b .L235
.L225:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L218
.L227:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L228:
	b .L225
.L229:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L231:
	mov r4, #0
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	mov r0, r4
	mov r1, #0
	bl mmerge
	b .L232
.L232:
	ldr r4, [fp, #-28]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	beq .L236
	b .L240
.L233:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L234:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L235:
	b .L232
.L236:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-12]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl mmerge
	b .L237
.L237:
	ldr r4, [fp, #-24]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L243
	b .L246
.L238:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L239:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L240:
	b .L237
.L241:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	add r6, r5, #1
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L242
.L242:
	ldr r4, [fp, #-24]
	cmp r4, #1
	movgt r4, #1
	movle r4, #0
	bgt .L253
	b .L256
.L243:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	ldr r4, addr_array0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	bne .L241
	b .L250
.L244:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L245:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L246:
	b .L242
.L248:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L249:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L250:
	b .L242
.L251:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	sub r6, r5, #1
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L252
.L252:
	ldr r4, [fp, #-28]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L263
	b .L266
.L253:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	ldr r4, addr_array0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	bne .L251
	b .L260
.L254:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L255:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L256:
	b .L252
.L258:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L259:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L260:
	b .L252
.L261:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n0
	ldr r7, [r6]
	add r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L262
.L262:
	ldr r4, [fp, #-28]
	cmp r4, #1
	movgt r4, #1
	movle r4, #0
	bgt .L273
	b .L276
.L263:
	ldr r4, [fp, #-8]
	ldr r5, addr_n0
	ldr r6, [r5]
	add r5, r4, r6
	ldr r4, addr_array0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	bne .L261
	b .L270
.L264:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L265:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L266:
	b .L262
.L268:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L269:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L270:
	b .L262
.L271:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n0
	ldr r7, [r6]
	sub r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L272
.L272:
	mov r4, #0
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	bne .L284
	b .L288
.L273:
	ldr r4, [fp, #-8]
	ldr r5, addr_n0
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_array0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	bne .L271
	b .L280
.L274:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L275:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L276:
	b .L272
.L278:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L279:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L280:
	b .L272
.L281:
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L282
.L282:
	b .L225
.L283:
	mov r0, #0
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-12]
	mov r0, r5
	bl findfa
	mov r5, r0
	cmp r4, r5
	beq .L281
	b .L295
.L284:
	ldr r4, [fp, #-12]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	bne .L283
	b .L292
.L286:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L287:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L288:
	b .L282
.L290:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L291:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L292:
	b .L282
.L293:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L294:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L295:
	b .L282
.L297:
	ldr r4, =0
	sub r5, r4, #1
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	b .L298
.L298:
	b .L209
.L300:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L301:
	b .L298
.L302:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
addr_array0:
	.word array
addr_n0:
	.word n
