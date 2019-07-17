/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
 
#include "gpio.h"
#include "stm8s.h"
#include "timer.h"

void main()
{
	CLK->CKDIVR = 0x00; //Set HSI clock divider to 0 = 16MHz
	setTim1Freq(9600, 20);
	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
	tim1InitOC(TIM_CH2, OC_PWM1);
	//TIM1->DTR = 230;
	TIM1_COUNTER_ENABLE();

 }
