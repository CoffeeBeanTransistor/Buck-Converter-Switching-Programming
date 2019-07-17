   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  45                     ; 16 void main()
  45                     ; 17 {
  47                     	switch	.text
  48  0000               _main:
  52                     ; 18 	CLK->CKDIVR = 0x00;
  54  0000 725f50c6      	clr	20678
  55                     ; 19 	setTim1Freq(9600, 20);
  57  0004 ce0002        	ldw	x,L52+2
  58  0007 89            	pushw	x
  59  0008 ce0000        	ldw	x,L52
  60  000b 89            	pushw	x
  61  000c ae2580        	ldw	x,#9600
  62  000f 89            	pushw	x
  63  0010 ae0000        	ldw	x,#0
  64  0013 89            	pushw	x
  65  0014 cd0000        	call	_setTim1Freq
  67  0017 5b08          	addw	sp,#8
  68                     ; 20 	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  70  0019 4b03          	push	#3
  71  001b ae0007        	ldw	x,#7
  72  001e 89            	pushw	x
  73  001f ae500a        	ldw	x,#20490
  74  0022 cd0000        	call	_configureGPIO
  76  0025 5b03          	addw	sp,#3
  77                     ; 21 	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  79  0027 4b03          	push	#3
  80  0029 ae0004        	ldw	x,#4
  81  002c 89            	pushw	x
  82  002d ae500a        	ldw	x,#20490
  83  0030 cd0000        	call	_configureGPIO
  85  0033 5b03          	addw	sp,#3
  86                     ; 22 	tim1InitOC(TIM_CH2, OC_PWM1);
  88  0035 ae0006        	ldw	x,#6
  89  0038 89            	pushw	x
  90  0039 ae0000        	ldw	x,#0
  91  003c 89            	pushw	x
  92  003d ae0002        	ldw	x,#2
  93  0040 89            	pushw	x
  94  0041 ae0000        	ldw	x,#0
  95  0044 89            	pushw	x
  96  0045 cd0000        	call	_tim1InitOC
  98  0048 5b08          	addw	sp,#8
  99                     ; 24 	TIM1_COUNTER_ENABLE();
 101  004a 72105250      	bset	21072,#0
 102                     ; 26  }
 105  004e 81            	ret
 118                     	xdef	_main
 119                     	xref	_tim1InitOC
 120                     	xref	_setTim1Freq
 121                     	xref	_configureGPIO
 122                     .const:	section	.text
 123  0000               L52:
 124  0000 41a00000      	dc.w	16800,0
 144                     	end
