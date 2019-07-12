#ifndef __GPIO_H__
#define __GPIO_H__
#include "gpio.h"
#include "stm8s.h"

void configureGPIO(GPIO_TypeDef *port, int pin, uint8_t configuration) {
	int direction, mode1, mode2;
	
	direction = (configuration & 0x01);
	mode1     = ((configuration & 0x02)>>1);
	mode2     = ((configuration & 0x04)>>2);
	
	port->DDR |= (direction << pin);
	port->CR1 |= (mode1 << pin);
	port->CR2 |= (mode2 << pin);
}


#endif //__GPIO_H__