ENTRY(_start)

MEMORY {
    INSTR_MEM (rx) : ORIGIN = 0x80000000, LENGTH = 4K  /* Instruction memory */
    DATA_MEM  (rw) : ORIGIN = 0x00000000, LENGTH = 1K   /* Data memory */
}

SECTIONS {
    /* Code and Read-Only Data */
    .text : {
        *(.text)   /* Code */
        *(.rodata) /* Read-only data */
    } > INSTR_MEM

    /* Initialized Data */
    .data : {
        *(.data)
    } > DATA_MEM AT > INSTR_MEM  /* Load in INSTR_MEM, run in DATA_MEM */

    /* Uninitialized Data (BSS) */
    .bss : {
        *(.bss)
    } > DATA_MEM

    /* Define the stack top */
    _stack_top = ORIGIN(DATA_MEM) + LENGTH(DATA_MEM);
}
