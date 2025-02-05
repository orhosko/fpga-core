`include "../controlunit_definitions.svh"
`include "../definitions.sv"
module Immediate (
    input  logic [31:0] instruction,
    output logic [31:0] imm
);

  opcode_t OPC;
  always_comb begin
    OPC = opcode_t'(instruction[6:0]);
    OPC = (OPC == `OPC_JALR) ? I_TYPE : OPC;
  end

  always_comb begin
    casez (OPC)
      U_TYPE: begin
        imm = {instruction[31:12], 12'b0};
      end
      R_TYPE: begin
        imm = 32'd0;
      end
      I_TYPE: begin
        imm = {{20{instruction[31]}}, instruction[31:20]};
      end
      S_TYPE: begin
        imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
      end
      B_TYPE: begin
        imm = {
          {19{instruction[31]}},
          instruction[31],
          instruction[7],
          instruction[30:25],
          instruction[11:8],
          1'b0
        };
      end
      J_TYPE: begin
        imm = {
          {12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0
        };
      end
      default: begin
        imm = 32'd0;
      end
    endcase
  end
endmodule
