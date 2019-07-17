   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  89                     .const:	section	.text
  90  0000               L6:
  91  0000 00010001      	dc.l	65537
  92                     ; 10 uint16_t determineMinPsc(float desiredTime, float freqPeriod) {
  93                     	scross	off
  94                     	switch	.text
  95  0000               _determineMinPsc:
  97  0000 520a          	subw	sp,#10
  98       0000000a      OFST:	set	10
 101                     ; 12 	uint16_t psc = 1;
 103  0002 ae0001        	ldw	x,#1
 104  0005 1f05          	ldw	(OFST-5,sp),x
 106                     ; 13 	float temp = 0;
 108  0007               L74:
 109                     ; 16 		temp = freqPeriod * psc;
 111  0007 1e05          	ldw	x,(OFST-5,sp)
 112  0009 cd0000        	call	c_uitof
 114  000c 96            	ldw	x,sp
 115  000d 1c0001        	addw	x,#OFST-9
 116  0010 cd0000        	call	c_rtol
 119  0013 96            	ldw	x,sp
 120  0014 1c0011        	addw	x,#OFST+7
 121  0017 cd0000        	call	c_ltor
 123  001a 96            	ldw	x,sp
 124  001b 1c0001        	addw	x,#OFST-9
 125  001e cd0000        	call	c_fmul
 127  0021 96            	ldw	x,sp
 128  0022 1c0007        	addw	x,#OFST-3
 129  0025 cd0000        	call	c_rtol
 132                     ; 17 		ticks = (desiredTime/temp);
 134  0028 96            	ldw	x,sp
 135  0029 1c000d        	addw	x,#OFST+3
 136  002c cd0000        	call	c_ltor
 138  002f 96            	ldw	x,sp
 139  0030 1c0007        	addw	x,#OFST-3
 140  0033 cd0000        	call	c_fdiv
 142  0036 cd0000        	call	c_ftol
 144  0039 96            	ldw	x,sp
 145  003a 1c0007        	addw	x,#OFST-3
 146  003d cd0000        	call	c_rtol
 149                     ; 18 		if(ticks > 65536)
 151  0040 9c            	rvf
 152  0041 96            	ldw	x,sp
 153  0042 1c0007        	addw	x,#OFST-3
 154  0045 cd0000        	call	c_ltor
 156  0048 ae0000        	ldw	x,#L6
 157  004b cd0000        	call	c_lcmp
 159  004e 2f07          	jrslt	L15
 160                     ; 19 			psc++;
 162  0050 1e05          	ldw	x,(OFST-5,sp)
 163  0052 1c0001        	addw	x,#1
 164  0055 1f05          	ldw	(OFST-5,sp),x
 166  0057               L15:
 167                     ; 20 	}while(ticks > 65536);
 169  0057 9c            	rvf
 170  0058 96            	ldw	x,sp
 171  0059 1c0007        	addw	x,#OFST-3
 172  005c cd0000        	call	c_ltor
 174  005f ae0000        	ldw	x,#L6
 175  0062 cd0000        	call	c_lcmp
 177  0065 2ea0          	jrsge	L74
 178                     ; 22 	return psc;
 180  0067 1e05          	ldw	x,(OFST-5,sp)
 183  0069 5b0a          	addw	sp,#10
 184  006b 81            	ret
 245                     ; 25 uint16_t determineArr(float desiredTime, float freqPeriod,  uint16_t psc) {
 246                     	switch	.text
 247  006c               _determineArr:
 249  006c 520a          	subw	sp,#10
 250       0000000a      OFST:	set	10
 253                     ; 28 	arr = (uint16_t)(desiredTime/(freqPeriod*psc));
 255  006e 1e15          	ldw	x,(OFST+11,sp)
 256  0070 cd0000        	call	c_uitof
 258  0073 96            	ldw	x,sp
 259  0074 1c0005        	addw	x,#OFST-5
 260  0077 cd0000        	call	c_rtol
 263  007a 96            	ldw	x,sp
 264  007b 1c0011        	addw	x,#OFST+7
 265  007e cd0000        	call	c_ltor
 267  0081 96            	ldw	x,sp
 268  0082 1c0005        	addw	x,#OFST-5
 269  0085 cd0000        	call	c_fmul
 271  0088 96            	ldw	x,sp
 272  0089 1c0001        	addw	x,#OFST-9
 273  008c cd0000        	call	c_rtol
 276  008f 96            	ldw	x,sp
 277  0090 1c000d        	addw	x,#OFST+3
 278  0093 cd0000        	call	c_ltor
 280  0096 96            	ldw	x,sp
 281  0097 1c0001        	addw	x,#OFST-9
 282  009a cd0000        	call	c_fdiv
 284  009d cd0000        	call	c_ftoi
 286  00a0 1f09          	ldw	(OFST-1,sp),x
 288                     ; 29 	return arr;
 290  00a2 1e09          	ldw	x,(OFST-1,sp)
 293  00a4 5b0a          	addw	sp,#10
 294  00a6 81            	ret
 346                     ; 32 uint16_t determineOCValue(float arr, double dutyCycle) {
 347                     	switch	.text
 348  00a7               _determineOCValue:
 350  00a7 5206          	subw	sp,#6
 351       00000006      OFST:	set	6
 354                     ; 35 	if(dutyCycle < 1 && dutyCycle > 0) {
 356  00a9 9c            	rvf
 357  00aa a601          	ld	a,#1
 358  00ac cd0000        	call	c_ctof
 360  00af 96            	ldw	x,sp
 361  00b0 1c0001        	addw	x,#OFST-5
 362  00b3 cd0000        	call	c_rtol
 365  00b6 96            	ldw	x,sp
 366  00b7 1c000d        	addw	x,#OFST+7
 367  00ba cd0000        	call	c_ltor
 369  00bd 96            	ldw	x,sp
 370  00be 1c0001        	addw	x,#OFST-5
 371  00c1 cd0000        	call	c_fcmp
 373  00c4 2e1d          	jrsge	L731
 375  00c6 9c            	rvf
 376  00c7 9c            	rvf
 377  00c8 0d0d          	tnz	(OFST+7,sp)
 378  00ca 2d17          	jrsle	L731
 379                     ; 36 		OCValue = (uint16_t)(arr * dutyCycle);
 381  00cc 96            	ldw	x,sp
 382  00cd 1c0009        	addw	x,#OFST+3
 383  00d0 cd0000        	call	c_ltor
 385  00d3 96            	ldw	x,sp
 386  00d4 1c000d        	addw	x,#OFST+7
 387  00d7 cd0000        	call	c_fmul
 389  00da cd0000        	call	c_ftoi
 391  00dd 1f05          	ldw	(OFST-1,sp),x
 393                     ; 37 		return OCValue;
 395  00df 1e05          	ldw	x,(OFST-1,sp)
 397  00e1 203e          	jra	L41
 398  00e3               L731:
 399                     ; 41 	else if(dutyCycle < 100 && dutyCycle > 0) {
 401  00e3 9c            	rvf
 402  00e4 a664          	ld	a,#100
 403  00e6 cd0000        	call	c_ctof
 405  00e9 96            	ldw	x,sp
 406  00ea 1c0001        	addw	x,#OFST-5
 407  00ed cd0000        	call	c_rtol
 410  00f0 96            	ldw	x,sp
 411  00f1 1c000d        	addw	x,#OFST+7
 412  00f4 cd0000        	call	c_ltor
 414  00f7 96            	ldw	x,sp
 415  00f8 1c0001        	addw	x,#OFST-5
 416  00fb cd0000        	call	c_fcmp
 418  00fe 2e24          	jrsge	L341
 420  0100 9c            	rvf
 421  0101 9c            	rvf
 422  0102 0d0d          	tnz	(OFST+7,sp)
 423  0104 2d1e          	jrsle	L341
 424                     ; 42 		OCValue = (uint16_t)(arr * (dutyCycle / 100));
 426  0106 96            	ldw	x,sp
 427  0107 1c000d        	addw	x,#OFST+7
 428  010a cd0000        	call	c_ltor
 430  010d ae0010        	ldw	x,#L151
 431  0110 cd0000        	call	c_fdiv
 433  0113 96            	ldw	x,sp
 434  0114 1c0009        	addw	x,#OFST+3
 435  0117 cd0000        	call	c_fmul
 437  011a cd0000        	call	c_ftoi
 439  011d 1f05          	ldw	(OFST-1,sp),x
 441                     ; 43 		return OCValue;
 443  011f 1e05          	ldw	x,(OFST-1,sp)
 445  0121               L41:
 447  0121 5b06          	addw	sp,#6
 448  0123 81            	ret
 449  0124               L341:
 450                     ; 47 		return arr/2;
 452  0124 96            	ldw	x,sp
 453  0125 1c0009        	addw	x,#OFST+3
 454  0128 cd0000        	call	c_ltor
 456  012b ae000c        	ldw	x,#L361
 457  012e cd0000        	call	c_fdiv
 459  0131 cd0000        	call	c_ftoi
 462  0134 20eb          	jra	L41
 544                     ; 52 void tim1SetValues(uint16_t arr, uint16_t psc, uint16_t cnt) {
 545                     	switch	.text
 546  0136               _tim1SetValues:
 548  0136 89            	pushw	x
 549  0137 5206          	subw	sp,#6
 550       00000006      OFST:	set	6
 553                     ; 53 	IoRegister *tim_arr = &TIM1->ARRH;
 555  0139 ae5262        	ldw	x,#21090
 556  013c 1f01          	ldw	(OFST-5,sp),x
 558                     ; 54 	IoRegister *tim_psc = &TIM1->PSCRH;
 560  013e ae5260        	ldw	x,#21088
 561  0141 1f03          	ldw	(OFST-3,sp),x
 563                     ; 55 	IoRegister *tim_cnt = &TIM1->CNTRH;
 565  0143 ae525e        	ldw	x,#21086
 566  0146 1f05          	ldw	(OFST-1,sp),x
 568                     ; 57 	psc -= 1;
 570  0148 1e0b          	ldw	x,(OFST+5,sp)
 571  014a 1d0001        	subw	x,#1
 572  014d 1f0b          	ldw	(OFST+5,sp),x
 573                     ; 59 	*tim_arr = ((0xff00 & arr) >> 8);
 575  014f 7b07          	ld	a,(OFST+1,sp)
 576  0151 c75262        	ld	21090,a
 577                     ; 60 	*tim_psc = ((0xff00 & psc) >> 8);
 579  0154 7b0b          	ld	a,(OFST+5,sp)
 580  0156 c75260        	ld	21088,a
 581                     ; 61 	*tim_cnt = ((0xff00 & cnt) >> 8);
 583  0159 7b0d          	ld	a,(OFST+7,sp)
 584  015b c7525e        	ld	21086,a
 585                     ; 62 	tim_arr++;
 587  015e 1e01          	ldw	x,(OFST-5,sp)
 588  0160 1c0001        	addw	x,#1
 589  0163 1f01          	ldw	(OFST-5,sp),x
 591                     ; 63 	tim_psc++;
 593  0165 1e03          	ldw	x,(OFST-3,sp)
 594  0167 1c0001        	addw	x,#1
 595  016a 1f03          	ldw	(OFST-3,sp),x
 597                     ; 64 	tim_cnt++;
 599  016c 1e05          	ldw	x,(OFST-1,sp)
 600  016e 1c0001        	addw	x,#1
 601  0171 1f05          	ldw	(OFST-1,sp),x
 603                     ; 65 	*tim_arr = (0x00ff & arr);
 605  0173 7b08          	ld	a,(OFST+2,sp)
 606  0175 a4ff          	and	a,#255
 607  0177 1e01          	ldw	x,(OFST-5,sp)
 608  0179 f7            	ld	(x),a
 609                     ; 66 	*tim_psc = (0x00ff & psc);
 611  017a 7b0c          	ld	a,(OFST+6,sp)
 612  017c a4ff          	and	a,#255
 613  017e 1e03          	ldw	x,(OFST-3,sp)
 614  0180 f7            	ld	(x),a
 615                     ; 67 	*tim_cnt = (0x00ff & cnt);
 617  0181 7b0e          	ld	a,(OFST+8,sp)
 618  0183 a4ff          	and	a,#255
 619  0185 1e05          	ldw	x,(OFST-1,sp)
 620  0187 f7            	ld	(x),a
 621                     ; 68 }
 624  0188 5b08          	addw	sp,#8
 625  018a 81            	ret
 678                     ; 70 void tim1OCSetValue(uint32_t channel, uint16_t compareValue) {
 679                     	switch	.text
 680  018b               _tim1OCSetValue:
 682  018b 5206          	subw	sp,#6
 683       00000006      OFST:	set	6
 686                     ; 71 	IoRegister *ccr = &TIM1->CCR1H;
 688  018d ae5265        	ldw	x,#21093
 689  0190 1f05          	ldw	(OFST-1,sp),x
 691                     ; 73 	ccr += ((channel - 1) * 2);
 693  0192 96            	ldw	x,sp
 694  0193 1c0009        	addw	x,#OFST+3
 695  0196 cd0000        	call	c_ltor
 697  0199 3803          	sll	c_lreg+3
 698  019b 3902          	rlc	c_lreg+2
 699  019d 3901          	rlc	c_lreg+1
 700  019f 3900          	rlc	c_lreg
 701  01a1 a602          	ld	a,#2
 702  01a3 cd0000        	call	c_lsbc
 704  01a6 96            	ldw	x,sp
 705  01a7 1c0001        	addw	x,#OFST-5
 706  01aa cd0000        	call	c_rtol
 709  01ad 1e05          	ldw	x,(OFST-1,sp)
 710  01af cd0000        	call	c_uitolx
 712  01b2 96            	ldw	x,sp
 713  01b3 1c0001        	addw	x,#OFST-5
 714  01b6 cd0000        	call	c_ladd
 716  01b9 be02          	ldw	x,c_lreg+2
 717  01bb 1f05          	ldw	(OFST-1,sp),x
 719                     ; 75 	*ccr &= 0x00;
 721  01bd 1e05          	ldw	x,(OFST-1,sp)
 722  01bf 7f            	clr	(x)
 723                     ; 76 	*ccr = ((0xff00 & compareValue) >> 8);
 725  01c0 7b0d          	ld	a,(OFST+7,sp)
 726  01c2 1e05          	ldw	x,(OFST-1,sp)
 727  01c4 f7            	ld	(x),a
 728                     ; 77 	ccr++;
 730  01c5 1e05          	ldw	x,(OFST-1,sp)
 731  01c7 1c0001        	addw	x,#1
 732  01ca 1f05          	ldw	(OFST-1,sp),x
 734                     ; 78 	*ccr = (0x00ff & compareValue);
 736  01cc 7b0e          	ld	a,(OFST+8,sp)
 737  01ce a4ff          	and	a,#255
 738  01d0 1e05          	ldw	x,(OFST-1,sp)
 739  01d2 f7            	ld	(x),a
 740                     ; 79 }
 743  01d3 5b06          	addw	sp,#6
 744  01d5 81            	ret
 797                     ; 81 void tim1OCSetMode(uint32_t channel, uint32_t mode) {
 798                     	switch	.text
 799  01d6               _tim1OCSetMode:
 801  01d6 5206          	subw	sp,#6
 802       00000006      OFST:	set	6
 805                     ; 82 	IoRegister *ccmr = &TIM1->CCMR1;
 807  01d8 ae5258        	ldw	x,#21080
 808  01db 1f05          	ldw	(OFST-1,sp),x
 810                     ; 84 	ccmr += (channel - 1);
 812  01dd 96            	ldw	x,sp
 813  01de 1c0009        	addw	x,#OFST+3
 814  01e1 cd0000        	call	c_ltor
 816  01e4 a601          	ld	a,#1
 817  01e6 cd0000        	call	c_lsbc
 819  01e9 96            	ldw	x,sp
 820  01ea 1c0001        	addw	x,#OFST-5
 821  01ed cd0000        	call	c_rtol
 824  01f0 1e05          	ldw	x,(OFST-1,sp)
 825  01f2 cd0000        	call	c_uitolx
 827  01f5 96            	ldw	x,sp
 828  01f6 1c0001        	addw	x,#OFST-5
 829  01f9 cd0000        	call	c_ladd
 831  01fc be02          	ldw	x,c_lreg+2
 832  01fe 1f05          	ldw	(OFST-1,sp),x
 834                     ; 86 	*ccmr &= ~(1 << 4);
 836  0200 1e05          	ldw	x,(OFST-1,sp)
 837  0202 f6            	ld	a,(x)
 838  0203 a4ef          	and	a,#239
 839  0205 f7            	ld	(x),a
 840                     ; 87 	*ccmr |= (mode << 4);
 842  0206 1e05          	ldw	x,(OFST-1,sp)
 843  0208 7b10          	ld	a,(OFST+10,sp)
 844  020a 4e            	swap	a
 845  020b a4f0          	and	a,#240
 846  020d fa            	or	a,(x)
 847  020e f7            	ld	(x),a
 848                     ; 88 }
 851  020f 5b06          	addw	sp,#6
 852  0211 81            	ret
 936                     ; 90 void setTim1OCPeriod(float desiredTime, double dutyCycle, float freqPeriod) {
 937                     	switch	.text
 938  0212               _setTim1OCPeriod:
 940  0212 520c          	subw	sp,#12
 941       0000000c      OFST:	set	12
 944                     ; 93 	psc = determineMinPsc(desiredTime, freqPeriod);
 946  0214 1e19          	ldw	x,(OFST+13,sp)
 947  0216 89            	pushw	x
 948  0217 1e19          	ldw	x,(OFST+13,sp)
 949  0219 89            	pushw	x
 950  021a 1e15          	ldw	x,(OFST+9,sp)
 951  021c 89            	pushw	x
 952  021d 1e15          	ldw	x,(OFST+9,sp)
 953  021f 89            	pushw	x
 954  0220 cd0000        	call	_determineMinPsc
 956  0223 5b08          	addw	sp,#8
 957  0225 cd0000        	call	c_uitolx
 959  0228 96            	ldw	x,sp
 960  0229 1c0005        	addw	x,#OFST-7
 961  022c cd0000        	call	c_rtol
 964                     ; 94 	arr = determineArr(desiredTime, freqPeriod, psc);
 966  022f 1e07          	ldw	x,(OFST-5,sp)
 967  0231 89            	pushw	x
 968  0232 1e1b          	ldw	x,(OFST+15,sp)
 969  0234 89            	pushw	x
 970  0235 1e1b          	ldw	x,(OFST+15,sp)
 971  0237 89            	pushw	x
 972  0238 1e17          	ldw	x,(OFST+11,sp)
 973  023a 89            	pushw	x
 974  023b 1e17          	ldw	x,(OFST+11,sp)
 975  023d 89            	pushw	x
 976  023e cd006c        	call	_determineArr
 978  0241 5b0a          	addw	sp,#10
 979  0243 cd0000        	call	c_uitolx
 981  0246 96            	ldw	x,sp
 982  0247 1c0009        	addw	x,#OFST-3
 983  024a cd0000        	call	c_rtol
 986                     ; 95 	ocValue = determineOCValue(arr, dutyCycle);
 988  024d 1e15          	ldw	x,(OFST+9,sp)
 989  024f 89            	pushw	x
 990  0250 1e15          	ldw	x,(OFST+9,sp)
 991  0252 89            	pushw	x
 992  0253 96            	ldw	x,sp
 993  0254 1c000d        	addw	x,#OFST+1
 994  0257 cd0000        	call	c_ltor
 996  025a cd0000        	call	c_ultof
 998  025d be02          	ldw	x,c_lreg+2
 999  025f 89            	pushw	x
1000  0260 be00          	ldw	x,c_lreg
1001  0262 89            	pushw	x
1002  0263 cd00a7        	call	_determineOCValue
1004  0266 5b08          	addw	sp,#8
1005  0268 cd0000        	call	c_uitolx
1007  026b 96            	ldw	x,sp
1008  026c 1c0001        	addw	x,#OFST-11
1009  026f cd0000        	call	c_rtol
1012                     ; 97 	tim1SetValues(arr, psc, 0);
1014  0272 5f            	clrw	x
1015  0273 89            	pushw	x
1016  0274 1e09          	ldw	x,(OFST-3,sp)
1017  0276 89            	pushw	x
1018  0277 1e0f          	ldw	x,(OFST+3,sp)
1019  0279 cd0136        	call	_tim1SetValues
1021  027c 5b04          	addw	sp,#4
1022                     ; 98 	tim1OCSetValue(TIM_CH2, ocValue);
1024  027e 1e03          	ldw	x,(OFST-9,sp)
1025  0280 89            	pushw	x
1026  0281 ae0002        	ldw	x,#2
1027  0284 89            	pushw	x
1028  0285 ae0000        	ldw	x,#0
1029  0288 89            	pushw	x
1030  0289 cd018b        	call	_tim1OCSetValue
1032  028c 5b06          	addw	sp,#6
1033                     ; 99 }
1036  028e 5b0c          	addw	sp,#12
1037  0290 81            	ret
1117                     ; 101 void setTim1Freq(uint32_t desiredFreq, double dutyCycle) {
1118                     	switch	.text
1119  0291               _setTim1Freq:
1121  0291 520e          	subw	sp,#14
1122       0000000e      OFST:	set	14
1125                     ; 105 	int clkdivr = ((CLK->CKDIVR & 0x18) >> 3);
1127  0293 c650c6        	ld	a,20678
1128  0296 44            	srl	a
1129  0297 44            	srl	a
1130  0298 44            	srl	a
1131  0299 5f            	clrw	x
1132  029a a403          	and	a,#3
1133  029c 5f            	clrw	x
1134  029d 5f            	clrw	x
1135  029e 97            	ld	xl,a
1136  029f 1f09          	ldw	(OFST-5,sp),x
1138                     ; 107 	switch(clkdivr) {
1140  02a1 1e09          	ldw	x,(OFST-5,sp)
1142                     ; 112 		default: systemClkFreq = 2000000;break;
1143  02a3 5d            	tnzw	x
1144  02a4 2715          	jreq	L743
1145  02a6 5a            	decw	x
1146  02a7 271e          	jreq	L153
1147  02a9 5a            	decw	x
1148  02aa 2727          	jreq	L353
1149  02ac 5a            	decw	x
1150  02ad 2730          	jreq	L553
1151  02af               L753:
1154  02af ae8480        	ldw	x,#33920
1155  02b2 1f0d          	ldw	(OFST-1,sp),x
1156  02b4 ae001e        	ldw	x,#30
1157  02b7 1f0b          	ldw	(OFST-3,sp),x
1161  02b9 202e          	jra	L524
1162  02bb               L743:
1163                     ; 108 		case 0 : systemClkFreq = 16000000;break;
1165  02bb ae2400        	ldw	x,#9216
1166  02be 1f0d          	ldw	(OFST-1,sp),x
1167  02c0 ae00f4        	ldw	x,#244
1168  02c3 1f0b          	ldw	(OFST-3,sp),x
1172  02c5 2022          	jra	L524
1173  02c7               L153:
1174                     ; 109 		case 1 : systemClkFreq = 8000000;break;
1176  02c7 ae1200        	ldw	x,#4608
1177  02ca 1f0d          	ldw	(OFST-1,sp),x
1178  02cc ae007a        	ldw	x,#122
1179  02cf 1f0b          	ldw	(OFST-3,sp),x
1183  02d1 2016          	jra	L524
1184  02d3               L353:
1185                     ; 110 		case 2 : systemClkFreq = 4000000;break;
1187  02d3 ae0900        	ldw	x,#2304
1188  02d6 1f0d          	ldw	(OFST-1,sp),x
1189  02d8 ae003d        	ldw	x,#61
1190  02db 1f0b          	ldw	(OFST-3,sp),x
1194  02dd 200a          	jra	L524
1195  02df               L553:
1196                     ; 111 		case 3 : systemClkFreq = 2000000;break;
1198  02df ae8480        	ldw	x,#33920
1199  02e2 1f0d          	ldw	(OFST-1,sp),x
1200  02e4 ae001e        	ldw	x,#30
1201  02e7 1f0b          	ldw	(OFST-3,sp),x
1205  02e9               L524:
1206                     ; 114 	desiredTime = (1/(float)desiredFreq);
1208  02e9 96            	ldw	x,sp
1209  02ea 1c0011        	addw	x,#OFST+3
1210  02ed cd0000        	call	c_ltor
1212  02f0 cd0000        	call	c_ultof
1214  02f3 96            	ldw	x,sp
1215  02f4 1c0001        	addw	x,#OFST-13
1216  02f7 cd0000        	call	c_rtol
1219  02fa a601          	ld	a,#1
1220  02fc cd0000        	call	c_ctof
1222  02ff 96            	ldw	x,sp
1223  0300 1c0001        	addw	x,#OFST-13
1224  0303 cd0000        	call	c_fdiv
1226  0306 96            	ldw	x,sp
1227  0307 1c0005        	addw	x,#OFST-9
1228  030a cd0000        	call	c_rtol
1231                     ; 115 	freqPeriod = (1/(float)systemClkFreq);
1233  030d 96            	ldw	x,sp
1234  030e 1c000b        	addw	x,#OFST-3
1235  0311 cd0000        	call	c_ltor
1237  0314 cd0000        	call	c_ultof
1239  0317 96            	ldw	x,sp
1240  0318 1c0001        	addw	x,#OFST-13
1241  031b cd0000        	call	c_rtol
1244  031e a601          	ld	a,#1
1245  0320 cd0000        	call	c_ctof
1247  0323 96            	ldw	x,sp
1248  0324 1c0001        	addw	x,#OFST-13
1249  0327 cd0000        	call	c_fdiv
1251  032a 96            	ldw	x,sp
1252  032b 1c000b        	addw	x,#OFST-3
1253  032e cd0000        	call	c_rtol
1256                     ; 116 	setTim1OCPeriod(desiredTime, dutyCycle, freqPeriod);
1258  0331 1e0d          	ldw	x,(OFST-1,sp)
1259  0333 89            	pushw	x
1260  0334 1e0d          	ldw	x,(OFST-1,sp)
1261  0336 89            	pushw	x
1262  0337 1e1b          	ldw	x,(OFST+13,sp)
1263  0339 89            	pushw	x
1264  033a 1e1b          	ldw	x,(OFST+13,sp)
1265  033c 89            	pushw	x
1266  033d 1e0f          	ldw	x,(OFST+1,sp)
1267  033f 89            	pushw	x
1268  0340 1e0f          	ldw	x,(OFST+1,sp)
1269  0342 89            	pushw	x
1270  0343 cd0212        	call	_setTim1OCPeriod
1272  0346 5b0c          	addw	sp,#12
1273                     ; 117 }
1276  0348 5b0e          	addw	sp,#14
1277  034a 81            	ret
1321                     	switch	.const
1322  0004               L23:
1323  0004 00000003      	dc.l	3
1324  0008               L43:
1325  0008 00000005      	dc.l	5
1326                     ; 119 void tim1InitOC(uint32_t channel, uint32_t mode) {
1327                     	switch	.text
1328  034b               _tim1InitOC:
1330       00000000      OFST:	set	0
1333                     ; 120 	TIM1_ENABLE_CLK_GATING();
1335  034b 358050c7      	mov	20679,#128
1336                     ; 121 	tim1OCSetMode(channel, mode);
1338  034f 1e09          	ldw	x,(OFST+9,sp)
1339  0351 89            	pushw	x
1340  0352 1e09          	ldw	x,(OFST+9,sp)
1341  0354 89            	pushw	x
1342  0355 1e09          	ldw	x,(OFST+9,sp)
1343  0357 89            	pushw	x
1344  0358 1e09          	ldw	x,(OFST+9,sp)
1345  035a 89            	pushw	x
1346  035b cd01d6        	call	_tim1OCSetMode
1348  035e 5b08          	addw	sp,#8
1349                     ; 123 	if(channel > 2 && channel < 5)
1351  0360 96            	ldw	x,sp
1352  0361 1c0003        	addw	x,#OFST+3
1353  0364 cd0000        	call	c_ltor
1355  0367 ae0004        	ldw	x,#L23
1356  036a cd0000        	call	c_lcmp
1358  036d 2529          	jrult	L154
1360  036f 96            	ldw	x,sp
1361  0370 1c0003        	addw	x,#OFST+3
1362  0373 cd0000        	call	c_ltor
1364  0376 ae0008        	ldw	x,#L43
1365  0379 cd0000        	call	c_lcmp
1367  037c 241a          	jruge	L154
1368                     ; 124 		TIM1->CCER2 |= (5 << (((channel) - 3) *4));
1370  037e 7b06          	ld	a,(OFST+6,sp)
1371  0380 48            	sll	a
1372  0381 48            	sll	a
1373  0382 5f            	clrw	x
1374  0383 97            	ld	xl,a
1375  0384 1d000c        	subw	x,#12
1376  0387 a605          	ld	a,#5
1377  0389 5d            	tnzw	x
1378  038a 2704          	jreq	L63
1379  038c               L04:
1380  038c 48            	sll	a
1381  038d 5a            	decw	x
1382  038e 26fc          	jrne	L04
1383  0390               L63:
1384  0390 ca525d        	or	a,21085
1385  0393 c7525d        	ld	21085,a
1387  0396 2030          	jra	L354
1388  0398               L154:
1389                     ; 126 	else if(channel > 0 && channel < 3)
1391  0398 96            	ldw	x,sp
1392  0399 1c0003        	addw	x,#OFST+3
1393  039c cd0000        	call	c_lzmp
1395  039f 272c          	jreq	L554
1397  03a1 96            	ldw	x,sp
1398  03a2 1c0003        	addw	x,#OFST+3
1399  03a5 cd0000        	call	c_ltor
1401  03a8 ae0004        	ldw	x,#L23
1402  03ab cd0000        	call	c_lcmp
1404  03ae 241d          	jruge	L554
1405                     ; 127 		TIM1->CCER1 |= (5 << (((channel) - 1) *4));
1407  03b0 7b06          	ld	a,(OFST+6,sp)
1408  03b2 48            	sll	a
1409  03b3 48            	sll	a
1410  03b4 5f            	clrw	x
1411  03b5 97            	ld	xl,a
1412  03b6 1d0004        	subw	x,#4
1413  03b9 a605          	ld	a,#5
1414  03bb 5d            	tnzw	x
1415  03bc 2704          	jreq	L24
1416  03be               L44:
1417  03be 48            	sll	a
1418  03bf 5a            	decw	x
1419  03c0 26fc          	jrne	L44
1420  03c2               L24:
1421  03c2 ca525c        	or	a,21084
1422  03c5 c7525c        	ld	21084,a
1424  03c8               L354:
1425                     ; 131 	TIM1_MOE_ENABLE();
1427  03c8 721e526d      	bset	21101,#7
1428                     ; 132 }
1431  03cc 81            	ret
1432  03cd               L554:
1433                     ; 130 		return;
1436  03cd 81            	ret
1449                     	xdef	_tim1InitOC
1450                     	xdef	_tim1OCSetValue
1451                     	xdef	_tim1OCSetMode
1452                     	xdef	_tim1SetValues
1453                     	xdef	_setTim1OCPeriod
1454                     	xdef	_setTim1Freq
1455                     	xdef	_determineMinPsc
1456                     	xdef	_determineArr
1457                     	xdef	_determineOCValue
1458                     	switch	.const
1459  000c               L361:
1460  000c 40000000      	dc.w	16384,0
1461  0010               L151:
1462  0010 42c80000      	dc.w	17096,0
1463                     	xref.b	c_lreg
1464                     	xref.b	c_x
1484                     	xref	c_lzmp
1485                     	xref	c_ultof
1486                     	xref	c_ladd
1487                     	xref	c_lsbc
1488                     	xref	c_uitolx
1489                     	xref	c_fcmp
1490                     	xref	c_ctof
1491                     	xref	c_ftoi
1492                     	xref	c_lcmp
1493                     	xref	c_ftol
1494                     	xref	c_fdiv
1495                     	xref	c_fmul
1496                     	xref	c_rtol
1497                     	xref	c_uitof
1498                     	xref	c_ltor
1499                     	end
