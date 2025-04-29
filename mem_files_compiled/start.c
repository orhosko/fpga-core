#include <stdint.h>

/* Linker-defined symbols */
extern uint32_t _stack_top;
extern uint32_t _data_lma, _data_vma, _data_end;
extern uint32_t _bss_start, _bss_end;

void start(void) __attribute__((naked, section(".text")));

extern void main(void);

void _start(void) {
    /* Set up stack pointer */
    asm volatile("la sp, _stack_top");

    /* Copy .data from INSTR_MEM to DATA_MEM */
    uint32_t *src = &_data_lma;
    uint32_t *dst = &_data_vma;
    while (dst < &_data_end) {
        *dst++ = *src++;
    }

    /* Zero out .bss */
    uint32_t *bss = &_bss_start;
    while (bss < &_bss_end) {
        *bss++ = 0;
    }

    /* Call main() */
    main();

    /* If main() returns, loop forever */
    while (1);
}
