`include "definitions.svh"

`ifndef CONTROLUNIT_DEFS
`define CONTROLUNIT_DEFS

`define RF_WDATA_SEL_PC 2'b00
`define RF_WDATA_SEL_ALU 2'b01
`define RF_WDATA_SEL_DM 2'b10
`define RF_WDATA_SEL_CSR 2'b11

`define ALU_OP1_SEL_REG 1'b0
`define ALU_OP1_SEL_PC 1'b1
`define ALU_OP2_SEL_REG 1'b0
`define ALU_OP2_SEL_IMM 1'b1

`define BRANCH_SEL_PC 1'b0
`define BRANCH_SEL_ALU 1'b1

`define CSR_SEL_RS1 1'b0
`define CSR_SEL_IMM 1'b1

typedef enum logic [6:0] {
  R_TYPE = `OPC_OP,
  I_TYPE = `OPC_OP_IMM,
  J_TYPE = `OPC_JAL,  // `OPC_JALR uses I_TYPE encoding
  _JALR_TYPE = `OPC_JALR,
  U_TYPE = 7'b0?10111,  // `OPC_LUI, `OPC_AUIPC
  B_TYPE = `OPC_BRANCH,
  S_TYPE = 7'b0?00011,  // `OPC_STORE, `OPC_LOAD
  CSR_TYPE = 7'b1110011
} opcode_t;

`endif
