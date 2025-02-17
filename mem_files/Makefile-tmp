.PHONY: all clean dump hexdump riscv-test

all: add.mem

assemble: add2.s
	riscv64-linux-gnu-as add2.s -o add2.o
	riscv64-linux-gnu-objcopy -O binary add2.o add2.bin
	hexdump -v -e '1/1 "%02x\n"' add2.bin > add2.mem

add.mem: add.c
	clang --target=riscv32 -march=rv32i -mabi=ilp32 -O3 -ffreestanding -nostdlib -fno-pie -c add.c -o add.o
	ld.lld -Ttext=0x80000000 -Tdata=0x80002000 add.o -o add.elf
	riscv64-linux-gnu-objcopy -O binary add.elf add.bin
	riscv64-linux-gnu-objcopy -O binary -j .data* add.elf add.data.bin
	hexdump -v -e '1/1 "%02x\n"' add.bin > add.mem

riscv-test: rv32ui-p-addi
	riscv64-linux-gnu-objcopy -O binary rv32ui-p-addi rv32ui-p-addi.bin
	riscv64-linux-gnu-objcopy -O binary -j .data* rv32ui-p-addi rv32ui-p-addi.data.bin
	hexdump -v -e '1/1 "%02x\n"' rv32ui-p-addi.bin > rv32ui-p-addi.mem
	grep '<pass>:' rv32ui-p-addi.dump | awk '{print $$1}' > pass.txt
	grep '<fail>:' rv32ui-p-addi.dump | awk '{print $$1}' > fail.txt

riscv-test2: rv32ui-p/rv32ui-p-lh
	riscv64-linux-gnu-objcopy -O binary -j .text* ./rv32ui-p/rv32ui-p-lh rv32ui-p-lh.bin
	riscv64-linux-gnu-objcopy -O binary -j .data* ./rv32ui-p/rv32ui-p-lh rv32ui-p-lh.data.bin
	hexdump -v -e '1/1 "%02x\n"' rv32ui-p-addi.bin > rv32ui-p-addi.mem
	grep '<pass>:' rv32ui-p-addi.dump | awk '{print $$1}' > pass.txt
	grep '<fail>:' rv32ui-p-addi.dump | awk '{print $$1}' > fail.txt


dump: add.o
	riscv64-linux-gnu-objdump -d add.elf

hexdump: add.bin
	hexdump add.bin

clean:
	rm -f add.o add.bin add.mem add2.o add2.bin add2.mem
