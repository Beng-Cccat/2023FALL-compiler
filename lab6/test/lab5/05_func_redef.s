	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func
	.type func , %function
func:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L31:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	.global func
	.type func , %function
func:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L33:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	ldr r4, [fp, #-4]
	add r5, r6, r4
	mov r0, r5
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr
	.global error_func
	.type error_func , %function
error_func:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L37:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr
	.global error_func
	.type error_func , %function
error_func:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L39:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L41:
	ldr r4, =0
	str r4, [fp, #-4]
	mov r0, #1
	bl func
	mov r4, r0
	mov r0, #1
	mov r1, #2
	mov r2, #3
	bl func
	mov r5, r0
	add r6, r4, r5
	str r6, [fp, #-4]
	mov r0, #1
	bl error_func
	mov r4, r0
	mov r0, #1
	bl error_func
	mov r5, r0
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr
