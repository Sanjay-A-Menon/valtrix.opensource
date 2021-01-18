# Tutorial 3 - Calling C functions from assembly

This tutorial explains how the UART functionality works and as a proof of concept is done with the help of the UART functionality in the SPIKE simulator. This is especially useful when you want to do debugging within a piece of code wherein you could use this to create checkpoints by printing with the UART functionality. 

## The code and how to build and run it!

This tutorial folder contains a RISCV assembly file(.s format), a build file and a linker script. The steps to run the code on spike is as follows:-

* ```cd tutorial_3```
* ```./build_tut3.sh```
* ``` spike -m0x80000000:0x10000000 tutorial_3.elf ```

The explanation of the code is provided along with the code as comments and a similar approach is done for the build files as well. For the Linker files you can read through the explanation down below, as and when the need arises.

**Please note** that only changes which are significant are highlighted in build and Linker explanations for all of the subsequent tutorials.

## Linker Script Explanation

This is equivalent to the one in tutorial 1. Please [click here](https://github.com/Sanjay-A-Menon/valtrix.opensource/blob/main/riscv_baremetal/tutorial_1/tutorial1.md#linker-script-explanation) to go there.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

To be added.
