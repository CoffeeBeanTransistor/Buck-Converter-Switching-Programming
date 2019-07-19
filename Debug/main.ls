   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  46                     ; 11 void main()
  46                     ; 12 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 13 	HSIMasterClkSetFreq(CLK_FREQ_4MHZ); //Set HSI clock divider to 0 = 16MHz
  55  0000 ae0010        	ldw	x,#16
  56  0003 cd0000        	call	_HSIMasterClkSetFreq
  58                     ; 15 	setTim1Freq(10000, 0.02);
  60  0006 ce0002        	ldw	x,L52+2
  61  0009 89            	pushw	x
  62  000a ce0000        	ldw	x,L52
  63  000d 89            	pushw	x
  64  000e ae2710        	ldw	x,#10000
  65  0011 89            	pushw	x
  66  0012 ae0000        	ldw	x,#0
  67  0015 89            	pushw	x
  68  0016 cd0000        	call	_setTim1Freq
  70  0019 5b08          	addw	sp,#8
  71                     ; 16 	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  73  001b 4b03          	push	#3
  74  001d ae0007        	ldw	x,#7
  75  0020 89            	pushw	x
  76  0021 ae500a        	ldw	x,#20490
  77  0024 cd0000        	call	_configureGPIO
  79  0027 5b03          	addw	sp,#3
  80                     ; 17 	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  82  0029 4b03          	push	#3
  83  002b ae0004        	ldw	x,#4
  84  002e 89            	pushw	x
  85  002f ae500a        	ldw	x,#20490
  86  0032 cd0000        	call	_configureGPIO
  88  0035 5b03          	addw	sp,#3
  89                     ; 18 	tim1InitOC(TIM_CH2, OC_PWM1);
  91  0037 ae0006        	ldw	x,#6
  92  003a 89            	pushw	x
  93  003b ae0000        	ldw	x,#0
  94  003e 89            	pushw	x
  95  003f ae0002        	ldw	x,#2
  96  0042 89            	pushw	x
  97  0043 ae0000        	ldw	x,#0
  98  0046 89            	pushw	x
  99  0047 cd0000        	call	_tim1InitOC
 101  004a 5b08          	addw	sp,#8
 102                     ; 20 	TIM1_COUNTER_ENABLE();
 104  004c 72105250      	bset	21072,#0
 105                     ; 22  }
 108  0050 81            	ret
 121                     	xdef	_main
 122                     	xref	_HSIMasterClkSetFreq
 123                     	xref	_tim1InitOC
 124                     	xref	_setTim1Freq
 125                     	xref	_configureGPIO
 126                     .const:	section	.text
 127  0000               L52:
 128  0000 3ca3d70a      	dc.w	15523,-10486
 148                     	end
