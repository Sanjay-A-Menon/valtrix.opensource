.text

.global _start

_start:

csrr a0,mhartid

//Assigning stack pointers for individual CPU's
la x13, stack_start
li x14, 1024
addi x16,a0,1
mul x14,x14, x16
add x13, x13, x14
addi sp, x13, 0


//Assigning mhartid value to corresponding flag indices
la x14, flag
li x16, 8  
mul x15, x16, a0
add x14,x14,x15
sw a0, 0(x14)


//CPU check
la x14, flag
hang:
ld x15, 0(x14)
bne x15, a0, hang

//Calling UART: critical section
call uart

//Assigning values for the next CPU
csrr a0,mhartid
la x15, flag
li x16, 8  
addi a0, a0, 1
mul x16, x16, a0
la x14, flag
add x14, x14, x16
ld x16, 0(x14)
sw x16, 0(x15)


li x14, 4
beq a0 , x14, exit

loop:
j loop

exit:
call sting_exit_fesvr


.data


.balign 8
flag:
.space 64

.balign 256
stack_start:
.space 4096
stack_end:

.end