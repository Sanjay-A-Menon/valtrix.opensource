/*

change_mode.s
A RISC-V assembly code to change accessibility modes

*/


    .text
   

    .global _start
_start:

/*Setting up mstatus and mepc registers for
   switching to Supervisor mode  */

li x14, 0x0000000000000800
csrs mstatus, x14
la x14, _sup
csrw mepc, x14
li x14,0x0000000000000004
csrs mepc, x14

//mtvec register is made to point to a label for handling traps
la x14, loop
csrw mtvec, x14

//Switch happens here
mret
 

.balign 8
loop:
j loop

    .data

    .end
