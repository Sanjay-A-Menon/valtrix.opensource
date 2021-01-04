/*

uart_interact.s
A RISC-V assembly code to call spike/ovpsim uart function

*/

.text

.global _start
_start:

la sp, stack_end
li a0, 97
call uart_spike

loop:
j loop


.data


.balign 256
stack_start:
.space 4096
stack_end:


.end