   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  44                     ; 15 void main()
  44                     ; 16 {
  46                     	switch	.text
  47  0000               _main:
  51                     ; 17 	CLK->CKDIVR = 0x00;
  53  0000 725f50c6      	clr	20678
  54                     ; 18 	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  56  0004 4b03          	push	#3
  57  0006 ae0007        	ldw	x,#7
  58  0009 89            	pushw	x
  59  000a ae500a        	ldw	x,#20490
  60  000d cd0000        	call	_configureGPIO
  62  0010 5b03          	addw	sp,#3
  63                     ; 19 	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
  65  0012 4b03          	push	#3
  66  0014 ae0004        	ldw	x,#4
  67  0017 89            	pushw	x
  68  0018 ae500a        	ldw	x,#20490
  69  001b cd0000        	call	_configureGPIO
  71  001e 5b03          	addw	sp,#3
  72                     ; 20 	tim1InitOC(TIM_CH2, OC_PWM1, CompareValue, ARRValue, PSCValue, CNTValue);
  74  0020 5f            	clrw	x
  75  0021 89            	pushw	x
  76  0022 ae0010        	ldw	x,#16
  77  0025 89            	pushw	x
  78  0026 ae03e8        	ldw	x,#1000
  79  0029 89            	pushw	x
  80  002a ae01f4        	ldw	x,#500
  81  002d 89            	pushw	x
  82  002e ae0006        	ldw	x,#6
  83  0031 89            	pushw	x
  84  0032 ae0000        	ldw	x,#0
  85  0035 89            	pushw	x
  86  0036 ae0002        	ldw	x,#2
  87  0039 89            	pushw	x
  88  003a ae0000        	ldw	x,#0
  89  003d 89            	pushw	x
  90  003e cd0000        	call	_tim1InitOC
  92  0041 5b10          	addw	sp,#16
  93                     ; 21 	TIM1->DTR = 230;
  95  0043 35e6526e      	mov	21102,#230
  96                     ; 22 	TIM1_COUNTER_ENABLE();
  98  0047 72105250      	bset	21072,#0
  99                     ; 24  }
 102  004b 81            	ret
 115                     	xdef	_main
 116                     	xref	_configureGPIO
 117                     	xref	_tim1InitOC
 136                     	end
