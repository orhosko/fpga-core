`include "../controlunit_definitions.svh"
`include "../alu_definitions.svh"

module Core (
    input wire clk,
    output logic [5:0] leds
);

  logic [31:0] program_counter = 32'h80000000;

  logic [31:0] instruction;
  logic [ 4:0] RF_rsel1;
  logic [ 4:0] RF_rsel2;
  logic [ 4:0] RF_wsel;
  logic        RF_wen;
  logic        branch_taken;
  logic        DM_wen;
  logic [ 1:0] RF_wdata_sel;
  logic        ALU_OP1_SEL;
  logic        ALU_OP2_SEL;
  logic [ 3:0] ALU_Operation;
  logic [ 2:0] branch_condition;

  ControlUnit cu (
      .instruction(instruction),
      .clk(clk),
      .RF_rsel1(RF_rsel1),
      .RF_rsel2(RF_rsel2),
      .RF_wsel(RF_wsel),
      .RF_wen(RF_wen),
      .branch_condition(branch_condition),
      .DM_wen(DM_wen),
      .RF_wdata_sel(RF_wdata_sel),
      .ALU_OP1_SEL(ALU_OP1_SEL),
      .ALU_OP2_SEL(ALU_OP2_SEL),
      .ALU_Operation(ALU_Operation)
  );


  logic [31:0] RF_wdata;
  assign RF_wdata = (RF_wdata_sel == `RF_WDATA_SEL_PC) ? program_counter + 4 :
                          (RF_wdata_sel == `RF_WDATA_SEL_ALU) ? ALU_OUT :
                          (RF_wdata_sel == `RF_WDATA_SEL_DM) ? DM_OUT : 32'h0;
  logic [31:0] RF_rdata1;
  logic [31:0] RF_rdata2;

  RegisterFile rf (
      .clk(clk),
      .rsel1(RF_rsel1),
      .rsel2(RF_rsel2),
      .wsel(RF_wsel),
      .wen(RF_wen),
      .wdata(RF_wdata),
      .rdata1(RF_rdata1),
      .rdata2(RF_rdata2),
      .rst(0)
  );

  SimInstructionMem im (
      .clk(clk),
      .addr(program_counter),
      .data_out(instruction)
  );

  logic [31:0] DM_OUT;
  SimDataMem dm (
      .clk(clk),
      .data_in(RF_rdata2),
      .addr_in(ALU_OUT),
      .wr_en(DM_wen),
      .data_out(DM_OUT)
  );

  logic [31:0] ALU_A;
  assign ALU_A = (ALU_OP1_SEL == `ALU_OP1_SEL_REG) ? RF_rdata1 : program_counter;

  logic [31:0] ALU_B;
  assign ALU_B = (ALU_OP2_SEL == `ALU_OP2_SEL_REG) ? RF_rdata2 : Immediate_imm;

  logic [31:0] ALU_OUT;
  ALU_Base alu (
      .A  (ALU_A),
      .B  (ALU_B),
      .Ctr(ALU_Operation),
      .Out(ALU_OUT)
  );

  BranchLogic bl (
      .branch_cond(branch_condition),
      .rdata1(RF_rdata1),
      .rdata2(RF_rdata2),
      .branch(branch_taken)
  );

  always_ff @(negedge clk) begin
    casez (instruction[6:0])
      B_TYPE: begin
        if (branch_taken == `BRANCH_SEL_ALU) begin
          program_counter <= ALU_OUT;
        end else program_counter <= program_counter + 4;
      end
      J_TYPE, `OPC_JALR: begin
        program_counter <= ALU_OUT;
      end
      default begin program_counter <= program_counter + 4; end
    endcase
  end


  logic [31:0] Immediate_imm;
  Immediate immediate (
      .instruction(instruction),
      .imm(Immediate_imm)
  );

  always_ff @(posedge clk) begin
    leds <= RF_rdata1[5:0];
  end

endmodule
