/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "timer.h"
#include "gpio.h"

#define CompareValue  500
#define ARRValue			1000
#define PSCValue 			16
#define CNTValue 			0

void main()
{
	CLK->CKDIVR = 0x00;
	configureGPIO(GPIOC, GPIO_PIN7, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
	configureGPIO(GPIOC, GPIO_PIN4, GPIO_DIR_OUT | GPIO_MODE_PUSH_PULL | GPIO_OUT_SPEED_2MH);
	tim1InitOC(TIM_CH2, OC_PWM1, CompareValue, ARRValue, PSCValue, CNTValue);
	TIM1->DTR = 230;
	TIM1_COUNTER_ENABLE();

 }
