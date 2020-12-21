IMG_NAME=ABC

set -o xtrace 

riscv64-unknown-elf-g++ -x assembler-with-cpp -c -march=rv64imafdc -mcmodel=medany  -ggdb -o build/mmu.o src/mmu.s
riscv64-unknown-elf-g++ -x assembler-with-cpp -c -march=rv64imafdc -mcmodel=medany  -ggdb -o build/init.o src/init.s
riscv64-unknown-elf-g++                       -c -march=rv64imafdc -mcmodel=medany -ggdb -o build/mmu_cpp.o src/mmu_cpp.cpp
riscv64-unknown-elf-g++                       -c -march=rv64imafdc -mcmodel=medany -ggdb -o build/uart.o src/uart.cpp
riscv64-unknown-elf-g++ -o ${IMG_NAME}.elf -g -Xlinker -Map=output.map  -T src/linker.script -nostdlib build/mmu.o build/uart.o build/init.o build/mmu_cpp.o
riscv64-unknown-elf-objdump -xsD ${IMG_NAME}.elf > ${IMG_NAME}.dis

set +o xtrace
