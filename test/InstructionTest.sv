`include "definitions.svh"

module InstructionTest;

  logic [31:0] i = 0;
  logic clk = 0;
  always #50 clk = ~clk;

  logic [5:0] leds;
  Core core (
      .clk (clk),
      .leds(leds)
  );

  logic [  31:0] pass      [1];
  logic [  31:0] fail      [1];

  reg   [1023:0] test_name;

  reg   [2047:0] pass_file;
  reg   [2047:0] fail_file;
  reg   [2047:0] mem_file;
  reg   [2047:0] data_mem_file;

  reg DEBUG = 0;

  initial begin
    if (!$value$plusargs("testname=%s", test_name)) begin
      $finish;
    end
    $value$plusargs("DEBUG=%b", DEBUG);

    /* verilator lint_off WIDTHEXPAND */
    pass_file = {"mem_files/rv32ui-p-tests/", test_name, "_pass.txt"};
    fail_file = {"mem_files/rv32ui-p-tests/", test_name, "_fail.txt"};
    mem_file  = {"mem_files/rv32ui-p-tests/", test_name, ".mem"};
    data_mem_file  = {"mem_files/rv32ui-p-tests/", test_name, ".data.mem"};
    /* verilator lint_on WIDTHEXPAND */

    $readmemh(pass_file, pass);
    $readmemh(fail_file, fail);
    $readmemh(mem_file, core.im.mem_array);
    $readmemh(data_mem_file, core.dm.mem);

    $display("Test name: %s", test_name);

    $display("DEBUG: %b", DEBUG);

    if (DEBUG) begin
      $display("Pass: %h", pass[0]);
      $display("Fail: %h", fail[0]);

      $display("Pass file: %s", pass_file);
      $display("Fail file: %s", fail_file);
      $display("Mem file: %s", mem_file);
    end

  end


  always_ff @(negedge clk) begin

    if (DEBUG) begin

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
      $display(">>>> RF_wdata_sel:%h", core.RF_wdata_sel);
      $display(">>>> RF_wsel: %h", core.RF_wsel);
      if (core.cu.RF_wen) begin
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

      $display(">> Registers:");
      for (int i = 0; i < 32; i++) begin
        $display(">>>> R[%d]: %h", i, core.rf.registers[i]);
      end

    end

    if (core.program_counter == pass[0]) begin
      $display("PASS");
      $finish;
    end
    if (core.program_counter == fail[0]) begin
      $display("FAIL");
      $finish;
    end

    i++;
    if (i == 32'd1000) begin
      $display("Instruction: %h", core.instruction);
      $finish;
    end
  end

endmodule
