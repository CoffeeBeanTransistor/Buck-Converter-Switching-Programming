   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  98                     .const:	section	.text
  99  0000               L6:
 100  0000 00010001      	dc.l	65537
 101                     ; 13 int determineMinPsc(double desiredTime, float freqPeriod) {
 102                     	scross	off
 103                     	switch	.text
 104  0000               _determineMinPsc:
 106  0000 520e          	subw	sp,#14
 107       0000000e      OFST:	set	14
 110                     ; 15 	int psc = 1;
 112  0002 ae0001        	ldw	x,#1
 113  0005 1f09          	ldw	(OFST-5,sp),x
 115                     ; 16 	float ms = (desiredTime/1000);
 117  0007 96            	ldw	x,sp
 118  0008 1c0011        	addw	x,#OFST+3
 119  000b cd0000        	call	c_ltor
 121  000e ae000c        	ldw	x,#L75
 122  0011 cd0000        	call	c_fdiv
 124  0014 96            	ldw	x,sp
 125  0015 1c0005        	addw	x,#OFST-9
 126  0018 cd0000        	call	c_rtol
 129                     ; 17 	float temp = 0;
 131  001b               L36:
 132                     ; 20 		temp = freqPeriod * psc;
 134  001b 1e09          	ldw	x,(OFST-5,sp)
 135  001d cd0000        	call	c_itof
 137  0020 96            	ldw	x,sp
 138  0021 1c0001        	addw	x,#OFST-13
 139  0024 cd0000        	call	c_rtol
 142  0027 96            	ldw	x,sp
 143  0028 1c0015        	addw	x,#OFST+7
 144  002b cd0000        	call	c_ltor
 146  002e 96            	ldw	x,sp
 147  002f 1c0001        	addw	x,#OFST-13
 148  0032 cd0000        	call	c_fmul
 150  0035 96            	ldw	x,sp
 151  0036 1c000b        	addw	x,#OFST-3
 152  0039 cd0000        	call	c_rtol
 155                     ; 21 		ticks = (ms/temp);
 157  003c 96            	ldw	x,sp
 158  003d 1c0005        	addw	x,#OFST-9
 159  0040 cd0000        	call	c_ltor
 161  0043 96            	ldw	x,sp
 162  0044 1c000b        	addw	x,#OFST-3
 163  0047 cd0000        	call	c_fdiv
 165  004a cd0000        	call	c_ftol
 167  004d 96            	ldw	x,sp
 168  004e 1c000b        	addw	x,#OFST-3
 169  0051 cd0000        	call	c_rtol
 172                     ; 22 		if(ticks > 65536)
 174  0054 9c            	rvf
 175  0055 96            	ldw	x,sp
 176  0056 1c000b        	addw	x,#OFST-3
 177  0059 cd0000        	call	c_ltor
 179  005c ae0000        	ldw	x,#L6
 180  005f cd0000        	call	c_lcmp
 182  0062 2f07          	jrslt	L56
 183                     ; 23 			psc++;
 185  0064 1e09          	ldw	x,(OFST-5,sp)
 186  0066 1c0001        	addw	x,#1
 187  0069 1f09          	ldw	(OFST-5,sp),x
 189  006b               L56:
 190                     ; 24 	}while(ticks > 65536);
 192  006b 9c            	rvf
 193  006c 96            	ldw	x,sp
 194  006d 1c000b        	addw	x,#OFST-3
 195  0070 cd0000        	call	c_ltor
 197  0073 ae0000        	ldw	x,#L6
 198  0076 cd0000        	call	c_lcmp
 200  0079 2ea0          	jrsge	L36
 201                     ; 26 	return psc;
 203  007b 1e09          	ldw	x,(OFST-5,sp)
 206  007d 5b0e          	addw	sp,#14
 207  007f 81            	ret
 250                     ; 29 void setTim1Freq(uint16_t freq) {
 251                     	switch	.text
 252  0080               _setTim1Freq:
 254  0080 89            	pushw	x
 255  0081 89            	pushw	x
 256       00000002      OFST:	set	2
 259                     ; 32 	period = 1/freq;
 261  0082 ae0001        	ldw	x,#1
 262  0085 1603          	ldw	y,(OFST+1,sp)
 263  0087 65            	divw	x,y
 264                     ; 35 }
 267  0088 5b04          	addw	sp,#4
 268  008a 81            	ret
 350                     ; 37 void tim1SetValues(uint16_t arr, uint16_t psc, uint16_t cnt) {
 351                     	switch	.text
 352  008b               _tim1SetValues:
 354  008b 89            	pushw	x
 355  008c 5206          	subw	sp,#6
 356       00000006      OFST:	set	6
 359                     ; 38 	IoRegister *tim_arr = &TIM1->ARRH;
 361  008e ae5262        	ldw	x,#21090
 362  0091 1f01          	ldw	(OFST-5,sp),x
 364                     ; 39 	IoRegister *tim_psc = &TIM1->PSCRH;
 366  0093 ae5260        	ldw	x,#21088
 367  0096 1f03          	ldw	(OFST-3,sp),x
 369                     ; 40 	IoRegister *tim_cnt = &TIM1->CNTRH;
 371  0098 ae525e        	ldw	x,#21086
 372  009b 1f05          	ldw	(OFST-1,sp),x
 374                     ; 42 	psc -= 1;
 376  009d 1e0b          	ldw	x,(OFST+5,sp)
 377  009f 1d0001        	subw	x,#1
 378  00a2 1f0b          	ldw	(OFST+5,sp),x
 379                     ; 44 	*tim_arr = ((0xff00 & arr) >> 8);
 381  00a4 7b07          	ld	a,(OFST+1,sp)
 382  00a6 c75262        	ld	21090,a
 383                     ; 45 	*tim_psc = ((0xff00 & psc) >> 8);
 385  00a9 7b0b          	ld	a,(OFST+5,sp)
 386  00ab c75260        	ld	21088,a
 387                     ; 46 	*tim_cnt = ((0xff00 & cnt) >> 8);
 389  00ae 7b0d          	ld	a,(OFST+7,sp)
 390  00b0 c7525e        	ld	21086,a
 391                     ; 47 	tim_arr++;
 393  00b3 1e01          	ldw	x,(OFST-5,sp)
 394  00b5 1c0001        	addw	x,#1
 395  00b8 1f01          	ldw	(OFST-5,sp),x
 397                     ; 48 	tim_psc++;
 399  00ba 1e03          	ldw	x,(OFST-3,sp)
 400  00bc 1c0001        	addw	x,#1
 401  00bf 1f03          	ldw	(OFST-3,sp),x
 403                     ; 49 	tim_cnt++;
 405  00c1 1e05          	ldw	x,(OFST-1,sp)
 406  00c3 1c0001        	addw	x,#1
 407  00c6 1f05          	ldw	(OFST-1,sp),x
 409                     ; 50 	*tim_arr = (0x00ff & arr);
 411  00c8 7b08          	ld	a,(OFST+2,sp)
 412  00ca a4ff          	and	a,#255
 413  00cc 1e01          	ldw	x,(OFST-5,sp)
 414  00ce f7            	ld	(x),a
 415                     ; 51 	*tim_psc = (0x00ff & psc);
 417  00cf 7b0c          	ld	a,(OFST+6,sp)
 418  00d1 a4ff          	and	a,#255
 419  00d3 1e03          	ldw	x,(OFST-3,sp)
 420  00d5 f7            	ld	(x),a
 421                     ; 52 	*tim_cnt = (0x00ff & cnt);
 423  00d6 7b0e          	ld	a,(OFST+8,sp)
 424  00d8 a4ff          	and	a,#255
 425  00da 1e05          	ldw	x,(OFST-1,sp)
 426  00dc f7            	ld	(x),a
 427                     ; 53 }
 430  00dd 5b08          	addw	sp,#8
 431  00df 81            	ret
 484                     ; 55 void tim1OCSetValue(uint32_t channel, uint16_t compareValue) {
 485                     	switch	.text
 486  00e0               _tim1OCSetValue:
 488  00e0 5206          	subw	sp,#6
 489       00000006      OFST:	set	6
 492                     ; 56 	IoRegister *ccr = &TIM1->CCR1H;
 494  00e2 ae5265        	ldw	x,#21093
 495  00e5 1f05          	ldw	(OFST-1,sp),x
 497                     ; 58 	ccr += ((channel - 1) * 2);
 499  00e7 96            	ldw	x,sp
 500  00e8 1c0009        	addw	x,#OFST+3
 501  00eb cd0000        	call	c_ltor
 503  00ee 3803          	sll	c_lreg+3
 504  00f0 3902          	rlc	c_lreg+2
 505  00f2 3901          	rlc	c_lreg+1
 506  00f4 3900          	rlc	c_lreg
 507  00f6 a602          	ld	a,#2
 508  00f8 cd0000        	call	c_lsbc
 510  00fb 96            	ldw	x,sp
 511  00fc 1c0001        	addw	x,#OFST-5
 512  00ff cd0000        	call	c_rtol
 515  0102 1e05          	ldw	x,(OFST-1,sp)
 516  0104 cd0000        	call	c_uitolx
 518  0107 96            	ldw	x,sp
 519  0108 1c0001        	addw	x,#OFST-5
 520  010b cd0000        	call	c_ladd
 522  010e be02          	ldw	x,c_lreg+2
 523  0110 1f05          	ldw	(OFST-1,sp),x
 525                     ; 60 	*ccr &= 0x00;
 527  0112 1e05          	ldw	x,(OFST-1,sp)
 528  0114 7f            	clr	(x)
 529                     ; 61 	*ccr = ((0xff00 & compareValue) >> 8);
 531  0115 7b0d          	ld	a,(OFST+7,sp)
 532  0117 1e05          	ldw	x,(OFST-1,sp)
 533  0119 f7            	ld	(x),a
 534                     ; 62 	ccr++;
 536  011a 1e05          	ldw	x,(OFST-1,sp)
 537  011c 1c0001        	addw	x,#1
 538  011f 1f05          	ldw	(OFST-1,sp),x
 540                     ; 63 	*ccr = (0x00ff & compareValue);
 542  0121 7b0e          	ld	a,(OFST+8,sp)
 543  0123 a4ff          	and	a,#255
 544  0125 1e05          	ldw	x,(OFST-1,sp)
 545  0127 f7            	ld	(x),a
 546                     ; 64 }
 549  0128 5b06          	addw	sp,#6
 550  012a 81            	ret
 603                     ; 66 void tim1OCSetMode(uint32_t channel, uint32_t mode) {
 604                     	switch	.text
 605  012b               _tim1OCSetMode:
 607  012b 5206          	subw	sp,#6
 608       00000006      OFST:	set	6
 611                     ; 67 	IoRegister *ccmr = &TIM1->CCMR1;
 613  012d ae5258        	ldw	x,#21080
 614  0130 1f05          	ldw	(OFST-1,sp),x
 616                     ; 69 	ccmr += (channel - 1);
 618  0132 96            	ldw	x,sp
 619  0133 1c0009        	addw	x,#OFST+3
 620  0136 cd0000        	call	c_ltor
 622  0139 a601          	ld	a,#1
 623  013b cd0000        	call	c_lsbc
 625  013e 96            	ldw	x,sp
 626  013f 1c0001        	addw	x,#OFST-5
 627  0142 cd0000        	call	c_rtol
 630  0145 1e05          	ldw	x,(OFST-1,sp)
 631  0147 cd0000        	call	c_uitolx
 633  014a 96            	ldw	x,sp
 634  014b 1c0001        	addw	x,#OFST-5
 635  014e cd0000        	call	c_ladd
 637  0151 be02          	ldw	x,c_lreg+2
 638  0153 1f05          	ldw	(OFST-1,sp),x
 640                     ; 71 	*ccmr &= ~(1 << 4);
 642  0155 1e05          	ldw	x,(OFST-1,sp)
 643  0157 f6            	ld	a,(x)
 644  0158 a4ef          	and	a,#239
 645  015a f7            	ld	(x),a
 646                     ; 72 	*ccmr |= (mode << 4);
 648  015b 1e05          	ldw	x,(OFST-1,sp)
 649  015d 7b10          	ld	a,(OFST+10,sp)
 650  015f 4e            	swap	a
 651  0160 a4f0          	and	a,#240
 652  0162 fa            	or	a,(x)
 653  0163 f7            	ld	(x),a
 654                     ; 73 }
 657  0164 5b06          	addw	sp,#6
 658  0166 81            	ret
 740                     	switch	.const
 741  0004               L22:
 742  0004 00000003      	dc.l	3
 743  0008               L42:
 744  0008 00000005      	dc.l	5
 745                     ; 75 void tim1InitOC(uint32_t channel, uint32_t mode, uint16_t compareValue, uint16_t ARRValue, uint16_t PSCValue, uint16_t CNTValue) {
 746                     	switch	.text
 747  0167               _tim1InitOC:
 749       00000000      OFST:	set	0
 752                     ; 76 	TIM1_ENABLE_CLK_GATING();
 754  0167 358050c7      	mov	20679,#128
 755                     ; 77 	tim1OCSetMode(channel, mode);
 757  016b 1e09          	ldw	x,(OFST+9,sp)
 758  016d 89            	pushw	x
 759  016e 1e09          	ldw	x,(OFST+9,sp)
 760  0170 89            	pushw	x
 761  0171 1e09          	ldw	x,(OFST+9,sp)
 762  0173 89            	pushw	x
 763  0174 1e09          	ldw	x,(OFST+9,sp)
 764  0176 89            	pushw	x
 765  0177 adb2          	call	_tim1OCSetMode
 767  0179 5b08          	addw	sp,#8
 768                     ; 78 	tim1OCSetValue(channel, compareValue);
 770  017b 1e0b          	ldw	x,(OFST+11,sp)
 771  017d 89            	pushw	x
 772  017e 1e07          	ldw	x,(OFST+7,sp)
 773  0180 89            	pushw	x
 774  0181 1e07          	ldw	x,(OFST+7,sp)
 775  0183 89            	pushw	x
 776  0184 cd00e0        	call	_tim1OCSetValue
 778  0187 5b06          	addw	sp,#6
 779                     ; 79 	tim1SetValues(ARRValue, PSCValue, CNTValue);
 781  0189 1e11          	ldw	x,(OFST+17,sp)
 782  018b 89            	pushw	x
 783  018c 1e11          	ldw	x,(OFST+17,sp)
 784  018e 89            	pushw	x
 785  018f 1e11          	ldw	x,(OFST+17,sp)
 786  0191 cd008b        	call	_tim1SetValues
 788  0194 5b04          	addw	sp,#4
 789                     ; 81 	if(channel > 2 && channel < 5)
 791  0196 96            	ldw	x,sp
 792  0197 1c0003        	addw	x,#OFST+3
 793  019a cd0000        	call	c_ltor
 795  019d ae0004        	ldw	x,#L22
 796  01a0 cd0000        	call	c_lcmp
 798  01a3 2529          	jrult	L572
 800  01a5 96            	ldw	x,sp
 801  01a6 1c0003        	addw	x,#OFST+3
 802  01a9 cd0000        	call	c_ltor
 804  01ac ae0008        	ldw	x,#L42
 805  01af cd0000        	call	c_lcmp
 807  01b2 241a          	jruge	L572
 808                     ; 82 		TIM1->CCER2 |= (5 << (((channel) - 3) *4));
 810  01b4 7b06          	ld	a,(OFST+6,sp)
 811  01b6 48            	sll	a
 812  01b7 48            	sll	a
 813  01b8 5f            	clrw	x
 814  01b9 97            	ld	xl,a
 815  01ba 1d000c        	subw	x,#12
 816  01bd a605          	ld	a,#5
 817  01bf 5d            	tnzw	x
 818  01c0 2704          	jreq	L62
 819  01c2               L03:
 820  01c2 48            	sll	a
 821  01c3 5a            	decw	x
 822  01c4 26fc          	jrne	L03
 823  01c6               L62:
 824  01c6 ca525d        	or	a,21085
 825  01c9 c7525d        	ld	21085,a
 827  01cc 2030          	jra	L772
 828  01ce               L572:
 829                     ; 84 	else if(channel > 0 && channel < 3)
 831  01ce 96            	ldw	x,sp
 832  01cf 1c0003        	addw	x,#OFST+3
 833  01d2 cd0000        	call	c_lzmp
 835  01d5 272c          	jreq	L103
 837  01d7 96            	ldw	x,sp
 838  01d8 1c0003        	addw	x,#OFST+3
 839  01db cd0000        	call	c_ltor
 841  01de ae0004        	ldw	x,#L22
 842  01e1 cd0000        	call	c_lcmp
 844  01e4 241d          	jruge	L103
 845                     ; 85 		TIM1->CCER1 |= (5 << (((channel) - 1) *4));
 847  01e6 7b06          	ld	a,(OFST+6,sp)
 848  01e8 48            	sll	a
 849  01e9 48            	sll	a
 850  01ea 5f            	clrw	x
 851  01eb 97            	ld	xl,a
 852  01ec 1d0004        	subw	x,#4
 853  01ef a605          	ld	a,#5
 854  01f1 5d            	tnzw	x
 855  01f2 2704          	jreq	L23
 856  01f4               L43:
 857  01f4 48            	sll	a
 858  01f5 5a            	decw	x
 859  01f6 26fc          	jrne	L43
 860  01f8               L23:
 861  01f8 ca525c        	or	a,21084
 862  01fb c7525c        	ld	21084,a
 864  01fe               L772:
 865                     ; 89 	TIM1_MOE_ENABLE();
 867  01fe 721e526d      	bset	21101,#7
 868                     ; 90 }
 871  0202 81            	ret
 872  0203               L103:
 873                     ; 88 		return;
 876  0203 81            	ret
 889                     	xdef	_tim1InitOC
 890                     	xdef	_tim1OCSetMode
 891                     	xdef	_tim1OCSetValue
 892                     	xdef	_tim1SetValues
 893                     	xdef	_setTim1Freq
 894                     	xdef	_determineMinPsc
 895                     	switch	.const
 896  000c               L75:
 897  000c 447a0000      	dc.w	17530,0
 898                     	xref.b	c_lreg
 899                     	xref.b	c_x
 919                     	xref	c_lzmp
 920                     	xref	c_ladd
 921                     	xref	c_lsbc
 922                     	xref	c_uitolx
 923                     	xref	c_lcmp
 924                     	xref	c_ftol
 925                     	xref	c_fmul
 926                     	xref	c_itof
 927                     	xref	c_rtol
 928                     	xref	c_fdiv
 929                     	xref	c_ltor
 930                     	end
