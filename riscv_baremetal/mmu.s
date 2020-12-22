.text

.global _start

_start:

la x14, loop
csrw stvec, x14
la sp, stack_end
call pg_populate

la x14, pg_lvl
sra x14, x14 ,12
csrw satp , x14
li x14, 0x8000000000000000
csrs satp, x14

li x15,3
li x14, 0x80000020 
sw x15, 0(x14)  

li x14, 0x0000000000000800
csrs mstatus, x14
la x14, abc
csrw mepc, x14
mret

.global come_here

come_here:
la sp, stack_end
call uart

.global loop

loop:
j loop


.data
.global arr

 arr:
.balign 8
.dword 12

.balign 256
stack_start:
.space 4096
stack_end:

.end