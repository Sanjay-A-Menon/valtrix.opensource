/*

test_calls.s
RISC-V assembly code to call C function

*/


.text

.global _start

_start:

la sp, stack_end   //Stack pointer initialisation
li a0,3
li a1,4 
call test          //Calling C++ function

loop:
j loop


.data

//Initialising stack
.balign 256
stack_start:
.space 4096
stack_end:

.end