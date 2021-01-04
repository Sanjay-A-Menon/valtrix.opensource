/*

hang.s
A RISC-V assembly code simulating supervisor level access

*/

    .text

    .global _sup

_sup:

//Line below will cause fault
    li x14,3


    .data
    
    .end
