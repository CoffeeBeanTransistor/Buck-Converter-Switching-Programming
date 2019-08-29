# Microcontroller-controlled SMPS Synchronous Buck Converter

## Contents
1. [Description](#des)

## <a name="des"></a> Description
This project is about designing a switched-mode power supply synchronous buck converter that is controlled by STM8S103F3P6 microcontroller. 
It is an intelligent buck converter because it uses the microcontroller to vary the switching frequency and duty cycle dynamically to the desired voltage or current. There are 2 MOSFETs controlling the low side and high side synchronously by using a gate driver IR2101. The feedback mechanism is designed based on the typical B3603 feedback mechanism. It also has over-current current/voltage protection to turn the system off when the voltage/current exceeds the threshold.

## Features
- [x] Controllable by microcontroller 
- [x] Over current/voltage protection

## Requirements
**Hardware**
- 1 x STM8S103F3P6 Microcontroller
- 1 x STM32F103 Blue Pill Microcontroller
- 1 x IR2101 Gate Driver
- 2 x STP80NF70 N-Channel MOSFETs
- 1 x LM7805 Voltage Regulator
- 1 x LM1117 3V3 LDO
- 2 x 2kΩ Trimpots
- 2 x LM311N Op-Amp Comparators
- 1 x 74HCT08 Quad 2-Input AND Gates
- 2 x C106D SCRs
- 1 x 1N400 Zener Diode
- 1 x Tactile Button
- 1 x 47uF Electrolytic Bootstrap Capacitor 
- 1 x 100uF Electrolytic Output Capacitor
- 3 x 1000uF Electrolytic Input Capacitors
- 5 x 1Ω Current Sense Resistors
- 4 x 2pF Ceramic Capacitors

**Software**
- ST Visual Develop IDE
- Cosmic CXSTM8 Compiler
