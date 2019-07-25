#include "stm8s.h"
#include "timer.h"


typedef volatile uint8_t IoRegister;

#define TIM1_ENABLE_CLK_GATING() 	(CLK->PCKENR1 = CLK_PCKENR1_TIM1)
#define TIM1_MOE_ENABLE()					(TIM1->BKR) |= (1<<7)

void setTim1Deadtime(uint32_t deadtime) {
	uint32_t systemClkFreq = getMasterClkFreq();
	uint32_t min;
	uint32_t steps = (((1/(double)systemClkFreq)*1000000000) + 1);
	
	TIM1->DTR &= 0x00;
	
	if(deadtime <= (steps * 127)) {
		if(deadtime < steps)
			TIM1->DTR = 0x01;
		else
			TIM1->DTR |= (deadtime/steps);			
	}
	
	else if(deadtime <= (steps * 2 * 127)) {
		min = 64 * 2 * steps;
		TIM1->DTR |= (1<<7);
		if(deadtime < min)
			TIM1->DTR = 0x80;
		else
			TIM1->DTR |= ((deadtime/(steps*2)) - 64);			
	}
	
	else if(deadtime <= (steps * 8 * 63)) {
		min = 32 * 8 * steps;
		TIM1->DTR |= (3<<6);
		if(deadtime < min)
			TIM1->DTR = 0xC0;
		else
			TIM1->DTR |= ((deadtime/(steps*8)) - 32);			
	}
	
	else if(deadtime <= (steps * 16 * 63)) {
		min = 32 * 16 * steps;
		TIM1->DTR |= (7<<5);
		if(deadtime < min)
			TIM1->DTR = 0xE0;
		else
			TIM1->DTR |= ((int)(deadtime/(steps*16)) - 32);			
	}

	else
			TIM1->DTR = (deadtime <= (steps * 16 * 63));
}
	
uint16_t determineMinPsc(float desiredTime, float freqPeriod) {
	long int ticks;
	uint16_t psc = 1;
	float temp = 0;
	
	do{
		temp = freqPeriod * psc;
		ticks = (desiredTime/temp);
		if(ticks > 65536)
			psc++;
	}while(ticks > 65536);
	
	return psc;
}

uint16_t determineArr(float desiredTime, float freqPeriod,  uint16_t psc) {
	uint16_t arr;
	
	arr = (uint16_t)(desiredTime/(freqPeriod*psc));
	return arr;
}

uint16_t determineOCValue(float arr, double dutyCycle) {
	uint16_t OCValue;
	
	if(dutyCycle < 1 && dutyCycle > 0) {
		OCValue = (uint16_t)(arr * dutyCycle);
		return OCValue;
	}
	
	else if(dutyCycle < 100 && dutyCycle > 0) {
		OCValue = (uint16_t)(arr * (dutyCycle / 100));
		return OCValue;
	}
	
	else 
		return arr/2;
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

void setTim1OCPeriod(float desiredTime, double dutyCycle, float freqPeriod) {
	unsigned long int psc, arr, ocValue;
	
	psc = determineMinPsc(desiredTime, freqPeriod);
	arr = determineArr(desiredTime, freqPeriod, psc);
	ocValue = determineOCValue(arr, dutyCycle);
	
	tim1SetValues(arr, psc, 0);
	tim1OCSetValue(TIM_CH2, ocValue);
}

void setTim1Freq(uint32_t desiredFreq, double dutyCycle) {
	float freqPeriod;
	float desiredTime;
	uint32_t systemClkFreq;

	systemClkFreq = getMasterClkFreq();
	desiredTime = (1/(float)desiredFreq);
	freqPeriod = (1/(float)systemClkFreq);
	setTim1OCPeriod(desiredTime, dutyCycle, freqPeriod);
}

void tim1InitOC(uint32_t channel, uint32_t mode) {
	TIM1_ENABLE_CLK_GATING();
	tim1OCSetMode(channel, mode);
	
	if(channel > 2 && channel < 5)
		TIM1->CCER2 |= (5 << (((channel) - 3) *4));
	
	else if(channel > 0 && channel < 3)
		TIM1->CCER1 |= (5 << (((channel) - 1) *4));
		
	else
		return;
	TIM1_MOE_ENABLE();
}

uint32_t getMasterClkFreq(void) {
	uint32_t systemClkFreq;
	int clkdivr = ((CLK->CKDIVR & 0x18) >> 3);
	
	switch(clkdivr) {
		case 0 : systemClkFreq = 16000000;break;
		case 1 : systemClkFreq = 8000000;break;
		case 2 : systemClkFreq = 4000000;break;
		case 3 : systemClkFreq = 2000000;break;
		default: systemClkFreq = 2000000;break;
	}
	
	return systemClkFreq;
}