module Core (
    input wire clk
);

  logic [31:0] program_counter = 32'h80000000;

  logic [31:0] instruction;
  logic [ 4:0] RF_rsel1;
  logic [ 4:0] RF_rsel2;
  logic [ 4:0] RF_wsel;
  logic        RF_wen;
  logic        branch_taken;  // TODO: different design
  logic        DM_wen;
  logic [ 1:0] RF_wdata_sel;
  logic        ALU_OP1_SEL;
  logic        ALU_OP2_SEL;
  logic [ 3:0] ALU_Operation;

  ControlUnit cu (
      .instruction(instruction),
      .clk(clk),
      .RF_rsel1(RF_rsel1),
      .RF_rsel2(RF_rsel2),
      .RF_wsel(RF_wsel),
      .RF_wen(RF_wen),
      .branch_taken(branch_taken),
      .DM_wen(DM_wen),
      .RF_wdata_sel(RF_wdata_sel),
      .ALU_OP1_SEL(ALU_OP1_SEL),
      .ALU_OP2_SEL(ALU_OP2_SEL),
      .ALU_Operation(ALU_Operation)
  );

  RegisterFile rf (
      .clk  (clk),
      .rsel1(RF_rsel1),
      .rsel2(RF_rsel2),
      .wsel (RF_wsel),
      .wen  (RF_wen),
      .wdata()
  );

  SimInstructionMem im (
      .clk(clk),
      .addr(program_counter),
      .data_out(instruction)
  );

  SimDataMem dm (
      .clk(clk),
      .data_in(),
      .addr_in(),
      .wr_en(DM_wen),
      .data_out()
  );

  ALU_Base alu (
      .A  (),
      .B  (),
      .Ctr(ALU_Operation),
      .Out()
  );

  always_ff @(posedge clk) begin
    program_counter <= program_counter + 4;
  end

endmodule;
