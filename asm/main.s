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

mov r2,#0x3F0000
wait1$:
sub r2,#1
cmp r2,#0
bne wait1$

b loop$
