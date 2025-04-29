.PHONY: all clean dump hexdump riscv-test

SOURCE ?= uart-test.c
ASSEMBLE ?= 

BASENAME := $(basename $(SOURCE))
BASENAME_AS := $(basename $(ASSEMBLE))

CC = clang
AS = riscv64-linux-gnu-as

CFLAGS = --target=riscv32 -march=rv32i -mabi=ilp32 -O0 -ffreestanding -nostdlib -fno-pie -g
#CFLAGS = -march=rv32i -mabi=ilp32 -O0 -ffreestanding -nostdlib -fno-pie -nostartfiles -fno-asynchronous-unwind-tables
ASFLAGS = -march=rv32i -mabi=ilp32

LD = ld.lld
#LD = riscv64-linux-gnu-ld
LDFLAGS = -Ttext=0x80000000 -Tdata=0x80002000 -T link.ld

OBJCOPY = riscv64-linux-gnu-objcopy
OBJCOPYFLAGS = -O binary

OBJDUMP = riscv64-linux-gnu-objdump

all: $(BASENAME).mem

$(BASENAME).mem: $(SOURCE)
	$(CC) $(CFLAGS) -c $(SOURCE) -o $(BASENAME).o
	# $(CC) $(CFLAGS) -c start.c -o start.o
	$(AS) $(ASFLAGS) -c start.s -o start.s.o

	# $(AS) $(ASFLAGS) $(ASSEMBLE) -o $(BASENAME_AS).o
	# $(LD) $(LDFLAGS) $(BASENAME).o start.s.o $(BASENAME_AS).o -o $(BASENAME).elf
	$(LD) $(LDFLAGS) $(BASENAME).o start.s.o -o $(BASENAME).elf

	$(OBJCOPY) $(OBJCOPYFLAGS) $(BASENAME).elf $(BASENAME).bin
	$(OBJCOPY) $(OBJCOPYFLAGS) -j .data* -j .rodata* $(BASENAME).elf $(BASENAME).data.bin
	hexdump -v -e '1/1 "%02x\n"' $(BASENAME).bin > $(BASENAME).mem
	hexdump -v -e '1/4 "%08x\n"' $(BASENAME).data.bin > $(BASENAME).data.mem

# pass-fail: rv32ui-p/rv32ui-p-lh
# 	riscv64-linux-gnu-objcopy -O binary -j .text* ./rv32ui-p/rv32ui-p-lh rv32ui-p-lh.bin
# 	riscv64-linux-gnu-objcopy -O binary -j .data* ./rv32ui-p/rv32ui-p-lh rv32ui-p-lh.data.bin
# 	hexdump -v -e '1/1 "%02x\n"' rv32ui-p-addi.bin > rv32ui-p-addi.mem
# 	grep '<pass>:' rv32ui-p-addi.dump | awk '{print $$1}' > pass.txt
# 	grep '<fail>:' rv32ui-p-addi.dump | awk '{print $$1}' > fail.txt

clean:
	rm -f *.o *.elf *.bin *.data.bin *.mem *.dump pass.txt fail.txt

dump: $(BASENAME).elf
	$(OBJDUMP) -d $(BASENAME).elf
