`include "../definitions.svh"
`include "../controlunit_definitions.svh"
`include "../alu_definitions.svh"
`include "./PipelineRegisters.svh"

module Core (
    input wire clk,
    input wire btn,
    output logic [5:0] leds,
    input uart_rx,
    output uart_tx
);

  pipe_reg_if_dr_t         pr_if_dr;
  pipe_reg_id_ex_t         pr_id_ex;
  pipe_reg_ex_mem_t        pr_ex_mem;
  pipe_reg_mem_wb_t        pr_mem_wb;

  logic             [31:0] program_counter = 32'h80000000;

  logic             [31:0] instruction;

  logic             [ 4:0] RF_rsel1;
  logic             [ 4:0] RF_rsel2;
  logic             [ 4:0] RF_wsel;
  logic                    RF_wen;
  logic                    branch_taken;
  logic                    branch;
  logic                    jump;
  logic                    DM_read;
  logic                    DM_wen;
  logic             [ 1:0] RF_wdata_sel;
  logic                    ALU_OP1_SEL;
  logic                    ALU_OP2_SEL;
  logic             [ 3:0] ALU_Operation;
  logic             [ 2:0] branch_condition;

  ControlUnit cu (
      .instruction(instruction),
      .RF_rsel1(RF_rsel1),
      .RF_rsel2(RF_rsel2),
      .RF_wsel(RF_wsel),
      .RF_wen(RF_wen),
      .branch(branch),
      .jump(jump),
      .branch_condition(branch_condition),
      .DM_read(DM_read),
      .DM_wen(DM_wen),
      .RF_wdata_sel(RF_wdata_sel),
      .ALU_OP1_SEL(ALU_OP1_SEL),
      .ALU_OP2_SEL(ALU_OP2_SEL),
      .ALU_Operation(ALU_Operation)
  );

  logic [31:0] ALU_OUT;

  logic [31:0] RF_wdata;
  assign RF_wdata = (pr_mem_wb.RF_wdata_sel == `RF_WDATA_SEL_PC) ? pr_mem_wb.program_counter + 4 :
                          (pr_mem_wb.RF_wdata_sel == `RF_WDATA_SEL_ALU) ? pr_mem_wb.ALU_OUT :
                          (pr_mem_wb.RF_wdata_sel == `RF_WDATA_SEL_DM) ? pr_mem_wb.MMU_OUT : 32'h0;

  logic [31:0] RF_rdata1;
  logic [31:0] RF_rdata2;

  RegisterFile rf (
      .rclk(1'b0),  // async read
      .wclk(clk),
      .rsel1(RF_rsel1),
      .rsel2(RF_rsel2),
      .wsel(pr_mem_wb.RF_wsel),
      .wen(pr_mem_wb.RF_wen),
      .wdata(RF_wdata),
      .rdata1(RF_rdata1),
      .rdata2(RF_rdata2),
      .rst(1'b0)
  );

  logic [31:0] addr_in;
  logic        sram_wr_en;
  logic        uart_wr_en;
  logic        i2c_wr_en;
  logic [31:0] mmu_addr_out;
  logic [ 1:0] mem_sel;

  MMU mmu (
      .addr_in(pr_ex_mem.ALU_OUT),
      .sram_wr_en(sram_wr_en),
      .uart_wr_en(uart_wr_en),
      .addr_out(mmu_addr_out),
      .i2c_wr_en(i2c_wr_en),
      .mem_sel(mem_sel)
  );

  InstructionMem im (
      .clk(clk),
      .en(1'b1),
      .addr(program_counter),
      .data_out(instruction)
  );

  logic [31:0] DM_OUT;
  DataMem dm (
      .rclk(clk),
      .wclk(clk),
      .data_in(pr_ex_mem.RF_rdata2),
      .addr_in(mmu_addr_out),
      .wr_en(pr_ex_mem.DM_wen & sram_wr_en),
      .fn3(instruction[14:12]),  // TODO: take from pipeline
      .data_out(DM_OUT)
  );

  logic [7:0] UART_OUT;
  uart_mmio uart (
      .clk(clk),
      .rst(btn),
      .uart_rx_pin(uart_rx),
      .uart_tx_pin(uart_tx),
      .addr(mmu_addr_out[3:2]),
      .wr_en(pr_ex_mem.DM_wen & uart_wr_en & (pr_ex_mem.ALU_OUT == 32'h10000008)),
      .wr_data(pr_ex_mem.RF_rdata2[7:0]),
      .rd_data(UART_OUT)
  );

  /*
  logic [ 7:0] I2C_OUT = 0;
  i2c_top i2c (
      .clk(clk),
      .rst(1'b0),
      .addr(mmu_addr_out[3:2]),
      .dev_addr(7'h27),
      .wr_en(pr_ex_mem.DM_wen & i2c_wr_en & (ALU_OUT == 32'h10002008)),
      .data_in(pr_ex_mem.RF_rdata2[7:0]),
      .data_out(I2C_OUT),
      .scl_pin(),
      .sda_pin()
  );
   */

  logic [31:0] MMU_OUT;
  always_ff @(posedge clk) begin
    MMU_OUT <= (mem_sel == `MEM_SEL_SRAM) ? DM_OUT :
                   (mem_sel == `MEM_SEL_UART)  ? {24'h000000, UART_OUT} :
                   (mem_sel == `MEM_SEL_I2C) ? 32'h00000000 : //? {24'h000000, I2C_OUT} :
    32'h00000078;
  end

  logic [31:0] ALU_A;
  assign ALU_A = (pr_id_ex.ALU_OP1_SEL == `ALU_OP1_SEL_REG) ? pr_id_ex.RF_rdata1 : pr_id_ex.program_counter;

  logic [31:0] ALU_B;
  assign ALU_B = (pr_id_ex.ALU_OP2_SEL == `ALU_OP2_SEL_REG) ? pr_id_ex.RF_rdata2 : pr_id_ex.Immediate_imm;

  ALU_Base alu (
      .A  (ALU_A),
      .B  (ALU_B),
      .Ctr(ALU_Operation),
      .Out(ALU_OUT)
  );

  BranchLogic bl (
      .branch_cond(pr_id_ex.branch_condition),
      .rdata1(pr_id_ex.RF_rdata1),
      .rdata2(pr_id_ex.RF_rdata2),
      .branch(branch_taken)
  );

  logic [31:0] Immediate_imm;
  Immediate immediate (
      .instruction(instruction),
      .imm(Immediate_imm)
  );

  // reg halt_sig = 1;

  assign leds[5]   = btn;
  assign leds[4]   = 1'b1;
  assign leds[3]   = uart.tx_data_ready;
  assign leds[2:0] = uart.uart_tx_inst.state[2:0];

  // ----------------------------------------------------

  logic if_dr_en;
  logic id_ex_en;
  logic if_dr_clear;
  logic id_ex_clear;

  HazardUnit hu (
      .DM_wen(DM_wen),
      .id_ex_DM_read(pr_id_ex.DM_read),  // only for hazard unit
      .RF_rsel1(RF_rsel1),
      .RF_rsel2(RF_rsel2),
      .ALU_OP2_SEL(ALU_OP2_SEL),

      .branch(branch),
      .id_ex_jump(pr_id_ex.jump),
      .branch_taken(branch_taken),
      .id_ex_opcode(pr_id_ex.opcode),

      .id_ex_RF_wsel (pr_id_ex.RF_wsel),
      .ex_mem_RF_wsel(pr_ex_mem.RF_wsel),
      .mem_wb_RF_wsel(pr_mem_wb.RF_wsel),

      .id_ex_RF_wen (pr_id_ex.RF_wen),
      .ex_mem_RF_wen(pr_ex_mem.RF_wen),
      .mem_wb_RF_wen(pr_mem_wb.RF_wen),

      .if_dr_en(if_dr_en),
      .id_ex_en(id_ex_en),
      .if_dr_clear(if_dr_clear),
      .id_ex_clear(id_ex_clear)
  );

  always_ff @(posedge clk) begin
    if (if_dr_en) begin
      if ((branch_taken == `BRANCH_SEL_ALU && pr_id_ex.branch == 1'b1) 
        || pr_id_ex.jump == 1'b1) begin
        program_counter <= ALU_OUT;
      end else program_counter <= program_counter + 4;
    end
  end

  always_ff @(posedge clk) begin
    if (if_dr_clear) begin
      pr_if_dr.instruction <= 32'h0;
      pr_if_dr.program_counter <= 32'h0;
    end else if (if_dr_en) begin
      pr_if_dr.instruction <= instruction;
      pr_if_dr.program_counter <= program_counter;
    end
  end

  always_ff @(posedge clk) begin
    if (id_ex_clear) begin
      pr_id_ex.RF_rdata1 <= 32'h0;
      pr_id_ex.RF_rdata2 <= 32'h0;
      pr_id_ex.Immediate_imm <= 32'h0;
      pr_id_ex.program_counter <= 32'h0;
      pr_id_ex.opcode <= 7'h0;

      pr_id_ex.RF_rsel1 <= 5'h0;
      pr_id_ex.RF_rsel2 <= 5'h0;
      pr_id_ex.RF_wsel <= 5'h0;
      pr_id_ex.RF_wen <= 1'b0;
      pr_id_ex.branch <= 1'b0;
      pr_id_ex.jump <= 1'b0;
      pr_id_ex.DM_read <= 1'b0;
      pr_id_ex.DM_wen <= 1'b0;
      pr_id_ex.RF_wdata_sel <= `RF_WDATA_SEL_ALU;
      pr_id_ex.mem_sel <= `MEM_SEL_SRAM;
      pr_id_ex.ALU_OP1_SEL <= `ALU_OP1_SEL_REG;
      pr_id_ex.ALU_OP2_SEL <= `ALU_OP2_SEL_REG;
      pr_id_ex.ALU_Operation <= `ALU_ADD;
      pr_id_ex.branch_condition <= 3'b000;
    end else if (id_ex_en) begin
      pr_id_ex.RF_rdata1 <= RF_rdata1;
      pr_id_ex.RF_rdata2 <= RF_rdata2;
      pr_id_ex.Immediate_imm <= Immediate_imm;
      pr_id_ex.program_counter <= pr_if_dr.program_counter;
      pr_id_ex.opcode <= instruction[6:0];

      pr_id_ex.RF_rsel1 <= RF_rsel1;
      pr_id_ex.RF_rsel2 <= RF_rsel2;
      pr_id_ex.RF_wsel <= RF_wsel;
      pr_id_ex.RF_wen <= RF_wen;
      pr_id_ex.branch <= branch;
      pr_id_ex.jump <= jump;
      pr_id_ex.DM_read <= DM_read;
      pr_id_ex.DM_wen <= DM_wen;
      pr_id_ex.RF_wdata_sel <= RF_wdata_sel;
      pr_id_ex.mem_sel <= mem_sel;
      pr_id_ex.ALU_OP1_SEL <= ALU_OP1_SEL;
      pr_id_ex.ALU_OP2_SEL <= ALU_OP2_SEL;
      pr_id_ex.ALU_Operation <= ALU_Operation;
      pr_id_ex.branch_condition <= branch_condition;
    end
  end

  always_ff @(posedge clk) begin
    if (1) begin  // TODO: add hazard detection ???
      pr_ex_mem.ALU_OUT <= ALU_OUT;
      pr_ex_mem.program_counter <= pr_id_ex.program_counter;
      pr_ex_mem.RF_rdata2 <= pr_id_ex.RF_rdata2;

      pr_ex_mem.RF_wsel <= pr_id_ex.RF_wsel;
      pr_ex_mem.RF_wen <= pr_id_ex.RF_wen;
      pr_ex_mem.RF_wdata_sel <= pr_id_ex.RF_wdata_sel;
      pr_ex_mem.mem_sel <= pr_id_ex.mem_sel;
      pr_ex_mem.DM_wen <= pr_id_ex.DM_wen;
    end
  end

  always_ff @(posedge clk) begin
    if (1) begin  // TODO: add hazard detection ???
      pr_mem_wb.ALU_OUT <= ALU_OUT;
      pr_mem_wb.MMU_OUT <= MMU_OUT;
      pr_mem_wb.program_counter <= pr_ex_mem.program_counter;

      pr_mem_wb.RF_wsel <= pr_ex_mem.RF_wsel;
      pr_mem_wb.RF_wen <= pr_ex_mem.RF_wen;
      pr_mem_wb.RF_wdata_sel <= pr_ex_mem.RF_wdata_sel;
    end
  end

endmodule
