OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS {
    . = 0x80000000;  /* Start of RAM */

    .text : {
        *(.text.start)
        *(.text)
    }

    .data : {
        *(.data)
        *(.rodata)
        *(.sdata)
    }

    .eh_frame : {
        KEEP(*(.eh_frame))
    }
    
    /* Stack at top of RAM */
    _stack_top = 0x80003000;
}

