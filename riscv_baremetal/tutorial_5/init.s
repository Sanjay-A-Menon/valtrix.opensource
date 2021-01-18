.text

.global abc

abc:
la sp, stack_end_uart
li x15, 0xc0000020 //Reading value from translated memory address(0x80000020)
ld x14, 0(x15)
addi a0, x14, 0

//Returning back to machine mode
ecall


hang:
j hang

.data

.balign 256
stack_start_uart:
.space 4096
stack_end_uart:

.end