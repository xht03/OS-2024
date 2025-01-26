
init:     file format elf64-littleaarch64


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
  400140:	90000022 	adrp	x2, 0x404000
  400144:	9104e040 	add	x0, x2, #0x138
  400148:	885ffc03 	ldaxr	w3, [x0]
  40014c:	35000143 	cbnz	w3, 0x400174
  400150:	9104e040 	add	x0, x2, #0x138
  400154:	8803fc01 	stlxr	w3, w1, [x0]
  400158:	35ffff63 	cbnz	w3, 0x400144
  40015c:	34000201 	cbz	w1, 0x40019c
  400160:	94000160 	bl	0x4006e0
  400164:	94000160 	bl	0x4006e4
  400168:	940007d5 	bl	0x4020bc
  40016c:	2a1303e0 	mov	w0, w19
  400170:	94000457 	bl	0x4012cc
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
  4001cc:	f0000004 	adrp	x4, 0x403000
  4001d0:	f947e084 	ldr	x4, [x4, #4032]
  4001d4:	f8408441 	ldr	x1, [x2], #8
  4001d8:	f0000003 	adrp	x3, 0x403000
  4001dc:	f947b863 	ldr	x3, [x3, #3952]
  4001e0:	f0000000 	adrp	x0, 0x403000
  4001e4:	f947d400 	ldr	x0, [x0, #4008]
  4001e8:	1400012c 	b	0x400698
  4001ec:	d503201f 	nop
  4001f0:	90000020 	adrp	x0, 0x404000
  4001f4:	9104a000 	add	x0, x0, #0x128
  4001f8:	90000021 	adrp	x1, 0x404000
  4001fc:	9104a021 	add	x1, x1, #0x128
  400200:	eb00003f 	cmp	x1, x0
  400204:	540000c0 	b.eq	0x40021c  // b.none
  400208:	f0000001 	adrp	x1, 0x403000
  40020c:	f947cc21 	ldr	x1, [x1, #3992]
  400210:	b4000061 	cbz	x1, 0x40021c
  400214:	aa0103f0 	mov	x16, x1
  400218:	d61f0200 	br	x16
  40021c:	d65f03c0 	ret
  400220:	90000020 	adrp	x0, 0x404000
  400224:	9104a000 	add	x0, x0, #0x128
  400228:	90000021 	adrp	x1, 0x404000
  40022c:	9104a021 	add	x1, x1, #0x128
  400230:	cb000021 	sub	x1, x1, x0
  400234:	d37ffc22 	lsr	x2, x1, #63
  400238:	8b810c41 	add	x1, x2, x1, asr #3
  40023c:	9341fc21 	asr	x1, x1, #1
  400240:	b40000c1 	cbz	x1, 0x400258
  400244:	f0000002 	adrp	x2, 0x403000
  400248:	f947bc42 	ldr	x2, [x2, #3960]
  40024c:	b4000062 	cbz	x2, 0x400258
  400250:	aa0203f0 	mov	x16, x2
  400254:	d61f0200 	br	x16
  400258:	d65f03c0 	ret
  40025c:	d503201f 	nop
  400260:	d503233f 	paciasp
  400264:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  400268:	910003fd 	mov	x29, sp
  40026c:	f9000bf3 	str	x19, [sp, #16]
  400270:	90000033 	adrp	x19, 0x404000
  400274:	3944c260 	ldrb	w0, [x19, #304]
  400278:	37000140 	tbnz	w0, #0, 0x4002a0
  40027c:	f0000000 	adrp	x0, 0x403000
  400280:	f947ac00 	ldr	x0, [x0, #3928]
  400284:	b4000080 	cbz	x0, 0x400294
  400288:	90000020 	adrp	x0, 0x404000
  40028c:	f9400000 	ldr	x0, [x0]
  400290:	d503201f 	nop
  400294:	97ffffd7 	bl	0x4001f0
  400298:	52800020 	mov	w0, #0x1                   	// #1
  40029c:	3904c260 	strb	w0, [x19, #304]
  4002a0:	f9400bf3 	ldr	x19, [sp, #16]
  4002a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
  4002a8:	d50323bf 	autiasp
  4002ac:	d65f03c0 	ret
  4002b0:	d503245f 	bti	c
  4002b4:	17ffffdb 	b	0x400220
  4002b8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  4002bc:	910003fd 	mov	x29, sp
  4002c0:	52800041 	mov	w1, #0x2                   	// #2
  4002c4:	d0000000 	adrp	x0, 0x402000
  4002c8:	910a0000 	add	x0, x0, #0x280
  4002cc:	f0000003 	adrp	x3, 0x403000
  4002d0:	f947ec62 	ldr	x2, [x3, #4056]
  4002d4:	d63f0040 	blr	x2
  4002d8:	7100001f 	cmp	w0, #0x0
  4002dc:	540001ca 	b.ge	0x400314  // b.tcont
  4002e0:	d2800022 	mov	x2, #0x1                   	// #1
  4002e4:	52800021 	mov	w1, #0x1                   	// #1
  4002e8:	d0000000 	adrp	x0, 0x402000
  4002ec:	910a0000 	add	x0, x0, #0x280
  4002f0:	f0000003 	adrp	x3, 0x403000
  4002f4:	f947a063 	ldr	x3, [x3, #3904]
  4002f8:	d63f0060 	blr	x3
  4002fc:	52800041 	mov	w1, #0x2                   	// #2
  400300:	d0000000 	adrp	x0, 0x402000
  400304:	910a0000 	add	x0, x0, #0x280
  400308:	f0000003 	adrp	x3, 0x403000
  40030c:	f947ec62 	ldr	x2, [x3, #4056]
  400310:	d63f0040 	blr	x2
  400314:	52800000 	mov	w0, #0x0                   	// #0
  400318:	f0000003 	adrp	x3, 0x403000
  40031c:	f947dc61 	ldr	x1, [x3, #4024]
  400320:	d63f0020 	blr	x1
  400324:	52800000 	mov	w0, #0x0                   	// #0
  400328:	f0000003 	adrp	x3, 0x403000
  40032c:	f947dc61 	ldr	x1, [x3, #4024]
  400330:	d63f0020 	blr	x1
  400334:	d0000000 	adrp	x0, 0x402000
  400338:	910a2000 	add	x0, x0, #0x288
  40033c:	f0000003 	adrp	x3, 0x403000
  400340:	f947a861 	ldr	x1, [x3, #3920]
  400344:	d63f0020 	blr	x1
  400348:	f0000003 	adrp	x3, 0x403000
  40034c:	f947c860 	ldr	x0, [x3, #3984]
  400350:	d63f0000 	blr	x0
  400354:	b9001be0 	str	w0, [sp, #24]
  400358:	b9401be0 	ldr	w0, [sp, #24]
  40035c:	7100001f 	cmp	w0, #0x0
  400360:	5400014a 	b.ge	0x400388  // b.tcont
  400364:	d0000000 	adrp	x0, 0x402000
  400368:	910a8000 	add	x0, x0, #0x2a0
  40036c:	f0000003 	adrp	x3, 0x403000
  400370:	f947a861 	ldr	x1, [x3, #3920]
  400374:	d63f0020 	blr	x1
  400378:	52800020 	mov	w0, #0x1                   	// #1
  40037c:	f0000003 	adrp	x3, 0x403000
  400380:	f947e461 	ldr	x1, [x3, #4040]
  400384:	d63f0020 	blr	x1
  400388:	b9401be0 	ldr	w0, [sp, #24]
  40038c:	7100001f 	cmp	w0, #0x0
  400390:	54000301 	b.ne	0x4003f0  // b.any
  400394:	d0000000 	adrp	x0, 0x402000
  400398:	910ae000 	add	x0, x0, #0x2b8
  40039c:	f0000003 	adrp	x3, 0x403000
  4003a0:	f947a861 	ldr	x1, [x3, #3920]
  4003a4:	d63f0020 	blr	x1
  4003a8:	90000020 	adrp	x0, 0x404000
  4003ac:	91006002 	add	x2, x0, #0x18
  4003b0:	90000020 	adrp	x0, 0x404000
  4003b4:	91002001 	add	x1, x0, #0x8
  4003b8:	d0000000 	adrp	x0, 0x402000
  4003bc:	91098000 	add	x0, x0, #0x260
  4003c0:	f0000003 	adrp	x3, 0x403000
  4003c4:	f947a463 	ldr	x3, [x3, #3912]
  4003c8:	d63f0060 	blr	x3
  4003cc:	d0000000 	adrp	x0, 0x402000
  4003d0:	910b2000 	add	x0, x0, #0x2c8
  4003d4:	f0000003 	adrp	x3, 0x403000
  4003d8:	f947a861 	ldr	x1, [x3, #3920]
  4003dc:	d63f0020 	blr	x1
  4003e0:	52800020 	mov	w0, #0x1                   	// #1
  4003e4:	f0000003 	adrp	x3, 0x403000
  4003e8:	f947e461 	ldr	x1, [x3, #4040]
  4003ec:	d63f0020 	blr	x1
  4003f0:	d0000000 	adrp	x0, 0x402000
  4003f4:	910b8000 	add	x0, x0, #0x2e0
  4003f8:	f0000003 	adrp	x3, 0x403000
  4003fc:	f947a861 	ldr	x1, [x3, #3920]
  400400:	d63f0020 	blr	x1
  400404:	14000006 	b	0x40041c
  400408:	d0000000 	adrp	x0, 0x402000
  40040c:	910bc000 	add	x0, x0, #0x2f0
  400410:	f0000003 	adrp	x3, 0x403000
  400414:	f947a861 	ldr	x1, [x3, #3920]
  400418:	d63f0020 	blr	x1
  40041c:	d2800000 	mov	x0, #0x0                   	// #0
  400420:	f0000003 	adrp	x3, 0x403000
  400424:	f947c061 	ldr	x1, [x3, #3968]
  400428:	d63f0020 	blr	x1
  40042c:	b9001fe0 	str	w0, [sp, #28]
  400430:	b9401fe0 	ldr	w0, [sp, #28]
  400434:	7100001f 	cmp	w0, #0x0
  400438:	54fff7eb 	b.lt	0x400334  // b.tstop
  40043c:	b9401fe1 	ldr	w1, [sp, #28]
  400440:	b9401be0 	ldr	w0, [sp, #24]
  400444:	6b00003f 	cmp	w1, w0
  400448:	54fffe01 	b.ne	0x400408  // b.any
  40044c:	17ffffba 	b	0x400334
  400450:	d65f03c0 	ret
  400454:	d65f03c0 	ret
  400458:	a9a84ffe 	stp	x30, x19, [sp, #-384]!
  40045c:	d2802602 	mov	x2, #0x130                 	// #304
  400460:	aa0003f3 	mov	x19, x0
  400464:	910143e4 	add	x4, sp, #0x50
  400468:	a90157f4 	stp	x20, x21, [sp, #16]
  40046c:	aa0403e0 	mov	x0, x4
  400470:	aa0103f4 	mov	x20, x1
  400474:	52800001 	mov	w1, #0x0                   	// #0
  400478:	940001ae 	bl	0x400b30
  40047c:	aa0003e4 	mov	x4, x0
  400480:	f0000000 	adrp	x0, 0x403000
  400484:	f947b400 	ldr	x0, [x0, #3944]
  400488:	d2800002 	mov	x2, #0x0                   	// #0
  40048c:	f9000013 	str	x19, [x0]
  400490:	f8627a63 	ldr	x3, [x19, x2, lsl #3]
  400494:	91000442 	add	x2, x2, #0x1
  400498:	b5ffffc3 	cbnz	x3, 0x400490
  40049c:	90000035 	adrp	x21, 0x404000
  4004a0:	910582a1 	add	x1, x21, #0x160
  4004a4:	8b020e62 	add	x2, x19, x2, lsl #3
  4004a8:	aa0203e0 	mov	x0, x2
  4004ac:	f9000422 	str	x2, [x1, #8]
  4004b0:	14000002 	b	0x4004b8
  4004b4:	91004000 	add	x0, x0, #0x10
  4004b8:	f9400013 	ldr	x19, [x0]
  4004bc:	b40000d3 	cbz	x19, 0x4004d4
  4004c0:	f100967f 	cmp	x19, #0x25
  4004c4:	54ffff88 	b.hi	0x4004b4  // b.pmore
  4004c8:	f9400401 	ldr	x1, [x0, #8]
  4004cc:	f8337881 	str	x1, [x4, x19, lsl #3]
  4004d0:	17fffff9 	b	0x4004b4
  4004d4:	f940abe0 	ldr	x0, [sp, #336]
  4004d8:	90000021 	adrp	x1, 0x404000
  4004dc:	f9406be2 	ldr	x2, [sp, #208]
  4004e0:	f900ac22 	str	x2, [x1, #344]
  4004e4:	b4000060 	cbz	x0, 0x4004f0
  4004e8:	90000021 	adrp	x1, 0x404000
  4004ec:	f900a020 	str	x0, [x1, #320]
  4004f0:	910582a0 	add	x0, x21, #0x160
  4004f4:	f94043e1 	ldr	x1, [sp, #128]
  4004f8:	f9001801 	str	x1, [x0, #48]
  4004fc:	b4000134 	cbz	x20, 0x400520
  400500:	f0000001 	adrp	x1, 0x403000
  400504:	f947f021 	ldr	x1, [x1, #4064]
  400508:	91000680 	add	x0, x20, #0x1
  40050c:	f0000002 	adrp	x2, 0x403000
  400510:	f947c442 	ldr	x2, [x2, #3976]
  400514:	f9000034 	str	x20, [x1]
  400518:	f9000054 	str	x20, [x2]
  40051c:	14000008 	b	0x40053c
  400520:	f940a7e0 	ldr	x0, [sp, #328]
  400524:	d0000014 	adrp	x20, 0x402000
  400528:	910be294 	add	x20, x20, #0x2f8
  40052c:	f100001f 	cmp	x0, #0x0
  400530:	9a800294 	csel	x20, x20, x0, eq	// eq = none
  400534:	17fffff3 	b	0x400500
  400538:	91000400 	add	x0, x0, #0x1
  40053c:	385ff001 	ldurb	w1, [x0, #-1]
  400540:	340000a1 	cbz	w1, 0x400554
  400544:	7100bc3f 	cmp	w1, #0x2f
  400548:	54ffff81 	b.ne	0x400538  // b.any
  40054c:	f9000040 	str	x0, [x2]
  400550:	17fffffa 	b	0x400538
  400554:	aa0403e0 	mov	x0, x4
  400558:	940002f0 	bl	0x401118
  40055c:	f9408fe0 	ldr	x0, [sp, #280]
  400560:	97ffffbd 	bl	0x400454
  400564:	a94a83e1 	ldp	x1, x0, [sp, #168]
  400568:	eb00003f 	cmp	x1, x0
  40056c:	54000280 	b.eq	0x4005bc  // b.none
  400570:	9100e3e5 	add	x5, sp, #0x38
  400574:	a903ffff 	stp	xzr, xzr, [sp, #56]
  400578:	52800027 	mov	w7, #0x1                   	// #1
  40057c:	f90027ff 	str	xzr, [sp, #72]
  400580:	52800046 	mov	w6, #0x2                   	// #2
  400584:	aa0503e0 	mov	x0, x5
  400588:	9100a3e2 	add	x2, sp, #0x28
  40058c:	d2800928 	mov	x8, #0x49                  	// #73
  400590:	d2800061 	mov	x1, #0x3                   	// #3
  400594:	d2800003 	mov	x3, #0x0                   	// #0
  400598:	d2800104 	mov	x4, #0x8                   	// #8
  40059c:	a902ffff 	stp	xzr, xzr, [sp, #40]
  4005a0:	b90043e7 	str	w7, [sp, #64]
  4005a4:	b9004be6 	str	w6, [sp, #72]
  4005a8:	d4000001 	svc	#0x0
  4005ac:	d0000001 	adrp	x1, 0x402000
  4005b0:	910c0021 	add	x1, x1, #0x300
  4005b4:	36f80160 	tbz	w0, #31, 0x4005e0
  4005b8:	14000012 	b	0x400600
  4005bc:	a94b83e1 	ldp	x1, x0, [sp, #184]
  4005c0:	eb00003f 	cmp	x1, x0
  4005c4:	54fffd61 	b.ne	0x400570  // b.any
  4005c8:	f94087e0 	ldr	x0, [sp, #264]
  4005cc:	b5fffd20 	cbnz	x0, 0x400570
  4005d0:	14000012 	b	0x400618
  4005d4:	91002273 	add	x19, x19, #0x8
  4005d8:	f100627f 	cmp	x19, #0x18
  4005dc:	54000180 	b.eq	0x40060c  // b.none
  4005e0:	8b1300a0 	add	x0, x5, x19
  4005e4:	79400c00 	ldrh	w0, [x0, #6]
  4005e8:	362fff60 	tbz	w0, #5, 0x4005d4
  4005ec:	d2800708 	mov	x8, #0x38                  	// #56
  4005f0:	92800c60 	mov	x0, #0xffffffffffffff9c    	// #-100
  4005f4:	320f83e2 	mov	w2, #0x20002               	// #131074
  4005f8:	d4000001 	svc	#0x0
  4005fc:	b6fffec0 	tbz	x0, #63, 0x4005d4
  400600:	d2800000 	mov	x0, #0x0                   	// #0
  400604:	3900001f 	strb	wzr, [x0]
  400608:	d4207d00 	brk	#0x3e8
  40060c:	910582b5 	add	x21, x21, #0x160
  400610:	52800020 	mov	w0, #0x1                   	// #1
  400614:	39000aa0 	strb	w0, [x21, #2]
  400618:	a94157f4 	ldp	x20, x21, [sp, #16]
  40061c:	a8d84ffe 	ldp	x30, x19, [sp], #384
  400620:	d65f03c0 	ret
  400624:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  400628:	f0000013 	adrp	x19, 0x403000
  40062c:	f947ea73 	ldr	x19, [x19, #4048]
  400630:	f9000bf4 	str	x20, [sp, #16]
  400634:	f0000014 	adrp	x20, 0x403000
  400638:	f947da94 	ldr	x20, [x20, #4016]
  40063c:	97fffeb9 	bl	0x400120
  400640:	14000003 	b	0x40064c
  400644:	f8408660 	ldr	x0, [x19], #8
  400648:	d63f0000 	blr	x0
  40064c:	eb14027f 	cmp	x19, x20
  400650:	54ffffa3 	b.cc	0x400644  // b.lo, b.ul, b.last
  400654:	f9400bf4 	ldr	x20, [sp, #16]
  400658:	a8c24ffe 	ldp	x30, x19, [sp], #32
  40065c:	d65f03c0 	ret
  400660:	a9bd4ffe 	stp	x30, x19, [sp, #-48]!
  400664:	2a0103f3 	mov	w19, w1
  400668:	f90013f6 	str	x22, [sp, #32]
  40066c:	8b21cc56 	add	x22, x2, w1, sxtw #3
  400670:	910022d6 	add	x22, x22, #0x8
  400674:	a90157f4 	stp	x20, x21, [sp, #16]
  400678:	aa0203f4 	mov	x20, x2
  40067c:	aa0003f5 	mov	x21, x0
  400680:	97ffffe9 	bl	0x400624
  400684:	aa1603e2 	mov	x2, x22
  400688:	aa1403e1 	mov	x1, x20
  40068c:	2a1303e0 	mov	w0, w19
  400690:	d63f02a0 	blr	x21
  400694:	97fffea7 	bl	0x400130
  400698:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  40069c:	aa0203f3 	mov	x19, x2
  4006a0:	8b21cc42 	add	x2, x2, w1, sxtw #3
  4006a4:	a90157f4 	stp	x20, x21, [sp, #16]
  4006a8:	2a0103f4 	mov	w20, w1
  4006ac:	aa0003f5 	mov	x21, x0
  4006b0:	f9400261 	ldr	x1, [x19]
  4006b4:	91002040 	add	x0, x2, #0x8
  4006b8:	97ffff68 	bl	0x400458
  4006bc:	aa1303e2 	mov	x2, x19
  4006c0:	2a1403e1 	mov	w1, w20
  4006c4:	aa1503e0 	mov	x0, x21
  4006c8:	90000003 	adrp	x3, 0x400000
  4006cc:	91198063 	add	x3, x3, #0x660
  4006d0:	a94157f4 	ldp	x20, x21, [sp, #16]
  4006d4:	aa0303f0 	mov	x16, x3
  4006d8:	a8c24ffe 	ldp	x30, x19, [sp], #32
  4006dc:	d61f0200 	br	x16
  4006e0:	d65f03c0 	ret
  4006e4:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  4006e8:	f0000013 	adrp	x19, 0x403000
  4006ec:	f947b273 	ldr	x19, [x19, #3936]
  4006f0:	f9000bf4 	str	x20, [sp, #16]
  4006f4:	f0000014 	adrp	x20, 0x403000
  4006f8:	f947d294 	ldr	x20, [x20, #4000]
  4006fc:	14000003 	b	0x400708
  400700:	f85f8e60 	ldr	x0, [x19, #-8]!
  400704:	d63f0000 	blr	x0
  400708:	eb14027f 	cmp	x19, x20
  40070c:	54ffffa8 	b.hi	0x400700  // b.pmore
  400710:	f9400bf4 	ldr	x20, [sp, #16]
  400714:	a8c24ffe 	ldp	x30, x19, [sp], #32
  400718:	140006ce 	b	0x402250
  40071c:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  400720:	2a0103f3 	mov	w19, w1
  400724:	f9001fe2 	str	x2, [sp, #56]
  400728:	aa0003e2 	mov	x2, x0
  40072c:	373000f3 	tbnz	w19, #6, 0x400748
  400730:	121a0021 	and	w1, w1, #0x40
  400734:	d2800004 	mov	x4, #0x0                   	// #0
  400738:	11501021 	add	w1, w1, #0x404, lsl #12
  40073c:	0a010261 	and	w1, w19, w1
  400740:	7150103f 	cmp	w1, #0x404, lsl #12
  400744:	54000101 	b.ne	0x400764  // b.any
  400748:	b9403be4 	ldr	w4, [sp, #56]
  40074c:	9100c3e1 	add	x1, sp, #0x30
  400750:	910103e3 	add	x3, sp, #0x40
  400754:	128000e0 	mov	w0, #0xfffffff8            	// #-8
  400758:	a9010fe3 	stp	x3, x3, [sp, #16]
  40075c:	f90013e1 	str	x1, [sp, #32]
  400760:	29057fe0 	stp	w0, wzr, [sp, #40]
  400764:	320f0263 	orr	w3, w19, #0x20000
  400768:	d2800006 	mov	x6, #0x0                   	// #0
  40076c:	d2800005 	mov	x5, #0x0                   	// #0
  400770:	92800c61 	mov	x1, #0xffffffffffffff9c    	// #-100
  400774:	93407c63 	sxtw	x3, w3
  400778:	d2800700 	mov	x0, #0x38                  	// #56
  40077c:	94000194 	bl	0x400dcc
  400780:	93407c03 	sxtw	x3, w0
  400784:	37f800e0 	tbnz	w0, #31, 0x4007a0
  400788:	369800d3 	tbz	w19, #19, 0x4007a0
  40078c:	d2800328 	mov	x8, #0x19                  	// #25
  400790:	aa0303e0 	mov	x0, x3
  400794:	d2800041 	mov	x1, #0x2                   	// #2
  400798:	d2800022 	mov	x2, #0x1                   	// #1
  40079c:	d4000001 	svc	#0x0
  4007a0:	aa0303e0 	mov	x0, x3
  4007a4:	94000003 	bl	0x4007b0
  4007a8:	a8c44ffe 	ldp	x30, x19, [sp], #64
  4007ac:	d65f03c0 	ret
  4007b0:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  4007b4:	aa0003f3 	mov	x19, x0
  4007b8:	b140041f 	cmn	x0, #0x1, lsl #12
  4007bc:	54000068 	b.hi	0x4007c8  // b.pmore
  4007c0:	a8c14ffe 	ldp	x30, x19, [sp], #16
  4007c4:	d65f03c0 	ret
  4007c8:	940002be 	bl	0x4012c0
  4007cc:	aa0003e1 	mov	x1, x0
  4007d0:	4b1303e2 	neg	w2, w19
  4007d4:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
  4007d8:	b9000022 	str	w2, [x1]
  4007dc:	17fffff9 	b	0x4007c0
  4007e0:	d2801ba8 	mov	x8, #0xdd                  	// #221
  4007e4:	f81f0ffe 	str	x30, [sp, #-16]!
  4007e8:	d4000001 	svc	#0x0
  4007ec:	97fffff1 	bl	0x4007b0
  4007f0:	f84107fe 	ldr	x30, [sp], #16
  4007f4:	d65f03c0 	ret
  4007f8:	d65f03c0 	ret
  4007fc:	d65f03c0 	ret
  400800:	a9b34ffe 	stp	x30, x19, [sp, #-208]!
  400804:	12800000 	mov	w0, #0xffffffff            	// #-1
  400808:	a90157f4 	stp	x20, x21, [sp, #16]
  40080c:	a9025ff6 	stp	x22, x23, [sp, #32]
  400810:	910143f7 	add	x23, sp, #0x50
  400814:	a90367f8 	stp	x24, x25, [sp, #48]
  400818:	f90023fa 	str	x26, [sp, #64]
  40081c:	97fffff7 	bl	0x4007f8
  400820:	aa1703e0 	mov	x0, x23
  400824:	94000079 	bl	0x400a08
  400828:	90000020 	adrp	x0, 0x404000
  40082c:	91058000 	add	x0, x0, #0x160
  400830:	39400c00 	ldrb	w0, [x0, #3]
  400834:	13001c00 	sxtb	w0, w0
  400838:	7100001f 	cmp	w0, #0x0
  40083c:	5400012c 	b.gt	0x400860
  400840:	940002ce 	bl	0x401378
  400844:	2a0003f4 	mov	w20, w0
  400848:	9400029e 	bl	0x4012c0
  40084c:	b940001a 	ldr	w26, [x0]
  400850:	7100029f 	cmp	w20, #0x0
  400854:	aa0003f9 	mov	x25, x0
  400858:	1a9f17f6 	cset	w22, eq	// eq = none
  40085c:	14000042 	b	0x400964
  400860:	12800000 	mov	w0, #0xffffffff            	// #-1
  400864:	97ffffe5 	bl	0x4007f8
  400868:	12800000 	mov	w0, #0xffffffff            	// #-1
  40086c:	97ffffe3 	bl	0x4007f8
  400870:	12800000 	mov	w0, #0xffffffff            	// #-1
  400874:	f0000013 	adrp	x19, 0x403000
  400878:	913b4273 	add	x19, x19, #0xed0
  40087c:	97ffffdf 	bl	0x4007f8
  400880:	91014275 	add	x21, x19, #0x50
  400884:	aa1303f4 	mov	x20, x19
  400888:	94000152 	bl	0x400dd0
  40088c:	14000004 	b	0x40089c
  400890:	91002294 	add	x20, x20, #0x8
  400894:	eb15029f 	cmp	x20, x21
  400898:	540000c0 	b.eq	0x4008b0  // b.none
  40089c:	f9400280 	ldr	x0, [x20]
  4008a0:	f9400000 	ldr	x0, [x0]
  4008a4:	b4ffff60 	cbz	x0, 0x400890
  4008a8:	940000e3 	bl	0x400c34
  4008ac:	17fffff9 	b	0x400890
  4008b0:	12800000 	mov	w0, #0xffffffff            	// #-1
  4008b4:	97ffffd1 	bl	0x4007f8
  4008b8:	d53bd058 	mrs	x24, tpidr_el0
  4008bc:	d1032318 	sub	x24, x24, #0xc8
  4008c0:	97ffffcf 	bl	0x4007fc
  4008c4:	f9400b16 	ldr	x22, [x24, #16]
  4008c8:	940002ac 	bl	0x401378
  4008cc:	2a0003f4 	mov	w20, w0
  4008d0:	9400027c 	bl	0x4012c0
  4008d4:	b940001a 	ldr	w26, [x0]
  4008d8:	aa0003f9 	mov	x25, x0
  4008dc:	12800000 	mov	w0, #0xffffffff            	// #-1
  4008e0:	34000134 	cbz	w20, 0x400904
  4008e4:	97ffffc6 	bl	0x4007fc
  4008e8:	7100029f 	cmp	w20, #0x0
  4008ec:	1a9f17f6 	cset	w22, eq	// eq = none
  4008f0:	2a1603e0 	mov	w0, w22
  4008f4:	97ffffc1 	bl	0x4007f8
  4008f8:	1400000d 	b	0x40092c
  4008fc:	b90022c0 	str	w0, [x22, #32]
  400900:	f9400ad6 	ldr	x22, [x22, #16]
  400904:	eb16031f 	cmp	x24, x22
  400908:	54ffffa1 	b.ne	0x4008fc  // b.any
  40090c:	d0000000 	adrp	x0, 0x402000
  400910:	f9419c00 	ldr	x0, [x0, #824]
  400914:	b4fffe80 	cbz	x0, 0x4008e4
  400918:	b900001f 	str	wzr, [x0]
  40091c:	b900041f 	str	wzr, [x0, #4]
  400920:	17fffff1 	b	0x4008e4
  400924:	9400010a 	bl	0x400d4c
  400928:	91002273 	add	x19, x19, #0x8
  40092c:	eb15027f 	cmp	x19, x21
  400930:	540000e0 	b.eq	0x40094c  // b.none
  400934:	f9400261 	ldr	x1, [x19]
  400938:	f9400020 	ldr	x0, [x1]
  40093c:	b4ffff60 	cbz	x0, 0x400928
  400940:	35ffff34 	cbnz	w20, 0x400924
  400944:	b900001f 	str	wzr, [x0]
  400948:	17fffff8 	b	0x400928
  40094c:	94000127 	bl	0x400de8
  400950:	35000234 	cbnz	w20, 0x400994
  400954:	2a1603e0 	mov	w0, w22
  400958:	97ffffa8 	bl	0x4007f8
  40095c:	2a1603e0 	mov	w0, w22
  400960:	97ffffa6 	bl	0x4007f8
  400964:	aa1703e0 	mov	x0, x23
  400968:	94000030 	bl	0x400a28
  40096c:	2a1603e0 	mov	w0, w22
  400970:	97ffffa2 	bl	0x4007f8
  400974:	37f80174 	tbnz	w20, #31, 0x4009a0
  400978:	a9425ff6 	ldp	x22, x23, [sp, #32]
  40097c:	2a1403e0 	mov	w0, w20
  400980:	a94157f4 	ldp	x20, x21, [sp, #16]
  400984:	a94367f8 	ldp	x24, x25, [sp, #48]
  400988:	f94023fa 	ldr	x26, [sp, #64]
  40098c:	a8cd4ffe 	ldp	x30, x19, [sp], #208
  400990:	d65f03c0 	ret
  400994:	52800000 	mov	w0, #0x0                   	// #0
  400998:	97ffff98 	bl	0x4007f8
  40099c:	17ffffee 	b	0x400954
  4009a0:	b900033a 	str	w26, [x25]
  4009a4:	17fffff5 	b	0x400978
  4009a8:	aa0003e1 	mov	x1, x0
  4009ac:	52800002 	mov	w2, #0x0                   	// #0
  4009b0:	12800000 	mov	w0, #0xffffffff            	// #-1
  4009b4:	14000001 	b	0x4009b8
  4009b8:	93407c43 	sxtw	x3, w2
  4009bc:	aa0103e2 	mov	x2, x1
  4009c0:	93407c01 	sxtw	x1, w0
  4009c4:	d2800006 	mov	x6, #0x0                   	// #0
  4009c8:	d2800005 	mov	x5, #0x0                   	// #0
  4009cc:	d2800004 	mov	x4, #0x0                   	// #0
  4009d0:	f81f0ffe 	str	x30, [sp, #-16]!
  4009d4:	d2802080 	mov	x0, #0x104                 	// #260
  4009d8:	940000fd 	bl	0x400dcc
  4009dc:	97ffff75 	bl	0x4007b0
  4009e0:	f84107fe 	ldr	x30, [sp], #16
  4009e4:	d65f03c0 	ret
  4009e8:	aa0003e2 	mov	x2, x0
  4009ec:	d0000001 	adrp	x1, 0x402000
  4009f0:	d28010e8 	mov	x8, #0x87                  	// #135
  4009f4:	910d2021 	add	x1, x1, #0x348
  4009f8:	d2800000 	mov	x0, #0x0                   	// #0
  4009fc:	d2800103 	mov	x3, #0x8                   	// #8
  400a00:	d4000001 	svc	#0x0
  400a04:	d65f03c0 	ret
  400a08:	aa0003e2 	mov	x2, x0
  400a0c:	d0000001 	adrp	x1, 0x402000
  400a10:	d28010e8 	mov	x8, #0x87                  	// #135
  400a14:	910d0021 	add	x1, x1, #0x340
  400a18:	d2800000 	mov	x0, #0x0                   	// #0
  400a1c:	d2800103 	mov	x3, #0x8                   	// #8
  400a20:	d4000001 	svc	#0x0
  400a24:	d65f03c0 	ret
  400a28:	aa0003e1 	mov	x1, x0
  400a2c:	d28010e8 	mov	x8, #0x87                  	// #135
  400a30:	d2800040 	mov	x0, #0x2                   	// #2
  400a34:	d2800002 	mov	x2, #0x0                   	// #0
  400a38:	d2800103 	mov	x3, #0x8                   	// #8
  400a3c:	d4000001 	svc	#0x0
  400a40:	d65f03c0 	ret
  400a44:	2a0103e4 	mov	w4, w1
  400a48:	aa0203e3 	mov	x3, x2
  400a4c:	aa0003e1 	mov	x1, x0
  400a50:	2a0403e2 	mov	w2, w4
  400a54:	d2800428 	mov	x8, #0x21                  	// #33
  400a58:	92800c60 	mov	x0, #0xffffffffffffff9c    	// #-100
  400a5c:	f81f0ffe 	str	x30, [sp, #-16]!
  400a60:	d4000001 	svc	#0x0
  400a64:	97ffff53 	bl	0x4007b0
  400a68:	f84107fe 	ldr	x30, [sp], #16
  400a6c:	d65f03c0 	ret
  400a70:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  400a74:	a90157f4 	stp	x20, x21, [sp, #16]
  400a78:	90000035 	adrp	x21, 0x404000
  400a7c:	9100c2b4 	add	x20, x21, #0x30
  400a80:	b9408e81 	ldr	w1, [x20, #140]
  400a84:	36f802e1 	tbz	w1, #31, 0x400ae0
  400a88:	aa1403e1 	mov	x1, x20
  400a8c:	12800013 	mov	w19, #0xffffffff            	// #-1
  400a90:	52800014 	mov	w20, #0x0                   	// #0
  400a94:	940002e4 	bl	0x401624
  400a98:	37f801c0 	tbnz	w0, #31, 0x400ad0
  400a9c:	9100c2a1 	add	x1, x21, #0x30
  400aa0:	b9409020 	ldr	w0, [x1, #144]
  400aa4:	7100281f 	cmp	w0, #0xa
  400aa8:	54000320 	b.eq	0x400b0c  // b.none
  400aac:	a9420022 	ldp	x2, x0, [x1, #32]
  400ab0:	eb02001f 	cmp	x0, x2
  400ab4:	540002c0 	b.eq	0x400b0c  // b.none
  400ab8:	91000402 	add	x2, x0, #0x1
  400abc:	f9001422 	str	x2, [x1, #40]
  400ac0:	52800013 	mov	w19, #0x0                   	// #0
  400ac4:	52800141 	mov	w1, #0xa                   	// #10
  400ac8:	39000001 	strb	w1, [x0]
  400acc:	350002b4 	cbnz	w20, 0x400b20
  400ad0:	a94157f4 	ldp	x20, x21, [sp, #16]
  400ad4:	2a1303e0 	mov	w0, w19
  400ad8:	a8c24ffe 	ldp	x30, x19, [sp], #32
  400adc:	d65f03c0 	ret
  400ae0:	aa0003f3 	mov	x19, x0
  400ae4:	aa1403e0 	mov	x0, x20
  400ae8:	94000239 	bl	0x4013cc
  400aec:	2a0003e2 	mov	w2, w0
  400af0:	aa1403e1 	mov	x1, x20
  400af4:	aa1303e0 	mov	x0, x19
  400af8:	2a0203f4 	mov	w20, w2
  400afc:	12800013 	mov	w19, #0xffffffff            	// #-1
  400b00:	940002c9 	bl	0x401624
  400b04:	36fffcc0 	tbz	w0, #31, 0x400a9c
  400b08:	17fffff1 	b	0x400acc
  400b0c:	9100c2a0 	add	x0, x21, #0x30
  400b10:	52800141 	mov	w1, #0xa                   	// #10
  400b14:	9400026e 	bl	0x4014cc
  400b18:	131f7c13 	asr	w19, w0, #31
  400b1c:	17ffffec 	b	0x400acc
  400b20:	9100c2a0 	add	x0, x21, #0x30
  400b24:	94000258 	bl	0x401484
  400b28:	17ffffea 	b	0x400ad0
  400b2c:	d503201f 	nop
  400b30:	4e010c20 	dup	v0.16b, w1
  400b34:	8b020004 	add	x4, x0, x2
  400b38:	f101805f 	cmp	x2, #0x60
  400b3c:	540003a8 	b.hi	0x400bb0  // b.pmore
  400b40:	f100405f 	cmp	x2, #0x10
  400b44:	54000202 	b.cs	0x400b84  // b.hs, b.nlast
  400b48:	4e083c01 	mov	x1, v0.d[0]
  400b4c:	361800a2 	tbz	w2, #3, 0x400b60
  400b50:	f9000001 	str	x1, [x0]
  400b54:	f81f8081 	stur	x1, [x4, #-8]
  400b58:	d65f03c0 	ret
  400b5c:	d503201f 	nop
  400b60:	36100082 	tbz	w2, #2, 0x400b70
  400b64:	b9000001 	str	w1, [x0]
  400b68:	b81fc081 	stur	w1, [x4, #-4]
  400b6c:	d65f03c0 	ret
  400b70:	b4000082 	cbz	x2, 0x400b80
  400b74:	39000001 	strb	w1, [x0]
  400b78:	36080042 	tbz	w2, #1, 0x400b80
  400b7c:	781fe081 	sturh	w1, [x4, #-2]
  400b80:	d65f03c0 	ret
  400b84:	3d800000 	str	q0, [x0]
  400b88:	373000c2 	tbnz	w2, #6, 0x400ba0
  400b8c:	3c9f0080 	stur	q0, [x4, #-16]
  400b90:	36280062 	tbz	w2, #5, 0x400b9c
  400b94:	3d800400 	str	q0, [x0, #16]
  400b98:	3c9e0080 	stur	q0, [x4, #-32]
  400b9c:	d65f03c0 	ret
  400ba0:	3d800400 	str	q0, [x0, #16]
  400ba4:	ad010000 	stp	q0, q0, [x0, #32]
  400ba8:	ad3f0080 	stp	q0, q0, [x4, #-32]
  400bac:	d65f03c0 	ret
  400bb0:	12001c21 	and	w1, w1, #0xff
  400bb4:	927cec03 	and	x3, x0, #0xfffffffffffffff0
  400bb8:	3d800000 	str	q0, [x0]
  400bbc:	f102805f 	cmp	x2, #0xa0
  400bc0:	7a402820 	ccmp	w1, #0x0, #0x0, cs	// cs = hs, nlast
  400bc4:	54000241 	b.ne	0x400c0c  // b.any
  400bc8:	d53b00e5 	mrs	x5, dczid_el0
  400bcc:	924010a5 	and	x5, x5, #0x1f
  400bd0:	f10010bf 	cmp	x5, #0x4
  400bd4:	540001c1 	b.ne	0x400c0c  // b.any
  400bd8:	3d800460 	str	q0, [x3, #16]
  400bdc:	ad010060 	stp	q0, q0, [x3, #32]
  400be0:	927ae463 	and	x3, x3, #0xffffffffffffffc0
  400be4:	cb030082 	sub	x2, x4, x3
  400be8:	d1020042 	sub	x2, x2, #0x80
  400bec:	d503201f 	nop
  400bf0:	91010063 	add	x3, x3, #0x40
  400bf4:	d50b7423 	dc	zva, x3
  400bf8:	f1010042 	subs	x2, x2, #0x40
  400bfc:	54ffffa8 	b.hi	0x400bf0  // b.pmore
  400c00:	ad3e0080 	stp	q0, q0, [x4, #-64]
  400c04:	ad3f0080 	stp	q0, q0, [x4, #-32]
  400c08:	d65f03c0 	ret
  400c0c:	cb030082 	sub	x2, x4, x3
  400c10:	d1004063 	sub	x3, x3, #0x10
  400c14:	d1014042 	sub	x2, x2, #0x50
  400c18:	ad010060 	stp	q0, q0, [x3, #32]
  400c1c:	ad820060 	stp	q0, q0, [x3, #64]!
  400c20:	f1010042 	subs	x2, x2, #0x40
  400c24:	54ffffa8 	b.hi	0x400c18  // b.pmore
  400c28:	ad3e0080 	stp	q0, q0, [x4, #-64]
  400c2c:	ad3f0080 	stp	q0, q0, [x4, #-32]
  400c30:	d65f03c0 	ret
  400c34:	90000023 	adrp	x3, 0x404000
  400c38:	91058062 	add	x2, x3, #0x160
  400c3c:	aa0003e4 	mov	x4, x0
  400c40:	320107e1 	mov	w1, #0x80000001            	// #-2147483647
  400c44:	39400c42 	ldrb	w2, [x2, #3]
  400c48:	13001c42 	sxtb	w2, w2
  400c4c:	34000402 	cbz	w2, 0x400ccc
  400c50:	885ffc80 	ldaxr	w0, [x4]
  400c54:	350000e0 	cbnz	w0, 0x400c70
  400c58:	8800fc81 	stlxr	w0, w1, [x4]
  400c5c:	35ffffa0 	cbnz	w0, 0x400c50
  400c60:	36f80362 	tbz	w2, #31, 0x400ccc
  400c64:	91058063 	add	x3, x3, #0x160
  400c68:	39000c7f 	strb	wzr, [x3, #3]
  400c6c:	14000018 	b	0x400ccc
  400c70:	d5033bbf 	dmb	ish
  400c74:	37f800a2 	tbnz	w2, #31, 0x400c88
  400c78:	52800163 	mov	w3, #0xb                   	// #11
  400c7c:	12b00006 	mov	w6, #0x7fffffff            	// #2147483647
  400c80:	320107e5 	mov	w5, #0x80000001            	// #-2147483647
  400c84:	14000008 	b	0x400ca4
  400c88:	91058063 	add	x3, x3, #0x160
  400c8c:	39000c7f 	strb	wzr, [x3, #3]
  400c90:	17fffffa 	b	0x400c78
  400c94:	0b060002 	add	w2, w0, w6
  400c98:	2a0003e1 	mov	w1, w0
  400c9c:	14000007 	b	0x400cb8
  400ca0:	d5033bbf 	dmb	ish
  400ca4:	71000463 	subs	w3, w3, #0x1
  400ca8:	54000140 	b.eq	0x400cd0  // b.none
  400cac:	37ffff40 	tbnz	w0, #31, 0x400c94
  400cb0:	0b050001 	add	w1, w0, w5
  400cb4:	2a0003e2 	mov	w2, w0
  400cb8:	885ffc80 	ldaxr	w0, [x4]
  400cbc:	6b00005f 	cmp	w2, w0
  400cc0:	54ffff01 	b.ne	0x400ca0  // b.any
  400cc4:	8800fc81 	stlxr	w0, w1, [x4]
  400cc8:	35ffff80 	cbnz	w0, 0x400cb8
  400ccc:	d65f03c0 	ret
  400cd0:	885ffc85 	ldaxr	w5, [x4]
  400cd4:	110004a5 	add	w5, w5, #0x1
  400cd8:	8800fc85 	stlxr	w0, w5, [x4]
  400cdc:	35ffffa0 	cbnz	w0, 0x400cd0
  400ce0:	12b00007 	mov	w7, #0x7fffffff            	// #2147483647
  400ce4:	110004e6 	add	w6, w7, #0x1
  400ce8:	14000011 	b	0x400d2c
  400cec:	aa0403e0 	mov	x0, x4
  400cf0:	93407ca2 	sxtw	x2, w5
  400cf4:	d2800c48 	mov	x8, #0x62                  	// #98
  400cf8:	d2801001 	mov	x1, #0x80                  	// #128
  400cfc:	d2800003 	mov	x3, #0x0                   	// #0
  400d00:	d4000001 	svc	#0x0
  400d04:	b100981f 	cmn	x0, #0x26
  400d08:	54000060 	b.eq	0x400d14  // b.none
  400d0c:	0b0700a5 	add	w5, w5, w7
  400d10:	14000008 	b	0x400d30
  400d14:	aa0403e0 	mov	x0, x4
  400d18:	d2800001 	mov	x1, #0x0                   	// #0
  400d1c:	d4000001 	svc	#0x0
  400d20:	17fffffb 	b	0x400d0c
  400d24:	d5033bbf 	dmb	ish
  400d28:	2a0003e5 	mov	w5, w0
  400d2c:	37fffe05 	tbnz	w5, #31, 0x400cec
  400d30:	0b0600a1 	add	w1, w5, w6
  400d34:	885ffc80 	ldaxr	w0, [x4]
  400d38:	6b0000bf 	cmp	w5, w0
  400d3c:	54ffff41 	b.ne	0x400d24  // b.any
  400d40:	8800fc81 	stlxr	w0, w1, [x4]
  400d44:	35ffff80 	cbnz	w0, 0x400d34
  400d48:	17ffffe1 	b	0x400ccc
  400d4c:	aa0003e3 	mov	x3, x0
  400d50:	b9400000 	ldr	w0, [x0]
  400d54:	37f80040 	tbnz	w0, #31, 0x400d5c
  400d58:	d65f03c0 	ret
  400d5c:	12b00004 	mov	w4, #0x7fffffff            	// #2147483647
  400d60:	885ffc61 	ldaxr	w1, [x3]
  400d64:	0b040020 	add	w0, w1, w4
  400d68:	8802fc60 	stlxr	w2, w0, [x3]
  400d6c:	35ffffa2 	cbnz	w2, 0x400d60
  400d70:	320107e0 	mov	w0, #0x80000001            	// #-2147483647
  400d74:	6b00003f 	cmp	w1, w0
  400d78:	54ffff00 	b.eq	0x400d58  // b.none
  400d7c:	aa0303e0 	mov	x0, x3
  400d80:	d2800c48 	mov	x8, #0x62                  	// #98
  400d84:	d2801021 	mov	x1, #0x81                  	// #129
  400d88:	d2800022 	mov	x2, #0x1                   	// #1
  400d8c:	d4000001 	svc	#0x0
  400d90:	b100981f 	cmn	x0, #0x26
  400d94:	54fffe21 	b.ne	0x400d58  // b.any
  400d98:	aa0303e0 	mov	x0, x3
  400d9c:	aa0203e1 	mov	x1, x2
  400da0:	d4000001 	svc	#0x0
  400da4:	17ffffed 	b	0x400d58
  400da8:	aa0003e8 	mov	x8, x0
  400dac:	aa0103e0 	mov	x0, x1
  400db0:	aa0203e1 	mov	x1, x2
  400db4:	aa0303e2 	mov	x2, x3
  400db8:	aa0403e3 	mov	x3, x4
  400dbc:	aa0503e4 	mov	x4, x5
  400dc0:	aa0603e5 	mov	x5, x6
  400dc4:	d4000001 	svc	#0x0
  400dc8:	d65f03c0 	ret
  400dcc:	17fffff7 	b	0x400da8
  400dd0:	90000020 	adrp	x0, 0x404000
  400dd4:	91176000 	add	x0, x0, #0x5d8
  400dd8:	1400007d 	b	0x400fcc
  400ddc:	90000020 	adrp	x0, 0x404000
  400de0:	91176000 	add	x0, x0, #0x5d8
  400de4:	14000004 	b	0x400df4
  400de8:	90000020 	adrp	x0, 0x404000
  400dec:	91176000 	add	x0, x0, #0x5d8
  400df0:	14000052 	b	0x400f38
  400df4:	d2800001 	mov	x1, #0x0                   	// #0
  400df8:	14000001 	b	0x400dfc
  400dfc:	a9bd4ffe 	stp	x30, x19, [sp, #-48]!
  400e00:	aa0003f3 	mov	x19, x0
  400e04:	f90013f6 	str	x22, [sp, #32]
  400e08:	aa0103f6 	mov	x22, x1
  400e0c:	94000035 	bl	0x400ee0
  400e10:	7100401f 	cmp	w0, #0x10
  400e14:	54000601 	b.ne	0x400ed4  // b.any
  400e18:	52800ca0 	mov	w0, #0x65                  	// #101
  400e1c:	a90157f4 	stp	x20, x21, [sp, #16]
  400e20:	14000002 	b	0x400e28
  400e24:	d5033bbf 	dmb	ish
  400e28:	71000400 	subs	w0, w0, #0x1
  400e2c:	540000a0 	b.eq	0x400e40  // b.none
  400e30:	b9400261 	ldr	w1, [x19]
  400e34:	34000061 	cbz	w1, 0x400e40
  400e38:	b9400661 	ldr	w1, [x19, #4]
  400e3c:	34ffff41 	cbz	w1, 0x400e24
  400e40:	12b00015 	mov	w21, #0x7fffffff            	// #2147483647
  400e44:	1400000e 	b	0x400e7c
  400e48:	d5033bbf 	dmb	ish
  400e4c:	b9400a64 	ldr	w4, [x19, #8]
  400e50:	aa1603e3 	mov	x3, x22
  400e54:	aa1303e0 	mov	x0, x19
  400e58:	52800002 	mov	w2, #0x0                   	// #0
  400e5c:	52190084 	eor	w4, w4, #0x80
  400e60:	94000331 	bl	0x401b24
  400e64:	885ffe82 	ldaxr	w2, [x20]
  400e68:	51000442 	sub	w2, w2, #0x1
  400e6c:	8801fe82 	stlxr	w1, w2, [x20]
  400e70:	35ffffa1 	cbnz	w1, 0x400e64
  400e74:	721d781f 	tst	w0, #0xfffffffb
  400e78:	540002c1 	b.ne	0x400ed0  // b.any
  400e7c:	aa1303e0 	mov	x0, x19
  400e80:	94000018 	bl	0x400ee0
  400e84:	7100401f 	cmp	w0, #0x10
  400e88:	54000241 	b.ne	0x400ed0  // b.any
  400e8c:	b9400260 	ldr	w0, [x19]
  400e90:	34ffff60 	cbz	w0, 0x400e7c
  400e94:	12007801 	and	w1, w0, #0x7fffffff
  400e98:	6b15003f 	cmp	w1, w21
  400e9c:	54ffff01 	b.ne	0x400e7c  // b.any
  400ea0:	32010001 	orr	w1, w0, #0x80000000
  400ea4:	91001274 	add	x20, x19, #0x4
  400ea8:	885ffe82 	ldaxr	w2, [x20]
  400eac:	11000442 	add	w2, w2, #0x1
  400eb0:	8803fe82 	stlxr	w3, w2, [x20]
  400eb4:	35ffffa3 	cbnz	w3, 0x400ea8
  400eb8:	885ffe62 	ldaxr	w2, [x19]
  400ebc:	6b02001f 	cmp	w0, w2
  400ec0:	54fffc41 	b.ne	0x400e48  // b.any
  400ec4:	8802fe61 	stlxr	w2, w1, [x19]
  400ec8:	35ffff82 	cbnz	w2, 0x400eb8
  400ecc:	17ffffe0 	b	0x400e4c
  400ed0:	a94157f4 	ldp	x20, x21, [sp, #16]
  400ed4:	f94013f6 	ldr	x22, [sp, #32]
  400ed8:	a8c34ffe 	ldp	x30, x19, [sp], #48
  400edc:	d65f03c0 	ret
  400ee0:	aa0003e1 	mov	x1, x0
  400ee4:	12b00004 	mov	w4, #0x7fffffff            	// #2147483647
  400ee8:	321f77e5 	mov	w5, #0x7ffffffe            	// #2147483646
  400eec:	14000002 	b	0x400ef4
  400ef0:	d5033bbf 	dmb	ish
  400ef4:	b9400023 	ldr	w3, [x1]
  400ef8:	12007860 	and	w0, w3, #0x7fffffff
  400efc:	6b04001f 	cmp	w0, w4
  400f00:	54000140 	b.eq	0x400f28  // b.none
  400f04:	6b05001f 	cmp	w0, w5
  400f08:	54000140 	b.eq	0x400f30  // b.none
  400f0c:	11000462 	add	w2, w3, #0x1
  400f10:	885ffc20 	ldaxr	w0, [x1]
  400f14:	6b00007f 	cmp	w3, w0
  400f18:	54fffec1 	b.ne	0x400ef0  // b.any
  400f1c:	8800fc22 	stlxr	w0, w2, [x1]
  400f20:	35ffff80 	cbnz	w0, 0x400f10
  400f24:	d65f03c0 	ret
  400f28:	52800200 	mov	w0, #0x10                  	// #16
  400f2c:	17fffffe 	b	0x400f24
  400f30:	52800160 	mov	w0, #0xb                   	// #11
  400f34:	17fffffc 	b	0x400f24
  400f38:	b9400807 	ldr	w7, [x0, #8]
  400f3c:	aa0003e3 	mov	x3, x0
  400f40:	12b00005 	mov	w5, #0x7fffffff            	// #2147483647
  400f44:	14000002 	b	0x400f4c
  400f48:	d5033bbf 	dmb	ish
  400f4c:	b9400064 	ldr	w4, [x3]
  400f50:	b9400466 	ldr	w6, [x3, #4]
  400f54:	12007882 	and	w2, w4, #0x7fffffff
  400f58:	51000481 	sub	w1, w4, #0x1
  400f5c:	6b05005f 	cmp	w2, w5
  400f60:	7a411844 	ccmp	w2, #0x1, #0x4, ne	// ne = any
  400f64:	1a9f1021 	csel	w1, w1, wzr, ne	// ne = any
  400f68:	885ffc60 	ldaxr	w0, [x3]
  400f6c:	6b00009f 	cmp	w4, w0
  400f70:	54fffec1 	b.ne	0x400f48  // b.any
  400f74:	8800fc61 	stlxr	w0, w1, [x3]
  400f78:	35ffff80 	cbnz	w0, 0x400f68
  400f7c:	35000081 	cbnz	w1, 0x400f8c
  400f80:	710000df 	cmp	w6, #0x0
  400f84:	7a400881 	ccmp	w4, #0x0, #0x1, eq	// eq = none
  400f88:	5400006b 	b.lt	0x400f94  // b.tstop
  400f8c:	52800000 	mov	w0, #0x0                   	// #0
  400f90:	d65f03c0 	ret
  400f94:	710200ff 	cmp	w7, #0x80
  400f98:	92407842 	and	x2, x2, #0x7fffffff
  400f9c:	1a9f07e1 	cset	w1, ne	// ne = any
  400fa0:	aa0303e0 	mov	x0, x3
  400fa4:	d2800c48 	mov	x8, #0x62                  	// #98
  400fa8:	d3790021 	ubfiz	x1, x1, #7, #1
  400fac:	b2400021 	orr	x1, x1, #0x1
  400fb0:	d4000001 	svc	#0x0
  400fb4:	b100981f 	cmn	x0, #0x26
  400fb8:	54fffea1 	b.ne	0x400f8c  // b.any
  400fbc:	aa0303e0 	mov	x0, x3
  400fc0:	d2800021 	mov	x1, #0x1                   	// #1
  400fc4:	d4000001 	svc	#0x0
  400fc8:	17fffff1 	b	0x400f8c
  400fcc:	d2800001 	mov	x1, #0x0                   	// #0
  400fd0:	140002f2 	b	0x401b98
  400fd4:	d28002e8 	mov	x8, #0x17                  	// #23
  400fd8:	93407c00 	sxtw	x0, w0
  400fdc:	f81f0ffe 	str	x30, [sp, #-16]!
  400fe0:	d4000001 	svc	#0x0
  400fe4:	97fffdf3 	bl	0x4007b0
  400fe8:	f84107fe 	ldr	x30, [sp], #16
  400fec:	d65f03c0 	ret
  400ff0:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  400ff4:	aa0003f3 	mov	x19, x0
  400ff8:	91032000 	add	x0, x0, #0xc8
  400ffc:	f9000273 	str	x19, [x19]
  401000:	940002e3 	bl	0x401b8c
  401004:	7100001f 	cmp	w0, #0x0
  401008:	5400032b 	b.lt	0x40106c  // b.tstop
  40100c:	54000081 	b.ne	0x40101c  // b.any
  401010:	f0000000 	adrp	x0, 0x404000
  401014:	52800021 	mov	w1, #0x1                   	// #1
  401018:	39058001 	strb	w1, [x0, #352]
  40101c:	52800041 	mov	w1, #0x2                   	// #2
  401020:	f0000000 	adrp	x0, 0x404000
  401024:	d2800c08 	mov	x8, #0x60                  	// #96
  401028:	911e6000 	add	x0, x0, #0x798
  40102c:	b9002a61 	str	w1, [x19, #40]
  401030:	d4000001 	svc	#0x0
  401034:	f0000004 	adrp	x4, 0x404000
  401038:	aa0003e3 	mov	x3, x0
  40103c:	9101e262 	add	x2, x19, #0x78
  401040:	f0000001 	adrp	x1, 0x404000
  401044:	f940a084 	ldr	x4, [x4, #320]
  401048:	91066021 	add	x1, x1, #0x198
  40104c:	52800000 	mov	w0, #0x0                   	// #0
  401050:	a900ce73 	stp	x19, x19, [x19, #8]
  401054:	f9000e64 	str	x4, [x19, #24]
  401058:	b9002263 	str	w3, [x19, #32]
  40105c:	f9003e62 	str	x2, [x19, #120]
  401060:	f9004e61 	str	x1, [x19, #152]
  401064:	a8c14ffe 	ldp	x30, x19, [sp], #16
  401068:	d65f03c0 	ret
  40106c:	12800000 	mov	w0, #0xffffffff            	// #-1
  401070:	17fffffd 	b	0x401064
  401074:	a9bb4ffe 	stp	x30, x19, [sp, #-80]!
  401078:	928018e2 	mov	x2, #0xffffffffffffff38    	// #-200
  40107c:	cb000042 	sub	x2, x2, x0
  401080:	a90367f8 	stp	x24, x25, [sp, #48]
  401084:	f0000019 	adrp	x25, 0x404000
  401088:	91058321 	add	x1, x25, #0x160
  40108c:	a90157f4 	stp	x20, x21, [sp, #16]
  401090:	a9025ff6 	stp	x22, x23, [sp, #32]
  401094:	aa0003f7 	mov	x23, x0
  401098:	f90023fa 	str	x26, [sp, #64]
  40109c:	a9410033 	ldp	x19, x0, [x1, #16]
  4010a0:	a9426036 	ldp	x22, x24, [x1, #32]
  4010a4:	d1002000 	sub	x0, x0, #0x8
  4010a8:	d10006d6 	sub	x22, x22, #0x1
  4010ac:	cb180c18 	sub	x24, x0, x24, lsl #3
  4010b0:	8a0202d6 	and	x22, x22, x2
  4010b4:	8b1802fa 	add	x26, x23, x24
  4010b8:	8b1602f6 	add	x22, x23, x22
  4010bc:	91002354 	add	x20, x26, #0x8
  4010c0:	910322d5 	add	x21, x22, #0xc8
  4010c4:	14000009 	b	0x4010e8
  4010c8:	f9401661 	ldr	x1, [x19, #40]
  4010cc:	8b0102a1 	add	x1, x21, x1
  4010d0:	f8008681 	str	x1, [x20], #8
  4010d4:	a9408a61 	ldp	x1, x2, [x19, #8]
  4010d8:	f9401660 	ldr	x0, [x19, #40]
  4010dc:	8b0002a0 	add	x0, x21, x0
  4010e0:	940001c8 	bl	0x401800
  4010e4:	f9400273 	ldr	x19, [x19]
  4010e8:	b5ffff13 	cbnz	x19, 0x4010c8
  4010ec:	91058339 	add	x25, x25, #0x160
  4010f0:	aa1603e0 	mov	x0, x22
  4010f4:	f9401721 	ldr	x1, [x25, #40]
  4010f8:	f8386ae1 	str	x1, [x23, x24]
  4010fc:	f90062da 	str	x26, [x22, #192]
  401100:	a94157f4 	ldp	x20, x21, [sp, #16]
  401104:	a9425ff6 	ldp	x22, x23, [sp, #32]
  401108:	a94367f8 	ldp	x24, x25, [sp, #48]
  40110c:	f94023fa 	ldr	x26, [sp, #64]
  401110:	a8c54ffe 	ldp	x30, x19, [sp], #80
  401114:	d65f03c0 	ret
  401118:	f81f0ffe 	str	x30, [sp, #-16]!
  40111c:	529caa2a 	mov	w10, #0xe551                	// #58705
  401120:	f0000005 	adrp	x5, 0x404000
  401124:	d2800003 	mov	x3, #0x0                   	// #0
  401128:	f9400c09 	ldr	x9, [x0, #24]
  40112c:	910470a5 	add	x5, x5, #0x11c
  401130:	f9401404 	ldr	x4, [x0, #40]
  401134:	aa0903e1 	mov	x1, x9
  401138:	d0000007 	adrp	x7, 0x403000
  40113c:	f9479ce7 	ldr	x7, [x7, #3896]
  401140:	d2800006 	mov	x6, #0x0                   	// #0
  401144:	72ac8e8a 	movk	w10, #0x6474, lsl #16
  401148:	d2a0100b 	mov	x11, #0x800000              	// #8388608
  40114c:	14000006 	b	0x401164
  401150:	f9400823 	ldr	x3, [x1, #16]
  401154:	cb030123 	sub	x3, x9, x3
  401158:	f9401002 	ldr	x2, [x0, #32]
  40115c:	d1000484 	sub	x4, x4, #0x1
  401160:	8b020021 	add	x1, x1, x2
  401164:	b4000304 	cbz	x4, 0x4011c4
  401168:	b9400022 	ldr	w2, [x1]
  40116c:	7100185f 	cmp	w2, #0x6
  401170:	54ffff00 	b.eq	0x401150  // b.none
  401174:	7100085f 	cmp	w2, #0x2
  401178:	540000a1 	b.ne	0x40118c  // b.any
  40117c:	b4fffee7 	cbz	x7, 0x401158
  401180:	f9400823 	ldr	x3, [x1, #16]
  401184:	cb0300e3 	sub	x3, x7, x3
  401188:	17fffff4 	b	0x401158
  40118c:	71001c5f 	cmp	w2, #0x7
  401190:	54000061 	b.ne	0x40119c  // b.any
  401194:	aa0103e6 	mov	x6, x1
  401198:	17fffff0 	b	0x401158
  40119c:	6b0a005f 	cmp	w2, w10
  4011a0:	54fffdc1 	b.ne	0x401158  // b.any
  4011a4:	f9401422 	ldr	x2, [x1, #40]
  4011a8:	b94000a8 	ldr	w8, [x5]
  4011ac:	eb08005f 	cmp	x2, x8
  4011b0:	54fffd49 	b.ls	0x401158  // b.plast
  4011b4:	f160005f 	cmp	x2, #0x800, lsl #12
  4011b8:	9a8b9042 	csel	x2, x2, x11, ls	// ls = plast
  4011bc:	b90000a2 	str	w2, [x5]
  4011c0:	17ffffe6 	b	0x401158
  4011c4:	b4000666 	cbz	x6, 0x401290
  4011c8:	f94008c5 	ldr	x5, [x6, #16]
  4011cc:	f0000002 	adrp	x2, 0x404000
  4011d0:	f0000004 	adrp	x4, 0x404000
  4011d4:	91186040 	add	x0, x2, #0x618
  4011d8:	91058081 	add	x1, x4, #0x160
  4011dc:	8b050063 	add	x3, x3, x5
  4011e0:	f94010c8 	ldr	x8, [x6, #32]
  4011e4:	d2800027 	mov	x7, #0x1                   	// #1
  4011e8:	a94294c6 	ldp	x6, x5, [x6, #40]
  4011ec:	a900a003 	stp	x3, x8, [x0, #8]
  4011f0:	f9000820 	str	x0, [x1, #16]
  4011f4:	f9001005 	str	x5, [x0, #32]
  4011f8:	f9001427 	str	x7, [x1, #40]
  4011fc:	91186042 	add	x2, x2, #0x618
  401200:	8b0300c1 	add	x1, x6, x3
  401204:	d10004a0 	sub	x0, x5, #0x1
  401208:	d1004063 	sub	x3, x3, #0x10
  40120c:	cb0103e1 	neg	x1, x1
  401210:	8a000021 	and	x1, x1, x0
  401214:	8a000060 	and	x0, x3, x0
  401218:	8b060021 	add	x1, x1, x6
  40121c:	91004000 	add	x0, x0, #0x10
  401220:	f9000c41 	str	x1, [x2, #24]
  401224:	91037ca3 	add	x3, x5, #0xdf
  401228:	f9001440 	str	x0, [x2, #40]
  40122c:	f1001cbf 	cmp	x5, #0x7
  401230:	540000a8 	b.hi	0x401244  // b.pmore
  401234:	d2800106 	mov	x6, #0x8                   	// #8
  401238:	aa0603e5 	mov	x5, x6
  40123c:	d2801ce3 	mov	x3, #0xe7                  	// #231
  401240:	f9001046 	str	x6, [x2, #32]
  401244:	91058082 	add	x2, x4, #0x160
  401248:	8b000021 	add	x1, x1, x0
  40124c:	8b030021 	add	x1, x1, x3
  401250:	927df021 	and	x1, x1, #0xfffffffffffffff8
  401254:	a9019441 	stp	x1, x5, [x2, #24]
  401258:	f105403f 	cmp	x1, #0x150
  40125c:	54000269 	b.ls	0x4012a8  // b.plast
  401260:	d2801bc8 	mov	x8, #0xde                  	// #222
  401264:	d2800000 	mov	x0, #0x0                   	// #0
  401268:	d2800062 	mov	x2, #0x3                   	// #3
  40126c:	d2800443 	mov	x3, #0x22                  	// #34
  401270:	92800004 	mov	x4, #0xffffffffffffffff    	// #-1
  401274:	d2800005 	mov	x5, #0x0                   	// #0
  401278:	d4000001 	svc	#0x0
  40127c:	97ffff7e 	bl	0x401074
  401280:	97ffff5c 	bl	0x400ff0
  401284:	37f80180 	tbnz	w0, #31, 0x4012b4
  401288:	f84107fe 	ldr	x30, [sp], #16
  40128c:	d65f03c0 	ret
  401290:	f0000002 	adrp	x2, 0x404000
  401294:	91186040 	add	x0, x2, #0x618
  401298:	f0000004 	adrp	x4, 0x404000
  40129c:	f9400403 	ldr	x3, [x0, #8]
  4012a0:	a9419406 	ldp	x6, x5, [x0, #24]
  4012a4:	17ffffd6 	b	0x4011fc
  4012a8:	f0000000 	adrp	x0, 0x404000
  4012ac:	91192000 	add	x0, x0, #0x648
  4012b0:	17fffff3 	b	0x40127c
  4012b4:	d2800000 	mov	x0, #0x0                   	// #0
  4012b8:	3900001f 	strb	wzr, [x0]
  4012bc:	d4207d00 	brk	#0x3e8
  4012c0:	d53bd040 	mrs	x0, tpidr_el0
  4012c4:	d1029000 	sub	x0, x0, #0xa4
  4012c8:	d65f03c0 	ret
  4012cc:	93407c01 	sxtw	x1, w0
  4012d0:	d2800bc8 	mov	x8, #0x5e                  	// #94
  4012d4:	aa0103e0 	mov	x0, x1
  4012d8:	d4000001 	svc	#0x0
  4012dc:	aa0103e0 	mov	x0, x1
  4012e0:	d2800ba8 	mov	x8, #0x5d                  	// #93
  4012e4:	d4000001 	svc	#0x0
  4012e8:	17fffffd 	b	0x4012dc
  4012ec:	d65f03c0 	ret
  4012f0:	34000080 	cbz	w0, 0x401300
  4012f4:	f0000000 	adrp	x0, 0x404000
  4012f8:	911e8000 	add	x0, x0, #0x7a0
  4012fc:	17fffe94 	b	0x400d4c
  401300:	f0000003 	adrp	x3, 0x404000
  401304:	d2800c08 	mov	x8, #0x60                  	// #96
  401308:	911e6060 	add	x0, x3, #0x798
  40130c:	f81f0ffe 	str	x30, [sp, #-16]!
  401310:	d53bd041 	mrs	x1, tpidr_el0
  401314:	d1032021 	sub	x1, x1, #0xc8
  401318:	d4000001 	svc	#0x0
  40131c:	f0000002 	adrp	x2, 0x404000
  401320:	91058042 	add	x2, x2, #0x160
  401324:	f900443f 	str	xzr, [x1, #136]
  401328:	b907987f 	str	wzr, [x3, #1944]
  40132c:	b900045f 	str	wzr, [x2, #4]
  401330:	39400c43 	ldrb	w3, [x2, #3]
  401334:	a9008421 	stp	x1, x1, [x1, #8]
  401338:	b9002020 	str	w0, [x1, #32]
  40133c:	f900403f 	str	xzr, [x1, #128]
  401340:	72001c7f 	tst	w3, #0xff
  401344:	54000120 	b.eq	0x401368  // b.none
  401348:	12800001 	mov	w1, #0xffffffff            	// #-1
  40134c:	f0000000 	adrp	x0, 0x404000
  401350:	911e8000 	add	x0, x0, #0x7a0
  401354:	39000c41 	strb	w1, [x2, #3]
  401358:	97fffe7d 	bl	0x400d4c
  40135c:	f84107fe 	ldr	x30, [sp], #16
  401360:	52800020 	mov	w0, #0x1                   	// #1
  401364:	17fffd25 	b	0x4007f8
  401368:	f0000000 	adrp	x0, 0x404000
  40136c:	911e8000 	add	x0, x0, #0x7a0
  401370:	97fffe77 	bl	0x400d4c
  401374:	17fffffa 	b	0x40135c
  401378:	a9b64ffe 	stp	x30, x19, [sp, #-160]!
  40137c:	f9000bf4 	str	x20, [sp, #16]
  401380:	910083f4 	add	x20, sp, #0x20
  401384:	aa1403e0 	mov	x0, x20
  401388:	97fffd98 	bl	0x4009e8
  40138c:	f0000000 	adrp	x0, 0x404000
  401390:	911e8000 	add	x0, x0, #0x7a0
  401394:	97fffe28 	bl	0x400c34
  401398:	d2801b88 	mov	x8, #0xdc                  	// #220
  40139c:	d2800220 	mov	x0, #0x11                  	// #17
  4013a0:	d2800001 	mov	x1, #0x0                   	// #0
  4013a4:	d4000001 	svc	#0x0
  4013a8:	aa0003f3 	mov	x19, x0
  4013ac:	97ffffd1 	bl	0x4012f0
  4013b0:	aa1403e0 	mov	x0, x20
  4013b4:	97fffd9d 	bl	0x400a28
  4013b8:	93407e60 	sxtw	x0, w19
  4013bc:	97fffcfd 	bl	0x4007b0
  4013c0:	f9400bf4 	ldr	x20, [sp, #16]
  4013c4:	a8ca4ffe 	ldp	x30, x19, [sp], #160
  4013c8:	d65f03c0 	ret
  4013cc:	d53bd041 	mrs	x1, tpidr_el0
  4013d0:	b8558025 	ldur	w5, [x1, #-168]
  4013d4:	b9408c01 	ldr	w1, [x0, #140]
  4013d8:	12017821 	and	w1, w1, #0xbfffffff
  4013dc:	6b05003f 	cmp	w1, w5
  4013e0:	540004e0 	b.eq	0x40147c  // b.none
  4013e4:	91023004 	add	x4, x0, #0x8c
  4013e8:	885ffc80 	ldaxr	w0, [x4]
  4013ec:	35000080 	cbnz	w0, 0x4013fc
  4013f0:	8800fc85 	stlxr	w0, w5, [x4]
  4013f4:	35ffffa0 	cbnz	w0, 0x4013e8
  4013f8:	1400001f 	b	0x401474
  4013fc:	d5033bbf 	dmb	ish
  401400:	320200a5 	orr	w5, w5, #0x40000000
  401404:	14000018 	b	0x401464
  401408:	885ffc81 	ldaxr	w1, [x4]
  40140c:	6b00003f 	cmp	w1, w0
  401410:	54000081 	b.ne	0x401420  // b.any
  401414:	8801fc82 	stlxr	w1, w2, [x4]
  401418:	35ffff81 	cbnz	w1, 0x401408
  40141c:	1400000a 	b	0x401444
  401420:	d5033bbf 	dmb	ish
  401424:	14000010 	b	0x401464
  401428:	aa0403e0 	mov	x0, x4
  40142c:	d2800001 	mov	x1, #0x0                   	// #0
  401430:	d4000001 	svc	#0x0
  401434:	1400000c 	b	0x401464
  401438:	d5033bbf 	dmb	ish
  40143c:	32020002 	orr	w2, w0, #0x40000000
  401440:	36f7fe40 	tbz	w0, #30, 0x401408
  401444:	93407c42 	sxtw	x2, w2
  401448:	aa0403e0 	mov	x0, x4
  40144c:	d2800c48 	mov	x8, #0x62                  	// #98
  401450:	d2801001 	mov	x1, #0x80                  	// #128
  401454:	d2800003 	mov	x3, #0x0                   	// #0
  401458:	d4000001 	svc	#0x0
  40145c:	b100981f 	cmn	x0, #0x26
  401460:	54fffe40 	b.eq	0x401428  // b.none
  401464:	885ffc80 	ldaxr	w0, [x4]
  401468:	35fffe80 	cbnz	w0, 0x401438
  40146c:	8800fc85 	stlxr	w0, w5, [x4]
  401470:	35ffffa0 	cbnz	w0, 0x401464
  401474:	52800020 	mov	w0, #0x1                   	// #1
  401478:	d65f03c0 	ret
  40147c:	52800000 	mov	w0, #0x0                   	// #0
  401480:	17fffffe 	b	0x401478
  401484:	91023003 	add	x3, x0, #0x8c
  401488:	52800001 	mov	w1, #0x0                   	// #0
  40148c:	885ffc62 	ldaxr	w2, [x3]
  401490:	8800fc61 	stlxr	w0, w1, [x3]
  401494:	35ffffc0 	cbnz	w0, 0x40148c
  401498:	37f00042 	tbnz	w2, #30, 0x4014a0
  40149c:	d65f03c0 	ret
  4014a0:	aa0303e0 	mov	x0, x3
  4014a4:	d2800c48 	mov	x8, #0x62                  	// #98
  4014a8:	d2801021 	mov	x1, #0x81                  	// #129
  4014ac:	d2800022 	mov	x2, #0x1                   	// #1
  4014b0:	d4000001 	svc	#0x0
  4014b4:	b100981f 	cmn	x0, #0x26
  4014b8:	54ffff21 	b.ne	0x40149c  // b.any
  4014bc:	aa0303e0 	mov	x0, x3
  4014c0:	aa0203e1 	mov	x1, x2
  4014c4:	d4000001 	svc	#0x0
  4014c8:	17fffff5 	b	0x40149c
  4014cc:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  4014d0:	aa0003f3 	mov	x19, x0
  4014d4:	39007fe1 	strb	w1, [sp, #31]
  4014d8:	f9401001 	ldr	x1, [x0, #32]
  4014dc:	b4000181 	cbz	x1, 0x40150c
  4014e0:	f9401662 	ldr	x2, [x19, #40]
  4014e4:	eb01005f 	cmp	x2, x1
  4014e8:	540001e0 	b.eq	0x401524  // b.none
  4014ec:	39407fe0 	ldrb	w0, [sp, #31]
  4014f0:	b9409261 	ldr	w1, [x19, #144]
  4014f4:	6b01001f 	cmp	w0, w1
  4014f8:	54000160 	b.eq	0x401524  // b.none
  4014fc:	91000441 	add	x1, x2, #0x1
  401500:	f9001661 	str	x1, [x19, #40]
  401504:	39000040 	strb	w0, [x2]
  401508:	1400000f 	b	0x401544
  40150c:	94000033 	bl	0x4015d8
  401510:	35000060 	cbnz	w0, 0x40151c
  401514:	f9401261 	ldr	x1, [x19, #32]
  401518:	17fffff2 	b	0x4014e0
  40151c:	12800000 	mov	w0, #0xffffffff            	// #-1
  401520:	14000009 	b	0x401544
  401524:	f9402663 	ldr	x3, [x19, #72]
  401528:	aa1303e0 	mov	x0, x19
  40152c:	91007fe1 	add	x1, sp, #0x1f
  401530:	d2800022 	mov	x2, #0x1                   	// #1
  401534:	d63f0060 	blr	x3
  401538:	f100041f 	cmp	x0, #0x1
  40153c:	54ffff01 	b.ne	0x40151c  // b.any
  401540:	39407fe0 	ldrb	w0, [sp, #31]
  401544:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401548:	d65f03c0 	ret
  40154c:	d65f03c0 	ret
  401550:	f81f0ffe 	str	x30, [sp, #-16]!
  401554:	b9407800 	ldr	w0, [x0, #120]
  401558:	97fffffd 	bl	0x40154c
  40155c:	93407c00 	sxtw	x0, w0
  401560:	d2800728 	mov	x8, #0x39                  	// #57
  401564:	d4000001 	svc	#0x0
  401568:	97fffc92 	bl	0x4007b0
  40156c:	f84107fe 	ldr	x30, [sp], #16
  401570:	d65f03c0 	ret
  401574:	b9407800 	ldr	w0, [x0, #120]
  401578:	1400021a 	b	0x401de0
  40157c:	aa0003e3 	mov	x3, x0
  401580:	f81e0ffe 	str	x30, [sp, #-32]!
  401584:	b0000004 	adrp	x4, 0x402000
  401588:	91041080 	add	x0, x4, #0x104
  40158c:	aa0103e4 	mov	x4, x1
  401590:	aa0203e5 	mov	x5, x2
  401594:	b9400061 	ldr	w1, [x3]
  401598:	f9002460 	str	x0, [x3, #72]
  40159c:	37300121 	tbnz	w1, #6, 0x4015c0
  4015a0:	b9807860 	ldrsw	x0, [x3, #120]
  4015a4:	910063e2 	add	x2, sp, #0x18
  4015a8:	d28003a8 	mov	x8, #0x1d                  	// #29
  4015ac:	d28a8261 	mov	x1, #0x5413                	// #21523
  4015b0:	d4000001 	svc	#0x0
  4015b4:	b4000060 	cbz	x0, 0x4015c0
  4015b8:	12800000 	mov	w0, #0xffffffff            	// #-1
  4015bc:	b9009060 	str	w0, [x3, #144]
  4015c0:	aa0503e2 	mov	x2, x5
  4015c4:	aa0403e1 	mov	x1, x4
  4015c8:	aa0303e0 	mov	x0, x3
  4015cc:	940002ce 	bl	0x402104
  4015d0:	f84207fe 	ldr	x30, [sp], #32
  4015d4:	d65f03c0 	ret
  4015d8:	b9408802 	ldr	w2, [x0, #136]
  4015dc:	aa0003e1 	mov	x1, x0
  4015e0:	b9400003 	ldr	w3, [x0]
  4015e4:	51000440 	sub	w0, w2, #0x1
  4015e8:	2a020000 	orr	w0, w0, w2
  4015ec:	b9008820 	str	w0, [x1, #136]
  4015f0:	37180103 	tbnz	w3, #3, 0x401610
  4015f4:	a9458c22 	ldp	x2, x3, [x1, #88]
  4015f8:	52800000 	mov	w0, #0x0                   	// #0
  4015fc:	a900fc3f 	stp	xzr, xzr, [x1, #8]
  401600:	f9001c22 	str	x2, [x1, #56]
  401604:	8b030043 	add	x3, x2, x3
  401608:	a9020823 	stp	x3, x2, [x1, #32]
  40160c:	d65f03c0 	ret
  401610:	321b0063 	orr	w3, w3, #0x20
  401614:	12800000 	mov	w0, #0xffffffff            	// #-1
  401618:	b9000023 	str	w3, [x1]
  40161c:	17fffffc 	b	0x40160c
  401620:	140002a7 	b	0x4020bc
  401624:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  401628:	a90157f4 	stp	x20, x21, [sp, #16]
  40162c:	aa0103f5 	mov	x21, x1
  401630:	aa0003f4 	mov	x20, x0
  401634:	940000d6 	bl	0x40198c
  401638:	aa0003f3 	mov	x19, x0
  40163c:	aa1503e3 	mov	x3, x21
  401640:	aa1303e2 	mov	x2, x19
  401644:	aa1403e0 	mov	x0, x20
  401648:	d2800021 	mov	x1, #0x1                   	// #1
  40164c:	94000043 	bl	0x401758
  401650:	eb13001f 	cmp	x0, x19
  401654:	a94157f4 	ldp	x20, x21, [sp, #16]
  401658:	5a9f03e0 	csetm	w0, ne	// ne = any
  40165c:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401660:	d65f03c0 	ret
  401664:	a9bd4ffe 	stp	x30, x19, [sp, #-48]!
  401668:	a90157f4 	stp	x20, x21, [sp, #16]
  40166c:	aa0203f5 	mov	x21, x2
  401670:	aa0003f4 	mov	x20, x0
  401674:	f90013f6 	str	x22, [sp, #32]
  401678:	aa0103f6 	mov	x22, x1
  40167c:	f9401041 	ldr	x1, [x2, #32]
  401680:	b4000121 	cbz	x1, 0x4016a4
  401684:	f94016a0 	ldr	x0, [x21, #40]
  401688:	cb000021 	sub	x1, x1, x0
  40168c:	eb16003f 	cmp	x1, x22
  401690:	54000143 	b.cc	0x4016b8  // b.lo, b.ul, b.last
  401694:	b94092a1 	ldr	w1, [x21, #144]
  401698:	aa1603f3 	mov	x19, x22
  40169c:	36f80221 	tbz	w1, #31, 0x4016e0
  4016a0:	14000021 	b	0x401724
  4016a4:	aa0203e0 	mov	x0, x2
  4016a8:	97ffffcc 	bl	0x4015d8
  4016ac:	35000520 	cbnz	w0, 0x401750
  4016b0:	f94012a1 	ldr	x1, [x21, #32]
  4016b4:	17fffff4 	b	0x401684
  4016b8:	f94026a3 	ldr	x3, [x21, #72]
  4016bc:	aa1603e2 	mov	x2, x22
  4016c0:	f94013f6 	ldr	x22, [sp, #32]
  4016c4:	aa1403e1 	mov	x1, x20
  4016c8:	aa1503e0 	mov	x0, x21
  4016cc:	aa0303f0 	mov	x16, x3
  4016d0:	a94157f4 	ldp	x20, x21, [sp, #16]
  4016d4:	a8c34ffe 	ldp	x30, x19, [sp], #48
  4016d8:	d61f0200 	br	x16
  4016dc:	aa0303f3 	mov	x19, x3
  4016e0:	d1000663 	sub	x3, x19, #0x1
  4016e4:	b40001f3 	cbz	x19, 0x401720
  4016e8:	38636a84 	ldrb	w4, [x20, x3]
  4016ec:	7100289f 	cmp	w4, #0xa
  4016f0:	54ffff61 	b.ne	0x4016dc  // b.any
  4016f4:	f94026a3 	ldr	x3, [x21, #72]
  4016f8:	aa1303e2 	mov	x2, x19
  4016fc:	aa1403e1 	mov	x1, x20
  401700:	aa1503e0 	mov	x0, x21
  401704:	d63f0060 	blr	x3
  401708:	eb00027f 	cmp	x19, x0
  40170c:	540001a8 	b.hi	0x401740  // b.pmore
  401710:	f94016a0 	ldr	x0, [x21, #40]
  401714:	8b130294 	add	x20, x20, x19
  401718:	cb1302d3 	sub	x19, x22, x19
  40171c:	14000002 	b	0x401724
  401720:	aa1603f3 	mov	x19, x22
  401724:	aa1403e1 	mov	x1, x20
  401728:	aa1303e2 	mov	x2, x19
  40172c:	94000035 	bl	0x401800
  401730:	f94016a1 	ldr	x1, [x21, #40]
  401734:	aa1603e0 	mov	x0, x22
  401738:	8b130021 	add	x1, x1, x19
  40173c:	f90016a1 	str	x1, [x21, #40]
  401740:	a94157f4 	ldp	x20, x21, [sp, #16]
  401744:	f94013f6 	ldr	x22, [sp, #32]
  401748:	a8c34ffe 	ldp	x30, x19, [sp], #48
  40174c:	d65f03c0 	ret
  401750:	d2800000 	mov	x0, #0x0                   	// #0
  401754:	17fffffb 	b	0x401740
  401758:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  40175c:	f100003f 	cmp	x1, #0x0
  401760:	aa0303f3 	mov	x19, x3
  401764:	a90157f4 	stp	x20, x21, [sp, #16]
  401768:	9b027c35 	mul	x21, x1, x2
  40176c:	aa0103f4 	mov	x20, x1
  401770:	b9408c61 	ldr	w1, [x3, #140]
  401774:	a9025ff6 	stp	x22, x23, [sp, #32]
  401778:	9a9f1057 	csel	x23, x2, xzr, ne	// ne = any
  40177c:	36f801a1 	tbz	w1, #31, 0x4017b0
  401780:	aa0303e2 	mov	x2, x3
  401784:	aa1503e1 	mov	x1, x21
  401788:	97ffffb7 	bl	0x401664
  40178c:	aa0003f6 	mov	x22, x0
  401790:	eb1602bf 	cmp	x21, x22
  401794:	54000040 	b.eq	0x40179c  // b.none
  401798:	9ad40ad7 	udiv	x23, x22, x20
  40179c:	a94157f4 	ldp	x20, x21, [sp, #16]
  4017a0:	aa1703e0 	mov	x0, x23
  4017a4:	a9425ff6 	ldp	x22, x23, [sp, #32]
  4017a8:	a8c44ffe 	ldp	x30, x19, [sp], #64
  4017ac:	d65f03c0 	ret
  4017b0:	aa0003f6 	mov	x22, x0
  4017b4:	aa0303e0 	mov	x0, x3
  4017b8:	f9001bf8 	str	x24, [sp, #48]
  4017bc:	97ffff04 	bl	0x4013cc
  4017c0:	aa1303e2 	mov	x2, x19
  4017c4:	2a0003f8 	mov	w24, w0
  4017c8:	aa1503e1 	mov	x1, x21
  4017cc:	aa1603e0 	mov	x0, x22
  4017d0:	97ffffa5 	bl	0x401664
  4017d4:	aa0003f6 	mov	x22, x0
  4017d8:	340000b8 	cbz	w24, 0x4017ec
  4017dc:	aa1303e0 	mov	x0, x19
  4017e0:	97ffff29 	bl	0x401484
  4017e4:	f9401bf8 	ldr	x24, [sp, #48]
  4017e8:	17ffffea 	b	0x401790
  4017ec:	f9401bf8 	ldr	x24, [sp, #48]
  4017f0:	17ffffe8 	b	0x401790
  4017f4:	d503201f 	nop
  4017f8:	d503201f 	nop
  4017fc:	d503201f 	nop
  401800:	8b020024 	add	x4, x1, x2
  401804:	8b020005 	add	x5, x0, x2
  401808:	f102005f 	cmp	x2, #0x80
  40180c:	540007a8 	b.hi	0x401900  // b.pmore
  401810:	f100805f 	cmp	x2, #0x20
  401814:	540003e8 	b.hi	0x401890  // b.pmore
  401818:	f100405f 	cmp	x2, #0x10
  40181c:	540000c3 	b.cc	0x401834  // b.lo, b.ul, b.last
  401820:	a9401c26 	ldp	x6, x7, [x1]
  401824:	a97f348c 	ldp	x12, x13, [x4, #-16]
  401828:	a9001c06 	stp	x6, x7, [x0]
  40182c:	a93f34ac 	stp	x12, x13, [x5, #-16]
  401830:	d65f03c0 	ret
  401834:	361800e2 	tbz	w2, #3, 0x401850
  401838:	f9400026 	ldr	x6, [x1]
  40183c:	f85f8087 	ldur	x7, [x4, #-8]
  401840:	f9000006 	str	x6, [x0]
  401844:	f81f80a7 	stur	x7, [x5, #-8]
  401848:	d65f03c0 	ret
  40184c:	d503201f 	nop
  401850:	361000c2 	tbz	w2, #2, 0x401868
  401854:	b9400026 	ldr	w6, [x1]
  401858:	b85fc088 	ldur	w8, [x4, #-4]
  40185c:	b9000006 	str	w6, [x0]
  401860:	b81fc0a8 	stur	w8, [x5, #-4]
  401864:	d65f03c0 	ret
  401868:	b4000102 	cbz	x2, 0x401888
  40186c:	d341fc4e 	lsr	x14, x2, #1
  401870:	39400026 	ldrb	w6, [x1]
  401874:	385ff08a 	ldurb	w10, [x4, #-1]
  401878:	386e6828 	ldrb	w8, [x1, x14]
  40187c:	39000006 	strb	w6, [x0]
  401880:	382e6808 	strb	w8, [x0, x14]
  401884:	381ff0aa 	sturb	w10, [x5, #-1]
  401888:	d65f03c0 	ret
  40188c:	d503201f 	nop
  401890:	a9401c26 	ldp	x6, x7, [x1]
  401894:	a9412428 	ldp	x8, x9, [x1, #16]
  401898:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
  40189c:	a97f348c 	ldp	x12, x13, [x4, #-16]
  4018a0:	f101005f 	cmp	x2, #0x40
  4018a4:	540000e8 	b.hi	0x4018c0  // b.pmore
  4018a8:	a9001c06 	stp	x6, x7, [x0]
  4018ac:	a9012408 	stp	x8, x9, [x0, #16]
  4018b0:	a93e2caa 	stp	x10, x11, [x5, #-32]
  4018b4:	a93f34ac 	stp	x12, x13, [x5, #-16]
  4018b8:	d65f03c0 	ret
  4018bc:	d503201f 	nop
  4018c0:	a9423c2e 	ldp	x14, x15, [x1, #32]
  4018c4:	a9434430 	ldp	x16, x17, [x1, #48]
  4018c8:	f101805f 	cmp	x2, #0x60
  4018cc:	540000a9 	b.ls	0x4018e0  // b.plast
  4018d0:	a97c0c82 	ldp	x2, x3, [x4, #-64]
  4018d4:	a97d1081 	ldp	x1, x4, [x4, #-48]
  4018d8:	a93c0ca2 	stp	x2, x3, [x5, #-64]
  4018dc:	a93d10a1 	stp	x1, x4, [x5, #-48]
  4018e0:	a9001c06 	stp	x6, x7, [x0]
  4018e4:	a9012408 	stp	x8, x9, [x0, #16]
  4018e8:	a9023c0e 	stp	x14, x15, [x0, #32]
  4018ec:	a9034410 	stp	x16, x17, [x0, #48]
  4018f0:	a93e2caa 	stp	x10, x11, [x5, #-32]
  4018f4:	a93f34ac 	stp	x12, x13, [x5, #-16]
  4018f8:	d65f03c0 	ret
  4018fc:	d503201f 	nop
  401900:	a940342c 	ldp	x12, x13, [x1]
  401904:	92400c0e 	and	x14, x0, #0xf
  401908:	927cec03 	and	x3, x0, #0xfffffffffffffff0
  40190c:	cb0e0021 	sub	x1, x1, x14
  401910:	8b0e0042 	add	x2, x2, x14
  401914:	a9411c26 	ldp	x6, x7, [x1, #16]
  401918:	a900340c 	stp	x12, x13, [x0]
  40191c:	a9422428 	ldp	x8, x9, [x1, #32]
  401920:	a9432c2a 	ldp	x10, x11, [x1, #48]
  401924:	a9c4342c 	ldp	x12, x13, [x1, #64]!
  401928:	f1024042 	subs	x2, x2, #0x90
  40192c:	54000169 	b.ls	0x401958  // b.plast
  401930:	a9011c66 	stp	x6, x7, [x3, #16]
  401934:	a9411c26 	ldp	x6, x7, [x1, #16]
  401938:	a9022468 	stp	x8, x9, [x3, #32]
  40193c:	a9422428 	ldp	x8, x9, [x1, #32]
  401940:	a9032c6a 	stp	x10, x11, [x3, #48]
  401944:	a9432c2a 	ldp	x10, x11, [x1, #48]
  401948:	a984346c 	stp	x12, x13, [x3, #64]!
  40194c:	a9c4342c 	ldp	x12, x13, [x1, #64]!
  401950:	f1010042 	subs	x2, x2, #0x40
  401954:	54fffee8 	b.hi	0x401930  // b.pmore
  401958:	a97c3c8e 	ldp	x14, x15, [x4, #-64]
  40195c:	a9011c66 	stp	x6, x7, [x3, #16]
  401960:	a97d1c86 	ldp	x6, x7, [x4, #-48]
  401964:	a9022468 	stp	x8, x9, [x3, #32]
  401968:	a97e2488 	ldp	x8, x9, [x4, #-32]
  40196c:	a9032c6a 	stp	x10, x11, [x3, #48]
  401970:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
  401974:	a904346c 	stp	x12, x13, [x3, #64]
  401978:	a93c3cae 	stp	x14, x15, [x5, #-64]
  40197c:	a93d1ca6 	stp	x6, x7, [x5, #-48]
  401980:	a93e24a8 	stp	x8, x9, [x5, #-32]
  401984:	a93f2caa 	stp	x10, x11, [x5, #-16]
  401988:	d65f03c0 	ret
  40198c:	aa0003e1 	mov	x1, x0
  401990:	14000002 	b	0x401998
  401994:	91000421 	add	x1, x1, #0x1
  401998:	f240083f 	tst	x1, #0x7
  40199c:	540000a0 	b.eq	0x4019b0  // b.none
  4019a0:	39400022 	ldrb	w2, [x1]
  4019a4:	35ffff82 	cbnz	w2, 0x401994
  4019a8:	cb000020 	sub	x0, x1, x0
  4019ac:	d65f03c0 	ret
  4019b0:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
  4019b4:	f29fdfe4 	movk	x4, #0xfeff
  4019b8:	f9400022 	ldr	x2, [x1]
  4019bc:	8b040043 	add	x3, x2, x4
  4019c0:	8a220062 	bic	x2, x3, x2
  4019c4:	f201c05f 	tst	x2, #0x8080808080808080
  4019c8:	54000061 	b.ne	0x4019d4  // b.any
  4019cc:	91002021 	add	x1, x1, #0x8
  4019d0:	17fffffa 	b	0x4019b8
  4019d4:	39400022 	ldrb	w2, [x1]
  4019d8:	34fffe82 	cbz	w2, 0x4019a8
  4019dc:	91000421 	add	x1, x1, #0x1
  4019e0:	17fffffd 	b	0x4019d4
  4019e4:	a9bb4ffe 	stp	x30, x19, [sp, #-80]!
  4019e8:	a90157f4 	stp	x20, x21, [sp, #16]
  4019ec:	aa0003f5 	mov	x21, x0
  4019f0:	93407c34 	sxtw	x20, w1
  4019f4:	a9025ff6 	stp	x22, x23, [sp, #32]
  4019f8:	2a0403f6 	mov	w22, w4
  4019fc:	b40006c3 	cbz	x3, 0x401ad4
  401a00:	f9001bf8 	str	x24, [sp, #48]
  401a04:	d2993ff8 	mov	x24, #0xc9ff                	// #51711
  401a08:	aa0303f3 	mov	x19, x3
  401a0c:	f2a77358 	movk	x24, #0x3b9a, lsl #16
  401a10:	f9400461 	ldr	x1, [x3, #8]
  401a14:	eb18003f 	cmp	x1, x24
  401a18:	54000448 	b.hi	0x401aa0  // b.pmore
  401a1c:	910103f7 	add	x23, sp, #0x40
  401a20:	2a0203e0 	mov	w0, w2
  401a24:	aa1703e1 	mov	x1, x23
  401a28:	940000c8 	bl	0x401d48
  401a2c:	350003a0 	cbnz	w0, 0x401aa0
  401a30:	a9400660 	ldp	x0, x1, [x19]
  401a34:	a9440be3 	ldp	x3, x2, [sp, #64]
  401a38:	cb030000 	sub	x0, x0, x3
  401a3c:	cb020021 	sub	x1, x1, x2
  401a40:	a90407e0 	stp	x0, x1, [sp, #64]
  401a44:	b7f803a1 	tbnz	x1, #63, 0x401ab8
  401a48:	f9401bf8 	ldr	x24, [sp, #48]
  401a4c:	b7f80400 	tbnz	x0, #63, 0x401acc
  401a50:	710002df 	cmp	w22, #0x0
  401a54:	aa1503e1 	mov	x1, x21
  401a58:	1a9f07e2 	cset	w2, ne	// ne = any
  401a5c:	aa1403e3 	mov	x3, x20
  401a60:	aa1703e4 	mov	x4, x23
  401a64:	d2800006 	mov	x6, #0x0                   	// #0
  401a68:	d3790042 	ubfiz	x2, x2, #7, #1
  401a6c:	d2800005 	mov	x5, #0x0                   	// #0
  401a70:	d2800c40 	mov	x0, #0x62                  	// #98
  401a74:	97fffcd6 	bl	0x400dcc
  401a78:	2a0003e1 	mov	w1, w0
  401a7c:	3100981f 	cmn	w0, #0x26
  401a80:	540002e0 	b.eq	0x401adc  // b.none
  401a84:	3101b83f 	cmn	w1, #0x6e
  401a88:	3a441824 	ccmn	w1, #0x4, #0x4, ne	// ne = any
  401a8c:	540003c0 	b.eq	0x401b04  // b.none
  401a90:	3101f43f 	cmn	w1, #0x7d
  401a94:	52800fa0 	mov	w0, #0x7d                  	// #125
  401a98:	1a8013e0 	csel	w0, wzr, w0, ne	// ne = any
  401a9c:	14000003 	b	0x401aa8
  401aa0:	f9401bf8 	ldr	x24, [sp, #48]
  401aa4:	528002c0 	mov	w0, #0x16                  	// #22
  401aa8:	a94157f4 	ldp	x20, x21, [sp, #16]
  401aac:	a9425ff6 	ldp	x22, x23, [sp, #32]
  401ab0:	a8c54ffe 	ldp	x30, x19, [sp], #80
  401ab4:	d65f03c0 	ret
  401ab8:	91000718 	add	x24, x24, #0x1
  401abc:	d1000400 	sub	x0, x0, #0x1
  401ac0:	8b180021 	add	x1, x1, x24
  401ac4:	a90407e0 	stp	x0, x1, [sp, #64]
  401ac8:	17ffffe0 	b	0x401a48
  401acc:	52800dc0 	mov	w0, #0x6e                  	// #110
  401ad0:	17fffff6 	b	0x401aa8
  401ad4:	d2800017 	mov	x23, #0x0                   	// #0
  401ad8:	17ffffde 	b	0x401a50
  401adc:	aa1503e1 	mov	x1, x21
  401ae0:	aa1703e4 	mov	x4, x23
  401ae4:	aa1403e3 	mov	x3, x20
  401ae8:	d2800006 	mov	x6, #0x0                   	// #0
  401aec:	d2800005 	mov	x5, #0x0                   	// #0
  401af0:	d2800002 	mov	x2, #0x0                   	// #0
  401af4:	d2800c40 	mov	x0, #0x62                  	// #98
  401af8:	97fffcb5 	bl	0x400dcc
  401afc:	2a0003e1 	mov	w1, w0
  401b00:	17ffffe1 	b	0x401a84
  401b04:	3100103f 	cmn	w1, #0x4
  401b08:	54fffe21 	b.ne	0x401acc  // b.any
  401b0c:	f0000000 	adrp	x0, 0x404000
  401b10:	b9479c00 	ldr	w0, [x0, #1948]
  401b14:	7100001f 	cmp	w0, #0x0
  401b18:	1a9f07e0 	cset	w0, ne	// ne = any
  401b1c:	531e7400 	lsl	w0, w0, #2
  401b20:	17ffffe2 	b	0x401aa8
  401b24:	a9bc4ffe 	stp	x30, x19, [sp, #-64]!
  401b28:	aa0003f3 	mov	x19, x0
  401b2c:	52800020 	mov	w0, #0x1                   	// #1
  401b30:	a90157f4 	stp	x20, x21, [sp, #16]
  401b34:	2a0103f4 	mov	w20, w1
  401b38:	2a0203f5 	mov	w21, w2
  401b3c:	9100f3e1 	add	x1, sp, #0x3c
  401b40:	a9025ff6 	stp	x22, x23, [sp, #32]
  401b44:	aa0303f6 	mov	x22, x3
  401b48:	2a0403f7 	mov	w23, w4
  401b4c:	94000050 	bl	0x401c8c
  401b50:	2a1703e4 	mov	w4, w23
  401b54:	aa1603e3 	mov	x3, x22
  401b58:	2a1503e2 	mov	w2, w21
  401b5c:	2a1403e1 	mov	w1, w20
  401b60:	aa1303e0 	mov	x0, x19
  401b64:	97ffffa0 	bl	0x4019e4
  401b68:	2a0003f3 	mov	w19, w0
  401b6c:	b9403fe0 	ldr	w0, [sp, #60]
  401b70:	d2800001 	mov	x1, #0x0                   	// #0
  401b74:	94000046 	bl	0x401c8c
  401b78:	a94157f4 	ldp	x20, x21, [sp, #16]
  401b7c:	2a1303e0 	mov	w0, w19
  401b80:	a9425ff6 	ldp	x22, x23, [sp, #32]
  401b84:	a8c44ffe 	ldp	x30, x19, [sp], #64
  401b88:	d65f03c0 	ret
  401b8c:	d51bd040 	msr	tpidr_el0, x0
  401b90:	52800000 	mov	w0, #0x0                   	// #0
  401b94:	d65f03c0 	ret
  401b98:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  401b9c:	a90157f4 	stp	x20, x21, [sp, #16]
  401ba0:	aa0103f5 	mov	x21, x1
  401ba4:	aa0003f4 	mov	x20, x0
  401ba8:	9400002f 	bl	0x401c64
  401bac:	7100401f 	cmp	w0, #0x10
  401bb0:	54000541 	b.ne	0x401c58  // b.any
  401bb4:	52800ca0 	mov	w0, #0x65                  	// #101
  401bb8:	14000002 	b	0x401bc0
  401bbc:	d5033bbf 	dmb	ish
  401bc0:	71000400 	subs	w0, w0, #0x1
  401bc4:	54000260 	b.eq	0x401c10  // b.none
  401bc8:	b9400281 	ldr	w1, [x20]
  401bcc:	34000221 	cbz	w1, 0x401c10
  401bd0:	b9400681 	ldr	w1, [x20, #4]
  401bd4:	34ffff41 	cbz	w1, 0x401bbc
  401bd8:	1400000e 	b	0x401c10
  401bdc:	d5033bbf 	dmb	ish
  401be0:	b9400a84 	ldr	w4, [x20, #8]
  401be4:	aa1503e3 	mov	x3, x21
  401be8:	aa1403e0 	mov	x0, x20
  401bec:	52800002 	mov	w2, #0x0                   	// #0
  401bf0:	52190084 	eor	w4, w4, #0x80
  401bf4:	97ffffcc 	bl	0x401b24
  401bf8:	885ffe62 	ldaxr	w2, [x19]
  401bfc:	51000442 	sub	w2, w2, #0x1
  401c00:	8801fe62 	stlxr	w1, w2, [x19]
  401c04:	35ffffa1 	cbnz	w1, 0x401bf8
  401c08:	721d781f 	tst	w0, #0xfffffffb
  401c0c:	54000261 	b.ne	0x401c58  // b.any
  401c10:	aa1403e0 	mov	x0, x20
  401c14:	94000014 	bl	0x401c64
  401c18:	7100401f 	cmp	w0, #0x10
  401c1c:	540001e1 	b.ne	0x401c58  // b.any
  401c20:	b9400283 	ldr	w3, [x20]
  401c24:	34ffff63 	cbz	w3, 0x401c10
  401c28:	32010061 	orr	w1, w3, #0x80000000
  401c2c:	91001293 	add	x19, x20, #0x4
  401c30:	885ffe62 	ldaxr	w2, [x19]
  401c34:	11000442 	add	w2, w2, #0x1
  401c38:	8800fe62 	stlxr	w0, w2, [x19]
  401c3c:	35ffffa0 	cbnz	w0, 0x401c30
  401c40:	885ffe80 	ldaxr	w0, [x20]
  401c44:	6b00007f 	cmp	w3, w0
  401c48:	54fffca1 	b.ne	0x401bdc  // b.any
  401c4c:	8800fe81 	stlxr	w0, w1, [x20]
  401c50:	35ffff80 	cbnz	w0, 0x401c40
  401c54:	17ffffe3 	b	0x401be0
  401c58:	a94157f4 	ldp	x20, x21, [sp, #16]
  401c5c:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401c60:	d65f03c0 	ret
  401c64:	aa0003e1 	mov	x1, x0
  401c68:	12b00002 	mov	w2, #0x7fffffff            	// #2147483647
  401c6c:	885ffc20 	ldaxr	w0, [x1]
  401c70:	35000080 	cbnz	w0, 0x401c80
  401c74:	8800fc22 	stlxr	w0, w2, [x1]
  401c78:	35ffffa0 	cbnz	w0, 0x401c6c
  401c7c:	14000003 	b	0x401c88
  401c80:	d5033bbf 	dmb	ish
  401c84:	52800200 	mov	w0, #0x10                  	// #16
  401c88:	d65f03c0 	ret
  401c8c:	7100081f 	cmp	w0, #0x2
  401c90:	54000168 	b.hi	0x401cbc  // b.pmore
  401c94:	d53bd042 	mrs	x2, tpidr_el0
  401c98:	d1032042 	sub	x2, x2, #0xc8
  401c9c:	b4000081 	cbz	x1, 0x401cac
  401ca0:	3940c043 	ldrb	w3, [x2, #48]
  401ca4:	12001c63 	and	w3, w3, #0xff
  401ca8:	b9000023 	str	w3, [x1]
  401cac:	12001c01 	and	w1, w0, #0xff
  401cb0:	52800000 	mov	w0, #0x0                   	// #0
  401cb4:	3900c041 	strb	w1, [x2, #48]
  401cb8:	d65f03c0 	ret
  401cbc:	528002c0 	mov	w0, #0x16                  	// #22
  401cc0:	17fffffe 	b	0x401cb8
  401cc4:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  401cc8:	2a0003f3 	mov	w19, w0
  401ccc:	b0000000 	adrp	x0, 0x402000
  401cd0:	910ca000 	add	x0, x0, #0x328
  401cd4:	f9000bf4 	str	x20, [sp, #16]
  401cd8:	aa0103f4 	mov	x20, x1
  401cdc:	b0000001 	adrp	x1, 0x402000
  401ce0:	910c4021 	add	x1, x1, #0x310
  401ce4:	94000044 	bl	0x401df4
  401ce8:	90000005 	adrp	x5, 0x401000
  401cec:	aa0003e2 	mov	x2, x0
  401cf0:	913310a5 	add	x5, x5, #0xcc4
  401cf4:	f0000003 	adrp	x3, 0x404000
  401cf8:	91048060 	add	x0, x3, #0x120
  401cfc:	c85ffc04 	ldaxr	x4, [x0]
  401d00:	eb05009f 	cmp	x4, x5
  401d04:	540000a1 	b.ne	0x401d18  // b.any
  401d08:	91048060 	add	x0, x3, #0x120
  401d0c:	c804fc02 	stlxr	w4, x2, [x0]
  401d10:	35ffff44 	cbnz	w4, 0x401cf8
  401d14:	14000002 	b	0x401d1c
  401d18:	d5033bbf 	dmb	ish
  401d1c:	b40000e2 	cbz	x2, 0x401d38
  401d20:	aa1403e1 	mov	x1, x20
  401d24:	2a1303e0 	mov	w0, w19
  401d28:	f9400bf4 	ldr	x20, [sp, #16]
  401d2c:	aa0203f0 	mov	x16, x2
  401d30:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401d34:	d61f0200 	br	x16
  401d38:	f9400bf4 	ldr	x20, [sp, #16]
  401d3c:	128004a0 	mov	w0, #0xffffffda            	// #-38
  401d40:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401d44:	d65f03c0 	ret
  401d48:	f0000002 	adrp	x2, 0x404000
  401d4c:	a9be4ffe 	stp	x30, x19, [sp, #-32]!
  401d50:	aa0103f3 	mov	x19, x1
  401d54:	f9409042 	ldr	x2, [x2, #288]
  401d58:	f9000bf4 	str	x20, [sp, #16]
  401d5c:	2a0003f4 	mov	w20, w0
  401d60:	b40000a2 	cbz	x2, 0x401d74
  401d64:	d63f0040 	blr	x2
  401d68:	34000280 	cbz	w0, 0x401db8
  401d6c:	3100581f 	cmn	w0, #0x16
  401d70:	54000280 	b.eq	0x401dc0  // b.none
  401d74:	93407e80 	sxtw	x0, w20
  401d78:	aa1303e1 	mov	x1, x19
  401d7c:	d2800e28 	mov	x8, #0x71                  	// #113
  401d80:	d4000001 	svc	#0x0
  401d84:	3100981f 	cmn	w0, #0x26
  401d88:	54000221 	b.ne	0x401dcc  // b.any
  401d8c:	928002a0 	mov	x0, #0xffffffffffffffea    	// #-22
  401d90:	35000214 	cbnz	w20, 0x401dd0
  401d94:	d2801528 	mov	x8, #0xa9                  	// #169
  401d98:	aa1303e0 	mov	x0, x19
  401d9c:	d2800001 	mov	x1, #0x0                   	// #0
  401da0:	d4000001 	svc	#0x0
  401da4:	f9400660 	ldr	x0, [x19, #8]
  401da8:	52807d01 	mov	w1, #0x3e8                 	// #1000
  401dac:	1b017c00 	mul	w0, w0, w1
  401db0:	93407c00 	sxtw	x0, w0
  401db4:	f9000660 	str	x0, [x19, #8]
  401db8:	52800000 	mov	w0, #0x0                   	// #0
  401dbc:	14000006 	b	0x401dd4
  401dc0:	928002a0 	mov	x0, #0xffffffffffffffea    	// #-22
  401dc4:	97fffa7b 	bl	0x4007b0
  401dc8:	14000003 	b	0x401dd4
  401dcc:	93407c00 	sxtw	x0, w0
  401dd0:	97fffa78 	bl	0x4007b0
  401dd4:	f9400bf4 	ldr	x20, [sp, #16]
  401dd8:	a8c24ffe 	ldp	x30, x19, [sp], #32
  401ddc:	d65f03c0 	ret
  401de0:	d28007c8 	mov	x8, #0x3e                  	// #62
  401de4:	93407c00 	sxtw	x0, w0
  401de8:	93407c42 	sxtw	x2, w2
  401dec:	d4000001 	svc	#0x0
  401df0:	17fffa70 	b	0x4007b0
  401df4:	f0000003 	adrp	x3, 0x404000
  401df8:	a9ba4ffe 	stp	x30, x19, [sp, #-96]!
  401dfc:	d2800002 	mov	x2, #0x0                   	// #0
  401e00:	f940b464 	ldr	x4, [x3, #360]
  401e04:	a9025ff6 	stp	x22, x23, [sp, #32]
  401e08:	aa0003f7 	mov	x23, x0
  401e0c:	aa0103f6 	mov	x22, x1
  401e10:	f8627883 	ldr	x3, [x4, x2, lsl #3]
  401e14:	f100847f 	cmp	x3, #0x21
  401e18:	540001a0 	b.eq	0x401e4c  // b.none
  401e1c:	91000842 	add	x2, x2, #0x2
  401e20:	b5ffff83 	cbnz	x3, 0x401e10
  401e24:	d2800000 	mov	x0, #0x0                   	// #0
  401e28:	a9425ff6 	ldp	x22, x23, [sp, #32]
  401e2c:	a8c64ffe 	ldp	x30, x19, [sp], #96
  401e30:	d65f03c0 	ret
  401e34:	a94157f4 	ldp	x20, x21, [sp, #16]
  401e38:	17fffffb 	b	0x401e24
  401e3c:	a94157f4 	ldp	x20, x21, [sp, #16]
  401e40:	a94367f8 	ldp	x24, x25, [sp, #48]
  401e44:	a9446ffa 	ldp	x26, x27, [sp, #64]
  401e48:	17fffff7 	b	0x401e24
  401e4c:	91000442 	add	x2, x2, #0x1
  401e50:	f8627886 	ldr	x6, [x4, x2, lsl #3]
  401e54:	b4fffe86 	cbz	x6, 0x401e24
  401e58:	a90157f4 	stp	x20, x21, [sp, #16]
  401e5c:	d2800002 	mov	x2, #0x0                   	// #0
  401e60:	92800014 	mov	x20, #0xffffffffffffffff    	// #-1
  401e64:	f94010c3 	ldr	x3, [x6, #32]
  401e68:	d2800004 	mov	x4, #0x0                   	// #0
  401e6c:	794070c1 	ldrh	w1, [x6, #56]
  401e70:	8b0300c3 	add	x3, x6, x3
  401e74:	14000007 	b	0x401e90
  401e78:	a9408074 	ldp	x20, x0, [x3, #8]
  401e7c:	8b1400d4 	add	x20, x6, x20
  401e80:	cb000294 	sub	x20, x20, x0
  401e84:	79406cc0 	ldrh	w0, [x6, #54]
  401e88:	91000484 	add	x4, x4, #0x1
  401e8c:	8b000063 	add	x3, x3, x0
  401e90:	eb04003f 	cmp	x1, x4
  401e94:	54000120 	b.eq	0x401eb8  // b.none
  401e98:	b9400065 	ldr	w5, [x3]
  401e9c:	710004bf 	cmp	w5, #0x1
  401ea0:	54fffec0 	b.eq	0x401e78  // b.none
  401ea4:	710008bf 	cmp	w5, #0x2
  401ea8:	54fffee1 	b.ne	0x401e84  // b.any
  401eac:	f9400462 	ldr	x2, [x3, #8]
  401eb0:	8b0200c2 	add	x2, x6, x2
  401eb4:	17fffff4 	b	0x401e84
  401eb8:	f100005f 	cmp	x2, #0x0
  401ebc:	ba411a84 	ccmn	x20, #0x1, #0x4, ne	// ne = any
  401ec0:	54fffba0 	b.eq	0x401e34  // b.none
  401ec4:	d29ffe00 	mov	x0, #0xfff0                	// #65520
  401ec8:	d2800015 	mov	x21, #0x0                   	// #0
  401ecc:	f2adffe0 	movk	x0, #0x6fff, lsl #16
  401ed0:	91003001 	add	x1, x0, #0xc
  401ed4:	a90367f8 	stp	x24, x25, [sp, #48]
  401ed8:	d2800019 	mov	x25, #0x0                   	// #0
  401edc:	d2800018 	mov	x24, #0x0                   	// #0
  401ee0:	a9046ffa 	stp	x26, x27, [sp, #64]
  401ee4:	d280001a 	mov	x26, #0x0                   	// #0
  401ee8:	d280001b 	mov	x27, #0x0                   	// #0
  401eec:	14000006 	b	0x401f04
  401ef0:	f100127f 	cmp	x19, #0x4
  401ef4:	54000240 	b.eq	0x401f3c  // b.none
  401ef8:	f100167f 	cmp	x19, #0x5
  401efc:	9a831318 	csel	x24, x24, x3, ne	// ne = any
  401f00:	91004042 	add	x2, x2, #0x10
  401f04:	f9400053 	ldr	x19, [x2]
  401f08:	b4000233 	cbz	x19, 0x401f4c
  401f0c:	f9400443 	ldr	x3, [x2, #8]
  401f10:	8b030283 	add	x3, x20, x3
  401f14:	f1001a7f 	cmp	x19, #0x6
  401f18:	540000e0 	b.eq	0x401f34  // b.none
  401f1c:	54fffea9 	b.ls	0x401ef0  // b.plast
  401f20:	eb00027f 	cmp	x19, x0
  401f24:	54000100 	b.eq	0x401f44  // b.none
  401f28:	eb01027f 	cmp	x19, x1
  401f2c:	9a831339 	csel	x25, x25, x3, ne	// ne = any
  401f30:	17fffff4 	b	0x401f00
  401f34:	aa0303f5 	mov	x21, x3
  401f38:	17fffff2 	b	0x401f00
  401f3c:	aa0303fb 	mov	x27, x3
  401f40:	17fffff0 	b	0x401f00
  401f44:	aa0303fa 	mov	x26, x3
  401f48:	17ffffee 	b	0x401f00
  401f4c:	f100031f 	cmp	x24, #0x0
  401f50:	fa401aa4 	ccmp	x21, #0x0, #0x4, ne	// ne = any
  401f54:	fa401b64 	ccmp	x27, #0x0, #0x4, ne	// ne = any
  401f58:	54fff720 	b.eq	0x401e3c  // b.none
  401f5c:	f9002bfc 	str	x28, [sp, #80]
  401f60:	f100033f 	cmp	x25, #0x0
  401f64:	9a9f135a 	csel	x26, x26, xzr, ne	// ne = any
  401f68:	528080c4 	mov	w4, #0x406                 	// #1030
  401f6c:	b9400760 	ldr	w0, [x27, #4]
  401f70:	528004fc 	mov	w28, #0x27                  	// #39
  401f74:	1400001b 	b	0x401fe0
  401f78:	b9401043 	ldr	w3, [x2, #16]
  401f7c:	8b234042 	add	x2, x2, w3, uxtw
  401f80:	340002a3 	cbz	w3, 0x401fd4
  401f84:	79400440 	ldrh	w0, [x2, #2]
  401f88:	3707ff80 	tbnz	w0, #0, 0x401f78
  401f8c:	79400840 	ldrh	w0, [x2, #4]
  401f90:	4a000020 	eor	w0, w1, w0
  401f94:	f240381f 	tst	x0, #0x7fff
  401f98:	54ffff01 	b.ne	0x401f78  // b.any
  401f9c:	b9400c41 	ldr	w1, [x2, #12]
  401fa0:	aa1703e0 	mov	x0, x23
  401fa4:	b8616841 	ldr	w1, [x2, x1]
  401fa8:	8b010301 	add	x1, x24, x1
  401fac:	9400009f 	bl	0x402228
  401fb0:	528080c4 	mov	w4, #0x406                 	// #1030
  401fb4:	35000100 	cbnz	w0, 0x401fd4
  401fb8:	f94006a0 	ldr	x0, [x21, #8]
  401fbc:	a94367f8 	ldp	x24, x25, [sp, #48]
  401fc0:	8b000280 	add	x0, x20, x0
  401fc4:	a94157f4 	ldp	x20, x21, [sp, #16]
  401fc8:	a9446ffa 	ldp	x26, x27, [sp, #64]
  401fcc:	f9402bfc 	ldr	x28, [sp, #80]
  401fd0:	17ffff96 	b	0x401e28
  401fd4:	b9400760 	ldr	w0, [x27, #4]
  401fd8:	91000673 	add	x19, x19, #0x1
  401fdc:	910062b5 	add	x21, x21, #0x18
  401fe0:	eb13001f 	cmp	x0, x19
  401fe4:	54000289 	b.ls	0x402034  // b.plast
  401fe8:	394012a2 	ldrb	w2, [x21, #4]
  401fec:	12000c43 	and	w3, w2, #0xf
  401ff0:	1ac32b83 	asr	w3, w28, w3
  401ff4:	3607ff23 	tbz	w3, #0, 0x401fd8
  401ff8:	53047c42 	lsr	w2, w2, #4
  401ffc:	1ac22882 	asr	w2, w4, w2
  402000:	3607fec2 	tbz	w2, #0, 0x401fd8
  402004:	79400ea1 	ldrh	w1, [x21, #6]
  402008:	34fffe81 	cbz	w1, 0x401fd8
  40200c:	b94002a1 	ldr	w1, [x21]
  402010:	aa1603e0 	mov	x0, x22
  402014:	8b010301 	add	x1, x24, x1
  402018:	94000084 	bl	0x402228
  40201c:	528080c4 	mov	w4, #0x406                 	// #1030
  402020:	35fffda0 	cbnz	w0, 0x401fd4
  402024:	b4fffcba 	cbz	x26, 0x401fb8
  402028:	78737b41 	ldrh	w1, [x26, x19, lsl #1]
  40202c:	aa1903e2 	mov	x2, x25
  402030:	17ffffd5 	b	0x401f84
  402034:	a94157f4 	ldp	x20, x21, [sp, #16]
  402038:	a94367f8 	ldp	x24, x25, [sp, #48]
  40203c:	a9446ffa 	ldp	x26, x27, [sp, #64]
  402040:	f9402bfc 	ldr	x28, [sp, #80]
  402044:	17ffff78 	b	0x401e24
  402048:	b4000380 	cbz	x0, 0x4020b8
  40204c:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  402050:	aa0003f3 	mov	x19, x0
  402054:	b9408c01 	ldr	w1, [x0, #140]
  402058:	36f80281 	tbz	w1, #31, 0x4020a8
  40205c:	f9401661 	ldr	x1, [x19, #40]
  402060:	f9401e60 	ldr	x0, [x19, #56]
  402064:	eb00003f 	cmp	x1, x0
  402068:	540000c0 	b.eq	0x402080  // b.none
  40206c:	f9402663 	ldr	x3, [x19, #72]
  402070:	aa1303e0 	mov	x0, x19
  402074:	d2800002 	mov	x2, #0x0                   	// #0
  402078:	d2800001 	mov	x1, #0x0                   	// #0
  40207c:	d63f0060 	blr	x3
  402080:	a9408261 	ldp	x1, x0, [x19, #8]
  402084:	eb00003f 	cmp	x1, x0
  402088:	54000140 	b.eq	0x4020b0  // b.none
  40208c:	f9402a63 	ldr	x3, [x19, #80]
  402090:	cb000021 	sub	x1, x1, x0
  402094:	aa1303e0 	mov	x0, x19
  402098:	52800022 	mov	w2, #0x1                   	// #1
  40209c:	a8c14ffe 	ldp	x30, x19, [sp], #16
  4020a0:	aa0303f0 	mov	x16, x3
  4020a4:	d61f0200 	br	x16
  4020a8:	97fffcc9 	bl	0x4013cc
  4020ac:	17ffffec 	b	0x40205c
  4020b0:	a8c14ffe 	ldp	x30, x19, [sp], #16
  4020b4:	d65f03c0 	ret
  4020b8:	d65f03c0 	ret
  4020bc:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
  4020c0:	9400004f 	bl	0x4021fc
  4020c4:	f9400013 	ldr	x19, [x0]
  4020c8:	14000003 	b	0x4020d4
  4020cc:	97ffffdf 	bl	0x402048
  4020d0:	f9403a73 	ldr	x19, [x19, #112]
  4020d4:	aa1303e0 	mov	x0, x19
  4020d8:	b5ffffb3 	cbnz	x19, 0x4020cc
  4020dc:	d0000000 	adrp	x0, 0x404000
  4020e0:	f943d400 	ldr	x0, [x0, #1960]
  4020e4:	97ffffd9 	bl	0x402048
  4020e8:	d0000000 	adrp	x0, 0x404000
  4020ec:	f9401400 	ldr	x0, [x0, #40]
  4020f0:	97ffffd6 	bl	0x402048
  4020f4:	a8c14ffe 	ldp	x30, x19, [sp], #16
  4020f8:	d0000000 	adrp	x0, 0x404000
  4020fc:	f943d400 	ldr	x0, [x0, #1960]
  402100:	17ffffd2 	b	0x402048
  402104:	a9ba4ffe 	stp	x30, x19, [sp, #-96]!
  402108:	a90157f4 	stp	x20, x21, [sp, #16]
  40210c:	910103f3 	add	x19, sp, #0x40
  402110:	52800055 	mov	w21, #0x2                   	// #2
  402114:	a9025ff6 	stp	x22, x23, [sp, #32]
  402118:	d2800054 	mov	x20, #0x2                   	// #2
  40211c:	aa0203f6 	mov	x22, x2
  402120:	f9001bf8 	str	x24, [sp, #48]
  402124:	aa0003f8 	mov	x24, x0
  402128:	a9050be1 	stp	x1, x2, [sp, #80]
  40212c:	f9401417 	ldr	x23, [x0, #40]
  402130:	f9401c00 	ldr	x0, [x0, #56]
  402134:	cb0002f7 	sub	x23, x23, x0
  402138:	a9045fe0 	stp	x0, x23, [sp, #64]
  40213c:	8b0202f7 	add	x23, x23, x2
  402140:	1400001b 	b	0x4021ac
  402144:	a9458b01 	ldp	x1, x2, [x24, #88]
  402148:	aa1603e0 	mov	x0, x22
  40214c:	f9001701 	str	x1, [x24, #40]
  402150:	f9001f01 	str	x1, [x24, #56]
  402154:	8b020021 	add	x1, x1, x2
  402158:	f9001301 	str	x1, [x24, #32]
  40215c:	a94157f4 	ldp	x20, x21, [sp, #16]
  402160:	a9425ff6 	ldp	x22, x23, [sp, #32]
  402164:	f9401bf8 	ldr	x24, [sp, #48]
  402168:	a8c64ffe 	ldp	x30, x19, [sp], #96
  40216c:	d65f03c0 	ret
  402170:	b9400301 	ldr	w1, [x24]
  402174:	d2800000 	mov	x0, #0x0                   	// #0
  402178:	a9027f1f 	stp	xzr, xzr, [x24, #32]
  40217c:	321b0021 	orr	w1, w1, #0x20
  402180:	b9000301 	str	w1, [x24]
  402184:	f9001f1f 	str	xzr, [x24, #56]
  402188:	71000abf 	cmp	w21, #0x2
  40218c:	54fffe80 	b.eq	0x40215c  // b.none
  402190:	f9400660 	ldr	x0, [x19, #8]
  402194:	cb0002c0 	sub	x0, x22, x0
  402198:	17fffff1 	b	0x40215c
  40219c:	f9400262 	ldr	x2, [x19]
  4021a0:	cb010063 	sub	x3, x3, x1
  4021a4:	8b010041 	add	x1, x2, x1
  4021a8:	a9000e61 	stp	x1, x3, [x19]
  4021ac:	b9807b00 	ldrsw	x0, [x24, #120]
  4021b0:	aa1303e1 	mov	x1, x19
  4021b4:	aa1403e2 	mov	x2, x20
  4021b8:	d2800848 	mov	x8, #0x42                  	// #66
  4021bc:	d4000001 	svc	#0x0
  4021c0:	97fff97c 	bl	0x4007b0
  4021c4:	aa0003e1 	mov	x1, x0
  4021c8:	eb0002ff 	cmp	x23, x0
  4021cc:	54fffbc0 	b.eq	0x402144  // b.none
  4021d0:	cb0002f7 	sub	x23, x23, x0
  4021d4:	b7fffce0 	tbnz	x0, #63, 0x402170
  4021d8:	f9400663 	ldr	x3, [x19, #8]
  4021dc:	eb03001f 	cmp	x0, x3
  4021e0:	54fffde9 	b.ls	0x40219c  // b.plast
  4021e4:	510006b5 	sub	w21, w21, #0x1
  4021e8:	cb030001 	sub	x1, x0, x3
  4021ec:	f9400e63 	ldr	x3, [x19, #24]
  4021f0:	93407eb4 	sxtw	x20, w21
  4021f4:	91004273 	add	x19, x19, #0x10
  4021f8:	17ffffe9 	b	0x40219c
  4021fc:	f81f0ffe 	str	x30, [sp, #-16]!
  402200:	d0000000 	adrp	x0, 0x404000
  402204:	911ec000 	add	x0, x0, #0x7b0
  402208:	97fffa8b 	bl	0x400c34
  40220c:	f84107fe 	ldr	x30, [sp], #16
  402210:	d0000000 	adrp	x0, 0x404000
  402214:	911ee000 	add	x0, x0, #0x7b8
  402218:	d65f03c0 	ret
  40221c:	d0000000 	adrp	x0, 0x404000
  402220:	911ec000 	add	x0, x0, #0x7b0
  402224:	17fffaca 	b	0x400d4c
  402228:	d2800002 	mov	x2, #0x0                   	// #0
  40222c:	38626804 	ldrb	w4, [x0, x2]
  402230:	38626823 	ldrb	w3, [x1, x2]
  402234:	91000442 	add	x2, x2, #0x1
  402238:	6b03009f 	cmp	w4, w3
  40223c:	54000061 	b.ne	0x402248  // b.any
  402240:	35ffff63 	cbnz	w3, 0x40222c
  402244:	52800004 	mov	w4, #0x0                   	// #0
  402248:	4b030080 	sub	w0, w4, w3
  40224c:	d65f03c0 	ret

Disassembly of section .fini:

0000000000402250 <.fini>:
  402250:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  402254:	910003fd 	mov	x29, sp
  402258:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40225c:	d65f03c0 	ret
