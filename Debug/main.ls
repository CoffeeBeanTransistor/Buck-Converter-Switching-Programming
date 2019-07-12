   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  46                     ; 17 void main()
  46                     ; 18 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 21 	psc = determineMinPsc(100, 0.0000000625);
  55  0000 ce0002        	ldw	x,L53+2
  56  0003 89            	pushw	x
  57  0004 ce0000        	ldw	x,L53
  58  0007 89            	pushw	x
  59  0008 ce0006        	ldw	x,L52+2
  60  000b 89            	pushw	x
  61  000c ce0004        	ldw	x,L52
  62  000f 89            	pushw	x
  63  0010 cd0000        	call	_determineMinPsc
  65  0013 5b08          	addw	sp,#8
  66  0015 bf00          	ldw	_psc,x
  67                     ; 22 	CLK->CKDIVR = 0x00;
  69  0017 725f50c6      	clr	20678
  70                     ; 23 	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  72  001b 4b03          	push	#3
  73  001d ae0007        	ldw	x,#7
  74  0020 89            	pushw	x
  75  0021 ae500a        	ldw	x,#20490
  76  0024 cd0000        	call	_configureGPIO
  78  0027 5b03          	addw	sp,#3
  79                     ; 24 	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  81  0029 4b03          	push	#3
  82  002b ae0004        	ldw	x,#4
  83  002e 89            	pushw	x
  84  002f ae500a        	ldw	x,#20490
  85  0032 cd0000        	call	_configureGPIO
  87  0035 5b03          	addw	sp,#3
  88                     ; 25 	tim1InitOC(TIM_CH2, OC_PWM1, CompareValue, ARRValue, PSCValue, CNTValue);
  90  0037 5f            	clrw	x
  91  0038 89            	pushw	x
  92  0039 ae0010        	ldw	x,#16
  93  003c 89            	pushw	x
  94  003d ae03e8        	ldw	x,#1000
  95  0040 89            	pushw	x
  96  0041 ae01f4        	ldw	x,#500
  97  0044 89            	pushw	x
  98  0045 ae0006        	ldw	x,#6
  99  0048 89            	pushw	x
 100  0049 ae0000        	ldw	x,#0
 101  004c 89            	pushw	x
 102  004d ae0002        	ldw	x,#2
 103  0050 89            	pushw	x
 104  0051 ae0000        	ldw	x,#0
 105  0054 89            	pushw	x
 106  0055 cd0000        	call	_tim1InitOC
 108  0058 5b10          	addw	sp,#16
 109                     ; 26 	TIM1->DTR = 230;
 111  005a 35e6526e      	mov	21102,#230
 112                     ; 27 	TIM1_COUNTER_ENABLE();
 114  005e 72105250      	bset	21072,#0
 115                     ; 29  }
 118  0062 81            	ret
 142                     	xdef	_main
 143                     	switch	.ubsct
 144  0000               _psc:
 145  0000 0000          	ds.b	2
 146                     	xdef	_psc
 147                     	xref	_configureGPIO
 148                     	xref	_tim1InitOC
 149                     	xref	_determineMinPsc
 150                     .const:	section	.text
 151  0000               L53:
 152  0000 338637bd      	dc.w	13190,14269
 153  0004               L52:
 154  0004 42c80000      	dc.w	17096,0
 174                     	end
