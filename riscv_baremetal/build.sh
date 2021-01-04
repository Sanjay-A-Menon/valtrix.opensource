IMG_NAME=ABC
declare -a out_arr
n=1
set -o xtrace
for dir in "$@"
do
out=$(echo $dir | sed -e 's|\.s|.o|g;s|\.cpp|.o|g')
out_arr["$n"]=$out
let "n=n+1" 
case $dir in 
*.s)   riscv64-unknown-elf-g++ -x assembler-with-cpp -c -march=rv64imafdc -mcmodel=medany  -ggdb -o "$out"  "$dir" ;;
*.cpp) riscv64-unknown-elf-g++                       -c -march=rv64imafdc -mcmodel=medany -ggdb -o  "$out" "$dir" ;;
esac
done
riscv64-unknown-elf-g++ -o ${IMG_NAME}.elf -g -Xlinker -Map=output.map  -T ./linker.script -nostdlib "${out_arr[@]}"
riscv64-unknown-elf-objdump -xsD ${IMG_NAME}.elf > ${IMG_NAME}.dis

set +o xtrace

