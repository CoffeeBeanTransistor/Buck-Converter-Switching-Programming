#ifndef __TIMER_H__
#define __TIMER_H__

#include <stdio.h>
#include "stm8s.h"
#include "timer.h"

typedef volatile uint8_t IoRegister;

#define TIM1_ENABLE_CLK_GATING() 	(CLK->PCKENR1 = CLK_PCKENR1_TIM1)
#define TIM1_MOE_ENABLE()					(TIM1->BKR) |= (1<<7)

int determineMinPsc(double desiredTime, float freqPeriod) {
	long int ticks;
	int psc = 1;
	float ms = (desiredTime/1000);
	float temp = 0;
	
	do{
		temp = freqPeriod * psc;
		ticks = (ms/temp);
		if(ticks > 65536)
			psc++;
	}while(ticks > 65536);
	
	return psc;
}

void setTim1Freq(uint16_t freq) {
	int period;
	
	period = 1/freq;


}

void tim1SetValues(uint16_t arr, uint16_t psc, uint16_t cnt) {
	IoRegister *tim_arr = &TIM1->ARRH;
	IoRegister *tim_psc = &TIM1->PSCRH;
	IoRegister *tim_cnt = &TIM1->CNTRH;
	
	psc -= 1;
	
	*tim_arr = ((0xff00 & arr) >> 8);
	*tim_psc = ((0xff00 & psc) >> 8);
	*tim_cnt = ((0xff00 & cnt) >> 8);
	tim_arr++;
	tim_psc++;
	tim_cnt++;
	*tim_arr = (0x00ff & arr);
	*tim_psc = (0x00ff & psc);
	*tim_cnt = (0x00ff & cnt);
}

void tim1OCSetValue(uint32_t channel, uint16_t compareValue) {
	IoRegister *ccr = &TIM1->CCR1H;
	
	ccr += ((channel - 1) * 2);
	
	*ccr &= 0x00;
	*ccr = ((0xff00 & compareValue) >> 8);
	ccr++;
	*ccr = (0x00ff & compareValue);
}

void tim1OCSetMode(uint32_t channel, uint32_t mode) {
	IoRegister *ccmr = &TIM1->CCMR1;
	
	ccmr += (channel - 1);
	
	*ccmr &= ~(1 << 4);
	*ccmr |= (mode << 4);
}

void tim1InitOC(uint32_t channel, uint32_t mode, uint16_t compareValue, uint16_t ARRValue, uint16_t PSCValue, uint16_t CNTValue) {
	TIM1_ENABLE_CLK_GATING();
	tim1OCSetMode(channel, mode);
	tim1OCSetValue(channel, compareValue);
	tim1SetValues(ARRValue, PSCValue, CNTValue);
	
	if(channel > 2 && channel < 5)
		TIM1->CCER2 |= (5 << (((channel) - 3) *4));
	
	else if(channel > 0 && channel < 3)
		TIM1->CCER1 |= (5 << (((channel) - 1) *4));
		
	else
		return;
	TIM1_MOE_ENABLE();
}

#endif //__TIMER_H__