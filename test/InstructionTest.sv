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

  logic clk = 0;
  always #50 clk = ~clk;

   logic [5:0] leds;
  Core core (.clk(clk), .leds(leds));

  always_ff @(negedge clk) begin

    $display("-----------------------------");
    $display("Read data: %h", core.im.data_out);

    $display(">> PC: %h", core.program_counter);
    $display(">> Instruction: %h", core.instruction);
    $display(">> Branch taken: %h", core.branch_taken);

    $display(">> RF:");
    $display(">>>> RF_rsel1: %h", core.RF_rsel1);
    $display(">>>> RF_rdata1: %h", core.RF_rdata1);
    $display(">>>> RF_rsel2: %h", core.RF_rsel2);
    $display(">>>> RF_rdata2: %h", core.RF_rdata2);
    $display(">>>> RF_wsel: %h", core.RF_wsel);
    if(core.cu.RF_wen) begin
       $display(">>>>>> RF_wen: %h", core.cu.RF_wen);
       $display(">>>>>> RF_wdata: %h", core.RF_wdata);
    end

    $display(">> ALU:");
    $display(">>>> ALU_OP1_SEL: %h", core.ALU_OP1_SEL);
    $display(">>>> ALU_A: %h", core.ALU_A);
    $display(">>>> ALU_OP2_SEL: %h", core.ALU_OP2_SEL);
    $display(">>>> ALU_B: %h", core.ALU_B);
    $display(">>>> ALU_OUT: %h", core.ALU_OUT);

    $display(">> Imm: %h", core.Immediate_imm);

    $display(">> DM:");
    $display(">>>> DM_wen: %h", core.DM_wen);
    if (core.DM_wen) begin
      $display(">>>>>> DM_ADDR: %h", core.ALU_OUT);
      $display(">>>>>> DM_IN: %h", core.RF_rdata2);
    end
    $display(">>>> DM_OUT: %h", core.DM_OUT);

    if(core.program_counter == 32'h80000080) begin
      $display("Instruction: %h", core.instruction);
      $finish;
    end

    $display(">> Registers:");
    for (int i = 0; i < 32; i++) begin
      $display(">>>> R[%d]: %h", i, core.rf.registers[i]);
    end

  end

endmodule
