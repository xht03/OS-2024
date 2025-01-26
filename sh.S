
sh:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000400120 <.init>:
  400120:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400124:	910003fd 	mov	x29, sp
  400128:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40012c:	d65f03c0 	ret

Disassembly of section .text:

0000000000400130 <.text>:
  400130:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  400134:	2a0003f3 	mov	w19, w0
  400138:	d53bd041 	mrs	x1, tpidr_el0
  40013c:	b8558021 	ldur	w1, [x1, #-168]
  400140:	d0000062 	adrp	x2, 0x40e000
  400144:	912a4040 	add	x0, x2, #0xa90
  400148:	885ffc03 	ldaxr	w3, [x0]
  40014c:	35000143 	cbnz	w3, 0x400174
  400150:	912a4040 	add	x0, x2, #0xa90
  400154:	8803fc01 	stlxr	w3, w1, [x0]
  400158:	35ffff63 	cbnz	w3, 0x400144
  40015c:	34000201 	cbz	w1, 0x40019c
  400160:	94000606 	bl	0x401978
  400164:	94000606 	bl	0x40197c
  400168:	94001886 	bl	0x406380
  40016c:	2a1303e0 	mov	w0, w19
  400170:	940014a9 	bl	0x405414
  400174:	d5033bbf 	dmb	ish
  400178:	6b03003f 	cmp	w1, w3
  40017c:	54000100 	b.eq	0x40019c  // b.none
  400180:	d2800928 	mov	x8, #0x49                  	// #73
  400184:	d2800000 	mov	x0, #0x0                   	// #0
  400188:	d2800001 	mov	x1, #0x0                   	// #0
  40018c:	d2800002 	mov	x2, #0x0                   	// #0
  400190:	d2800003 	mov	x3, #0x0                   	// #0
  400194:	d4000001 	svc	#0x0
  400198:	17fffffa 	b	0x400180
  40019c:	d2800000 	mov	x0, #0x0                   	// #0
  4001a0:	3900001f 	strb	wzr, [x0]
  4001a4:	d4207d00 	brk	#0x3e8
  4001a8:	d280001d 	mov	x29, #0x0                   	// #0
  4001ac:	d280001e 	mov	x30, #0x0                   	// #0
  4001b0:	910003e0 	mov	x0, sp
  4001b4:	90000001 	adrp	x1, 0x400000
  4001b8:	91000021 	add	x1, x1, #0x0
  4001bc:	927cec1f 	and	sp, x0, #0xfffffffffffffff0
  4001c0:	14000001 	b	0x4001c4
  4001c4:	aa0003e2 	mov	x2, x0
  4001c8:	d2800005 	mov	x5, #0x0                   	// #0
  4001cc:	f0000044 	adrp	x4, 0x40b000
  4001d0:	f947cc84 	ldr	x4, [x4, #3992]
  4001d4:	f8408441 	ldr	x1, [x2], #8
  4001d8:	f0000043 	adrp	x3, 0x40b000
  4001dc:	f9478c63 	ldr	x3, [x3, #3864]
  4001e0:	f0000040 	adrp	x0, 0x40b000
  4001e4:	f947c000 	ldr	x0, [x0, #3968]
  4001e8:	14000596 	b	0x401840
  4001ec:	d503201f 	nop
  4001f0:	90000060 	adrp	x0, 0x40c000
  4001f4:	910be000 	add	x0, x0, #0x2f8
  4001f8:	90000061 	adrp	x1, 0x40c000
  4001fc:	910be021 	add	x1, x1, #0x2f8
  400200:	eb00003f 	cmp	x1, x0
  400204:	540000c0 	b.eq	0x40021c  // b.none
  400208:	f0000041 	adrp	x1, 0x40b000
  40020c:	f947b421 	ldr	x1, [x1, #3944]
  400210:	b4000061 	cbz	x1, 0x40021c
  400214:	aa0103f0 	mov	x16, x1
  400218:	d61f0200 	br	x16
  40021c:	d65f03c0 	ret
  400220:	90000060 	adrp	x0, 0x40c000
  400224:	910be000 	add	x0, x0, #0x2f8
  400228:	90000061 	adrp	x1, 0x40c000
  40022c:	910be021 	add	x1, x1, #0x2f8
  400230:	cb000021 	sub	x1, x1, x0
  400234:	d37ffc22 	lsr	x2, x1, #63
  400238:	8b810c41 	add	x1, x2, x1, asr #3
  40023c:	9341fc21 	asr	x1, x1, #1
  400240:	b40000c1 	cbz	x1, 0x400258
  400244:	f0000042 	adrp	x2, 0x40b000
  400248:	f9479c42 	ldr	x2, [x2, #3896]
  40024c:	b4000062 	cbz	x2, 0x400258
  400250:	aa0203f0 	mov	x16, x2
  400254:	d61f0200 	br	x16
  400258:	d65f03c0 	ret
  40025c:	d503201f 	nop
  400260:	d503233f 	paciasp
  400264:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  400268:	910003fd 	mov	x29, sp
  40026c:	f9000bf3 	str	x19, [sp, #16]
  400270:	90000073 	adrp	x19, 0x40c000
  400274:	394c0260 	ldrb	w0, [x19, #768]
  400278:	37000140 	tbnz	w0, #0, 0x4002a0
  40027c:	f0000040 	adrp	x0, 0x40b000
  400280:	f9477c00 	ldr	x0, [x0, #3832]
  400284:	b4000080 	cbz	x0, 0x400294
  400288:	90000060 	adrp	x0, 0x40c000
  40028c:	f9400000 	ldr	x0, [x0]
  400290:	d503201f 	nop
  400294:	97ffffd7 	bl	0x4001f0
  400298:	52800020 	mov	w0, #0x1                   	// #1
  40029c:	390c0260 	strb	w0, [x19, #768]
  4002a0:	f9400bf3 	ldr	x19, [sp, #16]
  4002a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
  4002a8:	d50323bf 	autiasp
  4002ac:	d65f03c0 	ret
  4002b0:	d503245f 	bti	c
  4002b4:	17ffffdb 	b	0x400220
  4002b8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  4002bc:	910003fd 	mov	x29, sp
  4002c0:	f9000fe0 	str	x0, [sp, #24]
  4002c4:	90000060 	adrp	x0, 0x40c000
  4002c8:	910c2000 	add	x0, x0, #0x308
  4002cc:	f9400001 	ldr	x1, [x0]
  4002d0:	f9400fe0 	ldr	x0, [sp, #24]
  4002d4:	8b000021 	add	x1, x1, x0
  4002d8:	90000060 	adrp	x0, 0x40c000
  4002dc:	910c2000 	add	x0, x0, #0x308
  4002e0:	f9000001 	str	x1, [x0]
  4002e4:	90000060 	adrp	x0, 0x40c000
  4002e8:	910c2000 	add	x0, x0, #0x308
  4002ec:	f9400001 	ldr	x1, [x0]
  4002f0:	d284e200 	mov	x0, #0x2710                	// #10000
  4002f4:	eb00003f 	cmp	x1, x0
  4002f8:	54000209 	b.ls	0x400338  // b.plast
  4002fc:	f0000044 	adrp	x4, 0x40b000
  400300:	f947d080 	ldr	x0, [x4, #4000]
  400304:	f9400000 	ldr	x0, [x0]
  400308:	aa0003e3 	mov	x3, x0
  40030c:	d2800322 	mov	x2, #0x19                  	// #25
  400310:	d2800021 	mov	x1, #0x1                   	// #1
  400314:	90000040 	adrp	x0, 0x408000
  400318:	913d4000 	add	x0, x0, #0xf50
  40031c:	f0000044 	adrp	x4, 0x40b000
  400320:	f947d484 	ldr	x4, [x4, #4008]
  400324:	d63f0080 	blr	x4
  400328:	52800020 	mov	w0, #0x1                   	// #1
  40032c:	f0000044 	adrp	x4, 0x40b000
  400330:	f947d881 	ldr	x1, [x4, #4016]
  400334:	d63f0020 	blr	x1
  400338:	90000060 	adrp	x0, 0x40c000
  40033c:	910c2000 	add	x0, x0, #0x308
  400340:	f9400001 	ldr	x1, [x0]
  400344:	f9400fe0 	ldr	x0, [sp, #24]
  400348:	cb000021 	sub	x1, x1, x0
  40034c:	90000060 	adrp	x0, 0x40c000
  400350:	910c4000 	add	x0, x0, #0x310
  400354:	8b000020 	add	x0, x1, x0
  400358:	a8c27bfd 	ldp	x29, x30, [sp], #32
  40035c:	d65f03c0 	ret
  400360:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  400364:	910003fd 	mov	x29, sp
  400368:	f9000fe0 	str	x0, [sp, #24]
  40036c:	f0000043 	adrp	x3, 0x40b000
  400370:	f947d060 	ldr	x0, [x3, #4000]
  400374:	f9400003 	ldr	x3, [x0]
  400378:	f9400fe2 	ldr	x2, [sp, #24]
  40037c:	90000040 	adrp	x0, 0x408000
  400380:	913dc001 	add	x1, x0, #0xf70
  400384:	aa0303e0 	mov	x0, x3
  400388:	f0000043 	adrp	x3, 0x40b000
  40038c:	f9479463 	ldr	x3, [x3, #3880]
  400390:	d63f0060 	blr	x3
  400394:	52800020 	mov	w0, #0x1                   	// #1
  400398:	f0000043 	adrp	x3, 0x40b000
  40039c:	f947d861 	ldr	x1, [x3, #4016]
  4003a0:	d63f0020 	blr	x1
  4003a4:	d10183ff 	sub	sp, sp, #0x60
  4003a8:	a9057bfd 	stp	x29, x30, [sp, #80]
  4003ac:	910143fd 	add	x29, sp, #0x50
  4003b0:	f90007e0 	str	x0, [sp, #8]
  4003b4:	f0000043 	adrp	x3, 0x40b000
  4003b8:	f9476860 	ldr	x0, [x3, #3792]
  4003bc:	f9400001 	ldr	x1, [x0]
  4003c0:	f90027e1 	str	x1, [sp, #72]
  4003c4:	d2800001 	mov	x1, #0x0                   	// #0
  4003c8:	f94007e0 	ldr	x0, [sp, #8]
  4003cc:	f100001f 	cmp	x0, #0x0
  4003d0:	540000a1 	b.ne	0x4003e4  // b.any
  4003d4:	52800000 	mov	w0, #0x0                   	// #0
  4003d8:	f0000043 	adrp	x3, 0x40b000
  4003dc:	f947d861 	ldr	x1, [x3, #4016]
  4003e0:	d63f0020 	blr	x1
  4003e4:	f94007e0 	ldr	x0, [sp, #8]
  4003e8:	b9400000 	ldr	w0, [x0]
  4003ec:	7100141f 	cmp	w0, #0x5
  4003f0:	54001600 	b.eq	0x4006b0  // b.none
  4003f4:	7100141f 	cmp	w0, #0x5
  4003f8:	540001ac 	b.gt	0x40042c
  4003fc:	7100101f 	cmp	w0, #0x4
  400400:	54000a80 	b.eq	0x400550  // b.none
  400404:	7100101f 	cmp	w0, #0x4
  400408:	5400012c 	b.gt	0x40042c
  40040c:	71000c1f 	cmp	w0, #0x3
  400410:	54000c00 	b.eq	0x400590  // b.none
  400414:	71000c1f 	cmp	w0, #0x3
  400418:	540000ac 	b.gt	0x40042c
  40041c:	7100041f 	cmp	w0, #0x1
  400420:	540000c0 	b.eq	0x400438  // b.none
  400424:	7100081f 	cmp	w0, #0x2
  400428:	54000480 	b.eq	0x4004b8  // b.none
  40042c:	90000040 	adrp	x0, 0x408000
  400430:	913de000 	add	x0, x0, #0xf78
  400434:	97ffffcb 	bl	0x400360
  400438:	f94007e0 	ldr	x0, [sp, #8]
  40043c:	f9001fe0 	str	x0, [sp, #56]
  400440:	f9401fe0 	ldr	x0, [sp, #56]
  400444:	f9400400 	ldr	x0, [x0, #8]
  400448:	f100001f 	cmp	x0, #0x0
  40044c:	540000a1 	b.ne	0x400460  // b.any
  400450:	52800000 	mov	w0, #0x0                   	// #0
  400454:	f0000043 	adrp	x3, 0x40b000
  400458:	f947d861 	ldr	x1, [x3, #4016]
  40045c:	d63f0020 	blr	x1
  400460:	f9401fe0 	ldr	x0, [sp, #56]
  400464:	f9400402 	ldr	x2, [x0, #8]
  400468:	f9401fe0 	ldr	x0, [sp, #56]
  40046c:	91002000 	add	x0, x0, #0x8
  400470:	aa0003e1 	mov	x1, x0
  400474:	aa0203e0 	mov	x0, x2
  400478:	f0000043 	adrp	x3, 0x40b000
  40047c:	f947b062 	ldr	x2, [x3, #3936]
  400480:	d63f0040 	blr	x2
  400484:	f0000043 	adrp	x3, 0x40b000
  400488:	f947d060 	ldr	x0, [x3, #4000]
  40048c:	f9400003 	ldr	x3, [x0]
  400490:	f9401fe0 	ldr	x0, [sp, #56]
  400494:	f9400400 	ldr	x0, [x0, #8]
  400498:	aa0003e2 	mov	x2, x0
  40049c:	90000040 	adrp	x0, 0x408000
  4004a0:	913e0001 	add	x1, x0, #0xf80
  4004a4:	aa0303e0 	mov	x0, x3
  4004a8:	f0000043 	adrp	x3, 0x40b000
  4004ac:	f9479463 	ldr	x3, [x3, #3880]
  4004b0:	d63f0060 	blr	x3
  4004b4:	14000088 	b	0x4006d4
  4004b8:	f94007e0 	ldr	x0, [sp, #8]
  4004bc:	f9001be0 	str	x0, [sp, #48]
  4004c0:	f9401be0 	ldr	x0, [sp, #48]
  4004c4:	b9402400 	ldr	w0, [x0, #36]
  4004c8:	f0000043 	adrp	x3, 0x40b000
  4004cc:	f947ec61 	ldr	x1, [x3, #4056]
  4004d0:	d63f0020 	blr	x1
  4004d4:	f9401be0 	ldr	x0, [sp, #48]
  4004d8:	f9400802 	ldr	x2, [x0, #16]
  4004dc:	f9401be0 	ldr	x0, [sp, #48]
  4004e0:	b9402000 	ldr	w0, [x0, #32]
  4004e4:	2a0003e1 	mov	w1, w0
  4004e8:	aa0203e0 	mov	x0, x2
  4004ec:	f0000043 	adrp	x3, 0x40b000
  4004f0:	f947e462 	ldr	x2, [x3, #4040]
  4004f4:	d63f0040 	blr	x2
  4004f8:	7100001f 	cmp	w0, #0x0
  4004fc:	5400022a 	b.ge	0x400540  // b.tcont
  400500:	f0000043 	adrp	x3, 0x40b000
  400504:	f947d060 	ldr	x0, [x3, #4000]
  400508:	f9400003 	ldr	x3, [x0]
  40050c:	f9401be0 	ldr	x0, [sp, #48]
  400510:	f9400800 	ldr	x0, [x0, #16]
  400514:	aa0003e2 	mov	x2, x0
  400518:	90000040 	adrp	x0, 0x408000
  40051c:	913e4001 	add	x1, x0, #0xf90
  400520:	aa0303e0 	mov	x0, x3
  400524:	f0000043 	adrp	x3, 0x40b000
  400528:	f9479463 	ldr	x3, [x3, #3880]
  40052c:	d63f0060 	blr	x3
  400530:	52800020 	mov	w0, #0x1                   	// #1
  400534:	f0000043 	adrp	x3, 0x40b000
  400538:	f947d861 	ldr	x1, [x3, #4016]
  40053c:	d63f0020 	blr	x1
  400540:	f9401be0 	ldr	x0, [sp, #48]
  400544:	f9400400 	ldr	x0, [x0, #8]
  400548:	97ffff97 	bl	0x4003a4
  40054c:	14000062 	b	0x4006d4
  400550:	f94007e0 	ldr	x0, [sp, #8]
  400554:	f90013e0 	str	x0, [sp, #32]
  400558:	94000115 	bl	0x4009ac
  40055c:	7100001f 	cmp	w0, #0x0
  400560:	54000081 	b.ne	0x400570  // b.any
  400564:	f94013e0 	ldr	x0, [sp, #32]
  400568:	f9400400 	ldr	x0, [x0, #8]
  40056c:	97ffff8e 	bl	0x4003a4
  400570:	d2800000 	mov	x0, #0x0                   	// #0
  400574:	f0000043 	adrp	x3, 0x40b000
  400578:	f947a461 	ldr	x1, [x3, #3912]
  40057c:	d63f0020 	blr	x1
  400580:	f94013e0 	ldr	x0, [sp, #32]
  400584:	f9400800 	ldr	x0, [x0, #16]
  400588:	97ffff87 	bl	0x4003a4
  40058c:	14000052 	b	0x4006d4
  400590:	f94007e0 	ldr	x0, [sp, #8]
  400594:	f90017e0 	str	x0, [sp, #40]
  400598:	910103e0 	add	x0, sp, #0x40
  40059c:	f0000043 	adrp	x3, 0x40b000
  4005a0:	f9479061 	ldr	x1, [x3, #3872]
  4005a4:	d63f0020 	blr	x1
  4005a8:	7100001f 	cmp	w0, #0x0
  4005ac:	5400008a 	b.ge	0x4005bc  // b.tcont
  4005b0:	90000040 	adrp	x0, 0x408000
  4005b4:	913e8000 	add	x0, x0, #0xfa0
  4005b8:	97ffff6a 	bl	0x400360
  4005bc:	940000fc 	bl	0x4009ac
  4005c0:	7100001f 	cmp	w0, #0x0
  4005c4:	54000281 	b.ne	0x400614  // b.any
  4005c8:	52800020 	mov	w0, #0x1                   	// #1
  4005cc:	f0000043 	adrp	x3, 0x40b000
  4005d0:	f947ec61 	ldr	x1, [x3, #4056]
  4005d4:	d63f0020 	blr	x1
  4005d8:	b94047e0 	ldr	w0, [sp, #68]
  4005dc:	f0000043 	adrp	x3, 0x40b000
  4005e0:	f947c861 	ldr	x1, [x3, #3984]
  4005e4:	d63f0020 	blr	x1
  4005e8:	b94043e0 	ldr	w0, [sp, #64]
  4005ec:	f0000043 	adrp	x3, 0x40b000
  4005f0:	f947ec61 	ldr	x1, [x3, #4056]
  4005f4:	d63f0020 	blr	x1
  4005f8:	b94047e0 	ldr	w0, [sp, #68]
  4005fc:	f0000043 	adrp	x3, 0x40b000
  400600:	f947ec61 	ldr	x1, [x3, #4056]
  400604:	d63f0020 	blr	x1
  400608:	f94017e0 	ldr	x0, [sp, #40]
  40060c:	f9400400 	ldr	x0, [x0, #8]
  400610:	97ffff65 	bl	0x4003a4
  400614:	940000e6 	bl	0x4009ac
  400618:	7100001f 	cmp	w0, #0x0
  40061c:	54000281 	b.ne	0x40066c  // b.any
  400620:	52800000 	mov	w0, #0x0                   	// #0
  400624:	f0000043 	adrp	x3, 0x40b000
  400628:	f947ec61 	ldr	x1, [x3, #4056]
  40062c:	d63f0020 	blr	x1
  400630:	b94043e0 	ldr	w0, [sp, #64]
  400634:	f0000043 	adrp	x3, 0x40b000
  400638:	f947c861 	ldr	x1, [x3, #3984]
  40063c:	d63f0020 	blr	x1
  400640:	b94043e0 	ldr	w0, [sp, #64]
  400644:	f0000043 	adrp	x3, 0x40b000
  400648:	f947ec61 	ldr	x1, [x3, #4056]
  40064c:	d63f0020 	blr	x1
  400650:	b94047e0 	ldr	w0, [sp, #68]
  400654:	f0000043 	adrp	x3, 0x40b000
  400658:	f947ec61 	ldr	x1, [x3, #4056]
  40065c:	d63f0020 	blr	x1
  400660:	f94017e0 	ldr	x0, [sp, #40]
  400664:	f9400800 	ldr	x0, [x0, #16]
  400668:	97ffff4f 	bl	0x4003a4
  40066c:	b94043e0 	ldr	w0, [sp, #64]
  400670:	f0000043 	adrp	x3, 0x40b000
  400674:	f947ec61 	ldr	x1, [x3, #4056]
  400678:	d63f0020 	blr	x1
  40067c:	b94047e0 	ldr	w0, [sp, #68]
  400680:	f0000043 	adrp	x3, 0x40b000
  400684:	f947ec61 	ldr	x1, [x3, #4056]
  400688:	d63f0020 	blr	x1
  40068c:	d2800000 	mov	x0, #0x0                   	// #0
  400690:	f0000043 	adrp	x3, 0x40b000
  400694:	f947a461 	ldr	x1, [x3, #3912]
  400698:	d63f0020 	blr	x1
  40069c:	d2800000 	mov	x0, #0x0                   	// #0
  4006a0:	f0000043 	adrp	x3, 0x40b000
  4006a4:	f947a461 	ldr	x1, [x3, #3912]
  4006a8:	d63f0020 	blr	x1
  4006ac:	1400000a 	b	0x4006d4
  4006b0:	f94007e0 	ldr	x0, [sp, #8]
  4006b4:	f9000fe0 	str	x0, [sp, #24]
  4006b8:	940000bd 	bl	0x4009ac
  4006bc:	7100001f 	cmp	w0, #0x0
  4006c0:	54000081 	b.ne	0x4006d0  // b.any
  4006c4:	f9400fe0 	ldr	x0, [sp, #24]
  4006c8:	f9400400 	ldr	x0, [x0, #8]
  4006cc:	97ffff36 	bl	0x4003a4
  4006d0:	d503201f 	nop
  4006d4:	52800000 	mov	w0, #0x0                   	// #0
  4006d8:	f0000043 	adrp	x3, 0x40b000
  4006dc:	f947d861 	ldr	x1, [x3, #4016]
  4006e0:	d63f0020 	blr	x1
  4006e4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  4006e8:	910003fd 	mov	x29, sp
  4006ec:	f9000fe0 	str	x0, [sp, #24]
  4006f0:	b90017e1 	str	w1, [sp, #20]
  4006f4:	f0000044 	adrp	x4, 0x40b000
  4006f8:	f947d080 	ldr	x0, [x4, #4000]
  4006fc:	f9400000 	ldr	x0, [x0]
  400700:	aa0003e3 	mov	x3, x0
  400704:	d2800042 	mov	x2, #0x2                   	// #2
  400708:	d2800021 	mov	x1, #0x1                   	// #1
  40070c:	90000040 	adrp	x0, 0x408000
  400710:	913ea000 	add	x0, x0, #0xfa8
  400714:	f0000044 	adrp	x4, 0x40b000
  400718:	f947d484 	ldr	x4, [x4, #4008]
  40071c:	d63f0080 	blr	x4
  400720:	b98017e0 	ldrsw	x0, [sp, #20]
  400724:	aa0003e2 	mov	x2, x0
  400728:	52800001 	mov	w1, #0x0                   	// #0
  40072c:	f9400fe0 	ldr	x0, [sp, #24]
  400730:	f0000044 	adrp	x4, 0x40b000
  400734:	f947bc83 	ldr	x3, [x4, #3960]
  400738:	d63f0060 	blr	x3
  40073c:	f0000044 	adrp	x4, 0x40b000
  400740:	f947a080 	ldr	x0, [x4, #3904]
  400744:	f9400000 	ldr	x0, [x0]
  400748:	aa0003e2 	mov	x2, x0
  40074c:	b94017e1 	ldr	w1, [sp, #20]
  400750:	f9400fe0 	ldr	x0, [sp, #24]
  400754:	f0000044 	adrp	x4, 0x40b000
  400758:	f9477483 	ldr	x3, [x4, #3816]
  40075c:	d63f0060 	blr	x3
  400760:	f9400fe0 	ldr	x0, [sp, #24]
  400764:	39400000 	ldrb	w0, [x0]
  400768:	7100001f 	cmp	w0, #0x0
  40076c:	54000061 	b.ne	0x400778  // b.any
  400770:	12800000 	mov	w0, #0xffffffff            	// #-1
  400774:	14000002 	b	0x40077c
  400778:	52800000 	mov	w0, #0x0                   	// #0
  40077c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  400780:	d65f03c0 	ret
  400784:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  400788:	910003fd 	mov	x29, sp
  40078c:	b9001fe0 	str	w0, [sp, #28]
  400790:	f9000be1 	str	x1, [sp, #16]
  400794:	b9401fe1 	ldr	w1, [sp, #28]
  400798:	90000040 	adrp	x0, 0x408000
  40079c:	913ec000 	add	x0, x0, #0xfb0
  4007a0:	f0000043 	adrp	x3, 0x40b000
  4007a4:	f9476462 	ldr	x2, [x3, #3784]
  4007a8:	d63f0040 	blr	x2
  4007ac:	b90023ff 	str	wzr, [sp, #32]
  4007b0:	14000010 	b	0x4007f0
  4007b4:	b98023e0 	ldrsw	x0, [sp, #32]
  4007b8:	d37df000 	lsl	x0, x0, #3
  4007bc:	f9400be1 	ldr	x1, [sp, #16]
  4007c0:	8b000020 	add	x0, x1, x0
  4007c4:	f9400000 	ldr	x0, [x0]
  4007c8:	aa0003e2 	mov	x2, x0
  4007cc:	b94023e1 	ldr	w1, [sp, #32]
  4007d0:	90000040 	adrp	x0, 0x408000
  4007d4:	913f0000 	add	x0, x0, #0xfc0
  4007d8:	f0000043 	adrp	x3, 0x40b000
  4007dc:	f9476463 	ldr	x3, [x3, #3784]
  4007e0:	d63f0060 	blr	x3
  4007e4:	b94023e0 	ldr	w0, [sp, #32]
  4007e8:	11000400 	add	w0, w0, #0x1
  4007ec:	b90023e0 	str	w0, [sp, #32]
  4007f0:	b94023e1 	ldr	w1, [sp, #32]
  4007f4:	b9401fe0 	ldr	w0, [sp, #28]
  4007f8:	6b00003f 	cmp	w1, w0
  4007fc:	54fffdcb 	b.lt	0x4007b4  // b.tstop
  400800:	90000040 	adrp	x0, 0x408000
  400804:	913f6000 	add	x0, x0, #0xfd8
  400808:	f0000043 	adrp	x3, 0x40b000
  40080c:	f9477061 	ldr	x1, [x3, #3808]
  400810:	d63f0020 	blr	x1
  400814:	f90017e0 	str	x0, [sp, #40]
  400818:	f94017e0 	ldr	x0, [sp, #40]
  40081c:	f100001f 	cmp	x0, #0x0
  400820:	54000100 	b.eq	0x400840  // b.none
  400824:	f94017e1 	ldr	x1, [sp, #40]
  400828:	90000040 	adrp	x0, 0x408000
  40082c:	913fa000 	add	x0, x0, #0xfe8
  400830:	f0000043 	adrp	x3, 0x40b000
  400834:	f9476462 	ldr	x2, [x3, #3784]
  400838:	d63f0040 	blr	x2
  40083c:	1400000f 	b	0x400878
  400840:	b0000040 	adrp	x0, 0x409000
  400844:	91000000 	add	x0, x0, #0x0
  400848:	f0000043 	adrp	x3, 0x40b000
  40084c:	f9477861 	ldr	x1, [x3, #3824]
  400850:	d63f0020 	blr	x1
  400854:	14000009 	b	0x400878
  400858:	b94027e0 	ldr	w0, [sp, #36]
  40085c:	7100081f 	cmp	w0, #0x2
  400860:	540000cd 	b.le	0x400878
  400864:	b94027e0 	ldr	w0, [sp, #36]
  400868:	f0000043 	adrp	x3, 0x40b000
  40086c:	f947ec61 	ldr	x1, [x3, #4056]
  400870:	d63f0020 	blr	x1
  400874:	1400000b 	b	0x4008a0
  400878:	52800041 	mov	w1, #0x2                   	// #2
  40087c:	b0000040 	adrp	x0, 0x409000
  400880:	91006000 	add	x0, x0, #0x18
  400884:	f0000043 	adrp	x3, 0x40b000
  400888:	f947e462 	ldr	x2, [x3, #4040]
  40088c:	d63f0040 	blr	x2
  400890:	b90027e0 	str	w0, [sp, #36]
  400894:	b94027e0 	ldr	w0, [sp, #36]
  400898:	7100001f 	cmp	w0, #0x0
  40089c:	54fffdea 	b.ge	0x400858  // b.tcont
  4008a0:	1400003a 	b	0x400988
  4008a4:	d0000060 	adrp	x0, 0x40e000
  4008a8:	91288000 	add	x0, x0, #0xa20
  4008ac:	39400000 	ldrb	w0, [x0]
  4008b0:	71018c1f 	cmp	w0, #0x63
  4008b4:	54000501 	b.ne	0x400954  // b.any
  4008b8:	d0000060 	adrp	x0, 0x40e000
  4008bc:	91288000 	add	x0, x0, #0xa20
  4008c0:	39400400 	ldrb	w0, [x0, #1]
  4008c4:	7101901f 	cmp	w0, #0x64
  4008c8:	54000461 	b.ne	0x400954  // b.any
  4008cc:	d0000060 	adrp	x0, 0x40e000
  4008d0:	91288000 	add	x0, x0, #0xa20
  4008d4:	39400800 	ldrb	w0, [x0, #2]
  4008d8:	7100801f 	cmp	w0, #0x20
  4008dc:	540003c1 	b.ne	0x400954  // b.any
  4008e0:	d0000060 	adrp	x0, 0x40e000
  4008e4:	91288000 	add	x0, x0, #0xa20
  4008e8:	f0000043 	adrp	x3, 0x40b000
  4008ec:	f947e061 	ldr	x1, [x3, #4032]
  4008f0:	d63f0020 	blr	x1
  4008f4:	d1000400 	sub	x0, x0, #0x1
  4008f8:	d0000061 	adrp	x1, 0x40e000
  4008fc:	91288021 	add	x1, x1, #0xa20
  400900:	3820683f 	strb	wzr, [x1, x0]
  400904:	d0000060 	adrp	x0, 0x40e000
  400908:	91288c00 	add	x0, x0, #0xa23
  40090c:	f0000043 	adrp	x3, 0x40b000
  400910:	f9479861 	ldr	x1, [x3, #3888]
  400914:	d63f0020 	blr	x1
  400918:	7100001f 	cmp	w0, #0x0
  40091c:	5400034a 	b.ge	0x400984  // b.tcont
  400920:	f0000043 	adrp	x3, 0x40b000
  400924:	f947d060 	ldr	x0, [x3, #4000]
  400928:	f9400003 	ldr	x3, [x0]
  40092c:	d0000060 	adrp	x0, 0x40e000
  400930:	91288c00 	add	x0, x0, #0xa23
  400934:	aa0003e2 	mov	x2, x0
  400938:	b0000040 	adrp	x0, 0x409000
  40093c:	91008001 	add	x1, x0, #0x20
  400940:	aa0303e0 	mov	x0, x3
  400944:	f0000043 	adrp	x3, 0x40b000
  400948:	f9479463 	ldr	x3, [x3, #3880]
  40094c:	d63f0060 	blr	x3
  400950:	1400000d 	b	0x400984
  400954:	94000016 	bl	0x4009ac
  400958:	7100001f 	cmp	w0, #0x0
  40095c:	540000a1 	b.ne	0x400970  // b.any
  400960:	d0000060 	adrp	x0, 0x40e000
  400964:	91288000 	add	x0, x0, #0xa20
  400968:	94000159 	bl	0x400ecc
  40096c:	97fffe8e 	bl	0x4003a4
  400970:	d2800000 	mov	x0, #0x0                   	// #0
  400974:	f0000043 	adrp	x3, 0x40b000
  400978:	f947a461 	ldr	x1, [x3, #3912]
  40097c:	d63f0020 	blr	x1
  400980:	14000002 	b	0x400988
  400984:	d503201f 	nop
  400988:	52800c81 	mov	w1, #0x64                  	// #100
  40098c:	d0000060 	adrp	x0, 0x40e000
  400990:	91288000 	add	x0, x0, #0xa20
  400994:	97ffff54 	bl	0x4006e4
  400998:	7100001f 	cmp	w0, #0x0
  40099c:	54fff84a 	b.ge	0x4008a4  // b.tcont
  4009a0:	52800000 	mov	w0, #0x0                   	// #0
  4009a4:	a8c37bfd 	ldp	x29, x30, [sp], #48
  4009a8:	d65f03c0 	ret
  4009ac:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  4009b0:	910003fd 	mov	x29, sp
  4009b4:	f0000040 	adrp	x0, 0x40b000
  4009b8:	f947ac00 	ldr	x0, [x0, #3928]
  4009bc:	d63f0000 	blr	x0
  4009c0:	b9001fe0 	str	w0, [sp, #28]
  4009c4:	b9401fe0 	ldr	w0, [sp, #28]
  4009c8:	3100041f 	cmn	w0, #0x1
  4009cc:	54000081 	b.ne	0x4009dc  // b.any
  4009d0:	b0000040 	adrp	x0, 0x409000
  4009d4:	9100c000 	add	x0, x0, #0x30
  4009d8:	97fffe62 	bl	0x400360
  4009dc:	b9401fe0 	ldr	w0, [sp, #28]
  4009e0:	a8c27bfd 	ldp	x29, x30, [sp], #32
  4009e4:	d65f03c0 	ret
  4009e8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  4009ec:	910003fd 	mov	x29, sp
  4009f0:	d2801500 	mov	x0, #0xa8                  	// #168
  4009f4:	97fffe31 	bl	0x4002b8
  4009f8:	f9000fe0 	str	x0, [sp, #24]
  4009fc:	d2801502 	mov	x2, #0xa8                  	// #168
  400a00:	52800001 	mov	w1, #0x0                   	// #0
  400a04:	f9400fe0 	ldr	x0, [sp, #24]
  400a08:	f0000043 	adrp	x3, 0x40b000
  400a0c:	f947bc63 	ldr	x3, [x3, #3960]
  400a10:	d63f0060 	blr	x3
  400a14:	f9400fe0 	ldr	x0, [sp, #24]
  400a18:	52800021 	mov	w1, #0x1                   	// #1
  400a1c:	b9000001 	str	w1, [x0]
  400a20:	f9400fe0 	ldr	x0, [sp, #24]
  400a24:	a8c27bfd 	ldp	x29, x30, [sp], #32
  400a28:	d65f03c0 	ret
  400a2c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  400a30:	910003fd 	mov	x29, sp
  400a34:	f90017e0 	str	x0, [sp, #40]
  400a38:	f90013e1 	str	x1, [sp, #32]
  400a3c:	f9000fe2 	str	x2, [sp, #24]
  400a40:	b90017e3 	str	w3, [sp, #20]
  400a44:	b90013e4 	str	w4, [sp, #16]
  400a48:	d2800500 	mov	x0, #0x28                  	// #40
  400a4c:	97fffe1b 	bl	0x4002b8
  400a50:	f9001fe0 	str	x0, [sp, #56]
  400a54:	d2800502 	mov	x2, #0x28                  	// #40
  400a58:	52800001 	mov	w1, #0x0                   	// #0
  400a5c:	f9401fe0 	ldr	x0, [sp, #56]
  400a60:	f0000043 	adrp	x3, 0x40b000
  400a64:	f947bc63 	ldr	x3, [x3, #3960]
  400a68:	d63f0060 	blr	x3
  400a6c:	f9401fe0 	ldr	x0, [sp, #56]
  400a70:	52800041 	mov	w1, #0x2                   	// #2
  400a74:	b9000001 	str	w1, [x0]
  400a78:	f9401fe0 	ldr	x0, [sp, #56]
  400a7c:	f94017e1 	ldr	x1, [sp, #40]
  400a80:	f9000401 	str	x1, [x0, #8]
  400a84:	f9401fe0 	ldr	x0, [sp, #56]
  400a88:	f94013e1 	ldr	x1, [sp, #32]
  400a8c:	f9000801 	str	x1, [x0, #16]
  400a90:	f9401fe0 	ldr	x0, [sp, #56]
  400a94:	f9400fe1 	ldr	x1, [sp, #24]
  400a98:	f9000c01 	str	x1, [x0, #24]
  400a9c:	f9401fe0 	ldr	x0, [sp, #56]
  400aa0:	b94017e1 	ldr	w1, [sp, #20]
  400aa4:	b9002001 	str	w1, [x0, #32]
  400aa8:	f9401fe0 	ldr	x0, [sp, #56]
  400aac:	b94013e1 	ldr	w1, [sp, #16]
  400ab0:	b9002401 	str	w1, [x0, #36]
  400ab4:	f9401fe0 	ldr	x0, [sp, #56]
  400ab8:	a8c47bfd 	ldp	x29, x30, [sp], #64
  400abc:	d65f03c0 	ret
  400ac0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  400ac4:	910003fd 	mov	x29, sp
  400ac8:	f9000fe0 	str	x0, [sp, #24]
  400acc:	f9000be1 	str	x1, [sp, #16]
  400ad0:	d2800300 	mov	x0, #0x18                  	// #24
  400ad4:	97fffdf9 	bl	0x4002b8
  400ad8:	f90017e0 	str	x0, [sp, #40]
  400adc:	d2800302 	mov	x2, #0x18                  	// #24
  400ae0:	52800001 	mov	w1, #0x0                   	// #0
  400ae4:	f94017e0 	ldr	x0, [sp, #40]
  400ae8:	f0000043 	adrp	x3, 0x40b000
  400aec:	f947bc63 	ldr	x3, [x3, #3960]
  400af0:	d63f0060 	blr	x3
  400af4:	f94017e0 	ldr	x0, [sp, #40]
  400af8:	52800061 	mov	w1, #0x3                   	// #3
  400afc:	b9000001 	str	w1, [x0]
  400b00:	f94017e0 	ldr	x0, [sp, #40]
  400b04:	f9400fe1 	ldr	x1, [sp, #24]
  400b08:	f9000401 	str	x1, [x0, #8]
  400b0c:	f94017e0 	ldr	x0, [sp, #40]
  400b10:	f9400be1 	ldr	x1, [sp, #16]
  400b14:	f9000801 	str	x1, [x0, #16]
  400b18:	f94017e0 	ldr	x0, [sp, #40]
  400b1c:	a8c37bfd 	ldp	x29, x30, [sp], #48
  400b20:	d65f03c0 	ret
  400b24:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  400b28:	910003fd 	mov	x29, sp
  400b2c:	f9000fe0 	str	x0, [sp, #24]
  400b30:	f9000be1 	str	x1, [sp, #16]
  400b34:	d2800300 	mov	x0, #0x18                  	// #24
  400b38:	97fffde0 	bl	0x4002b8
  400b3c:	f90017e0 	str	x0, [sp, #40]
  400b40:	d2800302 	mov	x2, #0x18                  	// #24
  400b44:	52800001 	mov	w1, #0x0                   	// #0
  400b48:	f94017e0 	ldr	x0, [sp, #40]
  400b4c:	f0000043 	adrp	x3, 0x40b000
  400b50:	f947bc63 	ldr	x3, [x3, #3960]
  400b54:	d63f0060 	blr	x3
  400b58:	f94017e0 	ldr	x0, [sp, #40]
  400b5c:	52800081 	mov	w1, #0x4                   	// #4
  400b60:	b9000001 	str	w1, [x0]
  400b64:	f94017e0 	ldr	x0, [sp, #40]
  400b68:	f9400fe1 	ldr	x1, [sp, #24]
  400b6c:	f9000401 	str	x1, [x0, #8]
  400b70:	f94017e0 	ldr	x0, [sp, #40]
  400b74:	f9400be1 	ldr	x1, [sp, #16]
  400b78:	f9000801 	str	x1, [x0, #16]
  400b7c:	f94017e0 	ldr	x0, [sp, #40]
  400b80:	a8c37bfd 	ldp	x29, x30, [sp], #48
  400b84:	d65f03c0 	ret
  400b88:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  400b8c:	910003fd 	mov	x29, sp
  400b90:	f9000fe0 	str	x0, [sp, #24]
  400b94:	d2800200 	mov	x0, #0x10                  	// #16
  400b98:	97fffdc8 	bl	0x4002b8
  400b9c:	f90017e0 	str	x0, [sp, #40]
  400ba0:	d2800202 	mov	x2, #0x10                  	// #16
  400ba4:	52800001 	mov	w1, #0x0                   	// #0
  400ba8:	f94017e0 	ldr	x0, [sp, #40]
  400bac:	f0000043 	adrp	x3, 0x40b000
  400bb0:	f947bc63 	ldr	x3, [x3, #3960]
  400bb4:	d63f0060 	blr	x3
  400bb8:	f94017e0 	ldr	x0, [sp, #40]
  400bbc:	528000a1 	mov	w1, #0x5                   	// #5
  400bc0:	b9000001 	str	w1, [x0]
  400bc4:	f94017e0 	ldr	x0, [sp, #40]
  400bc8:	f9400fe1 	ldr	x1, [sp, #24]
  400bcc:	f9000401 	str	x1, [x0, #8]
  400bd0:	f94017e0 	ldr	x0, [sp, #40]
  400bd4:	a8c37bfd 	ldp	x29, x30, [sp], #48
  400bd8:	d65f03c0 	ret
  400bdc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  400be0:	910003fd 	mov	x29, sp
  400be4:	f90017e0 	str	x0, [sp, #40]
  400be8:	f90013e1 	str	x1, [sp, #32]
  400bec:	f9000fe2 	str	x2, [sp, #24]
  400bf0:	f9000be3 	str	x3, [sp, #16]
  400bf4:	f94017e0 	ldr	x0, [sp, #40]
  400bf8:	f9400000 	ldr	x0, [x0]
  400bfc:	f9001fe0 	str	x0, [sp, #56]
  400c00:	14000004 	b	0x400c10
  400c04:	f9401fe0 	ldr	x0, [sp, #56]
  400c08:	91000400 	add	x0, x0, #0x1
  400c0c:	f9001fe0 	str	x0, [sp, #56]
  400c10:	f9401fe1 	ldr	x1, [sp, #56]
  400c14:	f94013e0 	ldr	x0, [sp, #32]
  400c18:	eb00003f 	cmp	x1, x0
  400c1c:	54000162 	b.cs	0x400c48  // b.hs, b.nlast
  400c20:	f9401fe0 	ldr	x0, [sp, #56]
  400c24:	39400000 	ldrb	w0, [x0]
  400c28:	2a0003e1 	mov	w1, w0
  400c2c:	90000060 	adrp	x0, 0x40c000
  400c30:	91002000 	add	x0, x0, #0x8
  400c34:	f0000042 	adrp	x2, 0x40b000
  400c38:	f947e842 	ldr	x2, [x2, #4048]
  400c3c:	d63f0040 	blr	x2
  400c40:	f100001f 	cmp	x0, #0x0
  400c44:	54fffe01 	b.ne	0x400c04  // b.any
  400c48:	f9400fe0 	ldr	x0, [sp, #24]
  400c4c:	f100001f 	cmp	x0, #0x0
  400c50:	54000080 	b.eq	0x400c60  // b.none
  400c54:	f9400fe0 	ldr	x0, [sp, #24]
  400c58:	f9401fe1 	ldr	x1, [sp, #56]
  400c5c:	f9000001 	str	x1, [x0]
  400c60:	f9401fe0 	ldr	x0, [sp, #56]
  400c64:	39400000 	ldrb	w0, [x0]
  400c68:	b90037e0 	str	w0, [sp, #52]
  400c6c:	f9401fe0 	ldr	x0, [sp, #56]
  400c70:	39400000 	ldrb	w0, [x0]
  400c74:	7101f01f 	cmp	w0, #0x7c
  400c78:	54000260 	b.eq	0x400cc4  // b.none
  400c7c:	7101f01f 	cmp	w0, #0x7c
  400c80:	5400044c 	b.gt	0x400d08
  400c84:	7100f81f 	cmp	w0, #0x3e
  400c88:	54000260 	b.eq	0x400cd4  // b.none
  400c8c:	7100f81f 	cmp	w0, #0x3e
  400c90:	540003cc 	b.gt	0x400d08
  400c94:	7100f01f 	cmp	w0, #0x3c
  400c98:	5400038c 	b.gt	0x400d08
  400c9c:	7100ec1f 	cmp	w0, #0x3b
  400ca0:	5400012a 	b.ge	0x400cc4  // b.tcont
  400ca4:	7100a41f 	cmp	w0, #0x29
  400ca8:	5400030c 	b.gt	0x400d08
  400cac:	7100a01f 	cmp	w0, #0x28
  400cb0:	540000aa 	b.ge	0x400cc4  // b.tcont
  400cb4:	7100001f 	cmp	w0, #0x0
  400cb8:	54000660 	b.eq	0x400d84  // b.none
  400cbc:	7100981f 	cmp	w0, #0x26
  400cc0:	54000241 	b.ne	0x400d08  // b.any
  400cc4:	f9401fe0 	ldr	x0, [sp, #56]
  400cc8:	91000400 	add	x0, x0, #0x1
  400ccc:	f9001fe0 	str	x0, [sp, #56]
  400cd0:	14000032 	b	0x400d98
  400cd4:	f9401fe0 	ldr	x0, [sp, #56]
  400cd8:	91000400 	add	x0, x0, #0x1
  400cdc:	f9001fe0 	str	x0, [sp, #56]
  400ce0:	f9401fe0 	ldr	x0, [sp, #56]
  400ce4:	39400000 	ldrb	w0, [x0]
  400ce8:	7100f81f 	cmp	w0, #0x3e
  400cec:	54000501 	b.ne	0x400d8c  // b.any
  400cf0:	52800560 	mov	w0, #0x2b                  	// #43
  400cf4:	b90037e0 	str	w0, [sp, #52]
  400cf8:	f9401fe0 	ldr	x0, [sp, #56]
  400cfc:	91000400 	add	x0, x0, #0x1
  400d00:	f9001fe0 	str	x0, [sp, #56]
  400d04:	14000022 	b	0x400d8c
  400d08:	52800c20 	mov	w0, #0x61                  	// #97
  400d0c:	b90037e0 	str	w0, [sp, #52]
  400d10:	14000004 	b	0x400d20
  400d14:	f9401fe0 	ldr	x0, [sp, #56]
  400d18:	91000400 	add	x0, x0, #0x1
  400d1c:	f9001fe0 	str	x0, [sp, #56]
  400d20:	f9401fe1 	ldr	x1, [sp, #56]
  400d24:	f94013e0 	ldr	x0, [sp, #32]
  400d28:	eb00003f 	cmp	x1, x0
  400d2c:	54000342 	b.cs	0x400d94  // b.hs, b.nlast
  400d30:	f9401fe0 	ldr	x0, [sp, #56]
  400d34:	39400000 	ldrb	w0, [x0]
  400d38:	2a0003e1 	mov	w1, w0
  400d3c:	90000060 	adrp	x0, 0x40c000
  400d40:	91002000 	add	x0, x0, #0x8
  400d44:	f0000042 	adrp	x2, 0x40b000
  400d48:	f947e842 	ldr	x2, [x2, #4048]
  400d4c:	d63f0040 	blr	x2
  400d50:	f100001f 	cmp	x0, #0x0
  400d54:	54000201 	b.ne	0x400d94  // b.any
  400d58:	f9401fe0 	ldr	x0, [sp, #56]
  400d5c:	39400000 	ldrb	w0, [x0]
  400d60:	2a0003e1 	mov	w1, w0
  400d64:	90000060 	adrp	x0, 0x40c000
  400d68:	91004000 	add	x0, x0, #0x10
  400d6c:	f0000042 	adrp	x2, 0x40b000
  400d70:	f947e842 	ldr	x2, [x2, #4048]
  400d74:	d63f0040 	blr	x2
  400d78:	f100001f 	cmp	x0, #0x0
  400d7c:	54fffcc0 	b.eq	0x400d14  // b.none
  400d80:	14000005 	b	0x400d94
  400d84:	d503201f 	nop
  400d88:	14000004 	b	0x400d98
  400d8c:	d503201f 	nop
  400d90:	14000002 	b	0x400d98
  400d94:	d503201f 	nop
  400d98:	f9400be0 	ldr	x0, [sp, #16]
  400d9c:	f100001f 	cmp	x0, #0x0
  400da0:	54000100 	b.eq	0x400dc0  // b.none
  400da4:	f9400be0 	ldr	x0, [sp, #16]
  400da8:	f9401fe1 	ldr	x1, [sp, #56]
  400dac:	f9000001 	str	x1, [x0]
  400db0:	14000004 	b	0x400dc0
  400db4:	f9401fe0 	ldr	x0, [sp, #56]
  400db8:	91000400 	add	x0, x0, #0x1
  400dbc:	f9001fe0 	str	x0, [sp, #56]
  400dc0:	f9401fe1 	ldr	x1, [sp, #56]
  400dc4:	f94013e0 	ldr	x0, [sp, #32]
  400dc8:	eb00003f 	cmp	x1, x0
  400dcc:	54000162 	b.cs	0x400df8  // b.hs, b.nlast
  400dd0:	f9401fe0 	ldr	x0, [sp, #56]
  400dd4:	39400000 	ldrb	w0, [x0]
  400dd8:	2a0003e1 	mov	w1, w0
  400ddc:	90000060 	adrp	x0, 0x40c000
  400de0:	91002000 	add	x0, x0, #0x8
  400de4:	f0000042 	adrp	x2, 0x40b000
  400de8:	f947e842 	ldr	x2, [x2, #4048]
  400dec:	d63f0040 	blr	x2
  400df0:	f100001f 	cmp	x0, #0x0
  400df4:	54fffe01 	b.ne	0x400db4  // b.any
  400df8:	f94017e0 	ldr	x0, [sp, #40]
  400dfc:	f9401fe1 	ldr	x1, [sp, #56]
  400e00:	f9000001 	str	x1, [x0]
  400e04:	b94037e0 	ldr	w0, [sp, #52]
  400e08:	a8c47bfd 	ldp	x29, x30, [sp], #64
  400e0c:	d65f03c0 	ret
  400e10:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  400e14:	910003fd 	mov	x29, sp
  400e18:	f90017e0 	str	x0, [sp, #40]
  400e1c:	f90013e1 	str	x1, [sp, #32]
  400e20:	f9000fe2 	str	x2, [sp, #24]
  400e24:	f94017e0 	ldr	x0, [sp, #40]
  400e28:	f9400000 	ldr	x0, [x0]
  400e2c:	f9001fe0 	str	x0, [sp, #56]
  400e30:	14000004 	b	0x400e40
  400e34:	f9401fe0 	ldr	x0, [sp, #56]
  400e38:	91000400 	add	x0, x0, #0x1
  400e3c:	f9001fe0 	str	x0, [sp, #56]
  400e40:	f9401fe1 	ldr	x1, [sp, #56]
  400e44:	f94013e0 	ldr	x0, [sp, #32]
  400e48:	eb00003f 	cmp	x1, x0
  400e4c:	54000162 	b.cs	0x400e78  // b.hs, b.nlast
  400e50:	f9401fe0 	ldr	x0, [sp, #56]
  400e54:	39400000 	ldrb	w0, [x0]
  400e58:	2a0003e1 	mov	w1, w0
  400e5c:	90000060 	adrp	x0, 0x40c000
  400e60:	91002000 	add	x0, x0, #0x8
  400e64:	f0000042 	adrp	x2, 0x40b000
  400e68:	f947e842 	ldr	x2, [x2, #4048]
  400e6c:	d63f0040 	blr	x2
  400e70:	f100001f 	cmp	x0, #0x0
  400e74:	54fffe01 	b.ne	0x400e34  // b.any
  400e78:	f94017e0 	ldr	x0, [sp, #40]
  400e7c:	f9401fe1 	ldr	x1, [sp, #56]
  400e80:	f9000001 	str	x1, [x0]
  400e84:	f9401fe0 	ldr	x0, [sp, #56]
  400e88:	39400000 	ldrb	w0, [x0]
  400e8c:	7100001f 	cmp	w0, #0x0
  400e90:	54000180 	b.eq	0x400ec0  // b.none
  400e94:	f9401fe0 	ldr	x0, [sp, #56]
  400e98:	39400000 	ldrb	w0, [x0]
  400e9c:	2a0003e1 	mov	w1, w0
  400ea0:	f9400fe0 	ldr	x0, [sp, #24]
  400ea4:	f0000042 	adrp	x2, 0x40b000
  400ea8:	f947e842 	ldr	x2, [x2, #4048]
  400eac:	d63f0040 	blr	x2
  400eb0:	f100001f 	cmp	x0, #0x0
  400eb4:	54000060 	b.eq	0x400ec0  // b.none
  400eb8:	52800020 	mov	w0, #0x1                   	// #1
  400ebc:	14000002 	b	0x400ec4
  400ec0:	52800000 	mov	w0, #0x0                   	// #0
  400ec4:	a8c47bfd 	ldp	x29, x30, [sp], #64
  400ec8:	d65f03c0 	ret
  400ecc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  400ed0:	910003fd 	mov	x29, sp
  400ed4:	f9000bf3 	str	x19, [sp, #16]
  400ed8:	f90017e0 	str	x0, [sp, #40]
  400edc:	f94017f3 	ldr	x19, [sp, #40]
  400ee0:	f94017e0 	ldr	x0, [sp, #40]
  400ee4:	f0000043 	adrp	x3, 0x40b000
  400ee8:	f947e061 	ldr	x1, [x3, #4032]
  400eec:	d63f0020 	blr	x1
  400ef0:	8b000260 	add	x0, x19, x0
  400ef4:	f9001be0 	str	x0, [sp, #48]
  400ef8:	9100a3e0 	add	x0, sp, #0x28
  400efc:	f9401be1 	ldr	x1, [sp, #48]
  400f00:	94000020 	bl	0x400f80
  400f04:	f9001fe0 	str	x0, [sp, #56]
  400f08:	9100a3e3 	add	x3, sp, #0x28
  400f0c:	b0000040 	adrp	x0, 0x409000
  400f10:	9100e002 	add	x2, x0, #0x38
  400f14:	f9401be1 	ldr	x1, [sp, #48]
  400f18:	aa0303e0 	mov	x0, x3
  400f1c:	97ffffbd 	bl	0x400e10
  400f20:	f94017e0 	ldr	x0, [sp, #40]
  400f24:	f9401be1 	ldr	x1, [sp, #48]
  400f28:	eb00003f 	cmp	x1, x0
  400f2c:	540001e0 	b.eq	0x400f68  // b.none
  400f30:	f0000043 	adrp	x3, 0x40b000
  400f34:	f947d060 	ldr	x0, [x3, #4000]
  400f38:	f9400003 	ldr	x3, [x0]
  400f3c:	f94017e0 	ldr	x0, [sp, #40]
  400f40:	aa0003e2 	mov	x2, x0
  400f44:	b0000040 	adrp	x0, 0x409000
  400f48:	91010001 	add	x1, x0, #0x40
  400f4c:	aa0303e0 	mov	x0, x3
  400f50:	f0000043 	adrp	x3, 0x40b000
  400f54:	f9479463 	ldr	x3, [x3, #3880]
  400f58:	d63f0060 	blr	x3
  400f5c:	b0000040 	adrp	x0, 0x409000
  400f60:	91014000 	add	x0, x0, #0x50
  400f64:	97fffcff 	bl	0x400360
  400f68:	f9401fe0 	ldr	x0, [sp, #56]
  400f6c:	9400014e 	bl	0x4014a4
  400f70:	f9401fe0 	ldr	x0, [sp, #56]
  400f74:	f9400bf3 	ldr	x19, [sp, #16]
  400f78:	a8c47bfd 	ldp	x29, x30, [sp], #64
  400f7c:	d65f03c0 	ret
  400f80:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  400f84:	910003fd 	mov	x29, sp
  400f88:	f9000fe0 	str	x0, [sp, #24]
  400f8c:	f9000be1 	str	x1, [sp, #16]
  400f90:	f9400be1 	ldr	x1, [sp, #16]
  400f94:	f9400fe0 	ldr	x0, [sp, #24]
  400f98:	94000028 	bl	0x401038
  400f9c:	f90017e0 	str	x0, [sp, #40]
  400fa0:	14000009 	b	0x400fc4
  400fa4:	d2800003 	mov	x3, #0x0                   	// #0
  400fa8:	d2800002 	mov	x2, #0x0                   	// #0
  400fac:	f9400be1 	ldr	x1, [sp, #16]
  400fb0:	f9400fe0 	ldr	x0, [sp, #24]
  400fb4:	97ffff0a 	bl	0x400bdc
  400fb8:	f94017e0 	ldr	x0, [sp, #40]
  400fbc:	97fffef3 	bl	0x400b88
  400fc0:	f90017e0 	str	x0, [sp, #40]
  400fc4:	b0000040 	adrp	x0, 0x409000
  400fc8:	91016002 	add	x2, x0, #0x58
  400fcc:	f9400be1 	ldr	x1, [sp, #16]
  400fd0:	f9400fe0 	ldr	x0, [sp, #24]
  400fd4:	97ffff8f 	bl	0x400e10
  400fd8:	7100001f 	cmp	w0, #0x0
  400fdc:	54fffe41 	b.ne	0x400fa4  // b.any
  400fe0:	b0000040 	adrp	x0, 0x409000
  400fe4:	91018002 	add	x2, x0, #0x60
  400fe8:	f9400be1 	ldr	x1, [sp, #16]
  400fec:	f9400fe0 	ldr	x0, [sp, #24]
  400ff0:	97ffff88 	bl	0x400e10
  400ff4:	7100001f 	cmp	w0, #0x0
  400ff8:	540001a0 	b.eq	0x40102c  // b.none
  400ffc:	d2800003 	mov	x3, #0x0                   	// #0
  401000:	d2800002 	mov	x2, #0x0                   	// #0
  401004:	f9400be1 	ldr	x1, [sp, #16]
  401008:	f9400fe0 	ldr	x0, [sp, #24]
  40100c:	97fffef4 	bl	0x400bdc
  401010:	f9400be1 	ldr	x1, [sp, #16]
  401014:	f9400fe0 	ldr	x0, [sp, #24]
  401018:	97ffffda 	bl	0x400f80
  40101c:	aa0003e1 	mov	x1, x0
  401020:	f94017e0 	ldr	x0, [sp, #40]
  401024:	97fffec0 	bl	0x400b24
  401028:	f90017e0 	str	x0, [sp, #40]
  40102c:	f94017e0 	ldr	x0, [sp, #40]
  401030:	a8c37bfd 	ldp	x29, x30, [sp], #48
  401034:	d65f03c0 	ret
  401038:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  40103c:	910003fd 	mov	x29, sp
  401040:	f9000fe0 	str	x0, [sp, #24]
  401044:	f9000be1 	str	x1, [sp, #16]
  401048:	f9400be1 	ldr	x1, [sp, #16]
  40104c:	f9400fe0 	ldr	x0, [sp, #24]
  401050:	940000a5 	bl	0x4012e4
  401054:	f90017e0 	str	x0, [sp, #40]
  401058:	90000040 	adrp	x0, 0x409000
  40105c:	9101a002 	add	x2, x0, #0x68
  401060:	f9400be1 	ldr	x1, [sp, #16]
  401064:	f9400fe0 	ldr	x0, [sp, #24]
  401068:	97ffff6a 	bl	0x400e10
  40106c:	7100001f 	cmp	w0, #0x0
  401070:	540001a0 	b.eq	0x4010a4  // b.none
  401074:	d2800003 	mov	x3, #0x0                   	// #0
  401078:	d2800002 	mov	x2, #0x0                   	// #0
  40107c:	f9400be1 	ldr	x1, [sp, #16]
  401080:	f9400fe0 	ldr	x0, [sp, #24]
  401084:	97fffed6 	bl	0x400bdc
  401088:	f9400be1 	ldr	x1, [sp, #16]
  40108c:	f9400fe0 	ldr	x0, [sp, #24]
  401090:	97ffffea 	bl	0x401038
  401094:	aa0003e1 	mov	x1, x0
  401098:	f94017e0 	ldr	x0, [sp, #40]
  40109c:	97fffe89 	bl	0x400ac0
  4010a0:	f90017e0 	str	x0, [sp, #40]
  4010a4:	f94017e0 	ldr	x0, [sp, #40]
  4010a8:	a8c37bfd 	ldp	x29, x30, [sp], #48
  4010ac:	d65f03c0 	ret
  4010b0:	d10143ff 	sub	sp, sp, #0x50
  4010b4:	a9047bfd 	stp	x29, x30, [sp, #64]
  4010b8:	910103fd 	add	x29, sp, #0x40
  4010bc:	f9000fe0 	str	x0, [sp, #24]
  4010c0:	f9000be1 	str	x1, [sp, #16]
  4010c4:	f90007e2 	str	x2, [sp, #8]
  4010c8:	d0000040 	adrp	x0, 0x40b000
  4010cc:	f9476800 	ldr	x0, [x0, #3792]
  4010d0:	f9400001 	ldr	x1, [x0]
  4010d4:	f9001fe1 	str	x1, [sp, #56]
  4010d8:	d2800001 	mov	x1, #0x0                   	// #0
  4010dc:	1400003d 	b	0x4011d0
  4010e0:	d2800003 	mov	x3, #0x0                   	// #0
  4010e4:	d2800002 	mov	x2, #0x0                   	// #0
  4010e8:	f94007e1 	ldr	x1, [sp, #8]
  4010ec:	f9400be0 	ldr	x0, [sp, #16]
  4010f0:	97fffebb 	bl	0x400bdc
  4010f4:	b90027e0 	str	w0, [sp, #36]
  4010f8:	9100c3e1 	add	x1, sp, #0x30
  4010fc:	9100a3e0 	add	x0, sp, #0x28
  401100:	aa0103e3 	mov	x3, x1
  401104:	aa0003e2 	mov	x2, x0
  401108:	f94007e1 	ldr	x1, [sp, #8]
  40110c:	f9400be0 	ldr	x0, [sp, #16]
  401110:	97fffeb3 	bl	0x400bdc
  401114:	7101841f 	cmp	w0, #0x61
  401118:	54000080 	b.eq	0x401128  // b.none
  40111c:	90000040 	adrp	x0, 0x409000
  401120:	9101c000 	add	x0, x0, #0x70
  401124:	97fffc8f 	bl	0x400360
  401128:	b94027e0 	ldr	w0, [sp, #36]
  40112c:	7100f81f 	cmp	w0, #0x3e
  401130:	54000280 	b.eq	0x401180  // b.none
  401134:	b94027e0 	ldr	w0, [sp, #36]
  401138:	7100f81f 	cmp	w0, #0x3e
  40113c:	540004ac 	b.gt	0x4011d0
  401140:	b94027e0 	ldr	w0, [sp, #36]
  401144:	7100ac1f 	cmp	w0, #0x2b
  401148:	54000300 	b.eq	0x4011a8  // b.none
  40114c:	b94027e0 	ldr	w0, [sp, #36]
  401150:	7100f01f 	cmp	w0, #0x3c
  401154:	540003e1 	b.ne	0x4011d0  // b.any
  401158:	f94017e0 	ldr	x0, [sp, #40]
  40115c:	f9401be1 	ldr	x1, [sp, #48]
  401160:	52800004 	mov	w4, #0x0                   	// #0
  401164:	52800003 	mov	w3, #0x0                   	// #0
  401168:	aa0103e2 	mov	x2, x1
  40116c:	aa0003e1 	mov	x1, x0
  401170:	f9400fe0 	ldr	x0, [sp, #24]
  401174:	97fffe2e 	bl	0x400a2c
  401178:	f9000fe0 	str	x0, [sp, #24]
  40117c:	14000015 	b	0x4011d0
  401180:	f94017e0 	ldr	x0, [sp, #40]
  401184:	f9401be1 	ldr	x1, [sp, #48]
  401188:	52800024 	mov	w4, #0x1                   	// #1
  40118c:	52800823 	mov	w3, #0x41                  	// #65
  401190:	aa0103e2 	mov	x2, x1
  401194:	aa0003e1 	mov	x1, x0
  401198:	f9400fe0 	ldr	x0, [sp, #24]
  40119c:	97fffe24 	bl	0x400a2c
  4011a0:	f9000fe0 	str	x0, [sp, #24]
  4011a4:	1400000b 	b	0x4011d0
  4011a8:	f94017e0 	ldr	x0, [sp, #40]
  4011ac:	f9401be1 	ldr	x1, [sp, #48]
  4011b0:	52800024 	mov	w4, #0x1                   	// #1
  4011b4:	52800823 	mov	w3, #0x41                  	// #65
  4011b8:	aa0103e2 	mov	x2, x1
  4011bc:	aa0003e1 	mov	x1, x0
  4011c0:	f9400fe0 	ldr	x0, [sp, #24]
  4011c4:	97fffe1a 	bl	0x400a2c
  4011c8:	f9000fe0 	str	x0, [sp, #24]
  4011cc:	d503201f 	nop
  4011d0:	90000040 	adrp	x0, 0x409000
  4011d4:	91024002 	add	x2, x0, #0x90
  4011d8:	f94007e1 	ldr	x1, [sp, #8]
  4011dc:	f9400be0 	ldr	x0, [sp, #16]
  4011e0:	97ffff0c 	bl	0x400e10
  4011e4:	7100001f 	cmp	w0, #0x0
  4011e8:	54fff7c1 	b.ne	0x4010e0  // b.any
  4011ec:	f9400fe0 	ldr	x0, [sp, #24]
  4011f0:	aa0003e1 	mov	x1, x0
  4011f4:	d0000040 	adrp	x0, 0x40b000
  4011f8:	f9476800 	ldr	x0, [x0, #3792]
  4011fc:	f9401fe3 	ldr	x3, [sp, #56]
  401200:	f9400002 	ldr	x2, [x0]
  401204:	eb020063 	subs	x3, x3, x2
  401208:	d2800002 	mov	x2, #0x0                   	// #0
  40120c:	54000080 	b.eq	0x40121c  // b.none
  401210:	d0000040 	adrp	x0, 0x40b000
  401214:	f9478800 	ldr	x0, [x0, #3856]
  401218:	d63f0000 	blr	x0
  40121c:	aa0103e0 	mov	x0, x1
  401220:	a9447bfd 	ldp	x29, x30, [sp, #64]
  401224:	910143ff 	add	sp, sp, #0x50
  401228:	d65f03c0 	ret
  40122c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  401230:	910003fd 	mov	x29, sp
  401234:	f9000fe0 	str	x0, [sp, #24]
  401238:	f9000be1 	str	x1, [sp, #16]
  40123c:	90000040 	adrp	x0, 0x409000
  401240:	91026002 	add	x2, x0, #0x98
  401244:	f9400be1 	ldr	x1, [sp, #16]
  401248:	f9400fe0 	ldr	x0, [sp, #24]
  40124c:	97fffef1 	bl	0x400e10
  401250:	7100001f 	cmp	w0, #0x0
  401254:	54000081 	b.ne	0x401264  // b.any
  401258:	90000040 	adrp	x0, 0x409000
  40125c:	91028000 	add	x0, x0, #0xa0
  401260:	97fffc40 	bl	0x400360
  401264:	d2800003 	mov	x3, #0x0                   	// #0
  401268:	d2800002 	mov	x2, #0x0                   	// #0
  40126c:	f9400be1 	ldr	x1, [sp, #16]
  401270:	f9400fe0 	ldr	x0, [sp, #24]
  401274:	97fffe5a 	bl	0x400bdc
  401278:	f9400be1 	ldr	x1, [sp, #16]
  40127c:	f9400fe0 	ldr	x0, [sp, #24]
  401280:	97ffff40 	bl	0x400f80
  401284:	f90017e0 	str	x0, [sp, #40]
  401288:	90000040 	adrp	x0, 0x409000
  40128c:	9102c002 	add	x2, x0, #0xb0
  401290:	f9400be1 	ldr	x1, [sp, #16]
  401294:	f9400fe0 	ldr	x0, [sp, #24]
  401298:	97fffede 	bl	0x400e10
  40129c:	7100001f 	cmp	w0, #0x0
  4012a0:	54000081 	b.ne	0x4012b0  // b.any
  4012a4:	90000040 	adrp	x0, 0x409000
  4012a8:	9102e000 	add	x0, x0, #0xb8
  4012ac:	97fffc2d 	bl	0x400360
  4012b0:	d2800003 	mov	x3, #0x0                   	// #0
  4012b4:	d2800002 	mov	x2, #0x0                   	// #0
  4012b8:	f9400be1 	ldr	x1, [sp, #16]
  4012bc:	f9400fe0 	ldr	x0, [sp, #24]
  4012c0:	97fffe47 	bl	0x400bdc
  4012c4:	f9400be2 	ldr	x2, [sp, #16]
  4012c8:	f9400fe1 	ldr	x1, [sp, #24]
  4012cc:	f94017e0 	ldr	x0, [sp, #40]
  4012d0:	97ffff78 	bl	0x4010b0
  4012d4:	f90017e0 	str	x0, [sp, #40]
  4012d8:	f94017e0 	ldr	x0, [sp, #40]
  4012dc:	a8c37bfd 	ldp	x29, x30, [sp], #48
  4012e0:	d65f03c0 	ret
  4012e4:	d10143ff 	sub	sp, sp, #0x50
  4012e8:	a9047bfd 	stp	x29, x30, [sp, #64]
  4012ec:	910103fd 	add	x29, sp, #0x40
  4012f0:	f90007e0 	str	x0, [sp, #8]
  4012f4:	f90003e1 	str	x1, [sp]
  4012f8:	d0000040 	adrp	x0, 0x40b000
  4012fc:	f9476800 	ldr	x0, [x0, #3792]
  401300:	f9400001 	ldr	x1, [x0]
  401304:	f9001fe1 	str	x1, [sp, #56]
  401308:	d2800001 	mov	x1, #0x0                   	// #0
  40130c:	90000040 	adrp	x0, 0x409000
  401310:	91026002 	add	x2, x0, #0x98
  401314:	f94003e1 	ldr	x1, [sp]
  401318:	f94007e0 	ldr	x0, [sp, #8]
  40131c:	97fffebd 	bl	0x400e10
  401320:	7100001f 	cmp	w0, #0x0
  401324:	540000a0 	b.eq	0x401338  // b.none
  401328:	f94003e1 	ldr	x1, [sp]
  40132c:	f94007e0 	ldr	x0, [sp, #8]
  401330:	97ffffbf 	bl	0x40122c
  401334:	1400004d 	b	0x401468
  401338:	97fffdac 	bl	0x4009e8
  40133c:	f90017e0 	str	x0, [sp, #40]
  401340:	f94017e0 	ldr	x0, [sp, #40]
  401344:	f9001be0 	str	x0, [sp, #48]
  401348:	b90013ff 	str	wzr, [sp, #16]
  40134c:	f94003e2 	ldr	x2, [sp]
  401350:	f94007e1 	ldr	x1, [sp, #8]
  401354:	f94017e0 	ldr	x0, [sp, #40]
  401358:	97ffff56 	bl	0x4010b0
  40135c:	f90017e0 	str	x0, [sp, #40]
  401360:	1400002d 	b	0x401414
  401364:	910083e1 	add	x1, sp, #0x20
  401368:	910063e0 	add	x0, sp, #0x18
  40136c:	aa0103e3 	mov	x3, x1
  401370:	aa0003e2 	mov	x2, x0
  401374:	f94003e1 	ldr	x1, [sp]
  401378:	f94007e0 	ldr	x0, [sp, #8]
  40137c:	97fffe18 	bl	0x400bdc
  401380:	b90017e0 	str	w0, [sp, #20]
  401384:	b94017e0 	ldr	w0, [sp, #20]
  401388:	7100001f 	cmp	w0, #0x0
  40138c:	54000540 	b.eq	0x401434  // b.none
  401390:	b94017e0 	ldr	w0, [sp, #20]
  401394:	7101841f 	cmp	w0, #0x61
  401398:	54000080 	b.eq	0x4013a8  // b.none
  40139c:	90000040 	adrp	x0, 0x409000
  4013a0:	91014000 	add	x0, x0, #0x50
  4013a4:	97fffbef 	bl	0x400360
  4013a8:	f9400fe1 	ldr	x1, [sp, #24]
  4013ac:	f9401be2 	ldr	x2, [sp, #48]
  4013b0:	b98013e0 	ldrsw	x0, [sp, #16]
  4013b4:	d37df000 	lsl	x0, x0, #3
  4013b8:	8b000040 	add	x0, x2, x0
  4013bc:	f9000401 	str	x1, [x0, #8]
  4013c0:	f94013e1 	ldr	x1, [sp, #32]
  4013c4:	f9401be2 	ldr	x2, [sp, #48]
  4013c8:	b98013e0 	ldrsw	x0, [sp, #16]
  4013cc:	91002800 	add	x0, x0, #0xa
  4013d0:	d37df000 	lsl	x0, x0, #3
  4013d4:	8b000040 	add	x0, x2, x0
  4013d8:	f9000401 	str	x1, [x0, #8]
  4013dc:	b94013e0 	ldr	w0, [sp, #16]
  4013e0:	11000400 	add	w0, w0, #0x1
  4013e4:	b90013e0 	str	w0, [sp, #16]
  4013e8:	b94013e0 	ldr	w0, [sp, #16]
  4013ec:	7100241f 	cmp	w0, #0x9
  4013f0:	5400008d 	b.le	0x401400
  4013f4:	90000040 	adrp	x0, 0x409000
  4013f8:	91034000 	add	x0, x0, #0xd0
  4013fc:	97fffbd9 	bl	0x400360
  401400:	f94003e2 	ldr	x2, [sp]
  401404:	f94007e1 	ldr	x1, [sp, #8]
  401408:	f94017e0 	ldr	x0, [sp, #40]
  40140c:	97ffff29 	bl	0x4010b0
  401410:	f90017e0 	str	x0, [sp, #40]
  401414:	90000040 	adrp	x0, 0x409000
  401418:	91038002 	add	x2, x0, #0xe0
  40141c:	f94003e1 	ldr	x1, [sp]
  401420:	f94007e0 	ldr	x0, [sp, #8]
  401424:	97fffe7b 	bl	0x400e10
  401428:	7100001f 	cmp	w0, #0x0
  40142c:	54fff9c0 	b.eq	0x401364  // b.none
  401430:	14000002 	b	0x401438
  401434:	d503201f 	nop
  401438:	f9401be1 	ldr	x1, [sp, #48]
  40143c:	b98013e0 	ldrsw	x0, [sp, #16]
  401440:	d37df000 	lsl	x0, x0, #3
  401444:	8b000020 	add	x0, x1, x0
  401448:	f900041f 	str	xzr, [x0, #8]
  40144c:	f9401be1 	ldr	x1, [sp, #48]
  401450:	b98013e0 	ldrsw	x0, [sp, #16]
  401454:	91002800 	add	x0, x0, #0xa
  401458:	d37df000 	lsl	x0, x0, #3
  40145c:	8b000020 	add	x0, x1, x0
  401460:	f900041f 	str	xzr, [x0, #8]
  401464:	f94017e0 	ldr	x0, [sp, #40]
  401468:	aa0003e1 	mov	x1, x0
  40146c:	d0000040 	adrp	x0, 0x40b000
  401470:	f9476800 	ldr	x0, [x0, #3792]
  401474:	f9401fe3 	ldr	x3, [sp, #56]
  401478:	f9400002 	ldr	x2, [x0]
  40147c:	eb020063 	subs	x3, x3, x2
  401480:	d2800002 	mov	x2, #0x0                   	// #0
  401484:	54000080 	b.eq	0x401494  // b.none
  401488:	d0000040 	adrp	x0, 0x40b000
  40148c:	f9478800 	ldr	x0, [x0, #3856]
  401490:	d63f0000 	blr	x0
  401494:	aa0103e0 	mov	x0, x1
  401498:	a9447bfd 	ldp	x29, x30, [sp, #64]
  40149c:	910143ff 	add	sp, sp, #0x50
  4014a0:	d65f03c0 	ret
  4014a4:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
  4014a8:	910003fd 	mov	x29, sp
  4014ac:	f9000fe0 	str	x0, [sp, #24]
  4014b0:	f9400fe0 	ldr	x0, [sp, #24]
  4014b4:	f100001f 	cmp	x0, #0x0
  4014b8:	54000061 	b.ne	0x4014c4  // b.any
  4014bc:	d2800000 	mov	x0, #0x0                   	// #0
  4014c0:	1400004c 	b	0x4015f0
  4014c4:	f9400fe0 	ldr	x0, [sp, #24]
  4014c8:	b9400000 	ldr	w0, [x0]
  4014cc:	7100141f 	cmp	w0, #0x5
  4014d0:	54000820 	b.eq	0x4015d4  // b.none
  4014d4:	7100141f 	cmp	w0, #0x5
  4014d8:	540008ac 	b.gt	0x4015ec
  4014dc:	7100101f 	cmp	w0, #0x4
  4014e0:	54000680 	b.eq	0x4015b0  // b.none
  4014e4:	7100101f 	cmp	w0, #0x4
  4014e8:	5400082c 	b.gt	0x4015ec
  4014ec:	71000c1f 	cmp	w0, #0x3
  4014f0:	540004e0 	b.eq	0x40158c  // b.none
  4014f4:	71000c1f 	cmp	w0, #0x3
  4014f8:	540007ac 	b.gt	0x4015ec
  4014fc:	7100041f 	cmp	w0, #0x1
  401500:	54000080 	b.eq	0x401510  // b.none
  401504:	7100081f 	cmp	w0, #0x2
  401508:	54000300 	b.eq	0x401568  // b.none
  40150c:	14000038 	b	0x4015ec
  401510:	f9400fe0 	ldr	x0, [sp, #24]
  401514:	f90027e0 	str	x0, [sp, #72]
  401518:	b90027ff 	str	wzr, [sp, #36]
  40151c:	1400000b 	b	0x401548
  401520:	f94027e1 	ldr	x1, [sp, #72]
  401524:	b98027e0 	ldrsw	x0, [sp, #36]
  401528:	91002800 	add	x0, x0, #0xa
  40152c:	d37df000 	lsl	x0, x0, #3
  401530:	8b000020 	add	x0, x1, x0
  401534:	f9400400 	ldr	x0, [x0, #8]
  401538:	3900001f 	strb	wzr, [x0]
  40153c:	b94027e0 	ldr	w0, [sp, #36]
  401540:	11000400 	add	w0, w0, #0x1
  401544:	b90027e0 	str	w0, [sp, #36]
  401548:	f94027e1 	ldr	x1, [sp, #72]
  40154c:	b98027e0 	ldrsw	x0, [sp, #36]
  401550:	d37df000 	lsl	x0, x0, #3
  401554:	8b000020 	add	x0, x1, x0
  401558:	f9400400 	ldr	x0, [x0, #8]
  40155c:	f100001f 	cmp	x0, #0x0
  401560:	54fffe01 	b.ne	0x401520  // b.any
  401564:	14000022 	b	0x4015ec
  401568:	f9400fe0 	ldr	x0, [sp, #24]
  40156c:	f90023e0 	str	x0, [sp, #64]
  401570:	f94023e0 	ldr	x0, [sp, #64]
  401574:	f9400400 	ldr	x0, [x0, #8]
  401578:	97ffffcb 	bl	0x4014a4
  40157c:	f94023e0 	ldr	x0, [sp, #64]
  401580:	f9400c00 	ldr	x0, [x0, #24]
  401584:	3900001f 	strb	wzr, [x0]
  401588:	14000019 	b	0x4015ec
  40158c:	f9400fe0 	ldr	x0, [sp, #24]
  401590:	f9001fe0 	str	x0, [sp, #56]
  401594:	f9401fe0 	ldr	x0, [sp, #56]
  401598:	f9400400 	ldr	x0, [x0, #8]
  40159c:	97ffffc2 	bl	0x4014a4
  4015a0:	f9401fe0 	ldr	x0, [sp, #56]
  4015a4:	f9400800 	ldr	x0, [x0, #16]
  4015a8:	97ffffbf 	bl	0x4014a4
  4015ac:	14000010 	b	0x4015ec
  4015b0:	f9400fe0 	ldr	x0, [sp, #24]
  4015b4:	f9001be0 	str	x0, [sp, #48]
  4015b8:	f9401be0 	ldr	x0, [sp, #48]
  4015bc:	f9400400 	ldr	x0, [x0, #8]
  4015c0:	97ffffb9 	bl	0x4014a4
  4015c4:	f9401be0 	ldr	x0, [sp, #48]
  4015c8:	f9400800 	ldr	x0, [x0, #16]
  4015cc:	97ffffb6 	bl	0x4014a4
  4015d0:	14000007 	b	0x4015ec
  4015d4:	f9400fe0 	ldr	x0, [sp, #24]
  4015d8:	f90017e0 	str	x0, [sp, #40]
  4015dc:	f94017e0 	ldr	x0, [sp, #40]
  4015e0:	f9400400 	ldr	x0, [x0, #8]
  4015e4:	97ffffb0 	bl	0x4014a4
  4015e8:	d503201f 	nop
  4015ec:	f9400fe0 	ldr	x0, [sp, #24]
  4015f0:	a8c57bfd 	ldp	x29, x30, [sp], #80
  4015f4:	d65f03c0 	ret
  4015f8:	d65f03c0 	ret
  4015fc:	d65f03c0 	ret
  401600:	a9a84ffe 	stp	x30, x19, [sp, #-384]!
  401604:	d2802602 	mov	x2, #0x130                 	// #304
  401608:	aa0003f3 	mov	x19, x0
  40160c:	910143e4 	add	x4, sp, #0x50
  401610:	a90157f4 	stp	x20, x21, [sp, #16]
  401614:	aa0403e0 	mov	x0, x4
  401618:	aa0103f4 	mov	x20, x1
  40161c:	52800001 	mov	w1, #0x0                   	// #0
  401620:	94000cd4 	bl	0x404970
  401624:	aa0003e4 	mov	x4, x0
  401628:	d0000040 	adrp	x0, 0x40b000
  40162c:	f9478400 	ldr	x0, [x0, #3848]
  401630:	d2800002 	mov	x2, #0x0                   	// #0
  401634:	f9000013 	str	x19, [x0]
  401638:	f8627a63 	ldr	x3, [x19, x2, lsl #3]
  40163c:	91000442 	add	x2, x2, #0x1
  401640:	b5ffffc3 	cbnz	x3, 0x401638
  401644:	b0000075 	adrp	x21, 0x40e000
  401648:	912ae2a1 	add	x1, x21, #0xab8
  40164c:	8b020e62 	add	x2, x19, x2, lsl #3
  401650:	aa0203e0 	mov	x0, x2
  401654:	f9000422 	str	x2, [x1, #8]
  401658:	14000002 	b	0x401660
  40165c:	91004000 	add	x0, x0, #0x10
  401660:	f9400013 	ldr	x19, [x0]
  401664:	b40000d3 	cbz	x19, 0x40167c
  401668:	f100967f 	cmp	x19, #0x25
  40166c:	54ffff88 	b.hi	0x40165c  // b.pmore
  401670:	f9400401 	ldr	x1, [x0, #8]
  401674:	f8337881 	str	x1, [x4, x19, lsl #3]
  401678:	17fffff9 	b	0x40165c
  40167c:	f940abe0 	ldr	x0, [sp, #336]
  401680:	b0000061 	adrp	x1, 0x40e000
  401684:	f9406be2 	ldr	x2, [sp, #208]
  401688:	f9055822 	str	x2, [x1, #2736]
  40168c:	b4000060 	cbz	x0, 0x401698
  401690:	b0000061 	adrp	x1, 0x40e000
  401694:	f9054c20 	str	x0, [x1, #2712]
  401698:	912ae2a0 	add	x0, x21, #0xab8
  40169c:	f94043e1 	ldr	x1, [sp, #128]
  4016a0:	f9001801 	str	x1, [x0, #48]
  4016a4:	b4000134 	cbz	x20, 0x4016c8
  4016a8:	d0000041 	adrp	x1, 0x40b000
  4016ac:	f947f021 	ldr	x1, [x1, #4064]
  4016b0:	91000680 	add	x0, x20, #0x1
  4016b4:	d0000042 	adrp	x2, 0x40b000
  4016b8:	f947a842 	ldr	x2, [x2, #3920]
  4016bc:	f9000034 	str	x20, [x1]
  4016c0:	f9000054 	str	x20, [x2]
  4016c4:	14000008 	b	0x4016e4
  4016c8:	f940a7e0 	ldr	x0, [sp, #328]
  4016cc:	90000054 	adrp	x20, 0x409000
  4016d0:	9103a294 	add	x20, x20, #0xe8
  4016d4:	f100001f 	cmp	x0, #0x0
  4016d8:	9a800294 	csel	x20, x20, x0, eq	// eq = none
  4016dc:	17fffff3 	b	0x4016a8
  4016e0:	91000400 	add	x0, x0, #0x1
  4016e4:	385ff001 	ldurb	w1, [x0, #-1]
  4016e8:	340000a1 	cbz	w1, 0x4016fc
  4016ec:	7100bc3f 	cmp	w1, #0x2f
  4016f0:	54ffff81 	b.ne	0x4016e0  // b.any
  4016f4:	f9000040 	str	x0, [x2]
  4016f8:	17fffffa 	b	0x4016e0
  4016fc:	aa0403e0 	mov	x0, x4
  401700:	94000ec8 	bl	0x405220
  401704:	f9408fe0 	ldr	x0, [sp, #280]
  401708:	94000060 	bl	0x401888
  40170c:	a94a83e1 	ldp	x1, x0, [sp, #168]
  401710:	eb00003f 	cmp	x1, x0
  401714:	54000280 	b.eq	0x401764  // b.none
  401718:	9100e3e5 	add	x5, sp, #0x38
  40171c:	a903ffff 	stp	xzr, xzr, [sp, #56]
  401720:	52800027 	mov	w7, #0x1                   	// #1
  401724:	f90027ff 	str	xzr, [sp, #72]
  401728:	52800046 	mov	w6, #0x2                   	// #2
  40172c:	aa0503e0 	mov	x0, x5
  401730:	9100a3e2 	add	x2, sp, #0x28
  401734:	d2800928 	mov	x8, #0x49                  	// #73
  401738:	d2800061 	mov	x1, #0x3                   	// #3
  40173c:	d2800003 	mov	x3, #0x0                   	// #0
  401740:	d2800104 	mov	x4, #0x8                   	// #8
  401744:	a902ffff 	stp	xzr, xzr, [sp, #40]
  401748:	b90043e7 	str	w7, [sp, #64]
  40174c:	b9004be6 	str	w6, [sp, #72]
  401750:	d4000001 	svc	#0x0
  401754:	90000041 	adrp	x1, 0x409000
  401758:	9103c021 	add	x1, x1, #0xf0
  40175c:	36f80160 	tbz	w0, #31, 0x401788
  401760:	14000012 	b	0x4017a8
  401764:	a94b83e1 	ldp	x1, x0, [sp, #184]
  401768:	eb00003f 	cmp	x1, x0
  40176c:	54fffd61 	b.ne	0x401718  // b.any
  401770:	f94087e0 	ldr	x0, [sp, #264]
  401774:	b5fffd20 	cbnz	x0, 0x401718
  401778:	14000012 	b	0x4017c0
  40177c:	91002273 	add	x19, x19, #0x8
  401780:	f100627f 	cmp	x19, #0x18
  401784:	54000180 	b.eq	0x4017b4  // b.none
  401788:	8b1300a0 	add	x0, x5, x19
  40178c:	79400c00 	ldrh	w0, [x0, #6]
  401790:	362fff60 	tbz	w0, #5, 0x40177c
  401794:	d2800708 	mov	x8, #0x38                  	// #56
  401798:	92800c60 	mov	x0, #0xffffffffffffff9c    	// #-100
  40179c:	320f83e2 	mov	w2, #0x20002               	// #131074
  4017a0:	d4000001 	svc	#0x0
  4017a4:	b6fffec0 	tbz	x0, #63, 0x40177c
  4017a8:	d2800000 	mov	x0, #0x0                   	// #0
  4017ac:	3900001f 	strb	wzr, [x0]
  4017b0:	d4207d00 	brk	#0x3e8
  4017b4:	912ae2b5 	add	x21, x21, #0xab8
  4017b8:	52800020 	mov	w0, #0x1                   	// #1
  4017bc:	39000aa0 	strb	w0, [x21, #2]
  4017c0:	a94157f4 	ldp	x20, x21, [sp, #16]
  4017c4:	a8d84ffe 	ldp	x30, x19, [sp], #384
  4017c8:	d65f03c0 	ret
  4017cc:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  4017d0:	d0000053 	adrp	x19, 0x40b000
  4017d4:	f947de73 	ldr	x19, [x19, #4024]
  4017d8:	f9000bf4 	str	x20, [sp, #16]
  4017dc:	d0000054 	adrp	x20, 0x40b000
  4017e0:	f947c694 	ldr	x20, [x20, #3976]
  4017e4:	97fffa4f 	bl	0x400120
  4017e8:	14000003 	b	0x4017f4
  4017ec:	f8408660 	ldr	x0, [x19], #8
  4017f0:	d63f0000 	blr	x0
  4017f4:	eb14027f 	cmp	x19, x20
  4017f8:	54ffffa3 	b.cc	0x4017ec  // b.lo, b.ul, b.last
  4017fc:	f9400bf4 	ldr	x20, [sp, #16]
  401800:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401804:	d65f03c0 	ret
  401808:	a9bd4ffe 	stp	x30, x19, [sp, #-48]!
  40180c:	2a0103f3 	mov	w19, w1
  401810:	f90013f6 	str	x22, [sp, #32]
  401814:	8b21cc56 	add	x22, x2, w1, sxtw #3
  401818:	910022d6 	add	x22, x22, #0x8
  40181c:	a90157f4 	stp	x20, x21, [sp, #16]
  401820:	aa0203f4 	mov	x20, x2
  401824:	aa0003f5 	mov	x21, x0
  401828:	97ffffe9 	bl	0x4017cc
  40182c:	aa1603e2 	mov	x2, x22
  401830:	aa1403e1 	mov	x1, x20
  401834:	2a1303e0 	mov	w0, w19
  401838:	d63f02a0 	blr	x21
  40183c:	97fffa3d 	bl	0x400130
  401840:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  401844:	aa0203f3 	mov	x19, x2
  401848:	8b21cc42 	add	x2, x2, w1, sxtw #3
  40184c:	a90157f4 	stp	x20, x21, [sp, #16]
  401850:	2a0103f4 	mov	w20, w1
  401854:	aa0003f5 	mov	x21, x0
  401858:	f9400261 	ldr	x1, [x19]
  40185c:	91002040 	add	x0, x2, #0x8
  401860:	97ffff68 	bl	0x401600
  401864:	aa1303e2 	mov	x2, x19
  401868:	2a1403e1 	mov	w1, w20
  40186c:	aa1503e0 	mov	x0, x21
  401870:	90000003 	adrp	x3, 0x401000
  401874:	91202063 	add	x3, x3, #0x808
  401878:	a94157f4 	ldp	x20, x21, [sp, #16]
  40187c:	aa0303f0 	mov	x16, x3
  401880:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401884:	d61f0200 	br	x16
  401888:	b40001e0 	cbz	x0, 0x4018c4
  40188c:	aa0003e1 	mov	x1, x0
  401890:	f81f0ffe 	str	x30, [sp, #-16]!
  401894:	d0000040 	adrp	x0, 0x40b000
  401898:	f9476800 	ldr	x0, [x0, #3792]
  40189c:	d2800102 	mov	x2, #0x8                   	// #8
  4018a0:	94000bd0 	bl	0x4047e0
  4018a4:	d0000040 	adrp	x0, 0x40b000
  4018a8:	f9476800 	ldr	x0, [x0, #3792]
  4018ac:	d53bd041 	mrs	x1, tpidr_el0
  4018b0:	3900041f 	strb	wzr, [x0, #1]
  4018b4:	f9400000 	ldr	x0, [x0]
  4018b8:	f81f0020 	stur	x0, [x1, #-16]
  4018bc:	f84107fe 	ldr	x30, [sp], #16
  4018c0:	d65f03c0 	ret
  4018c4:	d0000040 	adrp	x0, 0x40b000
  4018c8:	f9476800 	ldr	x0, [x0, #3792]
  4018cc:	d289cda1 	mov	x1, #0x4e6d                	// #20077
  4018d0:	f2a838c1 	movk	x1, #0x41c6, lsl #16
  4018d4:	9b017c01 	mul	x1, x0, x1
  4018d8:	f9000001 	str	x1, [x0]
  4018dc:	3900041f 	strb	wzr, [x0, #1]
  4018e0:	d53bd041 	mrs	x1, tpidr_el0
  4018e4:	f9400000 	ldr	x0, [x0]
  4018e8:	f81f0020 	stur	x0, [x1, #-16]
  4018ec:	d65f03c0 	ret
  4018f0:	d2800000 	mov	x0, #0x0                   	// #0
  4018f4:	3900001f 	strb	wzr, [x0]
  4018f8:	d4207d00 	brk	#0x3e8
  4018fc:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  401900:	528007a1 	mov	w1, #0x3d                  	// #61
  401904:	a90157f4 	stp	x20, x21, [sp, #16]
  401908:	aa0003f4 	mov	x20, x0
  40190c:	94000c90 	bl	0x404b4c
  401910:	eb140015 	subs	x21, x0, x20
  401914:	540000e0 	b.eq	0x401930  // b.none
  401918:	39400000 	ldrb	w0, [x0]
  40191c:	350000a0 	cbnz	w0, 0x401930
  401920:	d0000040 	adrp	x0, 0x40b000
  401924:	f9478400 	ldr	x0, [x0, #3848]
  401928:	f9400013 	ldr	x19, [x0]
  40192c:	b50000d3 	cbnz	x19, 0x401944
  401930:	d2800000 	mov	x0, #0x0                   	// #0
  401934:	a94157f4 	ldp	x20, x21, [sp, #16]
  401938:	a8c24ffe 	ldp	x30, x19, [sp], #32
  40193c:	d65f03c0 	ret
  401940:	91002273 	add	x19, x19, #0x8
  401944:	f9400261 	ldr	x1, [x19]
  401948:	aa1503e2 	mov	x2, x21
  40194c:	aa1403e0 	mov	x0, x20
  401950:	b4ffff01 	cbz	x1, 0x401930
  401954:	94000cbb 	bl	0x404c40
  401958:	35ffff40 	cbnz	w0, 0x401940
  40195c:	f9400260 	ldr	x0, [x19]
  401960:	38756801 	ldrb	w1, [x0, x21]
  401964:	7100f43f 	cmp	w1, #0x3d
  401968:	54fffec1 	b.ne	0x401940  // b.any
  40196c:	910006b5 	add	x21, x21, #0x1
  401970:	8b150000 	add	x0, x0, x21
  401974:	17fffff0 	b	0x401934
  401978:	d65f03c0 	ret
  40197c:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  401980:	d0000053 	adrp	x19, 0x40b000
  401984:	f9478273 	ldr	x19, [x19, #3840]
  401988:	f9000bf4 	str	x20, [sp, #16]
  40198c:	d0000054 	adrp	x20, 0x40b000
  401990:	f947ba94 	ldr	x20, [x20, #3952]
  401994:	14000003 	b	0x4019a0
  401998:	f85f8e60 	ldr	x0, [x19, #-8]!
  40199c:	d63f0000 	blr	x0
  4019a0:	eb14027f 	cmp	x19, x20
  4019a4:	54ffffa8 	b.hi	0x401998  // b.pmore
  4019a8:	f9400bf4 	ldr	x20, [sp, #16]
  4019ac:	a8c24ffe 	ldp	x30, x19, [sp], #32
  4019b0:	14001d61 	b	0x408f34
  4019b4:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  4019b8:	2a0103f3 	mov	w19, w1
  4019bc:	f9001fe2 	str	x2, [sp, #56]
  4019c0:	aa0003e2 	mov	x2, x0
  4019c4:	373000f3 	tbnz	w19, #6, 0x4019e0
  4019c8:	121a0021 	and	w1, w1, #0x40
  4019cc:	d2800004 	mov	x4, #0x0                   	// #0
  4019d0:	11501021 	add	w1, w1, #0x404, lsl #12
  4019d4:	0a010261 	and	w1, w19, w1
  4019d8:	7150103f 	cmp	w1, #0x404, lsl #12
  4019dc:	54000101 	b.ne	0x4019fc  // b.any
  4019e0:	b9403be4 	ldr	w4, [sp, #56]
  4019e4:	9100c3e1 	add	x1, sp, #0x30
  4019e8:	910103e3 	add	x3, sp, #0x40
  4019ec:	128000e0 	mov	w0, #0xfffffff8            	// #-8
  4019f0:	a9010fe3 	stp	x3, x3, [sp, #16]
  4019f4:	f90013e1 	str	x1, [sp, #32]
  4019f8:	29057fe0 	stp	w0, wzr, [sp, #40]
  4019fc:	320f0263 	orr	w3, w19, #0x20000
  401a00:	d2800006 	mov	x6, #0x0                   	// #0
  401a04:	d2800005 	mov	x5, #0x0                   	// #0
  401a08:	92800c61 	mov	x1, #0xffffffffffffff9c    	// #-100
  401a0c:	93407c63 	sxtw	x3, w3
  401a10:	d2800700 	mov	x0, #0x38                  	// #56
  401a14:	94000d12 	bl	0x404e5c
  401a18:	93407c03 	sxtw	x3, w0
  401a1c:	37f800e0 	tbnz	w0, #31, 0x401a38
  401a20:	369800d3 	tbz	w19, #19, 0x401a38
  401a24:	d2800328 	mov	x8, #0x19                  	// #25
  401a28:	aa0303e0 	mov	x0, x3
  401a2c:	d2800041 	mov	x1, #0x2                   	// #2
  401a30:	d2800022 	mov	x2, #0x1                   	// #1
  401a34:	d4000001 	svc	#0x0
  401a38:	aa0303e0 	mov	x0, x3
  401a3c:	94000003 	bl	0x401a48
  401a40:	a8c44ffe 	ldp	x30, x19, [sp], #64
  401a44:	d65f03c0 	ret
  401a48:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  401a4c:	aa0003f3 	mov	x19, x0
  401a50:	b140041f 	cmn	x0, #0x1, lsl #12
  401a54:	54000068 	b.hi	0x401a60  // b.pmore
  401a58:	a8c14ffe 	ldp	x30, x19, [sp], #16
  401a5c:	d65f03c0 	ret
  401a60:	94000e5a 	bl	0x4053c8
  401a64:	aa0003e1 	mov	x1, x0
  401a68:	4b1303e2 	neg	w2, w19
  401a6c:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
  401a70:	b9000022 	str	w2, [x1]
  401a74:	17fffff9 	b	0x401a58
  401a78:	d0000042 	adrp	x2, 0x40b000
  401a7c:	f9478442 	ldr	x2, [x2, #3848]
  401a80:	f9400042 	ldr	x2, [x2]
  401a84:	14000001 	b	0x401a88
  401a88:	d2801ba8 	mov	x8, #0xdd                  	// #221
  401a8c:	f81f0ffe 	str	x30, [sp, #-16]!
  401a90:	d4000001 	svc	#0x0
  401a94:	97ffffed 	bl	0x401a48
  401a98:	f84107fe 	ldr	x30, [sp], #16
  401a9c:	d65f03c0 	ret
  401aa0:	d65f03c0 	ret
  401aa4:	d65f03c0 	ret
  401aa8:	a9b34ffe 	stp	x30, x19, [sp, #-208]!
  401aac:	12800000 	mov	w0, #0xffffffff            	// #-1
  401ab0:	a90157f4 	stp	x20, x21, [sp, #16]
  401ab4:	a9025ff6 	stp	x22, x23, [sp, #32]
  401ab8:	910143f7 	add	x23, sp, #0x50
  401abc:	a90367f8 	stp	x24, x25, [sp, #48]
  401ac0:	f90023fa 	str	x26, [sp, #64]
  401ac4:	97fffff7 	bl	0x401aa0
  401ac8:	aa1703e0 	mov	x0, x23
  401acc:	94000079 	bl	0x401cb0
  401ad0:	b0000060 	adrp	x0, 0x40e000
  401ad4:	912ae000 	add	x0, x0, #0xab8
  401ad8:	39400c00 	ldrb	w0, [x0, #3]
  401adc:	13001c00 	sxtb	w0, w0
  401ae0:	7100001f 	cmp	w0, #0x0
  401ae4:	5400012c 	b.gt	0x401b08
  401ae8:	94000eea 	bl	0x405690
  401aec:	2a0003f4 	mov	w20, w0
  401af0:	94000e36 	bl	0x4053c8
  401af4:	b940001a 	ldr	w26, [x0]
  401af8:	7100029f 	cmp	w20, #0x0
  401afc:	aa0003f9 	mov	x25, x0
  401b00:	1a9f17f6 	cset	w22, eq	// eq = none
  401b04:	14000042 	b	0x401c0c
  401b08:	12800000 	mov	w0, #0xffffffff            	// #-1
  401b0c:	97ffffe5 	bl	0x401aa0
  401b10:	12800000 	mov	w0, #0xffffffff            	// #-1
  401b14:	97ffffe3 	bl	0x401aa0
  401b18:	12800000 	mov	w0, #0xffffffff            	// #-1
  401b1c:	d0000053 	adrp	x19, 0x40b000
  401b20:	91394273 	add	x19, x19, #0xe50
  401b24:	97ffffdf 	bl	0x401aa0
  401b28:	91014275 	add	x21, x19, #0x50
  401b2c:	aa1303f4 	mov	x20, x19
  401b30:	94000ccc 	bl	0x404e60
  401b34:	14000004 	b	0x401b44
  401b38:	91002294 	add	x20, x20, #0x8
  401b3c:	eb15029f 	cmp	x20, x21
  401b40:	540000c0 	b.eq	0x401b58  // b.none
  401b44:	f9400280 	ldr	x0, [x20]
  401b48:	f9400000 	ldr	x0, [x0]
  401b4c:	b4ffff60 	cbz	x0, 0x401b38
  401b50:	94000c5d 	bl	0x404cc4
  401b54:	17fffff9 	b	0x401b38
  401b58:	12800000 	mov	w0, #0xffffffff            	// #-1
  401b5c:	97ffffd1 	bl	0x401aa0
  401b60:	d53bd058 	mrs	x24, tpidr_el0
  401b64:	d1032318 	sub	x24, x24, #0xc8
  401b68:	97ffffcf 	bl	0x401aa4
  401b6c:	f9400b16 	ldr	x22, [x24, #16]
  401b70:	94000ec8 	bl	0x405690
  401b74:	2a0003f4 	mov	w20, w0
  401b78:	94000e14 	bl	0x4053c8
  401b7c:	b940001a 	ldr	w26, [x0]
  401b80:	aa0003f9 	mov	x25, x0
  401b84:	12800000 	mov	w0, #0xffffffff            	// #-1
  401b88:	34000134 	cbz	w20, 0x401bac
  401b8c:	97ffffc6 	bl	0x401aa4
  401b90:	7100029f 	cmp	w20, #0x0
  401b94:	1a9f17f6 	cset	w22, eq	// eq = none
  401b98:	2a1603e0 	mov	w0, w22
  401b9c:	97ffffc1 	bl	0x401aa0
  401ba0:	1400000d 	b	0x401bd4
  401ba4:	b90022c0 	str	w0, [x22, #32]
  401ba8:	f9400ad6 	ldr	x22, [x22, #16]
  401bac:	eb16031f 	cmp	x24, x22
  401bb0:	54ffffa1 	b.ne	0x401ba4  // b.any
  401bb4:	90000040 	adrp	x0, 0x409000
  401bb8:	f940c000 	ldr	x0, [x0, #384]
  401bbc:	b4fffe80 	cbz	x0, 0x401b8c
  401bc0:	b900001f 	str	wzr, [x0]
  401bc4:	b900041f 	str	wzr, [x0, #4]
  401bc8:	17fffff1 	b	0x401b8c
  401bcc:	94000c84 	bl	0x404ddc
  401bd0:	91002273 	add	x19, x19, #0x8
  401bd4:	eb15027f 	cmp	x19, x21
  401bd8:	540000e0 	b.eq	0x401bf4  // b.none
  401bdc:	f9400261 	ldr	x1, [x19]
  401be0:	f9400020 	ldr	x0, [x1]
  401be4:	b4ffff60 	cbz	x0, 0x401bd0
  401be8:	35ffff34 	cbnz	w20, 0x401bcc
  401bec:	b900001f 	str	wzr, [x0]
  401bf0:	17fffff8 	b	0x401bd0
  401bf4:	94000ca1 	bl	0x404e78
  401bf8:	35000234 	cbnz	w20, 0x401c3c
  401bfc:	2a1603e0 	mov	w0, w22
  401c00:	97ffffa8 	bl	0x401aa0
  401c04:	2a1603e0 	mov	w0, w22
  401c08:	97ffffa6 	bl	0x401aa0
  401c0c:	aa1703e0 	mov	x0, x23
  401c10:	94000030 	bl	0x401cd0
  401c14:	2a1603e0 	mov	w0, w22
  401c18:	97ffffa2 	bl	0x401aa0
  401c1c:	37f80174 	tbnz	w20, #31, 0x401c48
  401c20:	a9425ff6 	ldp	x22, x23, [sp, #32]
  401c24:	2a1403e0 	mov	w0, w20
  401c28:	a94157f4 	ldp	x20, x21, [sp, #16]
  401c2c:	a94367f8 	ldp	x24, x25, [sp, #48]
  401c30:	f94023fa 	ldr	x26, [sp, #64]
  401c34:	a8cd4ffe 	ldp	x30, x19, [sp], #208
  401c38:	d65f03c0 	ret
  401c3c:	52800000 	mov	w0, #0x0                   	// #0
  401c40:	97ffff98 	bl	0x401aa0
  401c44:	17ffffee 	b	0x401bfc
  401c48:	b900033a 	str	w26, [x25]
  401c4c:	17fffff5 	b	0x401c20
  401c50:	aa0003e1 	mov	x1, x0
  401c54:	52800002 	mov	w2, #0x0                   	// #0
  401c58:	12800000 	mov	w0, #0xffffffff            	// #-1
  401c5c:	14000001 	b	0x401c60
  401c60:	93407c43 	sxtw	x3, w2
  401c64:	aa0103e2 	mov	x2, x1
  401c68:	93407c01 	sxtw	x1, w0
  401c6c:	d2800006 	mov	x6, #0x0                   	// #0
  401c70:	d2800005 	mov	x5, #0x0                   	// #0
  401c74:	d2800004 	mov	x4, #0x0                   	// #0
  401c78:	f81f0ffe 	str	x30, [sp, #-16]!
  401c7c:	d2802080 	mov	x0, #0x104                 	// #260
  401c80:	94000c77 	bl	0x404e5c
  401c84:	97ffff71 	bl	0x401a48
  401c88:	f84107fe 	ldr	x30, [sp], #16
  401c8c:	d65f03c0 	ret
  401c90:	aa0003e2 	mov	x2, x0
  401c94:	90000041 	adrp	x1, 0x409000
  401c98:	d28010e8 	mov	x8, #0x87                  	// #135
  401c9c:	91064021 	add	x1, x1, #0x190
  401ca0:	d2800000 	mov	x0, #0x0                   	// #0
  401ca4:	d2800103 	mov	x3, #0x8                   	// #8
  401ca8:	d4000001 	svc	#0x0
  401cac:	d65f03c0 	ret
  401cb0:	aa0003e2 	mov	x2, x0
  401cb4:	90000041 	adrp	x1, 0x409000
  401cb8:	d28010e8 	mov	x8, #0x87                  	// #135
  401cbc:	91062021 	add	x1, x1, #0x188
  401cc0:	d2800000 	mov	x0, #0x0                   	// #0
  401cc4:	d2800103 	mov	x3, #0x8                   	// #8
  401cc8:	d4000001 	svc	#0x0
  401ccc:	d65f03c0 	ret
  401cd0:	aa0003e1 	mov	x1, x0
  401cd4:	d28010e8 	mov	x8, #0x87                  	// #135
  401cd8:	d2800040 	mov	x0, #0x2                   	// #2
  401cdc:	d2800002 	mov	x2, #0x0                   	// #0
  401ce0:	d2800103 	mov	x3, #0x8                   	// #8
  401ce4:	d4000001 	svc	#0x0
  401ce8:	d65f03c0 	ret
  401cec:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  401cf0:	aa0203f3 	mov	x19, x2
  401cf4:	a90157f4 	stp	x20, x21, [sp, #16]
  401cf8:	aa0003f5 	mov	x21, x0
  401cfc:	a9025ff6 	stp	x22, x23, [sp, #32]
  401d00:	2a0103f7 	mov	w23, w1
  401d04:	b9408c40 	ldr	w0, [x2, #140]
  401d08:	36f80240 	tbz	w0, #31, 0x401d50
  401d0c:	52800016 	mov	w22, #0x0                   	// #0
  401d10:	7100043f 	cmp	w1, #0x1
  401d14:	540000ad 	b.le	0x401d28
  401d18:	510006f7 	sub	w23, w23, #0x1
  401d1c:	f9001bf8 	str	x24, [sp, #48]
  401d20:	aa1503f8 	mov	x24, x21
  401d24:	14000030 	b	0x401de4
  401d28:	b9408841 	ldr	w1, [x2, #136]
  401d2c:	51000420 	sub	w0, w1, #0x1
  401d30:	2a010000 	orr	w0, w0, w1
  401d34:	b9008840 	str	w0, [x2, #136]
  401d38:	d2800014 	mov	x20, #0x0                   	// #0
  401d3c:	710006ff 	cmp	w23, #0x1
  401d40:	54000861 	b.ne	0x401e4c  // b.any
  401d44:	aa1503f4 	mov	x20, x21
  401d48:	390002bf 	strb	wzr, [x21]
  401d4c:	14000040 	b	0x401e4c
  401d50:	aa0203e0 	mov	x0, x2
  401d54:	94000e64 	bl	0x4056e4
  401d58:	2a0003f6 	mov	w22, w0
  401d5c:	710006ff 	cmp	w23, #0x1
  401d60:	54fffdcc 	b.gt	0x401d18
  401d64:	b9408a61 	ldr	w1, [x19, #136]
  401d68:	51000420 	sub	w0, w1, #0x1
  401d6c:	2a010000 	orr	w0, w0, w1
  401d70:	b9008a60 	str	w0, [x19, #136]
  401d74:	34fffe36 	cbz	w22, 0x401d38
  401d78:	aa1303e0 	mov	x0, x19
  401d7c:	94000e88 	bl	0x40579c
  401d80:	17ffffee 	b	0x401d38
  401d84:	f9400a74 	ldr	x20, [x19, #16]
  401d88:	cb010294 	sub	x20, x20, x1
  401d8c:	eb02029f 	cmp	x20, x2
  401d90:	9a829294 	csel	x20, x20, x2, ls	// ls = plast
  401d94:	aa1403e2 	mov	x2, x20
  401d98:	94000a92 	bl	0x4047e0
  401d9c:	f9400661 	ldr	x1, [x19, #8]
  401da0:	8b140302 	add	x2, x24, x20
  401da4:	6b1402f7 	subs	w23, w23, w20
  401da8:	8b140020 	add	x0, x1, x20
  401dac:	f9000660 	str	x0, [x19, #8]
  401db0:	91000404 	add	x4, x0, #0x1
  401db4:	54000700 	b.eq	0x401e94  // b.none
  401db8:	f9400a63 	ldr	x3, [x19, #16]
  401dbc:	eb03001f 	cmp	x0, x3
  401dc0:	54000500 	b.eq	0x401e60  // b.none
  401dc4:	f9000664 	str	x4, [x19, #8]
  401dc8:	38746820 	ldrb	w0, [x1, x20]
  401dcc:	aa0203f8 	mov	x24, x2
  401dd0:	510006f7 	sub	w23, w23, #0x1
  401dd4:	38001700 	strb	w0, [x24], #1
  401dd8:	7100281f 	cmp	w0, #0xa
  401ddc:	540002e0 	b.eq	0x401e38  // b.none
  401de0:	340002d7 	cbz	w23, 0x401e38
  401de4:	a9408e60 	ldp	x0, x3, [x19, #8]
  401de8:	52800141 	mov	w1, #0xa                   	// #10
  401dec:	cb000062 	sub	x2, x3, x0
  401df0:	eb03001f 	cmp	x0, x3
  401df4:	54000380 	b.eq	0x401e64  // b.none
  401df8:	94000b1f 	bl	0x404a74
  401dfc:	aa0003f4 	mov	x20, x0
  401e00:	f9400661 	ldr	x1, [x19, #8]
  401e04:	93407ee2 	sxtw	x2, w23
  401e08:	aa1803e0 	mov	x0, x24
  401e0c:	b4fffbd4 	cbz	x20, 0x401d84
  401e10:	cb010294 	sub	x20, x20, x1
  401e14:	91000694 	add	x20, x20, #0x1
  401e18:	eb02029f 	cmp	x20, x2
  401e1c:	9a829294 	csel	x20, x20, x2, ls	// ls = plast
  401e20:	aa1403e2 	mov	x2, x20
  401e24:	8b140318 	add	x24, x24, x20
  401e28:	94000a6e 	bl	0x4047e0
  401e2c:	f9400660 	ldr	x0, [x19, #8]
  401e30:	8b140000 	add	x0, x0, x20
  401e34:	f9000660 	str	x0, [x19, #8]
  401e38:	b4000055 	cbz	x21, 0x401e40
  401e3c:	3900031f 	strb	wzr, [x24]
  401e40:	aa1503f4 	mov	x20, x21
  401e44:	350002d6 	cbnz	w22, 0x401e9c
  401e48:	f9401bf8 	ldr	x24, [sp, #48]
  401e4c:	aa1403e0 	mov	x0, x20
  401e50:	a94157f4 	ldp	x20, x21, [sp, #16]
  401e54:	a9425ff6 	ldp	x22, x23, [sp, #32]
  401e58:	a8c44ffe 	ldp	x30, x19, [sp], #64
  401e5c:	d65f03c0 	ret
  401e60:	aa0203f8 	mov	x24, x2
  401e64:	aa1303e0 	mov	x0, x19
  401e68:	94000f2a 	bl	0x405b10
  401e6c:	aa1803e2 	mov	x2, x24
  401e70:	37f80060 	tbnz	w0, #31, 0x401e7c
  401e74:	12001c00 	and	w0, w0, #0xff
  401e78:	17ffffd5 	b	0x401dcc
  401e7c:	d2800014 	mov	x20, #0x0                   	// #0
  401e80:	eb1802bf 	cmp	x21, x24
  401e84:	54fffe00 	b.eq	0x401e44  // b.none
  401e88:	b9400260 	ldr	w0, [x19]
  401e8c:	3627fdc0 	tbz	w0, #4, 0x401e44
  401e90:	17ffffea 	b	0x401e38
  401e94:	aa0203f8 	mov	x24, x2
  401e98:	17ffffe8 	b	0x401e38
  401e9c:	aa1303e0 	mov	x0, x19
  401ea0:	94000e3f 	bl	0x40579c
  401ea4:	f9401bf8 	ldr	x24, [sp, #48]
  401ea8:	17ffffe9 	b	0x401e4c
  401eac:	d10403ff 	sub	sp, sp, #0x100
  401eb0:	128005ea 	mov	w10, #0xffffffd0            	// #-48
  401eb4:	910343eb 	add	x11, sp, #0xd0
  401eb8:	910403e8 	add	x8, sp, #0x100
  401ebc:	12800fe9 	mov	w9, #0xffffff80            	// #-128
  401ec0:	a90323e8 	stp	x8, x8, [sp, #48]
  401ec4:	910043e8 	add	x8, sp, #0x10
  401ec8:	f90023eb 	str	x11, [sp, #64]
  401ecc:	290927ea 	stp	w10, w9, [sp, #72]
  401ed0:	3d8017e0 	str	q0, [sp, #80]
  401ed4:	ad41c3e0 	ldp	q0, q16, [sp, #48]
  401ed8:	f90003fe 	str	x30, [sp]
  401edc:	3d801be1 	str	q1, [sp, #96]
  401ee0:	3d801fe2 	str	q2, [sp, #112]
  401ee4:	3d8023e3 	str	q3, [sp, #128]
  401ee8:	3d8027e4 	str	q4, [sp, #144]
  401eec:	3d802be5 	str	q5, [sp, #160]
  401ef0:	3d802fe6 	str	q6, [sp, #176]
  401ef4:	3d8033e7 	str	q7, [sp, #192]
  401ef8:	a90d0fe2 	stp	x2, x3, [sp, #208]
  401efc:	aa0803e2 	mov	x2, x8
  401f00:	a90e17e4 	stp	x4, x5, [sp, #224]
  401f04:	a90f1fe6 	stp	x6, x7, [sp, #240]
  401f08:	ad004100 	stp	q0, q16, [x8]
  401f0c:	940009d8 	bl	0x40466c
  401f10:	f94003fe 	ldr	x30, [sp]
  401f14:	910403ff 	add	sp, sp, #0x100
  401f18:	d65f03c0 	ret
  401f1c:	a9bd4ffe 	stp	x30, x19, [sp, #-48]!
  401f20:	a90157f4 	stp	x20, x21, [sp, #16]
  401f24:	aa0203f5 	mov	x21, x2
  401f28:	aa0003f4 	mov	x20, x0
  401f2c:	f90013f6 	str	x22, [sp, #32]
  401f30:	aa0103f6 	mov	x22, x1
  401f34:	f9401041 	ldr	x1, [x2, #32]
  401f38:	b4000121 	cbz	x1, 0x401f5c
  401f3c:	f94016a0 	ldr	x0, [x21, #40]
  401f40:	cb000021 	sub	x1, x1, x0
  401f44:	eb16003f 	cmp	x1, x22
  401f48:	54000143 	b.cc	0x401f70  // b.lo, b.ul, b.last
  401f4c:	b94092a1 	ldr	w1, [x21, #144]
  401f50:	aa1603f3 	mov	x19, x22
  401f54:	36f80221 	tbz	w1, #31, 0x401f98
  401f58:	14000021 	b	0x401fdc
  401f5c:	aa0203e0 	mov	x0, x2
  401f60:	94000ed9 	bl	0x405ac4
  401f64:	35000520 	cbnz	w0, 0x402008
  401f68:	f94012a1 	ldr	x1, [x21, #32]
  401f6c:	17fffff4 	b	0x401f3c
  401f70:	f94026a3 	ldr	x3, [x21, #72]
  401f74:	aa1603e2 	mov	x2, x22
  401f78:	f94013f6 	ldr	x22, [sp, #32]
  401f7c:	aa1403e1 	mov	x1, x20
  401f80:	aa1503e0 	mov	x0, x21
  401f84:	aa0303f0 	mov	x16, x3
  401f88:	a94157f4 	ldp	x20, x21, [sp, #16]
  401f8c:	a8c34ffe 	ldp	x30, x19, [sp], #48
  401f90:	d61f0200 	br	x16
  401f94:	aa0303f3 	mov	x19, x3
  401f98:	d1000663 	sub	x3, x19, #0x1
  401f9c:	b40001f3 	cbz	x19, 0x401fd8
  401fa0:	38636a84 	ldrb	w4, [x20, x3]
  401fa4:	7100289f 	cmp	w4, #0xa
  401fa8:	54ffff61 	b.ne	0x401f94  // b.any
  401fac:	f94026a3 	ldr	x3, [x21, #72]
  401fb0:	aa1303e2 	mov	x2, x19
  401fb4:	aa1403e1 	mov	x1, x20
  401fb8:	aa1503e0 	mov	x0, x21
  401fbc:	d63f0060 	blr	x3
  401fc0:	eb00027f 	cmp	x19, x0
  401fc4:	540001a8 	b.hi	0x401ff8  // b.pmore
  401fc8:	f94016a0 	ldr	x0, [x21, #40]
  401fcc:	8b130294 	add	x20, x20, x19
  401fd0:	cb1302d3 	sub	x19, x22, x19
  401fd4:	14000002 	b	0x401fdc
  401fd8:	aa1603f3 	mov	x19, x22
  401fdc:	aa1403e1 	mov	x1, x20
  401fe0:	aa1303e2 	mov	x2, x19
  401fe4:	940009ff 	bl	0x4047e0
  401fe8:	f94016a1 	ldr	x1, [x21, #40]
  401fec:	aa1603e0 	mov	x0, x22
  401ff0:	8b130021 	add	x1, x1, x19
  401ff4:	f90016a1 	str	x1, [x21, #40]
  401ff8:	a94157f4 	ldp	x20, x21, [sp, #16]
  401ffc:	f94013f6 	ldr	x22, [sp, #32]
  402000:	a8c34ffe 	ldp	x30, x19, [sp], #48
  402004:	d65f03c0 	ret
  402008:	d2800000 	mov	x0, #0x0                   	// #0
  40200c:	17fffffb 	b	0x401ff8
  402010:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  402014:	f100003f 	cmp	x1, #0x0
  402018:	aa0303f3 	mov	x19, x3
  40201c:	a90157f4 	stp	x20, x21, [sp, #16]
  402020:	9b027c35 	mul	x21, x1, x2
  402024:	aa0103f4 	mov	x20, x1
  402028:	b9408c61 	ldr	w1, [x3, #140]
  40202c:	a9025ff6 	stp	x22, x23, [sp, #32]
  402030:	9a9f1057 	csel	x23, x2, xzr, ne	// ne = any
  402034:	36f801a1 	tbz	w1, #31, 0x402068
  402038:	aa0303e2 	mov	x2, x3
  40203c:	aa1503e1 	mov	x1, x21
  402040:	97ffffb7 	bl	0x401f1c
  402044:	aa0003f6 	mov	x22, x0
  402048:	eb1602bf 	cmp	x21, x22
  40204c:	54000040 	b.eq	0x402054  // b.none
  402050:	9ad40ad7 	udiv	x23, x22, x20
  402054:	a94157f4 	ldp	x20, x21, [sp, #16]
  402058:	aa1703e0 	mov	x0, x23
  40205c:	a9425ff6 	ldp	x22, x23, [sp, #32]
  402060:	a8c44ffe 	ldp	x30, x19, [sp], #64
  402064:	d65f03c0 	ret
  402068:	aa0003f6 	mov	x22, x0
  40206c:	aa0303e0 	mov	x0, x3
  402070:	f9001bf8 	str	x24, [sp, #48]
  402074:	94000d9c 	bl	0x4056e4
  402078:	aa1303e2 	mov	x2, x19
  40207c:	2a0003f8 	mov	w24, w0
  402080:	aa1503e1 	mov	x1, x21
  402084:	aa1603e0 	mov	x0, x22
  402088:	97ffffa5 	bl	0x401f1c
  40208c:	aa0003f6 	mov	x22, x0
  402090:	340000b8 	cbz	w24, 0x4020a4
  402094:	aa1303e0 	mov	x0, x19
  402098:	94000dc1 	bl	0x40579c
  40209c:	f9401bf8 	ldr	x24, [sp, #48]
  4020a0:	17ffffea 	b	0x402048
  4020a4:	f9401bf8 	ldr	x24, [sp, #48]
  4020a8:	17ffffe8 	b	0x402048
  4020ac:	d10443ff 	sub	sp, sp, #0x110
  4020b0:	128006eb 	mov	w11, #0xffffffc8            	// #-56
  4020b4:	910343e9 	add	x9, sp, #0xd0
  4020b8:	910443e8 	add	x8, sp, #0x110
  4020bc:	12800fea 	mov	w10, #0xffffff80            	// #-128
  4020c0:	a90323e8 	stp	x8, x8, [sp, #48]
  4020c4:	910043e8 	add	x8, sp, #0x10
  4020c8:	f90023e9 	str	x9, [sp, #64]
  4020cc:	aa0003e9 	mov	x9, x0
  4020d0:	29092beb 	stp	w11, w10, [sp, #72]
  4020d4:	d0000040 	adrp	x0, 0x40c000
  4020d8:	3d8017e0 	str	q0, [sp, #80]
  4020dc:	91080000 	add	x0, x0, #0x200
  4020e0:	ad41c3e0 	ldp	q0, q16, [sp, #48]
  4020e4:	f90003fe 	str	x30, [sp]
  4020e8:	3d801be1 	str	q1, [sp, #96]
  4020ec:	3d801fe2 	str	q2, [sp, #112]
  4020f0:	3d8023e3 	str	q3, [sp, #128]
  4020f4:	3d8027e4 	str	q4, [sp, #144]
  4020f8:	3d802be5 	str	q5, [sp, #160]
  4020fc:	3d802fe6 	str	q6, [sp, #176]
  402100:	3d8033e7 	str	q7, [sp, #192]
  402104:	a90d8be1 	stp	x1, x2, [sp, #216]
  402108:	aa0903e1 	mov	x1, x9
  40210c:	aa0803e2 	mov	x2, x8
  402110:	a90e93e3 	stp	x3, x4, [sp, #232]
  402114:	a90f9be5 	stp	x5, x6, [sp, #248]
  402118:	f90087e7 	str	x7, [sp, #264]
  40211c:	ad004100 	stp	q0, q16, [x8]
  402120:	94000953 	bl	0x40466c
  402124:	f94003fe 	ldr	x30, [sp]
  402128:	910443ff 	add	sp, sp, #0x110
  40212c:	d65f03c0 	ret
  402130:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  402134:	a90157f4 	stp	x20, x21, [sp, #16]
  402138:	d0000055 	adrp	x21, 0x40c000
  40213c:	910802b4 	add	x20, x21, #0x200
  402140:	b9408e81 	ldr	w1, [x20, #140]
  402144:	36f802e1 	tbz	w1, #31, 0x4021a0
  402148:	aa1403e1 	mov	x1, x20
  40214c:	12800013 	mov	w19, #0xffffffff            	// #-1
  402150:	52800014 	mov	w20, #0x0                   	// #0
  402154:	94000e7f 	bl	0x405b50
  402158:	37f801c0 	tbnz	w0, #31, 0x402190
  40215c:	910802a1 	add	x1, x21, #0x200
  402160:	b9409020 	ldr	w0, [x1, #144]
  402164:	7100281f 	cmp	w0, #0xa
  402168:	54000320 	b.eq	0x4021cc  // b.none
  40216c:	a9420022 	ldp	x2, x0, [x1, #32]
  402170:	eb02001f 	cmp	x0, x2
  402174:	540002c0 	b.eq	0x4021cc  // b.none
  402178:	91000402 	add	x2, x0, #0x1
  40217c:	f9001422 	str	x2, [x1, #40]
  402180:	52800013 	mov	w19, #0x0                   	// #0
  402184:	52800141 	mov	w1, #0xa                   	// #10
  402188:	39000001 	strb	w1, [x0]
  40218c:	350002b4 	cbnz	w20, 0x4021e0
  402190:	a94157f4 	ldp	x20, x21, [sp, #16]
  402194:	2a1303e0 	mov	w0, w19
  402198:	a8c24ffe 	ldp	x30, x19, [sp], #32
  40219c:	d65f03c0 	ret
  4021a0:	aa0003f3 	mov	x19, x0
  4021a4:	aa1403e0 	mov	x0, x20
  4021a8:	94000d4f 	bl	0x4056e4
  4021ac:	2a0003e2 	mov	w2, w0
  4021b0:	aa1403e1 	mov	x1, x20
  4021b4:	aa1303e0 	mov	x0, x19
  4021b8:	2a0203f4 	mov	w20, w2
  4021bc:	12800013 	mov	w19, #0xffffffff            	// #-1
  4021c0:	94000e64 	bl	0x405b50
  4021c4:	36fffcc0 	tbz	w0, #31, 0x40215c
  4021c8:	17fffff1 	b	0x40218c
  4021cc:	910802a0 	add	x0, x21, #0x200
  4021d0:	52800141 	mov	w1, #0xa                   	// #10
  4021d4:	94000d84 	bl	0x4057e4
  4021d8:	131f7c13 	asr	w19, w0, #31
  4021dc:	17ffffec 	b	0x40218c
  4021e0:	910802a0 	add	x0, x21, #0x200
  4021e4:	94000d6e 	bl	0x40579c
  4021e8:	17ffffea 	b	0x402190
  4021ec:	51002421 	sub	w1, w1, #0x9
  4021f0:	7100443f 	cmp	w1, #0x11
  4021f4:	540013a8 	b.hi	0x402468  // b.pmore
  4021f8:	f0000023 	adrp	x3, 0x409000
  4021fc:	91066063 	add	x3, x3, #0x198
  402200:	78615863 	ldrh	w3, [x3, w1, uxtw #1]
  402204:	10000061 	adr	x1, 0x402210
  402208:	8b23a823 	add	x3, x1, w3, sxth #2
  40220c:	d61f0060 	br	x3
  402210:	b9401843 	ldr	w3, [x2, #24]
  402214:	f9400041 	ldr	x1, [x2]
  402218:	37f800e3 	tbnz	w3, #31, 0x402234
  40221c:	91002c23 	add	x3, x1, #0xb
  402220:	927df063 	and	x3, x3, #0xfffffffffffffff8
  402224:	f9000043 	str	x3, [x2]
  402228:	b9800021 	ldrsw	x1, [x1]
  40222c:	f9000001 	str	x1, [x0]
  402230:	d65f03c0 	ret
  402234:	11002064 	add	w4, w3, #0x8
  402238:	b9001844 	str	w4, [x2, #24]
  40223c:	7100009f 	cmp	w4, #0x0
  402240:	54fffeec 	b.gt	0x40221c
  402244:	f9400441 	ldr	x1, [x2, #8]
  402248:	8b23c021 	add	x1, x1, w3, sxtw
  40224c:	17fffff7 	b	0x402228
  402250:	b9401843 	ldr	w3, [x2, #24]
  402254:	f9400041 	ldr	x1, [x2]
  402258:	37f800e3 	tbnz	w3, #31, 0x402274
  40225c:	91002c23 	add	x3, x1, #0xb
  402260:	927df063 	and	x3, x3, #0xfffffffffffffff8
  402264:	f9000043 	str	x3, [x2]
  402268:	b9400021 	ldr	w1, [x1]
  40226c:	f9000001 	str	x1, [x0]
  402270:	d65f03c0 	ret
  402274:	11002064 	add	w4, w3, #0x8
  402278:	b9001844 	str	w4, [x2, #24]
  40227c:	7100009f 	cmp	w4, #0x0
  402280:	54fffeec 	b.gt	0x40225c
  402284:	f9400441 	ldr	x1, [x2, #8]
  402288:	8b23c021 	add	x1, x1, w3, sxtw
  40228c:	17fffff7 	b	0x402268
  402290:	b9401843 	ldr	w3, [x2, #24]
  402294:	f9400041 	ldr	x1, [x2]
  402298:	37f800e3 	tbnz	w3, #31, 0x4022b4
  40229c:	91002c23 	add	x3, x1, #0xb
  4022a0:	927df063 	and	x3, x3, #0xfffffffffffffff8
  4022a4:	f9000043 	str	x3, [x2]
  4022a8:	79800021 	ldrsh	x1, [x1]
  4022ac:	f9000001 	str	x1, [x0]
  4022b0:	d65f03c0 	ret
  4022b4:	11002064 	add	w4, w3, #0x8
  4022b8:	b9001844 	str	w4, [x2, #24]
  4022bc:	7100009f 	cmp	w4, #0x0
  4022c0:	54fffeec 	b.gt	0x40229c
  4022c4:	f9400441 	ldr	x1, [x2, #8]
  4022c8:	8b23c021 	add	x1, x1, w3, sxtw
  4022cc:	17fffff7 	b	0x4022a8
  4022d0:	b9401843 	ldr	w3, [x2, #24]
  4022d4:	f9400041 	ldr	x1, [x2]
  4022d8:	37f800e3 	tbnz	w3, #31, 0x4022f4
  4022dc:	91002c23 	add	x3, x1, #0xb
  4022e0:	927df063 	and	x3, x3, #0xfffffffffffffff8
  4022e4:	f9000043 	str	x3, [x2]
  4022e8:	79400021 	ldrh	w1, [x1]
  4022ec:	f9000001 	str	x1, [x0]
  4022f0:	d65f03c0 	ret
  4022f4:	11002064 	add	w4, w3, #0x8
  4022f8:	b9001844 	str	w4, [x2, #24]
  4022fc:	7100009f 	cmp	w4, #0x0
  402300:	54fffeec 	b.gt	0x4022dc
  402304:	f9400441 	ldr	x1, [x2, #8]
  402308:	8b23c021 	add	x1, x1, w3, sxtw
  40230c:	17fffff7 	b	0x4022e8
  402310:	b9401843 	ldr	w3, [x2, #24]
  402314:	f9400041 	ldr	x1, [x2]
  402318:	37f800e3 	tbnz	w3, #31, 0x402334
  40231c:	91002c23 	add	x3, x1, #0xb
  402320:	927df063 	and	x3, x3, #0xfffffffffffffff8
  402324:	f9000043 	str	x3, [x2]
  402328:	39800021 	ldrsb	x1, [x1]
  40232c:	f9000001 	str	x1, [x0]
  402330:	d65f03c0 	ret
  402334:	11002064 	add	w4, w3, #0x8
  402338:	b9001844 	str	w4, [x2, #24]
  40233c:	7100009f 	cmp	w4, #0x0
  402340:	54fffeec 	b.gt	0x40231c
  402344:	f9400441 	ldr	x1, [x2, #8]
  402348:	8b23c021 	add	x1, x1, w3, sxtw
  40234c:	17fffff7 	b	0x402328
  402350:	b9401843 	ldr	w3, [x2, #24]
  402354:	f9400041 	ldr	x1, [x2]
  402358:	37f800e3 	tbnz	w3, #31, 0x402374
  40235c:	91002c23 	add	x3, x1, #0xb
  402360:	927df063 	and	x3, x3, #0xfffffffffffffff8
  402364:	f9000043 	str	x3, [x2]
  402368:	39400021 	ldrb	w1, [x1]
  40236c:	f9000001 	str	x1, [x0]
  402370:	d65f03c0 	ret
  402374:	11002064 	add	w4, w3, #0x8
  402378:	b9001844 	str	w4, [x2, #24]
  40237c:	7100009f 	cmp	w4, #0x0
  402380:	54fffeec 	b.gt	0x40235c
  402384:	f9400441 	ldr	x1, [x2, #8]
  402388:	8b23c021 	add	x1, x1, w3, sxtw
  40238c:	17fffff7 	b	0x402368
  402390:	b9401843 	ldr	w3, [x2, #24]
  402394:	f9400041 	ldr	x1, [x2]
  402398:	37f800e3 	tbnz	w3, #31, 0x4023b4
  40239c:	91003c23 	add	x3, x1, #0xf
  4023a0:	927df063 	and	x3, x3, #0xfffffffffffffff8
  4023a4:	f9000043 	str	x3, [x2]
  4023a8:	f9400021 	ldr	x1, [x1]
  4023ac:	f9000001 	str	x1, [x0]
  4023b0:	d65f03c0 	ret
  4023b4:	11002064 	add	w4, w3, #0x8
  4023b8:	b9001844 	str	w4, [x2, #24]
  4023bc:	7100009f 	cmp	w4, #0x0
  4023c0:	54fffeec 	b.gt	0x40239c
  4023c4:	f9400441 	ldr	x1, [x2, #8]
  4023c8:	8b23c021 	add	x1, x1, w3, sxtw
  4023cc:	17fffff7 	b	0x4023a8
  4023d0:	b9401c43 	ldr	w3, [x2, #28]
  4023d4:	f81e0ffe 	str	x30, [sp, #-32]!
  4023d8:	f9400041 	ldr	x1, [x2]
  4023dc:	37f80163 	tbnz	w3, #31, 0x402408
  4023e0:	91003c23 	add	x3, x1, #0xf
  4023e4:	927df063 	and	x3, x3, #0xfffffffffffffff8
  4023e8:	f9000043 	str	x3, [x2]
  4023ec:	fd400020 	ldr	d0, [x1]
  4023f0:	f9000fe0 	str	x0, [sp, #24]
  4023f4:	94001a57 	bl	0x408d50
  4023f8:	f9400fe0 	ldr	x0, [sp, #24]
  4023fc:	3d800000 	str	q0, [x0]
  402400:	f84207fe 	ldr	x30, [sp], #32
  402404:	d65f03c0 	ret
  402408:	11004064 	add	w4, w3, #0x10
  40240c:	b9001c44 	str	w4, [x2, #28]
  402410:	7100009f 	cmp	w4, #0x0
  402414:	54fffe6c 	b.gt	0x4023e0
  402418:	f9400841 	ldr	x1, [x2, #16]
  40241c:	8b23c021 	add	x1, x1, w3, sxtw
  402420:	17fffff3 	b	0x4023ec
  402424:	b9401c43 	ldr	w3, [x2, #28]
  402428:	f9400041 	ldr	x1, [x2]
  40242c:	37f80103 	tbnz	w3, #31, 0x40244c
  402430:	91003c21 	add	x1, x1, #0xf
  402434:	927cec21 	and	x1, x1, #0xfffffffffffffff0
  402438:	91004023 	add	x3, x1, #0x10
  40243c:	f9000043 	str	x3, [x2]
  402440:	3dc00020 	ldr	q0, [x1]
  402444:	3d800000 	str	q0, [x0]
  402448:	d65f03c0 	ret
  40244c:	11004064 	add	w4, w3, #0x10
  402450:	b9001c44 	str	w4, [x2, #28]
  402454:	7100009f 	cmp	w4, #0x0
  402458:	54fffecc 	b.gt	0x402430
  40245c:	f9400841 	ldr	x1, [x2, #16]
  402460:	8b23c021 	add	x1, x1, w3, sxtw
  402464:	17fffff7 	b	0x402440
  402468:	d65f03c0 	ret
  40246c:	a9ad4ffe 	stp	x30, x19, [sp, #-304]!
  402470:	12001c21 	and	w1, w1, #0xff
  402474:	a90157f4 	stp	x20, x21, [sp, #16]
  402478:	4b030055 	sub	w21, w2, w3
  40247c:	52802002 	mov	w2, #0x100                 	// #256
  402480:	6b0202bf 	cmp	w21, w2
  402484:	aa0003f4 	mov	x20, x0
  402488:	1a82d2a2 	csel	w2, w21, w2, le
  40248c:	f90013f6 	str	x22, [sp, #32]
  402490:	9100c3f6 	add	x22, sp, #0x30
  402494:	2a1503f3 	mov	w19, w21
  402498:	93407c42 	sxtw	x2, w2
  40249c:	aa1603e0 	mov	x0, x22
  4024a0:	94000934 	bl	0x404970
  4024a4:	b9400284 	ldr	w4, [x20]
  4024a8:	14000002 	b	0x4024b0
  4024ac:	51040273 	sub	w19, w19, #0x100
  4024b0:	121b0081 	and	w1, w4, #0x20
  4024b4:	7103fe7f 	cmp	w19, #0xff
  4024b8:	54000109 	b.ls	0x4024d8  // b.plast
  4024bc:	35ffff81 	cbnz	w1, 0x4024ac
  4024c0:	aa1403e2 	mov	x2, x20
  4024c4:	aa1603e0 	mov	x0, x22
  4024c8:	d2802001 	mov	x1, #0x100                 	// #256
  4024cc:	97fffe94 	bl	0x401f1c
  4024d0:	b9400284 	ldr	w4, [x20]
  4024d4:	17fffff6 	b	0x4024ac
  4024d8:	340000a1 	cbz	w1, 0x4024ec
  4024dc:	a94157f4 	ldp	x20, x21, [sp, #16]
  4024e0:	f94013f6 	ldr	x22, [sp, #32]
  4024e4:	a8d34ffe 	ldp	x30, x19, [sp], #304
  4024e8:	d65f03c0 	ret
  4024ec:	aa1403e2 	mov	x2, x20
  4024f0:	92401ea1 	and	x1, x21, #0xff
  4024f4:	aa1603e0 	mov	x0, x22
  4024f8:	97fffe89 	bl	0x401f1c
  4024fc:	17fffff8 	b	0x4024dc
  402500:	a9a67bfd 	stp	x29, x30, [sp, #-416]!
  402504:	5285112a 	mov	w10, #0x2889                	// #10377
  402508:	f0000027 	adrp	x7, 0x409000
  40250c:	910003fd 	mov	x29, sp
  402510:	a90153f3 	stp	x19, x20, [sp, #16]
  402514:	910900e7 	add	x7, x7, #0x240
  402518:	5280000b 	mov	w11, #0x0                   	// #0
  40251c:	a9025bf5 	stp	x21, x22, [sp, #32]
  402520:	72a0002a 	movk	w10, #0x1, lsl #16
  402524:	aa0003f5 	mov	x21, x0
  402528:	a90363f7 	stp	x23, x24, [sp, #48]
  40252c:	52800016 	mov	w22, #0x0                   	// #0
  402530:	a9046bf9 	stp	x25, x26, [sp, #64]
  402534:	aa0103fa 	mov	x26, x1
  402538:	a90573fb 	stp	x27, x28, [sp, #80]
  40253c:	d10043ff 	sub	sp, sp, #0x10
  402540:	a91113a3 	stp	x3, x4, [x29, #272]
  402544:	b90127bf 	str	wzr, [x29, #292]
  402548:	f90097a2 	str	x2, [x29, #296]
  40254c:	14000019 	b	0x4025b0
  402550:	38401e80 	ldrb	w0, [x20, #1]!
  402554:	7100941f 	cmp	w0, #0x25
  402558:	7a401804 	ccmp	w0, #0x0, #0x4, ne	// ne = any
  40255c:	54ffffa1 	b.ne	0x402550  // b.any
  402560:	aa1403f3 	mov	x19, x20
  402564:	14000003 	b	0x402570
  402568:	91000694 	add	x20, x20, #0x1
  40256c:	91000a73 	add	x19, x19, #0x2
  402570:	39400260 	ldrb	w0, [x19]
  402574:	7100941f 	cmp	w0, #0x25
  402578:	54000081 	b.ne	0x402588  // b.any
  40257c:	39400660 	ldrb	w0, [x19, #1]
  402580:	7100941f 	cmp	w0, #0x25
  402584:	54ffff20 	b.eq	0x402568  // b.none
  402588:	4b16037c 	sub	w28, w27, w22
  40258c:	cb1a0294 	sub	x20, x20, x26
  402590:	eb3cc29f 	cmp	x20, w28, sxtw
  402594:	5400f6ec 	b.gt	0x404470
  402598:	2a1403eb 	mov	w11, w20
  40259c:	b4000075 	cbz	x21, 0x4025a8
  4025a0:	b94002a0 	ldr	w0, [x21]
  4025a4:	36280180 	tbz	w0, #5, 0x4025d4
  4025a8:	340002d4 	cbz	w20, 0x402600
  4025ac:	aa1303fa 	mov	x26, x19
  4025b0:	12b0001b 	mov	w27, #0x7fffffff            	// #2147483647
  4025b4:	4b160360 	sub	w0, w27, w22
  4025b8:	6b0b001f 	cmp	w0, w11
  4025bc:	5400f5ab 	b.lt	0x404470  // b.tstop
  4025c0:	39400340 	ldrb	w0, [x26]
  4025c4:	0b0b02d6 	add	w22, w22, w11
  4025c8:	34010080 	cbz	w0, 0x4045d8
  4025cc:	aa1a03f4 	mov	x20, x26
  4025d0:	17ffffe1 	b	0x402554
  4025d4:	aa1503e2 	mov	x2, x21
  4025d8:	93407e81 	sxtw	x1, w20
  4025dc:	aa1a03e0 	mov	x0, x26
  4025e0:	f9007fa7 	str	x7, [x29, #248]
  4025e4:	b90103b4 	str	w20, [x29, #256]
  4025e8:	97fffe4d 	bl	0x401f1c
  4025ec:	5285112a 	mov	w10, #0x2889                	// #10377
  4025f0:	b94103ab 	ldr	w11, [x29, #256]
  4025f4:	f9407fa7 	ldr	x7, [x29, #248]
  4025f8:	72a0002a 	movk	w10, #0x1, lsl #16
  4025fc:	17ffffeb 	b	0x4025a8
  402600:	39400661 	ldrb	w1, [x19, #1]
  402604:	5100c022 	sub	w2, w1, #0x30
  402608:	7100245f 	cmp	w2, #0x9
  40260c:	54000088 	b.hi	0x40261c  // b.pmore
  402610:	39400a60 	ldrb	w0, [x19, #2]
  402614:	7100901f 	cmp	w0, #0x24
  402618:	540000c0 	b.eq	0x402630  // b.none
  40261c:	91000673 	add	x19, x19, #0x1
  402620:	12800002 	mov	w2, #0xffffffff            	// #-1
  402624:	52800017 	mov	w23, #0x0                   	// #0
  402628:	52800024 	mov	w4, #0x1                   	// #1
  40262c:	14000009 	b	0x402650
  402630:	39400e61 	ldrb	w1, [x19, #3]
  402634:	52800020 	mov	w0, #0x1                   	// #1
  402638:	91000e73 	add	x19, x19, #0x3
  40263c:	b90127a0 	str	w0, [x29, #292]
  402640:	17fffff9 	b	0x402624
  402644:	38401e61 	ldrb	w1, [x19, #1]!
  402648:	1ac02080 	lsl	w0, w4, w0
  40264c:	2a0002f7 	orr	w23, w23, w0
  402650:	51008020 	sub	w0, w1, #0x20
  402654:	71007c1f 	cmp	w0, #0x1f
  402658:	540003e8 	b.hi	0x4026d4  // b.pmore
  40265c:	1ac02543 	lsr	w3, w10, w0
  402660:	3707ff23 	tbnz	w3, #0, 0x402644
  402664:	7100a83f 	cmp	w1, #0x2a
  402668:	54000361 	b.ne	0x4026d4  // b.any
  40266c:	39400661 	ldrb	w1, [x19, #1]
  402670:	5100c020 	sub	w0, w1, #0x30
  402674:	7100241f 	cmp	w0, #0x9
  402678:	54000088 	b.hi	0x402688  // b.pmore
  40267c:	39400a60 	ldrb	w0, [x19, #2]
  402680:	7100901f 	cmp	w0, #0x24
  402684:	54000360 	b.eq	0x4026f0  // b.none
  402688:	b94127a0 	ldr	w0, [x29, #292]
  40268c:	3500fd60 	cbnz	w0, 0x404638
  402690:	91000673 	add	x19, x19, #0x1
  402694:	2a1403f8 	mov	w24, w20
  402698:	b4000875 	cbz	x21, 0x4027a4
  40269c:	f94097a0 	ldr	x0, [x29, #296]
  4026a0:	b9401801 	ldr	w1, [x0, #24]
  4026a4:	f9400000 	ldr	x0, [x0]
  4026a8:	37f804e1 	tbnz	w1, #31, 0x402744
  4026ac:	f94097a3 	ldr	x3, [x29, #296]
  4026b0:	91002c01 	add	x1, x0, #0xb
  4026b4:	927df021 	and	x1, x1, #0xfffffffffffffff8
  4026b8:	f9000061 	str	x1, [x3]
  4026bc:	b9400018 	ldr	w24, [x0]
  4026c0:	39400261 	ldrb	w1, [x19]
  4026c4:	36f80718 	tbz	w24, #31, 0x4027a4
  4026c8:	321302f7 	orr	w23, w23, #0x2000
  4026cc:	4b1803f8 	neg	w24, w24
  4026d0:	14000035 	b	0x4027a4
  4026d4:	52999983 	mov	w3, #0xcccc                	// #52428
  4026d8:	2a1403f8 	mov	w24, w20
  4026dc:	72a19983 	movk	w3, #0xccc, lsl #16
  4026e0:	12800128 	mov	w8, #0xfffffff6            	// #-10
  4026e4:	12b0000c 	mov	w12, #0x7fffffff            	// #2147483647
  4026e8:	1280000d 	mov	w13, #0xffffffff            	// #-1
  4026ec:	14000021 	b	0x402770
  4026f0:	91000e63 	add	x3, x19, #0x3
  4026f4:	b4000135 	cbz	x21, 0x402718
  4026f8:	92805fe0 	mov	x0, #0xfffffffffffffd00    	// #-768
  4026fc:	aa0303f3 	mov	x19, x3
  402700:	8b215000 	add	x0, x0, w1, uxtw #4
  402704:	52800021 	mov	w1, #0x1                   	// #1
  402708:	b90127a1 	str	w1, [x29, #292]
  40270c:	f9408ba1 	ldr	x1, [x29, #272]
  402710:	b8606838 	ldr	w24, [x1, x0]
  402714:	17ffffeb 	b	0x4026c0
  402718:	928017e0 	mov	x0, #0xffffffffffffff40    	// #-192
  40271c:	52800148 	mov	w8, #0xa                   	// #10
  402720:	8b214800 	add	x0, x0, w1, uxtw #2
  402724:	52800021 	mov	w1, #0x1                   	// #1
  402728:	b90127a1 	str	w1, [x29, #292]
  40272c:	2a1403f8 	mov	w24, w20
  402730:	f9408fa1 	ldr	x1, [x29, #280]
  402734:	b8206828 	str	w8, [x1, x0]
  402738:	39400e61 	ldrb	w1, [x19, #3]
  40273c:	aa0303f3 	mov	x19, x3
  402740:	14000019 	b	0x4027a4
  402744:	f94097a4 	ldr	x4, [x29, #296]
  402748:	11002023 	add	w3, w1, #0x8
  40274c:	b9001883 	str	w3, [x4, #24]
  402750:	7100007f 	cmp	w3, #0x0
  402754:	54fffacc 	b.gt	0x4026ac
  402758:	f94097a0 	ldr	x0, [x29, #296]
  40275c:	f9400400 	ldr	x0, [x0, #8]
  402760:	8b21c000 	add	x0, x0, w1, sxtw
  402764:	17ffffd6 	b	0x4026bc
  402768:	12800018 	mov	w24, #0xffffffff            	// #-1
  40276c:	38401e61 	ldrb	w1, [x19, #1]!
  402770:	5100c020 	sub	w0, w1, #0x30
  402774:	7100241f 	cmp	w0, #0x9
  402778:	54000128 	b.hi	0x40279c  // b.pmore
  40277c:	6b03031f 	cmp	w24, w3
  402780:	54ffff48 	b.hi	0x402768  // b.pmore
  402784:	1b087f04 	mul	w4, w24, w8
  402788:	0b0c0081 	add	w1, w4, w12
  40278c:	4b040004 	sub	w4, w0, w4
  402790:	6b01001f 	cmp	w0, w1
  402794:	1a8dd098 	csel	w24, w4, w13, le
  402798:	17fffff5 	b	0x40276c
  40279c:	3100071f 	cmn	w24, #0x1
  4027a0:	5400e680 	b.eq	0x404470  // b.none
  4027a4:	7100b83f 	cmp	w1, #0x2e
  4027a8:	540009e1 	b.ne	0x4028e4  // b.any
  4027ac:	39400660 	ldrb	w0, [x19, #1]
  4027b0:	7100a81f 	cmp	w0, #0x2a
  4027b4:	540006a1 	b.ne	0x402888  // b.any
  4027b8:	39400a60 	ldrb	w0, [x19, #2]
  4027bc:	5100c001 	sub	w1, w0, #0x30
  4027c0:	7100243f 	cmp	w1, #0x9
  4027c4:	54000088 	b.hi	0x4027d4  // b.pmore
  4027c8:	39400e61 	ldrb	w1, [x19, #3]
  4027cc:	7100903f 	cmp	w1, #0x24
  4027d0:	54000220 	b.eq	0x402814  // b.none
  4027d4:	b94127a0 	ldr	w0, [x29, #292]
  4027d8:	3500f300 	cbnz	w0, 0x404638
  4027dc:	b4000515 	cbz	x21, 0x40287c
  4027e0:	f94097a0 	ldr	x0, [x29, #296]
  4027e4:	b9401801 	ldr	w1, [x0, #24]
  4027e8:	f9400000 	ldr	x0, [x0]
  4027ec:	37f80361 	tbnz	w1, #31, 0x402858
  4027f0:	f94097a3 	ldr	x3, [x29, #296]
  4027f4:	91002c01 	add	x1, x0, #0xb
  4027f8:	927df021 	and	x1, x1, #0xfffffffffffffff8
  4027fc:	f9000061 	str	x1, [x3]
  402800:	b9400008 	ldr	w8, [x0]
  402804:	2a2803e3 	mvn	w3, w8
  402808:	531f7c63 	lsr	w3, w3, #31
  40280c:	91000a73 	add	x19, x19, #0x2
  402810:	14000037 	b	0x4028ec
  402814:	b4000135 	cbz	x21, 0x402838
  402818:	92805fe1 	mov	x1, #0xfffffffffffffd00    	// #-768
  40281c:	8b205020 	add	x0, x1, w0, uxtw #4
  402820:	f9408ba1 	ldr	x1, [x29, #272]
  402824:	f8606828 	ldr	x8, [x1, x0]
  402828:	2a2803e3 	mvn	w3, w8
  40282c:	531f7c63 	lsr	w3, w3, #31
  402830:	91001273 	add	x19, x19, #0x4
  402834:	1400002e 	b	0x4028ec
  402838:	f9408fa4 	ldr	x4, [x29, #280]
  40283c:	928017e3 	mov	x3, #0xffffffffffffff40    	// #-192
  402840:	8b204860 	add	x0, x3, w0, uxtw #2
  402844:	52800141 	mov	w1, #0xa                   	// #10
  402848:	2a1403e8 	mov	w8, w20
  40284c:	52800023 	mov	w3, #0x1                   	// #1
  402850:	b8206881 	str	w1, [x4, x0]
  402854:	17fffff7 	b	0x402830
  402858:	f94097a4 	ldr	x4, [x29, #296]
  40285c:	11002023 	add	w3, w1, #0x8
  402860:	b9001883 	str	w3, [x4, #24]
  402864:	7100007f 	cmp	w3, #0x0
  402868:	54fffc4c 	b.gt	0x4027f0
  40286c:	f94097a0 	ldr	x0, [x29, #296]
  402870:	f9400400 	ldr	x0, [x0, #8]
  402874:	8b21c000 	add	x0, x0, w1, sxtw
  402878:	17ffffe2 	b	0x402800
  40287c:	2a1403e8 	mov	w8, w20
  402880:	52800023 	mov	w3, #0x1                   	// #1
  402884:	17ffffe2 	b	0x40280c
  402888:	52999981 	mov	w1, #0xcccc                	// #52428
  40288c:	91000673 	add	x19, x19, #0x1
  402890:	2a1403e8 	mov	w8, w20
  402894:	72a19981 	movk	w1, #0xccc, lsl #16
  402898:	12800123 	mov	w3, #0xfffffff6            	// #-10
  40289c:	12b0000c 	mov	w12, #0x7fffffff            	// #2147483647
  4028a0:	1280000d 	mov	w13, #0xffffffff            	// #-1
  4028a4:	14000003 	b	0x4028b0
  4028a8:	12800008 	mov	w8, #0xffffffff            	// #-1
  4028ac:	38401e60 	ldrb	w0, [x19, #1]!
  4028b0:	5100c000 	sub	w0, w0, #0x30
  4028b4:	7100241f 	cmp	w0, #0x9
  4028b8:	54000128 	b.hi	0x4028dc  // b.pmore
  4028bc:	6b01011f 	cmp	w8, w1
  4028c0:	54ffff48 	b.hi	0x4028a8  // b.pmore
  4028c4:	1b037d08 	mul	w8, w8, w3
  4028c8:	0b0c010e 	add	w14, w8, w12
  4028cc:	4b080008 	sub	w8, w0, w8
  4028d0:	6b0e001f 	cmp	w0, w14
  4028d4:	1a8dd108 	csel	w8, w8, w13, le
  4028d8:	17fffff5 	b	0x4028ac
  4028dc:	52800023 	mov	w3, #0x1                   	// #1
  4028e0:	14000003 	b	0x4028ec
  4028e4:	2a1403e3 	mov	w3, w20
  4028e8:	12800008 	mov	w8, #0xffffffff            	// #-1
  4028ec:	52800019 	mov	w25, #0x0                   	// #0
  4028f0:	14000002 	b	0x4028f8
  4028f4:	2a0103f9 	mov	w25, w1
  4028f8:	39400261 	ldrb	w1, [x19]
  4028fc:	51010421 	sub	w1, w1, #0x41
  402900:	7100e43f 	cmp	w1, #0x39
  402904:	5400e9a8 	b.hi	0x404638  // b.pmore
  402908:	2a1903ec 	mov	w12, w25
  40290c:	d37d7f20 	ubfiz	x0, x25, #3, #32
  402910:	cb0c0000 	sub	x0, x0, x12
  402914:	91000673 	add	x19, x19, #0x1
  402918:	8b000980 	add	x0, x12, x0, lsl #2
  40291c:	8b0004e0 	add	x0, x7, x0, lsl #1
  402920:	3861c801 	ldrb	w1, [x0, w1, sxtw]
  402924:	51000420 	sub	w0, w1, #0x1
  402928:	71001c1f 	cmp	w0, #0x7
  40292c:	54fffe49 	b.ls	0x4028f4  // b.plast
  402930:	3400e841 	cbz	w1, 0x404638
  402934:	71006c3f 	cmp	w1, #0x1b
  402938:	54000380 	b.eq	0x4029a8  // b.none
  40293c:	3100045f 	cmn	w2, #0x1
  402940:	54000440 	b.eq	0x4029c8  // b.none
  402944:	b40003d5 	cbz	x21, 0x4029bc
  402948:	f9408ba0 	ldr	x0, [x29, #272]
  40294c:	8b22d002 	add	x2, x0, w2, sxtw #4
  402950:	a9400440 	ldp	x0, x1, [x2]
  402954:	a91507a0 	stp	x0, x1, [x29, #336]
  402958:	b94002a0 	ldr	w0, [x21]
  40295c:	3728e740 	tbnz	w0, #5, 0x404644
  402960:	385ff262 	ldurb	w2, [x19, #-1]
  402964:	340000b9 	cbz	w25, 0x402978
  402968:	12000c41 	and	w1, w2, #0xf
  40296c:	121a7840 	and	w0, w2, #0xffffffdf
  402970:	71000c3f 	cmp	w1, #0x3
  402974:	1a820002 	csel	w2, w0, w2, eq	// eq = none
  402978:	f27302ff 	tst	x23, #0x2000
  40297c:	120f7ae1 	and	w1, w23, #0xfffeffff
  402980:	51010440 	sub	w0, w2, #0x41
  402984:	1a971037 	csel	w23, w1, w23, ne	// ne = any
  402988:	7100dc1f 	cmp	w0, #0x37
  40298c:	5400d7a8 	b.hi	0x404480  // b.pmore
  402990:	f0000021 	adrp	x1, 0x409000
  402994:	9106f021 	add	x1, x1, #0x1bc
  402998:	78605821 	ldrh	w1, [x1, w0, uxtw #1]
  40299c:	10000060 	adr	x0, 0x4029a8
  4029a0:	8b21a801 	add	x1, x0, w1, sxth #2
  4029a4:	d61f0020 	br	x1
  4029a8:	3100045f 	cmn	w2, #0x1
  4029ac:	5400e461 	b.ne	0x404638  // b.any
  4029b0:	b5fffd55 	cbnz	x21, 0x402958
  4029b4:	aa1303fa 	mov	x26, x19
  4029b8:	17ffff02 	b	0x4025c0
  4029bc:	f9408fa0 	ldr	x0, [x29, #280]
  4029c0:	b822d801 	str	w1, [x0, w2, sxtw #2]
  4029c4:	17fffffc 	b	0x4029b4
  4029c8:	b40001f5 	cbz	x21, 0x402a04
  4029cc:	f94097a2 	ldr	x2, [x29, #296]
  4029d0:	910543a0 	add	x0, x29, #0x150
  4029d4:	b900e3a8 	str	w8, [x29, #224]
  4029d8:	f9007ba7 	str	x7, [x29, #240]
  4029dc:	b900fbab 	str	w11, [x29, #248]
  4029e0:	b90103a3 	str	w3, [x29, #256]
  4029e4:	97fffe02 	bl	0x4021ec
  4029e8:	5285112a 	mov	w10, #0x2889                	// #10377
  4029ec:	b940e3a8 	ldr	w8, [x29, #224]
  4029f0:	f9407ba7 	ldr	x7, [x29, #240]
  4029f4:	72a0002a 	movk	w10, #0x1, lsl #16
  4029f8:	b940fbab 	ldr	w11, [x29, #248]
  4029fc:	b94103a3 	ldr	w3, [x29, #256]
  402a00:	17ffffd6 	b	0x402958
  402a04:	52800016 	mov	w22, #0x0                   	// #0
  402a08:	14000710 	b	0x404648
  402a0c:	f940abab 	ldr	x11, [x29, #336]
  402a10:	14000100 	b	0x402e10
  402a14:	121b004d 	and	w13, w2, #0x20
  402a18:	f940abab 	ldr	x11, [x29, #336]
  402a1c:	9105e3ae 	add	x14, x29, #0x178
  402a20:	f000002c 	adrp	x12, 0x409000
  402a24:	aa0e03fa 	mov	x26, x14
  402a28:	9108c18c 	add	x12, x12, #0x230
  402a2c:	aa0b03e0 	mov	x0, x11
  402a30:	1400003e 	b	0x402b28
  402a34:	f940abb9 	ldr	x25, [x29, #336]
  402a38:	93407d1b 	sxtw	x27, w8
  402a3c:	aa1903fa 	mov	x26, x25
  402a40:	9104c3b4 	add	x20, x29, #0x130
  402a44:	d280001c 	mov	x28, #0x0                   	// #0
  402a48:	eb1b039f 	cmp	x28, x27
  402a4c:	54002022 	b.cs	0x402e50  // b.hs, b.nlast
  402a50:	b9400341 	ldr	w1, [x26]
  402a54:	34001fe1 	cbz	w1, 0x402e50
  402a58:	9100135a 	add	x26, x26, #0x4
  402a5c:	aa1403e0 	mov	x0, x20
  402a60:	f90083a7 	str	x7, [x29, #256]
  402a64:	94000ae0 	bl	0x4055e4
  402a68:	37f8dee0 	tbnz	w0, #31, 0x404644
  402a6c:	93407c00 	sxtw	x0, w0
  402a70:	cb1c0361 	sub	x1, x27, x28
  402a74:	5285112a 	mov	w10, #0x2889                	// #10377
  402a78:	eb01001f 	cmp	x0, x1
  402a7c:	f94083a7 	ldr	x7, [x29, #256]
  402a80:	72a0002a 	movk	w10, #0x1, lsl #16
  402a84:	54001e68 	b.hi	0x402e50  // b.pmore
  402a88:	8b00039c 	add	x28, x28, x0
  402a8c:	17ffffef 	b	0x402a48
  402a90:	71000f3f 	cmp	w25, #0x3
  402a94:	54000240 	b.eq	0x402adc  // b.none
  402a98:	54000108 	b.hi	0x402ab8  // b.pmore
  402a9c:	7100073f 	cmp	w25, #0x1
  402aa0:	54000240 	b.eq	0x402ae8  // b.none
  402aa4:	71000b3f 	cmp	w25, #0x2
  402aa8:	54000200 	b.eq	0x402ae8  // b.none
  402aac:	f940aba0 	ldr	x0, [x29, #336]
  402ab0:	b9000016 	str	w22, [x0]
  402ab4:	17ffffc0 	b	0x4029b4
  402ab8:	71001b3f 	cmp	w25, #0x6
  402abc:	54000160 	b.eq	0x402ae8  // b.none
  402ac0:	71001f3f 	cmp	w25, #0x7
  402ac4:	54000120 	b.eq	0x402ae8  // b.none
  402ac8:	7100133f 	cmp	w25, #0x4
  402acc:	54fff741 	b.ne	0x4029b4  // b.any
  402ad0:	f940aba0 	ldr	x0, [x29, #336]
  402ad4:	39000016 	strb	w22, [x0]
  402ad8:	17ffffb7 	b	0x4029b4
  402adc:	f940aba0 	ldr	x0, [x29, #336]
  402ae0:	79000016 	strh	w22, [x0]
  402ae4:	17ffffb4 	b	0x4029b4
  402ae8:	f940aba0 	ldr	x0, [x29, #336]
  402aec:	93407ec1 	sxtw	x1, w22
  402af0:	f9000001 	str	x1, [x0]
  402af4:	17ffffb0 	b	0x4029b4
  402af8:	7100411f 	cmp	w8, #0x10
  402afc:	52800200 	mov	w0, #0x10                  	// #16
  402b00:	321d02f7 	orr	w23, w23, #0x8
  402b04:	1a802108 	csel	w8, w8, w0, cs	// cs = hs, nlast
  402b08:	5280040d 	mov	w13, #0x20                  	// #32
  402b0c:	52800f02 	mov	w2, #0x78                  	// #120
  402b10:	17ffffc2 	b	0x402a18
  402b14:	92400c01 	and	x1, x0, #0xf
  402b18:	d344fc00 	lsr	x0, x0, #4
  402b1c:	38616981 	ldrb	w1, [x12, x1]
  402b20:	2a0101a1 	orr	w1, w13, w1
  402b24:	381fff41 	strb	w1, [x26, #-1]!
  402b28:	b5ffff60 	cbnz	x0, 0x402b14
  402b2c:	b400094b 	cbz	x11, 0x402c54
  402b30:	36180937 	tbz	w23, #3, 0x402c54
  402b34:	13047c42 	asr	w2, w2, #4
  402b38:	f0000020 	adrp	x0, 0x409000
  402b3c:	91040000 	add	x0, x0, #0x100
  402b40:	5280005b 	mov	w27, #0x2                   	// #2
  402b44:	8b22c004 	add	x4, x0, w2, sxtw
  402b48:	14000046 	b	0x402c60
  402b4c:	f940abab 	ldr	x11, [x29, #336]
  402b50:	9105e3ae 	add	x14, x29, #0x178
  402b54:	aa0e03fa 	mov	x26, x14
  402b58:	aa0b03e1 	mov	x1, x11
  402b5c:	14000005 	b	0x402b70
  402b60:	12000820 	and	w0, w1, #0x7
  402b64:	d343fc21 	lsr	x1, x1, #3
  402b68:	1100c000 	add	w0, w0, #0x30
  402b6c:	381fff40 	strb	w0, [x26, #-1]!
  402b70:	b5ffff81 	cbnz	x1, 0x402b60
  402b74:	36180717 	tbz	w23, #3, 0x402c54
  402b78:	cb1a01c0 	sub	x0, x14, x26
  402b7c:	eb28c01f 	cmp	x0, w8, sxtw
  402b80:	540006ab 	b.lt	0x402c54  // b.tstop
  402b84:	f0000039 	adrp	x25, 0x409000
  402b88:	11000408 	add	w8, w0, #0x1
  402b8c:	2a1403fb 	mov	w27, w20
  402b90:	91040324 	add	x4, x25, #0x100
  402b94:	14000033 	b	0x402c60
  402b98:	f940abab 	ldr	x11, [x29, #336]
  402b9c:	b7f800eb 	tbnz	x11, #63, 0x402bb8
  402ba0:	375802f7 	tbnz	w23, #11, 0x402bfc
  402ba4:	36000357 	tbz	w23, #0, 0x402c0c
  402ba8:	f0000039 	adrp	x25, 0x409000
  402bac:	5280003b 	mov	w27, #0x1                   	// #1
  402bb0:	91040b24 	add	x4, x25, #0x102
  402bb4:	14000007 	b	0x402bd0
  402bb8:	cb0b03e0 	neg	x0, x11
  402bbc:	f0000039 	adrp	x25, 0x409000
  402bc0:	aa0003eb 	mov	x11, x0
  402bc4:	91040324 	add	x4, x25, #0x100
  402bc8:	5280003b 	mov	w27, #0x1                   	// #1
  402bcc:	f900aba0 	str	x0, [x29, #336]
  402bd0:	9105e3ae 	add	x14, x29, #0x178
  402bd4:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
  402bd8:	aa0b03e1 	mov	x1, x11
  402bdc:	aa0e03fa 	mov	x26, x14
  402be0:	f29999a2 	movk	x2, #0xcccd
  402be4:	14000015 	b	0x402c38
  402be8:	f940abab 	ldr	x11, [x29, #336]
  402bec:	f0000039 	adrp	x25, 0x409000
  402bf0:	2a1403fb 	mov	w27, w20
  402bf4:	91040324 	add	x4, x25, #0x100
  402bf8:	17fffff6 	b	0x402bd0
  402bfc:	f0000039 	adrp	x25, 0x409000
  402c00:	5280003b 	mov	w27, #0x1                   	// #1
  402c04:	91040724 	add	x4, x25, #0x101
  402c08:	17fffff2 	b	0x402bd0
  402c0c:	f0000039 	adrp	x25, 0x409000
  402c10:	2a1403fb 	mov	w27, w20
  402c14:	91040324 	add	x4, x25, #0x100
  402c18:	17ffffee 	b	0x402bd0
  402c1c:	9bc27c2c 	umulh	x12, x1, x2
  402c20:	d343fd8c 	lsr	x12, x12, #3
  402c24:	8b0c0980 	add	x0, x12, x12, lsl #2
  402c28:	cb000420 	sub	x0, x1, x0, lsl #1
  402c2c:	aa0c03e1 	mov	x1, x12
  402c30:	1100c000 	add	w0, w0, #0x30
  402c34:	381fff40 	strb	w0, [x26, #-1]!
  402c38:	f100243f 	cmp	x1, #0x9
  402c3c:	54ffff08 	b.hi	0x402c1c  // b.pmore
  402c40:	b4000101 	cbz	x1, 0x402c60
  402c44:	1100c021 	add	w1, w1, #0x30
  402c48:	d100075a 	sub	x26, x26, #0x1
  402c4c:	39000341 	strb	w1, [x26]
  402c50:	14000004 	b	0x402c60
  402c54:	f0000039 	adrp	x25, 0x409000
  402c58:	2a1403fb 	mov	w27, w20
  402c5c:	91040324 	add	x4, x25, #0x100
  402c60:	6a487c7f 	tst	w3, w8, lsr #31
  402c64:	5400c061 	b.ne	0x404470  // b.any
  402c68:	7100007f 	cmp	w3, #0x0
  402c6c:	120f7ae0 	and	w0, w23, #0xfffeffff
  402c70:	1a971017 	csel	w23, w0, w23, ne	// ne = any
  402c74:	f100017f 	cmp	x11, #0x0
  402c78:	1a9f17e0 	cset	w0, eq	// eq = none
  402c7c:	7100011f 	cmp	w8, #0x0
  402c80:	12b00001 	mov	w1, #0x7fffffff            	// #2147483647
  402c84:	7a400804 	ccmp	w0, #0x0, #0x4, eq	// eq = none
  402c88:	4b1b0021 	sub	w1, w1, w27
  402c8c:	5400c081 	b.ne	0x40449c  // b.any
  402c90:	cb1a01ce 	sub	x14, x14, x26
  402c94:	93407d08 	sxtw	x8, w8
  402c98:	8b0e0000 	add	x0, x0, x14
  402c9c:	eb08001f 	cmp	x0, x8
  402ca0:	9a88a008 	csel	x8, x0, x8, ge	// ge = tcont
  402ca4:	eb28c1df 	cmp	x14, w8, sxtw
  402ca8:	1a8ed108 	csel	w8, w8, w14, le
  402cac:	6b01011f 	cmp	w8, w1
  402cb0:	5400be0c 	b.gt	0x404470
  402cb4:	0b080379 	add	w25, w27, w8
  402cb8:	6b19031f 	cmp	w24, w25
  402cbc:	1a99a30b 	csel	w11, w24, w25, ge	// ge = tcont
  402cc0:	6b0b039f 	cmp	w28, w11
  402cc4:	5400bd6b 	b.lt	0x404470  // b.tstop
  402cc8:	12130ee0 	and	w0, w23, #0x1e000
  402ccc:	6b19017f 	cmp	w11, w25
  402cd0:	12107400 	and	w0, w0, #0xffff3fff
  402cd4:	1a9fc7f4 	cset	w20, le
  402cd8:	7100001f 	cmp	w0, #0x0
  402cdc:	7a400a80 	ccmp	w20, #0x0, #0x0, eq	// eq = none
  402ce0:	5400bf00 	b.eq	0x4044c0  // b.none
  402ce4:	b94002a0 	ldr	w0, [x21]
  402ce8:	3628c0c0 	tbz	w0, #5, 0x404500
  402cec:	12130ee0 	and	w0, w23, #0x1e000
  402cf0:	12107400 	and	w0, w0, #0xffff3fff
  402cf4:	7140401f 	cmp	w0, #0x10, lsl #12
  402cf8:	7a400a80 	ccmp	w20, #0x0, #0x0, eq	// eq = none
  402cfc:	5400c200 	b.eq	0x40453c  // b.none
  402d00:	6b0801df 	cmp	w14, w8
  402d04:	5400c38b 	b.lt	0x404574  // b.tstop
  402d08:	b94002a0 	ldr	w0, [x21]
  402d0c:	3628c500 	tbz	w0, #5, 0x4045ac
  402d10:	12130ee5 	and	w5, w23, #0x1e000
  402d14:	121074a5 	and	w5, w5, #0xffff3fff
  402d18:	714008bf 	cmp	w5, #0x2, lsl #12
  402d1c:	7a400a80 	ccmp	w20, #0x0, #0x0, eq	// eq = none
  402d20:	54ffc461 	b.ne	0x4025ac  // b.any
  402d24:	2a0b03e2 	mov	w2, w11
  402d28:	2a1903e3 	mov	w3, w25
  402d2c:	aa1503e0 	mov	x0, x21
  402d30:	52800401 	mov	w1, #0x20                  	// #32
  402d34:	f9007fa7 	str	x7, [x29, #248]
  402d38:	b90103ab 	str	w11, [x29, #256]
  402d3c:	97fffdcc 	bl	0x40246c
  402d40:	5285112a 	mov	w10, #0x2889                	// #10377
  402d44:	b94103ab 	ldr	w11, [x29, #256]
  402d48:	f9407fa7 	ldr	x7, [x29, #248]
  402d4c:	72a0002a 	movk	w10, #0x1, lsl #16
  402d50:	17fffe17 	b	0x4025ac
  402d54:	f9007fa7 	str	x7, [x29, #248]
  402d58:	b90103a8 	str	w8, [x29, #256]
  402d5c:	9400099b 	bl	0x4053c8
  402d60:	b9400000 	ldr	w0, [x0]
  402d64:	940009a9 	bl	0x405408
  402d68:	aa0003fa 	mov	x26, x0
  402d6c:	f9407fa7 	ldr	x7, [x29, #248]
  402d70:	b94103a8 	ldr	w8, [x29, #256]
  402d74:	f90083a7 	str	x7, [x29, #256]
  402d78:	37f80328 	tbnz	w8, #31, 0x402ddc
  402d7c:	93407d01 	sxtw	x1, w8
  402d80:	aa1a03e0 	mov	x0, x26
  402d84:	940007c3 	bl	0x404c90
  402d88:	aa0003ec 	mov	x12, x0
  402d8c:	f94083a7 	ldr	x7, [x29, #256]
  402d90:	5285112a 	mov	w10, #0x2889                	// #10377
  402d94:	8b00034e 	add	x14, x26, x0
  402d98:	72a0002a 	movk	w10, #0x1, lsl #16
  402d9c:	cb1a01ce 	sub	x14, x14, x26
  402da0:	120f7af7 	and	w23, w23, #0xfffeffff
  402da4:	2a0c03e8 	mov	w8, w12
  402da8:	eb2cc1df 	cmp	x14, w12, sxtw
  402dac:	5400b80d 	b.le	0x4044ac
  402db0:	f0000039 	adrp	x25, 0x409000
  402db4:	2a1403fb 	mov	w27, w20
  402db8:	2a0e03e8 	mov	w8, w14
  402dbc:	91040324 	add	x4, x25, #0x100
  402dc0:	17ffffbd 	b	0x402cb4
  402dc4:	f940abba 	ldr	x26, [x29, #336]
  402dc8:	f0000020 	adrp	x0, 0x409000
  402dcc:	91044000 	add	x0, x0, #0x110
  402dd0:	f100035f 	cmp	x26, #0x0
  402dd4:	9a9a001a 	csel	x26, x0, x26, eq	// eq = none
  402dd8:	17ffffe7 	b	0x402d74
  402ddc:	aa1a03e0 	mov	x0, x26
  402de0:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
  402de4:	940007ab 	bl	0x404c90
  402de8:	aa0003ec 	mov	x12, x0
  402dec:	8b00034e 	add	x14, x26, x0
  402df0:	38606b40 	ldrb	w0, [x26, x0]
  402df4:	5285112a 	mov	w10, #0x2889                	// #10377
  402df8:	f94083a7 	ldr	x7, [x29, #256]
  402dfc:	72a0002a 	movk	w10, #0x1, lsl #16
  402e00:	34fffce0 	cbz	w0, 0x402d9c
  402e04:	1400059b 	b	0x404470
  402e08:	f940abab 	ldr	x11, [x29, #336]
  402e0c:	b500014b 	cbnz	x11, 0x402e34
  402e10:	d280002e 	mov	x14, #0x1                   	// #1
  402e14:	f0000039 	adrp	x25, 0x409000
  402e18:	120f7af7 	and	w23, w23, #0xfffeffff
  402e1c:	2a1403fb 	mov	w27, w20
  402e20:	2a0e03e8 	mov	w8, w14
  402e24:	91040324 	add	x4, x25, #0x100
  402e28:	9105dfba 	add	x26, x29, #0x177
  402e2c:	3905dfab 	strb	w11, [x29, #375]
  402e30:	17ffffa1 	b	0x402cb4
  402e34:	9104e3a0 	add	x0, x29, #0x138
  402e38:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
  402e3c:	aa0003f9 	mov	x25, x0
  402e40:	b9013bab 	str	w11, [x29, #312]
  402e44:	b9013fbf 	str	wzr, [x29, #316]
  402e48:	f900aba0 	str	x0, [x29, #336]
  402e4c:	17fffefc 	b	0x402a3c
  402e50:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
  402e54:	eb00039f 	cmp	x28, x0
  402e58:	5400b0c8 	b.hi	0x404470  // b.pmore
  402e5c:	6b1c031f 	cmp	w24, w28
  402e60:	12130ee0 	and	w0, w23, #0x1e000
  402e64:	1a9fc7e1 	cset	w1, le
  402e68:	12107400 	and	w0, w0, #0xffff3fff
  402e6c:	b900fba1 	str	w1, [x29, #248]
  402e70:	7100001f 	cmp	w0, #0x0
  402e74:	2a1c03f4 	mov	w20, w28
  402e78:	7a400820 	ccmp	w1, #0x0, #0x0, eq	// eq = none
  402e7c:	54000380 	b.eq	0x402eec  // b.none
  402e80:	9104c3ba 	add	x26, x29, #0x130
  402e84:	d280001b 	mov	x27, #0x0                   	// #0
  402e88:	eb1b039f 	cmp	x28, x27
  402e8c:	54000449 	b.ls	0x402f14  // b.plast
  402e90:	b9400321 	ldr	w1, [x25]
  402e94:	34000401 	cbz	w1, 0x402f14
  402e98:	aa1a03e0 	mov	x0, x26
  402e9c:	f90083a7 	str	x7, [x29, #256]
  402ea0:	940009d1 	bl	0x4055e4
  402ea4:	93407c01 	sxtw	x1, w0
  402ea8:	8b01037b 	add	x27, x27, x1
  402eac:	5285112a 	mov	w10, #0x2889                	// #10377
  402eb0:	f94083a7 	ldr	x7, [x29, #256]
  402eb4:	91001339 	add	x25, x25, #0x4
  402eb8:	eb1c037f 	cmp	x27, x28
  402ebc:	72a0002a 	movk	w10, #0x1, lsl #16
  402ec0:	540002a8 	b.hi	0x402f14  // b.pmore
  402ec4:	b94002a0 	ldr	w0, [x21]
  402ec8:	372ffe00 	tbnz	w0, #5, 0x402e88
  402ecc:	aa1503e2 	mov	x2, x21
  402ed0:	aa1a03e0 	mov	x0, x26
  402ed4:	f90083a7 	str	x7, [x29, #256]
  402ed8:	97fffc11 	bl	0x401f1c
  402edc:	5285112a 	mov	w10, #0x2889                	// #10377
  402ee0:	f94083a7 	ldr	x7, [x29, #256]
  402ee4:	72a0002a 	movk	w10, #0x1, lsl #16
  402ee8:	17ffffe8 	b	0x402e88
  402eec:	2a1c03e3 	mov	w3, w28
  402ef0:	2a1803e2 	mov	w2, w24
  402ef4:	aa1503e0 	mov	x0, x21
  402ef8:	52800401 	mov	w1, #0x20                  	// #32
  402efc:	f90083a7 	str	x7, [x29, #256]
  402f00:	97fffd5b 	bl	0x40246c
  402f04:	5285112a 	mov	w10, #0x2889                	// #10377
  402f08:	f94083a7 	ldr	x7, [x29, #256]
  402f0c:	72a0002a 	movk	w10, #0x1, lsl #16
  402f10:	17ffffdc 	b	0x402e80
  402f14:	12130ee5 	and	w5, w23, #0x1e000
  402f18:	b940fba0 	ldr	w0, [x29, #248]
  402f1c:	121074a5 	and	w5, w5, #0xffff3fff
  402f20:	714008bf 	cmp	w5, #0x2, lsl #12
  402f24:	7a400800 	ccmp	w0, #0x0, #0x0, eq	// eq = none
  402f28:	54000080 	b.eq	0x402f38  // b.none
  402f2c:	6b14031f 	cmp	w24, w20
  402f30:	1a94a30b 	csel	w11, w24, w20, ge	// ge = tcont
  402f34:	17fffd9e 	b	0x4025ac
  402f38:	2a1403e3 	mov	w3, w20
  402f3c:	2a1803e2 	mov	w2, w24
  402f40:	aa1503e0 	mov	x0, x21
  402f44:	52800401 	mov	w1, #0x20                  	// #32
  402f48:	f90083a7 	str	x7, [x29, #256]
  402f4c:	97fffd48 	bl	0x40246c
  402f50:	5285112a 	mov	w10, #0x2889                	// #10377
  402f54:	f94083a7 	ldr	x7, [x29, #256]
  402f58:	72a0002a 	movk	w10, #0x1, lsl #16
  402f5c:	17fffff4 	b	0x402f2c
  402f60:	6a487c60 	ands	w0, w3, w8, lsr #31
  402f64:	b900aba0 	str	w0, [x29, #168]
  402f68:	5400a841 	b.ne	0x404470  // b.any
  402f6c:	7100173f 	cmp	w25, #0x5
  402f70:	d2803f01 	mov	x1, #0x1f8                 	// #504
  402f74:	d2839900 	mov	x0, #0x1cc8                	// #7368
  402f78:	9a801020 	csel	x0, x1, x0, ne	// ne = any
  402f7c:	f90073a0 	str	x0, [x29, #224]
  402f80:	91003c00 	add	x0, x0, #0xf
  402f84:	3dc057a0 	ldr	q0, [x29, #336]
  402f88:	927c2400 	and	x0, x0, #0x3ff0
  402f8c:	910003e1 	mov	x1, sp
  402f90:	f9007fa1 	str	x1, [x29, #248]
  402f94:	3d8043a0 	str	q0, [x29, #256]
  402f98:	eb2163ff 	cmp	sp, x1
  402f9c:	54000080 	b.eq	0x402fac  // b.none
  402fa0:	d14043ff 	sub	sp, sp, #0x10, lsl #12
  402fa4:	f90203ff 	str	xzr, [sp, #1024]
  402fa8:	17fffffc 	b	0x402f98
  402fac:	cb2063ff 	sub	sp, sp, x0
  402fb0:	f90003ff 	str	xzr, [sp]
  402fb4:	f10ffc1f 	cmp	x0, #0x3ff
  402fb8:	54000049 	b.ls	0x402fc0  // b.plast
  402fbc:	f90203ff 	str	xzr, [sp, #1024]
  402fc0:	3dc043a0 	ldr	q0, [x29, #256]
  402fc4:	910043f9 	add	x25, sp, #0x10
  402fc8:	f90067a7 	str	x7, [x29, #200]
  402fcc:	b900d3a8 	str	w8, [x29, #208]
  402fd0:	b900dba2 	str	w2, [x29, #216]
  402fd4:	b900f3ab 	str	w11, [x29, #240]
  402fd8:	b90137bf 	str	wzr, [x29, #308]
  402fdc:	9400092f 	bl	0x405498
  402fe0:	f94067a7 	ldr	x7, [x29, #200]
  402fe4:	2a0003fb 	mov	w27, w0
  402fe8:	b940d3a8 	ldr	w8, [x29, #208]
  402fec:	b940dba2 	ldr	w2, [x29, #216]
  402ff0:	b940f3ab 	ldr	w11, [x29, #240]
  402ff4:	34000760 	cbz	w0, 0x4030e0
  402ff8:	f94083a0 	ldr	x0, [x29, #256]
  402ffc:	f90043a0 	str	x0, [x29, #128]
  403000:	f94087a0 	ldr	x0, [x29, #264]
  403004:	d000003a 	adrp	x26, 0x409000
  403008:	9104635a 	add	x26, x26, #0x118
  40300c:	5280003b 	mov	w27, #0x1                   	// #1
  403010:	d2410000 	eor	x0, x0, #0x8000000000000000
  403014:	f90047a0 	str	x0, [x29, #136]
  403018:	3dc023a0 	ldr	q0, [x29, #128]
  40301c:	3d8043a0 	str	q0, [x29, #256]
  403020:	3dc043a0 	ldr	q0, [x29, #256]
  403024:	f90067a7 	str	x7, [x29, #200]
  403028:	b900d3a8 	str	w8, [x29, #208]
  40302c:	b900dba2 	str	w2, [x29, #216]
  403030:	b900f3ab 	str	w11, [x29, #240]
  403034:	94000906 	bl	0x40544c
  403038:	f94067a7 	ldr	x7, [x29, #200]
  40303c:	7100041f 	cmp	w0, #0x1
  403040:	b940d3a8 	ldr	w8, [x29, #208]
  403044:	b940dba2 	ldr	w2, [x29, #216]
  403048:	b940f3ab 	ldr	w11, [x29, #240]
  40304c:	5400064d 	b.le	0x403114
  403050:	3dc043a0 	ldr	q0, [x29, #256]
  403054:	9104d3a0 	add	x0, x29, #0x134
  403058:	f90067a7 	str	x7, [x29, #200]
  40305c:	b900d3a8 	str	w8, [x29, #208]
  403060:	b900dbab 	str	w11, [x29, #216]
  403064:	b900f3a2 	str	w2, [x29, #240]
  403068:	94000913 	bl	0x4054b4
  40306c:	4ea01c01 	mov	v1.16b, v0.16b
  403070:	94000d08 	bl	0x406490
  403074:	6f00e401 	movi	v1.2d, #0x0
  403078:	b940f3a2 	ldr	w2, [x29, #240]
  40307c:	b900f3a2 	str	w2, [x29, #240]
  403080:	321b005c 	orr	w28, w2, #0x20
  403084:	3d8043a0 	str	q0, [x29, #256]
  403088:	940010a6 	bl	0x407320
  40308c:	f94067a7 	ldr	x7, [x29, #200]
  403090:	b940d3a8 	ldr	w8, [x29, #208]
  403094:	b940dbab 	ldr	w11, [x29, #216]
  403098:	b940f3a2 	ldr	w2, [x29, #240]
  40309c:	35000ca0 	cbnz	w0, 0x403230
  4030a0:	7101879f 	cmp	w28, #0x61
  4030a4:	540016c0 	b.eq	0x40337c  // b.none
  4030a8:	b94137af 	ldr	w15, [x29, #308]
  4030ac:	7100011f 	cmp	w8, #0x0
  4030b0:	54003e8b 	b.lt	0x403880  // b.tstop
  4030b4:	1100b500 	add	w0, w8, #0x2d
  4030b8:	5291c721 	mov	w1, #0x8e39                	// #36409
  4030bc:	72a71c61 	movk	w1, #0x38e3, lsl #16
  4030c0:	1a9f07e3 	cset	w3, ne	// ne = any
  4030c4:	b90123a3 	str	w3, [x29, #288]
  4030c8:	9ba17c00 	umull	x0, w0, w1
  4030cc:	d361fc00 	lsr	x0, x0, #33
  4030d0:	91000404 	add	x4, x0, #0x1
  4030d4:	d37ef480 	lsl	x0, x4, #2
  4030d8:	f9005ba0 	str	x0, [x29, #176]
  4030dc:	14000076 	b	0x4032b4
  4030e0:	375800d7 	tbnz	w23, #11, 0x4030f8
  4030e4:	36000137 	tbz	w23, #0, 0x403108
  4030e8:	d000003a 	adrp	x26, 0x409000
  4030ec:	5280003b 	mov	w27, #0x1                   	// #1
  4030f0:	91047b5a 	add	x26, x26, #0x11e
  4030f4:	17ffffcb 	b	0x403020
  4030f8:	d000003a 	adrp	x26, 0x409000
  4030fc:	5280003b 	mov	w27, #0x1                   	// #1
  403100:	91046f5a 	add	x26, x26, #0x11b
  403104:	17ffffc7 	b	0x403020
  403108:	d000003a 	adrp	x26, 0x409000
  40310c:	9104675a 	add	x26, x26, #0x119
  403110:	17ffffc4 	b	0x403020
  403114:	3dc043a1 	ldr	q1, [x29, #256]
  403118:	f90073a7 	str	x7, [x29, #224]
  40311c:	4ea11c20 	mov	v0.16b, v1.16b
  403120:	372803a2 	tbnz	w2, #5, 0x403194
  403124:	9400107f 	bl	0x407320
  403128:	d0000039 	adrp	x25, 0x409000
  40312c:	f94073a7 	ldr	x7, [x29, #224]
  403130:	7100001f 	cmp	w0, #0x0
  403134:	91050339 	add	x25, x25, #0x140
  403138:	d0000020 	adrp	x0, 0x409000
  40313c:	91052000 	add	x0, x0, #0x148
  403140:	5285112a 	mov	w10, #0x2889                	// #10377
  403144:	9a801339 	csel	x25, x25, x0, ne	// ne = any
  403148:	72a0002a 	movk	w10, #0x1, lsl #16
  40314c:	11000f74 	add	w20, w27, #0x3
  403150:	6b14031f 	cmp	w24, w20
  403154:	1a9fc7fc 	cset	w28, le
  403158:	f27302ff 	tst	x23, #0x2000
  40315c:	7a400b80 	ccmp	w28, #0x0, #0x0, eq	// eq = none
  403160:	54000300 	b.eq	0x4031c0  // b.none
  403164:	b94002a0 	ldr	w0, [x21]
  403168:	36280400 	tbz	w0, #5, 0x4031e8
  40316c:	12130ee5 	and	w5, w23, #0x1e000
  403170:	121074a5 	and	w5, w5, #0xffff3fff
  403174:	714008bf 	cmp	w5, #0x2, lsl #12
  403178:	7a400b80 	ccmp	w28, #0x0, #0x0, eq	// eq = none
  40317c:	540093c0 	b.eq	0x4043f4  // b.none
  403180:	f9407fa0 	ldr	x0, [x29, #248]
  403184:	6b14031f 	cmp	w24, w20
  403188:	1a94a30b 	csel	w11, w24, w20, ge	// ge = tcont
  40318c:	9100001f 	mov	sp, x0
  403190:	17fffd07 	b	0x4025ac
  403194:	94001063 	bl	0x407320
  403198:	d0000039 	adrp	x25, 0x409000
  40319c:	7100001f 	cmp	w0, #0x0
  4031a0:	9104c339 	add	x25, x25, #0x130
  4031a4:	d0000020 	adrp	x0, 0x409000
  4031a8:	5285112a 	mov	w10, #0x2889                	// #10377
  4031ac:	9104e000 	add	x0, x0, #0x138
  4031b0:	72a0002a 	movk	w10, #0x1, lsl #16
  4031b4:	f94073a7 	ldr	x7, [x29, #224]
  4031b8:	9a801339 	csel	x25, x25, x0, ne	// ne = any
  4031bc:	17ffffe4 	b	0x40314c
  4031c0:	2a1403e3 	mov	w3, w20
  4031c4:	2a1803e2 	mov	w2, w24
  4031c8:	aa1503e0 	mov	x0, x21
  4031cc:	52800401 	mov	w1, #0x20                  	// #32
  4031d0:	f90083a7 	str	x7, [x29, #256]
  4031d4:	97fffca6 	bl	0x40246c
  4031d8:	5285112a 	mov	w10, #0x2889                	// #10377
  4031dc:	f94083a7 	ldr	x7, [x29, #256]
  4031e0:	72a0002a 	movk	w10, #0x1, lsl #16
  4031e4:	17ffffe0 	b	0x403164
  4031e8:	93407f61 	sxtw	x1, w27
  4031ec:	aa1a03e0 	mov	x0, x26
  4031f0:	aa1503e2 	mov	x2, x21
  4031f4:	f90083a7 	str	x7, [x29, #256]
  4031f8:	97fffb49 	bl	0x401f1c
  4031fc:	b94002a0 	ldr	w0, [x21]
  403200:	5285112a 	mov	w10, #0x2889                	// #10377
  403204:	f94083a7 	ldr	x7, [x29, #256]
  403208:	72a0002a 	movk	w10, #0x1, lsl #16
  40320c:	372ffb00 	tbnz	w0, #5, 0x40316c
  403210:	aa1903e0 	mov	x0, x25
  403214:	aa1503e2 	mov	x2, x21
  403218:	d2800061 	mov	x1, #0x3                   	// #3
  40321c:	97fffb40 	bl	0x401f1c
  403220:	5285112a 	mov	w10, #0x2889                	// #10377
  403224:	f94083a7 	ldr	x7, [x29, #256]
  403228:	72a0002a 	movk	w10, #0x1, lsl #16
  40322c:	17ffffd0 	b	0x40316c
  403230:	b94137af 	ldr	w15, [x29, #308]
  403234:	7101879f 	cmp	w28, #0x61
  403238:	540009e0 	b.eq	0x403374  // b.none
  40323c:	7100011f 	cmp	w8, #0x0
  403240:	5400312b 	b.lt	0x403864  // b.tstop
  403244:	1100b500 	add	w0, w8, #0x2d
  403248:	5291c721 	mov	w1, #0x8e39                	// #36409
  40324c:	72a71c61 	movk	w1, #0x38e3, lsl #16
  403250:	1a9f07e3 	cset	w3, ne	// ne = any
  403254:	b90123a3 	str	w3, [x29, #288]
  403258:	9ba17c00 	umull	x0, w0, w1
  40325c:	d361fc00 	lsr	x0, x0, #33
  403260:	91000404 	add	x4, x0, #0x1
  403264:	d37ef480 	lsl	x0, x4, #2
  403268:	f9005ba0 	str	x0, [x29, #176]
  40326c:	d0000020 	adrp	x0, 0x409000
  403270:	91108000 	add	x0, x0, #0x420
  403274:	3dc043a0 	ldr	q0, [x29, #256]
  403278:	a90b93a7 	stp	x7, x4, [x29, #184]
  40327c:	3dc00001 	ldr	q1, [x0]
  403280:	b900cbaf 	str	w15, [x29, #200]
  403284:	b900d3a8 	str	w8, [x29, #208]
  403288:	b900dba2 	str	w2, [x29, #216]
  40328c:	b900f3ab 	str	w11, [x29, #240]
  403290:	94001068 	bl	0x407430
  403294:	a94b93a7 	ldp	x7, x4, [x29, #184]
  403298:	3d8043a0 	str	q0, [x29, #256]
  40329c:	b940cbaf 	ldr	w15, [x29, #200]
  4032a0:	b940d3a8 	ldr	w8, [x29, #208]
  4032a4:	b940dba2 	ldr	w2, [x29, #216]
  4032a8:	510075ef 	sub	w15, w15, #0x1d
  4032ac:	b940f3ab 	ldr	w11, [x29, #240]
  4032b0:	b90137af 	str	w15, [x29, #308]
  4032b4:	f94073a0 	ldr	x0, [x29, #224]
  4032b8:	710001ff 	cmp	w15, #0x0
  4032bc:	d1072000 	sub	x0, x0, #0x1c8
  4032c0:	8b000320 	add	x0, x25, x0
  4032c4:	9a99a019 	csel	x25, x0, x25, ge	// ge = tcont
  4032c8:	aa1903ec 	mov	x12, x25
  4032cc:	3dc043a0 	ldr	q0, [x29, #256]
  4032d0:	a90b93a7 	stp	x7, x4, [x29, #184]
  4032d4:	b900cba8 	str	w8, [x29, #200]
  4032d8:	b900d3af 	str	w15, [x29, #208]
  4032dc:	b900dba2 	str	w2, [x29, #216]
  4032e0:	f90073ac 	str	x12, [x29, #224]
  4032e4:	b900f3ab 	str	w11, [x29, #240]
  4032e8:	94001626 	bl	0x408b80
  4032ec:	f94073ac 	ldr	x12, [x29, #224]
  4032f0:	b8004580 	str	w0, [x12], #4
  4032f4:	f90073ac 	str	x12, [x29, #224]
  4032f8:	9400167a 	bl	0x408ce0
  4032fc:	4ea01c01 	mov	v1.16b, v0.16b
  403300:	3dc043a0 	ldr	q0, [x29, #256]
  403304:	9400122f 	bl	0x407bc0
  403308:	d0000020 	adrp	x0, 0x409000
  40330c:	9110c000 	add	x0, x0, #0x430
  403310:	3dc00001 	ldr	q1, [x0]
  403314:	94001047 	bl	0x407430
  403318:	3d8043a0 	str	q0, [x29, #256]
  40331c:	6f00e401 	movi	v1.2d, #0x0
  403320:	94001000 	bl	0x407320
  403324:	5285112a 	mov	w10, #0x2889                	// #10377
  403328:	b940cba8 	ldr	w8, [x29, #200]
  40332c:	a94b93a7 	ldp	x7, x4, [x29, #184]
  403330:	72a0002a 	movk	w10, #0x1, lsl #16
  403334:	f94073ac 	ldr	x12, [x29, #224]
  403338:	b940d3af 	ldr	w15, [x29, #208]
  40333c:	b940dba2 	ldr	w2, [x29, #216]
  403340:	b940f3ab 	ldr	w11, [x29, #240]
  403344:	35fffc40 	cbnz	w0, 0x4032cc
  403348:	d28b4a71 	mov	x17, #0x5a53                	// #23123
  40334c:	d2994012 	mov	x18, #0xca00                	// #51712
  403350:	f2b41371 	movk	x17, #0xa09b, lsl #16
  403354:	b940aba0 	ldr	w0, [x29, #168]
  403358:	f2d705f1 	movk	x17, #0xb82f, lsl #32
  40335c:	2a0f03fe 	mov	w30, w15
  403360:	aa1903ed 	mov	x13, x25
  403364:	528003a5 	mov	w5, #0x1d                  	// #29
  403368:	f2e00891 	movk	x17, #0x44, lsl #48
  40336c:	f2a77352 	movk	x18, #0x3b9a, lsl #16
  403370:	14000161 	b	0x4038f4
  403374:	510005ef 	sub	w15, w15, #0x1
  403378:	b90137af 	str	w15, [x29, #308]
  40337c:	91002740 	add	x0, x26, #0x9
  403380:	721b0059 	ands	w25, w2, #0x20
  403384:	11000b61 	add	w1, w27, #0x2
  403388:	b900cba1 	str	w1, [x29, #200]
  40338c:	9a9a101a 	csel	x26, x0, x26, ne	// ne = any
  403390:	71006d1f 	cmp	w8, #0x1b
  403394:	54000149 	b.ls	0x4033bc  // b.plast
  403398:	b94137ad 	ldr	w13, [x29, #308]
  40339c:	910533b4 	add	x20, x29, #0x14c
  4033a0:	b202e7ef 	mov	x15, #0xcccccccccccccccc    	// #-3689348814741910324
  4033a4:	aa1403e1 	mov	x1, x20
  4033a8:	710001bf 	cmp	w13, #0x0
  4033ac:	f29999af 	movk	x15, #0xcccd
  4033b0:	5a8da5a0 	cneg	w0, w13, lt	// lt = tstop
  4033b4:	93407c00 	sxtw	x0, w0
  4033b8:	14000046 	b	0x4034d0
  4033bc:	52800380 	mov	w0, #0x1c                  	// #28
  4033c0:	1e6e1000 	fmov	d0, #1.000000000000000000e+00
  4033c4:	4b080000 	sub	w0, w0, w8
  4033c8:	f9006ba7 	str	x7, [x29, #208]
  4033cc:	b900dba2 	str	w2, [x29, #216]
  4033d0:	531e7400 	lsl	w0, w0, #2
  4033d4:	b900e3a8 	str	w8, [x29, #224]
  4033d8:	b900f3ab 	str	w11, [x29, #240]
  4033dc:	94000860 	bl	0x40555c
  4033e0:	39400340 	ldrb	w0, [x26]
  4033e4:	f9406ba7 	ldr	x7, [x29, #208]
  4033e8:	7100b41f 	cmp	w0, #0x2d
  4033ec:	b940dba2 	ldr	w2, [x29, #216]
  4033f0:	b940e3a8 	ldr	w8, [x29, #224]
  4033f4:	b940f3ab 	ldr	w11, [x29, #240]
  4033f8:	54000240 	b.eq	0x403440  // b.none
  4033fc:	f9006ba7 	str	x7, [x29, #208]
  403400:	b900dba8 	str	w8, [x29, #216]
  403404:	b900e3ab 	str	w11, [x29, #224]
  403408:	b900f3a2 	str	w2, [x29, #240]
  40340c:	94001651 	bl	0x408d50
  403410:	4ea01c01 	mov	v1.16b, v0.16b
  403414:	3dc043a0 	ldr	q0, [x29, #256]
  403418:	3d8043a1 	str	q1, [x29, #256]
  40341c:	94000c1d 	bl	0x406490
  403420:	3dc043a1 	ldr	q1, [x29, #256]
  403424:	940011e7 	bl	0x407bc0
  403428:	3d8043a0 	str	q0, [x29, #256]
  40342c:	f9406ba7 	ldr	x7, [x29, #208]
  403430:	b940dba8 	ldr	w8, [x29, #216]
  403434:	b940e3ab 	ldr	w11, [x29, #224]
  403438:	b940f3a2 	ldr	w2, [x29, #240]
  40343c:	17ffffd7 	b	0x403398
  403440:	f94083a0 	ldr	x0, [x29, #256]
  403444:	f9004ba0 	str	x0, [x29, #144]
  403448:	f94087a0 	ldr	x0, [x29, #264]
  40344c:	f90063a7 	str	x7, [x29, #192]
  403450:	b900d3a8 	str	w8, [x29, #208]
  403454:	d2410000 	eor	x0, x0, #0x8000000000000000
  403458:	f9004fa0 	str	x0, [x29, #152]
  40345c:	b900dba2 	str	w2, [x29, #216]
  403460:	b900f3ab 	str	w11, [x29, #240]
  403464:	9400163b 	bl	0x408d50
  403468:	4ea01c02 	mov	v2.16b, v0.16b
  40346c:	3dc027a0 	ldr	q0, [x29, #144]
  403470:	4ea21c41 	mov	v1.16b, v2.16b
  403474:	3d803ba2 	str	q2, [x29, #224]
  403478:	940011d2 	bl	0x407bc0
  40347c:	4ea01c01 	mov	v1.16b, v0.16b
  403480:	3dc03ba2 	ldr	q2, [x29, #224]
  403484:	4ea21c40 	mov	v0.16b, v2.16b
  403488:	94000c02 	bl	0x406490
  40348c:	9e660000 	fmov	x0, d0
  403490:	9eae0001 	fmov	x1, v0.d[1]
  403494:	f94063a7 	ldr	x7, [x29, #192]
  403498:	b940d3a8 	ldr	w8, [x29, #208]
  40349c:	b940dba2 	ldr	w2, [x29, #216]
  4034a0:	b940f3ab 	ldr	w11, [x29, #240]
  4034a4:	f90083a0 	str	x0, [x29, #256]
  4034a8:	d2410020 	eor	x0, x1, #0x8000000000000000
  4034ac:	f90087a0 	str	x0, [x29, #264]
  4034b0:	17ffffba 	b	0x403398
  4034b4:	9bcf7c0e 	umulh	x14, x0, x15
  4034b8:	d343fdce 	lsr	x14, x14, #3
  4034bc:	8b0e09cc 	add	x12, x14, x14, lsl #2
  4034c0:	cb0c040c 	sub	x12, x0, x12, lsl #1
  4034c4:	aa0e03e0 	mov	x0, x14
  4034c8:	1100c18c 	add	w12, w12, #0x30
  4034cc:	381ffc2c 	strb	w12, [x1, #-1]!
  4034d0:	f100241f 	cmp	x0, #0x9
  4034d4:	54ffff08 	b.hi	0x4034b4  // b.pmore
  4034d8:	b4000080 	cbz	x0, 0x4034e8
  4034dc:	1100c000 	add	w0, w0, #0x30
  4034e0:	d1000421 	sub	x1, x1, #0x1
  4034e4:	39000020 	strb	w0, [x1]
  4034e8:	eb14003f 	cmp	x1, x20
  4034ec:	54000220 	b.eq	0x403530  // b.none
  4034f0:	11003c42 	add	w2, w2, #0xf
  4034f4:	d1000820 	sub	x0, x1, #0x2
  4034f8:	9105e3ae 	add	x14, x29, #0x178
  4034fc:	710001bf 	cmp	w13, #0x0
  403500:	381fe022 	sturb	w2, [x1, #-2]
  403504:	528005a2 	mov	w2, #0x2d                  	// #45
  403508:	12001f39 	and	w25, w25, #0xff
  40350c:	aa0e03fb 	mov	x27, x14
  403510:	f90063a0 	str	x0, [x29, #192]
  403514:	52800560 	mov	w0, #0x2b                  	// #43
  403518:	1a82a000 	csel	w0, w0, w2, ge	// ge = tcont
  40351c:	d0000022 	adrp	x2, 0x409000
  403520:	9108c042 	add	x2, x2, #0x230
  403524:	381ff020 	sturb	w0, [x1, #-1]
  403528:	f9005fa2 	str	x2, [x29, #184]
  40352c:	14000057 	b	0x403688
  403530:	52800600 	mov	w0, #0x30                  	// #48
  403534:	91052fa1 	add	x1, x29, #0x14b
  403538:	39052fa0 	strb	w0, [x29, #331]
  40353c:	17ffffed 	b	0x4034f0
  403540:	6f00e401 	movi	v1.2d, #0x0
  403544:	b900e3ab 	str	w11, [x29, #224]
  403548:	b900f3a8 	str	w8, [x29, #240]
  40354c:	94000f75 	bl	0x407320
  403550:	7100001f 	cmp	w0, #0x0
  403554:	b940f3a8 	ldr	w8, [x29, #240]
  403558:	1a9f07e2 	cset	w2, ne	// ne = any
  40355c:	5285112a 	mov	w10, #0x2889                	// #10377
  403560:	b940e3ab 	ldr	w11, [x29, #224]
  403564:	7100011f 	cmp	w8, #0x0
  403568:	72a0002a 	movk	w10, #0x1, lsl #16
  40356c:	1a9fd7e0 	cset	w0, gt
  403570:	a94d3ba7 	ldp	x7, x14, [x29, #208]
  403574:	2a020000 	orr	w0, w0, w2
  403578:	370006a0 	tbnz	w0, #0, 0x40364c
  40357c:	36180097 	tbz	w23, #3, 0x40358c
  403580:	91000b7c 	add	x28, x27, #0x2
  403584:	528005c0 	mov	w0, #0x2e                  	// #46
  403588:	39000760 	strb	w0, [x27, #1]
  40358c:	f94063a0 	ldr	x0, [x29, #192]
  403590:	93407d02 	sxtw	x2, w8
  403594:	b980cbac 	ldrsw	x12, [x29, #200]
  403598:	cb000299 	sub	x25, x20, x0
  40359c:	d29fffa0 	mov	x0, #0xfffd                	// #65533
  4035a0:	f2afffe0 	movk	x0, #0x7fff, lsl #16
  4035a4:	cb190000 	sub	x0, x0, x25
  4035a8:	cb0c0000 	sub	x0, x0, x12
  4035ac:	eb00005f 	cmp	x2, x0
  4035b0:	540075cc 	b.gt	0x404468
  4035b4:	cb0e0394 	sub	x20, x28, x14
  4035b8:	0b14033b 	add	w27, w25, w20
  4035bc:	340000e8 	cbz	w8, 0x4035d8
  4035c0:	d1000680 	sub	x0, x20, #0x1
  4035c4:	eb00005f 	cmp	x2, x0
  4035c8:	5400008b 	b.lt	0x4035d8  // b.tstop
  4035cc:	1100090b 	add	w11, w8, #0x2
  4035d0:	0b19017b 	add	w27, w11, w25
  4035d4:	4b14016b 	sub	w11, w11, w20
  4035d8:	b940cba0 	ldr	w0, [x29, #200]
  4035dc:	0b1b001b 	add	w27, w0, w27
  4035e0:	12130ee0 	and	w0, w23, #0x1e000
  4035e4:	6b1b031f 	cmp	w24, w27
  4035e8:	12107400 	and	w0, w0, #0xffff3fff
  4035ec:	1a9fc7fc 	cset	w28, le
  4035f0:	7100001f 	cmp	w0, #0x0
  4035f4:	7a400b80 	ccmp	w28, #0x0, #0x0, eq	// eq = none
  4035f8:	54000820 	b.eq	0x4036fc  // b.none
  4035fc:	b94002a0 	ldr	w0, [x21]
  403600:	121b0003 	and	w3, w0, #0x20
  403604:	36280980 	tbz	w0, #5, 0x403734
  403608:	12130ee0 	and	w0, w23, #0x1e000
  40360c:	12107400 	and	w0, w0, #0xffff3fff
  403610:	7140401f 	cmp	w0, #0x10, lsl #12
  403614:	7a400b80 	ccmp	w28, #0x0, #0x0, eq	// eq = none
  403618:	54000b40 	b.eq	0x403780  // b.none
  40361c:	7100017f 	cmp	w11, #0x0
  403620:	54000e6c 	b.gt	0x4037ec
  403624:	12130ee5 	and	w5, w23, #0x1e000
  403628:	121074a5 	and	w5, w5, #0xffff3fff
  40362c:	714008bf 	cmp	w5, #0x2, lsl #12
  403630:	7a400b80 	ccmp	w28, #0x0, #0x0, eq	// eq = none
  403634:	54001040 	b.eq	0x40383c  // b.none
  403638:	f9407fa0 	ldr	x0, [x29, #248]
  40363c:	6b1b031f 	cmp	w24, w27
  403640:	1a9ba30b 	csel	w11, w24, w27, ge	// ge = tcont
  403644:	9100001f 	mov	sp, x0
  403648:	17fffbd9 	b	0x4025ac
  40364c:	528005c0 	mov	w0, #0x2e                  	// #46
  403650:	91000b7b 	add	x27, x27, #0x2
  403654:	381ff360 	sturb	w0, [x27, #-1]
  403658:	6f00e401 	movi	v1.2d, #0x0
  40365c:	3dc043a0 	ldr	q0, [x29, #256]
  403660:	a90d3ba7 	stp	x7, x14, [x29, #208]
  403664:	b900e3ab 	str	w11, [x29, #224]
  403668:	b900f3a8 	str	w8, [x29, #240]
  40366c:	94000f2d 	bl	0x407320
  403670:	5285112a 	mov	w10, #0x2889                	// #10377
  403674:	b940e3ab 	ldr	w11, [x29, #224]
  403678:	a94d3ba7 	ldp	x7, x14, [x29, #208]
  40367c:	72a0002a 	movk	w10, #0x1, lsl #16
  403680:	b940f3a8 	ldr	w8, [x29, #240]
  403684:	34000380 	cbz	w0, 0x4036f4
  403688:	3dc043a0 	ldr	q0, [x29, #256]
  40368c:	aa1b03fc 	mov	x28, x27
  403690:	a90d3ba7 	stp	x7, x14, [x29, #208]
  403694:	b900e3ab 	str	w11, [x29, #224]
  403698:	b900f3a8 	str	w8, [x29, #240]
  40369c:	940014f5 	bl	0x408a70
  4036a0:	f9405fa1 	ldr	x1, [x29, #184]
  4036a4:	3860c822 	ldrb	w2, [x1, w0, sxtw]
  4036a8:	2a020322 	orr	w2, w25, w2
  4036ac:	38001782 	strb	w2, [x28], #1
  4036b0:	9400156c 	bl	0x408c60
  4036b4:	4ea01c01 	mov	v1.16b, v0.16b
  4036b8:	3dc043a0 	ldr	q0, [x29, #256]
  4036bc:	94001141 	bl	0x407bc0
  4036c0:	d0000020 	adrp	x0, 0x409000
  4036c4:	91104000 	add	x0, x0, #0x410
  4036c8:	3dc00001 	ldr	q1, [x0]
  4036cc:	94000f59 	bl	0x407430
  4036d0:	3d8043a0 	str	q0, [x29, #256]
  4036d4:	a94d3ba7 	ldp	x7, x14, [x29, #208]
  4036d8:	b940e3ab 	ldr	w11, [x29, #224]
  4036dc:	b940f3a8 	ldr	w8, [x29, #240]
  4036e0:	cb0e0380 	sub	x0, x28, x14
  4036e4:	f100041f 	cmp	x0, #0x1
  4036e8:	54fff2c0 	b.eq	0x403540  // b.none
  4036ec:	aa1c03fb 	mov	x27, x28
  4036f0:	17ffffda 	b	0x403658
  4036f4:	aa1b03fc 	mov	x28, x27
  4036f8:	17ffffa5 	b	0x40358c
  4036fc:	2a1b03e3 	mov	w3, w27
  403700:	2a1803e2 	mov	w2, w24
  403704:	aa1503e0 	mov	x0, x21
  403708:	52800401 	mov	w1, #0x20                  	// #32
  40370c:	a90db3a7 	stp	x7, x12, [x29, #216]
  403710:	f9007bae 	str	x14, [x29, #240]
  403714:	b90103ab 	str	w11, [x29, #256]
  403718:	97fffb55 	bl	0x40246c
  40371c:	5285112a 	mov	w10, #0x2889                	// #10377
  403720:	b94103ab 	ldr	w11, [x29, #256]
  403724:	a94db3a7 	ldp	x7, x12, [x29, #216]
  403728:	72a0002a 	movk	w10, #0x1, lsl #16
  40372c:	f9407bae 	ldr	x14, [x29, #240]
  403730:	17ffffb3 	b	0x4035fc
  403734:	aa0c03e1 	mov	x1, x12
  403738:	aa1a03e0 	mov	x0, x26
  40373c:	aa1503e2 	mov	x2, x21
  403740:	f9006fa7 	str	x7, [x29, #216]
  403744:	b900e3a3 	str	w3, [x29, #224]
  403748:	f9007bae 	str	x14, [x29, #240]
  40374c:	b90103ab 	str	w11, [x29, #256]
  403750:	97fff9f3 	bl	0x401f1c
  403754:	b940e3a3 	ldr	w3, [x29, #224]
  403758:	521002e0 	eor	w0, w23, #0x10000
  40375c:	5285112a 	mov	w10, #0x2889                	// #10377
  403760:	b94103ab 	ldr	w11, [x29, #256]
  403764:	11404863 	add	w3, w3, #0x12, lsl #12
  403768:	72a0002a 	movk	w10, #0x1, lsl #16
  40376c:	6a03001f 	tst	w0, w3
  403770:	f9406fa7 	ldr	x7, [x29, #216]
  403774:	7a400b80 	ccmp	w28, #0x0, #0x0, eq	// eq = none
  403778:	f9407bae 	ldr	x14, [x29, #240]
  40377c:	540001c1 	b.ne	0x4037b4  // b.any
  403780:	2a1b03e3 	mov	w3, w27
  403784:	2a1803e2 	mov	w2, w24
  403788:	aa1503e0 	mov	x0, x21
  40378c:	52800601 	mov	w1, #0x30                  	// #48
  403790:	f90073ae 	str	x14, [x29, #224]
  403794:	f9007ba7 	str	x7, [x29, #240]
  403798:	b90103ab 	str	w11, [x29, #256]
  40379c:	97fffb34 	bl	0x40246c
  4037a0:	f94073ae 	ldr	x14, [x29, #224]
  4037a4:	5285112a 	mov	w10, #0x2889                	// #10377
  4037a8:	f9407ba7 	ldr	x7, [x29, #240]
  4037ac:	72a0002a 	movk	w10, #0x1, lsl #16
  4037b0:	b94103ab 	ldr	w11, [x29, #256]
  4037b4:	b94002a0 	ldr	w0, [x21]
  4037b8:	372ff320 	tbnz	w0, #5, 0x40361c
  4037bc:	aa1403e1 	mov	x1, x20
  4037c0:	aa0e03e0 	mov	x0, x14
  4037c4:	aa1503e2 	mov	x2, x21
  4037c8:	f90073a7 	str	x7, [x29, #224]
  4037cc:	b90103ab 	str	w11, [x29, #256]
  4037d0:	97fff9d3 	bl	0x401f1c
  4037d4:	b94103ab 	ldr	w11, [x29, #256]
  4037d8:	5285112a 	mov	w10, #0x2889                	// #10377
  4037dc:	f94073a7 	ldr	x7, [x29, #224]
  4037e0:	7100017f 	cmp	w11, #0x0
  4037e4:	72a0002a 	movk	w10, #0x1, lsl #16
  4037e8:	5400014d 	b.le	0x403810
  4037ec:	2a0b03e2 	mov	w2, w11
  4037f0:	aa1503e0 	mov	x0, x21
  4037f4:	52800003 	mov	w3, #0x0                   	// #0
  4037f8:	52800601 	mov	w1, #0x30                  	// #48
  4037fc:	f90083a7 	str	x7, [x29, #256]
  403800:	97fffb1b 	bl	0x40246c
  403804:	f94083a7 	ldr	x7, [x29, #256]
  403808:	5285112a 	mov	w10, #0x2889                	// #10377
  40380c:	72a0002a 	movk	w10, #0x1, lsl #16
  403810:	b94002a0 	ldr	w0, [x21]
  403814:	372ff080 	tbnz	w0, #5, 0x403624
  403818:	f94063a0 	ldr	x0, [x29, #192]
  40381c:	aa1903e1 	mov	x1, x25
  403820:	aa1503e2 	mov	x2, x21
  403824:	f90083a7 	str	x7, [x29, #256]
  403828:	97fff9bd 	bl	0x401f1c
  40382c:	5285112a 	mov	w10, #0x2889                	// #10377
  403830:	f94083a7 	ldr	x7, [x29, #256]
  403834:	72a0002a 	movk	w10, #0x1, lsl #16
  403838:	17ffff7b 	b	0x403624
  40383c:	2a1b03e3 	mov	w3, w27
  403840:	2a1803e2 	mov	w2, w24
  403844:	aa1503e0 	mov	x0, x21
  403848:	52800401 	mov	w1, #0x20                  	// #32
  40384c:	f90083a7 	str	x7, [x29, #256]
  403850:	97fffb07 	bl	0x40246c
  403854:	5285112a 	mov	w10, #0x2889                	// #10377
  403858:	f94083a7 	ldr	x7, [x29, #256]
  40385c:	72a0002a 	movk	w10, #0x1, lsl #16
  403860:	17ffff76 	b	0x403638
  403864:	52800020 	mov	w0, #0x1                   	// #1
  403868:	d28000c4 	mov	x4, #0x6                   	// #6
  40386c:	2a0403e8 	mov	w8, w4
  403870:	b90123a0 	str	w0, [x29, #288]
  403874:	d2800300 	mov	x0, #0x18                  	// #24
  403878:	f9005ba0 	str	x0, [x29, #176]
  40387c:	17fffe7c 	b	0x40326c
  403880:	d2800300 	mov	x0, #0x18                  	// #24
  403884:	d28000c4 	mov	x4, #0x6                   	// #6
  403888:	2a0403e8 	mov	w8, w4
  40388c:	f9005ba0 	str	x0, [x29, #176]
  403890:	52800020 	mov	w0, #0x1                   	// #1
  403894:	b90123a0 	str	w0, [x29, #288]
  403898:	17fffe87 	b	0x4032b4
  40389c:	b9400061 	ldr	w1, [x3]
  4038a0:	9ad02021 	lsl	x1, x1, x16
  4038a4:	8b2e4021 	add	x1, x1, w14, uxtw
  4038a8:	d349fc20 	lsr	x0, x1, #9
  4038ac:	9bd17c00 	umulh	x0, x0, x17
  4038b0:	d34bfc00 	lsr	x0, x0, #11
  4038b4:	2a0003ee 	mov	w14, w0
  4038b8:	9b128400 	msub	x0, x0, x18, x1
  4038bc:	b81fc460 	str	w0, [x3], #-4
  4038c0:	eb0d007f 	cmp	x3, x13
  4038c4:	54fffec2 	b.cs	0x40389c  // b.hs, b.nlast
  4038c8:	340000ae 	cbz	w14, 0x4038dc
  4038cc:	d10011ad 	sub	x13, x13, #0x4
  4038d0:	b90001ae 	str	w14, [x13]
  4038d4:	14000002 	b	0x4038dc
  4038d8:	d100118c 	sub	x12, x12, #0x4
  4038dc:	eb0d019f 	cmp	x12, x13
  4038e0:	54000069 	b.ls	0x4038ec  // b.plast
  4038e4:	b85fc180 	ldur	w0, [x12, #-4]
  4038e8:	34ffff80 	cbz	w0, 0x4038d8
  4038ec:	4b1003de 	sub	w30, w30, w16
  4038f0:	52800020 	mov	w0, #0x1                   	// #1
  4038f4:	710003df 	cmp	w30, #0x0
  4038f8:	540000cd 	b.le	0x403910
  4038fc:	710077df 	cmp	w30, #0x1d
  403900:	d1001183 	sub	x3, x12, #0x4
  403904:	1a85d3d0 	csel	w16, w30, w5, le
  403908:	5280000e 	mov	w14, #0x0                   	// #0
  40390c:	17ffffed 	b	0x4038c0
  403910:	36000060 	tbz	w0, #0, 0x40391c
  403914:	2a1e03ef 	mov	w15, w30
  403918:	b90137be 	str	w30, [x29, #308]
  40391c:	52994006 	mov	w6, #0xca00                	// #51712
  403920:	5299acbe 	mov	w30, #0xcd65                	// #52581
  403924:	52800025 	mov	w5, #0x1                   	// #1
  403928:	72a77346 	movk	w6, #0x3b9a, lsl #16
  40392c:	72a003be 	movk	w30, #0x1d, lsl #16
  403930:	1400001e 	b	0x4039a8
  403934:	4b0f03f0 	neg	w16, w15
  403938:	2a0b03ef 	mov	w15, w11
  40393c:	1ad020b1 	lsl	w17, w5, w16
  403940:	51000631 	sub	w17, w17, #0x1
  403944:	1ad028d2 	asr	w18, w6, w16
  403948:	1400001f 	b	0x4039c4
  40394c:	b9400020 	ldr	w0, [x1]
  403950:	0a11000e 	and	w14, w0, w17
  403954:	1ad02400 	lsr	w0, w0, w16
  403958:	0b030000 	add	w0, w0, w3
  40395c:	b8004420 	str	w0, [x1], #4
  403960:	1b127dc3 	mul	w3, w14, w18
  403964:	eb0c003f 	cmp	x1, x12
  403968:	54ffff23 	b.cc	0x40394c  // b.lo, b.ul, b.last
  40396c:	aa0d03e0 	mov	x0, x13
  403970:	b8404401 	ldr	w1, [x0], #4
  403974:	7100003f 	cmp	w1, #0x0
  403978:	9a8d000d 	csel	x13, x0, x13, eq	// eq = none
  40397c:	34000043 	cbz	w3, 0x403984
  403980:	b8004583 	str	w3, [x12], #4
  403984:	71019b9f 	cmp	w28, #0x66
  403988:	52800020 	mov	w0, #0x1                   	// #1
  40398c:	f9405ba3 	ldr	x3, [x29, #176]
  403990:	b900aba0 	str	w0, [x29, #168]
  403994:	9a9911a0 	csel	x0, x13, x25, ne	// ne = any
  403998:	cb000181 	sub	x1, x12, x0
  40399c:	8b030000 	add	x0, x0, x3
  4039a0:	eb81089f 	cmp	x4, x1, asr #2
  4039a4:	9a8cb00c 	csel	x12, x0, x12, lt	// lt = tstop
  4039a8:	36f8014f 	tbz	w15, #31, 0x4039d0
  4039ac:	310025ff 	cmn	w15, #0x9
  4039b0:	54fffc2a 	b.ge	0x403934  // b.tcont
  4039b4:	110025ef 	add	w15, w15, #0x9
  4039b8:	2a1e03f2 	mov	w18, w30
  4039bc:	52803ff1 	mov	w17, #0x1ff                 	// #511
  4039c0:	52800130 	mov	w16, #0x9                   	// #9
  4039c4:	aa0d03e1 	mov	x1, x13
  4039c8:	52800003 	mov	w3, #0x0                   	// #0
  4039cc:	17ffffe6 	b	0x403964
  4039d0:	b940aba0 	ldr	w0, [x29, #168]
  4039d4:	34000040 	cbz	w0, 0x4039dc
  4039d8:	b90137af 	str	w15, [x29, #308]
  4039dc:	eb0d019f 	cmp	x12, x13
  4039e0:	54000509 	b.ls	0x403a80  // b.plast
  4039e4:	cb0d0321 	sub	x1, x25, x13
  4039e8:	b94001a3 	ldr	w3, [x13]
  4039ec:	52800140 	mov	w0, #0xa                   	// #10
  4039f0:	9342fc21 	asr	x1, x1, #2
  4039f4:	0b010c21 	add	w1, w1, w1, lsl #3
  4039f8:	14000004 	b	0x403a08
  4039fc:	0b000800 	add	w0, w0, w0, lsl #2
  403a00:	11000421 	add	w1, w1, #0x1
  403a04:	531f7800 	lsl	w0, w0, #1
  403a08:	6b00007f 	cmp	w3, w0
  403a0c:	54ffff82 	b.cs	0x4039fc  // b.hs, b.nlast
  403a10:	71019b9f 	cmp	w28, #0x66
  403a14:	1a9f1020 	csel	w0, w1, wzr, ne	// ne = any
  403a18:	4b000100 	sub	w0, w8, w0
  403a1c:	b94123a4 	ldr	w4, [x29, #288]
  403a20:	cb190183 	sub	x3, x12, x25
  403a24:	71019f9f 	cmp	w28, #0x67
  403a28:	9342fc63 	asr	x3, x3, #2
  403a2c:	7a400884 	ccmp	w4, #0x0, #0x4, eq	// eq = none
  403a30:	d1000463 	sub	x3, x3, #0x1
  403a34:	1a9f07eb 	cset	w11, ne	// ne = any
  403a38:	4b0b0000 	sub	w0, w0, w11
  403a3c:	8b030c63 	add	x3, x3, x3, lsl #3
  403a40:	eb20c07f 	cmp	x3, w0, sxtw
  403a44:	5400138d 	b.le	0x403cb4
  403a48:	11409000 	add	w0, w0, #0x24, lsl #12
  403a4c:	5291c723 	mov	w3, #0x8e39                	// #36409
  403a50:	72a71c63 	movk	w3, #0x38e3, lsl #16
  403a54:	929fff64 	mov	x4, #0xffffffffffff0004    	// #-65532
  403a58:	5280014b 	mov	w11, #0xa                   	// #10
  403a5c:	9b237c03 	smull	x3, w0, w3
  403a60:	9361fc63 	asr	x3, x3, #33
  403a64:	4b807c63 	sub	w3, w3, w0, asr #31
  403a68:	0b030c6e 	add	w14, w3, w3, lsl #3
  403a6c:	8b23cb23 	add	x3, x25, w3, sxtw #2
  403a70:	4b0e0000 	sub	w0, w0, w14
  403a74:	8b040063 	add	x3, x3, x4
  403a78:	11000400 	add	w0, w0, #0x1
  403a7c:	14000007 	b	0x403a98
  403a80:	2a0803e0 	mov	w0, w8
  403a84:	2a1403e1 	mov	w1, w20
  403a88:	17ffffe5 	b	0x403a1c
  403a8c:	0b0b096b 	add	w11, w11, w11, lsl #2
  403a90:	11000400 	add	w0, w0, #0x1
  403a94:	531f796b 	lsl	w11, w11, #1
  403a98:	7100241f 	cmp	w0, #0x9
  403a9c:	54ffff81 	b.ne	0x403a8c  // b.any
  403aa0:	b940006e 	ldr	w14, [x3]
  403aa4:	1acb09d0 	udiv	w16, w14, w11
  403aa8:	1b0bba00 	msub	w0, w16, w11, w14
  403aac:	35000080 	cbnz	w0, 0x403abc
  403ab0:	9100106f 	add	x15, x3, #0x4
  403ab4:	eb0f019f 	cmp	x12, x15
  403ab8:	54000860 	b.eq	0x403bc4  // b.none
  403abc:	37000230 	tbnz	w16, #0, 0x403b00
  403ac0:	5299400f 	mov	w15, #0xca00                	// #51712
  403ac4:	72a7734f 	movk	w15, #0x3b9a, lsl #16
  403ac8:	6b0f017f 	cmp	w11, w15
  403acc:	fa4301a2 	ccmp	x13, x3, #0x2, eq	// eq = none
  403ad0:	540000e2 	b.cs	0x403aec  // b.hs, b.nlast
  403ad4:	d0000024 	adrp	x4, 0x409000
  403ad8:	91110084 	add	x4, x4, #0x440
  403adc:	b85fc06f 	ldur	w15, [x3, #-4]
  403ae0:	3dc00080 	ldr	q0, [x4]
  403ae4:	3d8043a0 	str	q0, [x29, #256]
  403ae8:	3700014f 	tbnz	w15, #0, 0x403b10
  403aec:	d0000024 	adrp	x4, 0x409000
  403af0:	91114084 	add	x4, x4, #0x450
  403af4:	3dc00080 	ldr	q0, [x4]
  403af8:	3d8043a0 	str	q0, [x29, #256]
  403afc:	14000005 	b	0x403b10
  403b00:	d0000024 	adrp	x4, 0x409000
  403b04:	91110084 	add	x4, x4, #0x440
  403b08:	3dc00080 	ldr	q0, [x4]
  403b0c:	3d8043a0 	str	q0, [x29, #256]
  403b10:	d0000024 	adrp	x4, 0x409000
  403b14:	91118084 	add	x4, x4, #0x460
  403b18:	13017d6f 	asr	w15, w11, #1
  403b1c:	3dc00080 	ldr	q0, [x4]
  403b20:	9e660010 	fmov	x16, d0
  403b24:	9eae0011 	fmov	x17, v0.d[1]
  403b28:	6b0f001f 	cmp	w0, w15
  403b2c:	540000e3 	b.cc	0x403b48  // b.lo, b.ul, b.last
  403b30:	d0000024 	adrp	x4, 0x409000
  403b34:	9111c084 	add	x4, x4, #0x470
  403b38:	3dc00080 	ldr	q0, [x4]
  403b3c:	9e660010 	fmov	x16, d0
  403b40:	9eae0011 	fmov	x17, v0.d[1]
  403b44:	54000460 	b.eq	0x403bd0  // b.none
  403b48:	3400009b 	cbz	w27, 0x403b58
  403b4c:	3940034f 	ldrb	w15, [x26]
  403b50:	7100b5ff 	cmp	w15, #0x2d
  403b54:	540005a0 	b.eq	0x403c08  // b.none
  403b58:	9e670201 	fmov	d1, x16
  403b5c:	3dc043a0 	ldr	q0, [x29, #256]
  403b60:	4b0001ce 	sub	w14, w14, w0
  403b64:	a90a8fa7 	stp	x7, x3, [x29, #168]
  403b68:	9eaf0221 	fmov	v1.d[1], x17
  403b6c:	b900bbab 	str	w11, [x29, #184]
  403b70:	b900c3a1 	str	w1, [x29, #192]
  403b74:	a90cb3ad 	stp	x13, x12, [x29, #200]
  403b78:	b900dba8 	str	w8, [x29, #216]
  403b7c:	b900e3ae 	str	w14, [x29, #224]
  403b80:	b900f3a2 	str	w2, [x29, #240]
  403b84:	94000a43 	bl	0x406490
  403b88:	4ea01c01 	mov	v1.16b, v0.16b
  403b8c:	3dc043a0 	ldr	q0, [x29, #256]
  403b90:	94000de4 	bl	0x407320
  403b94:	5285112a 	mov	w10, #0x2889                	// #10377
  403b98:	b940bbab 	ldr	w11, [x29, #184]
  403b9c:	a94a8fa7 	ldp	x7, x3, [x29, #168]
  403ba0:	72a0002a 	movk	w10, #0x1, lsl #16
  403ba4:	a94cb3ad 	ldp	x13, x12, [x29, #200]
  403ba8:	b940dba8 	ldr	w8, [x29, #216]
  403bac:	b940e3ae 	ldr	w14, [x29, #224]
  403bb0:	b940f3a2 	ldr	w2, [x29, #240]
  403bb4:	35000420 	cbnz	w0, 0x403c38
  403bb8:	aa0303ef 	mov	x15, x3
  403bbc:	b940c3a1 	ldr	w1, [x29, #192]
  403bc0:	b80045ee 	str	w14, [x15], #4
  403bc4:	eb0f019f 	cmp	x12, x15
  403bc8:	9a8f918c 	csel	x12, x12, x15, ls	// ls = plast
  403bcc:	1400003a 	b	0x403cb4
  403bd0:	d0000024 	adrp	x4, 0x409000
  403bd4:	91120084 	add	x4, x4, #0x480
  403bd8:	9100106f 	add	x15, x3, #0x4
  403bdc:	3dc00080 	ldr	q0, [x4]
  403be0:	9e660010 	fmov	x16, d0
  403be4:	9eae0011 	fmov	x17, v0.d[1]
  403be8:	eb0f019f 	cmp	x12, x15
  403bec:	54fffae0 	b.eq	0x403b48  // b.none
  403bf0:	d0000024 	adrp	x4, 0x409000
  403bf4:	9111c084 	add	x4, x4, #0x470
  403bf8:	3dc00080 	ldr	q0, [x4]
  403bfc:	9e660010 	fmov	x16, d0
  403c00:	9eae0011 	fmov	x17, v0.d[1]
  403c04:	17ffffd1 	b	0x403b48
  403c08:	f94083a4 	ldr	x4, [x29, #256]
  403c0c:	f9003ba4 	str	x4, [x29, #112]
  403c10:	f94087a4 	ldr	x4, [x29, #264]
  403c14:	f90033b0 	str	x16, [x29, #96]
  403c18:	d2410084 	eor	x4, x4, #0x8000000000000000
  403c1c:	f9003fa4 	str	x4, [x29, #120]
  403c20:	d2410224 	eor	x4, x17, #0x8000000000000000
  403c24:	f90037a4 	str	x4, [x29, #104]
  403c28:	3dc01fa0 	ldr	q0, [x29, #112]
  403c2c:	a94647b0 	ldp	x16, x17, [x29, #96]
  403c30:	3d8043a0 	str	q0, [x29, #256]
  403c34:	17ffffc9 	b	0x403b58
  403c38:	52993fe1 	mov	w1, #0xc9ff                	// #51711
  403c3c:	0b0e016b 	add	w11, w11, w14
  403c40:	72a77341 	movk	w1, #0x3b9a, lsl #16
  403c44:	b900006b 	str	w11, [x3]
  403c48:	14000004 	b	0x403c58
  403c4c:	b9400060 	ldr	w0, [x3]
  403c50:	11000400 	add	w0, w0, #0x1
  403c54:	b9000060 	str	w0, [x3]
  403c58:	b9400060 	ldr	w0, [x3]
  403c5c:	6b01001f 	cmp	w0, w1
  403c60:	540000e9 	b.ls	0x403c7c  // b.plast
  403c64:	b81fc47f 	str	wzr, [x3], #-4
  403c68:	eb0d007f 	cmp	x3, x13
  403c6c:	54ffff02 	b.cs	0x403c4c  // b.hs, b.nlast
  403c70:	d10011ad 	sub	x13, x13, #0x4
  403c74:	b90001bf 	str	wzr, [x13]
  403c78:	17fffff5 	b	0x403c4c
  403c7c:	cb0d0321 	sub	x1, x25, x13
  403c80:	b94001ab 	ldr	w11, [x13]
  403c84:	52800140 	mov	w0, #0xa                   	// #10
  403c88:	9342fc21 	asr	x1, x1, #2
  403c8c:	0b010c21 	add	w1, w1, w1, lsl #3
  403c90:	14000004 	b	0x403ca0
  403c94:	0b000800 	add	w0, w0, w0, lsl #2
  403c98:	11000421 	add	w1, w1, #0x1
  403c9c:	531f7800 	lsl	w0, w0, #1
  403ca0:	6b00017f 	cmp	w11, w0
  403ca4:	54ffff82 	b.cs	0x403c94  // b.hs, b.nlast
  403ca8:	9100106f 	add	x15, x3, #0x4
  403cac:	17ffffc6 	b	0x403bc4
  403cb0:	d100118c 	sub	x12, x12, #0x4
  403cb4:	eb0d019f 	cmp	x12, x13
  403cb8:	54000069 	b.ls	0x403cc4  // b.plast
  403cbc:	b85fc180 	ldur	w0, [x12, #-4]
  403cc0:	34ffff80 	cbz	w0, 0x403cb0
  403cc4:	71019f9f 	cmp	w28, #0x67
  403cc8:	54000140 	b.eq	0x403cf0  // b.none
  403ccc:	321b005c 	orr	w28, w2, #0x20
  403cd0:	340004a8 	cbz	w8, 0x403d64
  403cd4:	321f77e0 	mov	w0, #0x7ffffffe            	// #2147483646
  403cd8:	6b00011f 	cmp	w8, w0
  403cdc:	54003c6a 	b.ge	0x404468  // b.tcont
  403ce0:	11000500 	add	w0, w8, #0x1
  403ce4:	321b005c 	orr	w28, w2, #0x20
  403ce8:	5280002b 	mov	w11, #0x1                   	// #1
  403cec:	14000021 	b	0x403d70
  403cf0:	7100011f 	cmp	w8, #0x0
  403cf4:	1a9f1508 	csinc	w8, w8, wzr, ne	// ne = any
  403cf8:	6b01011f 	cmp	w8, w1
  403cfc:	3a44c821 	ccmn	w1, #0x4, #0x1, gt
  403d00:	5400092b 	b.lt	0x403e24  // b.tstop
  403d04:	11000420 	add	w0, w1, #0x1
  403d08:	51000442 	sub	w2, w2, #0x1
  403d0c:	4b000108 	sub	w8, w8, w0
  403d10:	371ffdf7 	tbnz	w23, #3, 0x403ccc
  403d14:	d2800123 	mov	x3, #0x9                   	// #9
  403d18:	eb0d019f 	cmp	x12, x13
  403d1c:	54000069 	b.ls	0x403d28  // b.plast
  403d20:	b85fc18e 	ldur	w14, [x12, #-4]
  403d24:	3500096e 	cbnz	w14, 0x403e50
  403d28:	cb190180 	sub	x0, x12, x25
  403d2c:	321b005c 	orr	w28, w2, #0x20
  403d30:	93407d08 	sxtw	x8, w8
  403d34:	9342fc00 	asr	x0, x0, #2
  403d38:	d1000400 	sub	x0, x0, #0x1
  403d3c:	8b000c00 	add	x0, x0, x0, lsl #3
  403d40:	71019b9f 	cmp	w28, #0x66
  403d44:	54000040 	b.eq	0x403d4c  // b.none
  403d48:	8b21c000 	add	x0, x0, w1, sxtw
  403d4c:	eb030000 	subs	x0, x0, x3
  403d50:	9a9f5000 	csel	x0, x0, xzr, pl	// pl = nfrst
  403d54:	eb08001f 	cmp	x0, x8
  403d58:	9a88d000 	csel	x0, x0, x8, le
  403d5c:	2a0003e8 	mov	w8, w0
  403d60:	b5fffba0 	cbnz	x0, 0x403cd4
  403d64:	2a1403e8 	mov	w8, w20
  403d68:	d3430eeb 	ubfx	x11, x23, #3, #1
  403d6c:	52800020 	mov	w0, #0x1                   	// #1
  403d70:	0b00016b 	add	w11, w11, w0
  403d74:	12b00011 	mov	w17, #0x7fffffff            	// #2147483647
  403d78:	4b0b0231 	sub	w17, w17, w11
  403d7c:	71019b9f 	cmp	w28, #0x66
  403d80:	540006e1 	b.ne	0x403e5c  // b.any
  403d84:	6b11003f 	cmp	w1, w17
  403d88:	5400370c 	b.gt	0x404468
  403d8c:	7100003f 	cmp	w1, #0x0
  403d90:	0b010161 	add	w1, w11, w1
  403d94:	1a8bc02b 	csel	w11, w1, w11, gt
  403d98:	f240037f 	tst	x27, #0x1
  403d9c:	12b00000 	mov	w0, #0x7fffffff            	// #2147483647
  403da0:	321f77e1 	mov	w1, #0x7ffffffe            	// #2147483646
  403da4:	1a810000 	csel	w0, w0, w1, eq	// eq = none
  403da8:	6b0b001f 	cmp	w0, w11
  403dac:	540035eb 	b.lt	0x404468  // b.tstop
  403db0:	0b0b0374 	add	w20, w27, w11
  403db4:	12130ee0 	and	w0, w23, #0x1e000
  403db8:	6b14031f 	cmp	w24, w20
  403dbc:	12107400 	and	w0, w0, #0xffff3fff
  403dc0:	1a9fc7e1 	cset	w1, le
  403dc4:	b90103a1 	str	w1, [x29, #256]
  403dc8:	7100001f 	cmp	w0, #0x0
  403dcc:	7a400820 	ccmp	w1, #0x0, #0x0, eq	// eq = none
  403dd0:	54000980 	b.eq	0x403f00  // b.none
  403dd4:	b94002a0 	ldr	w0, [x21]
  403dd8:	36280b00 	tbz	w0, #5, 0x403f38
  403ddc:	12130ee0 	and	w0, w23, #0x1e000
  403de0:	12107400 	and	w0, w0, #0xffff3fff
  403de4:	7140401f 	cmp	w0, #0x10, lsl #12
  403de8:	b94103a0 	ldr	w0, [x29, #256]
  403dec:	7a400800 	ccmp	w0, #0x0, #0x0, eq	// eq = none
  403df0:	54000be0 	b.eq	0x403f6c  // b.none
  403df4:	71019b9f 	cmp	w28, #0x66
  403df8:	54000d60 	b.eq	0x403fa4  // b.none
  403dfc:	eb0d019f 	cmp	x12, x13
  403e00:	910011a0 	add	x0, x13, #0x4
  403e04:	b202e7f9 	mov	x25, #0xcccccccccccccccc    	// #-3689348814741910324
  403e08:	9a8c900c 	csel	x12, x0, x12, ls	// ls = plast
  403e0c:	aa0d03fc 	mov	x28, x13
  403e10:	910607ae 	add	x14, x29, #0x181
  403e14:	9105e3ba 	add	x26, x29, #0x178
  403e18:	f29999b9 	movk	x25, #0xcccd
  403e1c:	5280061b 	mov	w27, #0x30                  	// #48
  403e20:	1400011e 	b	0x404298
  403e24:	51000842 	sub	w2, w2, #0x2
  403e28:	51000508 	sub	w8, w8, #0x1
  403e2c:	17ffffb9 	b	0x403d10
  403e30:	0b000800 	add	w0, w0, w0, lsl #2
  403e34:	11000463 	add	w3, w3, #0x1
  403e38:	531f7800 	lsl	w0, w0, #1
  403e3c:	1ac009cb 	udiv	w11, w14, w0
  403e40:	1b00b96b 	msub	w11, w11, w0, w14
  403e44:	34ffff6b 	cbz	w11, 0x403e30
  403e48:	93407c63 	sxtw	x3, w3
  403e4c:	17ffffb7 	b	0x403d28
  403e50:	2a1403e3 	mov	w3, w20
  403e54:	52800140 	mov	w0, #0xa                   	// #10
  403e58:	17fffff9 	b	0x403e3c
  403e5c:	7100003f 	cmp	w1, #0x0
  403e60:	910533b4 	add	x20, x29, #0x14c
  403e64:	5a81a42e 	cneg	w14, w1, lt	// lt = tstop
  403e68:	b202e7f2 	mov	x18, #0xcccccccccccccccc    	// #-3689348814741910324
  403e6c:	aa1403e0 	mov	x0, x20
  403e70:	f29999b2 	movk	x18, #0xcccd
  403e74:	93407dce 	sxtw	x14, w14
  403e78:	14000008 	b	0x403e98
  403e7c:	9bd27dd0 	umulh	x16, x14, x18
  403e80:	d343fe10 	lsr	x16, x16, #3
  403e84:	8b100a0f 	add	x15, x16, x16, lsl #2
  403e88:	cb0f05cf 	sub	x15, x14, x15, lsl #1
  403e8c:	aa1003ee 	mov	x14, x16
  403e90:	1100c1ef 	add	w15, w15, #0x30
  403e94:	381ffc0f 	strb	w15, [x0, #-1]!
  403e98:	f10025df 	cmp	x14, #0x9
  403e9c:	54ffff08 	b.hi	0x403e7c  // b.pmore
  403ea0:	b400008e 	cbz	x14, 0x403eb0
  403ea4:	1100c1ce 	add	w14, w14, #0x30
  403ea8:	d1000400 	sub	x0, x0, #0x1
  403eac:	3900000e 	strb	w14, [x0]
  403eb0:	5280060f 	mov	w15, #0x30                  	// #48
  403eb4:	14000002 	b	0x403ebc
  403eb8:	381ffc0f 	strb	w15, [x0, #-1]!
  403ebc:	cb00028e 	sub	x14, x20, x0
  403ec0:	f10005df 	cmp	x14, #0x1
  403ec4:	54ffffad 	b.le	0x403eb8
  403ec8:	7100003f 	cmp	w1, #0x0
  403ecc:	d1000801 	sub	x1, x0, #0x2
  403ed0:	aa0103e3 	mov	x3, x1
  403ed4:	52800561 	mov	w1, #0x2b                  	// #43
  403ed8:	381fe002 	sturb	w2, [x0, #-2]
  403edc:	528005a2 	mov	w2, #0x2d                  	// #45
  403ee0:	1a82a021 	csel	w1, w1, w2, ge	// ge = tcont
  403ee4:	381ff001 	sturb	w1, [x0, #-1]
  403ee8:	f90053a3 	str	x3, [x29, #160]
  403eec:	cb030283 	sub	x3, x20, x3
  403ef0:	eb31c07f 	cmp	x3, w17, sxtw
  403ef4:	54002bac 	b.gt	0x404468
  403ef8:	0b03016b 	add	w11, w11, w3
  403efc:	17ffffa7 	b	0x403d98
  403f00:	2a1403e3 	mov	w3, w20
  403f04:	2a1803e2 	mov	w2, w24
  403f08:	aa1503e0 	mov	x0, x21
  403f0c:	52800401 	mov	w1, #0x20                  	// #32
  403f10:	a90d37a7 	stp	x7, x13, [x29, #208]
  403f14:	b900e3a8 	str	w8, [x29, #224]
  403f18:	f9007bac 	str	x12, [x29, #240]
  403f1c:	97fff954 	bl	0x40246c
  403f20:	5285112a 	mov	w10, #0x2889                	// #10377
  403f24:	b940e3a8 	ldr	w8, [x29, #224]
  403f28:	a94d37a7 	ldp	x7, x13, [x29, #208]
  403f2c:	72a0002a 	movk	w10, #0x1, lsl #16
  403f30:	f9407bac 	ldr	x12, [x29, #240]
  403f34:	17ffffa8 	b	0x403dd4
  403f38:	93407f61 	sxtw	x1, w27
  403f3c:	aa1a03e0 	mov	x0, x26
  403f40:	aa1503e2 	mov	x2, x21
  403f44:	a90d37a7 	stp	x7, x13, [x29, #208]
  403f48:	b900e3a8 	str	w8, [x29, #224]
  403f4c:	f9007bac 	str	x12, [x29, #240]
  403f50:	97fff7f3 	bl	0x401f1c
  403f54:	5285112a 	mov	w10, #0x2889                	// #10377
  403f58:	b940e3a8 	ldr	w8, [x29, #224]
  403f5c:	a94d37a7 	ldp	x7, x13, [x29, #208]
  403f60:	72a0002a 	movk	w10, #0x1, lsl #16
  403f64:	f9407bac 	ldr	x12, [x29, #240]
  403f68:	17ffff9d 	b	0x403ddc
  403f6c:	2a1403e3 	mov	w3, w20
  403f70:	2a1803e2 	mov	w2, w24
  403f74:	aa1503e0 	mov	x0, x21
  403f78:	52800601 	mov	w1, #0x30                  	// #48
  403f7c:	a90d37a7 	stp	x7, x13, [x29, #208]
  403f80:	b900e3a8 	str	w8, [x29, #224]
  403f84:	f9007bac 	str	x12, [x29, #240]
  403f88:	97fff939 	bl	0x40246c
  403f8c:	5285112a 	mov	w10, #0x2889                	// #10377
  403f90:	b940e3a8 	ldr	w8, [x29, #224]
  403f94:	a94d37a7 	ldp	x7, x13, [x29, #208]
  403f98:	72a0002a 	movk	w10, #0x1, lsl #16
  403f9c:	f9407bac 	ldr	x12, [x29, #240]
  403fa0:	17ffff95 	b	0x403df4
  403fa4:	eb0d033f 	cmp	x25, x13
  403fa8:	b202e7fa 	mov	x26, #0xcccccccccccccccc    	// #-3689348814741910324
  403fac:	9a8d933c 	csel	x28, x25, x13, ls	// ls = plast
  403fb0:	910607a3 	add	x3, x29, #0x181
  403fb4:	aa1c03eb 	mov	x11, x28
  403fb8:	f29999ba 	movk	x26, #0xcccd
  403fbc:	5280061b 	mov	w27, #0x30                  	// #48
  403fc0:	14000025 	b	0x404054
  403fc4:	9bda7da2 	umulh	x2, x13, x26
  403fc8:	d343fc42 	lsr	x2, x2, #3
  403fcc:	8b020841 	add	x1, x2, x2, lsl #2
  403fd0:	cb0105a1 	sub	x1, x13, x1, lsl #1
  403fd4:	aa0203ed 	mov	x13, x2
  403fd8:	1100c021 	add	w1, w1, #0x30
  403fdc:	381ffc01 	strb	w1, [x0, #-1]!
  403fe0:	f10025bf 	cmp	x13, #0x9
  403fe4:	54ffff08 	b.hi	0x403fc4  // b.pmore
  403fe8:	b400008d 	cbz	x13, 0x403ff8
  403fec:	1100c1ad 	add	w13, w13, #0x30
  403ff0:	d1000400 	sub	x0, x0, #0x1
  403ff4:	3900000d 	strb	w13, [x0]
  403ff8:	aa0003e1 	mov	x1, x0
  403ffc:	9105e3ae 	add	x14, x29, #0x178
  404000:	eb0b039f 	cmp	x28, x11
  404004:	54000141 	b.ne	0x40402c  // b.any
  404008:	cb000061 	sub	x1, x3, x0
  40400c:	eb03001f 	cmp	x0, x3
  404010:	540001c1 	b.ne	0x404048  // b.any
  404014:	52800601 	mov	w1, #0x30                  	// #48
  404018:	910603a0 	add	x0, x29, #0x180
  40401c:	390603a1 	strb	w1, [x29, #384]
  404020:	d2800021 	mov	x1, #0x1                   	// #1
  404024:	14000009 	b	0x404048
  404028:	381ffc3b 	strb	w27, [x1, #-1]!
  40402c:	eb0e003f 	cmp	x1, x14
  404030:	54ffffc8 	b.hi	0x404028  // b.pmore
  404034:	eb0e001f 	cmp	x0, x14
  404038:	cb0001ce 	sub	x14, x14, x0
  40403c:	9a9f21ce 	csel	x14, x14, xzr, cs	// cs = hs, nlast
  404040:	8b0e0000 	add	x0, x0, x14
  404044:	cb000061 	sub	x1, x3, x0
  404048:	b94002a2 	ldr	w2, [x21]
  40404c:	362800e2 	tbz	w2, #5, 0x404068
  404050:	9100116b 	add	x11, x11, #0x4
  404054:	eb0b033f 	cmp	x25, x11
  404058:	54000223 	b.cc	0x40409c  // b.lo, b.ul, b.last
  40405c:	b940016d 	ldr	w13, [x11]
  404060:	aa0303e0 	mov	x0, x3
  404064:	17ffffdf 	b	0x403fe0
  404068:	aa1503e2 	mov	x2, x21
  40406c:	a90c8fa7 	stp	x7, x3, [x29, #200]
  404070:	f9006fab 	str	x11, [x29, #216]
  404074:	b900e3a8 	str	w8, [x29, #224]
  404078:	f9007bac 	str	x12, [x29, #240]
  40407c:	97fff7a8 	bl	0x401f1c
  404080:	5285112a 	mov	w10, #0x2889                	// #10377
  404084:	b940e3a8 	ldr	w8, [x29, #224]
  404088:	a94c8fa7 	ldp	x7, x3, [x29, #200]
  40408c:	72a0002a 	movk	w10, #0x1, lsl #16
  404090:	f9406fab 	ldr	x11, [x29, #216]
  404094:	f9407bac 	ldr	x12, [x29, #240]
  404098:	17ffffee 	b	0x404050
  40409c:	9100133a 	add	x26, x25, #0x4
  4040a0:	d1000f80 	sub	x0, x28, #0x3
  4040a4:	91000739 	add	x25, x25, #0x1
  4040a8:	cb1c035a 	sub	x26, x26, x28
  4040ac:	eb00033f 	cmp	x25, x0
  4040b0:	927ef75a 	and	x26, x26, #0xfffffffffffffffc
  4040b4:	9a9f235a 	csel	x26, x26, xzr, cs	// cs = hs, nlast
  4040b8:	121d02e0 	and	w0, w23, #0x8
  4040bc:	8b1a039a 	add	x26, x28, x26
  4040c0:	2a080000 	orr	w0, w0, w8
  4040c4:	340018c0 	cbz	w0, 0x4043dc
  4040c8:	b94002a0 	ldr	w0, [x21]
  4040cc:	362800c0 	tbz	w0, #5, 0x4040e4
  4040d0:	b202e7fb 	mov	x27, #0xcccccccccccccccc    	// #-3689348814741910324
  4040d4:	9105e3b9 	add	x25, x29, #0x178
  4040d8:	f29999bb 	movk	x27, #0xcccd
  4040dc:	5280061c 	mov	w28, #0x30                  	// #48
  4040e0:	14000025 	b	0x404174
  4040e4:	aa1503e2 	mov	x2, x21
  4040e8:	b0000020 	adrp	x0, 0x409000
  4040ec:	d2800021 	mov	x1, #0x1                   	// #1
  4040f0:	91054000 	add	x0, x0, #0x150
  4040f4:	f9006fa7 	str	x7, [x29, #216]
  4040f8:	b900e3a8 	str	w8, [x29, #224]
  4040fc:	f9007bac 	str	x12, [x29, #240]
  404100:	97fff787 	bl	0x401f1c
  404104:	5285112a 	mov	w10, #0x2889                	// #10377
  404108:	b940e3a8 	ldr	w8, [x29, #224]
  40410c:	f9406fa7 	ldr	x7, [x29, #216]
  404110:	72a0002a 	movk	w10, #0x1, lsl #16
  404114:	f9407bac 	ldr	x12, [x29, #240]
  404118:	17ffffee 	b	0x4040d0
  40411c:	9bdb7c62 	umulh	x2, x3, x27
  404120:	d343fc42 	lsr	x2, x2, #3
  404124:	8b020841 	add	x1, x2, x2, lsl #2
  404128:	cb010461 	sub	x1, x3, x1, lsl #1
  40412c:	aa0203e3 	mov	x3, x2
  404130:	1100c021 	add	w1, w1, #0x30
  404134:	381ffc01 	strb	w1, [x0, #-1]!
  404138:	f100247f 	cmp	x3, #0x9
  40413c:	54ffff08 	b.hi	0x40411c  // b.pmore
  404140:	b4000083 	cbz	x3, 0x404150
  404144:	1100c063 	add	w3, w3, #0x30
  404148:	d1000400 	sub	x0, x0, #0x1
  40414c:	39000003 	strb	w3, [x0]
  404150:	aa0003e1 	mov	x1, x0
  404154:	14000002 	b	0x40415c
  404158:	381ffc3c 	strb	w28, [x1, #-1]!
  40415c:	eb19003f 	cmp	x1, x25
  404160:	54ffffc8 	b.hi	0x404158  // b.pmore
  404164:	b94002a1 	ldr	w1, [x21]
  404168:	36280121 	tbz	w1, #5, 0x40418c
  40416c:	9100135a 	add	x26, x26, #0x4
  404170:	51002508 	sub	w8, w8, #0x9
  404174:	7100011f 	cmp	w8, #0x0
  404178:	fa5ac180 	ccmp	x12, x26, #0x0, gt
  40417c:	540002e9 	b.ls	0x4041d8  // b.plast
  404180:	b9400343 	ldr	w3, [x26]
  404184:	910607a0 	add	x0, x29, #0x181
  404188:	17ffffec 	b	0x404138
  40418c:	eb19001f 	cmp	x0, x25
  404190:	cb000322 	sub	x2, x25, x0
  404194:	9a9f2042 	csel	x2, x2, xzr, cs	// cs = hs, nlast
  404198:	7100251f 	cmp	w8, #0x9
  40419c:	52800121 	mov	w1, #0x9                   	// #9
  4041a0:	1a81d101 	csel	w1, w8, w1, le
  4041a4:	8b020000 	add	x0, x0, x2
  4041a8:	aa1503e2 	mov	x2, x21
  4041ac:	93407c21 	sxtw	x1, w1
  4041b0:	f9006fa7 	str	x7, [x29, #216]
  4041b4:	b900e3a8 	str	w8, [x29, #224]
  4041b8:	f9007bac 	str	x12, [x29, #240]
  4041bc:	97fff758 	bl	0x401f1c
  4041c0:	5285112a 	mov	w10, #0x2889                	// #10377
  4041c4:	b940e3a8 	ldr	w8, [x29, #224]
  4041c8:	f9406fa7 	ldr	x7, [x29, #216]
  4041cc:	72a0002a 	movk	w10, #0x1, lsl #16
  4041d0:	f9407bac 	ldr	x12, [x29, #240]
  4041d4:	17ffffe6 	b	0x40416c
  4041d8:	11002502 	add	w2, w8, #0x9
  4041dc:	7100245f 	cmp	w2, #0x9
  4041e0:	54000fed 	b.le	0x4043dc
  4041e4:	aa1503e0 	mov	x0, x21
  4041e8:	52800123 	mov	w3, #0x9                   	// #9
  4041ec:	52800601 	mov	w1, #0x30                  	// #48
  4041f0:	f90073a7 	str	x7, [x29, #224]
  4041f4:	97fff89e 	bl	0x40246c
  4041f8:	5285112a 	mov	w10, #0x2889                	// #10377
  4041fc:	f94073a7 	ldr	x7, [x29, #224]
  404200:	72a0002a 	movk	w10, #0x1, lsl #16
  404204:	14000076 	b	0x4043dc
  404208:	9bd97c62 	umulh	x2, x3, x25
  40420c:	d343fc42 	lsr	x2, x2, #3
  404210:	8b020841 	add	x1, x2, x2, lsl #2
  404214:	cb010461 	sub	x1, x3, x1, lsl #1
  404218:	aa0203e3 	mov	x3, x2
  40421c:	1100c021 	add	w1, w1, #0x30
  404220:	381ffc01 	strb	w1, [x0, #-1]!
  404224:	f100247f 	cmp	x3, #0x9
  404228:	54ffff08 	b.hi	0x404208  // b.pmore
  40422c:	b4000083 	cbz	x3, 0x40423c
  404230:	1100c063 	add	w3, w3, #0x30
  404234:	d1000400 	sub	x0, x0, #0x1
  404238:	39000003 	strb	w3, [x0]
  40423c:	eb0e001f 	cmp	x0, x14
  404240:	54000140 	b.eq	0x404268  // b.none
  404244:	b94002a2 	ldr	w2, [x21]
  404248:	aa0003e1 	mov	x1, x0
  40424c:	121b0042 	and	w2, w2, #0x20
  404250:	eb1c01bf 	cmp	x13, x28
  404254:	540002e0 	b.eq	0x4042b0  // b.none
  404258:	eb1a003f 	cmp	x1, x26
  40425c:	540000c9 	b.ls	0x404274  // b.plast
  404260:	381ffc3b 	strb	w27, [x1, #-1]!
  404264:	17fffffd 	b	0x404258
  404268:	910603a0 	add	x0, x29, #0x180
  40426c:	390603bb 	strb	w27, [x29, #384]
  404270:	17fffff5 	b	0x404244
  404274:	eb1a001f 	cmp	x0, x26
  404278:	cb000343 	sub	x3, x26, x0
  40427c:	9a9f2063 	csel	x3, x3, xzr, cs	// cs = hs, nlast
  404280:	2a0803eb 	mov	w11, w8
  404284:	8b030003 	add	x3, x0, x3
  404288:	cb0301cf 	sub	x15, x14, x3
  40428c:	340007c2 	cbz	w2, 0x404384
  404290:	4b0f0168 	sub	w8, w11, w15
  404294:	9100139c 	add	x28, x28, #0x4
  404298:	7100011f 	cmp	w8, #0x0
  40429c:	fa4ca382 	ccmp	x28, x12, #0x2, ge	// ge = tcont
  4042a0:	54000942 	b.cs	0x4043c8  // b.hs, b.nlast
  4042a4:	b9400383 	ldr	w3, [x28]
  4042a8:	aa0e03e0 	mov	x0, x14
  4042ac:	17ffffde 	b	0x404224
  4042b0:	91000403 	add	x3, x0, #0x1
  4042b4:	34000102 	cbz	w2, 0x4042d4
  4042b8:	121d02e0 	and	w0, w23, #0x8
  4042bc:	2a0803eb 	mov	w11, w8
  4042c0:	2a080000 	orr	w0, w0, w8
  4042c4:	35000580 	cbnz	w0, 0x404374
  4042c8:	cb0301cf 	sub	x15, x14, x3
  4042cc:	5280000b 	mov	w11, #0x0                   	// #0
  4042d0:	17fffff0 	b	0x404290
  4042d4:	aa1503e2 	mov	x2, x21
  4042d8:	d2800021 	mov	x1, #0x1                   	// #1
  4042dc:	a90c3ba7 	stp	x7, x14, [x29, #192]
  4042e0:	a90d37a3 	stp	x3, x13, [x29, #208]
  4042e4:	b900e3a8 	str	w8, [x29, #224]
  4042e8:	f9007bac 	str	x12, [x29, #240]
  4042ec:	97fff70c 	bl	0x401f1c
  4042f0:	b940e3a8 	ldr	w8, [x29, #224]
  4042f4:	121d02e0 	and	w0, w23, #0x8
  4042f8:	b94002a2 	ldr	w2, [x21]
  4042fc:	5285112a 	mov	w10, #0x2889                	// #10377
  404300:	a94c3ba7 	ldp	x7, x14, [x29, #192]
  404304:	121b0042 	and	w2, w2, #0x20
  404308:	a94d37a3 	ldp	x3, x13, [x29, #208]
  40430c:	2a080000 	orr	w0, w0, w8
  404310:	f9407bac 	ldr	x12, [x29, #240]
  404314:	2a0803eb 	mov	w11, w8
  404318:	72a0002a 	movk	w10, #0x1, lsl #16
  40431c:	34000300 	cbz	w0, 0x40437c
  404320:	350002a2 	cbnz	w2, 0x404374
  404324:	aa1503e2 	mov	x2, x21
  404328:	b0000020 	adrp	x0, 0x409000
  40432c:	d2800021 	mov	x1, #0x1                   	// #1
  404330:	91054000 	add	x0, x0, #0x150
  404334:	a90bbba7 	stp	x7, x14, [x29, #184]
  404338:	b900cba8 	str	w8, [x29, #200]
  40433c:	a90d37a3 	stp	x3, x13, [x29, #208]
  404340:	b900e3a8 	str	w8, [x29, #224]
  404344:	f9007bac 	str	x12, [x29, #240]
  404348:	97fff6f5 	bl	0x401f1c
  40434c:	b94002a2 	ldr	w2, [x21]
  404350:	5285112a 	mov	w10, #0x2889                	// #10377
  404354:	a94bbba7 	ldp	x7, x14, [x29, #184]
  404358:	121b0042 	and	w2, w2, #0x20
  40435c:	a94d37a3 	ldp	x3, x13, [x29, #208]
  404360:	72a0002a 	movk	w10, #0x1, lsl #16
  404364:	f9407bac 	ldr	x12, [x29, #240]
  404368:	b940cbab 	ldr	w11, [x29, #200]
  40436c:	b940e3a8 	ldr	w8, [x29, #224]
  404370:	17ffffc6 	b	0x404288
  404374:	cb0301cf 	sub	x15, x14, x3
  404378:	17ffffc6 	b	0x404290
  40437c:	5280000b 	mov	w11, #0x0                   	// #0
  404380:	17ffffc2 	b	0x404288
  404384:	93407d01 	sxtw	x1, w8
  404388:	aa0303e0 	mov	x0, x3
  40438c:	eb0f003f 	cmp	x1, x15
  404390:	aa1503e2 	mov	x2, x21
  404394:	9a8fd021 	csel	x1, x1, x15, le
  404398:	a90c3ba7 	stp	x7, x14, [x29, #192]
  40439c:	b900d3ab 	str	w11, [x29, #208]
  4043a0:	a90dbfad 	stp	x13, x15, [x29, #216]
  4043a4:	f9007bac 	str	x12, [x29, #240]
  4043a8:	97fff6dd 	bl	0x401f1c
  4043ac:	5285112a 	mov	w10, #0x2889                	// #10377
  4043b0:	b940d3ab 	ldr	w11, [x29, #208]
  4043b4:	a94c3ba7 	ldp	x7, x14, [x29, #192]
  4043b8:	72a0002a 	movk	w10, #0x1, lsl #16
  4043bc:	a94dbfad 	ldp	x13, x15, [x29, #216]
  4043c0:	f9407bac 	ldr	x12, [x29, #240]
  4043c4:	17ffffb3 	b	0x404290
  4043c8:	11004902 	add	w2, w8, #0x12
  4043cc:	7100485f 	cmp	w2, #0x12
  4043d0:	5400026c 	b.gt	0x40441c
  4043d4:	b94002a0 	ldr	w0, [x21]
  4043d8:	36280340 	tbz	w0, #5, 0x404440
  4043dc:	12130ee5 	and	w5, w23, #0x1e000
  4043e0:	b94103a0 	ldr	w0, [x29, #256]
  4043e4:	121074a5 	and	w5, w5, #0xffff3fff
  4043e8:	714008bf 	cmp	w5, #0x2, lsl #12
  4043ec:	7a400800 	ccmp	w0, #0x0, #0x0, eq	// eq = none
  4043f0:	54ff6c81 	b.ne	0x403180  // b.any
  4043f4:	2a1403e3 	mov	w3, w20
  4043f8:	2a1803e2 	mov	w2, w24
  4043fc:	aa1503e0 	mov	x0, x21
  404400:	52800401 	mov	w1, #0x20                  	// #32
  404404:	f90083a7 	str	x7, [x29, #256]
  404408:	97fff819 	bl	0x40246c
  40440c:	5285112a 	mov	w10, #0x2889                	// #10377
  404410:	f94083a7 	ldr	x7, [x29, #256]
  404414:	72a0002a 	movk	w10, #0x1, lsl #16
  404418:	17fffb5a 	b	0x403180
  40441c:	aa1503e0 	mov	x0, x21
  404420:	52800243 	mov	w3, #0x12                  	// #18
  404424:	52800601 	mov	w1, #0x30                  	// #48
  404428:	f90073a7 	str	x7, [x29, #224]
  40442c:	97fff810 	bl	0x40246c
  404430:	5285112a 	mov	w10, #0x2889                	// #10377
  404434:	f94073a7 	ldr	x7, [x29, #224]
  404438:	72a0002a 	movk	w10, #0x1, lsl #16
  40443c:	17ffffe6 	b	0x4043d4
  404440:	f94053a0 	ldr	x0, [x29, #160]
  404444:	910533a1 	add	x1, x29, #0x14c
  404448:	aa1503e2 	mov	x2, x21
  40444c:	f90073a7 	str	x7, [x29, #224]
  404450:	cb000021 	sub	x1, x1, x0
  404454:	97fff6b2 	bl	0x401f1c
  404458:	5285112a 	mov	w10, #0x2889                	// #10377
  40445c:	f94073a7 	ldr	x7, [x29, #224]
  404460:	72a0002a 	movk	w10, #0x1, lsl #16
  404464:	17ffffde 	b	0x4043dc
  404468:	f9407fa0 	ldr	x0, [x29, #248]
  40446c:	9100001f 	mov	sp, x0
  404470:	940003d6 	bl	0x4053c8
  404474:	52800961 	mov	w1, #0x4b                  	// #75
  404478:	b9000001 	str	w1, [x0]
  40447c:	14000072 	b	0x404644
  404480:	9105e3ae 	add	x14, x29, #0x178
  404484:	b0000039 	adrp	x25, 0x409000
  404488:	2a1403fb 	mov	w27, w20
  40448c:	cb1a01ce 	sub	x14, x14, x26
  404490:	91040324 	add	x4, x25, #0x100
  404494:	12b00001 	mov	w1, #0x7fffffff            	// #2147483647
  404498:	17fffa03 	b	0x402ca4
  40449c:	aa0e03fa 	mov	x26, x14
  4044a0:	2a1403e8 	mov	w8, w20
  4044a4:	d280000e 	mov	x14, #0x0                   	// #0
  4044a8:	17fffa03 	b	0x402cb4
  4044ac:	b0000020 	adrp	x0, 0x409000
  4044b0:	2a0c03f9 	mov	w25, w12
  4044b4:	2a1403fb 	mov	w27, w20
  4044b8:	91040004 	add	x4, x0, #0x100
  4044bc:	17fff9ff 	b	0x402cb8
  4044c0:	2a0b03e2 	mov	w2, w11
  4044c4:	2a1903e3 	mov	w3, w25
  4044c8:	aa1503e0 	mov	x0, x21
  4044cc:	52800401 	mov	w1, #0x20                  	// #32
  4044d0:	a90dbba7 	stp	x7, x14, [x29, #216]
  4044d4:	b900f3a8 	str	w8, [x29, #240]
  4044d8:	f9007fa4 	str	x4, [x29, #248]
  4044dc:	b90103ab 	str	w11, [x29, #256]
  4044e0:	97fff7e3 	bl	0x40246c
  4044e4:	5285112a 	mov	w10, #0x2889                	// #10377
  4044e8:	b940f3a8 	ldr	w8, [x29, #240]
  4044ec:	a94dbba7 	ldp	x7, x14, [x29, #216]
  4044f0:	72a0002a 	movk	w10, #0x1, lsl #16
  4044f4:	f9407fa4 	ldr	x4, [x29, #248]
  4044f8:	b94103ab 	ldr	w11, [x29, #256]
  4044fc:	17fff9fa 	b	0x402ce4
  404500:	93407f61 	sxtw	x1, w27
  404504:	aa0403e0 	mov	x0, x4
  404508:	aa1503e2 	mov	x2, x21
  40450c:	b900e3a8 	str	w8, [x29, #224]
  404510:	f9007ba7 	str	x7, [x29, #240]
  404514:	b900fbab 	str	w11, [x29, #248]
  404518:	f90083ae 	str	x14, [x29, #256]
  40451c:	97fff680 	bl	0x401f1c
  404520:	5285112a 	mov	w10, #0x2889                	// #10377
  404524:	b940e3a8 	ldr	w8, [x29, #224]
  404528:	f9407ba7 	ldr	x7, [x29, #240]
  40452c:	72a0002a 	movk	w10, #0x1, lsl #16
  404530:	f94083ae 	ldr	x14, [x29, #256]
  404534:	b940fbab 	ldr	w11, [x29, #248]
  404538:	17fff9ed 	b	0x402cec
  40453c:	2a0b03e2 	mov	w2, w11
  404540:	2a1903e3 	mov	w3, w25
  404544:	aa1503e0 	mov	x0, x21
  404548:	52800601 	mov	w1, #0x30                  	// #48
  40454c:	b900e3a8 	str	w8, [x29, #224]
  404550:	a90f3ba7 	stp	x7, x14, [x29, #240]
  404554:	b90103ab 	str	w11, [x29, #256]
  404558:	97fff7c5 	bl	0x40246c
  40455c:	5285112a 	mov	w10, #0x2889                	// #10377
  404560:	b940e3a8 	ldr	w8, [x29, #224]
  404564:	a94f3ba7 	ldp	x7, x14, [x29, #240]
  404568:	72a0002a 	movk	w10, #0x1, lsl #16
  40456c:	b94103ab 	ldr	w11, [x29, #256]
  404570:	17fff9e4 	b	0x402d00
  404574:	2a0e03e3 	mov	w3, w14
  404578:	2a0803e2 	mov	w2, w8
  40457c:	aa1503e0 	mov	x0, x21
  404580:	52800601 	mov	w1, #0x30                  	// #48
  404584:	f90073a7 	str	x7, [x29, #224]
  404588:	b900fbab 	str	w11, [x29, #248]
  40458c:	f90083ae 	str	x14, [x29, #256]
  404590:	97fff7b7 	bl	0x40246c
  404594:	5285112a 	mov	w10, #0x2889                	// #10377
  404598:	b940fbab 	ldr	w11, [x29, #248]
  40459c:	f94073a7 	ldr	x7, [x29, #224]
  4045a0:	72a0002a 	movk	w10, #0x1, lsl #16
  4045a4:	f94083ae 	ldr	x14, [x29, #256]
  4045a8:	17fff9d8 	b	0x402d08
  4045ac:	aa0e03e1 	mov	x1, x14
  4045b0:	aa1a03e0 	mov	x0, x26
  4045b4:	aa1503e2 	mov	x2, x21
  4045b8:	f9007fa7 	str	x7, [x29, #248]
  4045bc:	b90103ab 	str	w11, [x29, #256]
  4045c0:	97fff657 	bl	0x401f1c
  4045c4:	5285112a 	mov	w10, #0x2889                	// #10377
  4045c8:	b94103ab 	ldr	w11, [x29, #256]
  4045cc:	f9407fa7 	ldr	x7, [x29, #248]
  4045d0:	72a0002a 	movk	w10, #0x1, lsl #16
  4045d4:	17fff9cf 	b	0x402d10
  4045d8:	b5000395 	cbnz	x21, 0x404648
  4045dc:	b94127a0 	ldr	w0, [x29, #292]
  4045e0:	34ff2120 	cbz	w0, 0x402a04
  4045e4:	f9408ba0 	ldr	x0, [x29, #272]
  4045e8:	d2800033 	mov	x19, #0x1                   	// #1
  4045ec:	91004016 	add	x22, x0, #0x10
  4045f0:	f9408fa0 	ldr	x0, [x29, #280]
  4045f4:	b8737801 	ldr	w1, [x0, x19, lsl #2]
  4045f8:	34000161 	cbz	w1, 0x404624
  4045fc:	f94097a2 	ldr	x2, [x29, #296]
  404600:	aa1603e0 	mov	x0, x22
  404604:	91000673 	add	x19, x19, #0x1
  404608:	910042d6 	add	x22, x22, #0x10
  40460c:	97fff6f8 	bl	0x4021ec
  404610:	f1002a7f 	cmp	x19, #0xa
  404614:	54fffee1 	b.ne	0x4045f0  // b.any
  404618:	52800036 	mov	w22, #0x1                   	// #1
  40461c:	1400000b 	b	0x404648
  404620:	91000673 	add	x19, x19, #0x1
  404624:	f1002a7f 	cmp	x19, #0xa
  404628:	54ffff80 	b.eq	0x404618  // b.none
  40462c:	f9408fa0 	ldr	x0, [x29, #280]
  404630:	b8737800 	ldr	w0, [x0, x19, lsl #2]
  404634:	34ffff60 	cbz	w0, 0x404620
  404638:	94000364 	bl	0x4053c8
  40463c:	528002c1 	mov	w1, #0x16                  	// #22
  404640:	b9000001 	str	w1, [x0]
  404644:	12800016 	mov	w22, #0xffffffff            	// #-1
  404648:	910003bf 	mov	sp, x29
  40464c:	2a1603e0 	mov	w0, w22
  404650:	a94153f3 	ldp	x19, x20, [sp, #16]
  404654:	a9425bf5 	ldp	x21, x22, [sp, #32]
  404658:	a94363f7 	ldp	x23, x24, [sp, #48]
  40465c:	a9446bf9 	ldp	x25, x26, [sp, #64]
  404660:	a94573fb 	ldp	x27, x28, [sp, #80]
  404664:	a8da7bfd 	ldp	x29, x30, [sp], #416
  404668:	d65f03c0 	ret
  40466c:	a9a74ffe 	stp	x30, x19, [sp, #-400]!
  404670:	aa0003f3 	mov	x19, x0
  404674:	d2800000 	mov	x0, #0x0                   	// #0
  404678:	a90157f4 	stp	x20, x21, [sp, #16]
  40467c:	910163f5 	add	x21, sp, #0x58
  404680:	a9025ff6 	stp	x22, x23, [sp, #32]
  404684:	9101e3f7 	add	x23, sp, #0x78
  404688:	9103c3f6 	add	x22, sp, #0xf0
  40468c:	a9046ffa 	stp	x26, x27, [sp, #64]
  404690:	aa1703e4 	mov	x4, x23
  404694:	aa0103fa 	mov	x26, x1
  404698:	ad400440 	ldp	q0, q1, [x2]
  40469c:	aa1603e3 	mov	x3, x22
  4046a0:	aa1503e2 	mov	x2, x21
  4046a4:	a907ffff 	stp	xzr, xzr, [sp, #120]
  4046a8:	ad0006a0 	stp	q0, q1, [x21]
  4046ac:	a908ffff 	stp	xzr, xzr, [sp, #136]
  4046b0:	f9004fff 	str	xzr, [sp, #152]
  4046b4:	97fff793 	bl	0x402500
  4046b8:	37f808c0 	tbnz	w0, #31, 0x4047d0
  4046bc:	a90367f8 	stp	x24, x25, [sp, #48]
  4046c0:	52800018 	mov	w24, #0x0                   	// #0
  4046c4:	b9408e60 	ldr	w0, [x19, #140]
  4046c8:	36f80240 	tbz	w0, #31, 0x404710
  4046cc:	f9403260 	ldr	x0, [x19, #96]
  4046d0:	b9400262 	ldr	w2, [x19]
  4046d4:	121a7841 	and	w1, w2, #0xffffffdf
  4046d8:	b9000261 	str	w1, [x19]
  4046dc:	121b0059 	and	w25, w2, #0x20
  4046e0:	b5000200 	cbnz	x0, 0x404720
  4046e4:	910283e1 	add	x1, sp, #0xa0
  4046e8:	d2800a02 	mov	x2, #0x50                  	// #80
  4046ec:	f9402e7b 	ldr	x27, [x19, #88]
  4046f0:	a9027e7f 	stp	xzr, xzr, [x19, #32]
  4046f4:	aa1303e0 	mov	x0, x19
  4046f8:	f9001e7f 	str	xzr, [x19, #56]
  4046fc:	12800014 	mov	w20, #0xffffffff            	// #-1
  404700:	a9058a61 	stp	x1, x2, [x19, #88]
  404704:	940004f0 	bl	0x405ac4
  404708:	35000200 	cbnz	w0, 0x404748
  40470c:	14000008 	b	0x40472c
  404710:	aa1303e0 	mov	x0, x19
  404714:	940003f4 	bl	0x4056e4
  404718:	2a0003f8 	mov	w24, w0
  40471c:	17ffffec 	b	0x4046cc
  404720:	f9401260 	ldr	x0, [x19, #32]
  404724:	b4000440 	cbz	x0, 0x4047ac
  404728:	d280001b 	mov	x27, #0x0                   	// #0
  40472c:	aa1703e4 	mov	x4, x23
  404730:	aa1603e3 	mov	x3, x22
  404734:	aa1503e2 	mov	x2, x21
  404738:	aa1a03e1 	mov	x1, x26
  40473c:	aa1303e0 	mov	x0, x19
  404740:	97fff770 	bl	0x402500
  404744:	2a0003f4 	mov	w20, w0
  404748:	b400019b 	cbz	x27, 0x404778
  40474c:	f9402663 	ldr	x3, [x19, #72]
  404750:	aa1303e0 	mov	x0, x19
  404754:	d2800002 	mov	x2, #0x0                   	// #0
  404758:	d2800001 	mov	x1, #0x0                   	// #0
  40475c:	d63f0060 	blr	x3
  404760:	f9001e7f 	str	xzr, [x19, #56]
  404764:	f9401660 	ldr	x0, [x19, #40]
  404768:	a9027e7f 	stp	xzr, xzr, [x19, #32]
  40476c:	f100001f 	cmp	x0, #0x0
  404770:	a905fe7b 	stp	x27, xzr, [x19, #88]
  404774:	5a9f1294 	csinv	w20, w20, wzr, ne	// ne = any
  404778:	b9400262 	ldr	w2, [x19]
  40477c:	2a190041 	orr	w1, w2, w25
  404780:	b9000261 	str	w1, [x19]
  404784:	f27b005f 	tst	x2, #0x20
  404788:	5a9f0294 	csinv	w20, w20, wzr, eq	// eq = none
  40478c:	350001b8 	cbnz	w24, 0x4047c0
  404790:	a94367f8 	ldp	x24, x25, [sp, #48]
  404794:	2a1403e0 	mov	w0, w20
  404798:	a94157f4 	ldp	x20, x21, [sp, #16]
  40479c:	a9425ff6 	ldp	x22, x23, [sp, #32]
  4047a0:	a9446ffa 	ldp	x26, x27, [sp, #64]
  4047a4:	a8d94ffe 	ldp	x30, x19, [sp], #400
  4047a8:	d65f03c0 	ret
  4047ac:	aa1303e0 	mov	x0, x19
  4047b0:	940004c5 	bl	0x405ac4
  4047b4:	34fffba0 	cbz	w0, 0x404728
  4047b8:	12800014 	mov	w20, #0xffffffff            	// #-1
  4047bc:	17ffffef 	b	0x404778
  4047c0:	aa1303e0 	mov	x0, x19
  4047c4:	940003f6 	bl	0x40579c
  4047c8:	a94367f8 	ldp	x24, x25, [sp, #48]
  4047cc:	17fffff2 	b	0x404794
  4047d0:	12800014 	mov	w20, #0xffffffff            	// #-1
  4047d4:	17fffff0 	b	0x404794
  4047d8:	d503201f 	nop
  4047dc:	d503201f 	nop
  4047e0:	8b020024 	add	x4, x1, x2
  4047e4:	8b020005 	add	x5, x0, x2
  4047e8:	f102005f 	cmp	x2, #0x80
  4047ec:	540007a8 	b.hi	0x4048e0  // b.pmore
  4047f0:	f100805f 	cmp	x2, #0x20
  4047f4:	540003e8 	b.hi	0x404870  // b.pmore
  4047f8:	f100405f 	cmp	x2, #0x10
  4047fc:	540000c3 	b.cc	0x404814  // b.lo, b.ul, b.last
  404800:	a9401c26 	ldp	x6, x7, [x1]
  404804:	a97f348c 	ldp	x12, x13, [x4, #-16]
  404808:	a9001c06 	stp	x6, x7, [x0]
  40480c:	a93f34ac 	stp	x12, x13, [x5, #-16]
  404810:	d65f03c0 	ret
  404814:	361800e2 	tbz	w2, #3, 0x404830
  404818:	f9400026 	ldr	x6, [x1]
  40481c:	f85f8087 	ldur	x7, [x4, #-8]
  404820:	f9000006 	str	x6, [x0]
  404824:	f81f80a7 	stur	x7, [x5, #-8]
  404828:	d65f03c0 	ret
  40482c:	d503201f 	nop
  404830:	361000c2 	tbz	w2, #2, 0x404848
  404834:	b9400026 	ldr	w6, [x1]
  404838:	b85fc088 	ldur	w8, [x4, #-4]
  40483c:	b9000006 	str	w6, [x0]
  404840:	b81fc0a8 	stur	w8, [x5, #-4]
  404844:	d65f03c0 	ret
  404848:	b4000102 	cbz	x2, 0x404868
  40484c:	d341fc4e 	lsr	x14, x2, #1
  404850:	39400026 	ldrb	w6, [x1]
  404854:	385ff08a 	ldurb	w10, [x4, #-1]
  404858:	386e6828 	ldrb	w8, [x1, x14]
  40485c:	39000006 	strb	w6, [x0]
  404860:	382e6808 	strb	w8, [x0, x14]
  404864:	381ff0aa 	sturb	w10, [x5, #-1]
  404868:	d65f03c0 	ret
  40486c:	d503201f 	nop
  404870:	a9401c26 	ldp	x6, x7, [x1]
  404874:	a9412428 	ldp	x8, x9, [x1, #16]
  404878:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
  40487c:	a97f348c 	ldp	x12, x13, [x4, #-16]
  404880:	f101005f 	cmp	x2, #0x40
  404884:	540000e8 	b.hi	0x4048a0  // b.pmore
  404888:	a9001c06 	stp	x6, x7, [x0]
  40488c:	a9012408 	stp	x8, x9, [x0, #16]
  404890:	a93e2caa 	stp	x10, x11, [x5, #-32]
  404894:	a93f34ac 	stp	x12, x13, [x5, #-16]
  404898:	d65f03c0 	ret
  40489c:	d503201f 	nop
  4048a0:	a9423c2e 	ldp	x14, x15, [x1, #32]
  4048a4:	a9434430 	ldp	x16, x17, [x1, #48]
  4048a8:	f101805f 	cmp	x2, #0x60
  4048ac:	540000a9 	b.ls	0x4048c0  // b.plast
  4048b0:	a97c0c82 	ldp	x2, x3, [x4, #-64]
  4048b4:	a97d1081 	ldp	x1, x4, [x4, #-48]
  4048b8:	a93c0ca2 	stp	x2, x3, [x5, #-64]
  4048bc:	a93d10a1 	stp	x1, x4, [x5, #-48]
  4048c0:	a9001c06 	stp	x6, x7, [x0]
  4048c4:	a9012408 	stp	x8, x9, [x0, #16]
  4048c8:	a9023c0e 	stp	x14, x15, [x0, #32]
  4048cc:	a9034410 	stp	x16, x17, [x0, #48]
  4048d0:	a93e2caa 	stp	x10, x11, [x5, #-32]
  4048d4:	a93f34ac 	stp	x12, x13, [x5, #-16]
  4048d8:	d65f03c0 	ret
  4048dc:	d503201f 	nop
  4048e0:	a940342c 	ldp	x12, x13, [x1]
  4048e4:	92400c0e 	and	x14, x0, #0xf
  4048e8:	927cec03 	and	x3, x0, #0xfffffffffffffff0
  4048ec:	cb0e0021 	sub	x1, x1, x14
  4048f0:	8b0e0042 	add	x2, x2, x14
  4048f4:	a9411c26 	ldp	x6, x7, [x1, #16]
  4048f8:	a900340c 	stp	x12, x13, [x0]
  4048fc:	a9422428 	ldp	x8, x9, [x1, #32]
  404900:	a9432c2a 	ldp	x10, x11, [x1, #48]
  404904:	a9c4342c 	ldp	x12, x13, [x1, #64]!
  404908:	f1024042 	subs	x2, x2, #0x90
  40490c:	54000169 	b.ls	0x404938  // b.plast
  404910:	a9011c66 	stp	x6, x7, [x3, #16]
  404914:	a9411c26 	ldp	x6, x7, [x1, #16]
  404918:	a9022468 	stp	x8, x9, [x3, #32]
  40491c:	a9422428 	ldp	x8, x9, [x1, #32]
  404920:	a9032c6a 	stp	x10, x11, [x3, #48]
  404924:	a9432c2a 	ldp	x10, x11, [x1, #48]
  404928:	a984346c 	stp	x12, x13, [x3, #64]!
  40492c:	a9c4342c 	ldp	x12, x13, [x1, #64]!
  404930:	f1010042 	subs	x2, x2, #0x40
  404934:	54fffee8 	b.hi	0x404910  // b.pmore
  404938:	a97c3c8e 	ldp	x14, x15, [x4, #-64]
  40493c:	a9011c66 	stp	x6, x7, [x3, #16]
  404940:	a97d1c86 	ldp	x6, x7, [x4, #-48]
  404944:	a9022468 	stp	x8, x9, [x3, #32]
  404948:	a97e2488 	ldp	x8, x9, [x4, #-32]
  40494c:	a9032c6a 	stp	x10, x11, [x3, #48]
  404950:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
  404954:	a904346c 	stp	x12, x13, [x3, #64]
  404958:	a93c3cae 	stp	x14, x15, [x5, #-64]
  40495c:	a93d1ca6 	stp	x6, x7, [x5, #-48]
  404960:	a93e24a8 	stp	x8, x9, [x5, #-32]
  404964:	a93f2caa 	stp	x10, x11, [x5, #-16]
  404968:	d65f03c0 	ret
  40496c:	d503201f 	nop
  404970:	4e010c20 	dup	v0.16b, w1
  404974:	8b020004 	add	x4, x0, x2
  404978:	f101805f 	cmp	x2, #0x60
  40497c:	540003a8 	b.hi	0x4049f0  // b.pmore
  404980:	f100405f 	cmp	x2, #0x10
  404984:	54000202 	b.cs	0x4049c4  // b.hs, b.nlast
  404988:	4e083c01 	mov	x1, v0.d[0]
  40498c:	361800a2 	tbz	w2, #3, 0x4049a0
  404990:	f9000001 	str	x1, [x0]
  404994:	f81f8081 	stur	x1, [x4, #-8]
  404998:	d65f03c0 	ret
  40499c:	d503201f 	nop
  4049a0:	36100082 	tbz	w2, #2, 0x4049b0
  4049a4:	b9000001 	str	w1, [x0]
  4049a8:	b81fc081 	stur	w1, [x4, #-4]
  4049ac:	d65f03c0 	ret
  4049b0:	b4000082 	cbz	x2, 0x4049c0
  4049b4:	39000001 	strb	w1, [x0]
  4049b8:	36080042 	tbz	w2, #1, 0x4049c0
  4049bc:	781fe081 	sturh	w1, [x4, #-2]
  4049c0:	d65f03c0 	ret
  4049c4:	3d800000 	str	q0, [x0]
  4049c8:	373000c2 	tbnz	w2, #6, 0x4049e0
  4049cc:	3c9f0080 	stur	q0, [x4, #-16]
  4049d0:	36280062 	tbz	w2, #5, 0x4049dc
  4049d4:	3d800400 	str	q0, [x0, #16]
  4049d8:	3c9e0080 	stur	q0, [x4, #-32]
  4049dc:	d65f03c0 	ret
  4049e0:	3d800400 	str	q0, [x0, #16]
  4049e4:	ad010000 	stp	q0, q0, [x0, #32]
  4049e8:	ad3f0080 	stp	q0, q0, [x4, #-32]
  4049ec:	d65f03c0 	ret
  4049f0:	12001c21 	and	w1, w1, #0xff
  4049f4:	927cec03 	and	x3, x0, #0xfffffffffffffff0
  4049f8:	3d800000 	str	q0, [x0]
  4049fc:	f102805f 	cmp	x2, #0xa0
  404a00:	7a402820 	ccmp	w1, #0x0, #0x0, cs	// cs = hs, nlast
  404a04:	54000241 	b.ne	0x404a4c  // b.any
  404a08:	d53b00e5 	mrs	x5, dczid_el0
  404a0c:	924010a5 	and	x5, x5, #0x1f
  404a10:	f10010bf 	cmp	x5, #0x4
  404a14:	540001c1 	b.ne	0x404a4c  // b.any
  404a18:	3d800460 	str	q0, [x3, #16]
  404a1c:	ad010060 	stp	q0, q0, [x3, #32]
  404a20:	927ae463 	and	x3, x3, #0xffffffffffffffc0
  404a24:	cb030082 	sub	x2, x4, x3
  404a28:	d1020042 	sub	x2, x2, #0x80
  404a2c:	d503201f 	nop
  404a30:	91010063 	add	x3, x3, #0x40
  404a34:	d50b7423 	dc	zva, x3
  404a38:	f1010042 	subs	x2, x2, #0x40
  404a3c:	54ffffa8 	b.hi	0x404a30  // b.pmore
  404a40:	ad3e0080 	stp	q0, q0, [x4, #-64]
  404a44:	ad3f0080 	stp	q0, q0, [x4, #-32]
  404a48:	d65f03c0 	ret
  404a4c:	cb030082 	sub	x2, x4, x3
  404a50:	d1004063 	sub	x3, x3, #0x10
  404a54:	d1014042 	sub	x2, x2, #0x50
  404a58:	ad010060 	stp	q0, q0, [x3, #32]
  404a5c:	ad820060 	stp	q0, q0, [x3, #64]!
  404a60:	f1010042 	subs	x2, x2, #0x40
  404a64:	54ffffa8 	b.hi	0x404a58  // b.pmore
  404a68:	ad3e0080 	stp	q0, q0, [x4, #-64]
  404a6c:	ad3f0080 	stp	q0, q0, [x4, #-32]
  404a70:	d65f03c0 	ret
  404a74:	aa0003e3 	mov	x3, x0
  404a78:	12001c21 	and	w1, w1, #0xff
  404a7c:	14000003 	b	0x404a88
  404a80:	91000463 	add	x3, x3, #0x1
  404a84:	d1000442 	sub	x2, x2, #0x1
  404a88:	f240087f 	tst	x3, #0x7
  404a8c:	540000c0 	b.eq	0x404aa4  // b.none
  404a90:	b40004a2 	cbz	x2, 0x404b24
  404a94:	39400060 	ldrb	w0, [x3]
  404a98:	6b01001f 	cmp	w0, w1
  404a9c:	54ffff21 	b.ne	0x404a80  // b.any
  404aa0:	14000002 	b	0x404aa8
  404aa4:	b4000402 	cbz	x2, 0x404b24
  404aa8:	39400060 	ldrb	w0, [x3]
  404aac:	6b01001f 	cmp	w0, w1
  404ab0:	54000280 	b.eq	0x404b00  // b.none
  404ab4:	93407c26 	sxtw	x6, w1
  404ab8:	b200c3e4 	mov	x4, #0x101010101010101     	// #72340172838076673
  404abc:	927df040 	and	x0, x2, #0xfffffffffffffff8
  404ac0:	b207dbe8 	mov	x8, #0xfefefefefefefefe    	// #-72340172838076674
  404ac4:	8b020067 	add	x7, x3, x2
  404ac8:	8b000060 	add	x0, x3, x0
  404acc:	9b047cc6 	mul	x6, x6, x4
  404ad0:	f29fdfe8 	movk	x8, #0xfeff
  404ad4:	14000002 	b	0x404adc
  404ad8:	91002063 	add	x3, x3, #0x8
  404adc:	cb0300e2 	sub	x2, x7, x3
  404ae0:	eb00007f 	cmp	x3, x0
  404ae4:	54000140 	b.eq	0x404b0c  // b.none
  404ae8:	f9400064 	ldr	x4, [x3]
  404aec:	ca0400c4 	eor	x4, x6, x4
  404af0:	8b080085 	add	x5, x4, x8
  404af4:	8a2400a4 	bic	x4, x5, x4
  404af8:	f201c09f 	tst	x4, #0x8080808080808080
  404afc:	54fffee0 	b.eq	0x404ad8  // b.none
  404b00:	aa0303e0 	mov	x0, x3
  404b04:	14000002 	b	0x404b0c
  404b08:	91000400 	add	x0, x0, #0x1
  404b0c:	b40000c2 	cbz	x2, 0x404b24
  404b10:	39400003 	ldrb	w3, [x0]
  404b14:	d1000442 	sub	x2, x2, #0x1
  404b18:	6b01007f 	cmp	w3, w1
  404b1c:	54ffff61 	b.ne	0x404b08  // b.any
  404b20:	14000002 	b	0x404b28
  404b24:	d2800000 	mov	x0, #0x0                   	// #0
  404b28:	d65f03c0 	ret
  404b2c:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  404b30:	2a0103f3 	mov	w19, w1
  404b34:	94000006 	bl	0x404b4c
  404b38:	39400001 	ldrb	w1, [x0]
  404b3c:	6b33003f 	cmp	w1, w19, uxtb
  404b40:	9a9f0000 	csel	x0, x0, xzr, eq	// eq = none
  404b44:	a8c14ffe 	ldp	x30, x19, [sp], #16
  404b48:	d65f03c0 	ret
  404b4c:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  404b50:	72001c21 	ands	w1, w1, #0xff
  404b54:	aa0003f3 	mov	x19, x0
  404b58:	54000120 	b.eq	0x404b7c  // b.none
  404b5c:	f2400a7f 	tst	x19, #0x7
  404b60:	54000180 	b.eq	0x404b90  // b.none
  404b64:	39400260 	ldrb	w0, [x19]
  404b68:	340000e0 	cbz	w0, 0x404b84
  404b6c:	6b01001f 	cmp	w0, w1
  404b70:	540000a0 	b.eq	0x404b84  // b.none
  404b74:	91000673 	add	x19, x19, #0x1
  404b78:	17fffff9 	b	0x404b5c
  404b7c:	9400001b 	bl	0x404be8
  404b80:	8b000273 	add	x19, x19, x0
  404b84:	aa1303e0 	mov	x0, x19
  404b88:	a8c14ffe 	ldp	x30, x19, [sp], #16
  404b8c:	d65f03c0 	ret
  404b90:	93407c26 	sxtw	x6, w1
  404b94:	b200c3e0 	mov	x0, #0x101010101010101     	// #72340172838076673
  404b98:	b207dbe3 	mov	x3, #0xfefefefefefefefe    	// #-72340172838076674
  404b9c:	f29fdfe3 	movk	x3, #0xfeff
  404ba0:	9b007cc6 	mul	x6, x6, x0
  404ba4:	f9400260 	ldr	x0, [x19]
  404ba8:	ca060002 	eor	x2, x0, x6
  404bac:	8b030005 	add	x5, x0, x3
  404bb0:	8b030044 	add	x4, x2, x3
  404bb4:	8a2000a0 	bic	x0, x5, x0
  404bb8:	8a220082 	bic	x2, x4, x2
  404bbc:	aa020000 	orr	x0, x0, x2
  404bc0:	f201c01f 	tst	x0, #0x8080808080808080
  404bc4:	54000081 	b.ne	0x404bd4  // b.any
  404bc8:	91002273 	add	x19, x19, #0x8
  404bcc:	17fffff6 	b	0x404ba4
  404bd0:	91000673 	add	x19, x19, #0x1
  404bd4:	39400260 	ldrb	w0, [x19]
  404bd8:	34fffd60 	cbz	w0, 0x404b84
  404bdc:	6b01001f 	cmp	w0, w1
  404be0:	54ffff81 	b.ne	0x404bd0  // b.any
  404be4:	17ffffe8 	b	0x404b84
  404be8:	aa0003e1 	mov	x1, x0
  404bec:	14000002 	b	0x404bf4
  404bf0:	91000421 	add	x1, x1, #0x1
  404bf4:	f240083f 	tst	x1, #0x7
  404bf8:	540000a0 	b.eq	0x404c0c  // b.none
  404bfc:	39400022 	ldrb	w2, [x1]
  404c00:	35ffff82 	cbnz	w2, 0x404bf0
  404c04:	cb000020 	sub	x0, x1, x0
  404c08:	d65f03c0 	ret
  404c0c:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
  404c10:	f29fdfe4 	movk	x4, #0xfeff
  404c14:	f9400022 	ldr	x2, [x1]
  404c18:	8b040043 	add	x3, x2, x4
  404c1c:	8a220062 	bic	x2, x3, x2
  404c20:	f201c05f 	tst	x2, #0x8080808080808080
  404c24:	54000061 	b.ne	0x404c30  // b.any
  404c28:	91002021 	add	x1, x1, #0x8
  404c2c:	17fffffa 	b	0x404c14
  404c30:	39400022 	ldrb	w2, [x1]
  404c34:	34fffe82 	cbz	w2, 0x404c04
  404c38:	91000421 	add	x1, x1, #0x1
  404c3c:	17fffffd 	b	0x404c30
  404c40:	b4000242 	cbz	x2, 0x404c88
  404c44:	d1000447 	sub	x7, x2, #0x1
  404c48:	d2800002 	mov	x2, #0x0                   	// #0
  404c4c:	38626803 	ldrb	w3, [x0, x2]
  404c50:	38626824 	ldrb	w4, [x1, x2]
  404c54:	7100009f 	cmp	w4, #0x0
  404c58:	7a441060 	ccmp	w3, w4, #0x0, ne	// ne = any
  404c5c:	34000123 	cbz	w3, 0x404c80
  404c60:	1a9f17e6 	cset	w6, eq	// eq = none
  404c64:	eb0200ff 	cmp	x7, x2
  404c68:	1a9f07e5 	cset	w5, ne	// ne = any
  404c6c:	91000442 	add	x2, x2, #0x1
  404c70:	6a0500df 	tst	w6, w5
  404c74:	54fffec1 	b.ne	0x404c4c  // b.any
  404c78:	4b040060 	sub	w0, w3, w4
  404c7c:	d65f03c0 	ret
  404c80:	52800003 	mov	w3, #0x0                   	// #0
  404c84:	17fffffd 	b	0x404c78
  404c88:	52800000 	mov	w0, #0x0                   	// #0
  404c8c:	17fffffc 	b	0x404c7c
  404c90:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  404c94:	aa0003f3 	mov	x19, x0
  404c98:	aa0103e2 	mov	x2, x1
  404c9c:	f9000bf4 	str	x20, [sp, #16]
  404ca0:	aa0103f4 	mov	x20, x1
  404ca4:	52800001 	mov	w1, #0x0                   	// #0
  404ca8:	97ffff73 	bl	0x404a74
  404cac:	cb130013 	sub	x19, x0, x19
  404cb0:	f100001f 	cmp	x0, #0x0
  404cb4:	9a941260 	csel	x0, x19, x20, ne	// ne = any
  404cb8:	f9400bf4 	ldr	x20, [sp, #16]
  404cbc:	a8c24ffe 	ldp	x30, x19, [sp], #32
  404cc0:	d65f03c0 	ret
  404cc4:	d0000043 	adrp	x3, 0x40e000
  404cc8:	912ae062 	add	x2, x3, #0xab8
  404ccc:	aa0003e4 	mov	x4, x0
  404cd0:	320107e1 	mov	w1, #0x80000001            	// #-2147483647
  404cd4:	39400c42 	ldrb	w2, [x2, #3]
  404cd8:	13001c42 	sxtb	w2, w2
  404cdc:	34000402 	cbz	w2, 0x404d5c
  404ce0:	885ffc80 	ldaxr	w0, [x4]
  404ce4:	350000e0 	cbnz	w0, 0x404d00
  404ce8:	8800fc81 	stlxr	w0, w1, [x4]
  404cec:	35ffffa0 	cbnz	w0, 0x404ce0
  404cf0:	36f80362 	tbz	w2, #31, 0x404d5c
  404cf4:	912ae063 	add	x3, x3, #0xab8
  404cf8:	39000c7f 	strb	wzr, [x3, #3]
  404cfc:	14000018 	b	0x404d5c
  404d00:	d5033bbf 	dmb	ish
  404d04:	37f800a2 	tbnz	w2, #31, 0x404d18
  404d08:	52800163 	mov	w3, #0xb                   	// #11
  404d0c:	12b00006 	mov	w6, #0x7fffffff            	// #2147483647
  404d10:	320107e5 	mov	w5, #0x80000001            	// #-2147483647
  404d14:	14000008 	b	0x404d34
  404d18:	912ae063 	add	x3, x3, #0xab8
  404d1c:	39000c7f 	strb	wzr, [x3, #3]
  404d20:	17fffffa 	b	0x404d08
  404d24:	0b060002 	add	w2, w0, w6
  404d28:	2a0003e1 	mov	w1, w0
  404d2c:	14000007 	b	0x404d48
  404d30:	d5033bbf 	dmb	ish
  404d34:	71000463 	subs	w3, w3, #0x1
  404d38:	54000140 	b.eq	0x404d60  // b.none
  404d3c:	37ffff40 	tbnz	w0, #31, 0x404d24
  404d40:	0b050001 	add	w1, w0, w5
  404d44:	2a0003e2 	mov	w2, w0
  404d48:	885ffc80 	ldaxr	w0, [x4]
  404d4c:	6b00005f 	cmp	w2, w0
  404d50:	54ffff01 	b.ne	0x404d30  // b.any
  404d54:	8800fc81 	stlxr	w0, w1, [x4]
  404d58:	35ffff80 	cbnz	w0, 0x404d48
  404d5c:	d65f03c0 	ret
  404d60:	885ffc85 	ldaxr	w5, [x4]
  404d64:	110004a5 	add	w5, w5, #0x1
  404d68:	8800fc85 	stlxr	w0, w5, [x4]
  404d6c:	35ffffa0 	cbnz	w0, 0x404d60
  404d70:	12b00007 	mov	w7, #0x7fffffff            	// #2147483647
  404d74:	110004e6 	add	w6, w7, #0x1
  404d78:	14000011 	b	0x404dbc
  404d7c:	aa0403e0 	mov	x0, x4
  404d80:	93407ca2 	sxtw	x2, w5
  404d84:	d2800c48 	mov	x8, #0x62                  	// #98
  404d88:	d2801001 	mov	x1, #0x80                  	// #128
  404d8c:	d2800003 	mov	x3, #0x0                   	// #0
  404d90:	d4000001 	svc	#0x0
  404d94:	b100981f 	cmn	x0, #0x26
  404d98:	54000060 	b.eq	0x404da4  // b.none
  404d9c:	0b0700a5 	add	w5, w5, w7
  404da0:	14000008 	b	0x404dc0
  404da4:	aa0403e0 	mov	x0, x4
  404da8:	d2800001 	mov	x1, #0x0                   	// #0
  404dac:	d4000001 	svc	#0x0
  404db0:	17fffffb 	b	0x404d9c
  404db4:	d5033bbf 	dmb	ish
  404db8:	2a0003e5 	mov	w5, w0
  404dbc:	37fffe05 	tbnz	w5, #31, 0x404d7c
  404dc0:	0b0600a1 	add	w1, w5, w6
  404dc4:	885ffc80 	ldaxr	w0, [x4]
  404dc8:	6b0000bf 	cmp	w5, w0
  404dcc:	54ffff41 	b.ne	0x404db4  // b.any
  404dd0:	8800fc81 	stlxr	w0, w1, [x4]
  404dd4:	35ffff80 	cbnz	w0, 0x404dc4
  404dd8:	17ffffe1 	b	0x404d5c
  404ddc:	aa0003e3 	mov	x3, x0
  404de0:	b9400000 	ldr	w0, [x0]
  404de4:	37f80040 	tbnz	w0, #31, 0x404dec
  404de8:	d65f03c0 	ret
  404dec:	12b00004 	mov	w4, #0x7fffffff            	// #2147483647
  404df0:	885ffc61 	ldaxr	w1, [x3]
  404df4:	0b040020 	add	w0, w1, w4
  404df8:	8802fc60 	stlxr	w2, w0, [x3]
  404dfc:	35ffffa2 	cbnz	w2, 0x404df0
  404e00:	320107e0 	mov	w0, #0x80000001            	// #-2147483647
  404e04:	6b00003f 	cmp	w1, w0
  404e08:	54ffff00 	b.eq	0x404de8  // b.none
  404e0c:	aa0303e0 	mov	x0, x3
  404e10:	d2800c48 	mov	x8, #0x62                  	// #98
  404e14:	d2801021 	mov	x1, #0x81                  	// #129
  404e18:	d2800022 	mov	x2, #0x1                   	// #1
  404e1c:	d4000001 	svc	#0x0
  404e20:	b100981f 	cmn	x0, #0x26
  404e24:	54fffe21 	b.ne	0x404de8  // b.any
  404e28:	aa0303e0 	mov	x0, x3
  404e2c:	aa0203e1 	mov	x1, x2
  404e30:	d4000001 	svc	#0x0
  404e34:	17ffffed 	b	0x404de8
  404e38:	aa0003e8 	mov	x8, x0
  404e3c:	aa0103e0 	mov	x0, x1
  404e40:	aa0203e1 	mov	x1, x2
  404e44:	aa0303e2 	mov	x2, x3
  404e48:	aa0403e3 	mov	x3, x4
  404e4c:	aa0503e4 	mov	x4, x5
  404e50:	aa0603e5 	mov	x5, x6
  404e54:	d4000001 	svc	#0x0
  404e58:	d65f03c0 	ret
  404e5c:	17fffff7 	b	0x404e38
  404e60:	f0000040 	adrp	x0, 0x40f000
  404e64:	910d2000 	add	x0, x0, #0x348
  404e68:	1400007d 	b	0x40505c
  404e6c:	f0000040 	adrp	x0, 0x40f000
  404e70:	910d2000 	add	x0, x0, #0x348
  404e74:	14000004 	b	0x404e84
  404e78:	f0000040 	adrp	x0, 0x40f000
  404e7c:	910d2000 	add	x0, x0, #0x348
  404e80:	14000052 	b	0x404fc8
  404e84:	d2800001 	mov	x1, #0x0                   	// #0
  404e88:	14000001 	b	0x404e8c
  404e8c:	a9bd4ffe 	stp	x30, x19, [sp, #-48]!
  404e90:	aa0003f3 	mov	x19, x0
  404e94:	f90013f6 	str	x22, [sp, #32]
  404e98:	aa0103f6 	mov	x22, x1
  404e9c:	94000035 	bl	0x404f70
  404ea0:	7100401f 	cmp	w0, #0x10
  404ea4:	54000601 	b.ne	0x404f64  // b.any
  404ea8:	52800ca0 	mov	w0, #0x65                  	// #101
  404eac:	a90157f4 	stp	x20, x21, [sp, #16]
  404eb0:	14000002 	b	0x404eb8
  404eb4:	d5033bbf 	dmb	ish
  404eb8:	71000400 	subs	w0, w0, #0x1
  404ebc:	540000a0 	b.eq	0x404ed0  // b.none
  404ec0:	b9400261 	ldr	w1, [x19]
  404ec4:	34000061 	cbz	w1, 0x404ed0
  404ec8:	b9400661 	ldr	w1, [x19, #4]
  404ecc:	34ffff41 	cbz	w1, 0x404eb4
  404ed0:	12b00015 	mov	w21, #0x7fffffff            	// #2147483647
  404ed4:	1400000e 	b	0x404f0c
  404ed8:	d5033bbf 	dmb	ish
  404edc:	b9400a64 	ldr	w4, [x19, #8]
  404ee0:	aa1603e3 	mov	x3, x22
  404ee4:	aa1303e0 	mov	x0, x19
  404ee8:	52800002 	mov	w2, #0x0                   	// #0
  404eec:	52190084 	eor	w4, w4, #0x80
  404ef0:	94000378 	bl	0x405cd0
  404ef4:	885ffe82 	ldaxr	w2, [x20]
  404ef8:	51000442 	sub	w2, w2, #0x1
  404efc:	8801fe82 	stlxr	w1, w2, [x20]
  404f00:	35ffffa1 	cbnz	w1, 0x404ef4
  404f04:	721d781f 	tst	w0, #0xfffffffb
  404f08:	540002c1 	b.ne	0x404f60  // b.any
  404f0c:	aa1303e0 	mov	x0, x19
  404f10:	94000018 	bl	0x404f70
  404f14:	7100401f 	cmp	w0, #0x10
  404f18:	54000241 	b.ne	0x404f60  // b.any
  404f1c:	b9400260 	ldr	w0, [x19]
  404f20:	34ffff60 	cbz	w0, 0x404f0c
  404f24:	12007801 	and	w1, w0, #0x7fffffff
  404f28:	6b15003f 	cmp	w1, w21
  404f2c:	54ffff01 	b.ne	0x404f0c  // b.any
  404f30:	32010001 	orr	w1, w0, #0x80000000
  404f34:	91001274 	add	x20, x19, #0x4
  404f38:	885ffe82 	ldaxr	w2, [x20]
  404f3c:	11000442 	add	w2, w2, #0x1
  404f40:	8803fe82 	stlxr	w3, w2, [x20]
  404f44:	35ffffa3 	cbnz	w3, 0x404f38
  404f48:	885ffe62 	ldaxr	w2, [x19]
  404f4c:	6b02001f 	cmp	w0, w2
  404f50:	54fffc41 	b.ne	0x404ed8  // b.any
  404f54:	8802fe61 	stlxr	w2, w1, [x19]
  404f58:	35ffff82 	cbnz	w2, 0x404f48
  404f5c:	17ffffe0 	b	0x404edc
  404f60:	a94157f4 	ldp	x20, x21, [sp, #16]
  404f64:	f94013f6 	ldr	x22, [sp, #32]
  404f68:	a8c34ffe 	ldp	x30, x19, [sp], #48
  404f6c:	d65f03c0 	ret
  404f70:	aa0003e1 	mov	x1, x0
  404f74:	12b00004 	mov	w4, #0x7fffffff            	// #2147483647
  404f78:	321f77e5 	mov	w5, #0x7ffffffe            	// #2147483646
  404f7c:	14000002 	b	0x404f84
  404f80:	d5033bbf 	dmb	ish
  404f84:	b9400023 	ldr	w3, [x1]
  404f88:	12007860 	and	w0, w3, #0x7fffffff
  404f8c:	6b04001f 	cmp	w0, w4
  404f90:	54000140 	b.eq	0x404fb8  // b.none
  404f94:	6b05001f 	cmp	w0, w5
  404f98:	54000140 	b.eq	0x404fc0  // b.none
  404f9c:	11000462 	add	w2, w3, #0x1
  404fa0:	885ffc20 	ldaxr	w0, [x1]
  404fa4:	6b00007f 	cmp	w3, w0
  404fa8:	54fffec1 	b.ne	0x404f80  // b.any
  404fac:	8800fc22 	stlxr	w0, w2, [x1]
  404fb0:	35ffff80 	cbnz	w0, 0x404fa0
  404fb4:	d65f03c0 	ret
  404fb8:	52800200 	mov	w0, #0x10                  	// #16
  404fbc:	17fffffe 	b	0x404fb4
  404fc0:	52800160 	mov	w0, #0xb                   	// #11
  404fc4:	17fffffc 	b	0x404fb4
  404fc8:	b9400807 	ldr	w7, [x0, #8]
  404fcc:	aa0003e3 	mov	x3, x0
  404fd0:	12b00005 	mov	w5, #0x7fffffff            	// #2147483647
  404fd4:	14000002 	b	0x404fdc
  404fd8:	d5033bbf 	dmb	ish
  404fdc:	b9400064 	ldr	w4, [x3]
  404fe0:	b9400466 	ldr	w6, [x3, #4]
  404fe4:	12007882 	and	w2, w4, #0x7fffffff
  404fe8:	51000481 	sub	w1, w4, #0x1
  404fec:	6b05005f 	cmp	w2, w5
  404ff0:	7a411844 	ccmp	w2, #0x1, #0x4, ne	// ne = any
  404ff4:	1a9f1021 	csel	w1, w1, wzr, ne	// ne = any
  404ff8:	885ffc60 	ldaxr	w0, [x3]
  404ffc:	6b00009f 	cmp	w4, w0
  405000:	54fffec1 	b.ne	0x404fd8  // b.any
  405004:	8800fc61 	stlxr	w0, w1, [x3]
  405008:	35ffff80 	cbnz	w0, 0x404ff8
  40500c:	35000081 	cbnz	w1, 0x40501c
  405010:	710000df 	cmp	w6, #0x0
  405014:	7a400881 	ccmp	w4, #0x0, #0x1, eq	// eq = none
  405018:	5400006b 	b.lt	0x405024  // b.tstop
  40501c:	52800000 	mov	w0, #0x0                   	// #0
  405020:	d65f03c0 	ret
  405024:	710200ff 	cmp	w7, #0x80
  405028:	92407842 	and	x2, x2, #0x7fffffff
  40502c:	1a9f07e1 	cset	w1, ne	// ne = any
  405030:	aa0303e0 	mov	x0, x3
  405034:	d2800c48 	mov	x8, #0x62                  	// #98
  405038:	d3790021 	ubfiz	x1, x1, #7, #1
  40503c:	b2400021 	orr	x1, x1, #0x1
  405040:	d4000001 	svc	#0x0
  405044:	b100981f 	cmn	x0, #0x26
  405048:	54fffea1 	b.ne	0x40501c  // b.any
  40504c:	aa0303e0 	mov	x0, x3
  405050:	d2800021 	mov	x1, #0x1                   	// #1
  405054:	d4000001 	svc	#0x0
  405058:	17fffff1 	b	0x40501c
  40505c:	d2800001 	mov	x1, #0x0                   	// #0
  405060:	14000339 	b	0x405d44
  405064:	d2800628 	mov	x8, #0x31                  	// #49
  405068:	f81f0ffe 	str	x30, [sp, #-16]!
  40506c:	d4000001 	svc	#0x0
  405070:	97fff276 	bl	0x401a48
  405074:	f84107fe 	ldr	x30, [sp], #16
  405078:	d65f03c0 	ret
  40507c:	d65f03c0 	ret
  405080:	f81f0ffe 	str	x30, [sp, #-16]!
  405084:	97fffffe 	bl	0x40507c
  405088:	93407c01 	sxtw	x1, w0
  40508c:	d2800006 	mov	x6, #0x0                   	// #0
  405090:	d2800005 	mov	x5, #0x0                   	// #0
  405094:	d2800004 	mov	x4, #0x0                   	// #0
  405098:	d2800003 	mov	x3, #0x0                   	// #0
  40509c:	d2800002 	mov	x2, #0x0                   	// #0
  4050a0:	d2800720 	mov	x0, #0x39                  	// #57
  4050a4:	97ffff6e 	bl	0x404e5c
  4050a8:	3100101f 	cmn	w0, #0x4
  4050ac:	1a9f1000 	csel	w0, w0, wzr, ne	// ne = any
  4050b0:	93407c00 	sxtw	x0, w0
  4050b4:	97fff265 	bl	0x401a48
  4050b8:	f84107fe 	ldr	x30, [sp], #16
  4050bc:	d65f03c0 	ret
  4050c0:	d28002e8 	mov	x8, #0x17                  	// #23
  4050c4:	93407c00 	sxtw	x0, w0
  4050c8:	f81f0ffe 	str	x30, [sp, #-16]!
  4050cc:	d4000001 	svc	#0x0
  4050d0:	97fff25e 	bl	0x401a48
  4050d4:	f84107fe 	ldr	x30, [sp], #16
  4050d8:	d65f03c0 	ret
  4050dc:	d2800768 	mov	x8, #0x3b                  	// #59
  4050e0:	d2800001 	mov	x1, #0x0                   	// #0
  4050e4:	f81f0ffe 	str	x30, [sp, #-16]!
  4050e8:	d4000001 	svc	#0x0
  4050ec:	97fff257 	bl	0x401a48
  4050f0:	f84107fe 	ldr	x30, [sp], #16
  4050f4:	d65f03c0 	ret
  4050f8:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  4050fc:	aa0003f3 	mov	x19, x0
  405100:	91032000 	add	x0, x0, #0xc8
  405104:	f9000273 	str	x19, [x19]
  405108:	9400030c 	bl	0x405d38
  40510c:	7100001f 	cmp	w0, #0x0
  405110:	5400032b 	b.lt	0x405174  // b.tstop
  405114:	54000081 	b.ne	0x405124  // b.any
  405118:	b0000040 	adrp	x0, 0x40e000
  40511c:	52800021 	mov	w1, #0x1                   	// #1
  405120:	392ae001 	strb	w1, [x0, #2744]
  405124:	52800041 	mov	w1, #0x2                   	// #2
  405128:	d0000040 	adrp	x0, 0x40f000
  40512c:	d2800c08 	mov	x8, #0x60                  	// #96
  405130:	91142000 	add	x0, x0, #0x508
  405134:	b9002a61 	str	w1, [x19, #40]
  405138:	d4000001 	svc	#0x0
  40513c:	b0000044 	adrp	x4, 0x40e000
  405140:	aa0003e3 	mov	x3, x0
  405144:	9101e262 	add	x2, x19, #0x78
  405148:	b0000041 	adrp	x1, 0x40e000
  40514c:	f9454c84 	ldr	x4, [x4, #2712]
  405150:	912bc021 	add	x1, x1, #0xaf0
  405154:	52800000 	mov	w0, #0x0                   	// #0
  405158:	a900ce73 	stp	x19, x19, [x19, #8]
  40515c:	f9000e64 	str	x4, [x19, #24]
  405160:	b9002263 	str	w3, [x19, #32]
  405164:	f9003e62 	str	x2, [x19, #120]
  405168:	f9004e61 	str	x1, [x19, #152]
  40516c:	a8c14ffe 	ldp	x30, x19, [sp], #16
  405170:	d65f03c0 	ret
  405174:	12800000 	mov	w0, #0xffffffff            	// #-1
  405178:	17fffffd 	b	0x40516c
  40517c:	a9bb4ffe 	stp	x30, x19, [sp, #-80]!
  405180:	928018e2 	mov	x2, #0xffffffffffffff38    	// #-200
  405184:	cb000042 	sub	x2, x2, x0
  405188:	a90367f8 	stp	x24, x25, [sp, #48]
  40518c:	b0000059 	adrp	x25, 0x40e000
  405190:	912ae321 	add	x1, x25, #0xab8
  405194:	a90157f4 	stp	x20, x21, [sp, #16]
  405198:	a9025ff6 	stp	x22, x23, [sp, #32]
  40519c:	aa0003f7 	mov	x23, x0
  4051a0:	f90023fa 	str	x26, [sp, #64]
  4051a4:	a9410033 	ldp	x19, x0, [x1, #16]
  4051a8:	a9426036 	ldp	x22, x24, [x1, #32]
  4051ac:	d1002000 	sub	x0, x0, #0x8
  4051b0:	d10006d6 	sub	x22, x22, #0x1
  4051b4:	cb180c18 	sub	x24, x0, x24, lsl #3
  4051b8:	8a0202d6 	and	x22, x22, x2
  4051bc:	8b1802fa 	add	x26, x23, x24
  4051c0:	8b1602f6 	add	x22, x23, x22
  4051c4:	91002354 	add	x20, x26, #0x8
  4051c8:	910322d5 	add	x21, x22, #0xc8
  4051cc:	14000009 	b	0x4051f0
  4051d0:	f9401661 	ldr	x1, [x19, #40]
  4051d4:	8b0102a1 	add	x1, x21, x1
  4051d8:	f8008681 	str	x1, [x20], #8
  4051dc:	a9408a61 	ldp	x1, x2, [x19, #8]
  4051e0:	f9401660 	ldr	x0, [x19, #40]
  4051e4:	8b0002a0 	add	x0, x21, x0
  4051e8:	97fffd7e 	bl	0x4047e0
  4051ec:	f9400273 	ldr	x19, [x19]
  4051f0:	b5ffff13 	cbnz	x19, 0x4051d0
  4051f4:	912ae339 	add	x25, x25, #0xab8
  4051f8:	aa1603e0 	mov	x0, x22
  4051fc:	f9401721 	ldr	x1, [x25, #40]
  405200:	f8386ae1 	str	x1, [x23, x24]
  405204:	f90062da 	str	x26, [x22, #192]
  405208:	a94157f4 	ldp	x20, x21, [sp, #16]
  40520c:	a9425ff6 	ldp	x22, x23, [sp, #32]
  405210:	a94367f8 	ldp	x24, x25, [sp, #48]
  405214:	f94023fa 	ldr	x26, [sp, #64]
  405218:	a8c54ffe 	ldp	x30, x19, [sp], #80
  40521c:	d65f03c0 	ret
  405220:	f81f0ffe 	str	x30, [sp, #-16]!
  405224:	529caa2a 	mov	w10, #0xe551                	// #58705
  405228:	f0000025 	adrp	x5, 0x40c000
  40522c:	d2800003 	mov	x3, #0x0                   	// #0
  405230:	f9400c09 	ldr	x9, [x0, #24]
  405234:	910bb0a5 	add	x5, x5, #0x2ec
  405238:	f9401404 	ldr	x4, [x0, #40]
  40523c:	aa0903e1 	mov	x1, x9
  405240:	d0000027 	adrp	x7, 0x40b000
  405244:	f9476ce7 	ldr	x7, [x7, #3800]
  405248:	d2800006 	mov	x6, #0x0                   	// #0
  40524c:	72ac8e8a 	movk	w10, #0x6474, lsl #16
  405250:	d2a0100b 	mov	x11, #0x800000              	// #8388608
  405254:	14000006 	b	0x40526c
  405258:	f9400823 	ldr	x3, [x1, #16]
  40525c:	cb030123 	sub	x3, x9, x3
  405260:	f9401002 	ldr	x2, [x0, #32]
  405264:	d1000484 	sub	x4, x4, #0x1
  405268:	8b020021 	add	x1, x1, x2
  40526c:	b4000304 	cbz	x4, 0x4052cc
  405270:	b9400022 	ldr	w2, [x1]
  405274:	7100185f 	cmp	w2, #0x6
  405278:	54ffff00 	b.eq	0x405258  // b.none
  40527c:	7100085f 	cmp	w2, #0x2
  405280:	540000a1 	b.ne	0x405294  // b.any
  405284:	b4fffee7 	cbz	x7, 0x405260
  405288:	f9400823 	ldr	x3, [x1, #16]
  40528c:	cb0300e3 	sub	x3, x7, x3
  405290:	17fffff4 	b	0x405260
  405294:	71001c5f 	cmp	w2, #0x7
  405298:	54000061 	b.ne	0x4052a4  // b.any
  40529c:	aa0103e6 	mov	x6, x1
  4052a0:	17fffff0 	b	0x405260
  4052a4:	6b0a005f 	cmp	w2, w10
  4052a8:	54fffdc1 	b.ne	0x405260  // b.any
  4052ac:	f9401422 	ldr	x2, [x1, #40]
  4052b0:	b94000a8 	ldr	w8, [x5]
  4052b4:	eb08005f 	cmp	x2, x8
  4052b8:	54fffd49 	b.ls	0x405260  // b.plast
  4052bc:	f160005f 	cmp	x2, #0x800, lsl #12
  4052c0:	9a8b9042 	csel	x2, x2, x11, ls	// ls = plast
  4052c4:	b90000a2 	str	w2, [x5]
  4052c8:	17ffffe6 	b	0x405260
  4052cc:	b4000666 	cbz	x6, 0x405398
  4052d0:	f94008c5 	ldr	x5, [x6, #16]
  4052d4:	d0000042 	adrp	x2, 0x40f000
  4052d8:	b0000044 	adrp	x4, 0x40e000
  4052dc:	910e2040 	add	x0, x2, #0x388
  4052e0:	912ae081 	add	x1, x4, #0xab8
  4052e4:	8b050063 	add	x3, x3, x5
  4052e8:	f94010c8 	ldr	x8, [x6, #32]
  4052ec:	d2800027 	mov	x7, #0x1                   	// #1
  4052f0:	a94294c6 	ldp	x6, x5, [x6, #40]
  4052f4:	a900a003 	stp	x3, x8, [x0, #8]
  4052f8:	f9000820 	str	x0, [x1, #16]
  4052fc:	f9001005 	str	x5, [x0, #32]
  405300:	f9001427 	str	x7, [x1, #40]
  405304:	910e2042 	add	x2, x2, #0x388
  405308:	8b0300c1 	add	x1, x6, x3
  40530c:	d10004a0 	sub	x0, x5, #0x1
  405310:	d1004063 	sub	x3, x3, #0x10
  405314:	cb0103e1 	neg	x1, x1
  405318:	8a000021 	and	x1, x1, x0
  40531c:	8a000060 	and	x0, x3, x0
  405320:	8b060021 	add	x1, x1, x6
  405324:	91004000 	add	x0, x0, #0x10
  405328:	f9000c41 	str	x1, [x2, #24]
  40532c:	91037ca3 	add	x3, x5, #0xdf
  405330:	f9001440 	str	x0, [x2, #40]
  405334:	f1001cbf 	cmp	x5, #0x7
  405338:	540000a8 	b.hi	0x40534c  // b.pmore
  40533c:	d2800106 	mov	x6, #0x8                   	// #8
  405340:	aa0603e5 	mov	x5, x6
  405344:	d2801ce3 	mov	x3, #0xe7                  	// #231
  405348:	f9001046 	str	x6, [x2, #32]
  40534c:	912ae082 	add	x2, x4, #0xab8
  405350:	8b000021 	add	x1, x1, x0
  405354:	8b030021 	add	x1, x1, x3
  405358:	927df021 	and	x1, x1, #0xfffffffffffffff8
  40535c:	a9019441 	stp	x1, x5, [x2, #24]
  405360:	f105403f 	cmp	x1, #0x150
  405364:	54000269 	b.ls	0x4053b0  // b.plast
  405368:	d2801bc8 	mov	x8, #0xde                  	// #222
  40536c:	d2800000 	mov	x0, #0x0                   	// #0
  405370:	d2800062 	mov	x2, #0x3                   	// #3
  405374:	d2800443 	mov	x3, #0x22                  	// #34
  405378:	92800004 	mov	x4, #0xffffffffffffffff    	// #-1
  40537c:	d2800005 	mov	x5, #0x0                   	// #0
  405380:	d4000001 	svc	#0x0
  405384:	97ffff7e 	bl	0x40517c
  405388:	97ffff5c 	bl	0x4050f8
  40538c:	37f80180 	tbnz	w0, #31, 0x4053bc
  405390:	f84107fe 	ldr	x30, [sp], #16
  405394:	d65f03c0 	ret
  405398:	d0000042 	adrp	x2, 0x40f000
  40539c:	910e2040 	add	x0, x2, #0x388
  4053a0:	b0000044 	adrp	x4, 0x40e000
  4053a4:	f9400403 	ldr	x3, [x0, #8]
  4053a8:	a9419406 	ldp	x6, x5, [x0, #24]
  4053ac:	17ffffd6 	b	0x405304
  4053b0:	d0000040 	adrp	x0, 0x40f000
  4053b4:	910ee000 	add	x0, x0, #0x3b8
  4053b8:	17fffff3 	b	0x405384
  4053bc:	d2800000 	mov	x0, #0x0                   	// #0
  4053c0:	3900001f 	strb	wzr, [x0]
  4053c4:	d4207d00 	brk	#0x3e8
  4053c8:	d53bd040 	mrs	x0, tpidr_el0
  4053cc:	d1029000 	sub	x0, x0, #0xa4
  4053d0:	d65f03c0 	ret
  4053d4:	71020c1f 	cmp	w0, #0x83
  4053d8:	54000128 	b.hi	0x4053fc  // b.pmore
  4053dc:	90000023 	adrp	x3, 0x409000
  4053e0:	91128063 	add	x3, x3, #0x4a0
  4053e4:	90000022 	adrp	x2, 0x409000
  4053e8:	9116c042 	add	x2, x2, #0x5b0
  4053ec:	7860d860 	ldrh	w0, [x3, w0, sxtw #1]
  4053f0:	8b020000 	add	x0, x0, x2
  4053f4:	f9401421 	ldr	x1, [x1, #40]
  4053f8:	14000010 	b	0x405438
  4053fc:	90000020 	adrp	x0, 0x409000
  405400:	9116c000 	add	x0, x0, #0x5b0
  405404:	17fffffc 	b	0x4053f4
  405408:	d53bd041 	mrs	x1, tpidr_el0
  40540c:	f85d0021 	ldur	x1, [x1, #-48]
  405410:	17fffff1 	b	0x4053d4
  405414:	93407c01 	sxtw	x1, w0
  405418:	d2800bc8 	mov	x8, #0x5e                  	// #94
  40541c:	aa0103e0 	mov	x0, x1
  405420:	d4000001 	svc	#0x0
  405424:	aa0103e0 	mov	x0, x1
  405428:	d2800ba8 	mov	x8, #0x5d                  	// #93
  40542c:	d4000001 	svc	#0x0
  405430:	17fffffd 	b	0x405424
  405434:	d65f03c0 	ret
  405438:	17ffffff 	b	0x405434
  40543c:	d53bd041 	mrs	x1, tpidr_el0
  405440:	f85d0021 	ldur	x1, [x1, #-48]
  405444:	f9401421 	ldr	x1, [x1, #40]
  405448:	17fffffb 	b	0x405434
  40544c:	9eae0003 	fmov	x3, v0.d[1]
  405450:	9e660002 	fmov	x2, d0
  405454:	9240bc64 	and	x4, x3, #0xffffffffffff
  405458:	d370f861 	ubfx	x1, x3, #48, #15
  40545c:	340000c1 	cbz	w1, 0x405474
  405460:	528fffe5 	mov	w5, #0x7fff                	// #32767
  405464:	52800080 	mov	w0, #0x4                   	// #4
  405468:	6b05003f 	cmp	w1, w5
  40546c:	540000e0 	b.eq	0x405488  // b.none
  405470:	d65f03c0 	ret
  405474:	aa020084 	orr	x4, x4, x2
  405478:	f100009f 	cmp	x4, #0x0
  40547c:	1a9f07e0 	cset	w0, ne	// ne = any
  405480:	11000800 	add	w0, w0, #0x2
  405484:	17fffffb 	b	0x405470
  405488:	aa020084 	orr	x4, x4, x2
  40548c:	f100009f 	cmp	x4, #0x0
  405490:	1a9f17e0 	cset	w0, eq	// eq = none
  405494:	17fffff7 	b	0x405470
  405498:	d10043ff 	sub	sp, sp, #0x10
  40549c:	3d8003e0 	str	q0, [sp]
  4054a0:	f94007e0 	ldr	x0, [sp, #8]
  4054a4:	910043ff 	add	sp, sp, #0x10
  4054a8:	d370fc00 	lsr	x0, x0, #48
  4054ac:	530f7c00 	lsr	w0, w0, #15
  4054b0:	d65f03c0 	ret
  4054b4:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  4054b8:	aa0003f3 	mov	x19, x0
  4054bc:	a90157f4 	stp	x20, x21, [sp, #16]
  4054c0:	9eae0015 	fmov	x21, v0.d[1]
  4054c4:	9e660014 	fmov	x20, d0
  4054c8:	d370faa1 	ubfx	x1, x21, #48, #15
  4054cc:	34000221 	cbz	w1, 0x405510
  4054d0:	528fffe4 	mov	w4, #0x7fff                	// #32767
  4054d4:	6b04003f 	cmp	w1, w4
  4054d8:	54000240 	b.eq	0x405520  // b.none
  4054dc:	d370fea0 	lsr	x0, x21, #48
  4054e0:	aa1503e3 	mov	x3, x21
  4054e4:	12114000 	and	w0, w0, #0xffff8000
  4054e8:	9e670280 	fmov	d0, x20
  4054ec:	321f3000 	orr	w0, w0, #0x3ffe
  4054f0:	1287ffa4 	mov	w4, #0xffffc002            	// #-16382
  4054f4:	0b040021 	add	w1, w1, w4
  4054f8:	b9000261 	str	w1, [x19]
  4054fc:	b3503c03 	bfi	x3, x0, #48, #16
  405500:	9eaf0060 	fmov	v0.d[1], x3
  405504:	a94157f4 	ldp	x20, x21, [sp, #16]
  405508:	a8c24ffe 	ldp	x30, x19, [sp], #32
  40550c:	d65f03c0 	ret
  405510:	6f00e401 	movi	v1.2d, #0x0
  405514:	94000783 	bl	0x407320
  405518:	350000a0 	cbnz	w0, 0x40552c
  40551c:	b900027f 	str	wzr, [x19]
  405520:	9e670280 	fmov	d0, x20
  405524:	9eaf02a0 	fmov	v0.d[1], x21
  405528:	17fffff7 	b	0x405504
  40552c:	90000020 	adrp	x0, 0x409000
  405530:	91124000 	add	x0, x0, #0x490
  405534:	9e670280 	fmov	d0, x20
  405538:	3dc00001 	ldr	q1, [x0]
  40553c:	9eaf02a0 	fmov	v0.d[1], x21
  405540:	940007bc 	bl	0x407430
  405544:	aa1303e0 	mov	x0, x19
  405548:	97ffffdb 	bl	0x4054b4
  40554c:	b9400260 	ldr	w0, [x19]
  405550:	5101e000 	sub	w0, w0, #0x78
  405554:	b9000260 	str	w0, [x19]
  405558:	17ffffeb 	b	0x405504
  40555c:	710ffc1f 	cmp	w0, #0x3ff
  405560:	540001ad 	b.le	0x405594
  405564:	d2effc01 	mov	x1, #0x7fe0000000000000    	// #9214364837600034816
  405568:	9e670021 	fmov	d1, x1
  40556c:	1e610800 	fmul	d0, d0, d1
  405570:	711ff81f 	cmp	w0, #0x7fe
  405574:	5400016d 	b.le	0x4055a0
  405578:	511ff800 	sub	w0, w0, #0x7fe
  40557c:	52807fe1 	mov	w1, #0x3ff                 	// #1023
  405580:	6b01001f 	cmp	w0, w1
  405584:	1e610800 	fmul	d0, d0, d1
  405588:	1a81d000 	csel	w0, w0, w1, le
  40558c:	0b010000 	add	w0, w0, w1
  405590:	14000004 	b	0x4055a0
  405594:	310ff81f 	cmn	w0, #0x3fe
  405598:	540000cb 	b.lt	0x4055b0  // b.tstop
  40559c:	110ffc00 	add	w0, w0, #0x3ff
  4055a0:	9e670001 	fmov	d1, x0
  4055a4:	5f745421 	shl	d1, d1, #52
  4055a8:	1e610800 	fmul	d0, d0, d1
  4055ac:	d65f03c0 	ret
  4055b0:	d2e06c01 	mov	x1, #0x360000000000000     	// #243194379878006784
  4055b4:	9e670021 	fmov	d1, x1
  4055b8:	110f2401 	add	w1, w0, #0x3c9
  4055bc:	1e610800 	fmul	d0, d0, d1
  4055c0:	310ff83f 	cmn	w1, #0x3fe
  4055c4:	5400006b 	b.lt	0x4055d0  // b.tstop
  4055c8:	111f2000 	add	w0, w0, #0x7c8
  4055cc:	17fffff5 	b	0x4055a0
  4055d0:	111e4800 	add	w0, w0, #0x792
  4055d4:	1e610800 	fmul	d0, d0, d1
  4055d8:	310ffc00 	adds	w0, w0, #0x3ff
  4055dc:	1a9fc400 	csinc	w0, w0, wzr, gt
  4055e0:	17fffff0 	b	0x4055a0
  4055e4:	b40000c0 	cbz	x0, 0x4055fc
  4055e8:	f81f0ffe 	str	x30, [sp, #-16]!
  4055ec:	d2800002 	mov	x2, #0x0                   	// #0
  4055f0:	94000301 	bl	0x4061f4
  4055f4:	f84107fe 	ldr	x30, [sp], #16
  4055f8:	d65f03c0 	ret
  4055fc:	52800000 	mov	w0, #0x0                   	// #0
  405600:	d65f03c0 	ret
  405604:	d65f03c0 	ret
  405608:	34000080 	cbz	w0, 0x405618
  40560c:	d0000040 	adrp	x0, 0x40f000
  405610:	91144000 	add	x0, x0, #0x510
  405614:	17fffdf2 	b	0x404ddc
  405618:	d0000043 	adrp	x3, 0x40f000
  40561c:	d2800c08 	mov	x8, #0x60                  	// #96
  405620:	91142060 	add	x0, x3, #0x508
  405624:	f81f0ffe 	str	x30, [sp, #-16]!
  405628:	d53bd041 	mrs	x1, tpidr_el0
  40562c:	d1032021 	sub	x1, x1, #0xc8
  405630:	d4000001 	svc	#0x0
  405634:	b0000042 	adrp	x2, 0x40e000
  405638:	912ae042 	add	x2, x2, #0xab8
  40563c:	f900443f 	str	xzr, [x1, #136]
  405640:	b905087f 	str	wzr, [x3, #1288]
  405644:	b900045f 	str	wzr, [x2, #4]
  405648:	39400c43 	ldrb	w3, [x2, #3]
  40564c:	a9008421 	stp	x1, x1, [x1, #8]
  405650:	b9002020 	str	w0, [x1, #32]
  405654:	f900403f 	str	xzr, [x1, #128]
  405658:	72001c7f 	tst	w3, #0xff
  40565c:	54000120 	b.eq	0x405680  // b.none
  405660:	12800001 	mov	w1, #0xffffffff            	// #-1
  405664:	d0000040 	adrp	x0, 0x40f000
  405668:	91144000 	add	x0, x0, #0x510
  40566c:	39000c41 	strb	w1, [x2, #3]
  405670:	97fffddb 	bl	0x404ddc
  405674:	f84107fe 	ldr	x30, [sp], #16
  405678:	52800020 	mov	w0, #0x1                   	// #1
  40567c:	17fff109 	b	0x401aa0
  405680:	d0000040 	adrp	x0, 0x40f000
  405684:	91144000 	add	x0, x0, #0x510
  405688:	97fffdd5 	bl	0x404ddc
  40568c:	17fffffa 	b	0x405674
  405690:	a9b64ffe 	stp	x30, x19, [sp, #-160]!
  405694:	f9000bf4 	str	x20, [sp, #16]
  405698:	910083f4 	add	x20, sp, #0x20
  40569c:	aa1403e0 	mov	x0, x20
  4056a0:	97fff17c 	bl	0x401c90
  4056a4:	d0000040 	adrp	x0, 0x40f000
  4056a8:	91144000 	add	x0, x0, #0x510
  4056ac:	97fffd86 	bl	0x404cc4
  4056b0:	d2801b88 	mov	x8, #0xdc                  	// #220
  4056b4:	d2800220 	mov	x0, #0x11                  	// #17
  4056b8:	d2800001 	mov	x1, #0x0                   	// #0
  4056bc:	d4000001 	svc	#0x0
  4056c0:	aa0003f3 	mov	x19, x0
  4056c4:	97ffffd1 	bl	0x405608
  4056c8:	aa1403e0 	mov	x0, x20
  4056cc:	97fff181 	bl	0x401cd0
  4056d0:	93407e60 	sxtw	x0, w19
  4056d4:	97fff0dd 	bl	0x401a48
  4056d8:	f9400bf4 	ldr	x20, [sp, #16]
  4056dc:	a8ca4ffe 	ldp	x30, x19, [sp], #160
  4056e0:	d65f03c0 	ret
  4056e4:	d53bd041 	mrs	x1, tpidr_el0
  4056e8:	b8558025 	ldur	w5, [x1, #-168]
  4056ec:	b9408c01 	ldr	w1, [x0, #140]
  4056f0:	12017821 	and	w1, w1, #0xbfffffff
  4056f4:	6b05003f 	cmp	w1, w5
  4056f8:	540004e0 	b.eq	0x405794  // b.none
  4056fc:	91023004 	add	x4, x0, #0x8c
  405700:	885ffc80 	ldaxr	w0, [x4]
  405704:	35000080 	cbnz	w0, 0x405714
  405708:	8800fc85 	stlxr	w0, w5, [x4]
  40570c:	35ffffa0 	cbnz	w0, 0x405700
  405710:	1400001f 	b	0x40578c
  405714:	d5033bbf 	dmb	ish
  405718:	320200a5 	orr	w5, w5, #0x40000000
  40571c:	14000018 	b	0x40577c
  405720:	885ffc81 	ldaxr	w1, [x4]
  405724:	6b00003f 	cmp	w1, w0
  405728:	54000081 	b.ne	0x405738  // b.any
  40572c:	8801fc82 	stlxr	w1, w2, [x4]
  405730:	35ffff81 	cbnz	w1, 0x405720
  405734:	1400000a 	b	0x40575c
  405738:	d5033bbf 	dmb	ish
  40573c:	14000010 	b	0x40577c
  405740:	aa0403e0 	mov	x0, x4
  405744:	d2800001 	mov	x1, #0x0                   	// #0
  405748:	d4000001 	svc	#0x0
  40574c:	1400000c 	b	0x40577c
  405750:	d5033bbf 	dmb	ish
  405754:	32020002 	orr	w2, w0, #0x40000000
  405758:	36f7fe40 	tbz	w0, #30, 0x405720
  40575c:	93407c42 	sxtw	x2, w2
  405760:	aa0403e0 	mov	x0, x4
  405764:	d2800c48 	mov	x8, #0x62                  	// #98
  405768:	d2801001 	mov	x1, #0x80                  	// #128
  40576c:	d2800003 	mov	x3, #0x0                   	// #0
  405770:	d4000001 	svc	#0x0
  405774:	b100981f 	cmn	x0, #0x26
  405778:	54fffe40 	b.eq	0x405740  // b.none
  40577c:	885ffc80 	ldaxr	w0, [x4]
  405780:	35fffe80 	cbnz	w0, 0x405750
  405784:	8800fc85 	stlxr	w0, w5, [x4]
  405788:	35ffffa0 	cbnz	w0, 0x40577c
  40578c:	52800020 	mov	w0, #0x1                   	// #1
  405790:	d65f03c0 	ret
  405794:	52800000 	mov	w0, #0x0                   	// #0
  405798:	17fffffe 	b	0x405790
  40579c:	91023003 	add	x3, x0, #0x8c
  4057a0:	52800001 	mov	w1, #0x0                   	// #0
  4057a4:	885ffc62 	ldaxr	w2, [x3]
  4057a8:	8800fc61 	stlxr	w0, w1, [x3]
  4057ac:	35ffffc0 	cbnz	w0, 0x4057a4
  4057b0:	37f00042 	tbnz	w2, #30, 0x4057b8
  4057b4:	d65f03c0 	ret
  4057b8:	aa0303e0 	mov	x0, x3
  4057bc:	d2800c48 	mov	x8, #0x62                  	// #98
  4057c0:	d2801021 	mov	x1, #0x81                  	// #129
  4057c4:	d2800022 	mov	x2, #0x1                   	// #1
  4057c8:	d4000001 	svc	#0x0
  4057cc:	b100981f 	cmn	x0, #0x26
  4057d0:	54ffff21 	b.ne	0x4057b4  // b.any
  4057d4:	aa0303e0 	mov	x0, x3
  4057d8:	aa0203e1 	mov	x1, x2
  4057dc:	d4000001 	svc	#0x0
  4057e0:	17fffff5 	b	0x4057b4
  4057e4:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  4057e8:	aa0003f3 	mov	x19, x0
  4057ec:	39007fe1 	strb	w1, [sp, #31]
  4057f0:	f9401001 	ldr	x1, [x0, #32]
  4057f4:	b4000181 	cbz	x1, 0x405824
  4057f8:	f9401662 	ldr	x2, [x19, #40]
  4057fc:	eb01005f 	cmp	x2, x1
  405800:	540001e0 	b.eq	0x40583c  // b.none
  405804:	39407fe0 	ldrb	w0, [sp, #31]
  405808:	b9409261 	ldr	w1, [x19, #144]
  40580c:	6b01001f 	cmp	w0, w1
  405810:	54000160 	b.eq	0x40583c  // b.none
  405814:	91000441 	add	x1, x2, #0x1
  405818:	f9001661 	str	x1, [x19, #40]
  40581c:	39000040 	strb	w0, [x2]
  405820:	1400000f 	b	0x40585c
  405824:	940000a8 	bl	0x405ac4
  405828:	35000060 	cbnz	w0, 0x405834
  40582c:	f9401261 	ldr	x1, [x19, #32]
  405830:	17fffff2 	b	0x4057f8
  405834:	12800000 	mov	w0, #0xffffffff            	// #-1
  405838:	14000009 	b	0x40585c
  40583c:	f9402663 	ldr	x3, [x19, #72]
  405840:	aa1303e0 	mov	x0, x19
  405844:	91007fe1 	add	x1, sp, #0x1f
  405848:	d2800022 	mov	x2, #0x1                   	// #1
  40584c:	d63f0060 	blr	x3
  405850:	f100041f 	cmp	x0, #0x1
  405854:	54ffff01 	b.ne	0x405834  // b.any
  405858:	39407fe0 	ldrb	w0, [sp, #31]
  40585c:	a8c24ffe 	ldp	x30, x19, [sp], #32
  405860:	d65f03c0 	ret
  405864:	d65f03c0 	ret
  405868:	f81f0ffe 	str	x30, [sp, #-16]!
  40586c:	b9407800 	ldr	w0, [x0, #120]
  405870:	97fffe03 	bl	0x40507c
  405874:	93407c00 	sxtw	x0, w0
  405878:	d2800728 	mov	x8, #0x39                  	// #57
  40587c:	d4000001 	svc	#0x0
  405880:	97fff072 	bl	0x401a48
  405884:	f84107fe 	ldr	x30, [sp], #16
  405888:	d65f03c0 	ret
  40588c:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  405890:	aa0003f3 	mov	x19, x0
  405894:	a90157f4 	stp	x20, x21, [sp, #16]
  405898:	aa0203f5 	mov	x21, x2
  40589c:	aa0103f4 	mov	x20, x1
  4058a0:	f9403002 	ldr	x2, [x0, #96]
  4058a4:	f9001fe2 	str	x2, [sp, #56]
  4058a8:	f100005f 	cmp	x2, #0x0
  4058ac:	9a9f07e3 	cset	x3, ne	// ne = any
  4058b0:	cb0302a3 	sub	x3, x21, x3
  4058b4:	a9020fe1 	stp	x1, x3, [sp, #32]
  4058b8:	f9402c01 	ldr	x1, [x0, #88]
  4058bc:	f9001be1 	str	x1, [sp, #48]
  4058c0:	b9807800 	ldrsw	x0, [x0, #120]
  4058c4:	b4000283 	cbz	x3, 0x405914
  4058c8:	d2800828 	mov	x8, #0x41                  	// #65
  4058cc:	910083e1 	add	x1, sp, #0x20
  4058d0:	d2800042 	mov	x2, #0x2                   	// #2
  4058d4:	d4000001 	svc	#0x0
  4058d8:	97fff05c 	bl	0x401a48
  4058dc:	aa0003e3 	mov	x3, x0
  4058e0:	f100007f 	cmp	x3, #0x0
  4058e4:	5400022d 	b.le	0x405928
  4058e8:	f94017e1 	ldr	x1, [sp, #40]
  4058ec:	aa0303e0 	mov	x0, x3
  4058f0:	eb03003f 	cmp	x1, x3
  4058f4:	54000282 	b.cs	0x405944  // b.hs, b.nlast
  4058f8:	cb010063 	sub	x3, x3, x1
  4058fc:	a9458660 	ldp	x0, x1, [x19, #88]
  405900:	8b030003 	add	x3, x0, x3
  405904:	a9008e60 	stp	x0, x3, [x19, #8]
  405908:	b5000241 	cbnz	x1, 0x405950
  40590c:	aa1503e0 	mov	x0, x21
  405910:	1400000d 	b	0x405944
  405914:	d28007e8 	mov	x8, #0x3f                  	// #63
  405918:	d4000001 	svc	#0x0
  40591c:	97fff04b 	bl	0x401a48
  405920:	aa0003e3 	mov	x3, x0
  405924:	17ffffef 	b	0x4058e0
  405928:	b9400261 	ldr	w1, [x19]
  40592c:	52800202 	mov	w2, #0x10                  	// #16
  405930:	52800400 	mov	w0, #0x20                  	// #32
  405934:	1a821000 	csel	w0, w0, w2, ne	// ne = any
  405938:	2a000021 	orr	w1, w1, w0
  40593c:	d2800000 	mov	x0, #0x0                   	// #0
  405940:	b9000261 	str	w1, [x19]
  405944:	a94157f4 	ldp	x20, x21, [sp, #16]
  405948:	a8c44ffe 	ldp	x30, x19, [sp], #64
  40594c:	d65f03c0 	ret
  405950:	91000401 	add	x1, x0, #0x1
  405954:	8b150294 	add	x20, x20, x21
  405958:	f9000661 	str	x1, [x19, #8]
  40595c:	39400000 	ldrb	w0, [x0]
  405960:	381ff280 	sturb	w0, [x20, #-1]
  405964:	17ffffea 	b	0x40590c
  405968:	b9407800 	ldr	w0, [x0, #120]
  40596c:	14000188 	b	0x405f8c
  405970:	a9ba4ffe 	stp	x30, x19, [sp, #-96]!
  405974:	a90157f4 	stp	x20, x21, [sp, #16]
  405978:	910103f3 	add	x19, sp, #0x40
  40597c:	52800055 	mov	w21, #0x2                   	// #2
  405980:	a9025ff6 	stp	x22, x23, [sp, #32]
  405984:	d2800054 	mov	x20, #0x2                   	// #2
  405988:	aa0203f6 	mov	x22, x2
  40598c:	f9001bf8 	str	x24, [sp, #48]
  405990:	aa0003f8 	mov	x24, x0
  405994:	a9050be1 	stp	x1, x2, [sp, #80]
  405998:	f9401417 	ldr	x23, [x0, #40]
  40599c:	f9401c00 	ldr	x0, [x0, #56]
  4059a0:	cb0002f7 	sub	x23, x23, x0
  4059a4:	a9045fe0 	stp	x0, x23, [sp, #64]
  4059a8:	8b0202f7 	add	x23, x23, x2
  4059ac:	1400001b 	b	0x405a18
  4059b0:	a9458b01 	ldp	x1, x2, [x24, #88]
  4059b4:	aa1603e0 	mov	x0, x22
  4059b8:	f9001701 	str	x1, [x24, #40]
  4059bc:	f9001f01 	str	x1, [x24, #56]
  4059c0:	8b020021 	add	x1, x1, x2
  4059c4:	f9001301 	str	x1, [x24, #32]
  4059c8:	a94157f4 	ldp	x20, x21, [sp, #16]
  4059cc:	a9425ff6 	ldp	x22, x23, [sp, #32]
  4059d0:	f9401bf8 	ldr	x24, [sp, #48]
  4059d4:	a8c64ffe 	ldp	x30, x19, [sp], #96
  4059d8:	d65f03c0 	ret
  4059dc:	b9400301 	ldr	w1, [x24]
  4059e0:	d2800000 	mov	x0, #0x0                   	// #0
  4059e4:	a9027f1f 	stp	xzr, xzr, [x24, #32]
  4059e8:	321b0021 	orr	w1, w1, #0x20
  4059ec:	b9000301 	str	w1, [x24]
  4059f0:	f9001f1f 	str	xzr, [x24, #56]
  4059f4:	71000abf 	cmp	w21, #0x2
  4059f8:	54fffe80 	b.eq	0x4059c8  // b.none
  4059fc:	f9400660 	ldr	x0, [x19, #8]
  405a00:	cb0002c0 	sub	x0, x22, x0
  405a04:	17fffff1 	b	0x4059c8
  405a08:	f9400262 	ldr	x2, [x19]
  405a0c:	cb010063 	sub	x3, x3, x1
  405a10:	8b010041 	add	x1, x2, x1
  405a14:	a9000e61 	stp	x1, x3, [x19]
  405a18:	b9807b00 	ldrsw	x0, [x24, #120]
  405a1c:	aa1303e1 	mov	x1, x19
  405a20:	aa1403e2 	mov	x2, x20
  405a24:	d2800848 	mov	x8, #0x42                  	// #66
  405a28:	d4000001 	svc	#0x0
  405a2c:	97fff007 	bl	0x401a48
  405a30:	aa0003e1 	mov	x1, x0
  405a34:	eb0002ff 	cmp	x23, x0
  405a38:	54fffbc0 	b.eq	0x4059b0  // b.none
  405a3c:	cb0002f7 	sub	x23, x23, x0
  405a40:	b7fffce0 	tbnz	x0, #63, 0x4059dc
  405a44:	f9400663 	ldr	x3, [x19, #8]
  405a48:	eb03001f 	cmp	x0, x3
  405a4c:	54fffde9 	b.ls	0x405a08  // b.plast
  405a50:	510006b5 	sub	w21, w21, #0x1
  405a54:	cb030001 	sub	x1, x0, x3
  405a58:	f9400e63 	ldr	x3, [x19, #24]
  405a5c:	93407eb4 	sxtw	x20, w21
  405a60:	91004273 	add	x19, x19, #0x10
  405a64:	17ffffe9 	b	0x405a08
  405a68:	aa0003e3 	mov	x3, x0
  405a6c:	f81e0ffe 	str	x30, [sp, #-32]!
  405a70:	90000004 	adrp	x4, 0x405000
  405a74:	9125c080 	add	x0, x4, #0x970
  405a78:	aa0103e4 	mov	x4, x1
  405a7c:	aa0203e5 	mov	x5, x2
  405a80:	b9400061 	ldr	w1, [x3]
  405a84:	f9002460 	str	x0, [x3, #72]
  405a88:	37300121 	tbnz	w1, #6, 0x405aac
  405a8c:	b9807860 	ldrsw	x0, [x3, #120]
  405a90:	910063e2 	add	x2, sp, #0x18
  405a94:	d28003a8 	mov	x8, #0x1d                  	// #29
  405a98:	d28a8261 	mov	x1, #0x5413                	// #21523
  405a9c:	d4000001 	svc	#0x0
  405aa0:	b4000060 	cbz	x0, 0x405aac
  405aa4:	12800000 	mov	w0, #0xffffffff            	// #-1
  405aa8:	b9009060 	str	w0, [x3, #144]
  405aac:	aa0503e2 	mov	x2, x5
  405ab0:	aa0403e1 	mov	x1, x4
  405ab4:	aa0303e0 	mov	x0, x3
  405ab8:	97ffffae 	bl	0x405970
  405abc:	f84207fe 	ldr	x30, [sp], #32
  405ac0:	d65f03c0 	ret
  405ac4:	b9408802 	ldr	w2, [x0, #136]
  405ac8:	aa0003e1 	mov	x1, x0
  405acc:	b9400003 	ldr	w3, [x0]
  405ad0:	51000440 	sub	w0, w2, #0x1
  405ad4:	2a020000 	orr	w0, w0, w2
  405ad8:	b9008820 	str	w0, [x1, #136]
  405adc:	37180103 	tbnz	w3, #3, 0x405afc
  405ae0:	a9458c22 	ldp	x2, x3, [x1, #88]
  405ae4:	52800000 	mov	w0, #0x0                   	// #0
  405ae8:	a900fc3f 	stp	xzr, xzr, [x1, #8]
  405aec:	f9001c22 	str	x2, [x1, #56]
  405af0:	8b030043 	add	x3, x2, x3
  405af4:	a9020823 	stp	x3, x2, [x1, #32]
  405af8:	d65f03c0 	ret
  405afc:	321b0063 	orr	w3, w3, #0x20
  405b00:	12800000 	mov	w0, #0xffffffff            	// #-1
  405b04:	b9000023 	str	w3, [x1]
  405b08:	17fffffc 	b	0x405af8
  405b0c:	1400021d 	b	0x406380
  405b10:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  405b14:	aa0003f3 	mov	x19, x0
  405b18:	9400022c 	bl	0x4063c8
  405b1c:	35000160 	cbnz	w0, 0x405b48
  405b20:	f9402263 	ldr	x3, [x19, #64]
  405b24:	aa1303e0 	mov	x0, x19
  405b28:	91007fe1 	add	x1, sp, #0x1f
  405b2c:	d2800022 	mov	x2, #0x1                   	// #1
  405b30:	d63f0060 	blr	x3
  405b34:	f100041f 	cmp	x0, #0x1
  405b38:	54000081 	b.ne	0x405b48  // b.any
  405b3c:	39407fe0 	ldrb	w0, [sp, #31]
  405b40:	a8c24ffe 	ldp	x30, x19, [sp], #32
  405b44:	d65f03c0 	ret
  405b48:	12800000 	mov	w0, #0xffffffff            	// #-1
  405b4c:	17fffffd 	b	0x405b40
  405b50:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  405b54:	a90157f4 	stp	x20, x21, [sp, #16]
  405b58:	aa0103f5 	mov	x21, x1
  405b5c:	aa0003f4 	mov	x20, x0
  405b60:	97fffc22 	bl	0x404be8
  405b64:	aa0003f3 	mov	x19, x0
  405b68:	aa1503e3 	mov	x3, x21
  405b6c:	aa1303e2 	mov	x2, x19
  405b70:	aa1403e0 	mov	x0, x20
  405b74:	d2800021 	mov	x1, #0x1                   	// #1
  405b78:	97fff126 	bl	0x402010
  405b7c:	eb13001f 	cmp	x0, x19
  405b80:	a94157f4 	ldp	x20, x21, [sp, #16]
  405b84:	5a9f03e0 	csetm	w0, ne	// ne = any
  405b88:	a8c24ffe 	ldp	x30, x19, [sp], #32
  405b8c:	d65f03c0 	ret
  405b90:	a9bb4ffe 	stp	x30, x19, [sp, #-80]!
  405b94:	a90157f4 	stp	x20, x21, [sp, #16]
  405b98:	aa0003f5 	mov	x21, x0
  405b9c:	93407c34 	sxtw	x20, w1
  405ba0:	a9025ff6 	stp	x22, x23, [sp, #32]
  405ba4:	2a0403f6 	mov	w22, w4
  405ba8:	b40006c3 	cbz	x3, 0x405c80
  405bac:	f9001bf8 	str	x24, [sp, #48]
  405bb0:	d2993ff8 	mov	x24, #0xc9ff                	// #51711
  405bb4:	aa0303f3 	mov	x19, x3
  405bb8:	f2a77358 	movk	x24, #0x3b9a, lsl #16
  405bbc:	f9400461 	ldr	x1, [x3, #8]
  405bc0:	eb18003f 	cmp	x1, x24
  405bc4:	54000448 	b.hi	0x405c4c  // b.pmore
  405bc8:	910103f7 	add	x23, sp, #0x40
  405bcc:	2a0203e0 	mov	w0, w2
  405bd0:	aa1703e1 	mov	x1, x23
  405bd4:	940000c8 	bl	0x405ef4
  405bd8:	350003a0 	cbnz	w0, 0x405c4c
  405bdc:	a9400660 	ldp	x0, x1, [x19]
  405be0:	a9440be3 	ldp	x3, x2, [sp, #64]
  405be4:	cb030000 	sub	x0, x0, x3
  405be8:	cb020021 	sub	x1, x1, x2
  405bec:	a90407e0 	stp	x0, x1, [sp, #64]
  405bf0:	b7f803a1 	tbnz	x1, #63, 0x405c64
  405bf4:	f9401bf8 	ldr	x24, [sp, #48]
  405bf8:	b7f80400 	tbnz	x0, #63, 0x405c78
  405bfc:	710002df 	cmp	w22, #0x0
  405c00:	aa1503e1 	mov	x1, x21
  405c04:	1a9f07e2 	cset	w2, ne	// ne = any
  405c08:	aa1403e3 	mov	x3, x20
  405c0c:	aa1703e4 	mov	x4, x23
  405c10:	d2800006 	mov	x6, #0x0                   	// #0
  405c14:	d3790042 	ubfiz	x2, x2, #7, #1
  405c18:	d2800005 	mov	x5, #0x0                   	// #0
  405c1c:	d2800c40 	mov	x0, #0x62                  	// #98
  405c20:	97fffc8f 	bl	0x404e5c
  405c24:	2a0003e1 	mov	w1, w0
  405c28:	3100981f 	cmn	w0, #0x26
  405c2c:	540002e0 	b.eq	0x405c88  // b.none
  405c30:	3101b83f 	cmn	w1, #0x6e
  405c34:	3a441824 	ccmn	w1, #0x4, #0x4, ne	// ne = any
  405c38:	540003c0 	b.eq	0x405cb0  // b.none
  405c3c:	3101f43f 	cmn	w1, #0x7d
  405c40:	52800fa0 	mov	w0, #0x7d                  	// #125
  405c44:	1a8013e0 	csel	w0, wzr, w0, ne	// ne = any
  405c48:	14000003 	b	0x405c54
  405c4c:	f9401bf8 	ldr	x24, [sp, #48]
  405c50:	528002c0 	mov	w0, #0x16                  	// #22
  405c54:	a94157f4 	ldp	x20, x21, [sp, #16]
  405c58:	a9425ff6 	ldp	x22, x23, [sp, #32]
  405c5c:	a8c54ffe 	ldp	x30, x19, [sp], #80
  405c60:	d65f03c0 	ret
  405c64:	91000718 	add	x24, x24, #0x1
  405c68:	d1000400 	sub	x0, x0, #0x1
  405c6c:	8b180021 	add	x1, x1, x24
  405c70:	a90407e0 	stp	x0, x1, [sp, #64]
  405c74:	17ffffe0 	b	0x405bf4
  405c78:	52800dc0 	mov	w0, #0x6e                  	// #110
  405c7c:	17fffff6 	b	0x405c54
  405c80:	d2800017 	mov	x23, #0x0                   	// #0
  405c84:	17ffffde 	b	0x405bfc
  405c88:	aa1503e1 	mov	x1, x21
  405c8c:	aa1703e4 	mov	x4, x23
  405c90:	aa1403e3 	mov	x3, x20
  405c94:	d2800006 	mov	x6, #0x0                   	// #0
  405c98:	d2800005 	mov	x5, #0x0                   	// #0
  405c9c:	d2800002 	mov	x2, #0x0                   	// #0
  405ca0:	d2800c40 	mov	x0, #0x62                  	// #98
  405ca4:	97fffc6e 	bl	0x404e5c
  405ca8:	2a0003e1 	mov	w1, w0
  405cac:	17ffffe1 	b	0x405c30
  405cb0:	3100103f 	cmn	w1, #0x4
  405cb4:	54fffe21 	b.ne	0x405c78  // b.any
  405cb8:	d0000040 	adrp	x0, 0x40f000
  405cbc:	b9450c00 	ldr	w0, [x0, #1292]
  405cc0:	7100001f 	cmp	w0, #0x0
  405cc4:	1a9f07e0 	cset	w0, ne	// ne = any
  405cc8:	531e7400 	lsl	w0, w0, #2
  405ccc:	17ffffe2 	b	0x405c54
  405cd0:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  405cd4:	aa0003f3 	mov	x19, x0
  405cd8:	52800020 	mov	w0, #0x1                   	// #1
  405cdc:	a90157f4 	stp	x20, x21, [sp, #16]
  405ce0:	2a0103f4 	mov	w20, w1
  405ce4:	2a0203f5 	mov	w21, w2
  405ce8:	9100f3e1 	add	x1, sp, #0x3c
  405cec:	a9025ff6 	stp	x22, x23, [sp, #32]
  405cf0:	aa0303f6 	mov	x22, x3
  405cf4:	2a0403f7 	mov	w23, w4
  405cf8:	94000050 	bl	0x405e38
  405cfc:	2a1703e4 	mov	w4, w23
  405d00:	aa1603e3 	mov	x3, x22
  405d04:	2a1503e2 	mov	w2, w21
  405d08:	2a1403e1 	mov	w1, w20
  405d0c:	aa1303e0 	mov	x0, x19
  405d10:	97ffffa0 	bl	0x405b90
  405d14:	2a0003f3 	mov	w19, w0
  405d18:	b9403fe0 	ldr	w0, [sp, #60]
  405d1c:	d2800001 	mov	x1, #0x0                   	// #0
  405d20:	94000046 	bl	0x405e38
  405d24:	a94157f4 	ldp	x20, x21, [sp, #16]
  405d28:	2a1303e0 	mov	w0, w19
  405d2c:	a9425ff6 	ldp	x22, x23, [sp, #32]
  405d30:	a8c44ffe 	ldp	x30, x19, [sp], #64
  405d34:	d65f03c0 	ret
  405d38:	d51bd040 	msr	tpidr_el0, x0
  405d3c:	52800000 	mov	w0, #0x0                   	// #0
  405d40:	d65f03c0 	ret
  405d44:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  405d48:	a90157f4 	stp	x20, x21, [sp, #16]
  405d4c:	aa0103f5 	mov	x21, x1
  405d50:	aa0003f4 	mov	x20, x0
  405d54:	9400002f 	bl	0x405e10
  405d58:	7100401f 	cmp	w0, #0x10
  405d5c:	54000541 	b.ne	0x405e04  // b.any
  405d60:	52800ca0 	mov	w0, #0x65                  	// #101
  405d64:	14000002 	b	0x405d6c
  405d68:	d5033bbf 	dmb	ish
  405d6c:	71000400 	subs	w0, w0, #0x1
  405d70:	54000260 	b.eq	0x405dbc  // b.none
  405d74:	b9400281 	ldr	w1, [x20]
  405d78:	34000221 	cbz	w1, 0x405dbc
  405d7c:	b9400681 	ldr	w1, [x20, #4]
  405d80:	34ffff41 	cbz	w1, 0x405d68
  405d84:	1400000e 	b	0x405dbc
  405d88:	d5033bbf 	dmb	ish
  405d8c:	b9400a84 	ldr	w4, [x20, #8]
  405d90:	aa1503e3 	mov	x3, x21
  405d94:	aa1403e0 	mov	x0, x20
  405d98:	52800002 	mov	w2, #0x0                   	// #0
  405d9c:	52190084 	eor	w4, w4, #0x80
  405da0:	97ffffcc 	bl	0x405cd0
  405da4:	885ffe62 	ldaxr	w2, [x19]
  405da8:	51000442 	sub	w2, w2, #0x1
  405dac:	8801fe62 	stlxr	w1, w2, [x19]
  405db0:	35ffffa1 	cbnz	w1, 0x405da4
  405db4:	721d781f 	tst	w0, #0xfffffffb
  405db8:	54000261 	b.ne	0x405e04  // b.any
  405dbc:	aa1403e0 	mov	x0, x20
  405dc0:	94000014 	bl	0x405e10
  405dc4:	7100401f 	cmp	w0, #0x10
  405dc8:	540001e1 	b.ne	0x405e04  // b.any
  405dcc:	b9400283 	ldr	w3, [x20]
  405dd0:	34ffff63 	cbz	w3, 0x405dbc
  405dd4:	32010061 	orr	w1, w3, #0x80000000
  405dd8:	91001293 	add	x19, x20, #0x4
  405ddc:	885ffe62 	ldaxr	w2, [x19]
  405de0:	11000442 	add	w2, w2, #0x1
  405de4:	8800fe62 	stlxr	w0, w2, [x19]
  405de8:	35ffffa0 	cbnz	w0, 0x405ddc
  405dec:	885ffe80 	ldaxr	w0, [x20]
  405df0:	6b00007f 	cmp	w3, w0
  405df4:	54fffca1 	b.ne	0x405d88  // b.any
  405df8:	8800fe81 	stlxr	w0, w1, [x20]
  405dfc:	35ffff80 	cbnz	w0, 0x405dec
  405e00:	17ffffe3 	b	0x405d8c
  405e04:	a94157f4 	ldp	x20, x21, [sp, #16]
  405e08:	a8c24ffe 	ldp	x30, x19, [sp], #32
  405e0c:	d65f03c0 	ret
  405e10:	aa0003e1 	mov	x1, x0
  405e14:	12b00002 	mov	w2, #0x7fffffff            	// #2147483647
  405e18:	885ffc20 	ldaxr	w0, [x1]
  405e1c:	35000080 	cbnz	w0, 0x405e2c
  405e20:	8800fc22 	stlxr	w0, w2, [x1]
  405e24:	35ffffa0 	cbnz	w0, 0x405e18
  405e28:	14000003 	b	0x405e34
  405e2c:	d5033bbf 	dmb	ish
  405e30:	52800200 	mov	w0, #0x10                  	// #16
  405e34:	d65f03c0 	ret
  405e38:	7100081f 	cmp	w0, #0x2
  405e3c:	54000168 	b.hi	0x405e68  // b.pmore
  405e40:	d53bd042 	mrs	x2, tpidr_el0
  405e44:	d1032042 	sub	x2, x2, #0xc8
  405e48:	b4000081 	cbz	x1, 0x405e58
  405e4c:	3940c043 	ldrb	w3, [x2, #48]
  405e50:	12001c63 	and	w3, w3, #0xff
  405e54:	b9000023 	str	w3, [x1]
  405e58:	12001c01 	and	w1, w0, #0xff
  405e5c:	52800000 	mov	w0, #0x0                   	// #0
  405e60:	3900c041 	strb	w1, [x2, #48]
  405e64:	d65f03c0 	ret
  405e68:	528002c0 	mov	w0, #0x16                  	// #22
  405e6c:	17fffffe 	b	0x405e64
  405e70:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  405e74:	2a0003f3 	mov	w19, w0
  405e78:	90000020 	adrp	x0, 0x409000
  405e7c:	9105c000 	add	x0, x0, #0x170
  405e80:	f9000bf4 	str	x20, [sp, #16]
  405e84:	aa0103f4 	mov	x20, x1
  405e88:	90000021 	adrp	x1, 0x409000
  405e8c:	91056021 	add	x1, x1, #0x158
  405e90:	94000044 	bl	0x405fa0
  405e94:	90000005 	adrp	x5, 0x405000
  405e98:	aa0003e2 	mov	x2, x0
  405e9c:	9139c0a5 	add	x5, x5, #0xe70
  405ea0:	f0000023 	adrp	x3, 0x40c000
  405ea4:	910bc060 	add	x0, x3, #0x2f0
  405ea8:	c85ffc04 	ldaxr	x4, [x0]
  405eac:	eb05009f 	cmp	x4, x5
  405eb0:	540000a1 	b.ne	0x405ec4  // b.any
  405eb4:	910bc060 	add	x0, x3, #0x2f0
  405eb8:	c804fc02 	stlxr	w4, x2, [x0]
  405ebc:	35ffff44 	cbnz	w4, 0x405ea4
  405ec0:	14000002 	b	0x405ec8
  405ec4:	d5033bbf 	dmb	ish
  405ec8:	b40000e2 	cbz	x2, 0x405ee4
  405ecc:	aa1403e1 	mov	x1, x20
  405ed0:	2a1303e0 	mov	w0, w19
  405ed4:	f9400bf4 	ldr	x20, [sp, #16]
  405ed8:	aa0203f0 	mov	x16, x2
  405edc:	a8c24ffe 	ldp	x30, x19, [sp], #32
  405ee0:	d61f0200 	br	x16
  405ee4:	f9400bf4 	ldr	x20, [sp, #16]
  405ee8:	128004a0 	mov	w0, #0xffffffda            	// #-38
  405eec:	a8c24ffe 	ldp	x30, x19, [sp], #32
  405ef0:	d65f03c0 	ret
  405ef4:	f0000022 	adrp	x2, 0x40c000
  405ef8:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  405efc:	aa0103f3 	mov	x19, x1
  405f00:	f9417842 	ldr	x2, [x2, #752]
  405f04:	f9000bf4 	str	x20, [sp, #16]
  405f08:	2a0003f4 	mov	w20, w0
  405f0c:	b40000a2 	cbz	x2, 0x405f20
  405f10:	d63f0040 	blr	x2
  405f14:	34000280 	cbz	w0, 0x405f64
  405f18:	3100581f 	cmn	w0, #0x16
  405f1c:	54000280 	b.eq	0x405f6c  // b.none
  405f20:	93407e80 	sxtw	x0, w20
  405f24:	aa1303e1 	mov	x1, x19
  405f28:	d2800e28 	mov	x8, #0x71                  	// #113
  405f2c:	d4000001 	svc	#0x0
  405f30:	3100981f 	cmn	w0, #0x26
  405f34:	54000221 	b.ne	0x405f78  // b.any
  405f38:	928002a0 	mov	x0, #0xffffffffffffffea    	// #-22
  405f3c:	35000214 	cbnz	w20, 0x405f7c
  405f40:	d2801528 	mov	x8, #0xa9                  	// #169
  405f44:	aa1303e0 	mov	x0, x19
  405f48:	d2800001 	mov	x1, #0x0                   	// #0
  405f4c:	d4000001 	svc	#0x0
  405f50:	f9400660 	ldr	x0, [x19, #8]
  405f54:	52807d01 	mov	w1, #0x3e8                 	// #1000
  405f58:	1b017c00 	mul	w0, w0, w1
  405f5c:	93407c00 	sxtw	x0, w0
  405f60:	f9000660 	str	x0, [x19, #8]
  405f64:	52800000 	mov	w0, #0x0                   	// #0
  405f68:	14000006 	b	0x405f80
  405f6c:	928002a0 	mov	x0, #0xffffffffffffffea    	// #-22
  405f70:	97ffeeb6 	bl	0x401a48
  405f74:	14000003 	b	0x405f80
  405f78:	93407c00 	sxtw	x0, w0
  405f7c:	97ffeeb3 	bl	0x401a48
  405f80:	f9400bf4 	ldr	x20, [sp, #16]
  405f84:	a8c24ffe 	ldp	x30, x19, [sp], #32
  405f88:	d65f03c0 	ret
  405f8c:	d28007c8 	mov	x8, #0x3e                  	// #62
  405f90:	93407c00 	sxtw	x0, w0
  405f94:	93407c42 	sxtw	x2, w2
  405f98:	d4000001 	svc	#0x0
  405f9c:	17ffeeab 	b	0x401a48
  405fa0:	b0000043 	adrp	x3, 0x40e000
  405fa4:	a9ba4ffe 	stp	x30, x19, [sp, #-96]!
  405fa8:	d2800002 	mov	x2, #0x0                   	// #0
  405fac:	f9456064 	ldr	x4, [x3, #2752]
  405fb0:	a9025ff6 	stp	x22, x23, [sp, #32]
  405fb4:	aa0003f7 	mov	x23, x0
  405fb8:	aa0103f6 	mov	x22, x1
  405fbc:	f8627883 	ldr	x3, [x4, x2, lsl #3]
  405fc0:	f100847f 	cmp	x3, #0x21
  405fc4:	540001a0 	b.eq	0x405ff8  // b.none
  405fc8:	91000842 	add	x2, x2, #0x2
  405fcc:	b5ffff83 	cbnz	x3, 0x405fbc
  405fd0:	d2800000 	mov	x0, #0x0                   	// #0
  405fd4:	a9425ff6 	ldp	x22, x23, [sp, #32]
  405fd8:	a8c64ffe 	ldp	x30, x19, [sp], #96
  405fdc:	d65f03c0 	ret
  405fe0:	a94157f4 	ldp	x20, x21, [sp, #16]
  405fe4:	17fffffb 	b	0x405fd0
  405fe8:	a94157f4 	ldp	x20, x21, [sp, #16]
  405fec:	a94367f8 	ldp	x24, x25, [sp, #48]
  405ff0:	a9446ffa 	ldp	x26, x27, [sp, #64]
  405ff4:	17fffff7 	b	0x405fd0
  405ff8:	91000442 	add	x2, x2, #0x1
  405ffc:	f8627886 	ldr	x6, [x4, x2, lsl #3]
  406000:	b4fffe86 	cbz	x6, 0x405fd0
  406004:	a90157f4 	stp	x20, x21, [sp, #16]
  406008:	d2800002 	mov	x2, #0x0                   	// #0
  40600c:	92800014 	mov	x20, #0xffffffffffffffff    	// #-1
  406010:	f94010c3 	ldr	x3, [x6, #32]
  406014:	d2800004 	mov	x4, #0x0                   	// #0
  406018:	794070c1 	ldrh	w1, [x6, #56]
  40601c:	8b0300c3 	add	x3, x6, x3
  406020:	14000007 	b	0x40603c
  406024:	a9408074 	ldp	x20, x0, [x3, #8]
  406028:	8b1400d4 	add	x20, x6, x20
  40602c:	cb000294 	sub	x20, x20, x0
  406030:	79406cc0 	ldrh	w0, [x6, #54]
  406034:	91000484 	add	x4, x4, #0x1
  406038:	8b000063 	add	x3, x3, x0
  40603c:	eb04003f 	cmp	x1, x4
  406040:	54000120 	b.eq	0x406064  // b.none
  406044:	b9400065 	ldr	w5, [x3]
  406048:	710004bf 	cmp	w5, #0x1
  40604c:	54fffec0 	b.eq	0x406024  // b.none
  406050:	710008bf 	cmp	w5, #0x2
  406054:	54fffee1 	b.ne	0x406030  // b.any
  406058:	f9400462 	ldr	x2, [x3, #8]
  40605c:	8b0200c2 	add	x2, x6, x2
  406060:	17fffff4 	b	0x406030
  406064:	f100005f 	cmp	x2, #0x0
  406068:	ba411a84 	ccmn	x20, #0x1, #0x4, ne	// ne = any
  40606c:	54fffba0 	b.eq	0x405fe0  // b.none
  406070:	d29ffe00 	mov	x0, #0xfff0                	// #65520
  406074:	d2800015 	mov	x21, #0x0                   	// #0
  406078:	f2adffe0 	movk	x0, #0x6fff, lsl #16
  40607c:	91003001 	add	x1, x0, #0xc
  406080:	a90367f8 	stp	x24, x25, [sp, #48]
  406084:	d2800019 	mov	x25, #0x0                   	// #0
  406088:	d2800018 	mov	x24, #0x0                   	// #0
  40608c:	a9046ffa 	stp	x26, x27, [sp, #64]
  406090:	d280001a 	mov	x26, #0x0                   	// #0
  406094:	d280001b 	mov	x27, #0x0                   	// #0
  406098:	14000006 	b	0x4060b0
  40609c:	f100127f 	cmp	x19, #0x4
  4060a0:	54000240 	b.eq	0x4060e8  // b.none
  4060a4:	f100167f 	cmp	x19, #0x5
  4060a8:	9a831318 	csel	x24, x24, x3, ne	// ne = any
  4060ac:	91004042 	add	x2, x2, #0x10
  4060b0:	f9400053 	ldr	x19, [x2]
  4060b4:	b4000233 	cbz	x19, 0x4060f8
  4060b8:	f9400443 	ldr	x3, [x2, #8]
  4060bc:	8b030283 	add	x3, x20, x3
  4060c0:	f1001a7f 	cmp	x19, #0x6
  4060c4:	540000e0 	b.eq	0x4060e0  // b.none
  4060c8:	54fffea9 	b.ls	0x40609c  // b.plast
  4060cc:	eb00027f 	cmp	x19, x0
  4060d0:	54000100 	b.eq	0x4060f0  // b.none
  4060d4:	eb01027f 	cmp	x19, x1
  4060d8:	9a831339 	csel	x25, x25, x3, ne	// ne = any
  4060dc:	17fffff4 	b	0x4060ac
  4060e0:	aa0303f5 	mov	x21, x3
  4060e4:	17fffff2 	b	0x4060ac
  4060e8:	aa0303fb 	mov	x27, x3
  4060ec:	17fffff0 	b	0x4060ac
  4060f0:	aa0303fa 	mov	x26, x3
  4060f4:	17ffffee 	b	0x4060ac
  4060f8:	f100031f 	cmp	x24, #0x0
  4060fc:	fa401aa4 	ccmp	x21, #0x0, #0x4, ne	// ne = any
  406100:	fa401b64 	ccmp	x27, #0x0, #0x4, ne	// ne = any
  406104:	54fff720 	b.eq	0x405fe8  // b.none
  406108:	f9002bfc 	str	x28, [sp, #80]
  40610c:	f100033f 	cmp	x25, #0x0
  406110:	9a9f135a 	csel	x26, x26, xzr, ne	// ne = any
  406114:	528080c4 	mov	w4, #0x406                 	// #1030
  406118:	b9400760 	ldr	w0, [x27, #4]
  40611c:	528004fc 	mov	w28, #0x27                  	// #39
  406120:	1400001b 	b	0x40618c
  406124:	b9401043 	ldr	w3, [x2, #16]
  406128:	8b234042 	add	x2, x2, w3, uxtw
  40612c:	340002a3 	cbz	w3, 0x406180
  406130:	79400440 	ldrh	w0, [x2, #2]
  406134:	3707ff80 	tbnz	w0, #0, 0x406124
  406138:	79400840 	ldrh	w0, [x2, #4]
  40613c:	4a000020 	eor	w0, w1, w0
  406140:	f240381f 	tst	x0, #0x7fff
  406144:	54ffff01 	b.ne	0x406124  // b.any
  406148:	b9400c41 	ldr	w1, [x2, #12]
  40614c:	aa1703e0 	mov	x0, x23
  406150:	b8616841 	ldr	w1, [x2, x1]
  406154:	8b010301 	add	x1, x24, x1
  406158:	940000c4 	bl	0x406468
  40615c:	528080c4 	mov	w4, #0x406                 	// #1030
  406160:	35000100 	cbnz	w0, 0x406180
  406164:	f94006a0 	ldr	x0, [x21, #8]
  406168:	a94367f8 	ldp	x24, x25, [sp, #48]
  40616c:	8b000280 	add	x0, x20, x0
  406170:	a94157f4 	ldp	x20, x21, [sp, #16]
  406174:	a9446ffa 	ldp	x26, x27, [sp, #64]
  406178:	f9402bfc 	ldr	x28, [sp, #80]
  40617c:	17ffff96 	b	0x405fd4
  406180:	b9400760 	ldr	w0, [x27, #4]
  406184:	91000673 	add	x19, x19, #0x1
  406188:	910062b5 	add	x21, x21, #0x18
  40618c:	eb13001f 	cmp	x0, x19
  406190:	54000289 	b.ls	0x4061e0  // b.plast
  406194:	394012a2 	ldrb	w2, [x21, #4]
  406198:	12000c43 	and	w3, w2, #0xf
  40619c:	1ac32b83 	asr	w3, w28, w3
  4061a0:	3607ff23 	tbz	w3, #0, 0x406184
  4061a4:	53047c42 	lsr	w2, w2, #4
  4061a8:	1ac22882 	asr	w2, w4, w2
  4061ac:	3607fec2 	tbz	w2, #0, 0x406184
  4061b0:	79400ea1 	ldrh	w1, [x21, #6]
  4061b4:	34fffe81 	cbz	w1, 0x406184
  4061b8:	b94002a1 	ldr	w1, [x21]
  4061bc:	aa1603e0 	mov	x0, x22
  4061c0:	8b010301 	add	x1, x24, x1
  4061c4:	940000a9 	bl	0x406468
  4061c8:	528080c4 	mov	w4, #0x406                 	// #1030
  4061cc:	35fffda0 	cbnz	w0, 0x406180
  4061d0:	b4fffcba 	cbz	x26, 0x406164
  4061d4:	78737b41 	ldrh	w1, [x26, x19, lsl #1]
  4061d8:	aa1903e2 	mov	x2, x25
  4061dc:	17ffffd5 	b	0x406130
  4061e0:	a94157f4 	ldp	x20, x21, [sp, #16]
  4061e4:	a94367f8 	ldp	x24, x25, [sp, #48]
  4061e8:	a9446ffa 	ldp	x26, x27, [sp, #64]
  4061ec:	f9402bfc 	ldr	x28, [sp, #80]
  4061f0:	17ffff78 	b	0x405fd0
  4061f4:	b4000880 	cbz	x0, 0x406304
  4061f8:	aa0003e2 	mov	x2, x0
  4061fc:	7101fc3f 	cmp	w1, #0x7f
  406200:	54000809 	b.ls	0x406300  // b.plast
  406204:	f81f0ffe 	str	x30, [sp, #-16]!
  406208:	d53bd040 	mrs	x0, tpidr_el0
  40620c:	f85d0000 	ldur	x0, [x0, #-48]
  406210:	f9400000 	ldr	x0, [x0]
  406214:	b4000240 	cbz	x0, 0x40625c
  406218:	711ffc3f 	cmp	w1, #0x7ff
  40621c:	54000309 	b.ls	0x40627c  // b.plast
  406220:	51403823 	sub	w3, w1, #0xe, lsl #12
  406224:	5283ffe0 	mov	w0, #0x1fff                	// #8191
  406228:	6b00007f 	cmp	w3, w0
  40622c:	529affe0 	mov	w0, #0xd7ff                	// #55295
  406230:	7a408020 	ccmp	w1, w0, #0x0, hi	// hi = pmore
  406234:	54000349 	b.ls	0x40629c  // b.plast
  406238:	51404023 	sub	w3, w1, #0x10, lsl #12
  40623c:	12bffe00 	mov	w0, #0xfffff               	// #1048575
  406240:	6b00007f 	cmp	w3, w0
  406244:	54000429 	b.ls	0x4062c8  // b.plast
  406248:	97fffc60 	bl	0x4053c8
  40624c:	52800a81 	mov	w1, #0x54                  	// #84
  406250:	b9000001 	str	w1, [x0]
  406254:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
  406258:	14000007 	b	0x406274
  40625c:	129befe0 	mov	w0, #0xffff2080            	// #-57216
  406260:	0b000020 	add	w0, w1, w0
  406264:	7101fc1f 	cmp	w0, #0x7f
  406268:	54ffff08 	b.hi	0x406248  // b.pmore
  40626c:	d2800020 	mov	x0, #0x1                   	// #1
  406270:	39000041 	strb	w1, [x2]
  406274:	f84107fe 	ldr	x30, [sp], #16
  406278:	d65f03c0 	ret
  40627c:	53067c23 	lsr	w3, w1, #6
  406280:	12001421 	and	w1, w1, #0x3f
  406284:	321a6463 	orr	w3, w3, #0xffffffc0
  406288:	32196021 	orr	w1, w1, #0xffffff80
  40628c:	d2800040 	mov	x0, #0x2                   	// #2
  406290:	39000043 	strb	w3, [x2]
  406294:	39000441 	strb	w1, [x2, #1]
  406298:	17fffff7 	b	0x406274
  40629c:	530c7c24 	lsr	w4, w1, #12
  4062a0:	d3462c23 	ubfx	x3, x1, #6, #6
  4062a4:	12001421 	and	w1, w1, #0x3f
  4062a8:	321b6884 	orr	w4, w4, #0xffffffe0
  4062ac:	32196063 	orr	w3, w3, #0xffffff80
  4062b0:	32196021 	orr	w1, w1, #0xffffff80
  4062b4:	d2800060 	mov	x0, #0x3                   	// #3
  4062b8:	39000044 	strb	w4, [x2]
  4062bc:	39000443 	strb	w3, [x2, #1]
  4062c0:	39000841 	strb	w1, [x2, #2]
  4062c4:	17ffffec 	b	0x406274
  4062c8:	53127c25 	lsr	w5, w1, #18
  4062cc:	d34c4424 	ubfx	x4, x1, #12, #6
  4062d0:	d3462c23 	ubfx	x3, x1, #6, #6
  4062d4:	12001421 	and	w1, w1, #0x3f
  4062d8:	321c6ca5 	orr	w5, w5, #0xfffffff0
  4062dc:	32196084 	orr	w4, w4, #0xffffff80
  4062e0:	32196063 	orr	w3, w3, #0xffffff80
  4062e4:	32196021 	orr	w1, w1, #0xffffff80
  4062e8:	d2800080 	mov	x0, #0x4                   	// #4
  4062ec:	39000045 	strb	w5, [x2]
  4062f0:	39000444 	strb	w4, [x2, #1]
  4062f4:	39000843 	strb	w3, [x2, #2]
  4062f8:	39000c41 	strb	w1, [x2, #3]
  4062fc:	17ffffde 	b	0x406274
  406300:	39000001 	strb	w1, [x0]
  406304:	d2800020 	mov	x0, #0x1                   	// #1
  406308:	d65f03c0 	ret
  40630c:	b4000380 	cbz	x0, 0x40637c
  406310:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  406314:	aa0003f3 	mov	x19, x0
  406318:	b9408c01 	ldr	w1, [x0, #140]
  40631c:	36f80281 	tbz	w1, #31, 0x40636c
  406320:	f9401661 	ldr	x1, [x19, #40]
  406324:	f9401e60 	ldr	x0, [x19, #56]
  406328:	eb00003f 	cmp	x1, x0
  40632c:	540000c0 	b.eq	0x406344  // b.none
  406330:	f9402663 	ldr	x3, [x19, #72]
  406334:	aa1303e0 	mov	x0, x19
  406338:	d2800002 	mov	x2, #0x0                   	// #0
  40633c:	d2800001 	mov	x1, #0x0                   	// #0
  406340:	d63f0060 	blr	x3
  406344:	a9408261 	ldp	x1, x0, [x19, #8]
  406348:	eb00003f 	cmp	x1, x0
  40634c:	54000140 	b.eq	0x406374  // b.none
  406350:	f9402a63 	ldr	x3, [x19, #80]
  406354:	cb000021 	sub	x1, x1, x0
  406358:	aa1303e0 	mov	x0, x19
  40635c:	52800022 	mov	w2, #0x1                   	// #1
  406360:	a8c14ffe 	ldp	x30, x19, [sp], #16
  406364:	aa0303f0 	mov	x16, x3
  406368:	d61f0200 	br	x16
  40636c:	97fffcde 	bl	0x4056e4
  406370:	17ffffec 	b	0x406320
  406374:	a8c14ffe 	ldp	x30, x19, [sp], #16
  406378:	d65f03c0 	ret
  40637c:	d65f03c0 	ret
  406380:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  406384:	9400002e 	bl	0x40643c
  406388:	f9400013 	ldr	x19, [x0]
  40638c:	14000003 	b	0x406398
  406390:	97ffffdf 	bl	0x40630c
  406394:	f9403a73 	ldr	x19, [x19, #112]
  406398:	aa1303e0 	mov	x0, x19
  40639c:	b5ffffb3 	cbnz	x19, 0x406390
  4063a0:	d0000020 	adrp	x0, 0x40c000
  4063a4:	f9408400 	ldr	x0, [x0, #264]
  4063a8:	97ffffd9 	bl	0x40630c
  4063ac:	d0000020 	adrp	x0, 0x40c000
  4063b0:	f940fc00 	ldr	x0, [x0, #504]
  4063b4:	97ffffd6 	bl	0x40630c
  4063b8:	a8c14ffe 	ldp	x30, x19, [sp], #16
  4063bc:	d0000020 	adrp	x0, 0x40c000
  4063c0:	f9400c00 	ldr	x0, [x0, #24]
  4063c4:	17ffffd2 	b	0x40630c
  4063c8:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  4063cc:	aa0003f3 	mov	x19, x0
  4063d0:	b9408802 	ldr	w2, [x0, #136]
  4063d4:	f9401404 	ldr	x4, [x0, #40]
  4063d8:	51000441 	sub	w1, w2, #0x1
  4063dc:	f9401c03 	ldr	x3, [x0, #56]
  4063e0:	2a020021 	orr	w1, w1, w2
  4063e4:	b9008801 	str	w1, [x0, #136]
  4063e8:	eb03009f 	cmp	x4, x3
  4063ec:	540000a0 	b.eq	0x406400  // b.none
  4063f0:	f9402403 	ldr	x3, [x0, #72]
  4063f4:	d2800002 	mov	x2, #0x0                   	// #0
  4063f8:	d2800001 	mov	x1, #0x0                   	// #0
  4063fc:	d63f0060 	blr	x3
  406400:	b9400260 	ldr	w0, [x19]
  406404:	a9027e7f 	stp	xzr, xzr, [x19, #32]
  406408:	f9001e7f 	str	xzr, [x19, #56]
  40640c:	371000e0 	tbnz	w0, #2, 0x406428
  406410:	a9458a61 	ldp	x1, x2, [x19, #88]
  406414:	93441000 	sbfx	x0, x0, #4, #1
  406418:	8b020021 	add	x1, x1, x2
  40641c:	a9008661 	stp	x1, x1, [x19, #8]
  406420:	a8c14ffe 	ldp	x30, x19, [sp], #16
  406424:	d65f03c0 	ret
  406428:	321b0001 	orr	w1, w0, #0x20
  40642c:	12800000 	mov	w0, #0xffffffff            	// #-1
  406430:	b9000261 	str	w1, [x19]
  406434:	17fffffb 	b	0x406420
  406438:	17ffffd2 	b	0x406380
  40643c:	f81f0ffe 	str	x30, [sp, #-16]!
  406440:	b0000040 	adrp	x0, 0x40f000
  406444:	91148000 	add	x0, x0, #0x520
  406448:	97fffa1f 	bl	0x404cc4
  40644c:	f84107fe 	ldr	x30, [sp], #16
  406450:	b0000040 	adrp	x0, 0x40f000
  406454:	9114a000 	add	x0, x0, #0x528
  406458:	d65f03c0 	ret
  40645c:	b0000040 	adrp	x0, 0x40f000
  406460:	91148000 	add	x0, x0, #0x520
  406464:	17fffa5e 	b	0x404ddc
  406468:	d2800002 	mov	x2, #0x0                   	// #0
  40646c:	38626804 	ldrb	w4, [x0, x2]
  406470:	38626823 	ldrb	w3, [x1, x2]
  406474:	91000442 	add	x2, x2, #0x1
  406478:	6b03009f 	cmp	w4, w3
  40647c:	54000061 	b.ne	0x406488  // b.any
  406480:	35ffff63 	cbnz	w3, 0x40646c
  406484:	52800004 	mov	w4, #0x0                   	// #0
  406488:	4b030080 	sub	w0, w4, w3
  40648c:	d65f03c0 	ret
  406490:	d503245f 	bti	c
  406494:	9e660004 	fmov	x4, d0
  406498:	9eae0005 	fmov	x5, v0.d[1]
  40649c:	9e660020 	fmov	x0, d1
  4064a0:	9eae0021 	fmov	x1, v1.d[1]
  4064a4:	d53b440b 	mrs	x11, fpcr
  4064a8:	aa0503e2 	mov	x2, x5
  4064ac:	aa0003e3 	mov	x3, x0
  4064b0:	d37dbc26 	ubfiz	x6, x1, #3, #48
  4064b4:	d37ffca5 	lsr	x5, x5, #63
  4064b8:	d37dbc48 	ubfiz	x8, x2, #3, #48
  4064bc:	d37ffc20 	lsr	x0, x1, #63
  4064c0:	aa0503ed 	mov	x13, x5
  4064c4:	aa43f4ca 	orr	x10, x6, x3, lsr #61
  4064c8:	d370f847 	ubfx	x7, x2, #48, #15
  4064cc:	d370f826 	ubfx	x6, x1, #48, #15
  4064d0:	12001ca5 	and	w5, w5, #0xff
  4064d4:	aa44f508 	orr	x8, x8, x4, lsr #61
  4064d8:	aa0703e2 	mov	x2, x7
  4064dc:	d37df089 	lsl	x9, x4, #3
  4064e0:	aa0603e1 	mov	x1, x6
  4064e4:	d37df06e 	lsl	x14, x3, #3
  4064e8:	eb0001bf 	cmp	x13, x0
  4064ec:	540011e0 	b.eq	0x406728  // b.none
  4064f0:	aa0003ef 	mov	x15, x0
  4064f4:	12001c0c 	and	w12, w0, #0xff
  4064f8:	4b0600e0 	sub	w0, w7, w6
  4064fc:	7100001f 	cmp	w0, #0x0
  406500:	5400086d 	b.le	0x40660c
  406504:	b4001666 	cbz	x6, 0x4067d0
  406508:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  40650c:	eb0100ff 	cmp	x7, x1
  406510:	54002300 	b.eq	0x406970  // b.none
  406514:	b24d014a 	orr	x10, x10, #0x8000000000000
  406518:	d2800021 	mov	x1, #0x1                   	// #1
  40651c:	7101d01f 	cmp	w0, #0x74
  406520:	540001cc 	b.gt	0x406558
  406524:	7100fc1f 	cmp	w0, #0x3f
  406528:	540032ac 	b.gt	0x406b7c
  40652c:	52800801 	mov	w1, #0x40                  	// #64
  406530:	4b000021 	sub	w1, w1, w0
  406534:	9ac025c4 	lsr	x4, x14, x0
  406538:	9ac121ce 	lsl	x14, x14, x1
  40653c:	f10001df 	cmp	x14, #0x0
  406540:	9a9f07e3 	cset	x3, ne	// ne = any
  406544:	9ac12141 	lsl	x1, x10, x1
  406548:	aa040021 	orr	x1, x1, x4
  40654c:	9ac02546 	lsr	x6, x10, x0
  406550:	aa030021 	orr	x1, x1, x3
  406554:	cb060108 	sub	x8, x8, x6
  406558:	eb010121 	subs	x1, x9, x1
  40655c:	aa0103e9 	mov	x9, x1
  406560:	da1f0108 	sbc	x8, x8, xzr
  406564:	b6980928 	tbz	x8, #51, 0x406688
  406568:	9240c908 	and	x8, x8, #0x7ffffffffffff
  40656c:	b4002148 	cbz	x8, 0x406994
  406570:	dac01100 	clz	x0, x8
  406574:	51003000 	sub	w0, w0, #0xc
  406578:	93407c03 	sxtw	x3, w0
  40657c:	52800801 	mov	w1, #0x40                  	// #64
  406580:	4b000024 	sub	w4, w1, w0
  406584:	9ac02108 	lsl	x8, x8, x0
  406588:	9ac42524 	lsr	x4, x9, x4
  40658c:	aa080084 	orr	x4, x4, x8
  406590:	9ac02129 	lsl	x9, x9, x0
  406594:	eb03005f 	cmp	x2, x3
  406598:	5400272c 	b.gt	0x406a7c
  40659c:	4b020000 	sub	w0, w0, w2
  4065a0:	11000400 	add	w0, w0, #0x1
  4065a4:	4b000021 	sub	w1, w1, w0
  4065a8:	9ac02528 	lsr	x8, x9, x0
  4065ac:	9ac12129 	lsl	x9, x9, x1
  4065b0:	f100013f 	cmp	x9, #0x0
  4065b4:	9a9f07e9 	cset	x9, ne	// ne = any
  4065b8:	aa090109 	orr	x9, x8, x9
  4065bc:	9ac12081 	lsl	x1, x4, x1
  4065c0:	aa090029 	orr	x9, x1, x9
  4065c4:	9ac02488 	lsr	x8, x4, x0
  4065c8:	aa080120 	orr	x0, x9, x8
  4065cc:	b5001680 	cbnz	x0, 0x40689c
  4065d0:	2a0d03e5 	mov	w5, w13
  4065d4:	d2800006 	mov	x6, #0x0                   	// #0
  4065d8:	d2800007 	mov	x7, #0x0                   	// #0
  4065dc:	d2800002 	mov	x2, #0x0                   	// #0
  4065e0:	52800000 	mov	w0, #0x0                   	// #0
  4065e4:	9240bcc4 	and	x4, x6, #0xffffffffffff
  4065e8:	12003841 	and	w1, w2, #0x7fff
  4065ec:	d2800003 	mov	x3, #0x0                   	// #0
  4065f0:	2a053c21 	orr	w1, w1, w5, lsl #15
  4065f4:	b340bc83 	bfxil	x3, x4, #0, #48
  4065f8:	9e6700e0 	fmov	d0, x7
  4065fc:	b3503c23 	bfi	x3, x1, #48, #16
  406600:	9eaf0060 	fmov	v0.d[1], x3
  406604:	35000800 	cbnz	w0, 0x406704
  406608:	d65f03c0 	ret
  40660c:	54000f80 	b.eq	0x4067fc  // b.none
  406610:	b50027e7 	cbnz	x7, 0x406b0c
  406614:	aa090102 	orr	x2, x8, x9
  406618:	b40032c2 	cbz	x2, 0x406c70
  40661c:	2a2003e0 	mvn	w0, w0
  406620:	34004720 	cbz	w0, 0x406f04
  406624:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  406628:	eb0200df 	cmp	x6, x2
  40662c:	54003a60 	b.eq	0x406d78  // b.none
  406630:	d2800022 	mov	x2, #0x1                   	// #1
  406634:	7101d01f 	cmp	w0, #0x74
  406638:	540001cc 	b.gt	0x406670
  40663c:	7100fc1f 	cmp	w0, #0x3f
  406640:	5400406c 	b.gt	0x406e4c
  406644:	52800802 	mov	w2, #0x40                  	// #64
  406648:	4b000042 	sub	w2, w2, w0
  40664c:	9ac02524 	lsr	x4, x9, x0
  406650:	9ac22129 	lsl	x9, x9, x2
  406654:	f100013f 	cmp	x9, #0x0
  406658:	9a9f07e3 	cset	x3, ne	// ne = any
  40665c:	9ac22102 	lsl	x2, x8, x2
  406660:	aa040042 	orr	x2, x2, x4
  406664:	9ac02500 	lsr	x0, x8, x0
  406668:	aa030042 	orr	x2, x2, x3
  40666c:	cb00014a 	sub	x10, x10, x0
  406670:	eb0201c0 	subs	x0, x14, x2
  406674:	aa0f03ed 	mov	x13, x15
  406678:	aa0103e2 	mov	x2, x1
  40667c:	aa0003e9 	mov	x9, x0
  406680:	da1f0148 	sbc	x8, x10, xzr
  406684:	b79ff728 	tbnz	x8, #51, 0x406568
  406688:	92400920 	and	x0, x9, #0x7
  40668c:	b4006420 	cbz	x0, 0x407310
  406690:	926a0567 	and	x7, x11, #0xc00000
  406694:	f15000ff 	cmp	x7, #0x400, lsl #12
  406698:	54001fa0 	b.eq	0x406a8c  // b.none
  40669c:	f16000ff 	cmp	x7, #0x800, lsl #12
  4066a0:	54001e60 	b.eq	0x406a6c  // b.none
  4066a4:	52800200 	mov	w0, #0x10                  	// #16
  4066a8:	b5002647 	cbnz	x7, 0x406b70
  4066ac:	92400d20 	and	x0, x9, #0xf
  4066b0:	2a0d03e5 	mov	w5, w13
  4066b4:	f100101f 	cmp	x0, #0x4
  4066b8:	54002781 	b.ne	0x406ba8  // b.any
  4066bc:	52800200 	mov	w0, #0x10                  	// #16
  4066c0:	d343fd06 	lsr	x6, x8, #3
  4066c4:	93c90d07 	extr	x7, x8, x9, #3
  4066c8:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  4066cc:	eb01005f 	cmp	x2, x1
  4066d0:	54fff8a1 	b.ne	0x4065e4  // b.any
  4066d4:	aa0600e1 	orr	x1, x7, x6
  4066d8:	b4006141 	cbz	x1, 0x407300
  4066dc:	b25100c4 	orr	x4, x6, #0x800000000000
  4066e0:	528fffe1 	mov	w1, #0x7fff                	// #32767
  4066e4:	9240bc84 	and	x4, x4, #0xffffffffffff
  4066e8:	d2800003 	mov	x3, #0x0                   	// #0
  4066ec:	2a053c21 	orr	w1, w1, w5, lsl #15
  4066f0:	9e6700e0 	fmov	d0, x7
  4066f4:	b340bc83 	bfxil	x3, x4, #0, #48
  4066f8:	b3503c23 	bfi	x3, x1, #48, #16
  4066fc:	9eaf0060 	fmov	v0.d[1], x3
  406700:	34fff840 	cbz	w0, 0x406608
  406704:	d503233f 	paciasp
  406708:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  40670c:	910003fd 	mov	x29, sp
  406710:	3d8007e0 	str	q0, [sp, #16]
  406714:	940009eb 	bl	0x408ec0
  406718:	3dc007e0 	ldr	q0, [sp, #16]
  40671c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  406720:	d50323bf 	autiasp
  406724:	d65f03c0 	ret
  406728:	4b0600e0 	sub	w0, w7, w6
  40672c:	7100001f 	cmp	w0, #0x0
  406730:	54000e0d 	b.le	0x4068f0
  406734:	b5000a46 	cbnz	x6, 0x40687c
  406738:	aa0e0141 	orr	x1, x10, x14
  40673c:	b4002fc1 	cbz	x1, 0x406d34
  406740:	71000400 	subs	w0, w0, #0x1
  406744:	54002e00 	b.eq	0x406d04  // b.none
  406748:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  40674c:	eb0100ff 	cmp	x7, x1
  406750:	54001100 	b.eq	0x406970  // b.none
  406754:	d2800021 	mov	x1, #0x1                   	// #1
  406758:	7101d01f 	cmp	w0, #0x74
  40675c:	540001cc 	b.gt	0x406794
  406760:	7100fc1f 	cmp	w0, #0x3f
  406764:	540025cc 	b.gt	0x406c1c
  406768:	52800801 	mov	w1, #0x40                  	// #64
  40676c:	4b000021 	sub	w1, w1, w0
  406770:	9ac025c4 	lsr	x4, x14, x0
  406774:	9ac121ce 	lsl	x14, x14, x1
  406778:	f10001df 	cmp	x14, #0x0
  40677c:	9a9f07e3 	cset	x3, ne	// ne = any
  406780:	9ac12141 	lsl	x1, x10, x1
  406784:	aa040021 	orr	x1, x1, x4
  406788:	9ac02546 	lsr	x6, x10, x0
  40678c:	aa030021 	orr	x1, x1, x3
  406790:	8b060108 	add	x8, x8, x6
  406794:	ab090021 	adds	x1, x1, x9
  406798:	aa0103e9 	mov	x9, x1
  40679c:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
  4067a0:	b69ff748 	tbz	x8, #51, 0x406688
  4067a4:	91000442 	add	x2, x2, #0x1
  4067a8:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  4067ac:	eb00005f 	cmp	x2, x0
  4067b0:	54001ca0 	b.eq	0x406b44  // b.none
  4067b4:	92400120 	and	x0, x9, #0x1
  4067b8:	924cf901 	and	x1, x8, #0xfff7ffffffffffff
  4067bc:	aa490400 	orr	x0, x0, x9, lsr #1
  4067c0:	aa08fc09 	orr	x9, x0, x8, lsl #63
  4067c4:	d341fc28 	lsr	x8, x1, #1
  4067c8:	92400920 	and	x0, x9, #0x7
  4067cc:	17ffffb0 	b	0x40668c
  4067d0:	aa0e0141 	orr	x1, x10, x14
  4067d4:	b4000c61 	cbz	x1, 0x406960
  4067d8:	71000400 	subs	w0, w0, #0x1
  4067dc:	54002a40 	b.eq	0x406d24  // b.none
  4067e0:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  4067e4:	eb0100ff 	cmp	x7, x1
  4067e8:	54000c40 	b.eq	0x406970  // b.none
  4067ec:	d2800021 	mov	x1, #0x1                   	// #1
  4067f0:	7101d01f 	cmp	w0, #0x74
  4067f4:	54ffeb2c 	b.gt	0x406558
  4067f8:	17ffff4b 	b	0x406524
  4067fc:	910004e6 	add	x6, x7, #0x1
  406800:	f27f34df 	tst	x6, #0x7ffe
  406804:	54001741 	b.ne	0x406aec  // b.any
  406808:	aa090107 	orr	x7, x8, x9
  40680c:	aa0e0150 	orr	x16, x10, x14
  406810:	b5002442 	cbnz	x2, 0x406c98
  406814:	b4003667 	cbz	x7, 0x406ee0
  406818:	b4000f10 	cbz	x16, 0x4069f8
  40681c:	eb0e0123 	subs	x3, x9, x14
  406820:	aa0303e4 	mov	x4, x3
  406824:	da0a0101 	sbc	x1, x8, x10
  406828:	b69829c1 	tbz	x1, #51, 0x406d60
  40682c:	eb0901ce 	subs	x14, x14, x9
  406830:	2a0c03e5 	mov	w5, w12
  406834:	da080148 	sbc	x8, x10, x8
  406838:	aa0e03e9 	mov	x9, x14
  40683c:	aa0801c7 	orr	x7, x14, x8
  406840:	b4004027 	cbz	x7, 0x407044
  406844:	aa0f03ed 	mov	x13, x15
  406848:	924d0107 	and	x7, x8, #0x8000000000000
  40684c:	36580dcb 	tbz	w11, #11, 0x406a04
  406850:	52800100 	mov	w0, #0x8                   	// #8
  406854:	d2800002 	mov	x2, #0x0                   	// #0
  406858:	b4fff347 	cbz	x7, 0x4066c0
  40685c:	91000441 	add	x1, x2, #0x1
  406860:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  406864:	eb02003f 	cmp	x1, x2
  406868:	54000340 	b.eq	0x4068d0  // b.none
  40686c:	d343c904 	ubfx	x4, x8, #3, #48
  406870:	93c90d07 	extr	x7, x8, x9, #3
  406874:	12003821 	and	w1, w1, #0x7fff
  406878:	17ffff5d 	b	0x4065ec
  40687c:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  406880:	eb0100ff 	cmp	x7, x1
  406884:	54000760 	b.eq	0x406970  // b.none
  406888:	b24d014a 	orr	x10, x10, #0x8000000000000
  40688c:	d2800021 	mov	x1, #0x1                   	// #1
  406890:	7101d01f 	cmp	w0, #0x74
  406894:	54fff66d 	b.le	0x406760
  406898:	17ffffbf 	b	0x406794
  40689c:	f240093f 	tst	x9, #0x7
  4068a0:	54000ac0 	b.eq	0x4069f8  // b.none
  4068a4:	926a0560 	and	x0, x11, #0xc00000
  4068a8:	f150001f 	cmp	x0, #0x400, lsl #12
  4068ac:	540029c0 	b.eq	0x406de4  // b.none
  4068b0:	f160001f 	cmp	x0, #0x800, lsl #12
  4068b4:	54002a80 	b.eq	0x406e04  // b.none
  4068b8:	b4002820 	cbz	x0, 0x406dbc
  4068bc:	924d0107 	and	x7, x8, #0x8000000000000
  4068c0:	2a0d03e5 	mov	w5, w13
  4068c4:	52800300 	mov	w0, #0x18                  	// #24
  4068c8:	d2800002 	mov	x2, #0x0                   	// #0
  4068cc:	17ffffe3 	b	0x406858
  4068d0:	f26a056b 	ands	x11, x11, #0xc00000
  4068d4:	54000b41 	b.ne	0x406a3c  // b.any
  4068d8:	52800281 	mov	w1, #0x14                  	// #20
  4068dc:	2a010000 	orr	w0, w0, w1
  4068e0:	528fffe1 	mov	w1, #0x7fff                	// #32767
  4068e4:	d2800004 	mov	x4, #0x0                   	// #0
  4068e8:	d2800007 	mov	x7, #0x0                   	// #0
  4068ec:	17ffff40 	b	0x4065ec
  4068f0:	54000dc0 	b.eq	0x406aa8  // b.none
  4068f4:	b4001727 	cbz	x7, 0x406bd8
  4068f8:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  4068fc:	eb0200df 	cmp	x6, x2
  406900:	54002bc0 	b.eq	0x406e78  // b.none
  406904:	d2800022 	mov	x2, #0x1                   	// #1
  406908:	3101d01f 	cmn	w0, #0x74
  40690c:	5400020b 	b.lt	0x40694c  // b.tstop
  406910:	4b0003e0 	neg	w0, w0
  406914:	b24d0108 	orr	x8, x8, #0x8000000000000
  406918:	7100fc1f 	cmp	w0, #0x3f
  40691c:	5400328c 	b.gt	0x406f6c
  406920:	52800802 	mov	w2, #0x40                  	// #64
  406924:	4b000042 	sub	w2, w2, w0
  406928:	9ac02524 	lsr	x4, x9, x0
  40692c:	9ac22129 	lsl	x9, x9, x2
  406930:	f100013f 	cmp	x9, #0x0
  406934:	9a9f07e3 	cset	x3, ne	// ne = any
  406938:	9ac22102 	lsl	x2, x8, x2
  40693c:	aa040042 	orr	x2, x2, x4
  406940:	9ac02500 	lsr	x0, x8, x0
  406944:	aa030042 	orr	x2, x2, x3
  406948:	8b00014a 	add	x10, x10, x0
  40694c:	ab0e0040 	adds	x0, x2, x14
  406950:	aa0103e2 	mov	x2, x1
  406954:	aa0003e9 	mov	x9, x0
  406958:	9a8a3548 	cinc	x8, x10, cs	// cs = hs, nlast
  40695c:	17ffff91 	b	0x4067a0
  406960:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  406964:	eb0000ff 	cmp	x7, x0
  406968:	54000e41 	b.ne	0x406b30  // b.any
  40696c:	d503201f 	nop
  406970:	aa090107 	orr	x7, x8, x9
  406974:	b4000927 	cbz	x7, 0x406a98
  406978:	d372fd00 	lsr	x0, x8, #50
  40697c:	b3430904 	bfi	x4, x8, #61, #3
  406980:	d2400000 	eor	x0, x0, #0x1
  406984:	aa0403e7 	mov	x7, x4
  406988:	d343fd06 	lsr	x6, x8, #3
  40698c:	12000000 	and	w0, w0, #0x1
  406990:	17ffff4e 	b	0x4066c8
  406994:	dac01124 	clz	x4, x9
  406998:	1100d080 	add	w0, w4, #0x34
  40699c:	9100d083 	add	x3, x4, #0x34
  4069a0:	7100fc1f 	cmp	w0, #0x3f
  4069a4:	54ffdecd 	b.le	0x40657c
  4069a8:	51003084 	sub	w4, w4, #0xc
  4069ac:	9ac42124 	lsl	x4, x9, x4
  4069b0:	eb03005f 	cmp	x2, x3
  4069b4:	5400104c 	b.gt	0x406bbc
  4069b8:	4b020002 	sub	w2, w0, w2
  4069bc:	11000440 	add	w0, w2, #0x1
  4069c0:	7100fc1f 	cmp	w0, #0x3f
  4069c4:	54002ead 	b.le	0x406f98
  4069c8:	5100fc42 	sub	w2, w2, #0x3f
  4069cc:	9ac22489 	lsr	x9, x4, x2
  4069d0:	7101001f 	cmp	w0, #0x40
  4069d4:	540000e0 	b.eq	0x4069f0  // b.none
  4069d8:	52801001 	mov	w1, #0x80                  	// #128
  4069dc:	4b000020 	sub	w0, w1, w0
  4069e0:	9ac02084 	lsl	x4, x4, x0
  4069e4:	f100009f 	cmp	x4, #0x0
  4069e8:	9a9f07e0 	cset	x0, ne	// ne = any
  4069ec:	aa000129 	orr	x9, x9, x0
  4069f0:	aa0903e0 	mov	x0, x9
  4069f4:	17fffef6 	b	0x4065cc
  4069f8:	924d0107 	and	x7, x8, #0x8000000000000
  4069fc:	2a0d03e5 	mov	w5, w13
  406a00:	375ff28b 	tbnz	w11, #11, 0x406850
  406a04:	aa0803ea 	mov	x10, x8
  406a08:	aa0903ee 	mov	x14, x9
  406a0c:	d2800021 	mov	x1, #0x1                   	// #1
  406a10:	52800000 	mov	w0, #0x0                   	// #0
  406a14:	b5fff2c7 	cbnz	x7, 0x40686c
  406a18:	d343fd40 	lsr	x0, x10, #3
  406a1c:	d2800003 	mov	x3, #0x0                   	// #0
  406a20:	531100a5 	ubfiz	w5, w5, #15, #1
  406a24:	93ce0d42 	extr	x2, x10, x14, #3
  406a28:	b340bc03 	bfxil	x3, x0, #0, #48
  406a2c:	9e670040 	fmov	d0, x2
  406a30:	b3503ca3 	bfi	x3, x5, #48, #16
  406a34:	9eaf0060 	fmov	v0.d[1], x3
  406a38:	d65f03c0 	ret
  406a3c:	f150017f 	cmp	x11, #0x400, lsl #12
  406a40:	540016a0 	b.eq	0x406d14  // b.none
  406a44:	f160017f 	cmp	x11, #0x800, lsl #12
  406a48:	1a9f17e1 	cset	w1, eq	// eq = none
  406a4c:	6a0d003f 	tst	w1, w13
  406a50:	52800281 	mov	w1, #0x14                  	// #20
  406a54:	54001641 	b.ne	0x406d1c  // b.any
  406a58:	2a010000 	orr	w0, w0, w1
  406a5c:	92fc0006 	mov	x6, #0x1fffffffffffffff    	// #2305843009213693951
  406a60:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
  406a64:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  406a68:	17fffedf 	b	0x4065e4
  406a6c:	b50019cd 	cbnz	x13, 0x406da4
  406a70:	52800005 	mov	w5, #0x0                   	// #0
  406a74:	52800200 	mov	w0, #0x10                  	// #16
  406a78:	17ffff12 	b	0x4066c0
  406a7c:	cb030042 	sub	x2, x2, x3
  406a80:	924cf888 	and	x8, x4, #0xfff7ffffffffffff
  406a84:	92400920 	and	x0, x9, #0x7
  406a88:	17ffff01 	b	0x40668c
  406a8c:	b4000bcd 	cbz	x13, 0x406c04
  406a90:	52800025 	mov	w5, #0x1                   	// #1
  406a94:	17ffff0a 	b	0x4066bc
  406a98:	2a0203e1 	mov	w1, w2
  406a9c:	d2800004 	mov	x4, #0x0                   	// #0
  406aa0:	52800000 	mov	w0, #0x0                   	// #0
  406aa4:	17fffed2 	b	0x4065ec
  406aa8:	910004e6 	add	x6, x7, #0x1
  406aac:	f27f34df 	tst	x6, #0x7ffe
  406ab0:	54000cc1 	b.ne	0x406c48  // b.any
  406ab4:	aa090107 	orr	x7, x8, x9
  406ab8:	b5001fc2 	cbnz	x2, 0x406eb0
  406abc:	aa0e0141 	orr	x1, x10, x14
  406ac0:	b4002487 	cbz	x7, 0x406f50
  406ac4:	b4fff9a1 	cbz	x1, 0x4069f8
  406ac8:	ab0e0127 	adds	x7, x9, x14
  406acc:	9a080141 	adc	x1, x10, x8
  406ad0:	aa0703e4 	mov	x4, x7
  406ad4:	b6982ac1 	tbz	x1, #51, 0x40702c
  406ad8:	924cf824 	and	x4, x1, #0xfff7ffffffffffff
  406adc:	93c70c27 	extr	x7, x1, x7, #3
  406ae0:	d2800022 	mov	x2, #0x1                   	// #1
  406ae4:	d343fc86 	lsr	x6, x4, #3
  406ae8:	17fffebe 	b	0x4065e0
  406aec:	eb0e0121 	subs	x1, x9, x14
  406af0:	da0a0100 	sbc	x0, x8, x10
  406af4:	b7980fe0 	tbnz	x0, #51, 0x406cf0
  406af8:	aa000023 	orr	x3, x1, x0
  406afc:	b4001363 	cbz	x3, 0x406d68
  406b00:	aa0003e8 	mov	x8, x0
  406b04:	aa0103e9 	mov	x9, x1
  406b08:	17fffe99 	b	0x40656c
  406b0c:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  406b10:	eb0200df 	cmp	x6, x2
  406b14:	54001320 	b.eq	0x406d78  // b.none
  406b18:	d2800022 	mov	x2, #0x1                   	// #1
  406b1c:	3101d01f 	cmn	w0, #0x74
  406b20:	54ffda8b 	b.lt	0x406670  // b.tstop
  406b24:	4b0003e0 	neg	w0, w0
  406b28:	b24d0108 	orr	x8, x8, #0x8000000000000
  406b2c:	17fffec4 	b	0x40663c
  406b30:	b3430904 	bfi	x4, x8, #61, #3
  406b34:	d343fd06 	lsr	x6, x8, #3
  406b38:	aa0403e7 	mov	x7, x4
  406b3c:	52800000 	mov	w0, #0x0                   	// #0
  406b40:	17fffee2 	b	0x4066c8
  406b44:	f26a0567 	ands	x7, x11, #0xc00000
  406b48:	54001ea0 	b.eq	0x406f1c  // b.none
  406b4c:	f15000ff 	cmp	x7, #0x400, lsl #12
  406b50:	54002b00 	b.eq	0x4070b0  // b.none
  406b54:	f16000ff 	cmp	x7, #0x800, lsl #12
  406b58:	54002fc0 	b.eq	0x407150  // b.none
  406b5c:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  406b60:	aa0803e9 	mov	x9, x8
  406b64:	52800280 	mov	w0, #0x14                  	// #20
  406b68:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  406b6c:	d503201f 	nop
  406b70:	924d0107 	and	x7, x8, #0x8000000000000
  406b74:	2a0d03e5 	mov	w5, w13
  406b78:	17ffff38 	b	0x406858
  406b7c:	52801001 	mov	w1, #0x80                  	// #128
  406b80:	4b000021 	sub	w1, w1, w0
  406b84:	71010000 	subs	w0, w0, #0x40
  406b88:	9ac12141 	lsl	x1, x10, x1
  406b8c:	aa0101c1 	orr	x1, x14, x1
  406b90:	9a8e102e 	csel	x14, x1, x14, ne	// ne = any
  406b94:	9ac02540 	lsr	x0, x10, x0
  406b98:	f10001df 	cmp	x14, #0x0
  406b9c:	9a9f07e1 	cset	x1, ne	// ne = any
  406ba0:	aa000021 	orr	x1, x1, x0
  406ba4:	17fffe6d 	b	0x406558
  406ba8:	b1001129 	adds	x9, x9, #0x4
  406bac:	52800200 	mov	w0, #0x10                  	// #16
  406bb0:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
  406bb4:	924d0107 	and	x7, x8, #0x8000000000000
  406bb8:	17ffff28 	b	0x406858
  406bbc:	cb030042 	sub	x2, x2, x3
  406bc0:	924cf884 	and	x4, x4, #0xfff7ffffffffffff
  406bc4:	d343fc86 	lsr	x6, x4, #3
  406bc8:	93c80c87 	extr	x7, x4, x8, #3
  406bcc:	2a0d03e5 	mov	w5, w13
  406bd0:	52800000 	mov	w0, #0x0                   	// #0
  406bd4:	17fffebd 	b	0x4066c8
  406bd8:	aa090102 	orr	x2, x8, x9
  406bdc:	b4001a82 	cbz	x2, 0x406f2c
  406be0:	2a2003e0 	mvn	w0, w0
  406be4:	340021a0 	cbz	w0, 0x407018
  406be8:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  406bec:	eb0200df 	cmp	x6, x2
  406bf0:	54001440 	b.eq	0x406e78  // b.none
  406bf4:	d2800022 	mov	x2, #0x1                   	// #1
  406bf8:	7101d01f 	cmp	w0, #0x74
  406bfc:	54ffea8c 	b.gt	0x40694c
  406c00:	17ffff46 	b	0x406918
  406c04:	b1002129 	adds	x9, x9, #0x8
  406c08:	52800005 	mov	w5, #0x0                   	// #0
  406c0c:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
  406c10:	52800200 	mov	w0, #0x10                  	// #16
  406c14:	924d0107 	and	x7, x8, #0x8000000000000
  406c18:	17ffff10 	b	0x406858
  406c1c:	52801001 	mov	w1, #0x80                  	// #128
  406c20:	4b000021 	sub	w1, w1, w0
  406c24:	71010000 	subs	w0, w0, #0x40
  406c28:	9ac12141 	lsl	x1, x10, x1
  406c2c:	aa0101c1 	orr	x1, x14, x1
  406c30:	9a8e102e 	csel	x14, x1, x14, ne	// ne = any
  406c34:	9ac02540 	lsr	x0, x10, x0
  406c38:	f10001df 	cmp	x14, #0x0
  406c3c:	9a9f07e1 	cset	x1, ne	// ne = any
  406c40:	aa000021 	orr	x1, x1, x0
  406c44:	17fffed4 	b	0x406794
  406c48:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  406c4c:	eb0000df 	cmp	x6, x0
  406c50:	54001ac0 	b.eq	0x406fa8  // b.none
  406c54:	ab0e012e 	adds	x14, x9, x14
  406c58:	aa0603e2 	mov	x2, x6
  406c5c:	9a080146 	adc	x6, x10, x8
  406c60:	d3410dc0 	ubfx	x0, x14, #1, #3
  406c64:	d341fcc8 	lsr	x8, x6, #1
  406c68:	93ce04c9 	extr	x9, x6, x14, #1
  406c6c:	17fffe88 	b	0x40668c
  406c70:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  406c74:	eb0000df 	cmp	x6, x0
  406c78:	54000800 	b.eq	0x406d78  // b.none
  406c7c:	b3430943 	bfi	x3, x10, #61, #3
  406c80:	d343fd46 	lsr	x6, x10, #3
  406c84:	aa0303e7 	mov	x7, x3
  406c88:	2a0c03e5 	mov	w5, w12
  406c8c:	aa0103e2 	mov	x2, x1
  406c90:	52800000 	mov	w0, #0x0                   	// #0
  406c94:	17fffe8d 	b	0x4066c8
  406c98:	d28fffe6 	mov	x6, #0x7fff                	// #32767
  406c9c:	eb06005f 	cmp	x2, x6
  406ca0:	540019a0 	b.eq	0x406fd4  // b.none
  406ca4:	eb06003f 	cmp	x1, x6
  406ca8:	54001f80 	b.eq	0x407098  // b.none
  406cac:	b40019a7 	cbz	x7, 0x406fe0
  406cb0:	d3430907 	lsl	x7, x8, #61
  406cb4:	d343fd06 	lsr	x6, x8, #3
  406cb8:	b4001db0 	cbz	x16, 0x40706c
  406cbc:	9240f084 	and	x4, x4, #0x1fffffffffffffff
  406cc0:	aa070087 	orr	x7, x4, x7
  406cc4:	b67800e6 	tbz	x6, #47, 0x406ce0
  406cc8:	d343fd41 	lsr	x1, x10, #3
  406ccc:	b79000aa 	tbnz	x10, #50, 0x406ce0
  406cd0:	b3430943 	bfi	x3, x10, #61, #3
  406cd4:	2a0c03e5 	mov	w5, w12
  406cd8:	aa0303e7 	mov	x7, x3
  406cdc:	aa0103e6 	mov	x6, x1
  406ce0:	93c7f4c4 	extr	x4, x6, x7, #61
  406ce4:	b3430887 	bfi	x7, x4, #61, #3
  406ce8:	d343fc86 	lsr	x6, x4, #3
  406cec:	17fffe7a 	b	0x4066d4
  406cf0:	eb0901ce 	subs	x14, x14, x9
  406cf4:	aa0f03ed 	mov	x13, x15
  406cf8:	aa0e03e9 	mov	x9, x14
  406cfc:	da080148 	sbc	x8, x10, x8
  406d00:	17fffe1b 	b	0x40656c
  406d04:	ab0e012e 	adds	x14, x9, x14
  406d08:	aa0e03e9 	mov	x9, x14
  406d0c:	9a080148 	adc	x8, x10, x8
  406d10:	17fffea4 	b	0x4067a0
  406d14:	52800281 	mov	w1, #0x14                  	// #20
  406d18:	b5ffea0d 	cbnz	x13, 0x406a58
  406d1c:	2a010000 	orr	w0, w0, w1
  406d20:	17fffef0 	b	0x4068e0
  406d24:	eb0e012e 	subs	x14, x9, x14
  406d28:	aa0e03e9 	mov	x9, x14
  406d2c:	da0a0108 	sbc	x8, x8, x10
  406d30:	17fffe0d 	b	0x406564
  406d34:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  406d38:	eb0000ff 	cmp	x7, x0
  406d3c:	54ffefa1 	b.ne	0x406b30  // b.any
  406d40:	aa090107 	orr	x7, x8, x9
  406d44:	b4ffeaa7 	cbz	x7, 0x406a98
  406d48:	d372fd00 	lsr	x0, x8, #50
  406d4c:	b3430904 	bfi	x4, x8, #61, #3
  406d50:	aa0403e7 	mov	x7, x4
  406d54:	52000000 	eor	w0, w0, #0x1
  406d58:	d343fd06 	lsr	x6, x8, #3
  406d5c:	17fffe5b 	b	0x4066c8
  406d60:	aa010063 	orr	x3, x3, x1
  406d64:	b5001683 	cbnz	x3, 0x407034
  406d68:	926a056b 	and	x11, x11, #0xc00000
  406d6c:	f160017f 	cmp	x11, #0x800, lsl #12
  406d70:	1a9f17e5 	cset	w5, eq	// eq = none
  406d74:	17fffe18 	b	0x4065d4
  406d78:	aa0e0147 	orr	x7, x10, x14
  406d7c:	b4000927 	cbz	x7, 0x406ea0
  406d80:	d372fd40 	lsr	x0, x10, #50
  406d84:	b3430943 	bfi	x3, x10, #61, #3
  406d88:	d2400000 	eor	x0, x0, #0x1
  406d8c:	aa0303e7 	mov	x7, x3
  406d90:	2a0c03e5 	mov	w5, w12
  406d94:	aa0103e2 	mov	x2, x1
  406d98:	12000000 	and	w0, w0, #0x1
  406d9c:	d343fd46 	lsr	x6, x10, #3
  406da0:	17fffe4a 	b	0x4066c8
  406da4:	b1002129 	adds	x9, x9, #0x8
  406da8:	52800025 	mov	w5, #0x1                   	// #1
  406dac:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
  406db0:	52800200 	mov	w0, #0x10                  	// #16
  406db4:	924d0107 	and	x7, x8, #0x8000000000000
  406db8:	17fffea8 	b	0x406858
  406dbc:	92400d20 	and	x0, x9, #0xf
  406dc0:	2a0d03e5 	mov	w5, w13
  406dc4:	f100101f 	cmp	x0, #0x4
  406dc8:	54000160 	b.eq	0x406df4  // b.none
  406dcc:	b1001129 	adds	x9, x9, #0x4
  406dd0:	52800300 	mov	w0, #0x18                  	// #24
  406dd4:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
  406dd8:	d2800002 	mov	x2, #0x0                   	// #0
  406ddc:	924d0107 	and	x7, x8, #0x8000000000000
  406de0:	17fffe9e 	b	0x406858
  406de4:	b50002ad 	cbnz	x13, 0x406e38
  406de8:	b1002129 	adds	x9, x9, #0x8
  406dec:	52800005 	mov	w5, #0x0                   	// #0
  406df0:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
  406df4:	924d0107 	and	x7, x8, #0x8000000000000
  406df8:	52800300 	mov	w0, #0x18                  	// #24
  406dfc:	d2800002 	mov	x2, #0x0                   	// #0
  406e00:	17fffe96 	b	0x406858
  406e04:	b400010d 	cbz	x13, 0x406e24
  406e08:	b1002129 	adds	x9, x9, #0x8
  406e0c:	52800025 	mov	w5, #0x1                   	// #1
  406e10:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
  406e14:	52800300 	mov	w0, #0x18                  	// #24
  406e18:	924d0107 	and	x7, x8, #0x8000000000000
  406e1c:	d2800002 	mov	x2, #0x0                   	// #0
  406e20:	17fffe8e 	b	0x406858
  406e24:	924d0107 	and	x7, x8, #0x8000000000000
  406e28:	52800005 	mov	w5, #0x0                   	// #0
  406e2c:	52800300 	mov	w0, #0x18                  	// #24
  406e30:	d2800002 	mov	x2, #0x0                   	// #0
  406e34:	17fffe89 	b	0x406858
  406e38:	924d0107 	and	x7, x8, #0x8000000000000
  406e3c:	52800025 	mov	w5, #0x1                   	// #1
  406e40:	52800300 	mov	w0, #0x18                  	// #24
  406e44:	d2800002 	mov	x2, #0x0                   	// #0
  406e48:	17fffe84 	b	0x406858
  406e4c:	52801002 	mov	w2, #0x80                  	// #128
  406e50:	4b000042 	sub	w2, w2, w0
  406e54:	71010000 	subs	w0, w0, #0x40
  406e58:	9ac22102 	lsl	x2, x8, x2
  406e5c:	aa020122 	orr	x2, x9, x2
  406e60:	9a891049 	csel	x9, x2, x9, ne	// ne = any
  406e64:	9ac02500 	lsr	x0, x8, x0
  406e68:	f100013f 	cmp	x9, #0x0
  406e6c:	9a9f07e2 	cset	x2, ne	// ne = any
  406e70:	aa000042 	orr	x2, x2, x0
  406e74:	17fffdff 	b	0x406670
  406e78:	aa0e0147 	orr	x7, x10, x14
  406e7c:	b4000147 	cbz	x7, 0x406ea4
  406e80:	d372fd40 	lsr	x0, x10, #50
  406e84:	b3430943 	bfi	x3, x10, #61, #3
  406e88:	d2400000 	eor	x0, x0, #0x1
  406e8c:	aa0303e7 	mov	x7, x3
  406e90:	aa0103e2 	mov	x2, x1
  406e94:	12000000 	and	w0, w0, #0x1
  406e98:	d343fd46 	lsr	x6, x10, #3
  406e9c:	17fffe0b 	b	0x4066c8
  406ea0:	2a0c03e5 	mov	w5, w12
  406ea4:	d2800004 	mov	x4, #0x0                   	// #0
  406ea8:	52800000 	mov	w0, #0x0                   	// #0
  406eac:	17fffdd0 	b	0x4065ec
  406eb0:	d28fffe6 	mov	x6, #0x7fff                	// #32767
  406eb4:	eb06005f 	cmp	x2, x6
  406eb8:	54000e20 	b.eq	0x40707c  // b.none
  406ebc:	eb06003f 	cmp	x1, x6
  406ec0:	540013e0 	b.eq	0x40713c  // b.none
  406ec4:	aa0e0142 	orr	x2, x10, x14
  406ec8:	b5001067 	cbnz	x7, 0x4070d4
  406ecc:	b3430943 	bfi	x3, x10, #61, #3
  406ed0:	d343fd46 	lsr	x6, x10, #3
  406ed4:	aa0303e7 	mov	x7, x3
  406ed8:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  406edc:	17fffdfb 	b	0x4066c8
  406ee0:	b4fff450 	cbz	x16, 0x406d68
  406ee4:	2a0c03e5 	mov	w5, w12
  406ee8:	365fd98b 	tbz	w11, #11, 0x406a18
  406eec:	aa0a03e8 	mov	x8, x10
  406ef0:	aa0e03e9 	mov	x9, x14
  406ef4:	aa0f03ed 	mov	x13, x15
  406ef8:	52800100 	mov	w0, #0x8                   	// #8
  406efc:	d2800002 	mov	x2, #0x0                   	// #0
  406f00:	17fffe56 	b	0x406858
  406f04:	eb0901ce 	subs	x14, x14, x9
  406f08:	aa0603e2 	mov	x2, x6
  406f0c:	aa0e03e9 	mov	x9, x14
  406f10:	da080148 	sbc	x8, x10, x8
  406f14:	aa0f03ed 	mov	x13, x15
  406f18:	17fffd93 	b	0x406564
  406f1c:	2a0203e1 	mov	w1, w2
  406f20:	d2800004 	mov	x4, #0x0                   	// #0
  406f24:	52800280 	mov	w0, #0x14                  	// #20
  406f28:	17fffdb1 	b	0x4065ec
  406f2c:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  406f30:	eb0000df 	cmp	x6, x0
  406f34:	54fffa20 	b.eq	0x406e78  // b.none
  406f38:	b3430943 	bfi	x3, x10, #61, #3
  406f3c:	d343fd46 	lsr	x6, x10, #3
  406f40:	aa0303e7 	mov	x7, x3
  406f44:	aa0103e2 	mov	x2, x1
  406f48:	52800000 	mov	w0, #0x0                   	// #0
  406f4c:	17fffddf 	b	0x4066c8
  406f50:	b4ffb421 	cbz	x1, 0x4065d4
  406f54:	365fd62b 	tbz	w11, #11, 0x406a18
  406f58:	aa0a03e8 	mov	x8, x10
  406f5c:	aa0e03e9 	mov	x9, x14
  406f60:	52800100 	mov	w0, #0x8                   	// #8
  406f64:	d2800002 	mov	x2, #0x0                   	// #0
  406f68:	17fffe3c 	b	0x406858
  406f6c:	52801002 	mov	w2, #0x80                  	// #128
  406f70:	4b000042 	sub	w2, w2, w0
  406f74:	71010000 	subs	w0, w0, #0x40
  406f78:	9ac22102 	lsl	x2, x8, x2
  406f7c:	aa020122 	orr	x2, x9, x2
  406f80:	9a891049 	csel	x9, x2, x9, ne	// ne = any
  406f84:	9ac02500 	lsr	x0, x8, x0
  406f88:	f100013f 	cmp	x9, #0x0
  406f8c:	9a9f07e2 	cset	x2, ne	// ne = any
  406f90:	aa000042 	orr	x2, x2, x0
  406f94:	17fffe6e 	b	0x40694c
  406f98:	52800801 	mov	w1, #0x40                  	// #64
  406f9c:	d2800009 	mov	x9, #0x0                   	// #0
  406fa0:	4b000021 	sub	w1, w1, w0
  406fa4:	17fffd85 	b	0x4065b8
  406fa8:	f26a0567 	ands	x7, x11, #0xc00000
  406fac:	54000ac0 	b.eq	0x407104  // b.none
  406fb0:	f15000ff 	cmp	x7, #0x400, lsl #12
  406fb4:	540012e0 	b.eq	0x407210  // b.none
  406fb8:	f16000ff 	cmp	x7, #0x800, lsl #12
  406fbc:	54001620 	b.eq	0x407280  // b.none
  406fc0:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  406fc4:	52800280 	mov	w0, #0x14                  	// #20
  406fc8:	aa0803e9 	mov	x9, x8
  406fcc:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  406fd0:	17fffee8 	b	0x406b70
  406fd4:	b5000a07 	cbnz	x7, 0x407114
  406fd8:	eb02003f 	cmp	x1, x2
  406fdc:	540000e0 	b.eq	0x406ff8  // b.none
  406fe0:	b5000130 	cbnz	x16, 0x407004
  406fe4:	52800005 	mov	w5, #0x0                   	// #0
  406fe8:	92ffffe6 	mov	x6, #0xffffffffffff        	// #281474976710655
  406fec:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
  406ff0:	52800020 	mov	w0, #0x1                   	// #1
  406ff4:	17fffdba 	b	0x4066dc
  406ff8:	b4ffff70 	cbz	x16, 0x406fe4
  406ffc:	b7900d2a 	tbnz	x10, #50, 0x4071a0
  407000:	52800020 	mov	w0, #0x1                   	// #1
  407004:	b3430943 	bfi	x3, x10, #61, #3
  407008:	d343fd46 	lsr	x6, x10, #3
  40700c:	aa0303e7 	mov	x7, x3
  407010:	2a0c03e5 	mov	w5, w12
  407014:	17fffdb0 	b	0x4066d4
  407018:	ab0e012e 	adds	x14, x9, x14
  40701c:	aa0603e2 	mov	x2, x6
  407020:	aa0e03e9 	mov	x9, x14
  407024:	9a080148 	adc	x8, x10, x8
  407028:	17fffdde 	b	0x4067a0
  40702c:	aa0100e7 	orr	x7, x7, x1
  407030:	b40000a7 	cbz	x7, 0x407044
  407034:	37580a8b 	tbnz	w11, #11, 0x407184
  407038:	aa0103ea 	mov	x10, x1
  40703c:	aa0403ee 	mov	x14, x4
  407040:	17fffe76 	b	0x406a18
  407044:	d2800006 	mov	x6, #0x0                   	// #0
  407048:	17fffda0 	b	0x4066c8
  40704c:	b7900fc8 	tbnz	x8, #50, 0x407244
  407050:	eb02003f 	cmp	x1, x2
  407054:	540014c0 	b.eq	0x4072ec  // b.none
  407058:	aa0e014e 	orr	x14, x10, x14
  40705c:	d3430907 	lsl	x7, x8, #61
  407060:	d343fd06 	lsr	x6, x8, #3
  407064:	b500064e 	cbnz	x14, 0x40712c
  407068:	52800020 	mov	w0, #0x1                   	// #1
  40706c:	9240f084 	and	x4, x4, #0x1fffffffffffffff
  407070:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  407074:	aa070087 	orr	x7, x4, x7
  407078:	17fffd94 	b	0x4066c8
  40707c:	b5fffe87 	cbnz	x7, 0x40704c
  407080:	eb02003f 	cmp	x1, x2
  407084:	540010c0 	b.eq	0x40729c  // b.none
  407088:	b3430943 	bfi	x3, x10, #61, #3
  40708c:	d343fd46 	lsr	x6, x10, #3
  407090:	aa0303e7 	mov	x7, x3
  407094:	17fffd8d 	b	0x4066c8
  407098:	b5000810 	cbnz	x16, 0x407198
  40709c:	b4fffa47 	cbz	x7, 0x406fe4
  4070a0:	b3430904 	bfi	x4, x8, #61, #3
  4070a4:	d343fd06 	lsr	x6, x8, #3
  4070a8:	aa0403e7 	mov	x7, x4
  4070ac:	17fffd8a 	b	0x4066d4
  4070b0:	b50005ed 	cbnz	x13, 0x40716c
  4070b4:	2a0203e1 	mov	w1, w2
  4070b8:	52800005 	mov	w5, #0x0                   	// #0
  4070bc:	d2800004 	mov	x4, #0x0                   	// #0
  4070c0:	d2800007 	mov	x7, #0x0                   	// #0
  4070c4:	52800280 	mov	w0, #0x14                  	// #20
  4070c8:	17fffd49 	b	0x4065ec
  4070cc:	b79009aa 	tbnz	x10, #50, 0x407200
  4070d0:	52800020 	mov	w0, #0x1                   	// #1
  4070d4:	d3430907 	lsl	x7, x8, #61
  4070d8:	d343fd06 	lsr	x6, x8, #3
  4070dc:	b4fffc82 	cbz	x2, 0x40706c
  4070e0:	9240f084 	and	x4, x4, #0x1fffffffffffffff
  4070e4:	aa070087 	orr	x7, x4, x7
  4070e8:	b67fdfc6 	tbz	x6, #47, 0x406ce0
  4070ec:	d343fd41 	lsr	x1, x10, #3
  4070f0:	b797df8a 	tbnz	x10, #50, 0x406ce0
  4070f4:	9240f067 	and	x7, x3, #0x1fffffffffffffff
  4070f8:	aa0103e6 	mov	x6, x1
  4070fc:	aa0af4e7 	orr	x7, x7, x10, lsl #61
  407100:	17fffef8 	b	0x406ce0
  407104:	2a0603e1 	mov	w1, w6
  407108:	d2800004 	mov	x4, #0x0                   	// #0
  40710c:	52800280 	mov	w0, #0x14                  	// #20
  407110:	17fffd37 	b	0x4065ec
  407114:	b7900528 	tbnz	x8, #50, 0x4071b8
  407118:	eb02003f 	cmp	x1, x2
  40711c:	540006c0 	b.eq	0x4071f4  // b.none
  407120:	d3430907 	lsl	x7, x8, #61
  407124:	d343fd06 	lsr	x6, x8, #3
  407128:	b4fffa10 	cbz	x16, 0x407068
  40712c:	9240f084 	and	x4, x4, #0x1fffffffffffffff
  407130:	52800020 	mov	w0, #0x1                   	// #1
  407134:	aa070087 	orr	x7, x4, x7
  407138:	17fffeea 	b	0x406ce0
  40713c:	aa0e0142 	orr	x2, x10, x14
  407140:	b50004c2 	cbnz	x2, 0x4071d8
  407144:	b5fffae7 	cbnz	x7, 0x4070a0
  407148:	d2800004 	mov	x4, #0x0                   	// #0
  40714c:	17fffd28 	b	0x4065ec
  407150:	b50008cd 	cbnz	x13, 0x407268
  407154:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  407158:	52800005 	mov	w5, #0x0                   	// #0
  40715c:	aa0803e9 	mov	x9, x8
  407160:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  407164:	52800280 	mov	w0, #0x14                  	// #20
  407168:	17fffdbd 	b	0x40685c
  40716c:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  407170:	52800025 	mov	w5, #0x1                   	// #1
  407174:	aa0803e9 	mov	x9, x8
  407178:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  40717c:	52800280 	mov	w0, #0x14                  	// #20
  407180:	17fffdb7 	b	0x40685c
  407184:	aa0103e8 	mov	x8, x1
  407188:	aa0403e9 	mov	x9, x4
  40718c:	d2800007 	mov	x7, #0x0                   	// #0
  407190:	52800100 	mov	w0, #0x8                   	// #8
  407194:	17fffdb0 	b	0x406854
  407198:	b69004aa 	tbz	x10, #50, 0x40722c
  40719c:	b5000327 	cbnz	x7, 0x407200
  4071a0:	9240f067 	and	x7, x3, #0x1fffffffffffffff
  4071a4:	d343fd46 	lsr	x6, x10, #3
  4071a8:	aa0af4e7 	orr	x7, x7, x10, lsl #61
  4071ac:	2a0c03e5 	mov	w5, w12
  4071b0:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  4071b4:	17fffd45 	b	0x4066c8
  4071b8:	eb02003f 	cmp	x1, x2
  4071bc:	540007e0 	b.eq	0x4072b8  // b.none
  4071c0:	d3430907 	lsl	x7, x8, #61
  4071c4:	d343fd06 	lsr	x6, x8, #3
  4071c8:	b4fff530 	cbz	x16, 0x40706c
  4071cc:	9240f084 	and	x4, x4, #0x1fffffffffffffff
  4071d0:	aa070087 	orr	x7, x4, x7
  4071d4:	17fffebd 	b	0x406cc8
  4071d8:	b69006ca 	tbz	x10, #50, 0x4072b0
  4071dc:	b5000127 	cbnz	x7, 0x407200
  4071e0:	9240f067 	and	x7, x3, #0x1fffffffffffffff
  4071e4:	d343fd46 	lsr	x6, x10, #3
  4071e8:	aa0af4e7 	orr	x7, x7, x10, lsl #61
  4071ec:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  4071f0:	17fffd36 	b	0x4066c8
  4071f4:	b40006b0 	cbz	x16, 0x4072c8
  4071f8:	52800020 	mov	w0, #0x1                   	// #1
  4071fc:	b697d5aa 	tbz	x10, #50, 0x406cb0
  407200:	9240f087 	and	x7, x4, #0x1fffffffffffffff
  407204:	d343fd06 	lsr	x6, x8, #3
  407208:	aa08f4e7 	orr	x7, x7, x8, lsl #61
  40720c:	17fffeb5 	b	0x406ce0
  407210:	b5fffaed 	cbnz	x13, 0x40716c
  407214:	2a0603e1 	mov	w1, w6
  407218:	52800005 	mov	w5, #0x0                   	// #0
  40721c:	d2800004 	mov	x4, #0x0                   	// #0
  407220:	d2800007 	mov	x7, #0x0                   	// #0
  407224:	52800280 	mov	w0, #0x14                  	// #20
  407228:	17fffcf1 	b	0x4065ec
  40722c:	52800020 	mov	w0, #0x1                   	// #1
  407230:	b4ffeea7 	cbz	x7, 0x407004
  407234:	d3430907 	lsl	x7, x8, #61
  407238:	d343fd06 	lsr	x6, x8, #3
  40723c:	52800020 	mov	w0, #0x1                   	// #1
  407240:	17fffe9f 	b	0x406cbc
  407244:	eb02003f 	cmp	x1, x2
  407248:	54000440 	b.eq	0x4072d0  // b.none
  40724c:	aa0e014e 	orr	x14, x10, x14
  407250:	d3430907 	lsl	x7, x8, #61
  407254:	d343fd06 	lsr	x6, x8, #3
  407258:	b4fff0ae 	cbz	x14, 0x40706c
  40725c:	9240f084 	and	x4, x4, #0x1fffffffffffffff
  407260:	aa070087 	orr	x7, x4, x7
  407264:	17ffffa2 	b	0x4070ec
  407268:	2a0203e1 	mov	w1, w2
  40726c:	52800025 	mov	w5, #0x1                   	// #1
  407270:	d2800004 	mov	x4, #0x0                   	// #0
  407274:	d2800007 	mov	x7, #0x0                   	// #0
  407278:	52800280 	mov	w0, #0x14                  	// #20
  40727c:	17fffcdc 	b	0x4065ec
  407280:	b4fff6ad 	cbz	x13, 0x407154
  407284:	2a0603e1 	mov	w1, w6
  407288:	52800025 	mov	w5, #0x1                   	// #1
  40728c:	d2800004 	mov	x4, #0x0                   	// #0
  407290:	d2800007 	mov	x7, #0x0                   	// #0
  407294:	52800280 	mov	w0, #0x14                  	// #20
  407298:	17fffcd5 	b	0x4065ec
  40729c:	aa0e0147 	orr	x7, x10, x14
  4072a0:	b4fff547 	cbz	x7, 0x407148
  4072a4:	b797f9ea 	tbnz	x10, #50, 0x4071e0
  4072a8:	52800020 	mov	w0, #0x1                   	// #1
  4072ac:	17ffff08 	b	0x406ecc
  4072b0:	52800020 	mov	w0, #0x1                   	// #1
  4072b4:	17ffff04 	b	0x406ec4
  4072b8:	b4ffef50 	cbz	x16, 0x4070a0
  4072bc:	b797fa2a 	tbnz	x10, #50, 0x407200
  4072c0:	52800020 	mov	w0, #0x1                   	// #1
  4072c4:	17fffe7b 	b	0x406cb0
  4072c8:	52800020 	mov	w0, #0x1                   	// #1
  4072cc:	17ffff75 	b	0x4070a0
  4072d0:	aa0e0142 	orr	x2, x10, x14
  4072d4:	b5ffefc2 	cbnz	x2, 0x4070cc
  4072d8:	9240f087 	and	x7, x4, #0x1fffffffffffffff
  4072dc:	d343fd06 	lsr	x6, x8, #3
  4072e0:	aa08f4e7 	orr	x7, x7, x8, lsl #61
  4072e4:	aa0103e2 	mov	x2, x1
  4072e8:	17fffcf8 	b	0x4066c8
  4072ec:	aa0e0142 	orr	x2, x10, x14
  4072f0:	b4fffec2 	cbz	x2, 0x4072c8
  4072f4:	52800020 	mov	w0, #0x1                   	// #1
  4072f8:	b697eeea 	tbz	x10, #50, 0x4070d4
  4072fc:	17ffffc1 	b	0x407200
  407300:	d2800007 	mov	x7, #0x0                   	// #0
  407304:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407308:	d2800004 	mov	x4, #0x0                   	// #0
  40730c:	17fffcb8 	b	0x4065ec
  407310:	aa0803e4 	mov	x4, x8
  407314:	aa0903e8 	mov	x8, x9
  407318:	17fffe2b 	b	0x406bc4
  40731c:	d503201f 	nop
  407320:	d503245f 	bti	c
  407324:	9e66000a 	fmov	x10, d0
  407328:	9eae000b 	fmov	x11, v0.d[1]
  40732c:	9e660022 	fmov	x2, d1
  407330:	9eae0023 	fmov	x3, v1.d[1]
  407334:	d53b4400 	mrs	x0, fpcr
  407338:	d37ffd65 	lsr	x5, x11, #63
  40733c:	d37ffc64 	lsr	x4, x3, #63
  407340:	d370f966 	ubfx	x6, x11, #48, #15
  407344:	aa0203e9 	mov	x9, x2
  407348:	12001ca5 	and	w5, w5, #0xff
  40734c:	12001c84 	and	w4, w4, #0xff
  407350:	d340bd61 	ubfx	x1, x11, #0, #48
  407354:	d340bc6c 	ubfx	x12, x3, #0, #48
  407358:	d370f860 	ubfx	x0, x3, #48, #15
  40735c:	d28fffe7 	mov	x7, #0x7fff                	// #32767
  407360:	eb0700df 	cmp	x6, x7
  407364:	540003e0 	b.eq	0x4073e0  // b.none
  407368:	eb07001f 	cmp	x0, x7
  40736c:	540001c0 	b.eq	0x4073a4  // b.none
  407370:	eb0000df 	cmp	x6, x0
  407374:	540004c1 	b.ne	0x40740c  // b.any
  407378:	eb0c003f 	cmp	x1, x12
  40737c:	fa420140 	ccmp	x10, x2, #0x0, eq	// eq = none
  407380:	54000461 	b.ne	0x40740c  // b.any
  407384:	52800000 	mov	w0, #0x0                   	// #0
  407388:	6b0400bf 	cmp	w5, w4
  40738c:	54000440 	b.eq	0x407414  // b.none
  407390:	b50003e6 	cbnz	x6, 0x40740c
  407394:	aa0a0021 	orr	x1, x1, x10
  407398:	f100003f 	cmp	x1, #0x0
  40739c:	1a9f07e0 	cset	w0, ne	// ne = any
  4073a0:	d65f03c0 	ret
  4073a4:	aa020189 	orr	x9, x12, x2
  4073a8:	b4000329 	cbz	x9, 0x40740c
  4073ac:	f100013f 	cmp	x9, #0x0
  4073b0:	b240bbe0 	mov	x0, #0x7fffffffffff        	// #140737488355327
  4073b4:	fa401182 	ccmp	x12, x0, #0x2, ne	// ne = any
  4073b8:	540002a8 	b.hi	0x40740c  // b.pmore
  4073bc:	d503233f 	paciasp
  4073c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4073c4:	52800020 	mov	w0, #0x1                   	// #1
  4073c8:	910003fd 	mov	x29, sp
  4073cc:	940006bd 	bl	0x408ec0
  4073d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4073d4:	d50323bf 	autiasp
  4073d8:	52800020 	mov	w0, #0x1                   	// #1
  4073dc:	d65f03c0 	ret
  4073e0:	aa0a0028 	orr	x8, x1, x10
  4073e4:	b4000108 	cbz	x8, 0x407404
  4073e8:	b240bbe2 	mov	x2, #0x7fffffffffff        	// #140737488355327
  4073ec:	eb02003f 	cmp	x1, x2
  4073f0:	54fffe69 	b.ls	0x4073bc  // b.plast
  4073f4:	eb06001f 	cmp	x0, x6
  4073f8:	540000a1 	b.ne	0x40740c  // b.any
  4073fc:	aa090189 	orr	x9, x12, x9
  407400:	17ffffeb 	b	0x4073ac
  407404:	eb06001f 	cmp	x0, x6
  407408:	54000080 	b.eq	0x407418  // b.none
  40740c:	52800020 	mov	w0, #0x1                   	// #1
  407410:	d65f03c0 	ret
  407414:	d65f03c0 	ret
  407418:	aa020189 	orr	x9, x12, x2
  40741c:	b5fffc89 	cbnz	x9, 0x4073ac
  407420:	6b0400bf 	cmp	w5, w4
  407424:	1a9f07e0 	cset	w0, ne	// ne = any
  407428:	d65f03c0 	ret
  40742c:	d503201f 	nop
  407430:	d503233f 	paciasp
  407434:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  407438:	9e660000 	fmov	x0, d0
  40743c:	910003fd 	mov	x29, sp
  407440:	9eae0001 	fmov	x1, v0.d[1]
  407444:	9e660024 	fmov	x4, d1
  407448:	9eae0025 	fmov	x5, v1.d[1]
  40744c:	d53b4406 	mrs	x6, fpcr
  407450:	d37ffc22 	lsr	x2, x1, #63
  407454:	d340bc27 	ubfx	x7, x1, #0, #48
  407458:	12001c4b 	and	w11, w2, #0xff
  40745c:	d370f821 	ubfx	x1, x1, #48, #15
  407460:	34001c61 	cbz	w1, 0x4077ec
  407464:	528fffe2 	mov	w2, #0x7fff                	// #32767
  407468:	6b02003f 	cmp	w1, w2
  40746c:	54001420 	b.eq	0x4076f0  // b.none
  407470:	2a0103e1 	mov	w1, w1
  407474:	93c0f4e7 	extr	x7, x7, x0, #61
  407478:	9287ffd2 	mov	x18, #0xffffffffffffc001    	// #-16383
  40747c:	b24d00e7 	orr	x7, x7, #0x8000000000000
  407480:	8b120022 	add	x2, x1, x18
  407484:	d37df008 	lsl	x8, x0, #3
  407488:	d2800009 	mov	x9, #0x0                   	// #0
  40748c:	d280000c 	mov	x12, #0x0                   	// #0
  407490:	52800000 	mov	w0, #0x0                   	// #0
  407494:	aa0503e1 	mov	x1, x5
  407498:	d37ffca5 	lsr	x5, x5, #63
  40749c:	12001caf 	and	w15, w5, #0xff
  4074a0:	d340bc23 	ubfx	x3, x1, #0, #48
  4074a4:	d370f821 	ubfx	x1, x1, #48, #15
  4074a8:	34001401 	cbz	w1, 0x407728
  4074ac:	528fffea 	mov	w10, #0x7fff                	// #32767
  4074b0:	6b0a003f 	cmp	w1, w10
  4074b4:	540018a0 	b.eq	0x4077c8  // b.none
  4074b8:	2a0103e1 	mov	w1, w1
  4074bc:	93c4f463 	extr	x3, x3, x4, #61
  4074c0:	9287ffd1 	mov	x17, #0xffffffffffffc001    	// #-16383
  4074c4:	8b110021 	add	x1, x1, x17
  4074c8:	b24d0063 	orr	x3, x3, #0x8000000000000
  4074cc:	8b020021 	add	x1, x1, x2
  4074d0:	d37df084 	lsl	x4, x4, #3
  4074d4:	d280000e 	mov	x14, #0x0                   	// #0
  4074d8:	91000422 	add	x2, x1, #0x1
  4074dc:	f100293f 	cmp	x9, #0xa
  4074e0:	540014ac 	b.gt	0x407774
  4074e4:	4a0f016d 	eor	w13, w11, w15
  4074e8:	aa0d03ea 	mov	x10, x13
  4074ec:	f100093f 	cmp	x9, #0x2
  4074f0:	54001aad 	b.le	0x407844
  4074f4:	d280002b 	mov	x11, #0x1                   	// #1
  4074f8:	d280a610 	mov	x16, #0x530                 	// #1328
  4074fc:	9ac92169 	lsl	x9, x11, x9
  407500:	ea10013f 	tst	x9, x16
  407504:	540013c1 	b.ne	0x40777c  // b.any
  407508:	d280480c 	mov	x12, #0x240                 	// #576
  40750c:	ea0c013f 	tst	x9, x12
  407510:	540025a1 	b.ne	0x4079c4  // b.any
  407514:	d280110b 	mov	x11, #0x88                  	// #136
  407518:	ea0b013f 	tst	x9, x11
  40751c:	540023e1 	b.ne	0x407998  // b.any
  407520:	92407c90 	and	x16, x4, #0xffffffff
  407524:	d360fd11 	lsr	x17, x8, #32
  407528:	d360fc84 	lsr	x4, x4, #32
  40752c:	92407d08 	and	x8, x8, #0xffffffff
  407530:	92407c6e 	and	x14, x3, #0xffffffff
  407534:	d360fc63 	lsr	x3, x3, #32
  407538:	a90153f3 	stp	x19, x20, [sp, #16]
  40753c:	9b107e33 	mul	x19, x17, x16
  407540:	9b084c94 	madd	x20, x4, x8, x19
  407544:	9b0e7e32 	mul	x18, x17, x14
  407548:	f90013f5 	str	x21, [sp, #32]
  40754c:	9b087e05 	mul	x5, x16, x8
  407550:	d360fcf5 	lsr	x21, x7, #32
  407554:	9b0e7d09 	mul	x9, x8, x14
  407558:	92407ce7 	and	x7, x7, #0xffffffff
  40755c:	9b08486b 	madd	x11, x3, x8, x18
  407560:	92407caf 	and	x15, x5, #0xffffffff
  407564:	9b047e3e 	mul	x30, x17, x4
  407568:	8b458285 	add	x5, x20, x5, lsr #32
  40756c:	9b077e08 	mul	x8, x16, x7
  407570:	eb05027f 	cmp	x19, x5
  407574:	8b49816b 	add	x11, x11, x9, lsr #32
  407578:	d2c0002c 	mov	x12, #0x100000000           	// #4294967296
  40757c:	9b107eb4 	mul	x20, x21, x16
  407580:	8b0c03d0 	add	x16, x30, x12
  407584:	9b0e7eb3 	mul	x19, x21, x14
  407588:	9a9e821e 	csel	x30, x16, x30, hi	// hi = pmore
  40758c:	9b0e7cee 	mul	x14, x7, x14
  407590:	eb0b025f 	cmp	x18, x11
  407594:	9b075092 	madd	x18, x4, x7, x20
  407598:	92407d29 	and	x9, x9, #0xffffffff
  40759c:	9b074c67 	madd	x7, x3, x7, x19
  4075a0:	8b0b8129 	add	x9, x9, x11, lsl #32
  4075a4:	9b037e31 	mul	x17, x17, x3
  4075a8:	8b0581ef 	add	x15, x15, x5, lsl #32
  4075ac:	9b157c90 	mul	x16, x4, x21
  4075b0:	8b488252 	add	x18, x18, x8, lsr #32
  4075b4:	8b4e80e7 	add	x7, x7, x14, lsr #32
  4075b8:	9b157c63 	mul	x3, x3, x21
  4075bc:	92407dc4 	and	x4, x14, #0xffffffff
  4075c0:	8b0c022e 	add	x14, x17, x12
  4075c4:	9a9181d1 	csel	x17, x14, x17, hi	// hi = pmore
  4075c8:	eb12029f 	cmp	x20, x18
  4075cc:	8b0c020e 	add	x14, x16, x12
  4075d0:	8b458125 	add	x5, x9, x5, lsr #32
  4075d4:	8b4b822b 	add	x11, x17, x11, lsr #32
  4075d8:	9a9081d0 	csel	x16, x14, x16, hi	// hi = pmore
  4075dc:	8b078084 	add	x4, x4, x7, lsl #32
  4075e0:	eb07027f 	cmp	x19, x7
  4075e4:	8b0c006c 	add	x12, x3, x12
  4075e8:	8b1e00a5 	add	x5, x5, x30
  4075ec:	9a838183 	csel	x3, x12, x3, hi	// hi = pmore
  4075f0:	ab0b0084 	adds	x4, x4, x11
  4075f4:	9a9f37eb 	cset	x11, cs	// cs = hs, nlast
  4075f8:	eb0900bf 	cmp	x5, x9
  4075fc:	9a9f27e9 	cset	x9, cc	// cc = lo, ul, last
  407600:	92407d08 	and	x8, x8, #0xffffffff
  407604:	ab090084 	adds	x4, x4, x9
  407608:	8b128108 	add	x8, x8, x18, lsl #32
  40760c:	9a9f37e9 	cset	x9, cs	// cs = hs, nlast
  407610:	f100017f 	cmp	x11, #0x0
  407614:	fa400920 	ccmp	x9, #0x0, #0x0, eq	// eq = none
  407618:	d360fce7 	lsr	x7, x7, #32
  40761c:	9a8704e7 	cinc	x7, x7, ne	// ne = any
  407620:	8b528209 	add	x9, x16, x18, lsr #32
  407624:	ab0800a5 	adds	x5, x5, x8
  407628:	9a9f37e8 	cset	x8, cs	// cs = hs, nlast
  40762c:	ab090084 	adds	x4, x4, x9
  407630:	9a9f37e9 	cset	x9, cs	// cs = hs, nlast
  407634:	ab080084 	adds	x4, x4, x8
  407638:	9a9f37e8 	cset	x8, cs	// cs = hs, nlast
  40763c:	f100013f 	cmp	x9, #0x0
  407640:	fa400900 	ccmp	x8, #0x0, #0x0, eq	// eq = none
  407644:	aa0535ef 	orr	x15, x15, x5, lsl #13
  407648:	9a830463 	cinc	x3, x3, ne	// ne = any
  40764c:	f10001ff 	cmp	x15, #0x0
  407650:	8b070063 	add	x3, x3, x7
  407654:	9a9f07e7 	cset	x7, ne	// ne = any
  407658:	aa45cce5 	orr	x5, x7, x5, lsr #51
  40765c:	aa0434a8 	orr	x8, x5, x4, lsl #13
  407660:	93c4cc67 	extr	x7, x3, x4, #51
  407664:	b63821a3 	tbz	x3, #39, 0x407a98
  407668:	a94153f3 	ldp	x19, x20, [sp, #16]
  40766c:	92400101 	and	x1, x8, #0x1
  407670:	f94013f5 	ldr	x21, [sp, #32]
  407674:	aa480421 	orr	x1, x1, x8, lsr #1
  407678:	aa07fc28 	orr	x8, x1, x7, lsl #63
  40767c:	d341fce7 	lsr	x7, x7, #1
  407680:	d287ffe1 	mov	x1, #0x3fff                	// #16383
  407684:	8b010041 	add	x1, x2, x1
  407688:	f100003f 	cmp	x1, #0x0
  40768c:	5400138d 	b.le	0x4078fc
  407690:	f240091f 	tst	x8, #0x7
  407694:	540001a0 	b.eq	0x4076c8  // b.none
  407698:	926a04c3 	and	x3, x6, #0xc00000
  40769c:	321c0000 	orr	w0, w0, #0x10
  4076a0:	f150007f 	cmp	x3, #0x400, lsl #12
  4076a4:	54002700 	b.eq	0x407b84  // b.none
  4076a8:	f160007f 	cmp	x3, #0x800, lsl #12
  4076ac:	54002420 	b.eq	0x407b30  // b.none
  4076b0:	b50000c3 	cbnz	x3, 0x4076c8
  4076b4:	92400d03 	and	x3, x8, #0xf
  4076b8:	f100107f 	cmp	x3, #0x4
  4076bc:	54000060 	b.eq	0x4076c8  // b.none
  4076c0:	b1001108 	adds	x8, x8, #0x4
  4076c4:	9a8734e7 	cinc	x7, x7, cs	// cs = hs, nlast
  4076c8:	b6a00067 	tbz	x7, #52, 0x4076d4
  4076cc:	924bf8e7 	and	x7, x7, #0xffefffffffffffff
  4076d0:	91401041 	add	x1, x2, #0x4, lsl #12
  4076d4:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  4076d8:	eb02003f 	cmp	x1, x2
  4076dc:	54001c8c 	b.gt	0x407a6c
  4076e0:	d343c8e5 	ubfx	x5, x7, #3, #48
  4076e4:	93c80ce8 	extr	x8, x7, x8, #3
  4076e8:	12003821 	and	w1, w1, #0x7fff
  4076ec:	1400002d 	b	0x4077a0
  4076f0:	aa070008 	orr	x8, x0, x7
  4076f4:	b5000f48 	cbnz	x8, 0x4078dc
  4076f8:	aa0503e1 	mov	x1, x5
  4076fc:	d37ffca5 	lsr	x5, x5, #63
  407700:	12001caf 	and	w15, w5, #0xff
  407704:	d2800007 	mov	x7, #0x0                   	// #0
  407708:	d340bc23 	ubfx	x3, x1, #0, #48
  40770c:	d2800109 	mov	x9, #0x8                   	// #8
  407710:	d370f821 	ubfx	x1, x1, #48, #15
  407714:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  407718:	d280004c 	mov	x12, #0x2                   	// #2
  40771c:	52800000 	mov	w0, #0x0                   	// #0
  407720:	35ffec61 	cbnz	w1, 0x4074ac
  407724:	d503201f 	nop
  407728:	aa030081 	orr	x1, x4, x3
  40772c:	b4000a61 	cbz	x1, 0x407878
  407730:	b40018a3 	cbz	x3, 0x407a44
  407734:	dac01061 	clz	x1, x3
  407738:	d1003c2d 	sub	x13, x1, #0xf
  40773c:	11000dae 	add	w14, w13, #0x3
  407740:	528007aa 	mov	w10, #0x3d                  	// #61
  407744:	4b0d014a 	sub	w10, w10, w13
  407748:	9ace2063 	lsl	x3, x3, x14
  40774c:	9aca248a 	lsr	x10, x4, x10
  407750:	aa030143 	orr	x3, x10, x3
  407754:	9ace2084 	lsl	x4, x4, x14
  407758:	cb010041 	sub	x1, x2, x1
  40775c:	9287fdd0 	mov	x16, #0xffffffffffffc011    	// #-16367
  407760:	8b100021 	add	x1, x1, x16
  407764:	d280000e 	mov	x14, #0x0                   	// #0
  407768:	91000422 	add	x2, x1, #0x1
  40776c:	f100293f 	cmp	x9, #0xa
  407770:	54ffebad 	b.le	0x4074e4
  407774:	2a0b03ed 	mov	w13, w11
  407778:	2a0b03ea 	mov	w10, w11
  40777c:	f100099f 	cmp	x12, #0x2
  407780:	540005a0 	b.eq	0x407834  // b.none
  407784:	f1000d9f 	cmp	x12, #0x3
  407788:	54002080 	b.eq	0x407b98  // b.none
  40778c:	f100059f 	cmp	x12, #0x1
  407790:	54fff781 	b.ne	0x407680  // b.any
  407794:	52800001 	mov	w1, #0x0                   	// #0
  407798:	d2800005 	mov	x5, #0x0                   	// #0
  40779c:	d2800008 	mov	x8, #0x0                   	// #0
  4077a0:	d2800003 	mov	x3, #0x0                   	// #0
  4077a4:	2a0a3c21 	orr	w1, w1, w10, lsl #15
  4077a8:	b340bca3 	bfxil	x3, x5, #0, #48
  4077ac:	9e670100 	fmov	d0, x8
  4077b0:	b3503c23 	bfi	x3, x1, #48, #16
  4077b4:	9eaf0060 	fmov	v0.d[1], x3
  4077b8:	35001280 	cbnz	w0, 0x407a08
  4077bc:	a8c47bfd 	ldp	x29, x30, [sp], #64
  4077c0:	d50323bf 	autiasp
  4077c4:	d65f03c0 	ret
  4077c8:	d28fffed 	mov	x13, #0x7fff                	// #32767
  4077cc:	aa03008a 	orr	x10, x4, x3
  4077d0:	8b0d0041 	add	x1, x2, x13
  4077d4:	b50005ea 	cbnz	x10, 0x407890
  4077d8:	b27f0129 	orr	x9, x9, #0x2
  4077dc:	d2800003 	mov	x3, #0x0                   	// #0
  4077e0:	d2800004 	mov	x4, #0x0                   	// #0
  4077e4:	d280004e 	mov	x14, #0x2                   	// #2
  4077e8:	17ffff3c 	b	0x4074d8
  4077ec:	aa070008 	orr	x8, x0, x7
  4077f0:	b4000388 	cbz	x8, 0x407860
  4077f4:	b4001167 	cbz	x7, 0x407a20
  4077f8:	dac010e3 	clz	x3, x7
  4077fc:	d1003c62 	sub	x2, x3, #0xf
  407800:	11000c48 	add	w8, w2, #0x3
  407804:	528007a1 	mov	w1, #0x3d                  	// #61
  407808:	4b020021 	sub	w1, w1, w2
  40780c:	9ac820e7 	lsl	x7, x7, x8
  407810:	9ac12401 	lsr	x1, x0, x1
  407814:	aa070027 	orr	x7, x1, x7
  407818:	9ac82008 	lsl	x8, x0, x8
  40781c:	9287fdc2 	mov	x2, #0xffffffffffffc011    	// #-16367
  407820:	d2800009 	mov	x9, #0x0                   	// #0
  407824:	cb030042 	sub	x2, x2, x3
  407828:	d280000c 	mov	x12, #0x0                   	// #0
  40782c:	52800000 	mov	w0, #0x0                   	// #0
  407830:	17ffff19 	b	0x407494
  407834:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407838:	d2800005 	mov	x5, #0x0                   	// #0
  40783c:	d2800008 	mov	x8, #0x0                   	// #0
  407840:	17ffffd8 	b	0x4077a0
  407844:	d1000529 	sub	x9, x9, #0x1
  407848:	f100053f 	cmp	x9, #0x1
  40784c:	54ffe6a8 	b.hi	0x407520  // b.pmore
  407850:	aa0303e7 	mov	x7, x3
  407854:	aa0403e8 	mov	x8, x4
  407858:	aa0e03ec 	mov	x12, x14
  40785c:	17ffffc8 	b	0x40777c
  407860:	d2800007 	mov	x7, #0x0                   	// #0
  407864:	d2800089 	mov	x9, #0x4                   	// #4
  407868:	d2800002 	mov	x2, #0x0                   	// #0
  40786c:	d280002c 	mov	x12, #0x1                   	// #1
  407870:	52800000 	mov	w0, #0x0                   	// #0
  407874:	17ffff08 	b	0x407494
  407878:	b2400129 	orr	x9, x9, #0x1
  40787c:	aa0203e1 	mov	x1, x2
  407880:	d2800003 	mov	x3, #0x0                   	// #0
  407884:	d2800004 	mov	x4, #0x0                   	// #0
  407888:	d280002e 	mov	x14, #0x1                   	// #1
  40788c:	17ffff13 	b	0x4074d8
  407890:	b240bbed 	mov	x13, #0x7fffffffffff        	// #140737488355327
  407894:	4a0f016a 	eor	w10, w11, w15
  407898:	eb0d007f 	cmp	x3, x13
  40789c:	b2400529 	orr	x9, x9, #0x3
  4078a0:	91402042 	add	x2, x2, #0x8, lsl #12
  4078a4:	1a9f8400 	csinc	w0, w0, wzr, hi	// hi = pmore
  4078a8:	2a0a03ed 	mov	w13, w10
  4078ac:	d280006e 	mov	x14, #0x3                   	// #3
  4078b0:	f100293f 	cmp	x9, #0xa
  4078b4:	54ffe20d 	b.le	0x4074f4
  4078b8:	f1003d3f 	cmp	x9, #0xf
  4078bc:	54001681 	b.ne	0x407b8c  // b.any
  4078c0:	b6780787 	tbz	x7, #47, 0x4079b0
  4078c4:	b7780763 	tbnz	x3, #47, 0x4079b0
  4078c8:	b2510065 	orr	x5, x3, #0x800000000000
  4078cc:	2a0f03ea 	mov	w10, w15
  4078d0:	aa0403e8 	mov	x8, x4
  4078d4:	528fffe1 	mov	w1, #0x7fff                	// #32767
  4078d8:	17ffffb2 	b	0x4077a0
  4078dc:	b240bbe1 	mov	x1, #0x7fffffffffff        	// #140737488355327
  4078e0:	eb0100ff 	cmp	x7, x1
  4078e4:	aa0003e8 	mov	x8, x0
  4078e8:	d2800189 	mov	x9, #0xc                   	// #12
  4078ec:	1a9f87e0 	cset	w0, ls	// ls = plast
  4078f0:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  4078f4:	d280006c 	mov	x12, #0x3                   	// #3
  4078f8:	17fffee7 	b	0x407494
  4078fc:	d2800022 	mov	x2, #0x1                   	// #1
  407900:	cb010041 	sub	x1, x2, x1
  407904:	f101d03f 	cmp	x1, #0x74
  407908:	540006ac 	b.gt	0x4079dc
  40790c:	f100fc3f 	cmp	x1, #0x3f
  407910:	54000dcd 	b.le	0x407ac8
  407914:	52801002 	mov	w2, #0x80                  	// #128
  407918:	4b010042 	sub	w2, w2, w1
  40791c:	f101003f 	cmp	x1, #0x40
  407920:	51010021 	sub	w1, w1, #0x40
  407924:	9ac220e2 	lsl	x2, x7, x2
  407928:	aa020102 	orr	x2, x8, x2
  40792c:	9a881048 	csel	x8, x2, x8, ne	// ne = any
  407930:	9ac124e1 	lsr	x1, x7, x1
  407934:	f100011f 	cmp	x8, #0x0
  407938:	9a9f07e2 	cset	x2, ne	// ne = any
  40793c:	aa010041 	orr	x1, x2, x1
  407940:	f2400823 	ands	x3, x1, #0x7
  407944:	54000fe0 	b.eq	0x407b40  // b.none
  407948:	d2800003 	mov	x3, #0x0                   	// #0
  40794c:	926a04c6 	and	x6, x6, #0xc00000
  407950:	321c0000 	orr	w0, w0, #0x10
  407954:	f15000df 	cmp	x6, #0x400, lsl #12
  407958:	54001280 	b.eq	0x407ba8  // b.none
  40795c:	f16000df 	cmp	x6, #0x800, lsl #12
  407960:	540012c0 	b.eq	0x407bb8  // b.none
  407964:	b50000e6 	cbnz	x6, 0x407980
  407968:	92400c22 	and	x2, x1, #0xf
  40796c:	f100105f 	cmp	x2, #0x4
  407970:	54000080 	b.eq	0x407980  // b.none
  407974:	b1001021 	adds	x1, x1, #0x4
  407978:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  40797c:	d503201f 	nop
  407980:	b7980c03 	tbnz	x3, #51, 0x407b00
  407984:	d343c865 	ubfx	x5, x3, #3, #48
  407988:	93c10c68 	extr	x8, x3, x1, #3
  40798c:	321d0000 	orr	w0, w0, #0x8
  407990:	52800001 	mov	w1, #0x0                   	// #0
  407994:	14000017 	b	0x4079f0
  407998:	2a0f03ea 	mov	w10, w15
  40799c:	aa0303e7 	mov	x7, x3
  4079a0:	aa0403e8 	mov	x8, x4
  4079a4:	aa0503ed 	mov	x13, x5
  4079a8:	aa0e03ec 	mov	x12, x14
  4079ac:	17ffff74 	b	0x40777c
  4079b0:	b25100e5 	orr	x5, x7, #0x800000000000
  4079b4:	2a0b03ea 	mov	w10, w11
  4079b8:	9240bca5 	and	x5, x5, #0xffffffffffff
  4079bc:	528fffe1 	mov	w1, #0x7fff                	// #32767
  4079c0:	17ffff78 	b	0x4077a0
  4079c4:	2a0b03e0 	mov	w0, w11
  4079c8:	5280000a 	mov	w10, #0x0                   	// #0
  4079cc:	92ffffe5 	mov	x5, #0xffffffffffff        	// #281474976710655
  4079d0:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  4079d4:	528fffe1 	mov	w1, #0x7fff                	// #32767
  4079d8:	17ffff72 	b	0x4077a0
  4079dc:	aa070108 	orr	x8, x8, x7
  4079e0:	b5000648 	cbnz	x8, 0x407aa8
  4079e4:	321d0000 	orr	w0, w0, #0x8
  4079e8:	d2800005 	mov	x5, #0x0                   	// #0
  4079ec:	52800001 	mov	w1, #0x0                   	// #0
  4079f0:	d2800003 	mov	x3, #0x0                   	// #0
  4079f4:	9e670100 	fmov	d0, x8
  4079f8:	b340bca3 	bfxil	x3, x5, #0, #48
  4079fc:	b3503823 	bfi	x3, x1, #48, #15
  407a00:	b3410143 	bfi	x3, x10, #63, #1
  407a04:	9eaf0060 	fmov	v0.d[1], x3
  407a08:	3d800fe0 	str	q0, [sp, #48]
  407a0c:	9400052d 	bl	0x408ec0
  407a10:	3dc00fe0 	ldr	q0, [sp, #48]
  407a14:	a8c47bfd 	ldp	x29, x30, [sp], #64
  407a18:	d50323bf 	autiasp
  407a1c:	d65f03c0 	ret
  407a20:	dac01003 	clz	x3, x0
  407a24:	9100c462 	add	x2, x3, #0x31
  407a28:	91010063 	add	x3, x3, #0x40
  407a2c:	f100f05f 	cmp	x2, #0x3c
  407a30:	54ffee8d 	b.le	0x407800
  407a34:	5100f442 	sub	w2, w2, #0x3d
  407a38:	d2800008 	mov	x8, #0x0                   	// #0
  407a3c:	9ac22007 	lsl	x7, x0, x2
  407a40:	17ffff77 	b	0x40781c
  407a44:	dac01081 	clz	x1, x4
  407a48:	9100c42d 	add	x13, x1, #0x31
  407a4c:	91010021 	add	x1, x1, #0x40
  407a50:	f100f1bf 	cmp	x13, #0x3c
  407a54:	54ffe74d 	b.le	0x40773c
  407a58:	5100f5ad 	sub	w13, w13, #0x3d
  407a5c:	9acd208d 	lsl	x13, x4, x13
  407a60:	d2800004 	mov	x4, #0x0                   	// #0
  407a64:	aa0d03e3 	mov	x3, x13
  407a68:	17ffff3c 	b	0x407758
  407a6c:	926a04c8 	and	x8, x6, #0xc00000
  407a70:	f150011f 	cmp	x8, #0x400, lsl #12
  407a74:	54000720 	b.eq	0x407b58  // b.none
  407a78:	f160011f 	cmp	x8, #0x800, lsl #12
  407a7c:	540004c0 	b.eq	0x407b14  // b.none
  407a80:	b50007a8 	cbnz	x8, 0x407b74
  407a84:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407a88:	d2800005 	mov	x5, #0x0                   	// #0
  407a8c:	52800282 	mov	w2, #0x14                  	// #20
  407a90:	2a020000 	orr	w0, w0, w2
  407a94:	17ffffd7 	b	0x4079f0
  407a98:	a94153f3 	ldp	x19, x20, [sp, #16]
  407a9c:	aa0103e2 	mov	x2, x1
  407aa0:	f94013f5 	ldr	x21, [sp, #32]
  407aa4:	17fffef7 	b	0x407680
  407aa8:	926a04c6 	and	x6, x6, #0xc00000
  407aac:	321c0000 	orr	w0, w0, #0x10
  407ab0:	cb0d0048 	sub	x8, x2, x13
  407ab4:	f15000df 	cmp	x6, #0x400, lsl #12
  407ab8:	54fff960 	b.eq	0x4079e4  // b.none
  407abc:	f16000df 	cmp	x6, #0x800, lsl #12
  407ac0:	9a9f01a8 	csel	x8, x13, xzr, eq	// eq = none
  407ac4:	17ffffc8 	b	0x4079e4
  407ac8:	52800802 	mov	w2, #0x40                  	// #64
  407acc:	4b010042 	sub	w2, w2, w1
  407ad0:	9ac12503 	lsr	x3, x8, x1
  407ad4:	9ac22108 	lsl	x8, x8, x2
  407ad8:	f100011f 	cmp	x8, #0x0
  407adc:	9a9f07e4 	cset	x4, ne	// ne = any
  407ae0:	9ac220e2 	lsl	x2, x7, x2
  407ae4:	aa030042 	orr	x2, x2, x3
  407ae8:	9ac124e3 	lsr	x3, x7, x1
  407aec:	aa040041 	orr	x1, x2, x4
  407af0:	f240083f 	tst	x1, #0x7
  407af4:	54fff2c1 	b.ne	0x40794c  // b.any
  407af8:	b6980243 	tbz	x3, #51, 0x407b40
  407afc:	321c0000 	orr	w0, w0, #0x10
  407b00:	321d0000 	orr	w0, w0, #0x8
  407b04:	52800021 	mov	w1, #0x1                   	// #1
  407b08:	d2800005 	mov	x5, #0x0                   	// #0
  407b0c:	d2800008 	mov	x8, #0x0                   	// #0
  407b10:	17ffffb8 	b	0x4079f0
  407b14:	f10001bf 	cmp	x13, #0x0
  407b18:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407b1c:	92ffffe3 	mov	x3, #0xffffffffffff        	// #281474976710655
  407b20:	1a810041 	csel	w1, w2, w1, eq	// eq = none
  407b24:	9a8313e5 	csel	x5, xzr, x3, ne	// ne = any
  407b28:	da9f13e8 	csetm	x8, eq	// eq = none
  407b2c:	17ffffd8 	b	0x407a8c
  407b30:	b4ffdccd 	cbz	x13, 0x4076c8
  407b34:	b1002108 	adds	x8, x8, #0x8
  407b38:	9a8734e7 	cinc	x7, x7, cs	// cs = hs, nlast
  407b3c:	17fffee3 	b	0x4076c8
  407b40:	d343c865 	ubfx	x5, x3, #3, #48
  407b44:	93c10c68 	extr	x8, x3, x1, #3
  407b48:	52800001 	mov	w1, #0x0                   	// #0
  407b4c:	365fe2a6 	tbz	w6, #11, 0x4077a0
  407b50:	321d0000 	orr	w0, w0, #0x8
  407b54:	17ffffa7 	b	0x4079f0
  407b58:	f10001bf 	cmp	x13, #0x0
  407b5c:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407b60:	92ffffe3 	mov	x3, #0xffffffffffff        	// #281474976710655
  407b64:	1a811041 	csel	w1, w2, w1, ne	// ne = any
  407b68:	9a8303e5 	csel	x5, xzr, x3, eq	// eq = none
  407b6c:	da9f03e8 	csetm	x8, ne	// ne = any
  407b70:	17ffffc7 	b	0x407a8c
  407b74:	2a0203e1 	mov	w1, w2
  407b78:	92ffffe5 	mov	x5, #0xffffffffffff        	// #281474976710655
  407b7c:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  407b80:	17ffffc3 	b	0x407a8c
  407b84:	b5ffda2d 	cbnz	x13, 0x4076c8
  407b88:	17ffffeb 	b	0x407b34
  407b8c:	2a0f03ea 	mov	w10, w15
  407b90:	aa0303e7 	mov	x7, x3
  407b94:	aa0403e8 	mov	x8, x4
  407b98:	b25100e5 	orr	x5, x7, #0x800000000000
  407b9c:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407ba0:	9240bca5 	and	x5, x5, #0xffffffffffff
  407ba4:	17fffeff 	b	0x4077a0
  407ba8:	b5ffeecd 	cbnz	x13, 0x407980
  407bac:	b1002021 	adds	x1, x1, #0x8
  407bb0:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  407bb4:	17ffff73 	b	0x407980
  407bb8:	b4ffee4d 	cbz	x13, 0x407980
  407bbc:	17fffffc 	b	0x407bac
  407bc0:	d503245f 	bti	c
  407bc4:	9e660004 	fmov	x4, d0
  407bc8:	9eae0005 	fmov	x5, v0.d[1]
  407bcc:	9e660026 	fmov	x6, d1
  407bd0:	9eae0027 	fmov	x7, v1.d[1]
  407bd4:	d53b440b 	mrs	x11, fpcr
  407bd8:	aa0503e2 	mov	x2, x5
  407bdc:	aa0703e1 	mov	x1, x7
  407be0:	aa0403e5 	mov	x5, x4
  407be4:	d37ffce0 	lsr	x0, x7, #63
  407be8:	d37ffc44 	lsr	x4, x2, #63
  407bec:	d37dbc43 	ubfiz	x3, x2, #3, #48
  407bf0:	d37dbce7 	ubfiz	x7, x7, #3, #48
  407bf4:	d370f82f 	ubfx	x15, x1, #48, #15
  407bf8:	d370f84a 	ubfx	x10, x2, #48, #15
  407bfc:	aa46f4ed 	orr	x13, x7, x6, lsr #61
  407c00:	12001c88 	and	w8, w4, #0xff
  407c04:	aa0403ec 	mov	x12, x4
  407c08:	aa45f463 	orr	x3, x3, x5, lsr #61
  407c0c:	92401c00 	and	x0, x0, #0xff
  407c10:	aa0f03e1 	mov	x1, x15
  407c14:	aa0a03e2 	mov	x2, x10
  407c18:	d37df0a7 	lsl	x7, x5, #3
  407c1c:	d37df0ce 	lsl	x14, x6, #3
  407c20:	d28fffe9 	mov	x9, #0x7fff                	// #32767
  407c24:	eb0901ff 	cmp	x15, x9
  407c28:	54001180 	b.eq	0x407e58  // b.none
  407c2c:	52000000 	eor	w0, w0, #0x1
  407c30:	4b0f0144 	sub	w4, w10, w15
  407c34:	92401c00 	and	x0, x0, #0xff
  407c38:	eb00019f 	cmp	x12, x0
  407c3c:	54000a00 	b.eq	0x407d7c  // b.none
  407c40:	7100009f 	cmp	w4, #0x0
  407c44:	5400424d 	b.le	0x40848c
  407c48:	b500242f 	cbnz	x15, 0x4080cc
  407c4c:	aa0e01a0 	orr	x0, x13, x14
  407c50:	b4001760 	cbz	x0, 0x407f3c
  407c54:	71000484 	subs	w4, w4, #0x1
  407c58:	540042a0 	b.eq	0x4084ac  // b.none
  407c5c:	eb09015f 	cmp	x10, x9
  407c60:	54002520 	b.eq	0x408104  // b.none
  407c64:	d2800020 	mov	x0, #0x1                   	// #1
  407c68:	7101d09f 	cmp	w4, #0x74
  407c6c:	540001cc 	b.gt	0x407ca4
  407c70:	7100fc9f 	cmp	w4, #0x3f
  407c74:	5400314c 	b.gt	0x40829c
  407c78:	52800800 	mov	w0, #0x40                  	// #64
  407c7c:	4b040000 	sub	w0, w0, w4
  407c80:	9ac425c5 	lsr	x5, x14, x4
  407c84:	9ac021ce 	lsl	x14, x14, x0
  407c88:	f10001df 	cmp	x14, #0x0
  407c8c:	9a9f07e1 	cset	x1, ne	// ne = any
  407c90:	9ac021a0 	lsl	x0, x13, x0
  407c94:	aa050000 	orr	x0, x0, x5
  407c98:	9ac425a4 	lsr	x4, x13, x4
  407c9c:	aa010000 	orr	x0, x0, x1
  407ca0:	cb040063 	sub	x3, x3, x4
  407ca4:	eb0000e0 	subs	x0, x7, x0
  407ca8:	aa0003e7 	mov	x7, x0
  407cac:	da1f0063 	sbc	x3, x3, xzr
  407cb0:	b6981da3 	tbz	x3, #51, 0x408064
  407cb4:	9240c863 	and	x3, x3, #0x7ffffffffffff
  407cb8:	b4002383 	cbz	x3, 0x408128
  407cbc:	dac01061 	clz	x1, x3
  407cc0:	51003021 	sub	w1, w1, #0xc
  407cc4:	93407c25 	sxtw	x5, w1
  407cc8:	52800804 	mov	w4, #0x40                  	// #64
  407ccc:	4b010080 	sub	w0, w4, w1
  407cd0:	9ac12063 	lsl	x3, x3, x1
  407cd4:	9ac024e0 	lsr	x0, x7, x0
  407cd8:	aa030000 	orr	x0, x0, x3
  407cdc:	9ac120e7 	lsl	x7, x7, x1
  407ce0:	eb05005f 	cmp	x2, x5
  407ce4:	54001bcc 	b.gt	0x40805c
  407ce8:	4b020021 	sub	w1, w1, w2
  407cec:	11000421 	add	w1, w1, #0x1
  407cf0:	4b010084 	sub	w4, w4, w1
  407cf4:	9ac124e2 	lsr	x2, x7, x1
  407cf8:	9ac420e7 	lsl	x7, x7, x4
  407cfc:	f10000ff 	cmp	x7, #0x0
  407d00:	9a9f07e3 	cset	x3, ne	// ne = any
  407d04:	aa030042 	orr	x2, x2, x3
  407d08:	9ac42004 	lsl	x4, x0, x4
  407d0c:	aa020087 	orr	x7, x4, x2
  407d10:	9ac12403 	lsr	x3, x0, x1
  407d14:	aa0300e0 	orr	x0, x7, x3
  407d18:	b5001aa0 	cbnz	x0, 0x40806c
  407d1c:	12000188 	and	w8, w12, #0x1
  407d20:	d2800004 	mov	x4, #0x0                   	// #0
  407d24:	d280000a 	mov	x10, #0x0                   	// #0
  407d28:	d2800002 	mov	x2, #0x0                   	// #0
  407d2c:	52800009 	mov	w9, #0x0                   	// #0
  407d30:	9240bc84 	and	x4, x4, #0xffffffffffff
  407d34:	12003841 	and	w1, w2, #0x7fff
  407d38:	d2800003 	mov	x3, #0x0                   	// #0
  407d3c:	2a083c21 	orr	w1, w1, w8, lsl #15
  407d40:	b340bc83 	bfxil	x3, x4, #0, #48
  407d44:	9e670140 	fmov	d0, x10
  407d48:	b3503c23 	bfi	x3, x1, #48, #16
  407d4c:	9eaf0060 	fmov	v0.d[1], x3
  407d50:	34001209 	cbz	w9, 0x407f90
  407d54:	d503233f 	paciasp
  407d58:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  407d5c:	2a0903e0 	mov	w0, w9
  407d60:	910003fd 	mov	x29, sp
  407d64:	3d8007e0 	str	q0, [sp, #16]
  407d68:	94000456 	bl	0x408ec0
  407d6c:	3dc007e0 	ldr	q0, [sp, #16]
  407d70:	a8c27bfd 	ldp	x29, x30, [sp], #32
  407d74:	d50323bf 	autiasp
  407d78:	d65f03c0 	ret
  407d7c:	7100009f 	cmp	w4, #0x0
  407d80:	540010ad 	b.le	0x407f94
  407d84:	b500204f 	cbnz	x15, 0x40818c
  407d88:	aa0e01a0 	orr	x0, x13, x14
  407d8c:	b4000d80 	cbz	x0, 0x407f3c
  407d90:	71000484 	subs	w4, w4, #0x1
  407d94:	54003580 	b.eq	0x408444  // b.none
  407d98:	eb09015f 	cmp	x10, x9
  407d9c:	54001b40 	b.eq	0x408104  // b.none
  407da0:	d2800020 	mov	x0, #0x1                   	// #1
  407da4:	7101d09f 	cmp	w4, #0x74
  407da8:	540001cc 	b.gt	0x407de0
  407dac:	7100fc9f 	cmp	w4, #0x3f
  407db0:	54002e6c 	b.gt	0x40837c
  407db4:	52800800 	mov	w0, #0x40                  	// #64
  407db8:	4b040000 	sub	w0, w0, w4
  407dbc:	9ac425c5 	lsr	x5, x14, x4
  407dc0:	9ac021ce 	lsl	x14, x14, x0
  407dc4:	f10001df 	cmp	x14, #0x0
  407dc8:	9a9f07e1 	cset	x1, ne	// ne = any
  407dcc:	9ac021a0 	lsl	x0, x13, x0
  407dd0:	aa050000 	orr	x0, x0, x5
  407dd4:	9ac425a4 	lsr	x4, x13, x4
  407dd8:	aa010000 	orr	x0, x0, x1
  407ddc:	8b040063 	add	x3, x3, x4
  407de0:	ab070000 	adds	x0, x0, x7
  407de4:	aa0003e7 	mov	x7, x0
  407de8:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  407dec:	b69813c3 	tbz	x3, #51, 0x408064
  407df0:	91000442 	add	x2, x2, #0x1
  407df4:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  407df8:	eb00005f 	cmp	x2, x0
  407dfc:	540038a0 	b.eq	0x408510  // b.none
  407e00:	924000e0 	and	x0, x7, #0x1
  407e04:	924cf861 	and	x1, x3, #0xfff7ffffffffffff
  407e08:	aa470400 	orr	x0, x0, x7, lsr #1
  407e0c:	aa03fc07 	orr	x7, x0, x3, lsl #63
  407e10:	d341fc23 	lsr	x3, x1, #1
  407e14:	924008e0 	and	x0, x7, #0x7
  407e18:	b40060c0 	cbz	x0, 0x408a30
  407e1c:	926a0565 	and	x5, x11, #0xc00000
  407e20:	f15000bf 	cmp	x5, #0x400, lsl #12
  407e24:	540020a0 	b.eq	0x408238  // b.none
  407e28:	f16000bf 	cmp	x5, #0x800, lsl #12
  407e2c:	54002000 	b.eq	0x40822c  // b.none
  407e30:	52800209 	mov	w9, #0x10                  	// #16
  407e34:	b50022e5 	cbnz	x5, 0x408290
  407e38:	92400ce0 	and	x0, x7, #0xf
  407e3c:	12000188 	and	w8, w12, #0x1
  407e40:	f100101f 	cmp	x0, #0x4
  407e44:	54002781 	b.ne	0x408334  // b.any
  407e48:	52800209 	mov	w9, #0x10                  	// #16
  407e4c:	d343fc64 	lsr	x4, x3, #3
  407e50:	93c70c6a 	extr	x10, x3, x7, #3
  407e54:	14000040 	b	0x407f54
  407e58:	128fffc4 	mov	w4, #0xffff8001            	// #-32767
  407e5c:	aa0e01b0 	orr	x16, x13, x14
  407e60:	0b040144 	add	w4, w10, w4
  407e64:	b40001b0 	cbz	x16, 0x407e98
  407e68:	eb00019f 	cmp	x12, x0
  407e6c:	540001e0 	b.eq	0x407ea8  // b.none
  407e70:	34000344 	cbz	w4, 0x407ed8
  407e74:	b4001a22 	cbz	x2, 0x4081b8
  407e78:	aa1003ea 	mov	x10, x16
  407e7c:	12000008 	and	w8, w0, #0x1
  407e80:	b50001d0 	cbnz	x16, 0x407eb8
  407e84:	d503201f 	nop
  407e88:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407e8c:	d2800004 	mov	x4, #0x0                   	// #0
  407e90:	52800009 	mov	w9, #0x0                   	// #0
  407e94:	14000038 	b	0x407f74
  407e98:	52000000 	eor	w0, w0, #0x1
  407e9c:	92401c00 	and	x0, x0, #0xff
  407ea0:	eb00019f 	cmp	x12, x0
  407ea4:	54fffe61 	b.ne	0x407e70  // b.any
  407ea8:	34000a84 	cbz	w4, 0x407ff8
  407eac:	b4003082 	cbz	x2, 0x4084bc
  407eb0:	aa1003ea 	mov	x10, x16
  407eb4:	b4fffeb0 	cbz	x16, 0x407e88
  407eb8:	d372fda9 	lsr	x9, x13, #50
  407ebc:	b34309a6 	bfi	x6, x13, #61, #3
  407ec0:	d2400129 	eor	x9, x9, #0x1
  407ec4:	aa0603ea 	mov	x10, x6
  407ec8:	aa0f03e2 	mov	x2, x15
  407ecc:	12000129 	and	w9, w9, #0x1
  407ed0:	d343fda4 	lsr	x4, x13, #3
  407ed4:	14000020 	b	0x407f54
  407ed8:	91000441 	add	x1, x2, #0x1
  407edc:	f27f343f 	tst	x1, #0x7ffe
  407ee0:	54001b41 	b.ne	0x408248  // b.any
  407ee4:	aa0e01aa 	orr	x10, x13, x14
  407ee8:	aa070061 	orr	x1, x3, x7
  407eec:	b5002722 	cbnz	x2, 0x4083d0
  407ef0:	b4003b61 	cbz	x1, 0x40865c
  407ef4:	b40015aa 	cbz	x10, 0x4081a8
  407ef8:	eb0e00e4 	subs	x4, x7, x14
  407efc:	da0d0061 	sbc	x1, x3, x13
  407f00:	b6984101 	tbz	x1, #51, 0x408720
  407f04:	eb0701ce 	subs	x14, x14, x7
  407f08:	12000008 	and	w8, w0, #0x1
  407f0c:	da0301a3 	sbc	x3, x13, x3
  407f10:	aa0e03e7 	mov	x7, x14
  407f14:	aa0301ca 	orr	x10, x14, x3
  407f18:	b4002aca 	cbz	x10, 0x408470
  407f1c:	aa0003ec 	mov	x12, x0
  407f20:	924d0061 	and	x1, x3, #0x8000000000000
  407f24:	3758166b 	tbnz	w11, #11, 0x4081f0
  407f28:	b40008a1 	cbz	x1, 0x40803c
  407f2c:	924cf864 	and	x4, x3, #0xfff7ffffffffffff
  407f30:	52800021 	mov	w1, #0x1                   	// #1
  407f34:	52800009 	mov	w9, #0x0                   	// #0
  407f38:	14000062 	b	0x4080c0
  407f3c:	eb09005f 	cmp	x2, x9
  407f40:	54000e20 	b.eq	0x408104  // b.none
  407f44:	b3430865 	bfi	x5, x3, #61, #3
  407f48:	d343fc64 	lsr	x4, x3, #3
  407f4c:	aa0503ea 	mov	x10, x5
  407f50:	52800009 	mov	w9, #0x0                   	// #0
  407f54:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  407f58:	eb00005f 	cmp	x2, x0
  407f5c:	54ffeea1 	b.ne	0x407d30  // b.any
  407f60:	aa040140 	orr	x0, x10, x4
  407f64:	b4005780 	cbz	x0, 0x408a54
  407f68:	b2510084 	orr	x4, x4, #0x800000000000
  407f6c:	528fffe1 	mov	w1, #0x7fff                	// #32767
  407f70:	9240bc84 	and	x4, x4, #0xffffffffffff
  407f74:	d2800003 	mov	x3, #0x0                   	// #0
  407f78:	2a083c21 	orr	w1, w1, w8, lsl #15
  407f7c:	b340bc83 	bfxil	x3, x4, #0, #48
  407f80:	9e670140 	fmov	d0, x10
  407f84:	b3503c23 	bfi	x3, x1, #48, #16
  407f88:	9eaf0060 	fmov	v0.d[1], x3
  407f8c:	35ffee49 	cbnz	w9, 0x407d54
  407f90:	d65f03c0 	ret
  407f94:	54000320 	b.eq	0x407ff8  // b.none
  407f98:	b400292a 	cbz	x10, 0x4084bc
  407f9c:	d2800020 	mov	x0, #0x1                   	// #1
  407fa0:	3101d09f 	cmn	w4, #0x74
  407fa4:	5400020b 	b.lt	0x407fe4  // b.tstop
  407fa8:	4b0403e4 	neg	w4, w4
  407fac:	b24d0063 	orr	x3, x3, #0x8000000000000
  407fb0:	7100fc9f 	cmp	w4, #0x3f
  407fb4:	540037ac 	b.gt	0x4086a8
  407fb8:	52800800 	mov	w0, #0x40                  	// #64
  407fbc:	4b040000 	sub	w0, w0, w4
  407fc0:	9ac424e2 	lsr	x2, x7, x4
  407fc4:	9ac020e7 	lsl	x7, x7, x0
  407fc8:	f10000ff 	cmp	x7, #0x0
  407fcc:	9a9f07e1 	cset	x1, ne	// ne = any
  407fd0:	9ac02060 	lsl	x0, x3, x0
  407fd4:	aa020000 	orr	x0, x0, x2
  407fd8:	9ac42464 	lsr	x4, x3, x4
  407fdc:	aa010000 	orr	x0, x0, x1
  407fe0:	8b0401ad 	add	x13, x13, x4
  407fe4:	ab0e0000 	adds	x0, x0, x14
  407fe8:	aa0f03e2 	mov	x2, x15
  407fec:	aa0003e7 	mov	x7, x0
  407ff0:	9a8d35a3 	cinc	x3, x13, cs	// cs = hs, nlast
  407ff4:	17ffff7e 	b	0x407dec
  407ff8:	91000440 	add	x0, x2, #0x1
  407ffc:	f27f341f 	tst	x0, #0x7ffe
  408000:	54001d41 	b.ne	0x4083a8  // b.any
  408004:	aa07006a 	orr	x10, x3, x7
  408008:	b5003042 	cbnz	x2, 0x408610
  40800c:	b400342a 	cbz	x10, 0x408690
  408010:	aa0e01a0 	orr	x0, x13, x14
  408014:	b4000ca0 	cbz	x0, 0x4081a8
  408018:	ab0e00ee 	adds	x14, x7, x14
  40801c:	aa0e03e7 	mov	x7, x14
  408020:	9a0301a3 	adc	x3, x13, x3
  408024:	b7983ce3 	tbnz	x3, #51, 0x4087c0
  408028:	aa0301ca 	orr	x10, x14, x3
  40802c:	b400222a 	cbz	x10, 0x408470
  408030:	d2800001 	mov	x1, #0x0                   	// #0
  408034:	52800109 	mov	w9, #0x8                   	// #8
  408038:	3758030b 	tbnz	w11, #11, 0x408098
  40803c:	aa0303ed 	mov	x13, x3
  408040:	aa0703ee 	mov	x14, x7
  408044:	d503201f 	nop
  408048:	d343fda4 	lsr	x4, x13, #3
  40804c:	93ce0daa 	extr	x10, x13, x14, #3
  408050:	d2800002 	mov	x2, #0x0                   	// #0
  408054:	52800009 	mov	w9, #0x0                   	// #0
  408058:	17ffff36 	b	0x407d30
  40805c:	cb050042 	sub	x2, x2, x5
  408060:	924cf803 	and	x3, x0, #0xfff7ffffffffffff
  408064:	924008e0 	and	x0, x7, #0x7
  408068:	17ffff6c 	b	0x407e18
  40806c:	f24008ff 	tst	x7, #0x7
  408070:	540009c0 	b.eq	0x4081a8  // b.none
  408074:	926a0565 	and	x5, x11, #0xc00000
  408078:	f15000bf 	cmp	x5, #0x400, lsl #12
  40807c:	54002800 	b.eq	0x40857c  // b.none
  408080:	f16000bf 	cmp	x5, #0x800, lsl #12
  408084:	54002960 	b.eq	0x4085b0  // b.none
  408088:	b4002665 	cbz	x5, 0x408554
  40808c:	924d0061 	and	x1, x3, #0x8000000000000
  408090:	12000188 	and	w8, w12, #0x1
  408094:	52800309 	mov	w9, #0x18                  	// #24
  408098:	d2800002 	mov	x2, #0x0                   	// #0
  40809c:	d503201f 	nop
  4080a0:	b4ffed61 	cbz	x1, 0x407e4c
  4080a4:	91000441 	add	x1, x2, #0x1
  4080a8:	926a0565 	and	x5, x11, #0xc00000
  4080ac:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  4080b0:	eb00003f 	cmp	x1, x0
  4080b4:	540001a0 	b.eq	0x4080e8  // b.none
  4080b8:	924cf864 	and	x4, x3, #0xfff7ffffffffffff
  4080bc:	12003821 	and	w1, w1, #0x7fff
  4080c0:	93c70c8a 	extr	x10, x4, x7, #3
  4080c4:	d343c884 	ubfx	x4, x4, #3, #48
  4080c8:	17ffffab 	b	0x407f74
  4080cc:	eb09015f 	cmp	x10, x9
  4080d0:	540001a0 	b.eq	0x408104  // b.none
  4080d4:	b24d01ad 	orr	x13, x13, #0x8000000000000
  4080d8:	d2800020 	mov	x0, #0x1                   	// #1
  4080dc:	7101d09f 	cmp	w4, #0x74
  4080e0:	54ffdc8d 	b.le	0x407c70
  4080e4:	17fffef0 	b	0x407ca4
  4080e8:	b50008a5 	cbnz	x5, 0x4081fc
  4080ec:	52800280 	mov	w0, #0x14                  	// #20
  4080f0:	2a000129 	orr	w9, w9, w0
  4080f4:	528fffe1 	mov	w1, #0x7fff                	// #32767
  4080f8:	d2800004 	mov	x4, #0x0                   	// #0
  4080fc:	d280000a 	mov	x10, #0x0                   	// #0
  408100:	17ffff9d 	b	0x407f74
  408104:	aa07006a 	orr	x10, x3, x7
  408108:	b4ffec0a 	cbz	x10, 0x407e88
  40810c:	d372fc69 	lsr	x9, x3, #50
  408110:	b3430865 	bfi	x5, x3, #61, #3
  408114:	d2400129 	eor	x9, x9, #0x1
  408118:	aa0503ea 	mov	x10, x5
  40811c:	d343fc64 	lsr	x4, x3, #3
  408120:	12000129 	and	w9, w9, #0x1
  408124:	17ffff8c 	b	0x407f54
  408128:	dac010e0 	clz	x0, x7
  40812c:	1100d001 	add	w1, w0, #0x34
  408130:	9100d005 	add	x5, x0, #0x34
  408134:	7100fc3f 	cmp	w1, #0x3f
  408138:	54ffdc8d 	b.le	0x407cc8
  40813c:	51003000 	sub	w0, w0, #0xc
  408140:	9ac020e0 	lsl	x0, x7, x0
  408144:	eb05005f 	cmp	x2, x5
  408148:	5400100c 	b.gt	0x408348
  40814c:	4b020022 	sub	w2, w1, w2
  408150:	11000441 	add	w1, w2, #0x1
  408154:	7100fc3f 	cmp	w1, #0x3f
  408158:	54002bed 	b.le	0x4086d4
  40815c:	5100fc42 	sub	w2, w2, #0x3f
  408160:	9ac22407 	lsr	x7, x0, x2
  408164:	7101003f 	cmp	w1, #0x40
  408168:	540000e0 	b.eq	0x408184  // b.none
  40816c:	52801002 	mov	w2, #0x80                  	// #128
  408170:	4b010041 	sub	w1, w2, w1
  408174:	9ac12000 	lsl	x0, x0, x1
  408178:	f100001f 	cmp	x0, #0x0
  40817c:	9a9f07e0 	cset	x0, ne	// ne = any
  408180:	aa0000e7 	orr	x7, x7, x0
  408184:	aa0703e0 	mov	x0, x7
  408188:	17fffee4 	b	0x407d18
  40818c:	eb09015f 	cmp	x10, x9
  408190:	54fffba0 	b.eq	0x408104  // b.none
  408194:	b24d01ad 	orr	x13, x13, #0x8000000000000
  408198:	d2800020 	mov	x0, #0x1                   	// #1
  40819c:	7101d09f 	cmp	w4, #0x74
  4081a0:	54ffe06d 	b.le	0x407dac
  4081a4:	17ffff0f 	b	0x407de0
  4081a8:	924d0061 	and	x1, x3, #0x8000000000000
  4081ac:	12000188 	and	w8, w12, #0x1
  4081b0:	365febcb 	tbz	w11, #11, 0x407f28
  4081b4:	1400000f 	b	0x4081f0
  4081b8:	aa070062 	orr	x2, x3, x7
  4081bc:	b5000862 	cbnz	x2, 0x4082c8
  4081c0:	12000008 	and	w8, w0, #0x1
  4081c4:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  4081c8:	eb0101ff 	cmp	x15, x1
  4081cc:	540014c0 	b.eq	0x408464  // b.none
  4081d0:	b500436f 	cbnz	x15, 0x408a3c
  4081d4:	aa0e01a1 	orr	x1, x13, x14
  4081d8:	b4ffda41 	cbz	x1, 0x407d20
  4081dc:	365ff36b 	tbz	w11, #11, 0x408048
  4081e0:	aa0d03e3 	mov	x3, x13
  4081e4:	aa0e03e7 	mov	x7, x14
  4081e8:	aa0003ec 	mov	x12, x0
  4081ec:	d2800001 	mov	x1, #0x0                   	// #0
  4081f0:	52800109 	mov	w9, #0x8                   	// #8
  4081f4:	d2800002 	mov	x2, #0x0                   	// #0
  4081f8:	17ffffaa 	b	0x4080a0
  4081fc:	f15000bf 	cmp	x5, #0x400, lsl #12
  408200:	540013e0 	b.eq	0x40847c  // b.none
  408204:	f16000bf 	cmp	x5, #0x800, lsl #12
  408208:	1a9f17e0 	cset	w0, eq	// eq = none
  40820c:	6a0c001f 	tst	w0, w12
  408210:	52800280 	mov	w0, #0x14                  	// #20
  408214:	54001381 	b.ne	0x408484  // b.any
  408218:	2a000129 	orr	w9, w9, w0
  40821c:	92fc0004 	mov	x4, #0x1fffffffffffffff    	// #2305843009213693951
  408220:	9280000a 	mov	x10, #0xffffffffffffffff    	// #-1
  408224:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  408228:	17fffec2 	b	0x407d30
  40822c:	b500166c 	cbnz	x12, 0x4084f8
  408230:	52800008 	mov	w8, #0x0                   	// #0
  408234:	17ffff05 	b	0x407e48
  408238:	b400096c 	cbz	x12, 0x408364
  40823c:	52800028 	mov	w8, #0x1                   	// #1
  408240:	52800209 	mov	w9, #0x10                  	// #16
  408244:	17ffff02 	b	0x407e4c
  408248:	eb0e00e4 	subs	x4, x7, x14
  40824c:	da0d0061 	sbc	x1, x3, x13
  408250:	b7980f01 	tbnz	x1, #51, 0x408430
  408254:	aa010080 	orr	x0, x4, x1
  408258:	b4001480 	cbz	x0, 0x4084e8
  40825c:	aa0103e3 	mov	x3, x1
  408260:	aa0403e7 	mov	x7, x4
  408264:	17fffe95 	b	0x407cb8
  408268:	f26a056a 	ands	x10, x11, #0xc00000
  40826c:	54002d00 	b.eq	0x40880c  // b.none
  408270:	f150015f 	cmp	x10, #0x400, lsl #12
  408274:	54003500 	b.eq	0x408914  // b.none
  408278:	f160015f 	cmp	x10, #0x800, lsl #12
  40827c:	540038a0 	b.eq	0x408990  // b.none
  408280:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
  408284:	aa0703e3 	mov	x3, x7
  408288:	52800289 	mov	w9, #0x14                  	// #20
  40828c:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  408290:	924d0061 	and	x1, x3, #0x8000000000000
  408294:	12000188 	and	w8, w12, #0x1
  408298:	17ffff82 	b	0x4080a0
  40829c:	52801000 	mov	w0, #0x80                  	// #128
  4082a0:	4b040000 	sub	w0, w0, w4
  4082a4:	71010084 	subs	w4, w4, #0x40
  4082a8:	9ac021a0 	lsl	x0, x13, x0
  4082ac:	aa0001c0 	orr	x0, x14, x0
  4082b0:	9a8e100e 	csel	x14, x0, x14, ne	// ne = any
  4082b4:	9ac425a4 	lsr	x4, x13, x4
  4082b8:	f10001df 	cmp	x14, #0x0
  4082bc:	9a9f07e0 	cset	x0, ne	// ne = any
  4082c0:	aa040000 	orr	x0, x0, x4
  4082c4:	17fffe78 	b	0x407ca4
  4082c8:	2a2403e4 	mvn	w4, w4
  4082cc:	34001bc4 	cbz	w4, 0x408644
  4082d0:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  4082d4:	eb0201ff 	cmp	x15, x2
  4082d8:	54001e00 	b.eq	0x408698  // b.none
  4082dc:	aa0003ec 	mov	x12, x0
  4082e0:	d2800020 	mov	x0, #0x1                   	// #1
  4082e4:	7101d09f 	cmp	w4, #0x74
  4082e8:	540001cc 	b.gt	0x408320
  4082ec:	7100fc9f 	cmp	w4, #0x3f
  4082f0:	540017ac 	b.gt	0x4085e4
  4082f4:	52800800 	mov	w0, #0x40                  	// #64
  4082f8:	4b040000 	sub	w0, w0, w4
  4082fc:	9ac424e2 	lsr	x2, x7, x4
  408300:	9ac020e7 	lsl	x7, x7, x0
  408304:	f10000ff 	cmp	x7, #0x0
  408308:	9a9f07e1 	cset	x1, ne	// ne = any
  40830c:	9ac02060 	lsl	x0, x3, x0
  408310:	aa020000 	orr	x0, x0, x2
  408314:	9ac42464 	lsr	x4, x3, x4
  408318:	aa010000 	orr	x0, x0, x1
  40831c:	cb0401ad 	sub	x13, x13, x4
  408320:	eb0001c0 	subs	x0, x14, x0
  408324:	aa0f03e2 	mov	x2, x15
  408328:	aa0003e7 	mov	x7, x0
  40832c:	da1f01a3 	sbc	x3, x13, xzr
  408330:	17fffe60 	b	0x407cb0
  408334:	b10010e7 	adds	x7, x7, #0x4
  408338:	52800209 	mov	w9, #0x10                  	// #16
  40833c:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  408340:	924d0061 	and	x1, x3, #0x8000000000000
  408344:	17ffff57 	b	0x4080a0
  408348:	cb050042 	sub	x2, x2, x5
  40834c:	924cf800 	and	x0, x0, #0xfff7ffffffffffff
  408350:	d343fc04 	lsr	x4, x0, #3
  408354:	93c30c0a 	extr	x10, x0, x3, #3
  408358:	12000188 	and	w8, w12, #0x1
  40835c:	52800009 	mov	w9, #0x0                   	// #0
  408360:	17fffefd 	b	0x407f54
  408364:	b10020e7 	adds	x7, x7, #0x8
  408368:	52800008 	mov	w8, #0x0                   	// #0
  40836c:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  408370:	52800209 	mov	w9, #0x10                  	// #16
  408374:	924d0061 	and	x1, x3, #0x8000000000000
  408378:	17ffff4a 	b	0x4080a0
  40837c:	52801000 	mov	w0, #0x80                  	// #128
  408380:	4b040000 	sub	w0, w0, w4
  408384:	71010081 	subs	w1, w4, #0x40
  408388:	9ac021a0 	lsl	x0, x13, x0
  40838c:	aa0001c0 	orr	x0, x14, x0
  408390:	9a8e100e 	csel	x14, x0, x14, ne	// ne = any
  408394:	9ac125a1 	lsr	x1, x13, x1
  408398:	f10001df 	cmp	x14, #0x0
  40839c:	9a9f07e0 	cset	x0, ne	// ne = any
  4083a0:	aa010000 	orr	x0, x0, x1
  4083a4:	17fffe8f 	b	0x407de0
  4083a8:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  4083ac:	eb01001f 	cmp	x0, x1
  4083b0:	54fff5c0 	b.eq	0x408268  // b.none
  4083b4:	ab0e00ee 	adds	x14, x7, x14
  4083b8:	aa0003e2 	mov	x2, x0
  4083bc:	9a0301ad 	adc	x13, x13, x3
  4083c0:	d3410dc0 	ubfx	x0, x14, #1, #3
  4083c4:	d341fda3 	lsr	x3, x13, #1
  4083c8:	93ce05a7 	extr	x7, x13, x14, #1
  4083cc:	17fffe93 	b	0x407e18
  4083d0:	d28fffe4 	mov	x4, #0x7fff                	// #32767
  4083d4:	eb04005f 	cmp	x2, x4
  4083d8:	54001900 	b.eq	0x4086f8  // b.none
  4083dc:	eb0401ff 	cmp	x15, x4
  4083e0:	54001b40 	b.eq	0x408748  // b.none
  4083e4:	52800009 	mov	w9, #0x0                   	// #0
  4083e8:	b40018e1 	cbz	x1, 0x408704
  4083ec:	d343fc64 	lsr	x4, x3, #3
  4083f0:	d3430861 	lsl	x1, x3, #61
  4083f4:	b4001a2a 	cbz	x10, 0x408738
  4083f8:	9240f0a5 	and	x5, x5, #0x1fffffffffffffff
  4083fc:	aa0100a1 	orr	x1, x5, x1
  408400:	b67800e4 	tbz	x4, #47, 0x40841c
  408404:	d343fda2 	lsr	x2, x13, #3
  408408:	b79000ad 	tbnz	x13, #50, 0x40841c
  40840c:	aa0603e1 	mov	x1, x6
  408410:	12000008 	and	w8, w0, #0x1
  408414:	b34309a1 	bfi	x1, x13, #61, #3
  408418:	aa0203e4 	mov	x4, x2
  40841c:	93c1f484 	extr	x4, x4, x1, #61
  408420:	b3430881 	bfi	x1, x4, #61, #3
  408424:	d343fc84 	lsr	x4, x4, #3
  408428:	aa0103ea 	mov	x10, x1
  40842c:	17fffecd 	b	0x407f60
  408430:	eb0701ce 	subs	x14, x14, x7
  408434:	aa0003ec 	mov	x12, x0
  408438:	aa0e03e7 	mov	x7, x14
  40843c:	da0301a3 	sbc	x3, x13, x3
  408440:	17fffe1e 	b	0x407cb8
  408444:	ab0e00ee 	adds	x14, x7, x14
  408448:	aa0e03e7 	mov	x7, x14
  40844c:	9a0301a3 	adc	x3, x13, x3
  408450:	17fffe67 	b	0x407dec
  408454:	aa0c03e0 	mov	x0, x12
  408458:	d28fffe1 	mov	x1, #0x7fff                	// #32767
  40845c:	eb0101ff 	cmp	x15, x1
  408460:	54ffeb81 	b.ne	0x4081d0  // b.any
  408464:	aa0e01aa 	orr	x10, x13, x14
  408468:	b5ffd28a 	cbnz	x10, 0x407eb8
  40846c:	aa0f03e2 	mov	x2, x15
  408470:	d2800004 	mov	x4, #0x0                   	// #0
  408474:	52800009 	mov	w9, #0x0                   	// #0
  408478:	17fffeb7 	b	0x407f54
  40847c:	52800280 	mov	w0, #0x14                  	// #20
  408480:	b5ffeccc 	cbnz	x12, 0x408218
  408484:	2a000129 	orr	w9, w9, w0
  408488:	17ffff1b 	b	0x4080f4
  40848c:	54ffd260 	b.eq	0x407ed8  // b.none
  408490:	b4ffe94a 	cbz	x10, 0x4081b8
  408494:	3101d09f 	cmn	w4, #0x74
  408498:	5400058b 	b.lt	0x408548  // b.tstop
  40849c:	4b0403e4 	neg	w4, w4
  4084a0:	b24d0063 	orr	x3, x3, #0x8000000000000
  4084a4:	aa0003ec 	mov	x12, x0
  4084a8:	17ffff91 	b	0x4082ec
  4084ac:	eb0e00ee 	subs	x14, x7, x14
  4084b0:	aa0e03e7 	mov	x7, x14
  4084b4:	da0d0063 	sbc	x3, x3, x13
  4084b8:	17fffdfe 	b	0x407cb0
  4084bc:	aa070060 	orr	x0, x3, x7
  4084c0:	b4fffca0 	cbz	x0, 0x408454
  4084c4:	2a2403e4 	mvn	w4, w4
  4084c8:	340010e4 	cbz	w4, 0x4086e4
  4084cc:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  4084d0:	eb0001ff 	cmp	x15, x0
  4084d4:	54001620 	b.eq	0x408798  // b.none
  4084d8:	d2800020 	mov	x0, #0x1                   	// #1
  4084dc:	7101d09f 	cmp	w4, #0x74
  4084e0:	54ffd82c 	b.gt	0x407fe4
  4084e4:	17fffeb3 	b	0x407fb0
  4084e8:	926a056b 	and	x11, x11, #0xc00000
  4084ec:	f160017f 	cmp	x11, #0x800, lsl #12
  4084f0:	1a9f17e8 	cset	w8, eq	// eq = none
  4084f4:	17fffe0b 	b	0x407d20
  4084f8:	b10020e7 	adds	x7, x7, #0x8
  4084fc:	52800028 	mov	w8, #0x1                   	// #1
  408500:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  408504:	52800209 	mov	w9, #0x10                  	// #16
  408508:	924d0061 	and	x1, x3, #0x8000000000000
  40850c:	17fffee5 	b	0x4080a0
  408510:	926a056a 	and	x10, x11, #0xc00000
  408514:	aa0a03e5 	mov	x5, x10
  408518:	b4000b4a 	cbz	x10, 0x408680
  40851c:	f150015f 	cmp	x10, #0x400, lsl #12
  408520:	54001420 	b.eq	0x4087a4  // b.none
  408524:	52800289 	mov	w9, #0x14                  	// #20
  408528:	f160015f 	cmp	x10, #0x800, lsl #12
  40852c:	54ffdde1 	b.ne	0x4080e8  // b.any
  408530:	b500226c 	cbnz	x12, 0x40897c
  408534:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
  408538:	52800008 	mov	w8, #0x0                   	// #0
  40853c:	aa0303e7 	mov	x7, x3
  408540:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  408544:	17fffed8 	b	0x4080a4
  408548:	aa0003ec 	mov	x12, x0
  40854c:	d2800020 	mov	x0, #0x1                   	// #1
  408550:	17ffff74 	b	0x408320
  408554:	92400ce0 	and	x0, x7, #0xf
  408558:	12000188 	and	w8, w12, #0x1
  40855c:	f100101f 	cmp	x0, #0x4
  408560:	54000160 	b.eq	0x40858c  // b.none
  408564:	b10010e7 	adds	x7, x7, #0x4
  408568:	52800309 	mov	w9, #0x18                  	// #24
  40856c:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  408570:	d2800002 	mov	x2, #0x0                   	// #0
  408574:	924d0061 	and	x1, x3, #0x8000000000000
  408578:	17fffeca 	b	0x4080a0
  40857c:	b500010c 	cbnz	x12, 0x40859c
  408580:	b10020e7 	adds	x7, x7, #0x8
  408584:	52800008 	mov	w8, #0x0                   	// #0
  408588:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  40858c:	924d0061 	and	x1, x3, #0x8000000000000
  408590:	52800309 	mov	w9, #0x18                  	// #24
  408594:	d2800002 	mov	x2, #0x0                   	// #0
  408598:	17fffec2 	b	0x4080a0
  40859c:	924d0061 	and	x1, x3, #0x8000000000000
  4085a0:	52800028 	mov	w8, #0x1                   	// #1
  4085a4:	52800309 	mov	w9, #0x18                  	// #24
  4085a8:	d2800002 	mov	x2, #0x0                   	// #0
  4085ac:	17fffebd 	b	0x4080a0
  4085b0:	b400010c 	cbz	x12, 0x4085d0
  4085b4:	b10020e7 	adds	x7, x7, #0x8
  4085b8:	52800028 	mov	w8, #0x1                   	// #1
  4085bc:	9a833463 	cinc	x3, x3, cs	// cs = hs, nlast
  4085c0:	52800309 	mov	w9, #0x18                  	// #24
  4085c4:	924d0061 	and	x1, x3, #0x8000000000000
  4085c8:	d2800002 	mov	x2, #0x0                   	// #0
  4085cc:	17fffeb5 	b	0x4080a0
  4085d0:	924d0061 	and	x1, x3, #0x8000000000000
  4085d4:	52800008 	mov	w8, #0x0                   	// #0
  4085d8:	52800309 	mov	w9, #0x18                  	// #24
  4085dc:	d2800002 	mov	x2, #0x0                   	// #0
  4085e0:	17fffeb0 	b	0x4080a0
  4085e4:	52801000 	mov	w0, #0x80                  	// #128
  4085e8:	4b040000 	sub	w0, w0, w4
  4085ec:	71010084 	subs	w4, w4, #0x40
  4085f0:	9ac02060 	lsl	x0, x3, x0
  4085f4:	aa0000e0 	orr	x0, x7, x0
  4085f8:	9a871007 	csel	x7, x0, x7, ne	// ne = any
  4085fc:	9ac42460 	lsr	x0, x3, x4
  408600:	f10000ff 	cmp	x7, #0x0
  408604:	9a9f07e1 	cset	x1, ne	// ne = any
  408608:	aa000020 	orr	x0, x1, x0
  40860c:	17ffff45 	b	0x408320
  408610:	d28fffe0 	mov	x0, #0x7fff                	// #32767
  408614:	eb00005f 	cmp	x2, x0
  408618:	54000a60 	b.eq	0x408764  // b.none
  40861c:	52800009 	mov	w9, #0x0                   	// #0
  408620:	eb0001ff 	cmp	x15, x0
  408624:	54001100 	b.eq	0x408844  // b.none
  408628:	aa0e01b0 	orr	x16, x13, x14
  40862c:	b5000d8a 	cbnz	x10, 0x4087dc
  408630:	b34309a6 	bfi	x6, x13, #61, #3
  408634:	d343fda4 	lsr	x4, x13, #3
  408638:	aa0603ea 	mov	x10, x6
  40863c:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  408640:	17fffe45 	b	0x407f54
  408644:	eb0701ce 	subs	x14, x14, x7
  408648:	aa0f03e2 	mov	x2, x15
  40864c:	aa0e03e7 	mov	x7, x14
  408650:	da0301a3 	sbc	x3, x13, x3
  408654:	aa0003ec 	mov	x12, x0
  408658:	17fffd96 	b	0x407cb0
  40865c:	b4fff46a 	cbz	x10, 0x4084e8
  408660:	12000008 	and	w8, w0, #0x1
  408664:	365fcf2b 	tbz	w11, #11, 0x408048
  408668:	aa0d03e3 	mov	x3, x13
  40866c:	aa0e03e7 	mov	x7, x14
  408670:	aa0003ec 	mov	x12, x0
  408674:	52800109 	mov	w9, #0x8                   	// #8
  408678:	d2800002 	mov	x2, #0x0                   	// #0
  40867c:	17fffe89 	b	0x4080a0
  408680:	2a0203e1 	mov	w1, w2
  408684:	d2800004 	mov	x4, #0x0                   	// #0
  408688:	52800289 	mov	w9, #0x14                  	// #20
  40868c:	17fffe3a 	b	0x407f74
  408690:	aa0c03e0 	mov	x0, x12
  408694:	17fffed0 	b	0x4081d4
  408698:	aa0e01aa 	orr	x10, x13, x14
  40869c:	12000008 	and	w8, w0, #0x1
  4086a0:	b4ffbf6a 	cbz	x10, 0x407e8c
  4086a4:	17fffe05 	b	0x407eb8
  4086a8:	52801000 	mov	w0, #0x80                  	// #128
  4086ac:	4b040000 	sub	w0, w0, w4
  4086b0:	71010084 	subs	w4, w4, #0x40
  4086b4:	9ac02060 	lsl	x0, x3, x0
  4086b8:	aa0000e0 	orr	x0, x7, x0
  4086bc:	9a871007 	csel	x7, x0, x7, ne	// ne = any
  4086c0:	9ac42461 	lsr	x1, x3, x4
  4086c4:	f10000ff 	cmp	x7, #0x0
  4086c8:	9a9f07e0 	cset	x0, ne	// ne = any
  4086cc:	aa010000 	orr	x0, x0, x1
  4086d0:	17fffe45 	b	0x407fe4
  4086d4:	52800804 	mov	w4, #0x40                  	// #64
  4086d8:	d2800002 	mov	x2, #0x0                   	// #0
  4086dc:	4b010084 	sub	w4, w4, w1
  4086e0:	17fffd89 	b	0x407d04
  4086e4:	ab0e00ee 	adds	x14, x7, x14
  4086e8:	aa0f03e2 	mov	x2, x15
  4086ec:	aa0e03e7 	mov	x7, x14
  4086f0:	9a0301a3 	adc	x3, x13, x3
  4086f4:	17fffdbe 	b	0x407dec
  4086f8:	b5000921 	cbnz	x1, 0x40881c
  4086fc:	eb0201ff 	cmp	x15, x2
  408700:	54001180 	b.eq	0x408930  // b.none
  408704:	52800009 	mov	w9, #0x0                   	// #0
  408708:	b400024a 	cbz	x10, 0x408750
  40870c:	b34309a6 	bfi	x6, x13, #61, #3
  408710:	d343fda4 	lsr	x4, x13, #3
  408714:	aa0603ea 	mov	x10, x6
  408718:	12000008 	and	w8, w0, #0x1
  40871c:	17fffe11 	b	0x407f60
  408720:	aa010080 	orr	x0, x4, x1
  408724:	b4ffee20 	cbz	x0, 0x4084e8
  408728:	aa0103e3 	mov	x3, x1
  40872c:	aa0403e7 	mov	x7, x4
  408730:	17fffe40 	b	0x408030
  408734:	52800009 	mov	w9, #0x0                   	// #0
  408738:	9240f0a5 	and	x5, x5, #0x1fffffffffffffff
  40873c:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  408740:	aa0100aa 	orr	x10, x5, x1
  408744:	17fffe04 	b	0x407f54
  408748:	b5000a6a 	cbnz	x10, 0x408894
  40874c:	b50001c1 	cbnz	x1, 0x408784
  408750:	52800008 	mov	w8, #0x0                   	// #0
  408754:	92ffffe4 	mov	x4, #0xffffffffffff        	// #281474976710655
  408758:	9280000a 	mov	x10, #0xffffffffffffffff    	// #-1
  40875c:	52800029 	mov	w9, #0x1                   	// #1
  408760:	17fffe02 	b	0x407f68
  408764:	b500086a 	cbnz	x10, 0x408870
  408768:	eb0201ff 	cmp	x15, x2
  40876c:	54001200 	b.eq	0x4089ac  // b.none
  408770:	b34309a6 	bfi	x6, x13, #61, #3
  408774:	d343fda4 	lsr	x4, x13, #3
  408778:	aa0603ea 	mov	x10, x6
  40877c:	52800009 	mov	w9, #0x0                   	// #0
  408780:	17fffdf5 	b	0x407f54
  408784:	52800009 	mov	w9, #0x0                   	// #0
  408788:	b3430865 	bfi	x5, x3, #61, #3
  40878c:	d343fc64 	lsr	x4, x3, #3
  408790:	aa0503ea 	mov	x10, x5
  408794:	17fffdf3 	b	0x407f60
  408798:	aa0e01aa 	orr	x10, x13, x14
  40879c:	b4ffb78a 	cbz	x10, 0x407e8c
  4087a0:	17fffdc6 	b	0x407eb8
  4087a4:	b50005ac 	cbnz	x12, 0x408858
  4087a8:	2a0203e1 	mov	w1, w2
  4087ac:	52800008 	mov	w8, #0x0                   	// #0
  4087b0:	d2800004 	mov	x4, #0x0                   	// #0
  4087b4:	d280000a 	mov	x10, #0x0                   	// #0
  4087b8:	52800289 	mov	w9, #0x14                  	// #20
  4087bc:	17fffdee 	b	0x407f74
  4087c0:	924cf864 	and	x4, x3, #0xfff7ffffffffffff
  4087c4:	93ce0c6a 	extr	x10, x3, x14, #3
  4087c8:	d2800022 	mov	x2, #0x1                   	// #1
  4087cc:	d343fc84 	lsr	x4, x4, #3
  4087d0:	17fffd57 	b	0x407d2c
  4087d4:	b790096d 	tbnz	x13, #50, 0x408900
  4087d8:	52800029 	mov	w9, #0x1                   	// #1
  4087dc:	d343fc64 	lsr	x4, x3, #3
  4087e0:	d3430861 	lsl	x1, x3, #61
  4087e4:	b4fffab0 	cbz	x16, 0x408738
  4087e8:	9240f0a5 	and	x5, x5, #0x1fffffffffffffff
  4087ec:	aa0100a1 	orr	x1, x5, x1
  4087f0:	b67fe164 	tbz	x4, #47, 0x40841c
  4087f4:	d343fda0 	lsr	x0, x13, #3
  4087f8:	b797e12d 	tbnz	x13, #50, 0x40841c
  4087fc:	9240f0c1 	and	x1, x6, #0x1fffffffffffffff
  408800:	aa0003e4 	mov	x4, x0
  408804:	aa0df421 	orr	x1, x1, x13, lsl #61
  408808:	17ffff05 	b	0x40841c
  40880c:	2a0003e1 	mov	w1, w0
  408810:	d2800004 	mov	x4, #0x0                   	// #0
  408814:	52800289 	mov	w9, #0x14                  	// #20
  408818:	17fffdd7 	b	0x407f74
  40881c:	b79004e3 	tbnz	x3, #50, 0x4088b8
  408820:	eb0201ff 	cmp	x15, x2
  408824:	54000ce0 	b.eq	0x4089c0  // b.none
  408828:	d343fc64 	lsr	x4, x3, #3
  40882c:	d3430861 	lsl	x1, x3, #61
  408830:	b40002ea 	cbz	x10, 0x40888c
  408834:	9240f0a5 	and	x5, x5, #0x1fffffffffffffff
  408838:	52800029 	mov	w9, #0x1                   	// #1
  40883c:	aa0100a1 	orr	x1, x5, x1
  408840:	17fffef7 	b	0x40841c
  408844:	aa0e01b0 	orr	x16, x13, x14
  408848:	b50004b0 	cbnz	x16, 0x4088dc
  40884c:	b5fff9ea 	cbnz	x10, 0x408788
  408850:	d2800004 	mov	x4, #0x0                   	// #0
  408854:	17fffdc8 	b	0x407f74
  408858:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
  40885c:	52800028 	mov	w8, #0x1                   	// #1
  408860:	aa0303e7 	mov	x7, x3
  408864:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  408868:	52800289 	mov	w9, #0x14                  	// #20
  40886c:	17fffe0e 	b	0x4080a4
  408870:	b7900723 	tbnz	x3, #50, 0x408954
  408874:	eb0201ff 	cmp	x15, x2
  408878:	54000c60 	b.eq	0x408a04  // b.none
  40887c:	aa0e01ae 	orr	x14, x13, x14
  408880:	d343fc64 	lsr	x4, x3, #3
  408884:	d3430861 	lsl	x1, x3, #61
  408888:	b5fffd6e 	cbnz	x14, 0x408834
  40888c:	52800029 	mov	w9, #0x1                   	// #1
  408890:	17ffffaa 	b	0x408738
  408894:	b690056d 	tbz	x13, #50, 0x408940
  408898:	b5000341 	cbnz	x1, 0x408900
  40889c:	9240f0c1 	and	x1, x6, #0x1fffffffffffffff
  4088a0:	d343fda4 	lsr	x4, x13, #3
  4088a4:	aa0df42a 	orr	x10, x1, x13, lsl #61
  4088a8:	12000008 	and	w8, w0, #0x1
  4088ac:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  4088b0:	52800009 	mov	w9, #0x0                   	// #0
  4088b4:	17fffda8 	b	0x407f54
  4088b8:	eb0201ff 	cmp	x15, x2
  4088bc:	540008a0 	b.eq	0x4089d0  // b.none
  4088c0:	d343fc64 	lsr	x4, x3, #3
  4088c4:	d3430861 	lsl	x1, x3, #61
  4088c8:	b4fff36a 	cbz	x10, 0x408734
  4088cc:	9240f0a5 	and	x5, x5, #0x1fffffffffffffff
  4088d0:	52800009 	mov	w9, #0x0                   	// #0
  4088d4:	aa0100a1 	orr	x1, x5, x1
  4088d8:	17fffecb 	b	0x408404
  4088dc:	52800029 	mov	w9, #0x1                   	// #1
  4088e0:	b697ea4d 	tbz	x13, #50, 0x408628
  4088e4:	b50000ea 	cbnz	x10, 0x408900
  4088e8:	9240f0c1 	and	x1, x6, #0x1fffffffffffffff
  4088ec:	d343fda4 	lsr	x4, x13, #3
  4088f0:	aa0df42a 	orr	x10, x1, x13, lsl #61
  4088f4:	d28fffe2 	mov	x2, #0x7fff                	// #32767
  4088f8:	52800009 	mov	w9, #0x0                   	// #0
  4088fc:	17fffd96 	b	0x407f54
  408900:	52800009 	mov	w9, #0x0                   	// #0
  408904:	9240f0a1 	and	x1, x5, #0x1fffffffffffffff
  408908:	d343fc64 	lsr	x4, x3, #3
  40890c:	aa03f421 	orr	x1, x1, x3, lsl #61
  408910:	17fffec3 	b	0x40841c
  408914:	b5fffa2c 	cbnz	x12, 0x408858
  408918:	2a0003e1 	mov	w1, w0
  40891c:	52800008 	mov	w8, #0x0                   	// #0
  408920:	d2800004 	mov	x4, #0x0                   	// #0
  408924:	d280000a 	mov	x10, #0x0                   	// #0
  408928:	52800289 	mov	w9, #0x14                  	// #20
  40892c:	17fffd92 	b	0x407f74
  408930:	b4fff10a 	cbz	x10, 0x408750
  408934:	b797fb4d 	tbnz	x13, #50, 0x40889c
  408938:	52800029 	mov	w9, #0x1                   	// #1
  40893c:	17ffff74 	b	0x40870c
  408940:	52800029 	mov	w9, #0x1                   	// #1
  408944:	b4ffee41 	cbz	x1, 0x40870c
  408948:	d343fc64 	lsr	x4, x3, #3
  40894c:	d3430861 	lsl	x1, x3, #61
  408950:	17fffeaa 	b	0x4083f8
  408954:	eb0201ff 	cmp	x15, x2
  408958:	54000480 	b.eq	0x4089e8  // b.none
  40895c:	aa0e01ae 	orr	x14, x13, x14
  408960:	d343fc64 	lsr	x4, x3, #3
  408964:	d3430861 	lsl	x1, x3, #61
  408968:	b4ffee6e 	cbz	x14, 0x408734
  40896c:	9240f0a5 	and	x5, x5, #0x1fffffffffffffff
  408970:	52800009 	mov	w9, #0x0                   	// #0
  408974:	aa0100a1 	orr	x1, x5, x1
  408978:	17ffff9f 	b	0x4087f4
  40897c:	2a0203e1 	mov	w1, w2
  408980:	52800028 	mov	w8, #0x1                   	// #1
  408984:	d2800004 	mov	x4, #0x0                   	// #0
  408988:	d280000a 	mov	x10, #0x0                   	// #0
  40898c:	17fffd7a 	b	0x407f74
  408990:	b500044c 	cbnz	x12, 0x408a18
  408994:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
  408998:	52800008 	mov	w8, #0x0                   	// #0
  40899c:	aa0303e7 	mov	x7, x3
  4089a0:	d28fffc2 	mov	x2, #0x7ffe                	// #32766
  4089a4:	52800289 	mov	w9, #0x14                  	// #20
  4089a8:	17fffdbf 	b	0x4080a4
  4089ac:	aa0e01aa 	orr	x10, x13, x14
  4089b0:	b4ffa6ea 	cbz	x10, 0x407e8c
  4089b4:	b797f9ad 	tbnz	x13, #50, 0x4088e8
  4089b8:	52800029 	mov	w9, #0x1                   	// #1
  4089bc:	17ffff1d 	b	0x408630
  4089c0:	b400010a 	cbz	x10, 0x4089e0
  4089c4:	52800029 	mov	w9, #0x1                   	// #1
  4089c8:	b697d12d 	tbz	x13, #50, 0x4083ec
  4089cc:	17ffffce 	b	0x408904
  4089d0:	b4ffedaa 	cbz	x10, 0x408784
  4089d4:	b797f96d 	tbnz	x13, #50, 0x408900
  4089d8:	52800029 	mov	w9, #0x1                   	// #1
  4089dc:	17fffe84 	b	0x4083ec
  4089e0:	52800029 	mov	w9, #0x1                   	// #1
  4089e4:	17ffff69 	b	0x408788
  4089e8:	aa0e01b0 	orr	x16, x13, x14
  4089ec:	b5ffef50 	cbnz	x16, 0x4087d4
  4089f0:	9240f0a1 	and	x1, x5, #0x1fffffffffffffff
  4089f4:	d343fc64 	lsr	x4, x3, #3
  4089f8:	aa03f42a 	orr	x10, x1, x3, lsl #61
  4089fc:	52800009 	mov	w9, #0x0                   	// #0
  408a00:	17fffd55 	b	0x407f54
  408a04:	aa0e01b0 	orr	x16, x13, x14
  408a08:	b4fffed0 	cbz	x16, 0x4089e0
  408a0c:	52800029 	mov	w9, #0x1                   	// #1
  408a10:	b697ee6d 	tbz	x13, #50, 0x4087dc
  408a14:	17ffffbc 	b	0x408904
  408a18:	2a0003e1 	mov	w1, w0
  408a1c:	52800028 	mov	w8, #0x1                   	// #1
  408a20:	d2800004 	mov	x4, #0x0                   	// #0
  408a24:	d280000a 	mov	x10, #0x0                   	// #0
  408a28:	52800289 	mov	w9, #0x14                  	// #20
  408a2c:	17fffd52 	b	0x407f74
  408a30:	aa0303e0 	mov	x0, x3
  408a34:	aa0703e3 	mov	x3, x7
  408a38:	17fffe46 	b	0x408350
  408a3c:	9240f0c1 	and	x1, x6, #0x1fffffffffffffff
  408a40:	d343fda4 	lsr	x4, x13, #3
  408a44:	aa0df42a 	orr	x10, x1, x13, lsl #61
  408a48:	aa0f03e2 	mov	x2, x15
  408a4c:	52800009 	mov	w9, #0x0                   	// #0
  408a50:	17fffd41 	b	0x407f54
  408a54:	d280000a 	mov	x10, #0x0                   	// #0
  408a58:	528fffe1 	mov	w1, #0x7fff                	// #32767
  408a5c:	d2800004 	mov	x4, #0x0                   	// #0
  408a60:	17fffd45 	b	0x407f74
  408a64:	d503201f 	nop
  408a68:	d503201f 	nop
  408a6c:	d503201f 	nop
  408a70:	d503233f 	paciasp
  408a74:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  408a78:	9e660000 	fmov	x0, d0
  408a7c:	910003fd 	mov	x29, sp
  408a80:	9eae0001 	fmov	x1, v0.d[1]
  408a84:	f9000bf3 	str	x19, [sp, #16]
  408a88:	d53b4402 	mrs	x2, fpcr
  408a8c:	d37ffc22 	lsr	x2, x1, #63
  408a90:	d370f824 	ubfx	x4, x1, #48, #15
  408a94:	12001c43 	and	w3, w2, #0xff
  408a98:	d287ffc5 	mov	x5, #0x3ffe                	// #16382
  408a9c:	d340bc22 	ubfx	x2, x1, #0, #48
  408aa0:	eb05009f 	cmp	x4, x5
  408aa4:	5400018c 	b.gt	0x408ad4
  408aa8:	b5000504 	cbnz	x4, 0x408b48
  408aac:	aa000042 	orr	x2, x2, x0
  408ab0:	52800013 	mov	w19, #0x0                   	// #0
  408ab4:	b4000062 	cbz	x2, 0x408ac0
  408ab8:	52800200 	mov	w0, #0x10                  	// #16
  408abc:	94000101 	bl	0x408ec0
  408ac0:	2a1303e0 	mov	w0, w19
  408ac4:	f9400bf3 	ldr	x19, [sp, #16]
  408ac8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  408acc:	d50323bf 	autiasp
  408ad0:	d65f03c0 	ret
  408ad4:	d28803a5 	mov	x5, #0x401d                	// #16413
  408ad8:	eb05009f 	cmp	x4, x5
  408adc:	540001ad 	b.le	0x408b10
  408ae0:	d28803c1 	mov	x1, #0x401e                	// #16414
  408ae4:	eb01009f 	cmp	x4, x1
  408ae8:	1a9f17e1 	cset	w1, eq	// eq = none
  408aec:	6a01007f 	tst	w3, w1
  408af0:	54000340 	b.eq	0x408b58  // b.none
  408af4:	eb4247ff 	cmp	xzr, x2, lsr #17
  408af8:	540003a1 	b.ne	0x408b6c  // b.any
  408afc:	aa02bc02 	orr	x2, x0, x2, lsl #47
  408b00:	52b00013 	mov	w19, #0x80000000            	// #-2147483648
  408b04:	b4fffde2 	cbz	x2, 0x408ac0
  408b08:	52800200 	mov	w0, #0x10                  	// #16
  408b0c:	17ffffec 	b	0x408abc
  408b10:	aa0403e1 	mov	x1, x4
  408b14:	b2500042 	orr	x2, x2, #0x1000000000000
  408b18:	528805f3 	mov	w19, #0x402f                	// #16431
  408b1c:	1287fdc4 	mov	w4, #0xffffc011            	// #-16367
  408b20:	4b010273 	sub	w19, w19, w1
  408b24:	0b040024 	add	w4, w1, w4
  408b28:	7100007f 	cmp	w3, #0x0
  408b2c:	9ad32453 	lsr	x19, x2, x19
  408b30:	5a930673 	cneg	w19, w19, ne	// ne = any
  408b34:	9ac42042 	lsl	x2, x2, x4
  408b38:	aa000042 	orr	x2, x2, x0
  408b3c:	b4fffc22 	cbz	x2, 0x408ac0
  408b40:	52800200 	mov	w0, #0x10                  	// #16
  408b44:	17ffffde 	b	0x408abc
  408b48:	52800013 	mov	w19, #0x0                   	// #0
  408b4c:	52800200 	mov	w0, #0x10                  	// #16
  408b50:	940000dc 	bl	0x408ec0
  408b54:	17ffffdb 	b	0x408ac0
  408b58:	12b00013 	mov	w19, #0x7fffffff            	// #2147483647
  408b5c:	52800020 	mov	w0, #0x1                   	// #1
  408b60:	0b130073 	add	w19, w3, w19
  408b64:	940000d7 	bl	0x408ec0
  408b68:	17ffffd6 	b	0x408ac0
  408b6c:	52b00013 	mov	w19, #0x80000000            	// #-2147483648
  408b70:	52800020 	mov	w0, #0x1                   	// #1
  408b74:	940000d3 	bl	0x408ec0
  408b78:	17ffffd2 	b	0x408ac0
  408b7c:	d503201f 	nop
  408b80:	d503233f 	paciasp
  408b84:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  408b88:	9e660000 	fmov	x0, d0
  408b8c:	910003fd 	mov	x29, sp
  408b90:	9eae0001 	fmov	x1, v0.d[1]
  408b94:	f9000bf3 	str	x19, [sp, #16]
  408b98:	d53b4402 	mrs	x2, fpcr
  408b9c:	d370f823 	ubfx	x3, x1, #48, #15
  408ba0:	d340bc33 	ubfx	x19, x1, #0, #48
  408ba4:	d287ffc4 	mov	x4, #0x3ffe                	// #16382
  408ba8:	eb04007f 	cmp	x3, x4
  408bac:	5400014c 	b.gt	0x408bd4
  408bb0:	b5000283 	cbnz	x3, 0x408c00
  408bb4:	aa130000 	orr	x0, x0, x19
  408bb8:	52800013 	mov	w19, #0x0                   	// #0
  408bbc:	b5000220 	cbnz	x0, 0x408c00
  408bc0:	2a1303e0 	mov	w0, w19
  408bc4:	f9400bf3 	ldr	x19, [sp, #16]
  408bc8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  408bcc:	d50323bf 	autiasp
  408bd0:	d65f03c0 	ret
  408bd4:	d37ffc22 	lsr	x2, x1, #63
  408bd8:	12001c42 	and	w2, w2, #0xff
  408bdc:	340001a2 	cbz	w2, 0x408c10
  408be0:	52800020 	mov	w0, #0x1                   	// #1
  408be4:	52800013 	mov	w19, #0x0                   	// #0
  408be8:	940000b6 	bl	0x408ec0
  408bec:	2a1303e0 	mov	w0, w19
  408bf0:	f9400bf3 	ldr	x19, [sp, #16]
  408bf4:	a8c27bfd 	ldp	x29, x30, [sp], #32
  408bf8:	d50323bf 	autiasp
  408bfc:	d65f03c0 	ret
  408c00:	52800200 	mov	w0, #0x10                  	// #16
  408c04:	52800013 	mov	w19, #0x0                   	// #0
  408c08:	940000ae 	bl	0x408ec0
  408c0c:	17fffff8 	b	0x408bec
  408c10:	d28803c2 	mov	x2, #0x401e                	// #16414
  408c14:	eb02007f 	cmp	x3, x2
  408c18:	540001cc 	b.gt	0x408c50
  408c1c:	aa0303e1 	mov	x1, x3
  408c20:	b2500273 	orr	x19, x19, #0x1000000000000
  408c24:	1287fdc2 	mov	w2, #0xffffc011            	// #-16367
  408c28:	0b020062 	add	w2, w3, w2
  408c2c:	528805e3 	mov	w3, #0x402f                	// #16431
  408c30:	4b010063 	sub	w3, w3, w1
  408c34:	9ac22261 	lsl	x1, x19, x2
  408c38:	aa000020 	orr	x0, x1, x0
  408c3c:	9ac32673 	lsr	x19, x19, x3
  408c40:	b4fffc00 	cbz	x0, 0x408bc0
  408c44:	52800200 	mov	w0, #0x10                  	// #16
  408c48:	9400009e 	bl	0x408ec0
  408c4c:	17ffffe8 	b	0x408bec
  408c50:	52800020 	mov	w0, #0x1                   	// #1
  408c54:	12800013 	mov	w19, #0xffffffff            	// #-1
  408c58:	9400009a 	bl	0x408ec0
  408c5c:	17ffffe4 	b	0x408bec
  408c60:	d503245f 	bti	c
  408c64:	7100001f 	cmp	w0, #0x0
  408c68:	34000240 	cbz	w0, 0x408cb0
  408c6c:	5a80a401 	cneg	w1, w0, lt	// lt = tstop
  408c70:	528807c4 	mov	w4, #0x403e                	// #16446
  408c74:	dac01022 	clz	x2, x1
  408c78:	531f7c00 	lsr	w0, w0, #31
  408c7c:	51003c43 	sub	w3, w2, #0xf
  408c80:	4b020084 	sub	w4, w4, w2
  408c84:	12003884 	and	w4, w4, #0x7fff
  408c88:	d2800002 	mov	x2, #0x0                   	// #0
  408c8c:	9ac32021 	lsl	x1, x1, x3
  408c90:	9240bc21 	and	x1, x1, #0xffffffffffff
  408c94:	d2800003 	mov	x3, #0x0                   	// #0
  408c98:	2a003c80 	orr	w0, w4, w0, lsl #15
  408c9c:	b340bc23 	bfxil	x3, x1, #0, #48
  408ca0:	9e670040 	fmov	d0, x2
  408ca4:	b3503c03 	bfi	x3, x0, #48, #16
  408ca8:	9eaf0060 	fmov	v0.d[1], x3
  408cac:	d65f03c0 	ret
  408cb0:	52800004 	mov	w4, #0x0                   	// #0
  408cb4:	d2800001 	mov	x1, #0x0                   	// #0
  408cb8:	52800000 	mov	w0, #0x0                   	// #0
  408cbc:	d2800003 	mov	x3, #0x0                   	// #0
  408cc0:	2a003c80 	orr	w0, w4, w0, lsl #15
  408cc4:	b340bc23 	bfxil	x3, x1, #0, #48
  408cc8:	d2800002 	mov	x2, #0x0                   	// #0
  408ccc:	9e670040 	fmov	d0, x2
  408cd0:	b3503c03 	bfi	x3, x0, #48, #16
  408cd4:	9eaf0060 	fmov	v0.d[1], x3
  408cd8:	d65f03c0 	ret
  408cdc:	d503201f 	nop
  408ce0:	d503245f 	bti	c
  408ce4:	34000200 	cbz	w0, 0x408d24
  408ce8:	2a0003e0 	mov	w0, w0
  408cec:	528807c1 	mov	w1, #0x403e                	// #16446
  408cf0:	dac01002 	clz	x2, x0
  408cf4:	51003c43 	sub	w3, w2, #0xf
  408cf8:	4b020021 	sub	w1, w1, w2
  408cfc:	12003821 	and	w1, w1, #0x7fff
  408d00:	d2800002 	mov	x2, #0x0                   	// #0
  408d04:	9ac32000 	lsl	x0, x0, x3
  408d08:	9240bc00 	and	x0, x0, #0xffffffffffff
  408d0c:	d2800003 	mov	x3, #0x0                   	// #0
  408d10:	9e670040 	fmov	d0, x2
  408d14:	b340bc03 	bfxil	x3, x0, #0, #48
  408d18:	b3503c23 	bfi	x3, x1, #48, #16
  408d1c:	9eaf0060 	fmov	v0.d[1], x3
  408d20:	d65f03c0 	ret
  408d24:	d2800000 	mov	x0, #0x0                   	// #0
  408d28:	d2800003 	mov	x3, #0x0                   	// #0
  408d2c:	b340bc03 	bfxil	x3, x0, #0, #48
  408d30:	d2800002 	mov	x2, #0x0                   	// #0
  408d34:	9e670040 	fmov	d0, x2
  408d38:	52800001 	mov	w1, #0x0                   	// #0
  408d3c:	b3503c23 	bfi	x3, x1, #48, #16
  408d40:	9eaf0060 	fmov	v0.d[1], x3
  408d44:	d65f03c0 	ret
  408d48:	d503201f 	nop
  408d4c:	d503201f 	nop
  408d50:	d503245f 	bti	c
  408d54:	d53b4400 	mrs	x0, fpcr
  408d58:	9e660000 	fmov	x0, d0
  408d5c:	d374f801 	ubfx	x1, x0, #52, #11
  408d60:	d37ffc04 	lsr	x4, x0, #63
  408d64:	91000422 	add	x2, x1, #0x1
  408d68:	12001c84 	and	w4, w4, #0xff
  408d6c:	d340cc00 	ubfx	x0, x0, #0, #52
  408d70:	f27f245f 	tst	x2, #0x7fe
  408d74:	540001a0 	b.eq	0x408da8  // b.none
  408d78:	d344fc05 	lsr	x5, x0, #4
  408d7c:	d2800003 	mov	x3, #0x0                   	// #0
  408d80:	9240bca5 	and	x5, x5, #0xffffffffffff
  408d84:	52878002 	mov	w2, #0x3c00                	// #15360
  408d88:	0b020021 	add	w1, w1, w2
  408d8c:	d3440c00 	lsl	x0, x0, #60
  408d90:	b340bca3 	bfxil	x3, x5, #0, #48
  408d94:	9e670000 	fmov	d0, x0
  408d98:	b3503823 	bfi	x3, x1, #48, #15
  408d9c:	b3410083 	bfi	x3, x4, #63, #1
  408da0:	9eaf0060 	fmov	v0.d[1], x3
  408da4:	d65f03c0 	ret
  408da8:	b50002a1 	cbnz	x1, 0x408dfc
  408dac:	b4000560 	cbz	x0, 0x408e58
  408db0:	dac01002 	clz	x2, x0
  408db4:	7100385f 	cmp	w2, #0xe
  408db8:	5400076c 	b.gt	0x408ea4
  408dbc:	1100c441 	add	w1, w2, #0x31
  408dc0:	528001e5 	mov	w5, #0xf                   	// #15
  408dc4:	4b0200a5 	sub	w5, w5, w2
  408dc8:	9ac52405 	lsr	x5, x0, x5
  408dcc:	9ac12000 	lsl	x0, x0, x1
  408dd0:	9240bca5 	and	x5, x5, #0xffffffffffff
  408dd4:	52878181 	mov	w1, #0x3c0c                	// #15372
  408dd8:	d2800003 	mov	x3, #0x0                   	// #0
  408ddc:	4b020021 	sub	w1, w1, w2
  408de0:	12003821 	and	w1, w1, #0x7fff
  408de4:	b340bca3 	bfxil	x3, x5, #0, #48
  408de8:	9e670000 	fmov	d0, x0
  408dec:	b3503823 	bfi	x3, x1, #48, #15
  408df0:	b3410083 	bfi	x3, x4, #63, #1
  408df4:	9eaf0060 	fmov	v0.d[1], x3
  408df8:	d65f03c0 	ret
  408dfc:	b4000400 	cbz	x0, 0x408e7c
  408e00:	d344fc01 	lsr	x1, x0, #4
  408e04:	d2800003 	mov	x3, #0x0                   	// #0
  408e08:	b2510021 	orr	x1, x1, #0x800000000000
  408e0c:	d3440c02 	lsl	x2, x0, #60
  408e10:	9e670040 	fmov	d0, x2
  408e14:	92ffff05 	mov	x5, #0x7ffffffffffff       	// #2251799813685247
  408e18:	b340bc23 	bfxil	x3, x1, #0, #48
  408e1c:	b2503863 	orr	x3, x3, #0x7fff000000000000
  408e20:	b3410083 	bfi	x3, x4, #63, #1
  408e24:	9eaf0060 	fmov	v0.d[1], x3
  408e28:	eb05001f 	cmp	x0, x5
  408e2c:	540003a8 	b.hi	0x408ea0  // b.pmore
  408e30:	d503233f 	paciasp
  408e34:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  408e38:	52800020 	mov	w0, #0x1                   	// #1
  408e3c:	910003fd 	mov	x29, sp
  408e40:	3d8007e0 	str	q0, [sp, #16]
  408e44:	9400001f 	bl	0x408ec0
  408e48:	3dc007e0 	ldr	q0, [sp, #16]
  408e4c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  408e50:	d50323bf 	autiasp
  408e54:	d65f03c0 	ret
  408e58:	d2800005 	mov	x5, #0x0                   	// #0
  408e5c:	d2800003 	mov	x3, #0x0                   	// #0
  408e60:	b340bca3 	bfxil	x3, x5, #0, #48
  408e64:	52800001 	mov	w1, #0x0                   	// #0
  408e68:	9e670000 	fmov	d0, x0
  408e6c:	b3503823 	bfi	x3, x1, #48, #15
  408e70:	b3410083 	bfi	x3, x4, #63, #1
  408e74:	9eaf0060 	fmov	v0.d[1], x3
  408e78:	d65f03c0 	ret
  408e7c:	d2800005 	mov	x5, #0x0                   	// #0
  408e80:	d2800003 	mov	x3, #0x0                   	// #0
  408e84:	b340bca3 	bfxil	x3, x5, #0, #48
  408e88:	528fffe1 	mov	w1, #0x7fff                	// #32767
  408e8c:	9e670000 	fmov	d0, x0
  408e90:	b3503823 	bfi	x3, x1, #48, #15
  408e94:	b3410083 	bfi	x3, x4, #63, #1
  408e98:	9eaf0060 	fmov	v0.d[1], x3
  408e9c:	d65f03c0 	ret
  408ea0:	d65f03c0 	ret
  408ea4:	51003c45 	sub	w5, w2, #0xf
  408ea8:	9ac52005 	lsl	x5, x0, x5
  408eac:	d2800000 	mov	x0, #0x0                   	// #0
  408eb0:	17ffffc8 	b	0x408dd0
  408eb4:	d503201f 	nop
  408eb8:	d503201f 	nop
  408ebc:	d503201f 	nop
  408ec0:	d503245f 	bti	c
  408ec4:	36000080 	tbz	w0, #0, 0x408ed4
  408ec8:	0f000401 	movi	v1.2s, #0x0
  408ecc:	1e211820 	fdiv	s0, s1, s1
  408ed0:	d53b4421 	mrs	x1, fpsr
  408ed4:	360800a0 	tbz	w0, #1, 0x408ee8
  408ed8:	1e2e1001 	fmov	s1, #1.000000000000000000e+00
  408edc:	0f000402 	movi	v2.2s, #0x0
  408ee0:	1e221820 	fdiv	s0, s1, s2
  408ee4:	d53b4421 	mrs	x1, fpsr
  408ee8:	36100100 	tbz	w0, #2, 0x408f08
  408eec:	5298b5c2 	mov	w2, #0xc5ae                	// #50606
  408ef0:	12b01001 	mov	w1, #0x7f7fffff            	// #2139095039
  408ef4:	72ae93a2 	movk	w2, #0x749d, lsl #16
  408ef8:	1e270021 	fmov	s1, w1
  408efc:	1e270042 	fmov	s2, w2
  408f00:	1e222820 	fadd	s0, s1, s2
  408f04:	d53b4421 	mrs	x1, fpsr
  408f08:	36180080 	tbz	w0, #3, 0x408f18
  408f0c:	0f044401 	movi	v1.2s, #0x80, lsl #16
  408f10:	1e210820 	fmul	s0, s1, s1
  408f14:	d53b4421 	mrs	x1, fpsr
  408f18:	362000c0 	tbz	w0, #4, 0x408f30
  408f1c:	12b01000 	mov	w0, #0x7f7fffff            	// #2139095039
  408f20:	1e2e1002 	fmov	s2, #1.000000000000000000e+00
  408f24:	1e270001 	fmov	s1, w0
  408f28:	1e223820 	fsub	s0, s1, s2
  408f2c:	d53b4420 	mrs	x0, fpsr
  408f30:	d65f03c0 	ret

Disassembly of section .fini:

0000000000408f34 <.fini>:
  408f34:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  408f38:	910003fd 	mov	x29, sp
  408f3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  408f40:	d65f03c0 	ret
