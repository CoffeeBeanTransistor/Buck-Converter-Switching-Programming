# Microcontroller-controlled SMPS Synchronous Buck Converter

## Description
This project is about designing a switched-mode power supply synchronous buck converter that is controlled by STM8S103F3P6 microcontroller. 
It is an intelligent buck converter because it uses the microcontroller to vary the switching frequency and duty cycle dynamically to the desired voltage or current. There are 2 MOSFETs controlling the low side and high side synchronously by using a gate driver IR2101. The feedback mechanism is designed based on the typical B3603 feedback mechanism. It also has over-current current/voltage protection to turn the system off when the voltage/current exceeds the threshold.

## Apparatus
