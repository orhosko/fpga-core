.PHONY: all clean dump hexdump

all: add.mem

assemble: add2.s
	riscv64-linux-gnu-as add2.s -o add2.o
	riscv64-linux-gnu-objcopy -O binary add2.o add2.bin
	hexdump -v -e '1/1 "%02x\n"' add2.bin > add2.mem

add.mem: add.c
	clang --target=riscv32 -march=rv32i -mabi=ilp32 -O3 -ffreestanding -nostdlib -c add.c -o add.o
	riscv64-linux-gnu-objcopy -O binary add.o add.bin
	hexdump -v -e '1/1 "%02x\n"' add.bin > add.mem

dump: add.o
	riscv64-linux-gnu-objdump -d add.o

hexdump: add.bin
	hexdump add.bin

clean:
	rm -f add.o add.bin add.mem add2.o add2.bin add2.mem
