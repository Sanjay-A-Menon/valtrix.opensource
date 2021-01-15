# Tutorial 2 - Calling C functions from assembly

This tutorial explains how a function call is done from an assembly program to a C/C++ program. This is especially useful when you want to do most of the general processing on C/C++ code and also maintain the functionality of the assembly code to access and manipulate all of the memory and registers in the RISCV ecosystem.

## The code and how to build and run it!

This tutorial folder contains a RISCV assembly file(.s format), a build file and a linker script. The steps to run the code on spike is as follows:-

* ```cd tutorial_2```
* ```./build_tut2.sh```
* ``` spike -m0x80000000:0x10000000 tutorial_2.elf ```

The explanation of the code is provided along with the code as comments and a similar approach is done for the build files as well. For the Linker files you can read through the explanation down below, as and when the need arises.

**Please note** that only changes which are significant are highlighted in build and Linker explanations for all of the subsequent tutorials.

## Linker Script Explanation

This is equivalent to the one in tutorial 1. Please click here[] to go there.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

To be added.
