	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm arr1, 57600, 4
	.comm arr2, 107520, 4
	.text
	.global loop1
	.type loop1 , %function
loop1:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L284:
	str r0, [fp, #-36]
	str r1, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L294
.L294:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-36]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L297
	b .L300
.L295:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L304
.L296:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L297:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L295
	b .L303
.L298:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L299:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L300:
	b .L296
.L301:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L302:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L303:
	b .L296
.L304:
	ldr r4, [fp, #-24]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L305
	b .L309
.L305:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L310
.L306:
	ldr r4, [fp, #-28]
	add r5, r4, #1
	str r5, [fp, #-28]
	b .L294
.L307:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L308:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L309:
	b .L306
.L310:
	ldr r4, [fp, #-20]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L311
	b .L315
.L311:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L316
.L312:
	ldr r4, [fp, #-24]
	add r5, r4, #1
	str r5, [fp, #-24]
	b .L304
.L313:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L314:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L315:
	b .L312
.L316:
	ldr r4, [fp, #-16]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L317
	b .L321
.L317:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L322
.L318:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L310
.L319:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L320:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L321:
	b .L318
.L322:
	ldr r4, [fp, #-12]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L323
	b .L327
.L323:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L328
.L324:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L316
.L325:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L326:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L327:
	b .L324
.L328:
	ldr r4, [fp, #-8]
	cmp r4, #6
	movlt r4, #1
	movge r4, #0
	blt .L329
	b .L333
.L329:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L334
.L330:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L322
.L331:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L332:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L333:
	b .L330
.L334:
	ldr r4, [fp, #-4]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L335
	b .L339
.L335:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-20]
	add r5, r6, r4
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	add r5, r6, r4
	ldr r4, [fp, #-36]
	add r6, r5, r4
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	ldr r6, addr_arr10
	ldr r7, =5760
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-24]
	ldr r7, =2880
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-20]
	ldr r8, =960
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [fp, #-16]
	mov r7, #240
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-12]
	mov r7, #48
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #8
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L334
.L336:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L328
.L337:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L338:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L339:
	b .L336
	.global loop2
	.type loop2 , %function
loop2:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L346:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L354
.L354:
	ldr r4, [fp, #-28]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L355
	b .L359
.L355:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L360
.L356:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L357:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L358:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L359:
	b .L356
.L360:
	ldr r4, [fp, #-24]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L361
	b .L365
.L361:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L366
.L362:
	ldr r4, [fp, #-28]
	add r5, r4, #1
	str r5, [fp, #-28]
	b .L354
.L363:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L364:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L365:
	b .L362
.L366:
	ldr r4, [fp, #-20]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L367
	b .L371
.L367:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L372
.L368:
	ldr r4, [fp, #-24]
	add r5, r4, #1
	str r5, [fp, #-24]
	b .L360
.L369:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L370:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L371:
	b .L368
.L372:
	ldr r4, [fp, #-16]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L373
	b .L377
.L373:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L378
.L374:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L366
.L375:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L376:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L377:
	b .L374
.L378:
	ldr r4, [fp, #-12]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L379
	b .L383
.L379:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L384
.L380:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L372
.L381:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L382:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L383:
	b .L380
.L384:
	ldr r4, [fp, #-8]
	cmp r4, #8
	movlt r4, #1
	movge r4, #0
	blt .L385
	b .L389
.L385:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L390
.L386:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L378
.L387:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L388:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L389:
	b .L386
.L390:
	ldr r4, [fp, #-4]
	cmp r4, #7
	movlt r4, #1
	movge r4, #0
	blt .L391
	b .L395
.L391:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r4, [fp, #-28]
	ldr r5, addr_arr20
	ldr r7, =10752
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-24]
	ldr r7, =5376
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-20]
	ldr r7, =1792
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-16]
	ldr r8, =896
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [fp, #-12]
	mov r7, #224
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r8, #28
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	str r6, [r5]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L390
.L392:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L384
.L393:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L394:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L395:
	b .L392
	.global loop3
	.type loop3 , %function
loop3:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #60
.L402:
	str r0, [fp, #-60]
	str r1, [fp, #-56]
	str r2, [fp, #-52]
	str r3, [fp, #-48]
	ldr r3, [fp, #28]
	str r3, [fp, #-44]
	ldr r3, [fp, #32]
	str r3, [fp, #-40]
	ldr r3, [fp, #36]
	str r3, [fp, #-36]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-32]
	b .L418
.L418:
	ldr r4, [fp, #-32]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L419
	b .L423
.L419:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L424
.L420:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L421:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L422:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L423:
	b .L420
.L424:
	ldr r4, [fp, #-28]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L425
	b .L429
.L425:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L430
.L426:
	ldr r4, [fp, #-32]
	add r5, r4, #1
	str r5, [fp, #-32]
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-60]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L510
	b .L514
.L427:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L428:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L429:
	b .L426
.L430:
	ldr r4, [fp, #-24]
	ldr r5, =1000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L431
	b .L435
.L431:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L436
.L432:
	ldr r4, [fp, #-28]
	add r5, r4, #1
	str r5, [fp, #-28]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-56]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L504
	b .L508
.L433:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L434:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L435:
	b .L432
.L436:
	ldr r4, [fp, #-20]
	ldr r5, =10000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L437
	b .L441
.L437:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L442
.L438:
	ldr r4, [fp, #-24]
	add r5, r4, #1
	str r5, [fp, #-24]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-52]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L498
	b .L502
.L439:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L440:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L441:
	b .L438
.L442:
	ldr r4, [fp, #-16]
	ldr r5, =100000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L443
	b .L447
.L443:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L448
.L444:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-48]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L492
	b .L496
.L445:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L446:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L447:
	b .L444
.L448:
	ldr r4, [fp, #-12]
	ldr r5, =1000000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L449
	b .L453
.L449:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L454
.L450:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-44]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L486
	b .L490
.L451:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L452:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L453:
	b .L450
.L454:
	ldr r4, [fp, #-8]
	ldr r5, =10000000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L455
	b .L459
.L455:
	ldr r4, [fp, #-4]
	ldr r5, =817
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, [fp, #-32]
	ldr r5, addr_arr10
	ldr r7, =5760
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-28]
	ldr r8, =2880
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [fp, #-24]
	ldr r7, =960
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-20]
	mov r7, #240
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-16]
	mov r7, #48
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-12]
	mov r8, #8
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [fp, #-8]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, [fp, #-32]
	ldr r6, addr_arr20
	ldr r7, =10752
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-28]
	ldr r8, =5376
	mul r7, r4, r8
	add r4, r6, r7
	ldr r6, [fp, #-24]
	ldr r7, =1792
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-20]
	ldr r7, =896
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-16]
	mov r7, #224
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-12]
	mov r8, #28
	mul r7, r4, r8
	add r4, r6, r7
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L474
	b .L478
.L456:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-40]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L480
	b .L484
.L457:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L458:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L459:
	b .L456
.L474:
	b .L456
.L475:
	b .L454
.L476:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L477:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L478:
	b .L475
.L479:
	b .L475
.L480:
	b .L450
.L481:
	b .L448
.L482:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L483:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L484:
	b .L481
.L485:
	b .L481
.L486:
	b .L444
.L487:
	b .L442
.L488:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L489:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L490:
	b .L487
.L491:
	b .L487
.L492:
	b .L438
.L493:
	b .L436
.L494:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L495:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L496:
	b .L493
.L497:
	b .L493
.L498:
	b .L432
.L499:
	b .L430
.L500:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L501:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L502:
	b .L499
.L503:
	b .L499
.L504:
	b .L426
.L505:
	b .L424
.L506:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L507:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L508:
	b .L505
.L509:
	b .L505
.L510:
	b .L420
.L511:
	b .L418
.L512:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L513:
	mov r0, #0
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L514:
	b .L511
.L515:
	b .L511
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L516:
	bl getint
	mov r4, r0
	str r4, [fp, #-36]
	bl getint
	mov r4, r0
	str r4, [fp, #-32]
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	bl getint
	mov r4, r0
	str r4, [fp, #-16]
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, r4
	mov r1, r5
	bl loop1
	bl loop2
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	ldr r7, [fp, #-16]
	ldr r8, [fp, #-12]
	ldr r9, [fp, #-8]
	ldr r10, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r10}
	push {r9}
	push {r8}
	bl loop3
	add sp, sp, #12
	mov r4, r0
	mov r0, r4
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
addr_arr10:
	.word arr1
addr_arr20:
	.word arr2
