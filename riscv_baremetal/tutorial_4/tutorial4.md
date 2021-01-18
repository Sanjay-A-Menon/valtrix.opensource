# Tutorial 4 - Switching modes in RISCV

This tutorial explains how a mode switching operation is done in a RISCV core. A RISCV core can operate in 3 different modes such as the machine mode, supervisor mode and the user mode. The modes are arranged here in the decreasing order of privilege, with machine mode having the highest privilege. 

Here we a demonstrate a switch from machine mode to supervisor mode and the fault caused when trying to do higher privilege operations in supervisor mode. A method to handle such faults are also taken up in this tutorial.

## The code and how to build and run it!

This tutorial folder contains a RISCV assembly file(.s format), a build file and a linker script. The steps to run the code on spike is as follows:-

* ```cd tutorial_4```
* ```./build_tut4.sh```
* ``` spike -d -m0x80000000:0x10000000 tutorial_4.elf ```

The explanation of the code is provided along with the code as comments and a similar approach is done for the build files as well. For the Linker files you can read through the explanation down below, as and when the need arises.

**Please note** that only changes which are significant are highlighted in build and Linker explanations for all of the subsequent tutorials.

## Linker Script Explanation

This is equivalent to the one in tutorial 1. Please [click here](https://github.com/Sanjay-A-Menon/valtrix.opensource/blob/main/riscv_baremetal/tutorial_1/tutorial1.md#linker-script-explanation) to go there.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

To be added.
