    .text
   

    .global _start
_start:

//li x14, 0x0000000000000800
//csrs mstatus, x14
//la x14, hang
//csrw mepc, x14
//li x14,0x0000000000000004
//csrs mepc, x14

//la x14, hang
//csrw mtvec, x14
//mret
 
la sp, stack_end
li a0,1
li a1,2 
call hang
addi x6, a0, 0

loop:
j loop

    .data
//    .balign 8        else we fault
//arr:
//    .dword 67, 56, 32, 86, 99, 3, 12, 19, 33, 42, 0

    stack_start:
    
    .balign 256
    .space 4096

    stack_end:

    .end
