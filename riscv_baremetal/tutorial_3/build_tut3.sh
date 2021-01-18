IMG_NAME=tutorial_3

set -o xtrace
riscv64-unknown-elf-g++ -x assembler-with-cpp -c -march=rv64imafdc -mcmodel=medany  -ggdb -o ./uart_interact.o ./uart_interact.s
riscv64-unknown-elf-g++                       -c -march=rv64imafdc -mcmodel=medany -ggdb -o  ./uart.o ../common_files/uart.cpp
riscv64-unknown-elf-g++ -o ${IMG_NAME}.elf -g -Xlinker -Map=output.map  -T ./linker_tut3.script -nostdlib ./uart_interact.o ./uart.o
riscv64-unknown-elf-objdump -xsD ${IMG_NAME}.elf > ${IMG_NAME}.dis

set +o xtrace

