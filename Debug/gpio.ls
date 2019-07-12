   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 153                     ; 6 void configureGPIO(GPIO_TypeDef *port, int pin, uint8_t configuration) {
 155                     	switch	.text
 156  0000               _configureGPIO:
 158  0000 89            	pushw	x
 159  0001 5206          	subw	sp,#6
 160       00000006      OFST:	set	6
 163                     ; 9 	direction = (configuration & 0x01);
 165  0003 7b0d          	ld	a,(OFST+7,sp)
 166  0005 a401          	and	a,#1
 167  0007 5f            	clrw	x
 168  0008 97            	ld	xl,a
 169  0009 1f01          	ldw	(OFST-5,sp),x
 171                     ; 10 	mode1     = ((configuration & 0x02)>>1);
 173  000b 7b0d          	ld	a,(OFST+7,sp)
 174  000d 44            	srl	a
 175  000e 5f            	clrw	x
 176  000f a401          	and	a,#1
 177  0011 5f            	clrw	x
 178  0012 5f            	clrw	x
 179  0013 97            	ld	xl,a
 180  0014 1f03          	ldw	(OFST-3,sp),x
 182                     ; 11 	mode2     = ((configuration & 0x04)>>2);
 184  0016 7b0d          	ld	a,(OFST+7,sp)
 185  0018 44            	srl	a
 186  0019 44            	srl	a
 187  001a 5f            	clrw	x
 188  001b a401          	and	a,#1
 189  001d 5f            	clrw	x
 190  001e 5f            	clrw	x
 191  001f 97            	ld	xl,a
 192  0020 1f05          	ldw	(OFST-1,sp),x
 194                     ; 13 	port->DDR |= (direction << pin);
 196  0022 1e07          	ldw	x,(OFST+1,sp)
 197  0024 7b0c          	ld	a,(OFST+6,sp)
 198  0026 905f          	clrw	y
 199  0028 4d            	tnz	a
 200  0029 2a02          	jrpl	L6
 201  002b 9053          	cplw	y
 202  002d               L6:
 203  002d 9097          	ld	yl,a
 204  002f 7b02          	ld	a,(OFST-4,sp)
 205  0031 905d          	tnzw	y
 206  0033 2705          	jreq	L01
 207  0035               L21:
 208  0035 48            	sll	a
 209  0036 905a          	decw	y
 210  0038 26fb          	jrne	L21
 211  003a               L01:
 212  003a ea02          	or	a,(2,x)
 213  003c e702          	ld	(2,x),a
 214                     ; 14 	port->CR1 |= (mode1 << pin);
 216  003e 1e07          	ldw	x,(OFST+1,sp)
 217  0040 7b0c          	ld	a,(OFST+6,sp)
 218  0042 905f          	clrw	y
 219  0044 4d            	tnz	a
 220  0045 2a02          	jrpl	L41
 221  0047 9053          	cplw	y
 222  0049               L41:
 223  0049 9097          	ld	yl,a
 224  004b 7b04          	ld	a,(OFST-2,sp)
 225  004d 905d          	tnzw	y
 226  004f 2705          	jreq	L61
 227  0051               L02:
 228  0051 48            	sll	a
 229  0052 905a          	decw	y
 230  0054 26fb          	jrne	L02
 231  0056               L61:
 232  0056 ea03          	or	a,(3,x)
 233  0058 e703          	ld	(3,x),a
 234                     ; 15 	port->CR2 |= (mode2 << pin);
 236  005a 1e07          	ldw	x,(OFST+1,sp)
 237  005c 7b0c          	ld	a,(OFST+6,sp)
 238  005e 905f          	clrw	y
 239  0060 4d            	tnz	a
 240  0061 2a02          	jrpl	L22
 241  0063 9053          	cplw	y
 242  0065               L22:
 243  0065 9097          	ld	yl,a
 244  0067 7b06          	ld	a,(OFST+0,sp)
 245  0069 905d          	tnzw	y
 246  006b 2705          	jreq	L42
 247  006d               L62:
 248  006d 48            	sll	a
 249  006e 905a          	decw	y
 250  0070 26fb          	jrne	L62
 251  0072               L42:
 252  0072 ea04          	or	a,(4,x)
 253  0074 e704          	ld	(4,x),a
 254                     ; 16 }
 257  0076 5b08          	addw	sp,#8
 258  0078 81            	ret
 271                     	xdef	_configureGPIO
 290                     	end
