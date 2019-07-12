   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 101                     ; 13 void tim1SetValues(uint16_t arr, uint16_t psc, uint16_t cnt) {
 103                     	switch	.text
 104  0000               _tim1SetValues:
 106  0000 89            	pushw	x
 107  0001 5206          	subw	sp,#6
 108       00000006      OFST:	set	6
 111                     ; 14 	IoRegister *tim_arr = &TIM1->ARRH;
 113  0003 ae5262        	ldw	x,#21090
 114  0006 1f01          	ldw	(OFST-5,sp),x
 116                     ; 15 	IoRegister *tim_psc = &TIM1->PSCRH;
 118  0008 ae5260        	ldw	x,#21088
 119  000b 1f03          	ldw	(OFST-3,sp),x
 121                     ; 16 	IoRegister *tim_cnt = &TIM1->CNTRH;
 123  000d ae525e        	ldw	x,#21086
 124  0010 1f05          	ldw	(OFST-1,sp),x
 126                     ; 18 	psc -= 1;
 128  0012 1e0b          	ldw	x,(OFST+5,sp)
 129  0014 1d0001        	subw	x,#1
 130  0017 1f0b          	ldw	(OFST+5,sp),x
 131                     ; 20 	*tim_arr = ((0xff00 & arr) >> 8);
 133  0019 7b07          	ld	a,(OFST+1,sp)
 134  001b c75262        	ld	21090,a
 135                     ; 21 	*tim_psc = ((0xff00 & psc) >> 8);
 137  001e 7b0b          	ld	a,(OFST+5,sp)
 138  0020 c75260        	ld	21088,a
 139                     ; 22 	*tim_cnt = ((0xff00 & cnt) >> 8);
 141  0023 7b0d          	ld	a,(OFST+7,sp)
 142  0025 c7525e        	ld	21086,a
 143                     ; 23 	tim_arr++;
 145  0028 1e01          	ldw	x,(OFST-5,sp)
 146  002a 1c0001        	addw	x,#1
 147  002d 1f01          	ldw	(OFST-5,sp),x
 149                     ; 24 	tim_psc++;
 151  002f 1e03          	ldw	x,(OFST-3,sp)
 152  0031 1c0001        	addw	x,#1
 153  0034 1f03          	ldw	(OFST-3,sp),x
 155                     ; 25 	tim_cnt++;
 157  0036 1e05          	ldw	x,(OFST-1,sp)
 158  0038 1c0001        	addw	x,#1
 159  003b 1f05          	ldw	(OFST-1,sp),x
 161                     ; 26 	*tim_arr = (0x00ff & arr);
 163  003d 7b08          	ld	a,(OFST+2,sp)
 164  003f a4ff          	and	a,#255
 165  0041 1e01          	ldw	x,(OFST-5,sp)
 166  0043 f7            	ld	(x),a
 167                     ; 27 	*tim_psc = (0x00ff & psc);
 169  0044 7b0c          	ld	a,(OFST+6,sp)
 170  0046 a4ff          	and	a,#255
 171  0048 1e03          	ldw	x,(OFST-3,sp)
 172  004a f7            	ld	(x),a
 173                     ; 28 	*tim_cnt = (0x00ff & cnt);
 175  004b 7b0e          	ld	a,(OFST+8,sp)
 176  004d a4ff          	and	a,#255
 177  004f 1e05          	ldw	x,(OFST-1,sp)
 178  0051 f7            	ld	(x),a
 179                     ; 29 }
 182  0052 5b08          	addw	sp,#8
 183  0054 81            	ret
 236                     ; 31 void tim1OCSetValue(uint32_t channel, uint16_t compareValue) {
 237                     	switch	.text
 238  0055               _tim1OCSetValue:
 240  0055 5206          	subw	sp,#6
 241       00000006      OFST:	set	6
 244                     ; 32 	IoRegister *ccr = &TIM1->CCR1H;
 246  0057 ae5265        	ldw	x,#21093
 247  005a 1f05          	ldw	(OFST-1,sp),x
 249                     ; 34 	ccr += ((channel - 1) * 2);
 251  005c 96            	ldw	x,sp
 252  005d 1c0009        	addw	x,#OFST+3
 253  0060 cd0000        	call	c_ltor
 255  0063 3803          	sll	c_lreg+3
 256  0065 3902          	rlc	c_lreg+2
 257  0067 3901          	rlc	c_lreg+1
 258  0069 3900          	rlc	c_lreg
 259  006b a602          	ld	a,#2
 260  006d cd0000        	call	c_lsbc
 262  0070 96            	ldw	x,sp
 263  0071 1c0001        	addw	x,#OFST-5
 264  0074 cd0000        	call	c_rtol
 267  0077 1e05          	ldw	x,(OFST-1,sp)
 268  0079 cd0000        	call	c_uitolx
 270  007c 96            	ldw	x,sp
 271  007d 1c0001        	addw	x,#OFST-5
 272  0080 cd0000        	call	c_ladd
 274  0083 be02          	ldw	x,c_lreg+2
 275  0085 1f05          	ldw	(OFST-1,sp),x
 277                     ; 36 	*ccr &= 0x00;
 279  0087 1e05          	ldw	x,(OFST-1,sp)
 280  0089 7f            	clr	(x)
 281                     ; 37 	*ccr = ((0xff00 & compareValue) >> 8);
 283  008a 7b0d          	ld	a,(OFST+7,sp)
 284  008c 1e05          	ldw	x,(OFST-1,sp)
 285  008e f7            	ld	(x),a
 286                     ; 38 	ccr++;
 288  008f 1e05          	ldw	x,(OFST-1,sp)
 289  0091 1c0001        	addw	x,#1
 290  0094 1f05          	ldw	(OFST-1,sp),x
 292                     ; 39 	*ccr = (0x00ff & compareValue);
 294  0096 7b0e          	ld	a,(OFST+8,sp)
 295  0098 a4ff          	and	a,#255
 296  009a 1e05          	ldw	x,(OFST-1,sp)
 297  009c f7            	ld	(x),a
 298                     ; 40 }
 301  009d 5b06          	addw	sp,#6
 302  009f 81            	ret
 355                     ; 42 void tim1OCSetMode(uint32_t channel, uint32_t mode) {
 356                     	switch	.text
 357  00a0               _tim1OCSetMode:
 359  00a0 5206          	subw	sp,#6
 360       00000006      OFST:	set	6
 363                     ; 43 	IoRegister *ccmr = &TIM1->CCMR1;
 365  00a2 ae5258        	ldw	x,#21080
 366  00a5 1f05          	ldw	(OFST-1,sp),x
 368                     ; 45 	ccmr += (channel - 1);
 370  00a7 96            	ldw	x,sp
 371  00a8 1c0009        	addw	x,#OFST+3
 372  00ab cd0000        	call	c_ltor
 374  00ae a601          	ld	a,#1
 375  00b0 cd0000        	call	c_lsbc
 377  00b3 96            	ldw	x,sp
 378  00b4 1c0001        	addw	x,#OFST-5
 379  00b7 cd0000        	call	c_rtol
 382  00ba 1e05          	ldw	x,(OFST-1,sp)
 383  00bc cd0000        	call	c_uitolx
 385  00bf 96            	ldw	x,sp
 386  00c0 1c0001        	addw	x,#OFST-5
 387  00c3 cd0000        	call	c_ladd
 389  00c6 be02          	ldw	x,c_lreg+2
 390  00c8 1f05          	ldw	(OFST-1,sp),x
 392                     ; 47 	*ccmr &= ~(1 << 4);
 394  00ca 1e05          	ldw	x,(OFST-1,sp)
 395  00cc f6            	ld	a,(x)
 396  00cd a4ef          	and	a,#239
 397  00cf f7            	ld	(x),a
 398                     ; 48 	*ccmr |= (mode << 4);
 400  00d0 1e05          	ldw	x,(OFST-1,sp)
 401  00d2 7b10          	ld	a,(OFST+10,sp)
 402  00d4 4e            	swap	a
 403  00d5 a4f0          	and	a,#240
 404  00d7 fa            	or	a,(x)
 405  00d8 f7            	ld	(x),a
 406                     ; 49 }
 409  00d9 5b06          	addw	sp,#6
 410  00db 81            	ret
 492                     .const:	section	.text
 493  0000               L41:
 494  0000 00000003      	dc.l	3
 495  0004               L61:
 496  0004 00000005      	dc.l	5
 497                     ; 51 void tim1InitOC(uint32_t channel, uint32_t mode, uint16_t compareValue, uint16_t ARRValue, uint16_t PSCValue, uint16_t CNTValue) {
 498                     	switch	.text
 499  00dc               _tim1InitOC:
 501       00000000      OFST:	set	0
 504                     ; 52 	TIM1_ENABLE_CLK_GATING();
 506  00dc 358050c7      	mov	20679,#128
 507                     ; 53 	tim1OCSetMode(channel, mode);
 509  00e0 1e09          	ldw	x,(OFST+9,sp)
 510  00e2 89            	pushw	x
 511  00e3 1e09          	ldw	x,(OFST+9,sp)
 512  00e5 89            	pushw	x
 513  00e6 1e09          	ldw	x,(OFST+9,sp)
 514  00e8 89            	pushw	x
 515  00e9 1e09          	ldw	x,(OFST+9,sp)
 516  00eb 89            	pushw	x
 517  00ec adb2          	call	_tim1OCSetMode
 519  00ee 5b08          	addw	sp,#8
 520                     ; 54 	tim1OCSetValue(channel, compareValue);
 522  00f0 1e0b          	ldw	x,(OFST+11,sp)
 523  00f2 89            	pushw	x
 524  00f3 1e07          	ldw	x,(OFST+7,sp)
 525  00f5 89            	pushw	x
 526  00f6 1e07          	ldw	x,(OFST+7,sp)
 527  00f8 89            	pushw	x
 528  00f9 cd0055        	call	_tim1OCSetValue
 530  00fc 5b06          	addw	sp,#6
 531                     ; 55 	tim1SetValues(ARRValue, PSCValue, CNTValue);
 533  00fe 1e11          	ldw	x,(OFST+17,sp)
 534  0100 89            	pushw	x
 535  0101 1e11          	ldw	x,(OFST+17,sp)
 536  0103 89            	pushw	x
 537  0104 1e11          	ldw	x,(OFST+17,sp)
 538  0106 cd0000        	call	_tim1SetValues
 540  0109 5b04          	addw	sp,#4
 541                     ; 57 	if(channel > 2 && channel < 5)
 543  010b 96            	ldw	x,sp
 544  010c 1c0003        	addw	x,#OFST+3
 545  010f cd0000        	call	c_ltor
 547  0112 ae0000        	ldw	x,#L41
 548  0115 cd0000        	call	c_lcmp
 550  0118 2529          	jrult	L171
 552  011a 96            	ldw	x,sp
 553  011b 1c0003        	addw	x,#OFST+3
 554  011e cd0000        	call	c_ltor
 556  0121 ae0004        	ldw	x,#L61
 557  0124 cd0000        	call	c_lcmp
 559  0127 241a          	jruge	L171
 560                     ; 58 		TIM1->CCER2 |= (5 << (((channel) - 3) *4));
 562  0129 7b06          	ld	a,(OFST+6,sp)
 563  012b 48            	sll	a
 564  012c 48            	sll	a
 565  012d 5f            	clrw	x
 566  012e 97            	ld	xl,a
 567  012f 1d000c        	subw	x,#12
 568  0132 a605          	ld	a,#5
 569  0134 5d            	tnzw	x
 570  0135 2704          	jreq	L02
 571  0137               L22:
 572  0137 48            	sll	a
 573  0138 5a            	decw	x
 574  0139 26fc          	jrne	L22
 575  013b               L02:
 576  013b ca525d        	or	a,21085
 577  013e c7525d        	ld	21085,a
 579  0141 2030          	jra	L371
 580  0143               L171:
 581                     ; 60 	else if(channel > 0 && channel < 3)
 583  0143 96            	ldw	x,sp
 584  0144 1c0003        	addw	x,#OFST+3
 585  0147 cd0000        	call	c_lzmp
 587  014a 272c          	jreq	L571
 589  014c 96            	ldw	x,sp
 590  014d 1c0003        	addw	x,#OFST+3
 591  0150 cd0000        	call	c_ltor
 593  0153 ae0000        	ldw	x,#L41
 594  0156 cd0000        	call	c_lcmp
 596  0159 241d          	jruge	L571
 597                     ; 61 		TIM1->CCER1 |= (5 << (((channel) - 1) *4));
 599  015b 7b06          	ld	a,(OFST+6,sp)
 600  015d 48            	sll	a
 601  015e 48            	sll	a
 602  015f 5f            	clrw	x
 603  0160 97            	ld	xl,a
 604  0161 1d0004        	subw	x,#4
 605  0164 a605          	ld	a,#5
 606  0166 5d            	tnzw	x
 607  0167 2704          	jreq	L42
 608  0169               L62:
 609  0169 48            	sll	a
 610  016a 5a            	decw	x
 611  016b 26fc          	jrne	L62
 612  016d               L42:
 613  016d ca525c        	or	a,21084
 614  0170 c7525c        	ld	21084,a
 616  0173               L371:
 617                     ; 65 	TIM1_MOE_ENABLE();
 619  0173 721e526d      	bset	21101,#7
 620                     ; 66 }
 623  0177 81            	ret
 624  0178               L571:
 625                     ; 64 		return;
 628  0178 81            	ret
 641                     	xdef	_tim1InitOC
 642                     	xdef	_tim1OCSetMode
 643                     	xdef	_tim1OCSetValue
 644                     	xdef	_tim1SetValues
 645                     	xref.b	c_lreg
 664                     	xref	c_lzmp
 665                     	xref	c_lcmp
 666                     	xref	c_ladd
 667                     	xref	c_rtol
 668                     	xref	c_lsbc
 669                     	xref	c_ltor
 670                     	xref	c_uitolx
 671                     	end
