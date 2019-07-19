   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  72                     ; 9 void setTim1Deadtime(float deadtime) {
  74                     	switch	.text
  75  0000               _setTim1Deadtime:
  77  0000 5208          	subw	sp,#8
  78       00000008      OFST:	set	8
  81                     ; 10 	uint32_t systemClkFreq = getMasterClkFreq();
  83  0002 cd03e5        	call	_getMasterClkFreq
  85  0005 96            	ldw	x,sp
  86  0006 1c0005        	addw	x,#OFST-3
  87  0009 cd0000        	call	c_rtol
  90                     ; 11 	float steps = (1/(float)systemClkFreq);
  92  000c 96            	ldw	x,sp
  93  000d 1c0005        	addw	x,#OFST-3
  94  0010 cd0000        	call	c_ltor
  96  0013 cd0000        	call	c_ultof
  98  0016 96            	ldw	x,sp
  99  0017 1c0001        	addw	x,#OFST-7
 100  001a cd0000        	call	c_rtol
 103  001d a601          	ld	a,#1
 104  001f cd0000        	call	c_ctof
 106  0022 96            	ldw	x,sp
 107  0023 1c0001        	addw	x,#OFST-7
 108  0026 cd0000        	call	c_fdiv
 110  0029 96            	ldw	x,sp
 111  002a 1c0005        	addw	x,#OFST-3
 112  002d cd0000        	call	c_rtol
 115                     ; 12 	deadtime *= 0.000000001;
 117  0030 ae0018        	ldw	x,#L34
 118  0033 cd0000        	call	c_ltor
 120  0036 96            	ldw	x,sp
 121  0037 1c000b        	addw	x,#OFST+3
 122  003a cd0000        	call	c_fgmul
 124                     ; 14 	if(deadtime > (steps * 127)) {
 126  003d 9c            	rvf
 127  003e 96            	ldw	x,sp
 128  003f 1c0005        	addw	x,#OFST-3
 129  0042 cd0000        	call	c_ltor
 131  0045 ae0014        	ldw	x,#L55
 132  0048 cd0000        	call	c_fmul
 134  004b 96            	ldw	x,sp
 135  004c 1c000b        	addw	x,#OFST+3
 136  004f cd0000        	call	c_fcmp
 138  0052 2e0c          	jrsge	L74
 139                     ; 15 	steps+=1;
 141  0054 a601          	ld	a,#1
 142  0056 cd0000        	call	c_ctof
 144  0059 96            	ldw	x,sp
 145  005a 1c0005        	addw	x,#OFST-3
 146  005d cd0000        	call	c_fgadd
 149  0060               L74:
 150                     ; 18 }
 153  0060 5b08          	addw	sp,#8
 154  0062 81            	ret
 224                     .const:	section	.text
 225  0000               L01:
 226  0000 00010001      	dc.l	65537
 227                     ; 20 uint16_t determineMinPsc(float desiredTime, float freqPeriod) {
 228                     	switch	.text
 229  0063               _determineMinPsc:
 231  0063 520a          	subw	sp,#10
 232       0000000a      OFST:	set	10
 235                     ; 22 	uint16_t psc = 1;
 237  0065 ae0001        	ldw	x,#1
 238  0068 1f05          	ldw	(OFST-5,sp),x
 240                     ; 23 	float temp = 0;
 242  006a               L711:
 243                     ; 26 		temp = freqPeriod * psc;
 245  006a 1e05          	ldw	x,(OFST-5,sp)
 246  006c cd0000        	call	c_uitof
 248  006f 96            	ldw	x,sp
 249  0070 1c0001        	addw	x,#OFST-9
 250  0073 cd0000        	call	c_rtol
 253  0076 96            	ldw	x,sp
 254  0077 1c0011        	addw	x,#OFST+7
 255  007a cd0000        	call	c_ltor
 257  007d 96            	ldw	x,sp
 258  007e 1c0001        	addw	x,#OFST-9
 259  0081 cd0000        	call	c_fmul
 261  0084 96            	ldw	x,sp
 262  0085 1c0007        	addw	x,#OFST-3
 263  0088 cd0000        	call	c_rtol
 266                     ; 27 		ticks = (desiredTime/temp);
 268  008b 96            	ldw	x,sp
 269  008c 1c000d        	addw	x,#OFST+3
 270  008f cd0000        	call	c_ltor
 272  0092 96            	ldw	x,sp
 273  0093 1c0007        	addw	x,#OFST-3
 274  0096 cd0000        	call	c_fdiv
 276  0099 cd0000        	call	c_ftol
 278  009c 96            	ldw	x,sp
 279  009d 1c0007        	addw	x,#OFST-3
 280  00a0 cd0000        	call	c_rtol
 283                     ; 28 		if(ticks > 65536)
 285  00a3 9c            	rvf
 286  00a4 96            	ldw	x,sp
 287  00a5 1c0007        	addw	x,#OFST-3
 288  00a8 cd0000        	call	c_ltor
 290  00ab ae0000        	ldw	x,#L01
 291  00ae cd0000        	call	c_lcmp
 293  00b1 2f07          	jrslt	L121
 294                     ; 29 			psc++;
 296  00b3 1e05          	ldw	x,(OFST-5,sp)
 297  00b5 1c0001        	addw	x,#1
 298  00b8 1f05          	ldw	(OFST-5,sp),x
 300  00ba               L121:
 301                     ; 30 	}while(ticks > 65536);
 303  00ba 9c            	rvf
 304  00bb 96            	ldw	x,sp
 305  00bc 1c0007        	addw	x,#OFST-3
 306  00bf cd0000        	call	c_ltor
 308  00c2 ae0000        	ldw	x,#L01
 309  00c5 cd0000        	call	c_lcmp
 311  00c8 2ea0          	jrsge	L711
 312                     ; 32 	return psc;
 314  00ca 1e05          	ldw	x,(OFST-5,sp)
 317  00cc 5b0a          	addw	sp,#10
 318  00ce 81            	ret
 379                     ; 35 uint16_t determineArr(float desiredTime, float freqPeriod,  uint16_t psc) {
 380                     	switch	.text
 381  00cf               _determineArr:
 383  00cf 520a          	subw	sp,#10
 384       0000000a      OFST:	set	10
 387                     ; 38 	arr = (uint16_t)(desiredTime/(freqPeriod*psc));
 389  00d1 1e15          	ldw	x,(OFST+11,sp)
 390  00d3 cd0000        	call	c_uitof
 392  00d6 96            	ldw	x,sp
 393  00d7 1c0005        	addw	x,#OFST-5
 394  00da cd0000        	call	c_rtol
 397  00dd 96            	ldw	x,sp
 398  00de 1c0011        	addw	x,#OFST+7
 399  00e1 cd0000        	call	c_ltor
 401  00e4 96            	ldw	x,sp
 402  00e5 1c0005        	addw	x,#OFST-5
 403  00e8 cd0000        	call	c_fmul
 405  00eb 96            	ldw	x,sp
 406  00ec 1c0001        	addw	x,#OFST-9
 407  00ef cd0000        	call	c_rtol
 410  00f2 96            	ldw	x,sp
 411  00f3 1c000d        	addw	x,#OFST+3
 412  00f6 cd0000        	call	c_ltor
 414  00f9 96            	ldw	x,sp
 415  00fa 1c0001        	addw	x,#OFST-9
 416  00fd cd0000        	call	c_fdiv
 418  0100 cd0000        	call	c_ftoi
 420  0103 1f09          	ldw	(OFST-1,sp),x
 422                     ; 39 	return arr;
 424  0105 1e09          	ldw	x,(OFST-1,sp)
 427  0107 5b0a          	addw	sp,#10
 428  0109 81            	ret
 480                     ; 42 uint16_t determineOCValue(float arr, double dutyCycle) {
 481                     	switch	.text
 482  010a               _determineOCValue:
 484  010a 5206          	subw	sp,#6
 485       00000006      OFST:	set	6
 488                     ; 45 	if(dutyCycle < 1 && dutyCycle > 0) {
 490  010c 9c            	rvf
 491  010d a601          	ld	a,#1
 492  010f cd0000        	call	c_ctof
 494  0112 96            	ldw	x,sp
 495  0113 1c0001        	addw	x,#OFST-5
 496  0116 cd0000        	call	c_rtol
 499  0119 96            	ldw	x,sp
 500  011a 1c000d        	addw	x,#OFST+7
 501  011d cd0000        	call	c_ltor
 503  0120 96            	ldw	x,sp
 504  0121 1c0001        	addw	x,#OFST-5
 505  0124 cd0000        	call	c_fcmp
 507  0127 2e1d          	jrsge	L702
 509  0129 9c            	rvf
 510  012a 9c            	rvf
 511  012b 0d0d          	tnz	(OFST+7,sp)
 512  012d 2d17          	jrsle	L702
 513                     ; 46 		OCValue = (uint16_t)(arr * dutyCycle);
 515  012f 96            	ldw	x,sp
 516  0130 1c0009        	addw	x,#OFST+3
 517  0133 cd0000        	call	c_ltor
 519  0136 96            	ldw	x,sp
 520  0137 1c000d        	addw	x,#OFST+7
 521  013a cd0000        	call	c_fmul
 523  013d cd0000        	call	c_ftoi
 525  0140 1f05          	ldw	(OFST-1,sp),x
 527                     ; 47 		return OCValue;
 529  0142 1e05          	ldw	x,(OFST-1,sp)
 531  0144 203e          	jra	L61
 532  0146               L702:
 533                     ; 50 	else if(dutyCycle < 100 && dutyCycle > 0) {
 535  0146 9c            	rvf
 536  0147 a664          	ld	a,#100
 537  0149 cd0000        	call	c_ctof
 539  014c 96            	ldw	x,sp
 540  014d 1c0001        	addw	x,#OFST-5
 541  0150 cd0000        	call	c_rtol
 544  0153 96            	ldw	x,sp
 545  0154 1c000d        	addw	x,#OFST+7
 546  0157 cd0000        	call	c_ltor
 548  015a 96            	ldw	x,sp
 549  015b 1c0001        	addw	x,#OFST-5
 550  015e cd0000        	call	c_fcmp
 552  0161 2e24          	jrsge	L312
 554  0163 9c            	rvf
 555  0164 9c            	rvf
 556  0165 0d0d          	tnz	(OFST+7,sp)
 557  0167 2d1e          	jrsle	L312
 558                     ; 51 		OCValue = (uint16_t)(arr * (dutyCycle / 100));
 560  0169 96            	ldw	x,sp
 561  016a 1c000d        	addw	x,#OFST+7
 562  016d cd0000        	call	c_ltor
 564  0170 ae0010        	ldw	x,#L122
 565  0173 cd0000        	call	c_fdiv
 567  0176 96            	ldw	x,sp
 568  0177 1c0009        	addw	x,#OFST+3
 569  017a cd0000        	call	c_fmul
 571  017d cd0000        	call	c_ftoi
 573  0180 1f05          	ldw	(OFST-1,sp),x
 575                     ; 52 		return OCValue;
 577  0182 1e05          	ldw	x,(OFST-1,sp)
 579  0184               L61:
 581  0184 5b06          	addw	sp,#6
 582  0186 81            	ret
 583  0187               L312:
 584                     ; 56 		return arr/2;
 586  0187 96            	ldw	x,sp
 587  0188 1c0009        	addw	x,#OFST+3
 588  018b cd0000        	call	c_ltor
 590  018e ae000c        	ldw	x,#L332
 591  0191 cd0000        	call	c_fdiv
 593  0194 cd0000        	call	c_ftoi
 596  0197 20eb          	jra	L61
 678                     ; 59 void tim1SetValues(uint16_t arr, uint16_t psc, uint16_t cnt) {
 679                     	switch	.text
 680  0199               _tim1SetValues:
 682  0199 89            	pushw	x
 683  019a 5206          	subw	sp,#6
 684       00000006      OFST:	set	6
 687                     ; 60 	IoRegister *tim_arr = &TIM1->ARRH;
 689  019c ae5262        	ldw	x,#21090
 690  019f 1f01          	ldw	(OFST-5,sp),x
 692                     ; 61 	IoRegister *tim_psc = &TIM1->PSCRH;
 694  01a1 ae5260        	ldw	x,#21088
 695  01a4 1f03          	ldw	(OFST-3,sp),x
 697                     ; 62 	IoRegister *tim_cnt = &TIM1->CNTRH;
 699  01a6 ae525e        	ldw	x,#21086
 700  01a9 1f05          	ldw	(OFST-1,sp),x
 702                     ; 64 	psc -= 1;
 704  01ab 1e0b          	ldw	x,(OFST+5,sp)
 705  01ad 1d0001        	subw	x,#1
 706  01b0 1f0b          	ldw	(OFST+5,sp),x
 707                     ; 66 	*tim_arr = ((0xff00 & arr) >> 8);
 709  01b2 7b07          	ld	a,(OFST+1,sp)
 710  01b4 c75262        	ld	21090,a
 711                     ; 67 	*tim_psc = ((0xff00 & psc) >> 8);
 713  01b7 7b0b          	ld	a,(OFST+5,sp)
 714  01b9 c75260        	ld	21088,a
 715                     ; 68 	*tim_cnt = ((0xff00 & cnt) >> 8);
 717  01bc 7b0d          	ld	a,(OFST+7,sp)
 718  01be c7525e        	ld	21086,a
 719                     ; 69 	tim_arr++;
 721  01c1 1e01          	ldw	x,(OFST-5,sp)
 722  01c3 1c0001        	addw	x,#1
 723  01c6 1f01          	ldw	(OFST-5,sp),x
 725                     ; 70 	tim_psc++;
 727  01c8 1e03          	ldw	x,(OFST-3,sp)
 728  01ca 1c0001        	addw	x,#1
 729  01cd 1f03          	ldw	(OFST-3,sp),x
 731                     ; 71 	tim_cnt++;
 733  01cf 1e05          	ldw	x,(OFST-1,sp)
 734  01d1 1c0001        	addw	x,#1
 735  01d4 1f05          	ldw	(OFST-1,sp),x
 737                     ; 72 	*tim_arr = (0x00ff & arr);
 739  01d6 7b08          	ld	a,(OFST+2,sp)
 740  01d8 a4ff          	and	a,#255
 741  01da 1e01          	ldw	x,(OFST-5,sp)
 742  01dc f7            	ld	(x),a
 743                     ; 73 	*tim_psc = (0x00ff & psc);
 745  01dd 7b0c          	ld	a,(OFST+6,sp)
 746  01df a4ff          	and	a,#255
 747  01e1 1e03          	ldw	x,(OFST-3,sp)
 748  01e3 f7            	ld	(x),a
 749                     ; 74 	*tim_cnt = (0x00ff & cnt);
 751  01e4 7b0e          	ld	a,(OFST+8,sp)
 752  01e6 a4ff          	and	a,#255
 753  01e8 1e05          	ldw	x,(OFST-1,sp)
 754  01ea f7            	ld	(x),a
 755                     ; 75 }
 758  01eb 5b08          	addw	sp,#8
 759  01ed 81            	ret
 812                     ; 77 void tim1OCSetValue(uint32_t channel, uint16_t compareValue) {
 813                     	switch	.text
 814  01ee               _tim1OCSetValue:
 816  01ee 5206          	subw	sp,#6
 817       00000006      OFST:	set	6
 820                     ; 78 	IoRegister *ccr = &TIM1->CCR1H;
 822  01f0 ae5265        	ldw	x,#21093
 823  01f3 1f05          	ldw	(OFST-1,sp),x
 825                     ; 80 	ccr += ((channel - 1) * 2);
 827  01f5 96            	ldw	x,sp
 828  01f6 1c0009        	addw	x,#OFST+3
 829  01f9 cd0000        	call	c_ltor
 831  01fc 3803          	sll	c_lreg+3
 832  01fe 3902          	rlc	c_lreg+2
 833  0200 3901          	rlc	c_lreg+1
 834  0202 3900          	rlc	c_lreg
 835  0204 a602          	ld	a,#2
 836  0206 cd0000        	call	c_lsbc
 838  0209 96            	ldw	x,sp
 839  020a 1c0001        	addw	x,#OFST-5
 840  020d cd0000        	call	c_rtol
 843  0210 1e05          	ldw	x,(OFST-1,sp)
 844  0212 cd0000        	call	c_uitolx
 846  0215 96            	ldw	x,sp
 847  0216 1c0001        	addw	x,#OFST-5
 848  0219 cd0000        	call	c_ladd
 850  021c be02          	ldw	x,c_lreg+2
 851  021e 1f05          	ldw	(OFST-1,sp),x
 853                     ; 82 	*ccr &= 0x00;
 855  0220 1e05          	ldw	x,(OFST-1,sp)
 856  0222 7f            	clr	(x)
 857                     ; 83 	*ccr = ((0xff00 & compareValue) >> 8);
 859  0223 7b0d          	ld	a,(OFST+7,sp)
 860  0225 1e05          	ldw	x,(OFST-1,sp)
 861  0227 f7            	ld	(x),a
 862                     ; 84 	ccr++;
 864  0228 1e05          	ldw	x,(OFST-1,sp)
 865  022a 1c0001        	addw	x,#1
 866  022d 1f05          	ldw	(OFST-1,sp),x
 868                     ; 85 	*ccr = (0x00ff & compareValue);
 870  022f 7b0e          	ld	a,(OFST+8,sp)
 871  0231 a4ff          	and	a,#255
 872  0233 1e05          	ldw	x,(OFST-1,sp)
 873  0235 f7            	ld	(x),a
 874                     ; 86 }
 877  0236 5b06          	addw	sp,#6
 878  0238 81            	ret
 931                     ; 88 void tim1OCSetMode(uint32_t channel, uint32_t mode) {
 932                     	switch	.text
 933  0239               _tim1OCSetMode:
 935  0239 5206          	subw	sp,#6
 936       00000006      OFST:	set	6
 939                     ; 89 	IoRegister *ccmr = &TIM1->CCMR1;
 941  023b ae5258        	ldw	x,#21080
 942  023e 1f05          	ldw	(OFST-1,sp),x
 944                     ; 91 	ccmr += (channel - 1);
 946  0240 96            	ldw	x,sp
 947  0241 1c0009        	addw	x,#OFST+3
 948  0244 cd0000        	call	c_ltor
 950  0247 a601          	ld	a,#1
 951  0249 cd0000        	call	c_lsbc
 953  024c 96            	ldw	x,sp
 954  024d 1c0001        	addw	x,#OFST-5
 955  0250 cd0000        	call	c_rtol
 958  0253 1e05          	ldw	x,(OFST-1,sp)
 959  0255 cd0000        	call	c_uitolx
 961  0258 96            	ldw	x,sp
 962  0259 1c0001        	addw	x,#OFST-5
 963  025c cd0000        	call	c_ladd
 965  025f be02          	ldw	x,c_lreg+2
 966  0261 1f05          	ldw	(OFST-1,sp),x
 968                     ; 93 	*ccmr &= ~(1 << 4);
 970  0263 1e05          	ldw	x,(OFST-1,sp)
 971  0265 f6            	ld	a,(x)
 972  0266 a4ef          	and	a,#239
 973  0268 f7            	ld	(x),a
 974                     ; 94 	*ccmr |= (mode << 4);
 976  0269 1e05          	ldw	x,(OFST-1,sp)
 977  026b 7b10          	ld	a,(OFST+10,sp)
 978  026d 4e            	swap	a
 979  026e a4f0          	and	a,#240
 980  0270 fa            	or	a,(x)
 981  0271 f7            	ld	(x),a
 982                     ; 95 }
 985  0272 5b06          	addw	sp,#6
 986  0274 81            	ret
1070                     ; 97 void setTim1OCPeriod(float desiredTime, double dutyCycle, float freqPeriod) {
1071                     	switch	.text
1072  0275               _setTim1OCPeriod:
1074  0275 520c          	subw	sp,#12
1075       0000000c      OFST:	set	12
1078                     ; 100 	psc = determineMinPsc(desiredTime, freqPeriod);
1080  0277 1e19          	ldw	x,(OFST+13,sp)
1081  0279 89            	pushw	x
1082  027a 1e19          	ldw	x,(OFST+13,sp)
1083  027c 89            	pushw	x
1084  027d 1e15          	ldw	x,(OFST+9,sp)
1085  027f 89            	pushw	x
1086  0280 1e15          	ldw	x,(OFST+9,sp)
1087  0282 89            	pushw	x
1088  0283 cd0063        	call	_determineMinPsc
1090  0286 5b08          	addw	sp,#8
1091  0288 cd0000        	call	c_uitolx
1093  028b 96            	ldw	x,sp
1094  028c 1c0005        	addw	x,#OFST-7
1095  028f cd0000        	call	c_rtol
1098                     ; 101 	arr = determineArr(desiredTime, freqPeriod, psc);
1100  0292 1e07          	ldw	x,(OFST-5,sp)
1101  0294 89            	pushw	x
1102  0295 1e1b          	ldw	x,(OFST+15,sp)
1103  0297 89            	pushw	x
1104  0298 1e1b          	ldw	x,(OFST+15,sp)
1105  029a 89            	pushw	x
1106  029b 1e17          	ldw	x,(OFST+11,sp)
1107  029d 89            	pushw	x
1108  029e 1e17          	ldw	x,(OFST+11,sp)
1109  02a0 89            	pushw	x
1110  02a1 cd00cf        	call	_determineArr
1112  02a4 5b0a          	addw	sp,#10
1113  02a6 cd0000        	call	c_uitolx
1115  02a9 96            	ldw	x,sp
1116  02aa 1c0009        	addw	x,#OFST-3
1117  02ad cd0000        	call	c_rtol
1120                     ; 102 	ocValue = determineOCValue(arr, dutyCycle);
1122  02b0 1e15          	ldw	x,(OFST+9,sp)
1123  02b2 89            	pushw	x
1124  02b3 1e15          	ldw	x,(OFST+9,sp)
1125  02b5 89            	pushw	x
1126  02b6 96            	ldw	x,sp
1127  02b7 1c000d        	addw	x,#OFST+1
1128  02ba cd0000        	call	c_ltor
1130  02bd cd0000        	call	c_ultof
1132  02c0 be02          	ldw	x,c_lreg+2
1133  02c2 89            	pushw	x
1134  02c3 be00          	ldw	x,c_lreg
1135  02c5 89            	pushw	x
1136  02c6 cd010a        	call	_determineOCValue
1138  02c9 5b08          	addw	sp,#8
1139  02cb cd0000        	call	c_uitolx
1141  02ce 96            	ldw	x,sp
1142  02cf 1c0001        	addw	x,#OFST-11
1143  02d2 cd0000        	call	c_rtol
1146                     ; 104 	tim1SetValues(arr, psc, 0);
1148  02d5 5f            	clrw	x
1149  02d6 89            	pushw	x
1150  02d7 1e09          	ldw	x,(OFST-3,sp)
1151  02d9 89            	pushw	x
1152  02da 1e0f          	ldw	x,(OFST+3,sp)
1153  02dc cd0199        	call	_tim1SetValues
1155  02df 5b04          	addw	sp,#4
1156                     ; 105 	tim1OCSetValue(TIM_CH2, ocValue);
1158  02e1 1e03          	ldw	x,(OFST-9,sp)
1159  02e3 89            	pushw	x
1160  02e4 ae0002        	ldw	x,#2
1161  02e7 89            	pushw	x
1162  02e8 ae0000        	ldw	x,#0
1163  02eb 89            	pushw	x
1164  02ec cd01ee        	call	_tim1OCSetValue
1166  02ef 5b06          	addw	sp,#6
1167                     ; 106 }
1170  02f1 5b0c          	addw	sp,#12
1171  02f3 81            	ret
1243                     ; 108 void setTim1Freq(uint32_t desiredFreq, double dutyCycle) {
1244                     	switch	.text
1245  02f4               _setTim1Freq:
1247  02f4 520c          	subw	sp,#12
1248       0000000c      OFST:	set	12
1251                     ; 113 	systemClkFreq = getMasterClkFreq();
1253  02f6 cd03e5        	call	_getMasterClkFreq
1255  02f9 96            	ldw	x,sp
1256  02fa 1c0009        	addw	x,#OFST-3
1257  02fd cd0000        	call	c_rtol
1260                     ; 114 	desiredTime = (1/(float)desiredFreq);
1262  0300 96            	ldw	x,sp
1263  0301 1c000f        	addw	x,#OFST+3
1264  0304 cd0000        	call	c_ltor
1266  0307 cd0000        	call	c_ultof
1268  030a 96            	ldw	x,sp
1269  030b 1c0001        	addw	x,#OFST-11
1270  030e cd0000        	call	c_rtol
1273  0311 a601          	ld	a,#1
1274  0313 cd0000        	call	c_ctof
1276  0316 96            	ldw	x,sp
1277  0317 1c0001        	addw	x,#OFST-11
1278  031a cd0000        	call	c_fdiv
1280  031d 96            	ldw	x,sp
1281  031e 1c0005        	addw	x,#OFST-7
1282  0321 cd0000        	call	c_rtol
1285                     ; 115 	freqPeriod = (1/(float)systemClkFreq);
1287  0324 96            	ldw	x,sp
1288  0325 1c0009        	addw	x,#OFST-3
1289  0328 cd0000        	call	c_ltor
1291  032b cd0000        	call	c_ultof
1293  032e 96            	ldw	x,sp
1294  032f 1c0001        	addw	x,#OFST-11
1295  0332 cd0000        	call	c_rtol
1298  0335 a601          	ld	a,#1
1299  0337 cd0000        	call	c_ctof
1301  033a 96            	ldw	x,sp
1302  033b 1c0001        	addw	x,#OFST-11
1303  033e cd0000        	call	c_fdiv
1305  0341 96            	ldw	x,sp
1306  0342 1c0009        	addw	x,#OFST-3
1307  0345 cd0000        	call	c_rtol
1310                     ; 116 	setTim1OCPeriod(desiredTime, dutyCycle, freqPeriod);
1312  0348 1e0b          	ldw	x,(OFST-1,sp)
1313  034a 89            	pushw	x
1314  034b 1e0b          	ldw	x,(OFST-1,sp)
1315  034d 89            	pushw	x
1316  034e 1e19          	ldw	x,(OFST+13,sp)
1317  0350 89            	pushw	x
1318  0351 1e19          	ldw	x,(OFST+13,sp)
1319  0353 89            	pushw	x
1320  0354 1e0f          	ldw	x,(OFST+3,sp)
1321  0356 89            	pushw	x
1322  0357 1e0f          	ldw	x,(OFST+3,sp)
1323  0359 89            	pushw	x
1324  035a cd0275        	call	_setTim1OCPeriod
1326  035d 5b0c          	addw	sp,#12
1327                     ; 117 }
1330  035f 5b0c          	addw	sp,#12
1331  0361 81            	ret
1375                     	switch	.const
1376  0004               L43:
1377  0004 00000003      	dc.l	3
1378  0008               L63:
1379  0008 00000005      	dc.l	5
1380                     ; 119 void tim1InitOC(uint32_t channel, uint32_t mode) {
1381                     	switch	.text
1382  0362               _tim1InitOC:
1384       00000000      OFST:	set	0
1387                     ; 120 	TIM1_ENABLE_CLK_GATING();
1389  0362 358050c7      	mov	20679,#128
1390                     ; 121 	tim1OCSetMode(channel, mode);
1392  0366 1e09          	ldw	x,(OFST+9,sp)
1393  0368 89            	pushw	x
1394  0369 1e09          	ldw	x,(OFST+9,sp)
1395  036b 89            	pushw	x
1396  036c 1e09          	ldw	x,(OFST+9,sp)
1397  036e 89            	pushw	x
1398  036f 1e09          	ldw	x,(OFST+9,sp)
1399  0371 89            	pushw	x
1400  0372 cd0239        	call	_tim1OCSetMode
1402  0375 5b08          	addw	sp,#8
1403                     ; 123 	if(channel > 2 && channel < 5)
1405  0377 96            	ldw	x,sp
1406  0378 1c0003        	addw	x,#OFST+3
1407  037b cd0000        	call	c_ltor
1409  037e ae0004        	ldw	x,#L43
1410  0381 cd0000        	call	c_lcmp
1412  0384 2529          	jrult	L774
1414  0386 96            	ldw	x,sp
1415  0387 1c0003        	addw	x,#OFST+3
1416  038a cd0000        	call	c_ltor
1418  038d ae0008        	ldw	x,#L63
1419  0390 cd0000        	call	c_lcmp
1421  0393 241a          	jruge	L774
1422                     ; 124 		TIM1->CCER2 |= (5 << (((channel) - 3) *4));
1424  0395 7b06          	ld	a,(OFST+6,sp)
1425  0397 48            	sll	a
1426  0398 48            	sll	a
1427  0399 5f            	clrw	x
1428  039a 97            	ld	xl,a
1429  039b 1d000c        	subw	x,#12
1430  039e a605          	ld	a,#5
1431  03a0 5d            	tnzw	x
1432  03a1 2704          	jreq	L04
1433  03a3               L24:
1434  03a3 48            	sll	a
1435  03a4 5a            	decw	x
1436  03a5 26fc          	jrne	L24
1437  03a7               L04:
1438  03a7 ca525d        	or	a,21085
1439  03aa c7525d        	ld	21085,a
1441  03ad 2030          	jra	L105
1442  03af               L774:
1443                     ; 126 	else if(channel > 0 && channel < 3)
1445  03af 96            	ldw	x,sp
1446  03b0 1c0003        	addw	x,#OFST+3
1447  03b3 cd0000        	call	c_lzmp
1449  03b6 272c          	jreq	L305
1451  03b8 96            	ldw	x,sp
1452  03b9 1c0003        	addw	x,#OFST+3
1453  03bc cd0000        	call	c_ltor
1455  03bf ae0004        	ldw	x,#L43
1456  03c2 cd0000        	call	c_lcmp
1458  03c5 241d          	jruge	L305
1459                     ; 127 		TIM1->CCER1 |= (5 << (((channel) - 1) *4));
1461  03c7 7b06          	ld	a,(OFST+6,sp)
1462  03c9 48            	sll	a
1463  03ca 48            	sll	a
1464  03cb 5f            	clrw	x
1465  03cc 97            	ld	xl,a
1466  03cd 1d0004        	subw	x,#4
1467  03d0 a605          	ld	a,#5
1468  03d2 5d            	tnzw	x
1469  03d3 2704          	jreq	L44
1470  03d5               L64:
1471  03d5 48            	sll	a
1472  03d6 5a            	decw	x
1473  03d7 26fc          	jrne	L64
1474  03d9               L44:
1475  03d9 ca525c        	or	a,21084
1476  03dc c7525c        	ld	21084,a
1478  03df               L105:
1479                     ; 131 	TIM1_MOE_ENABLE();
1481  03df 721e526d      	bset	21101,#7
1482                     ; 132 }
1485  03e3 81            	ret
1486  03e4               L305:
1487                     ; 130 		return;
1490  03e4 81            	ret
1533                     ; 134 uint32_t getMasterClkFreq(void) {
1534                     	switch	.text
1535  03e5               _getMasterClkFreq:
1537  03e5 5206          	subw	sp,#6
1538       00000006      OFST:	set	6
1541                     ; 136 	int clkdivr = ((CLK->CKDIVR & 0x18) >> 3);
1543  03e7 c650c6        	ld	a,20678
1544  03ea 44            	srl	a
1545  03eb 44            	srl	a
1546  03ec 44            	srl	a
1547  03ed 5f            	clrw	x
1548  03ee a403          	and	a,#3
1549  03f0 5f            	clrw	x
1550  03f1 5f            	clrw	x
1551  03f2 97            	ld	xl,a
1552  03f3 1f01          	ldw	(OFST-5,sp),x
1554                     ; 138 	switch(clkdivr) {
1556  03f5 1e01          	ldw	x,(OFST-5,sp)
1558                     ; 143 		default: systemClkFreq = 2000000;break;
1559  03f7 5d            	tnzw	x
1560  03f8 2715          	jreq	L705
1561  03fa 5a            	decw	x
1562  03fb 271e          	jreq	L115
1563  03fd 5a            	decw	x
1564  03fe 2727          	jreq	L315
1565  0400 5a            	decw	x
1566  0401 2730          	jreq	L515
1567  0403               L715:
1570  0403 ae8480        	ldw	x,#33920
1571  0406 1f05          	ldw	(OFST-1,sp),x
1572  0408 ae001e        	ldw	x,#30
1573  040b 1f03          	ldw	(OFST-3,sp),x
1577  040d 202e          	jra	L545
1578  040f               L705:
1579                     ; 139 		case 0 : systemClkFreq = 16000000;break;
1581  040f ae2400        	ldw	x,#9216
1582  0412 1f05          	ldw	(OFST-1,sp),x
1583  0414 ae00f4        	ldw	x,#244
1584  0417 1f03          	ldw	(OFST-3,sp),x
1588  0419 2022          	jra	L545
1589  041b               L115:
1590                     ; 140 		case 1 : systemClkFreq = 8000000;break;
1592  041b ae1200        	ldw	x,#4608
1593  041e 1f05          	ldw	(OFST-1,sp),x
1594  0420 ae007a        	ldw	x,#122
1595  0423 1f03          	ldw	(OFST-3,sp),x
1599  0425 2016          	jra	L545
1600  0427               L315:
1601                     ; 141 		case 2 : systemClkFreq = 4000000;break;
1603  0427 ae0900        	ldw	x,#2304
1604  042a 1f05          	ldw	(OFST-1,sp),x
1605  042c ae003d        	ldw	x,#61
1606  042f 1f03          	ldw	(OFST-3,sp),x
1610  0431 200a          	jra	L545
1611  0433               L515:
1612                     ; 142 		case 3 : systemClkFreq = 2000000;break;
1614  0433 ae8480        	ldw	x,#33920
1615  0436 1f05          	ldw	(OFST-1,sp),x
1616  0438 ae001e        	ldw	x,#30
1617  043b 1f03          	ldw	(OFST-3,sp),x
1621  043d               L545:
1622                     ; 146 	return systemClkFreq;
1624  043d 96            	ldw	x,sp
1625  043e 1c0003        	addw	x,#OFST-3
1626  0441 cd0000        	call	c_ltor
1630  0444 5b06          	addw	sp,#6
1631  0446 81            	ret
1644                     	xdef	_tim1InitOC
1645                     	xdef	_tim1OCSetValue
1646                     	xdef	_tim1OCSetMode
1647                     	xdef	_tim1SetValues
1648                     	xdef	_setTim1OCPeriod
1649                     	xdef	_setTim1Freq
1650                     	xdef	_determineMinPsc
1651                     	xdef	_determineArr
1652                     	xdef	_determineOCValue
1653                     	xdef	_getMasterClkFreq
1654                     	xdef	_setTim1Deadtime
1655                     	switch	.const
1656  000c               L332:
1657  000c 40000000      	dc.w	16384,0
1658  0010               L122:
1659  0010 42c80000      	dc.w	17096,0
1660  0014               L55:
1661  0014 42fe0000      	dc.w	17150,0
1662  0018               L34:
1663  0018 3089705f      	dc.w	12425,28767
1664                     	xref.b	c_lreg
1665                     	xref.b	c_x
1685                     	xref	c_lzmp
1686                     	xref	c_ladd
1687                     	xref	c_lsbc
1688                     	xref	c_uitolx
1689                     	xref	c_ftoi
1690                     	xref	c_lcmp
1691                     	xref	c_ftol
1692                     	xref	c_uitof
1693                     	xref	c_fgadd
1694                     	xref	c_fcmp
1695                     	xref	c_fmul
1696                     	xref	c_fgmul
1697                     	xref	c_fdiv
1698                     	xref	c_ultof
1699                     	xref	c_ltor
1700                     	xref	c_ctof
1701                     	xref	c_rtol
1702                     	end
