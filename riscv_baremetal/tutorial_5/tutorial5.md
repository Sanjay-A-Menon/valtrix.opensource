# Tutorial 5 - A tutorial for learning MMU operations and address Translation

This tutorial uses the concept of MMU to provide a method for address translation so as to provide different Virtual addresses and Physical addresses for certain memory locations so as to provide a method of abstraction for certain privilege levels other than machine mode. A page table is setup based on the the page size and accordingly the MMU is also setup by writing into the ```satp``` register.

## The code and how to build and run it!

This tutorial folder contains a RISCV assembly file(.s format), a build file and a linker script. The steps to run the code on spike is as follows:-

* ```cd tutorial_5```
* ```./build_tut5.sh```
* ``` spike -m0x80000000:0x10000000 tutorial_5.elf ```

The explanation of the code is provided along with the code as comments and a similar approach is done for the build files as well. For the Linker files you can read through the explanation down below, as and when the need arises.

**Please note** that only changes which are significant are highlighted in build and Linker explanations for all of the subsequent tutorials.

## Linker Script Explanation

This Linker script is different as compared to any we have come across so far due to the fact that you can see a section with different Physical and Virtual adresses.

Here ```SUP 0xC0000000: AT(0x80000000){}``` is for the supervisor section of the code where MMU is used to do the address translation.

**Note** - Different Physical addresses and Virtual addresses can be used only on operations running in supervisor/user mode.

The rest is same as in the previous Linker scripts you have come across so far. [Click here](https://github.com/Sanjay-A-Menon/valtrix.opensource/blob/main/riscv_baremetal/tutorial_1/tutorial1.md#linker-script-explanation) if you want to go through that again. 


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

To be added.
