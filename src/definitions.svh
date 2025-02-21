`ifndef DEFS
`define DEFS

// https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html
// https://varshaaks.wordpress.com/2021/07/19/rv32i-base-integer-instruction-set/
// https://drive.google.com/file/d/1uviu1nH-tScFfgrovvFCrj7Omv8tFtkp/view

// ----------------------------------------------------------------
//                    Immediate - I Type
// ----------------------------------------------------------------
// | 31:20 | 19:15 | 14:12  | 11:7 | 6:0     |
// |  imm  |  rs1  | funct3 |  rd  | 0010011 |

`define OPC_OP_IMM 7'b0010011

`define FN3_ADDI 3'b000
`define FN3_SLTI 3'b010
`define FN3_SLTIU 3'b011
`define FN3_XORI 3'b100
`define FN3_ORI 3'b110
`define FN3_ANDI 3'b111

// ----------------------------------------------------------------
//                   Upper Immediate - U Type
// ----------------------------------------------------------------
// | 31:12 | 11:7 | 6:0    |
// |  imm  |  rd  | opcode |

`define OPC_LUI 7'b0110111
`define OPC_AUIPC 7'b0010111

// | 31:27  | 26:25 | 24:20 | 19:15 | 14:12  | 11:7 | 6:0     |
// | 000000 | 0x    | shamt | rs1   | funct3 |  rd  | 0010011 |

// OPC_OP_IMM
`define IMM_SLLI_SRLI 6'b000000

`define FN3_SLLI 3'b001
`define FN3_SRLI 3'b101

// | 31:27  | 26:25 | 24:20 | 19:15 | 14:12  | 11:7 | 6:0     |
// | 010000 | 0x    | shamt | rs1   | funct3 |  rd  | 0010011 |

`define IMM_SRAI 6'b010000
`define FN3_SRAI 3'b101

// ----------------------------------------------------------------
//              Register to Register - R Type
// ----------------------------------------------------------------
// | 31:27  | 26:25 | 24:20 | 19:15 | 14:12  | 11:7 | 6:0     |
// | funct7 | 00    | rs2   | rs1   | funct3 |  rd  | 0110011 |

`define OPC_OP 7'b0110011

`define FN7_ADD 7'b0000000
`define FN3_ADD 3'b000

`define FN7_SUB 7'b0100000
`define FN3_SUB 3'b000

`define FN7_SLL 7'b0000000
`define FN3_SLL 3'b001

`define FN7_SLT 7'b0000000
`define FN3_SLT 3'b010

`define FN7_SLTU 7'b0000000
`define FN3_SLTU 3'b011

`define FN7_XOR 7'b0000000
`define FN3_XOR 3'b100

`define FN7_SRL 7'b0000000
`define FN3_SRL 3'b101

`define FN7_SRA 7'b0100000
`define FN3_SRA 3'b101

`define FN7_OR 7'b0000000
`define FN3_OR 3'b110

`define FN7_AND 7'b0000000
`define FN3_AND 3'b111

// ----------------------------------------------------------------
//                       NOP Instruction
//                   same as ADDI x0, x0, 0
// ----------------------------------------------------------------

// ----------------------------------------------------------------
//                       Jump - J Type
// ----------------------------------------------------------------
// | 31      | 30:21     | 20      | 19:12      | 11:7       | 6:0     |
// | imm[20] | imm[10:1] | imm[11] | imm[19:12] | rd         | opcode  |

`define OPC_JAL 7'b1101111
`define OPC_JALR 7'b1100111 // uses I_TYPE encoding

// ----------------------------------------------------------------
//                       Branch - B Type
// ----------------------------------------------------------------
// | 31      | 30:25     | 24:20 | 19:15 | 14:12  | 11:8     | 7       | 6:0     |
// | imm[12] | imm[10:5] | rs2   | rs1   | funct3 | imm[4:1] | imm[11] | 1100011 |

`define OPC_BRANCH 7'b1100011

`define FN3_BEQ 3'b000
`define FN3_BNE 3'b001
`define FN3_BLT 3'b100
`define FN3_BGE 3'b101
`define FN3_BLTU 3'b110
`define FN3_BGEU 3'b111

// ----------------------------------------------------------------
//                      Load Store - S Type
// ----------------------------------------------------------------

// | 31:25     | 24:20 | 19:15 | 14:12  | 11:7     | 6:0     |
// | imm[11:5] | rs2   | rs1   | funct3 | imm[4:0] | 0100011 |

`define OPC_STORE 7'b0100011

`define FN3_SB 3'b000
`define FN3_SH 3'b001
`define FN3_SW 3'b010

// | 31:20        | 19:15 | 14:12  | 11:7     | 6:0     |
// | offset[11:0] | rs2   | rs1    | funct3   | 0000011 |

`define OPC_LOAD 7'b0000011

`define FN3_LB 3'b000
`define FN3_LH 3'b001
`define FN3_LW 3'b010
`define FN3_LBU 3'b100
`define FN3_LHU 3'b101

// ----------------------------------------------------------------
//                       Memory Ordering
// ----------------------------------------------------------------

// | 31:28 | 27:24 | 23:20 | 19:15 | 14:12  | 11:7  | 6:0      |
// | fm    | pred  | succ  | 00000 | funct3 | 00000 | 0001111  |
// pred -> PI PO PR PW
// succ -> SI SO SR SW
// I-type

`define OPC_FENCE 7'b0001111
`define FN3_FENCE 3'b000

`define FM_FENCE_TSO 4'b1000
`define PRED_FENCE_TSO 4'b0011
`define SUCC_FENCE_TSO 4'b0011

// ----------------------------------------------------------------
//                 Environment Call and Breakpoints
// ----------------------------------------------------------------

// | 31:20  | 19:15 | 14:12 | 11:7  | 6:0     |
// | funct12 | 00000 | priv  | 00000 | 1110011 |

`define OPC_SYSTEM 7'b1110011
`define FN12_ECALL 12'b000000000000
`define FN12_EBREAK 12'b000000000001
`define FN12_MRET 12'b001100000010
`define FN12_SRET 12'b000100000010

// ----------------------------------------------------------------
//                 CSR
// ----------------------------------------------------------------

// | 31:20  | 19:15 | 14:12 | 11:7  | 6:0     |
// | csr    | rs1   | fn3   | rd    | 1110011 |

`define OPC_CSR 7'b1110011

`define FN3_PRIV 3'b000
`define FN3_CSRRW 3'b001
`define FN3_CSRRS 3'b010
`define FN3_CSRRC 3'b011
`define FN3_CSRWI 3'b101
`define FN3_CSRSI 3'b110
`define FN3_CSRCI 3'b111

`endif
