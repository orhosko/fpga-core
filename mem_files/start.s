.section .text
.global _start

_start:
    la sp, _stack_top   # Set up stack pointer

    # Copy .data section from INSTR_MEM to DATA_MEM
    la a0, _data_lma    # Load address of initialized data in INSTR_MEM
    la a1, _data_vma    # Load destination address in DATA_MEM
    la a2, _data_vma_end  # End of .data section

1:
    lw  a3, 0(a0)       # Load word from INSTR_MEM
    sw  a3, 0(a1)       # Store word in DATA_MEM
    addi a0, a0, 4      # Increment source pointer
    addi a1, a1, 4      # Increment destination pointer
    blt  a1, a2, 1b     # Loop until done

    call main           # Call main function
    j .                # Infinite loop after main

.section .data
_data_lma = LOADADDR(.data);
_data_vma = ADDR(.data);
_data_vma_end = ADDR(.data) + SIZEOF(.data);
