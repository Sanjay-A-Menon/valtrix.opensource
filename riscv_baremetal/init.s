.text

.global abc

abc:
li x15, 0xc0000020
ld x14, 0(x15)
addi a0,x14,0

la x14, loop
//csrw mtvec, x14
ecall


hang:
j hang

.data

.balign 256
stack_start_uart:
.space 4096
stack_end_uart:

.end