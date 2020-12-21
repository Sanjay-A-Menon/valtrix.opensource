    .text

    .global _start
_start:
    //li  x10, 1
   // li  x11, 33
   // add x10, x10, x11


load_arr:
    la x5, arr

    addi x5,x5,-8

outer_loop:
    addi x5,x5,8
    addi x13,x5,8
    ld x6,0(x5)
    beq x6, zero, hang
    //addi x5,x5,8

inner_loop:
    ld x7, 0(x13)
    beq x7, zero, outer_loop
    bgt  x6, x7, lbl_gt
    addi x13,x13,8
    j inner_loop


 lbl_gt:
        addi x8, x6, 0
        addi x6, x7, 0
        addi x7, x8, 0
        sw x6, 0(x5)
        sw x7, 0(x13)
        addi x13,x13,8
        j inner_loop

        
 //lbl_lt:

  //  j lo


//my_func:
//dfg
//sdfg


//    ret




hang:
    j hang


    .data
    .balign 8       // else we fault
arr:
    .dword 67, 56, 32, 86, 99, 3, 12, 19, 33, 42, 0


    .end
