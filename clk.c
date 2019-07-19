#include "stm8s.h"
#include "clk.h"

void HSIMasterClkSetFreq(int freq) {
		
		CLK->CKDIVR &= ~(0x18);

	switch(freq) {
		case 0: 	CLK->CKDIVR |= freq;break;
		case 8:		CLK->CKDIVR |= freq;break;
		case 16:	CLK->CKDIVR |= freq;break;
		case 24:	CLK->CKDIVR |= freq;break;
		default: 	CLK->CKDIVR |= 0x18;break;
	}
}

