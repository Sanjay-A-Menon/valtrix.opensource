/*

sort.s
A RISC-V assembly program to sort an array

*/  

    .text

    .global _start
_start:

load_arr:
    la x5, arr        //Initialising a pointer to the array.
    addi x5,x5,-8


//Loop to determine the initial data, which is then compared with the rest.
outer_loop:            
       addi x5,x5,8       
       addi x13,x5,8
       ld x6,0(x5)
       beq x6, zero, print

//Loop to move through the rest of the array after the initial data point.
inner_loop:         
        ld x7, 0(x13)
        beq x7, zero, outer_loop
        bgt  x6, x7, lbl_gt
        addi x13,x13,8
        j inner_loop

//Determining which value is smaller/larger and swapping places accordingly.
 lbl_gt:
        addi x8, x6, 0
        addi x6, x7, 0
        addi x7, x8, 0
        sw x6, 0(x5)
        sw x7, 0(x13)
        addi x13,x13,8
        j inner_loop

//Function to print the sorted array
print:
        addi x8,zero,0
        addi x9,zero,8
        la sp, stack_end
again:
        la x13,arr
        mul x16, x8, x9
        add x13,x13,x16
        ld a0, 0(x13)
        call uart_spike
        addi x8,x8,1
        la x13,arr
        mul x16, x8, x9
        add x13,x13,x16
        ld a0, 0(x13)
        bne a0, zero, again

//Exiting the simulator
exit:
        la sp, stack_end
        call exit_spike


//A simple loop to hang
hang:
    j hang


    .data
    .balign 8       // else we fault

//The array to be sorted.
arr:
    .dword 67, 56, 32, 86, 99, 3, 12, 19, 33, 42, 0

.balign 256
stack_start:
.space 4096
stack_end:


    .end