#ifndef __TIMER_H__
#define __TIMER_H__
#include "stm8s.h"

void setTim1Deadtime(float deadtime);
uint32_t getMasterClkFreq(void);
uint16_t determineOCValue(float arr, double dutyCycle);
uint16_t determineArr(float desiredTime, float freqPeriod, uint16_t psc);
uint16_t determineMinPsc(float desiredTime, float freqPeriod);
void setTim1Freq(uint32_t freq, double dutyCycle);
void setTim1OCPeriod(float desiredTime, double dutyCycle, float freqPeriod);
void tim1SetValues(uint16_t arr, uint16_t psc, uint16_t cnt);
void tim1OCSetMode(uint32_t channel, uint32_t mode);
void tim1OCSetValue(uint32_t channel, uint16_t compareValue);
void tim1InitOC(uint32_t channel, uint32_t mode);

#define TIM1_COUNTER_ENABLE() 		(TIM1->CR1 |= (1<<0))

#define TIM_CH1 1
#define TIM_CH2 2
#define TIM_CH3 3
#define TIM_CH4 4

#define OC_FROZEN							0	//000
#define OC_ACTIVE_ON_MATCH  	1	//001
#define OC_INACTIVE_ON_MATCH 	2	//010
#define OC_TOGGLE							3	//011
#define OC_FORCE_INACTIVE  		4	//100
#define OC_FORCE_ACTIVE 			5	//101
#define OC_PWM1  							6	//110
#define OC_PWM2 							7	//111


#endif //__TIMER_H__
