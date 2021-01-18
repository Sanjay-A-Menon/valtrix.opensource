# valtrix.opensource

This is a space for providing Open source tutorials for RISCV enthusiasts. This tutorial introduces you to the concept of RISCV programming with just a few tutorial sections which contains simple and easy to understand pieces of code with all steps and procedures to replicate the same on your system.

## Setting up

This tutorial assumes that you have [spike](https://github.com/riscv/riscv-isa-sim) or any RISCV simulator up and running on your system. Clone this repositiory on your system and just follow the instructions provided inside.

## Usage

- Following the tutorial step by step starting with the first one is recommended for **beginners**. You are also requested to go through the RISCV assembly explanation given [here](https://github.com/Sanjay-A-Menon/valtrix.opensource/edit/main/README.md#General-RISCV-Assembly-Explanation).
- For people with a bit of RISCV programming experience could just look into parts of the tutorial of interest to them.

## General RISCV Assembly Explanation

- The RISCV assembly file(.s format) is subdivided into different sections. 
- Some sections are exclusively for providing comments(```.text``` section) and some are for storing only data(```.data``` section).
- There are a few other section labels which you could come across and are listed down below with their corresponding explanations :-
    - ```.global``` - This indicates that the code below can be called from anywhere and/or is available globally.
    - ```.balign``` - This is called the Byte align operation and is required for aligning memory and is required when you are writing into register/memory areas so that the data aligns properly. For eg:- ```.balign 8``` aligns the underlying operation by 8 Bytes.
    - ```.space```  - This operation is used for allocating memory in bytes. For eg:- ```.space 4096``` allocates 4KB of memory.
 
 **Please note** that this only helps you in reading through the piece of code. It is recommended that you go through the [RISCV ISA Specification](https://riscv.org/technical/specifications/) and [this](https://inst.eecs.berkeley.edu/~cs61c/sp19/lectures/lec05.pdf) introductory lecture from Berkeley EECS for more detailed explanation.
 
## Acknowledgements

- [OVPsim](https://github.com/riscv/riscv-ovpsim) and [SPIKE](https://github.com/riscv/riscv-isa-sim) for their contributions to RISCV without which this tutorial would never have been possible.

- [Sanjay A Menon](https://github.com/Sanjay-A-Menon) for creating this tutorial.

- All employees at [Valtrix Sytems](https://www.valtrix.in/) for their valuable feedback and help.



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

To be added.

## TODO

- Create a way to run the same code on OVPsim.
- Add more tutorial code.
- Code cleanup
