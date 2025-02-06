.PHONY: all clean dump hexdump

all: add.mem

assemble: add2.s
	riscv64-linux-gnu-as add2.s -o add2.o
	riscv64-linux-gnu-objcopy -O binary add2.o add2.bin
	hexdump -v -e '1/1 "%02x\n"' add2.bin > add2.mem

add.mem: add.c
	clang --target=riscv32 -march=rv32i -mabi=ilp32 -O3 -ffreestanding -nostdlib -fno-pie -c add.c -o add.o
	ld.lld -Ttext=0x80000000 -Tdata=0x0 add.o -o add.elf
	riscv64-linux-gnu-objcopy -O binary add.elf add.bin
	hexdump -v -e '1/1 "%02x\n"' add.bin > add.mem

dump: add.o
	riscv64-linux-gnu-objdump -d add.elf

hexdump: add.bin
	hexdump add.bin

clean:
	rm -f add.o add.bin add.mem add2.o add2.bin add2.mem
