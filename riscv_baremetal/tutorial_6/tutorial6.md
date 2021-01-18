# Tutorial 6 - Multiprocessor execution and concept of Locking

This tutorial explains how to run multiprocessor operations and the process of locking CPU cores so as to prevent clashes between two different processes. This tutorial uses an algorithm called Dekker's algorithm for locking up the core before entering the critical section and unlocks it after excecuting the same.

## The code and how to build and run it!

This tutorial folder contains a RISCV assembly file(.s format), a build file and a linker script. The steps to run the code on spike is as follows:-

* ```cd tutorial_6```
* ```./build_tut6.sh```
* ``` spike -m0x80000000:0x10000000 tutorial_6.elf ```

The explanation of the code is provided along with the code as comments and a similar approach is done for the build files as well. For the Linker files you can read through the explanation down below, as and when the need arises.

**Please note** that only changes which are significant are highlighted in build and Linker explanations for all of the subsequent tutorials.

## Linker Script Explanation

This is equivalent to the one in tutorial 1. Please [click here](https://github.com/Sanjay-A-Menon/valtrix.opensource/blob/main/riscv_baremetal/tutorial_1/tutorial1.md#linker-script-explanation) to go there.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

To be added.
