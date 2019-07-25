   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  81                     ; 10 void setTim1Deadtime(uint32_t deadtime) {
  83                     	switch	.text
  84  0000               _setTim1Deadtime:
  86  0000 5210          	subw	sp,#16
  87       00000010      OFST:	set	16
  90                     ; 11 	uint32_t systemClkFreq = getMasterClkFreq();
  92  0002 cd05ef        	call	_getMasterClkFreq
  94  0005 96            	ldw	x,sp
  95  0006 1c0009        	addw	x,#OFST-7
  96  0009 cd0000        	call	c_rtol
  99                     ; 13 	uint32_t steps = (((1/(double)systemClkFreq)*1000000000) + 1);
 101  000c 96            	ldw	x,sp
 102  000d 1c0009        	addw	x,#OFST-7
 103  0010 cd0000        	call	c_ltor
 105  0013 cd0000        	call	c_ultof
 107  0016 96            	ldw	x,sp
 108  0017 1c0005        	addw	x,#OFST-11
 109  001a cd0000        	call	c_rtol
 112  001d a601          	ld	a,#1
 113  001f cd0000        	call	c_ctof
 115  0022 96            	ldw	x,sp
 116  0023 1c0005        	addw	x,#OFST-11
 117  0026 cd0000        	call	c_fdiv
 119  0029 ae0018        	ldw	x,#L74
 120  002c cd0000        	call	c_fmul
 122  002f ae0014        	ldw	x,#L75
 123  0032 cd0000        	call	c_fadd
 125  0035 cd0000        	call	c_ftol
 127  0038 96            	ldw	x,sp
 128  0039 1c000d        	addw	x,#OFST-3
 129  003c cd0000        	call	c_rtol
 132                     ; 15 	TIM1->DTR &= 0x00;
 134  003f 725f526e      	clr	21102
 135                     ; 17 	if(deadtime <= (steps * 127)) {
 137  0043 96            	ldw	x,sp
 138  0044 1c000d        	addw	x,#OFST-3
 139  0047 cd0000        	call	c_ltor
 141  004a a67f          	ld	a,#127
 142  004c cd0000        	call	c_smul
 144  004f 96            	ldw	x,sp
 145  0050 1c0013        	addw	x,#OFST+3
 146  0053 cd0000        	call	c_lcmp
 148  0056 2548          	jrult	L36
 149                     ; 18 		if(deadtime < steps)
 151  0058 96            	ldw	x,sp
 152  0059 1c0013        	addw	x,#OFST+3
 153  005c cd0000        	call	c_ltor
 155  005f 96            	ldw	x,sp
 156  0060 1c000d        	addw	x,#OFST-3
 157  0063 cd0000        	call	c_lcmp
 159  0066 2408          	jruge	L56
 160                     ; 19 			TIM1->DTR = 0x01;
 162  0068 3501526e      	mov	21102,#1
 164  006c ac6a026a      	jpf	L17
 165  0070               L56:
 166                     ; 21 			TIM1->DTR |= (deadtime/steps);			
 168  0070 96            	ldw	x,sp
 169  0071 1c0013        	addw	x,#OFST+3
 170  0074 cd0000        	call	c_ltor
 172  0077 96            	ldw	x,sp
 173  0078 1c000d        	addw	x,#OFST-3
 174  007b cd0000        	call	c_ludv
 176  007e 96            	ldw	x,sp
 177  007f 1c0005        	addw	x,#OFST-11
 178  0082 cd0000        	call	c_rtol
 181  0085 c6526e        	ld	a,21102
 182  0088 b703          	ld	c_lreg+3,a
 183  008a 3f02          	clr	c_lreg+2
 184  008c 3f01          	clr	c_lreg+1
 185  008e 3f00          	clr	c_lreg
 186  0090 96            	ldw	x,sp
 187  0091 1c0005        	addw	x,#OFST-11
 188  0094 cd0000        	call	c_lor
 190  0097 b603          	ld	a,c_lreg+3
 191  0099 c7526e        	ld	21102,a
 192  009c ac6a026a      	jpf	L17
 193  00a0               L36:
 194                     ; 24 	else if(deadtime <= (steps * 2 * 127)) {
 196  00a0 96            	ldw	x,sp
 197  00a1 1c000d        	addw	x,#OFST-3
 198  00a4 cd0000        	call	c_ltor
 200  00a7 3803          	sll	c_lreg+3
 201  00a9 3902          	rlc	c_lreg+2
 202  00ab 3901          	rlc	c_lreg+1
 203  00ad 3900          	rlc	c_lreg
 204  00af a67f          	ld	a,#127
 205  00b1 cd0000        	call	c_smul
 207  00b4 96            	ldw	x,sp
 208  00b5 1c0013        	addw	x,#OFST+3
 209  00b8 cd0000        	call	c_lcmp
 211  00bb 2402          	jruge	L21
 212  00bd 207a          	jp	L37
 213  00bf               L21:
 214                     ; 25 		min = 64 * 2 * steps;
 216  00bf 96            	ldw	x,sp
 217  00c0 1c000d        	addw	x,#OFST-3
 218  00c3 cd0000        	call	c_ltor
 220  00c6 a607          	ld	a,#7
 221  00c8 cd0000        	call	c_llsh
 223  00cb 96            	ldw	x,sp
 224  00cc 1c0009        	addw	x,#OFST-7
 225  00cf cd0000        	call	c_rtol
 228                     ; 26 		TIM1->DTR |= (1<<7);
 230  00d2 721e526e      	bset	21102,#7
 231                     ; 27 		if(deadtime < min)
 233  00d6 96            	ldw	x,sp
 234  00d7 1c0013        	addw	x,#OFST+3
 235  00da cd0000        	call	c_ltor
 237  00dd 96            	ldw	x,sp
 238  00de 1c0009        	addw	x,#OFST-7
 239  00e1 cd0000        	call	c_lcmp
 241  00e4 2408          	jruge	L57
 242                     ; 28 			TIM1->DTR = 0x80;
 244  00e6 3580526e      	mov	21102,#128
 246  00ea ac6a026a      	jpf	L17
 247  00ee               L57:
 248                     ; 30 			TIM1->DTR |= ((deadtime/(steps*2)) - 64);			
 250  00ee 96            	ldw	x,sp
 251  00ef 1c000d        	addw	x,#OFST-3
 252  00f2 cd0000        	call	c_ltor
 254  00f5 3803          	sll	c_lreg+3
 255  00f7 3902          	rlc	c_lreg+2
 256  00f9 3901          	rlc	c_lreg+1
 257  00fb 3900          	rlc	c_lreg
 258  00fd 96            	ldw	x,sp
 259  00fe 1c0005        	addw	x,#OFST-11
 260  0101 cd0000        	call	c_rtol
 263  0104 96            	ldw	x,sp
 264  0105 1c0013        	addw	x,#OFST+3
 265  0108 cd0000        	call	c_ltor
 267  010b 96            	ldw	x,sp
 268  010c 1c0005        	addw	x,#OFST-11
 269  010f cd0000        	call	c_ludv
 271  0112 a640          	ld	a,#64
 272  0114 cd0000        	call	c_lsbc
 274  0117 96            	ldw	x,sp
 275  0118 1c0001        	addw	x,#OFST-15
 276  011b cd0000        	call	c_rtol
 279  011e c6526e        	ld	a,21102
 280  0121 b703          	ld	c_lreg+3,a
 281  0123 3f02          	clr	c_lreg+2
 282  0125 3f01          	clr	c_lreg+1
 283  0127 3f00          	clr	c_lreg
 284  0129 96            	ldw	x,sp
 285  012a 1c0001        	addw	x,#OFST-15
 286  012d cd0000        	call	c_lor
 288  0130 b603          	ld	a,c_lreg+3
 289  0132 c7526e        	ld	21102,a
 290  0135 ac6a026a      	jpf	L17
 291  0139               L37:
 292                     ; 33 	else if(deadtime <= (steps * 8 * 63)) {
 294  0139 96            	ldw	x,sp
 295  013a 1c000d        	addw	x,#OFST-3
 296  013d cd0000        	call	c_ltor
 298  0140 a603          	ld	a,#3
 299  0142 cd0000        	call	c_llsh
 301  0145 a63f          	ld	a,#63
 302  0147 cd0000        	call	c_smul
 304  014a 96            	ldw	x,sp
 305  014b 1c0013        	addw	x,#OFST+3
 306  014e cd0000        	call	c_lcmp
 308  0151 2402          	jruge	L41
 309  0153 207b          	jp	L301
 310  0155               L41:
 311                     ; 34 		min = 32 * 8 * steps;
 313  0155 96            	ldw	x,sp
 314  0156 1c000d        	addw	x,#OFST-3
 315  0159 cd0000        	call	c_ltor
 317  015c a608          	ld	a,#8
 318  015e cd0000        	call	c_llsh
 320  0161 96            	ldw	x,sp
 321  0162 1c0009        	addw	x,#OFST-7
 322  0165 cd0000        	call	c_rtol
 325                     ; 35 		TIM1->DTR |= (3<<6);
 327  0168 c6526e        	ld	a,21102
 328  016b aac0          	or	a,#192
 329  016d c7526e        	ld	21102,a
 330                     ; 36 		if(deadtime < min)
 332  0170 96            	ldw	x,sp
 333  0171 1c0013        	addw	x,#OFST+3
 334  0174 cd0000        	call	c_ltor
 336  0177 96            	ldw	x,sp
 337  0178 1c0009        	addw	x,#OFST-7
 338  017b cd0000        	call	c_lcmp
 340  017e 2408          	jruge	L501
 341                     ; 37 			TIM1->DTR = 0xC0;
 343  0180 35c0526e      	mov	21102,#192
 345  0184 ac6a026a      	jpf	L17
 346  0188               L501:
 347                     ; 39 			TIM1->DTR |= ((deadtime/(steps*8)) - 32);			
 349  0188 96            	ldw	x,sp
 350  0189 1c000d        	addw	x,#OFST-3
 351  018c cd0000        	call	c_ltor
 353  018f a603          	ld	a,#3
 354  0191 cd0000        	call	c_llsh
 356  0194 96            	ldw	x,sp
 357  0195 1c0005        	addw	x,#OFST-11
 358  0198 cd0000        	call	c_rtol
 361  019b 96            	ldw	x,sp
 362  019c 1c0013        	addw	x,#OFST+3
 363  019f cd0000        	call	c_ltor
 365  01a2 96            	ldw	x,sp
 366  01a3 1c0005        	addw	x,#OFST-11
 367  01a6 cd0000        	call	c_ludv
 369  01a9 a620          	ld	a,#32
 370  01ab cd0000        	call	c_lsbc
 372  01ae 96            	ldw	x,sp
 373  01af 1c0001        	addw	x,#OFST-15
 374  01b2 cd0000        	call	c_rtol
 377  01b5 c6526e        	ld	a,21102
 378  01b8 b703          	ld	c_lreg+3,a
 379  01ba 3f02          	clr	c_lreg+2
 380  01bc 3f01          	clr	c_lreg+1
 381  01be 3f00          	clr	c_lreg
 382  01c0 96            	ldw	x,sp
 383  01c1 1c0001        	addw	x,#OFST-15
 384  01c4 cd0000        	call	c_lor
 386  01c7 b603          	ld	a,c_lreg+3
 387  01c9 c7526e        	ld	21102,a
 388  01cc ac6a026a      	jpf	L17
 389  01d0               L301:
 390                     ; 42 	else if(deadtime <= (steps * 16 * 63)) {
 392  01d0 96            	ldw	x,sp
 393  01d1 1c000d        	addw	x,#OFST-3
 394  01d4 cd0000        	call	c_ltor
 396  01d7 a604          	ld	a,#4
 397  01d9 cd0000        	call	c_llsh
 399  01dc a63f          	ld	a,#63
 400  01de cd0000        	call	c_smul
 402  01e1 96            	ldw	x,sp
 403  01e2 1c0013        	addw	x,#OFST+3
 404  01e5 cd0000        	call	c_lcmp
 406  01e8 255e          	jrult	L311
 407                     ; 43 		min = 32 * 16 * steps;
 409  01ea 96            	ldw	x,sp
 410  01eb 1c000d        	addw	x,#OFST-3
 411  01ee cd0000        	call	c_ltor
 413  01f1 a609          	ld	a,#9
 414  01f3 cd0000        	call	c_llsh
 416  01f6 96            	ldw	x,sp
 417  01f7 1c0009        	addw	x,#OFST-7
 418  01fa cd0000        	call	c_rtol
 421                     ; 44 		TIM1->DTR |= (7<<5);
 423  01fd c6526e        	ld	a,21102
 424  0200 aae0          	or	a,#224
 425  0202 c7526e        	ld	21102,a
 426                     ; 45 		if(deadtime < min)
 428  0205 96            	ldw	x,sp
 429  0206 1c0013        	addw	x,#OFST+3
 430  0209 cd0000        	call	c_ltor
 432  020c 96            	ldw	x,sp
 433  020d 1c0009        	addw	x,#OFST-7
 434  0210 cd0000        	call	c_lcmp
 436  0213 2406          	jruge	L511
 437                     ; 46 			TIM1->DTR = 0xE0;
 439  0215 35e0526e      	mov	21102,#224
 441  0219 204f          	jra	L17
 442  021b               L511:
 443                     ; 48 			TIM1->DTR |= ((int)(deadtime/(steps*16)) - 32);			
 445  021b 96            	ldw	x,sp
 446  021c 1c000d        	addw	x,#OFST-3
 447  021f cd0000        	call	c_ltor
 449  0222 a604          	ld	a,#4
 450  0224 cd0000        	call	c_llsh
 452  0227 96            	ldw	x,sp
 453  0228 1c0005        	addw	x,#OFST-11
 454  022b cd0000        	call	c_rtol
 457  022e 96            	ldw	x,sp
 458  022f 1c0013        	addw	x,#OFST+3
 459  0232 cd0000        	call	c_ltor
 461  0235 96            	ldw	x,sp
 462  0236 1c0005        	addw	x,#OFST-11
 463  0239 cd0000        	call	c_ludv
 465  023c b603          	ld	a,c_lreg+3
 466  023e a020          	sub	a,#32
 467  0240 ca526e        	or	a,21102
 468  0243 c7526e        	ld	21102,a
 469  0246 2022          	jra	L17
 470  0248               L311:
 471                     ; 52 			TIM1->DTR = (deadtime <= (steps * 16 * 63));
 473  0248 96            	ldw	x,sp
 474  0249 1c000d        	addw	x,#OFST-3
 475  024c cd0000        	call	c_ltor
 477  024f a604          	ld	a,#4
 478  0251 cd0000        	call	c_llsh
 480  0254 a63f          	ld	a,#63
 481  0256 cd0000        	call	c_smul
 483  0259 96            	ldw	x,sp
 484  025a 1c0013        	addw	x,#OFST+3
 485  025d cd0000        	call	c_lcmp
 487  0260 2504          	jrult	L6
 488  0262 a601          	ld	a,#1
 489  0264 2001          	jra	L01
 490  0266               L6:
 491  0266 4f            	clr	a
 492  0267               L01:
 493  0267 c7526e        	ld	21102,a
 494  026a               L17:
 495                     ; 53 }
 498  026a 5b10          	addw	sp,#16
 499  026c 81            	ret
 569                     .const:	section	.text
 570  0000               L02:
 571  0000 00010001      	dc.l	65537
 572                     ; 55 uint16_t determineMinPsc(float desiredTime, float freqPeriod) {
 573                     	switch	.text
 574  026d               _determineMinPsc:
 576  026d 520a          	subw	sp,#10
 577       0000000a      OFST:	set	10
 580                     ; 57 	uint16_t psc = 1;
 582  026f ae0001        	ldw	x,#1
 583  0272 1f05          	ldw	(OFST-5,sp),x
 585                     ; 58 	float temp = 0;
 587  0274               L161:
 588                     ; 61 		temp = freqPeriod * psc;
 590  0274 1e05          	ldw	x,(OFST-5,sp)
 591  0276 cd0000        	call	c_uitof
 593  0279 96            	ldw	x,sp
 594  027a 1c0001        	addw	x,#OFST-9
 595  027d cd0000        	call	c_rtol
 598  0280 96            	ldw	x,sp
 599  0281 1c0011        	addw	x,#OFST+7
 600  0284 cd0000        	call	c_ltor
 602  0287 96            	ldw	x,sp
 603  0288 1c0001        	addw	x,#OFST-9
 604  028b cd0000        	call	c_fmul
 606  028e 96            	ldw	x,sp
 607  028f 1c0007        	addw	x,#OFST-3
 608  0292 cd0000        	call	c_rtol
 611                     ; 62 		ticks = (desiredTime/temp);
 613  0295 96            	ldw	x,sp
 614  0296 1c000d        	addw	x,#OFST+3
 615  0299 cd0000        	call	c_ltor
 617  029c 96            	ldw	x,sp
 618  029d 1c0007        	addw	x,#OFST-3
 619  02a0 cd0000        	call	c_fdiv
 621  02a3 cd0000        	call	c_ftol
 623  02a6 96            	ldw	x,sp
 624  02a7 1c0007        	addw	x,#OFST-3
 625  02aa cd0000        	call	c_rtol
 628                     ; 63 		if(ticks > 65536)
 630  02ad 9c            	rvf
 631  02ae 96            	ldw	x,sp
 632  02af 1c0007        	addw	x,#OFST-3
 633  02b2 cd0000        	call	c_ltor
 635  02b5 ae0000        	ldw	x,#L02
 636  02b8 cd0000        	call	c_lcmp
 638  02bb 2f07          	jrslt	L361
 639                     ; 64 			psc++;
 641  02bd 1e05          	ldw	x,(OFST-5,sp)
 642  02bf 1c0001        	addw	x,#1
 643  02c2 1f05          	ldw	(OFST-5,sp),x
 645  02c4               L361:
 646                     ; 65 	}while(ticks > 65536);
 648  02c4 9c            	rvf
 649  02c5 96            	ldw	x,sp
 650  02c6 1c0007        	addw	x,#OFST-3
 651  02c9 cd0000        	call	c_ltor
 653  02cc ae0000        	ldw	x,#L02
 654  02cf cd0000        	call	c_lcmp
 656  02d2 2ea0          	jrsge	L161
 657                     ; 67 	return psc;
 659  02d4 1e05          	ldw	x,(OFST-5,sp)
 662  02d6 5b0a          	addw	sp,#10
 663  02d8 81            	ret
 724                     ; 70 uint16_t determineArr(float desiredTime, float freqPeriod,  uint16_t psc) {
 725                     	switch	.text
 726  02d9               _determineArr:
 728  02d9 520a          	subw	sp,#10
 729       0000000a      OFST:	set	10
 732                     ; 73 	arr = (uint16_t)(desiredTime/(freqPeriod*psc));
 734  02db 1e15          	ldw	x,(OFST+11,sp)
 735  02dd cd0000        	call	c_uitof
 737  02e0 96            	ldw	x,sp
 738  02e1 1c0005        	addw	x,#OFST-5
 739  02e4 cd0000        	call	c_rtol
 742  02e7 96            	ldw	x,sp
 743  02e8 1c0011        	addw	x,#OFST+7
 744  02eb cd0000        	call	c_ltor
 746  02ee 96            	ldw	x,sp
 747  02ef 1c0005        	addw	x,#OFST-5
 748  02f2 cd0000        	call	c_fmul
 750  02f5 96            	ldw	x,sp
 751  02f6 1c0001        	addw	x,#OFST-9
 752  02f9 cd0000        	call	c_rtol
 755  02fc 96            	ldw	x,sp
 756  02fd 1c000d        	addw	x,#OFST+3
 757  0300 cd0000        	call	c_ltor
 759  0303 96            	ldw	x,sp
 760  0304 1c0001        	addw	x,#OFST-9
 761  0307 cd0000        	call	c_fdiv
 763  030a cd0000        	call	c_ftoi
 765  030d 1f09          	ldw	(OFST-1,sp),x
 767                     ; 74 	return arr;
 769  030f 1e09          	ldw	x,(OFST-1,sp)
 772  0311 5b0a          	addw	sp,#10
 773  0313 81            	ret
 825                     ; 77 uint16_t determineOCValue(float arr, double dutyCycle) {
 826                     	switch	.text
 827  0314               _determineOCValue:
 829  0314 5206          	subw	sp,#6
 830       00000006      OFST:	set	6
 833                     ; 80 	if(dutyCycle < 1 && dutyCycle > 0) {
 835  0316 9c            	rvf
 836  0317 a601          	ld	a,#1
 837  0319 cd0000        	call	c_ctof
 839  031c 96            	ldw	x,sp
 840  031d 1c0001        	addw	x,#OFST-5
 841  0320 cd0000        	call	c_rtol
 844  0323 96            	ldw	x,sp
 845  0324 1c000d        	addw	x,#OFST+7
 846  0327 cd0000        	call	c_ltor
 848  032a 96            	ldw	x,sp
 849  032b 1c0001        	addw	x,#OFST-5
 850  032e cd0000        	call	c_fcmp
 852  0331 2e1d          	jrsge	L152
 854  0333 9c            	rvf
 855  0334 9c            	rvf
 856  0335 0d0d          	tnz	(OFST+7,sp)
 857  0337 2d17          	jrsle	L152
 858                     ; 81 		OCValue = (uint16_t)(arr * dutyCycle);
 860  0339 96            	ldw	x,sp
 861  033a 1c0009        	addw	x,#OFST+3
 862  033d cd0000        	call	c_ltor
 864  0340 96            	ldw	x,sp
 865  0341 1c000d        	addw	x,#OFST+7
 866  0344 cd0000        	call	c_fmul
 868  0347 cd0000        	call	c_ftoi
 870  034a 1f05          	ldw	(OFST-1,sp),x
 872                     ; 82 		return OCValue;
 874  034c 1e05          	ldw	x,(OFST-1,sp)
 876  034e 203e          	jra	L62
 877  0350               L152:
 878                     ; 85 	else if(dutyCycle < 100 && dutyCycle > 0) {
 880  0350 9c            	rvf
 881  0351 a664          	ld	a,#100
 882  0353 cd0000        	call	c_ctof
 884  0356 96            	ldw	x,sp
 885  0357 1c0001        	addw	x,#OFST-5
 886  035a cd0000        	call	c_rtol
 889  035d 96            	ldw	x,sp
 890  035e 1c000d        	addw	x,#OFST+7
 891  0361 cd0000        	call	c_ltor
 893  0364 96            	ldw	x,sp
 894  0365 1c0001        	addw	x,#OFST-5
 895  0368 cd0000        	call	c_fcmp
 897  036b 2e24          	jrsge	L552
 899  036d 9c            	rvf
 900  036e 9c            	rvf
 901  036f 0d0d          	tnz	(OFST+7,sp)
 902  0371 2d1e          	jrsle	L552
 903                     ; 86 		OCValue = (uint16_t)(arr * (dutyCycle / 100));
 905  0373 96            	ldw	x,sp
 906  0374 1c000d        	addw	x,#OFST+7
 907  0377 cd0000        	call	c_ltor
 909  037a ae0010        	ldw	x,#L362
 910  037d cd0000        	call	c_fdiv
 912  0380 96            	ldw	x,sp
 913  0381 1c0009        	addw	x,#OFST+3
 914  0384 cd0000        	call	c_fmul
 916  0387 cd0000        	call	c_ftoi
 918  038a 1f05          	ldw	(OFST-1,sp),x
 920                     ; 87 		return OCValue;
 922  038c 1e05          	ldw	x,(OFST-1,sp)
 924  038e               L62:
 926  038e 5b06          	addw	sp,#6
 927  0390 81            	ret
 928  0391               L552:
 929                     ; 91 		return arr/2;
 931  0391 96            	ldw	x,sp
 932  0392 1c0009        	addw	x,#OFST+3
 933  0395 cd0000        	call	c_ltor
 935  0398 ae000c        	ldw	x,#L572
 936  039b cd0000        	call	c_fdiv
 938  039e cd0000        	call	c_ftoi
 941  03a1 20eb          	jra	L62
1023                     ; 94 void tim1SetValues(uint16_t arr, uint16_t psc, uint16_t cnt) {
1024                     	switch	.text
1025  03a3               _tim1SetValues:
1027  03a3 89            	pushw	x
1028  03a4 5206          	subw	sp,#6
1029       00000006      OFST:	set	6
1032                     ; 95 	IoRegister *tim_arr = &TIM1->ARRH;
1034  03a6 ae5262        	ldw	x,#21090
1035  03a9 1f01          	ldw	(OFST-5,sp),x
1037                     ; 96 	IoRegister *tim_psc = &TIM1->PSCRH;
1039  03ab ae5260        	ldw	x,#21088
1040  03ae 1f03          	ldw	(OFST-3,sp),x
1042                     ; 97 	IoRegister *tim_cnt = &TIM1->CNTRH;
1044  03b0 ae525e        	ldw	x,#21086
1045  03b3 1f05          	ldw	(OFST-1,sp),x
1047                     ; 99 	psc -= 1;
1049  03b5 1e0b          	ldw	x,(OFST+5,sp)
1050  03b7 1d0001        	subw	x,#1
1051  03ba 1f0b          	ldw	(OFST+5,sp),x
1052                     ; 101 	*tim_arr = ((0xff00 & arr) >> 8);
1054  03bc 7b07          	ld	a,(OFST+1,sp)
1055  03be c75262        	ld	21090,a
1056                     ; 102 	*tim_psc = ((0xff00 & psc) >> 8);
1058  03c1 7b0b          	ld	a,(OFST+5,sp)
1059  03c3 c75260        	ld	21088,a
1060                     ; 103 	*tim_cnt = ((0xff00 & cnt) >> 8);
1062  03c6 7b0d          	ld	a,(OFST+7,sp)
1063  03c8 c7525e        	ld	21086,a
1064                     ; 104 	tim_arr++;
1066  03cb 1e01          	ldw	x,(OFST-5,sp)
1067  03cd 1c0001        	addw	x,#1
1068  03d0 1f01          	ldw	(OFST-5,sp),x
1070                     ; 105 	tim_psc++;
1072  03d2 1e03          	ldw	x,(OFST-3,sp)
1073  03d4 1c0001        	addw	x,#1
1074  03d7 1f03          	ldw	(OFST-3,sp),x
1076                     ; 106 	tim_cnt++;
1078  03d9 1e05          	ldw	x,(OFST-1,sp)
1079  03db 1c0001        	addw	x,#1
1080  03de 1f05          	ldw	(OFST-1,sp),x
1082                     ; 107 	*tim_arr = (0x00ff & arr);
1084  03e0 7b08          	ld	a,(OFST+2,sp)
1085  03e2 a4ff          	and	a,#255
1086  03e4 1e01          	ldw	x,(OFST-5,sp)
1087  03e6 f7            	ld	(x),a
1088                     ; 108 	*tim_psc = (0x00ff & psc);
1090  03e7 7b0c          	ld	a,(OFST+6,sp)
1091  03e9 a4ff          	and	a,#255
1092  03eb 1e03          	ldw	x,(OFST-3,sp)
1093  03ed f7            	ld	(x),a
1094                     ; 109 	*tim_cnt = (0x00ff & cnt);
1096  03ee 7b0e          	ld	a,(OFST+8,sp)
1097  03f0 a4ff          	and	a,#255
1098  03f2 1e05          	ldw	x,(OFST-1,sp)
1099  03f4 f7            	ld	(x),a
1100                     ; 110 }
1103  03f5 5b08          	addw	sp,#8
1104  03f7 81            	ret
1157                     ; 112 void tim1OCSetValue(uint32_t channel, uint16_t compareValue) {
1158                     	switch	.text
1159  03f8               _tim1OCSetValue:
1161  03f8 5206          	subw	sp,#6
1162       00000006      OFST:	set	6
1165                     ; 113 	IoRegister *ccr = &TIM1->CCR1H;
1167  03fa ae5265        	ldw	x,#21093
1168  03fd 1f05          	ldw	(OFST-1,sp),x
1170                     ; 115 	ccr += ((channel - 1) * 2);
1172  03ff 96            	ldw	x,sp
1173  0400 1c0009        	addw	x,#OFST+3
1174  0403 cd0000        	call	c_ltor
1176  0406 3803          	sll	c_lreg+3
1177  0408 3902          	rlc	c_lreg+2
1178  040a 3901          	rlc	c_lreg+1
1179  040c 3900          	rlc	c_lreg
1180  040e a602          	ld	a,#2
1181  0410 cd0000        	call	c_lsbc
1183  0413 96            	ldw	x,sp
1184  0414 1c0001        	addw	x,#OFST-5
1185  0417 cd0000        	call	c_rtol
1188  041a 1e05          	ldw	x,(OFST-1,sp)
1189  041c cd0000        	call	c_uitolx
1191  041f 96            	ldw	x,sp
1192  0420 1c0001        	addw	x,#OFST-5
1193  0423 cd0000        	call	c_ladd
1195  0426 be02          	ldw	x,c_lreg+2
1196  0428 1f05          	ldw	(OFST-1,sp),x
1198                     ; 117 	*ccr &= 0x00;
1200  042a 1e05          	ldw	x,(OFST-1,sp)
1201  042c 7f            	clr	(x)
1202                     ; 118 	*ccr = ((0xff00 & compareValue) >> 8);
1204  042d 7b0d          	ld	a,(OFST+7,sp)
1205  042f 1e05          	ldw	x,(OFST-1,sp)
1206  0431 f7            	ld	(x),a
1207                     ; 119 	ccr++;
1209  0432 1e05          	ldw	x,(OFST-1,sp)
1210  0434 1c0001        	addw	x,#1
1211  0437 1f05          	ldw	(OFST-1,sp),x
1213                     ; 120 	*ccr = (0x00ff & compareValue);
1215  0439 7b0e          	ld	a,(OFST+8,sp)
1216  043b a4ff          	and	a,#255
1217  043d 1e05          	ldw	x,(OFST-1,sp)
1218  043f f7            	ld	(x),a
1219                     ; 121 }
1222  0440 5b06          	addw	sp,#6
1223  0442 81            	ret
1276                     ; 123 void tim1OCSetMode(uint32_t channel, uint32_t mode) {
1277                     	switch	.text
1278  0443               _tim1OCSetMode:
1280  0443 5206          	subw	sp,#6
1281       00000006      OFST:	set	6
1284                     ; 124 	IoRegister *ccmr = &TIM1->CCMR1;
1286  0445 ae5258        	ldw	x,#21080
1287  0448 1f05          	ldw	(OFST-1,sp),x
1289                     ; 126 	ccmr += (channel - 1);
1291  044a 96            	ldw	x,sp
1292  044b 1c0009        	addw	x,#OFST+3
1293  044e cd0000        	call	c_ltor
1295  0451 a601          	ld	a,#1
1296  0453 cd0000        	call	c_lsbc
1298  0456 96            	ldw	x,sp
1299  0457 1c0001        	addw	x,#OFST-5
1300  045a cd0000        	call	c_rtol
1303  045d 1e05          	ldw	x,(OFST-1,sp)
1304  045f cd0000        	call	c_uitolx
1306  0462 96            	ldw	x,sp
1307  0463 1c0001        	addw	x,#OFST-5
1308  0466 cd0000        	call	c_ladd
1310  0469 be02          	ldw	x,c_lreg+2
1311  046b 1f05          	ldw	(OFST-1,sp),x
1313                     ; 128 	*ccmr &= ~(1 << 4);
1315  046d 1e05          	ldw	x,(OFST-1,sp)
1316  046f f6            	ld	a,(x)
1317  0470 a4ef          	and	a,#239
1318  0472 f7            	ld	(x),a
1319                     ; 129 	*ccmr |= (mode << 4);
1321  0473 1e05          	ldw	x,(OFST-1,sp)
1322  0475 7b10          	ld	a,(OFST+10,sp)
1323  0477 4e            	swap	a
1324  0478 a4f0          	and	a,#240
1325  047a fa            	or	a,(x)
1326  047b f7            	ld	(x),a
1327                     ; 130 }
1330  047c 5b06          	addw	sp,#6
1331  047e 81            	ret
1415                     ; 132 void setTim1OCPeriod(float desiredTime, double dutyCycle, float freqPeriod) {
1416                     	switch	.text
1417  047f               _setTim1OCPeriod:
1419  047f 520c          	subw	sp,#12
1420       0000000c      OFST:	set	12
1423                     ; 135 	psc = determineMinPsc(desiredTime, freqPeriod);
1425  0481 1e19          	ldw	x,(OFST+13,sp)
1426  0483 89            	pushw	x
1427  0484 1e19          	ldw	x,(OFST+13,sp)
1428  0486 89            	pushw	x
1429  0487 1e15          	ldw	x,(OFST+9,sp)
1430  0489 89            	pushw	x
1431  048a 1e15          	ldw	x,(OFST+9,sp)
1432  048c 89            	pushw	x
1433  048d cd026d        	call	_determineMinPsc
1435  0490 5b08          	addw	sp,#8
1436  0492 cd0000        	call	c_uitolx
1438  0495 96            	ldw	x,sp
1439  0496 1c0005        	addw	x,#OFST-7
1440  0499 cd0000        	call	c_rtol
1443                     ; 136 	arr = determineArr(desiredTime, freqPeriod, psc);
1445  049c 1e07          	ldw	x,(OFST-5,sp)
1446  049e 89            	pushw	x
1447  049f 1e1b          	ldw	x,(OFST+15,sp)
1448  04a1 89            	pushw	x
1449  04a2 1e1b          	ldw	x,(OFST+15,sp)
1450  04a4 89            	pushw	x
1451  04a5 1e17          	ldw	x,(OFST+11,sp)
1452  04a7 89            	pushw	x
1453  04a8 1e17          	ldw	x,(OFST+11,sp)
1454  04aa 89            	pushw	x
1455  04ab cd02d9        	call	_determineArr
1457  04ae 5b0a          	addw	sp,#10
1458  04b0 cd0000        	call	c_uitolx
1460  04b3 96            	ldw	x,sp
1461  04b4 1c0009        	addw	x,#OFST-3
1462  04b7 cd0000        	call	c_rtol
1465                     ; 137 	ocValue = determineOCValue(arr, dutyCycle);
1467  04ba 1e15          	ldw	x,(OFST+9,sp)
1468  04bc 89            	pushw	x
1469  04bd 1e15          	ldw	x,(OFST+9,sp)
1470  04bf 89            	pushw	x
1471  04c0 96            	ldw	x,sp
1472  04c1 1c000d        	addw	x,#OFST+1
1473  04c4 cd0000        	call	c_ltor
1475  04c7 cd0000        	call	c_ultof
1477  04ca be02          	ldw	x,c_lreg+2
1478  04cc 89            	pushw	x
1479  04cd be00          	ldw	x,c_lreg
1480  04cf 89            	pushw	x
1481  04d0 cd0314        	call	_determineOCValue
1483  04d3 5b08          	addw	sp,#8
1484  04d5 cd0000        	call	c_uitolx
1486  04d8 96            	ldw	x,sp
1487  04d9 1c0001        	addw	x,#OFST-11
1488  04dc cd0000        	call	c_rtol
1491                     ; 139 	tim1SetValues(arr, psc, 0);
1493  04df 5f            	clrw	x
1494  04e0 89            	pushw	x
1495  04e1 1e09          	ldw	x,(OFST-3,sp)
1496  04e3 89            	pushw	x
1497  04e4 1e0f          	ldw	x,(OFST+3,sp)
1498  04e6 cd03a3        	call	_tim1SetValues
1500  04e9 5b04          	addw	sp,#4
1501                     ; 140 	tim1OCSetValue(TIM_CH2, ocValue);
1503  04eb 1e03          	ldw	x,(OFST-9,sp)
1504  04ed 89            	pushw	x
1505  04ee ae0002        	ldw	x,#2
1506  04f1 89            	pushw	x
1507  04f2 ae0000        	ldw	x,#0
1508  04f5 89            	pushw	x
1509  04f6 cd03f8        	call	_tim1OCSetValue
1511  04f9 5b06          	addw	sp,#6
1512                     ; 141 }
1515  04fb 5b0c          	addw	sp,#12
1516  04fd 81            	ret
1588                     ; 143 void setTim1Freq(uint32_t desiredFreq, double dutyCycle) {
1589                     	switch	.text
1590  04fe               _setTim1Freq:
1592  04fe 520c          	subw	sp,#12
1593       0000000c      OFST:	set	12
1596                     ; 148 	systemClkFreq = getMasterClkFreq();
1598  0500 cd05ef        	call	_getMasterClkFreq
1600  0503 96            	ldw	x,sp
1601  0504 1c0009        	addw	x,#OFST-3
1602  0507 cd0000        	call	c_rtol
1605                     ; 149 	desiredTime = (1/(float)desiredFreq);
1607  050a 96            	ldw	x,sp
1608  050b 1c000f        	addw	x,#OFST+3
1609  050e cd0000        	call	c_ltor
1611  0511 cd0000        	call	c_ultof
1613  0514 96            	ldw	x,sp
1614  0515 1c0001        	addw	x,#OFST-11
1615  0518 cd0000        	call	c_rtol
1618  051b a601          	ld	a,#1
1619  051d cd0000        	call	c_ctof
1621  0520 96            	ldw	x,sp
1622  0521 1c0001        	addw	x,#OFST-11
1623  0524 cd0000        	call	c_fdiv
1625  0527 96            	ldw	x,sp
1626  0528 1c0005        	addw	x,#OFST-7
1627  052b cd0000        	call	c_rtol
1630                     ; 150 	freqPeriod = (1/(float)systemClkFreq);
1632  052e 96            	ldw	x,sp
1633  052f 1c0009        	addw	x,#OFST-3
1634  0532 cd0000        	call	c_ltor
1636  0535 cd0000        	call	c_ultof
1638  0538 96            	ldw	x,sp
1639  0539 1c0001        	addw	x,#OFST-11
1640  053c cd0000        	call	c_rtol
1643  053f a601          	ld	a,#1
1644  0541 cd0000        	call	c_ctof
1646  0544 96            	ldw	x,sp
1647  0545 1c0001        	addw	x,#OFST-11
1648  0548 cd0000        	call	c_fdiv
1650  054b 96            	ldw	x,sp
1651  054c 1c0009        	addw	x,#OFST-3
1652  054f cd0000        	call	c_rtol
1655                     ; 151 	setTim1OCPeriod(desiredTime, dutyCycle, freqPeriod);
1657  0552 1e0b          	ldw	x,(OFST-1,sp)
1658  0554 89            	pushw	x
1659  0555 1e0b          	ldw	x,(OFST-1,sp)
1660  0557 89            	pushw	x
1661  0558 1e19          	ldw	x,(OFST+13,sp)
1662  055a 89            	pushw	x
1663  055b 1e19          	ldw	x,(OFST+13,sp)
1664  055d 89            	pushw	x
1665  055e 1e0f          	ldw	x,(OFST+3,sp)
1666  0560 89            	pushw	x
1667  0561 1e0f          	ldw	x,(OFST+3,sp)
1668  0563 89            	pushw	x
1669  0564 cd047f        	call	_setTim1OCPeriod
1671  0567 5b0c          	addw	sp,#12
1672                     ; 152 }
1675  0569 5b0c          	addw	sp,#12
1676  056b 81            	ret
1720                     	switch	.const
1721  0004               L44:
1722  0004 00000003      	dc.l	3
1723  0008               L64:
1724  0008 00000005      	dc.l	5
1725                     ; 154 void tim1InitOC(uint32_t channel, uint32_t mode) {
1726                     	switch	.text
1727  056c               _tim1InitOC:
1729       00000000      OFST:	set	0
1732                     ; 155 	TIM1_ENABLE_CLK_GATING();
1734  056c 358050c7      	mov	20679,#128
1735                     ; 156 	tim1OCSetMode(channel, mode);
1737  0570 1e09          	ldw	x,(OFST+9,sp)
1738  0572 89            	pushw	x
1739  0573 1e09          	ldw	x,(OFST+9,sp)
1740  0575 89            	pushw	x
1741  0576 1e09          	ldw	x,(OFST+9,sp)
1742  0578 89            	pushw	x
1743  0579 1e09          	ldw	x,(OFST+9,sp)
1744  057b 89            	pushw	x
1745  057c cd0443        	call	_tim1OCSetMode
1747  057f 5b08          	addw	sp,#8
1748                     ; 158 	if(channel > 2 && channel < 5)
1750  0581 96            	ldw	x,sp
1751  0582 1c0003        	addw	x,#OFST+3
1752  0585 cd0000        	call	c_ltor
1754  0588 ae0004        	ldw	x,#L44
1755  058b cd0000        	call	c_lcmp
1757  058e 2529          	jrult	L145
1759  0590 96            	ldw	x,sp
1760  0591 1c0003        	addw	x,#OFST+3
1761  0594 cd0000        	call	c_ltor
1763  0597 ae0008        	ldw	x,#L64
1764  059a cd0000        	call	c_lcmp
1766  059d 241a          	jruge	L145
1767                     ; 159 		TIM1->CCER2 |= (5 << (((channel) - 3) *4));
1769  059f 7b06          	ld	a,(OFST+6,sp)
1770  05a1 48            	sll	a
1771  05a2 48            	sll	a
1772  05a3 5f            	clrw	x
1773  05a4 97            	ld	xl,a
1774  05a5 1d000c        	subw	x,#12
1775  05a8 a605          	ld	a,#5
1776  05aa 5d            	tnzw	x
1777  05ab 2704          	jreq	L05
1778  05ad               L25:
1779  05ad 48            	sll	a
1780  05ae 5a            	decw	x
1781  05af 26fc          	jrne	L25
1782  05b1               L05:
1783  05b1 ca525d        	or	a,21085
1784  05b4 c7525d        	ld	21085,a
1786  05b7 2030          	jra	L345
1787  05b9               L145:
1788                     ; 161 	else if(channel > 0 && channel < 3)
1790  05b9 96            	ldw	x,sp
1791  05ba 1c0003        	addw	x,#OFST+3
1792  05bd cd0000        	call	c_lzmp
1794  05c0 272c          	jreq	L545
1796  05c2 96            	ldw	x,sp
1797  05c3 1c0003        	addw	x,#OFST+3
1798  05c6 cd0000        	call	c_ltor
1800  05c9 ae0004        	ldw	x,#L44
1801  05cc cd0000        	call	c_lcmp
1803  05cf 241d          	jruge	L545
1804                     ; 162 		TIM1->CCER1 |= (5 << (((channel) - 1) *4));
1806  05d1 7b06          	ld	a,(OFST+6,sp)
1807  05d3 48            	sll	a
1808  05d4 48            	sll	a
1809  05d5 5f            	clrw	x
1810  05d6 97            	ld	xl,a
1811  05d7 1d0004        	subw	x,#4
1812  05da a605          	ld	a,#5
1813  05dc 5d            	tnzw	x
1814  05dd 2704          	jreq	L45
1815  05df               L65:
1816  05df 48            	sll	a
1817  05e0 5a            	decw	x
1818  05e1 26fc          	jrne	L65
1819  05e3               L45:
1820  05e3 ca525c        	or	a,21084
1821  05e6 c7525c        	ld	21084,a
1823  05e9               L345:
1824                     ; 166 	TIM1_MOE_ENABLE();
1826  05e9 721e526d      	bset	21101,#7
1827                     ; 167 }
1830  05ed 81            	ret
1831  05ee               L545:
1832                     ; 165 		return;
1835  05ee 81            	ret
1878                     ; 169 uint32_t getMasterClkFreq(void) {
1879                     	switch	.text
1880  05ef               _getMasterClkFreq:
1882  05ef 5206          	subw	sp,#6
1883       00000006      OFST:	set	6
1886                     ; 171 	int clkdivr = ((CLK->CKDIVR & 0x18) >> 3);
1888  05f1 c650c6        	ld	a,20678
1889  05f4 44            	srl	a
1890  05f5 44            	srl	a
1891  05f6 44            	srl	a
1892  05f7 5f            	clrw	x
1893  05f8 a403          	and	a,#3
1894  05fa 5f            	clrw	x
1895  05fb 5f            	clrw	x
1896  05fc 97            	ld	xl,a
1897  05fd 1f01          	ldw	(OFST-5,sp),x
1899                     ; 173 	switch(clkdivr) {
1901  05ff 1e01          	ldw	x,(OFST-5,sp)
1903                     ; 178 		default: systemClkFreq = 2000000;break;
1904  0601 5d            	tnzw	x
1905  0602 2715          	jreq	L155
1906  0604 5a            	decw	x
1907  0605 271e          	jreq	L355
1908  0607 5a            	decw	x
1909  0608 2727          	jreq	L555
1910  060a 5a            	decw	x
1911  060b 2730          	jreq	L755
1912  060d               L165:
1915  060d ae8480        	ldw	x,#33920
1916  0610 1f05          	ldw	(OFST-1,sp),x
1917  0612 ae001e        	ldw	x,#30
1918  0615 1f03          	ldw	(OFST-3,sp),x
1922  0617 202e          	jra	L706
1923  0619               L155:
1924                     ; 174 		case 0 : systemClkFreq = 16000000;break;
1926  0619 ae2400        	ldw	x,#9216
1927  061c 1f05          	ldw	(OFST-1,sp),x
1928  061e ae00f4        	ldw	x,#244
1929  0621 1f03          	ldw	(OFST-3,sp),x
1933  0623 2022          	jra	L706
1934  0625               L355:
1935                     ; 175 		case 1 : systemClkFreq = 8000000;break;
1937  0625 ae1200        	ldw	x,#4608
1938  0628 1f05          	ldw	(OFST-1,sp),x
1939  062a ae007a        	ldw	x,#122
1940  062d 1f03          	ldw	(OFST-3,sp),x
1944  062f 2016          	jra	L706
1945  0631               L555:
1946                     ; 176 		case 2 : systemClkFreq = 4000000;break;
1948  0631 ae0900        	ldw	x,#2304
1949  0634 1f05          	ldw	(OFST-1,sp),x
1950  0636 ae003d        	ldw	x,#61
1951  0639 1f03          	ldw	(OFST-3,sp),x
1955  063b 200a          	jra	L706
1956  063d               L755:
1957                     ; 177 		case 3 : systemClkFreq = 2000000;break;
1959  063d ae8480        	ldw	x,#33920
1960  0640 1f05          	ldw	(OFST-1,sp),x
1961  0642 ae001e        	ldw	x,#30
1962  0645 1f03          	ldw	(OFST-3,sp),x
1966  0647               L706:
1967                     ; 181 	return systemClkFreq;
1969  0647 96            	ldw	x,sp
1970  0648 1c0003        	addw	x,#OFST-3
1971  064b cd0000        	call	c_ltor
1975  064e 5b06          	addw	sp,#6
1976  0650 81            	ret
1989                     	xdef	_tim1InitOC
1990                     	xdef	_tim1OCSetValue
1991                     	xdef	_tim1OCSetMode
1992                     	xdef	_tim1SetValues
1993                     	xdef	_setTim1OCPeriod
1994                     	xdef	_setTim1Freq
1995                     	xdef	_determineMinPsc
1996                     	xdef	_determineArr
1997                     	xdef	_determineOCValue
1998                     	xdef	_getMasterClkFreq
1999                     	xdef	_setTim1Deadtime
2000                     	switch	.const
2001  000c               L572:
2002  000c 40000000      	dc.w	16384,0
2003  0010               L362:
2004  0010 42c80000      	dc.w	17096,0
2005  0014               L75:
2006  0014 3f800000      	dc.w	16256,0
2007  0018               L74:
2008  0018 4e6e6b28      	dc.w	20078,27432
2009                     	xref.b	c_lreg
2010                     	xref.b	c_x
2030                     	xref	c_lzmp
2031                     	xref	c_ladd
2032                     	xref	c_uitolx
2033                     	xref	c_fcmp
2034                     	xref	c_ftoi
2035                     	xref	c_uitof
2036                     	xref	c_lsbc
2037                     	xref	c_llsh
2038                     	xref	c_lor
2039                     	xref	c_ludv
2040                     	xref	c_lcmp
2041                     	xref	c_smul
2042                     	xref	c_ftol
2043                     	xref	c_fadd
2044                     	xref	c_fmul
2045                     	xref	c_fdiv
2046                     	xref	c_ultof
2047                     	xref	c_ltor
2048                     	xref	c_ctof
2049                     	xref	c_rtol
2050                     	end
