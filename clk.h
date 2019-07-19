#ifndef __CLK_H__
#define __CLK_H__
#include "stm8s.h"

void HSIMasterClkSetFreq(int freq);

#define CLK_FREQ_16MHZ	(0<<3)
#define CLK_FREQ_8MHZ		(1<<3)
#define CLK_FREQ_4MHZ		(2<<3)
#define CLK_FREQ_2MHZ		(3<<3)

#endif //__CLK_H__

