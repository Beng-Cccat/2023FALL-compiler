	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.text
	.global sa
	.type sa , %function
sa:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L121:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
	.global sb
	.type sb , %function
sb:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L123:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_b0
	str r4, [r5]
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
	.global sd
	.type sd , %function
sd:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L125:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_d0
	str r4, [r5]
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L127:
	ldr r4, =2
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b0
	str r4, [r5]
	mov r0, #0
	bl sa
	mov r4, r0
	cmp r4, #0
	bne .L130
	b .L132
.L128:
	b .L129
.L129:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, =2
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b0
	str r4, [r5]
	mov r0, #0
	bl sa
	mov r4, r0
	cmp r4, #0
	bne .L139
	b .L141
.L130:
	mov r0, #1
	bl sb
	mov r4, r0
	cmp r4, #0
	bne .L128
	b .L135
.L131:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L132:
	b .L129
.L133:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L134:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L135:
	b .L129
.L136:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L137:
	b .L138
.L138:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =1
	str r4, [fp, #-24]
	ldr r4, =2
	ldr r5, addr_d0
	str r4, [r5]
	ldr r4, [fp, #-24]
	cmp r4, #1
	movge r4, #1
	movlt r4, #0
	bge .L149
	b .L152
.L139:
	mov r0, #1
	bl sb
	mov r4, r0
	cmp r4, #0
	bne .L137
	b .L144
.L140:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L141:
	b .L138
.L142:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L143:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L144:
	b .L138
.L145:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L147:
	b .L148
.L148:
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-24]
	cmp r4, #1
	movle r4, #1
	movgt r4, #0
	ble .L156
	b .L161
.L149:
	mov r0, #3
	bl sd
	mov r4, r0
	cmp r4, #0
	bne .L147
	b .L154
.L150:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L151:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L152:
	b .L148
.L153:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L154:
	b .L148
.L155:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L156:
	b .L157
.L157:
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =2
	add r5, r4, #1
	ldr r4, =3
	sub r6, r4, r5
	ldr r4, =16
	cmp r4, r6
	movge r4, #1
	movlt r4, #0
	bge .L165
	b .L169
.L158:
	mov r0, #4
	bl sd
	mov r4, r0
	cmp r4, #0
	bne .L156
	b .L163
.L159:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L160:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L161:
	b .L158
.L162:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L163:
	b .L157
.L164:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L165:
	mov r0, #65
	bl putch
	b .L166
.L166:
	ldr r4, =25
	sub r5, r4, #7
	ldr r4, =6
	ldr r6, =3
	mul r7, r4, r6
	ldr r4, =36
	sub r6, r4, r7
	cmp r5, r6
	bne .L170
	b .L174
.L167:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L168:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L169:
	b .L166
.L170:
	mov r0, #66
	bl putch
	b .L171
.L171:
	ldr r4, =1
	cmp r4, #8
	movlt r4, #1
	movge r4, #0
	ldr r5, =7
	ldr r6, =2
	sdiv r7, r5, r6
	mul r6, r7, r6
	sub r7, r5, r6
	mov r5, r4
	cmp r5, r7
	bne .L175
	b .L183
.L172:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L173:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L174:
	b .L171
.L175:
	mov r0, #67
	bl putch
	b .L176
.L176:
	ldr r4, =3
	cmp r4, #4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	cmp r5, #0
	beq .L184
	b .L192
.L177:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L178:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L179:
	b .L178
.L181:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L182:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L183:
	b .L176
.L184:
	mov r0, #68
	bl putch
	b .L185
.L185:
	ldr r4, =102
	cmp r4, #63
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =1
	cmp r4, r5
	beq .L193
	b .L201
.L186:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L187:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L188:
	b .L187
.L190:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L191:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L192:
	b .L185
.L193:
	mov r0, #69
	bl putch
	b .L194
.L194:
	ldr r4, =5
	sub r5, r4, #6
	ldr r4, =0
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	mov r6, r4
	ldr r4, =0
	sub r7, r4, r6
	cmp r5, r7
	beq .L202
	b .L208
.L195:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L196:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L197:
	b .L196
.L199:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L200:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L201:
	b .L194
.L202:
	mov r0, #70
	bl putch
	b .L203
.L203:
	mov r0, #10
	bl putch
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, =2
	str r4, [fp, #-12]
	ldr r4, =3
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	b .L214
.L206:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L207:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L208:
	b .L203
.L214:
	ldr r4, [fp, #-20]
	cmp r4, #0
	bne .L217
	b .L219
.L215:
	mov r0, #32
	bl putch
	b .L214
.L216:
	ldr r4, [fp, #-20]
	cmp r4, #0
	bne .L224
	b .L228
.L217:
	ldr r4, [fp, #-16]
	cmp r4, #0
	bne .L215
	b .L222
.L218:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L219:
	b .L216
.L220:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L221:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L222:
	b .L216
.L223:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L224:
	mov r0, #67
	bl putch
	b .L225
.L225:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L233
	b .L238
.L226:
	ldr r4, [fp, #-16]
	cmp r4, #0
	bne .L224
	b .L231
.L227:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L228:
	b .L226
.L229:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L230:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L231:
	b .L225
.L232:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L233:
	mov r0, #72
	bl putch
	b .L234
.L234:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L244
	b .L247
.L235:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L233
	b .L241
.L236:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L237:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L238:
	b .L235
.L239:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L240:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L241:
	b .L234
.L242:
	mov r0, #73
	bl putch
	b .L243
.L243:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	beq .L254
	b .L259
.L244:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bne .L242
	b .L250
.L245:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L246:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L247:
	b .L243
.L248:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L249:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L250:
	b .L243
.L251:
	mov r0, #74
	bl putch
	b .L252
.L252:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	beq .L266
	b .L273
.L253:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L251
	b .L265
.L254:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L251
	b .L262
.L257:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L258:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L259:
	b .L253
.L260:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L261:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L262:
	b .L253
.L263:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L264:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L265:
	b .L252
.L266:
	mov r0, #75
	bl putch
	b .L267
.L267:
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L268:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L274
	b .L277
.L271:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L272:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L273:
	b .L268
.L274:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L266
	b .L280
.L275:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L276:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L277:
	b .L267
.L278:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L279:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L280:
	b .L267
addr_a0:
	.word a
addr_b0:
	.word b
addr_d0:
	.word d
