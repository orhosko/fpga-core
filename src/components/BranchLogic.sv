`include "../definitions.sv"
module BranchLogic (
    input logic [2:0] branch_cond,
    input logic [31:0] rdata1,
    input logic [31:0] rdata2,
    output logic branch
);

  always_comb begin
    unique case (branch_cond)
      `FN3_BEQ:  branch = rdata1 == rdata2;
      `FN3_BNE:  branch = rdata1 != rdata2;
      `FN3_BLT:  branch = $signed(rdata1) < $signed(rdata2);
      `FN3_BGE:  branch = $signed(rdata1) >= $signed(rdata2);
      `FN3_BLTU: branch = $unsigned(rdata1) < $unsigned(rdata2);
      `FN3_BGEU: branch = $unsigned(rdata1) >= $unsigned(rdata2);
      default:   branch = 0;
    endcase
  end
endmodule
