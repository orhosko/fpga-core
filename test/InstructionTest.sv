`include "definitions.sv"

`define FOR_TESTCASE1(DO)   \
   `DO(0, 32'd123)  \
   `DO(0, 122)      \
   `DO(0, `FN3_BEQ) \
   `DO(0, `FN3_BNE) \
   `DO(0, `FN3_BLT) \
   `DO(0, `FN3_BGE)

module InstructionTest;

  initial begin

    `define CREATE_TESTCASE1(unused, a) if(a==a) begin $display("a=%d",a); end
    `FOR_TESTCASE1(CREATE_TESTCASE1)

  end

  logic [31:0] instruction;
  logic        clk;
  logic [ 4:0] RF_rsel1;
  logic [ 4:0] RF_rsel2;
  logic [ 4:0] RF_wsel;
  logic        RF_wen;
  logic        branch_taken;
  logic        DM_wen;
  logic [ 1:0] RF_data_in_sel;
  logic        ALU_arg_1_sel;
  logic        ALU_arg_2_sel;
  logic [ 3:0] ALU_opcode;

  ControlUnit cu (
      .instruction(instruction),
      .clk(clk),
      .RF_rsel1(RF_rsel1),
      .RF_rsel2(RF_rsel2),
      .RF_wsel(RF_wsel),
      .RF_wen(RF_wen),
      .branch_taken(branch_taken),
      .DM_wen(DM_wen),
      .RF_data_in_sel(RF_data_in_sel),
      .ALU_OP1_SEL(ALU_arg_1_sel),
      .ALU_OP2_SEL(ALU_arg_2_sel),
      .ALU_Operation(ALU_opcode)
  );

endmodule
