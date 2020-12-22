.text

.global _start

_start:


csrr a0,mhartid
la x13, stack_start
li x14, 1024
addi x16,a0,1
mul x14,x14, x16
add x13, x13, x14
addi sp, x13, 0


li t0,1

la x18, lock
again:
ld t1, (x18)
bnez t1, again
amoswap.d.aq t1,t0, (x18)
bnez t1, again

csrr a0,mhartid
call uart

amoswap.d.rl x0,x0, (x18)

loop:
j loop



.data

.balign 8
lock:
.dword 0

.balign 256
stack_start:
.space 4096
stack_end:

.end