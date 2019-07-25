/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
 
#include "gpio.h"
#include "stm8s.h"
#include "timer.h"
#include "clk.h"

void main()
{
	HSIMasterClkSetFreq(CLK_FREQ_2MHZ); //Set CLK Freq
	setTim1Deadtime(16000);
	setTim1Freq(1000, 50);
	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
	tim1InitOC(TIM_CH2, OC_PWM1);
	TIM1_COUNTER_ENABLE();

 }
