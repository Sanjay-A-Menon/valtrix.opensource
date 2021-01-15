# Tutorial 1 - Sorting an array

This is an introductory tutorial on learning the basics of RISCV assembly programming and extending it with additional C/C++ code. THe code in this tutorial takes in a simple unsorted array of a fixed size and sorts it using the bubble sort algorithm. We have chosen bubble sort approach due to the simplicity of the algorithm, as our intention is not to teach sorting but the basics of RISCV programming.

## The code and how to build and run it!

This tutorial folder contains a RISCV assembly file(.s format), a build file and a linker script. The steps to run the code on spike is as follows:-

* ```cd tutorial_1```
* ```./build_tut1.sh```
* ``` spike -m0x80000000:0x10000000 tutorial_1.elf ```

The explanation of the code is provided along with the code as comments and a similar approach is done for the build files as well. For the Linker files you can read through the explanation down below, as and when the need arises.

**Please note** that only changes which are significant are highlighted in build and Linker explanations for all of the subsequent tutorials.

## Linker Script Explanation

```bash
ENTRY("_start")
```
This line of code denotes a starting of a linker script file. This is a very important keyword as it denotes the place from which the actual code starts denoted by the label "_start". The point to note is that the label given here can be anything, but should be present somewhere on the code been compiled.


```bash
SECTIONS
{
    BOOTUP_0 0x80000000: AT(0x80000000)
    {
        */sort.o(*)
        */uart.o(*)
    }
}
```
- This part of the linker code gives the programmer the power and control over the memory mapping of their code and how and which parts of the code are to be mapped. 
- The ```SECTIONS{}``` entitiy contains the different sections denoted here by ```BOOTUP_0 0x80000000: AT(0x80000000){}``` where the hex values are ```<Virtual address>: AT(<Physical address>)```. 
- This becomes particularly useful when the code is run on supervisor/user mode where the code need not interfere with the actual physical memory so as to create a sense of abstraction.
- Each section contains all the object files to be put in a memory address, along with what all inside the files to consider. For eg:- ```*/uart.o(.text .data)``` will add only the text and data parts of the file to the section, whereas ```*/uart.o(*)``` will add all of the parts inside the file.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

To be added.
