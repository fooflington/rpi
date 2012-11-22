.section .init
.globl _start
_start:
b main

.section .text
main:
mov sp,#0x8000

pinNum .req r0
pinFunc .req r1
mov pinNum,#16
mov pinFunc,#1
bl SetGpioFunction
.unreq pinNum
.unreq pinFunc


myval .req r4
mov myval,#0

loop$:
	eor myval,#1 /* invert myval */
	pinNum .req r0
	pinVal .req r1
	mov pinNum,#16
	mov pinVal,myval
	bl SetGpio
	.unreq pinNum
	.unreq pinVal

	ldr r0,=2000000 /* 0.5 seconds */
	bl Wait /* call Wait with r0 microseconds */
	b loop$
