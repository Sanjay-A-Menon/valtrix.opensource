IMG_NAME=tutorial_5

set -o xtrace
riscv64-unknown-elf-g++ -x assembler-with-cpp -c -march=rv64imafdc -mcmodel=medany  -ggdb -o ./mmu.o ./mmu.s
riscv64-unknown-elf-g++ -x assembler-with-cpp -c -march=rv64imafdc -mcmodel=medany  -ggdb -o ./init.o ./init.s
riscv64-unknown-elf-g++                       -c -march=rv64imafdc -mcmodel=medany -ggdb -o  ./mmu_cpp.o ./mmu_cpp.cpp
riscv64-unknown-elf-g++                       -c -march=rv64imafdc -mcmodel=medany -ggdb -o  ./uart.o ../common_files/uart.cpp
riscv64-unknown-elf-g++ -o ${IMG_NAME}.elf -g -Xlinker -Map=output.map  -T ./linker_tut5.script -nostdlib ./mmu.o ./mmu_cpp.o ./init.o ./uart.o
riscv64-unknown-elf-objdump -xsD ${IMG_NAME}.elf > ${IMG_NAME}.dis

set +o xtrace

