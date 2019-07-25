   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  47                     ; 11 void main()
  47                     ; 12 {
  49                     	switch	.text
  50  0000               _main:
  54                     ; 13 	HSIMasterClkSetFreq(CLK_FREQ_2MHZ); //Set CLK Freq
  56  0000 ae0018        	ldw	x,#24
  57  0003 cd0000        	call	_HSIMasterClkSetFreq
  59                     ; 14 	setTim1Deadtime(300);
  61  0006 ae012c        	ldw	x,#300
  62  0009 89            	pushw	x
  63  000a ae0000        	ldw	x,#0
  64  000d 89            	pushw	x
  65  000e cd0000        	call	_setTim1Deadtime
  67  0011 5b04          	addw	sp,#4
  68                     ; 15 	setTim1Freq(1000, 50);
  70  0013 ce0002        	ldw	x,L52+2
  71  0016 89            	pushw	x
  72  0017 ce0000        	ldw	x,L52
  73  001a 89            	pushw	x
  74  001b ae03e8        	ldw	x,#1000
  75  001e 89            	pushw	x
  76  001f ae0000        	ldw	x,#0
  77  0022 89            	pushw	x
  78  0023 cd0000        	call	_setTim1Freq
  80  0026 5b08          	addw	sp,#8
  81                     ; 16 	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  83  0028 4b03          	push	#3
  84  002a ae0007        	ldw	x,#7
  85  002d 89            	pushw	x
  86  002e ae500a        	ldw	x,#20490
  87  0031 cd0000        	call	_configureGPIO
  89  0034 5b03          	addw	sp,#3
  90                     ; 17 	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  92  0036 4b03          	push	#3
  93  0038 ae0004        	ldw	x,#4
  94  003b 89            	pushw	x
  95  003c ae500a        	ldw	x,#20490
  96  003f cd0000        	call	_configureGPIO
  98  0042 5b03          	addw	sp,#3
  99                     ; 18 	tim1InitOC(TIM_CH2, OC_PWM1);
 101  0044 ae0006        	ldw	x,#6
 102  0047 89            	pushw	x
 103  0048 ae0000        	ldw	x,#0
 104  004b 89            	pushw	x
 105  004c ae0002        	ldw	x,#2
 106  004f 89            	pushw	x
 107  0050 ae0000        	ldw	x,#0
 108  0053 89            	pushw	x
 109  0054 cd0000        	call	_tim1InitOC
 111  0057 5b08          	addw	sp,#8
 112                     ; 19 	TIM1_COUNTER_ENABLE();
 114  0059 72105250      	bset	21072,#0
 115                     ; 21  }
 118  005d 81            	ret
 131                     	xdef	_main
 132                     	xref	_HSIMasterClkSetFreq
 133                     	xref	_tim1InitOC
 134                     	xref	_setTim1Freq
 135                     	xref	_setTim1Deadtime
 136                     	xref	_configureGPIO
 137                     .const:	section	.text
 138  0000               L52:
 139  0000 42480000      	dc.w	16968,0
 159                     	end
