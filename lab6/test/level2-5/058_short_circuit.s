	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L58:
	str r0, [fp, #-4]
	ldr r4, addr_g0
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r4, addr_g0
	str r6, [r4]
	ldr r4, addr_g0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_g0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L60:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #10
	movgt r4, #1
	movle r4, #0
	bgt .L65
	b .L68
.L62:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L64
.L63:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L64
.L64:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #11
	movgt r4, #1
	movle r4, #0
	bgt .L75
	b .L78
.L65:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L62
	b .L70
.L66:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L67:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L68:
	b .L63
.L69:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L70:
	b .L63
.L71:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L72:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L74
.L73:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L74
.L74:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #99
	movle r4, #1
	movgt r4, #0
	ble .L82
	b .L88
.L75:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L72
	b .L80
.L76:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L77:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L78:
	b .L73
.L79:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L80:
	b .L73
.L81:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L82:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L84
.L83:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L84
.L84:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #100
	movle r4, #1
	movgt r4, #0
	ble .L92
	b .L98
.L85:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L82
	b .L90
.L86:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L87:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L88:
	b .L85
.L89:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L90:
	b .L83
.L91:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L92:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L94
.L93:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L94
.L94:
	mov r0, #99
	bl func
	mov r4, r0
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L105
	b .L108
.L95:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L92
	b .L100
.L96:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L97:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L98:
	b .L95
.L99:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L100:
	b .L93
.L101:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L102:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L104
.L103:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L104
.L104:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L105:
	mov r0, #100
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L102
	b .L111
.L107:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L108:
	b .L103
.L109:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L110:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
.L111:
	b .L103
.L112:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
addr_g0:
	.word g
