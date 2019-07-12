#ifndef __GPIO_H__
#define __GPIO_H__

#define GPIO_PIN0 0
#define GPIO_PIN1 1
#define GPIO_PIN2 2
#define GPIO_PIN3 3
#define GPIO_PIN4 4
#define GPIO_PIN5 5
#define GPIO_PIN6 6
#define GPIO_PIN7 7

#define GPIO_DIR_IN  (0<<0)
#define GPIO_DIR_OUT (1<<0)

#define GPIO_MODE_FLOATING_INPUT		(0<<1)
#define GPIO_MODE_PULLUP_INPUT			(1<<1)
#define GPIO_MODE_PSEUDO_OPEN_DRAIN	(0<<1)
#define GPIO_MODE_PUSH_PULL					(1<<1)

#define GPIO_EXT_INT_DISABLE				(0<<2)
#define GPIO_EXT_INT_ENABLE					(1<<2)
#define GPIO_OUT_SPEED_2MH					(0<<2)
#define GPIO_OUT_SPEED_10MH					(1<<2)

void configureGPIO(GPIO_TypeDef *port, int pin, uint8_t configuration);


#endif //__GPIO_H__