`include "definitions.svh"

module InstructionTest;

  logic [31:0] i = 0;
  logic clk = 0;
  always #50 clk = ~clk;

  logic [5:0] leds;
  Core core (
      .clk(clk),
      .leds(leds),
      .btn(),
      .uart_rx(),
      .uart_tx()
  );

  logic [  31:0] pass           [1];
  logic [  31:0] fail           [1];

  reg   [1023:0] test_name;

  reg   [2047:0] pass_file;
  reg   [2047:0] fail_file;
  reg   [2047:0] mem_file;
  reg   [2047:0] data_mem_file;

  reg            DEBUG = 0;
  reg            DEBUG_REGS = 0;
  reg            DEBUG_DM = 0;

  initial begin
    if (!$value$plusargs("testname=%s", test_name)) begin
      $finish;
    end
    $value$plusargs("DEBUG=%b", DEBUG);
    $value$plusargs("DEBUG_REGS=%b", DEBUG_REGS);
    $value$plusargs("DEBUG_DM=%b", DEBUG_DM);

    /* verilator lint_off WIDTHEXPAND */
    pass_file = {"./rv32ui-p-tests/", test_name, "_pass.txt"};
    fail_file = {"./rv32ui-p-tests/", test_name, "_fail.txt"};
    mem_file = {"./rv32ui-p-tests/", test_name, ".mem"};
    data_mem_file = {"./rv32ui-p-tests/", test_name, ".data.mem"};
    /* verilator lint_on WIDTHEXPAND */

    $readmemh(pass_file, pass);
    $readmemh(fail_file, fail);
    $readmemh(mem_file, core.im.mem);
    $readmemh(data_mem_file, core.dm.mem);

    $display("Test name: %s", test_name);

    $display("DEBUG: %b", DEBUG);
    $display("DEBUG_REGS: %b", DEBUG_REGS);
    $display("DEBUG_DM: %b", DEBUG_DM);

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
      $display("if_dr_en: %h", core.if_dr_en);
      $display("id_ex_en: %h", core.id_ex_en);
      $display("if_dr_clear: %h", core.if_dr_clear);
      $display("id_ex_clear: %h", core.id_ex_clear);
      $display("-----------------------------");
      $display("-----------if/dr-------------");
      $display(">> Instruction: %h", core.pr_if_dr.instruction);
      $display(">> PC: %h", core.pr_if_dr.program_counter);
      $display("-----------------------------");
      $display("-----------id/ex-------------");
      $display("RF_rdata1: %h", core.pr_id_ex.RF_rdata1);
      $display("RF_rdata2: %h", core.pr_id_ex.RF_rdata2);
      $display("Immediate_imm: %h", core.pr_id_ex.Immediate_imm);
      $display("PC: %h", core.pr_id_ex.program_counter);
      $display("opcode: %h", core.pr_id_ex.opcode);

      $display("RF_rsel1: %h", core.pr_id_ex.RF_rsel1);
      $display("RF_rsel2: %h", core.pr_id_ex.RF_rsel2);
      $display("RF_wsel: %h", core.pr_id_ex.RF_wsel);
      $display("RF_wen: %h", core.pr_id_ex.RF_wen);
      $display("branch: %h", core.pr_id_ex.branch);
      $display("jump: %h", core.pr_id_ex.jump);
      $display("RF_wdata_sel: %h", core.pr_id_ex.RF_wdata_sel);
      $display("mem_sel: %h", core.pr_id_ex.mem_sel);
      $display("DM_read: %h", core.pr_id_ex.DM_read);
      $display("DM_wen: %h", core.pr_id_ex.DM_wen);
      $display("ALU_OP1_SEL: %h", core.pr_id_ex.ALU_OP1_SEL);
      $display("ALU_OP2_SEL: %h", core.pr_id_ex.ALU_OP2_SEL);
      $display("ALU_Operation: %h", core.pr_id_ex.ALU_Operation);
      $display("branch_condition: %h", core.pr_id_ex.branch_condition);
      $display("-----------------------------");
      $display("-----------ex/mem------------");
      $display("ALU_OUT: %h", core.pr_ex_mem.ALU_OUT);
      $display("PC: %h", core.pr_ex_mem.program_counter);
      $display("RF_rdata2: %h", core.pr_ex_mem.RF_rdata2);
      $display("target: %h", core.pr_ex_mem.target);

      $display("RF_wsel: %h", core.pr_ex_mem.RF_wsel);
      $display("RF_wen: %h", core.pr_ex_mem.RF_wen);
      $display("RF_wdata_sel: %h", core.pr_ex_mem.RF_wdata_sel);
      $display("mem_sel: %h", core.pr_ex_mem.mem_sel);
      $display("DM_wen: %h", core.pr_ex_mem.DM_wen);
      $display("-----------------------------");
      $display("-----------mem/wb------------");
      $display("ALU_OUT: %h", core.pr_mem_wb.ALU_OUT);
      $display("MMU_OUT: %h", core.pr_mem_wb.MMU_OUT);
      $display("PC: %h", core.pr_mem_wb.program_counter);
      $display("RF_wsel: %h", core.pr_mem_wb.RF_wsel);
      $display("RF_wen: %h", core.pr_mem_wb.RF_wen);
      $display("RF_wdata_sel: %h", core.pr_mem_wb.RF_wdata_sel);
      $display("----------------------------- +++++++++++++");


      /*
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

      if (DEBUG_REGS) begin
        $display(">> Registers:");
        for (int i = 0; i < 32; i++) begin
          $display(">>>> R[%d]: %h", i, core.rf.registers[i]);
        end
      end

      if (DEBUG_DM) begin
        $display("[SIM DATA MEM BEGIN], clk=%d", clk);
        $display("[SDM] addr_in=%08x, _addr_in=%08x, data_out=%08x", core.dm.addr_in,
                 core.dm._addr_in, core.dm.data_out);
        $display("[SDM] +0 data=%08x", core.dm.mem[(core.dm._addr_in>>2)]);
        $display("[SDM] +1 data=%08x", core.dm.mem[(core.dm._addr_in>>2)+1]);
        $display("[SDM] +2 data=%08x", core.dm.mem[(core.dm._addr_in>>2)+2]);
        $display("[SDM] wr_en=%d, fn3=%d, rdata=%08x", core.dm.wr_en, core.dm.fn3, core.dm.rdata);
        $display("[SIM DATA MEM END]");
      end
       */

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
    if (i == 32'd4000) begin
      $display("TIMEOUT");
      $finish;
    end
  end

endmodule
