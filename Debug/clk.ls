   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  54                     ; 4 void HSIMasterClkSetFreq(int freq) {
  56                     	switch	.text
  57  0000               _HSIMasterClkSetFreq:
  59  0000 89            	pushw	x
  60       00000000      OFST:	set	0
  63                     ; 6 		CLK->CKDIVR &= ~(0x18);
  65  0001 c650c6        	ld	a,20678
  66  0004 a4e7          	and	a,#231
  67  0006 c750c6        	ld	20678,a
  68                     ; 8 	switch(freq) {
  71                     ; 13 		default: 	CLK->CKDIVR |= 0x18;break;
  72  0009 5d            	tnzw	x
  73  000a 2719          	jreq	L3
  74  000c 1d0008        	subw	x,#8
  75  000f 271e          	jreq	L5
  76  0011 1d0008        	subw	x,#8
  77  0014 2723          	jreq	L7
  78  0016 1d0008        	subw	x,#8
  79  0019 2728          	jreq	L11
  80  001b               L31:
  83  001b c650c6        	ld	a,20678
  84  001e aa18          	or	a,#24
  85  0020 c750c6        	ld	20678,a
  88  0023 2026          	jra	L34
  89  0025               L3:
  90                     ; 9 		case 0: 	CLK->CKDIVR |= freq;break;
  92  0025 c650c6        	ld	a,20678
  93  0028 1a02          	or	a,(OFST+2,sp)
  94  002a c750c6        	ld	20678,a
  97  002d 201c          	jra	L34
  98  002f               L5:
  99                     ; 10 		case 8:		CLK->CKDIVR |= freq;break;
 101  002f c650c6        	ld	a,20678
 102  0032 1a02          	or	a,(OFST+2,sp)
 103  0034 c750c6        	ld	20678,a
 106  0037 2012          	jra	L34
 107  0039               L7:
 108                     ; 11 		case 16:	CLK->CKDIVR |= freq;break;
 110  0039 c650c6        	ld	a,20678
 111  003c 1a02          	or	a,(OFST+2,sp)
 112  003e c750c6        	ld	20678,a
 115  0041 2008          	jra	L34
 116  0043               L11:
 117                     ; 12 		case 24:	CLK->CKDIVR |= freq;break;
 119  0043 c650c6        	ld	a,20678
 120  0046 1a02          	or	a,(OFST+2,sp)
 121  0048 c750c6        	ld	20678,a
 124  004b               L34:
 125                     ; 15 }
 128  004b 85            	popw	x
 129  004c 81            	ret
 142                     	xdef	_HSIMasterClkSetFreq
 161                     	end
