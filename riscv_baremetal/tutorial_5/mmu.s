/*

mmu.s
A RISC-V assembly code to create and Simulate operations 
with MMU turned on.

*/

.text

.global _start

_start:

//Page table creation happens here
la x14, come_here
csrw mtvec, x14
la sp, stack_end
call pg_populate

//MMU turned ON here
la x14, pg_lvl
sra x14, x14 ,12
csrw satp , x14
li x14, 0x8000000000000000
csrs satp, x14

//Storing value at an address in memory
li x15,3
li x14, 0x80000020 
sw x15, 0(x14)  

li x14, 0x0000000000000800
csrs mstatus, x14
la x14, abc
csrw mepc, x14
mret

.global come_here

//Printing output
.balign 8
come_here:
la sp, stack_end
call uart_spike
call exit_spike


.data

.balign 256
stack_start:
.space 4096
stack_end:

.end