`include "../definitions.svh"
`include "../controlunit_definitions.svh"
`include "../alu_definitions.svh"

module Core (
    input wire clk,
    input wire btn,
    output logic [5:0] leds,
    input uart_rx,
    output uart_tx
);

  logic [1:0] state_counter = 2'b11;
  always_ff @(posedge clk) begin
    state_counter <= state_counter + 1;
  end

  logic sig_read_im;
  logic sig_data_read;
  logic sig_compute;
  logic sig_write_back;

  // read inst mem
  // decode
  // read register(async)
  assign sig_read_im = (state_counter == 2'b00);

  // read data memory
  assign sig_data_read = (state_counter == 2'b01);

  // compute - combinational don't do anything
  assign sig_compute = (state_counter == 2'b10);

  // write register & memory
  // update pc
  // assign sig_write_back = (state_counter == 2'b11);
  assign sig_write_back = (state_counter == 2'b11);

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

  logic [31:0] ALU_OUT;

  logic [31:0] RF_wdata;
  assign RF_wdata = (RF_wdata_sel == `RF_WDATA_SEL_PC) ? program_counter + 4 :
                          (RF_wdata_sel == `RF_WDATA_SEL_ALU) ? ALU_OUT :
                          (RF_wdata_sel == `RF_WDATA_SEL_DM) ? MMU_OUT : 32'h0;

  logic [31:0] RF_rdata1;
  logic [31:0] RF_rdata2;

  RegisterFile rf (
      .rclk(1'b0),  // async read
      .wclk(clk),
      .rsel1(RF_rsel1),
      .rsel2(RF_rsel2),
      .wsel(RF_wsel),
      .wen(RF_wen & sig_write_back),
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
      .addr_in(ALU_OUT),
      .sram_wr_en(sram_wr_en),
      .uart_wr_en(uart_wr_en),
      .addr_out(mmu_addr_out),
      .i2c_wr_en(i2c_wr_en),
      .mem_sel(mem_sel)
  );

  InstructionMem im (
      .clk(clk),
      .en(sig_read_im),
      .addr(program_counter),
      .data_out(instruction)
  );

  logic [31:0] DM_OUT;
  DataMem dm (
      .rclk(clk),  //sig_data_read),
      .wclk(clk),
      .data_in(RF_rdata2),
      .addr_in(mmu_addr_out),
      .wr_en(DM_wen & sram_wr_en & sig_write_back),
      .fn3(instruction[14:12]),
      .data_out(DM_OUT)
  );

  logic [7:0] UART_OUT;
  uart_mmio uart (
      .clk(clk),
      .rst(btn),
      .uart_rx_pin(uart_rx),
      .uart_tx_pin(uart_tx),
      .addr(mmu_addr_out[3:2]),
      .wr_en(DM_wen & uart_wr_en & sig_write_back & (ALU_OUT == 32'h10000008)),
      .wr_data(RF_rdata2[7:0]),
      .rd_data(UART_OUT)
  );

  logic [31:0] MMU_OUT;
  always_ff @(negedge clk) begin
    if (sig_compute) begin  //TODO: sadasdasd
      MMU_OUT <= (mem_sel == `MEM_SEL_SRAM) ? DM_OUT :
                   (mem_sel == `MEM_SEL_UART)  ? {24'h000000, UART_OUT} :
                   (mem_sel == `MEM_SEL_I2C) ? 32'h00000000 : //? {24'h000000, I2C_OUT} :
      32'h00000078;
    end
  end

  logic [31:0] ALU_A;
  assign ALU_A = (ALU_OP1_SEL == `ALU_OP1_SEL_REG) ? RF_rdata1 : program_counter;

  logic [31:0] ALU_B;
  assign ALU_B = (ALU_OP2_SEL == `ALU_OP2_SEL_REG) ? RF_rdata2 : Immediate_imm;

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
    if (sig_write_back) begin
      // if (halt_sig) begin
      casez (instruction[6:0])
        B_TYPE: begin
          if (branch_taken == `BRANCH_SEL_ALU) begin
            program_counter <= ALU_OUT;
          end else program_counter <= program_counter + 4;
        end
        J_TYPE, `OPC_JALR: begin
          program_counter <= ALU_OUT;
        end
        default: begin
          program_counter <= program_counter + 4;
        end
      endcase
    end
    // end
  end

  logic [31:0] Immediate_imm;
  Immediate immediate (
      .instruction(instruction),
      .imm(Immediate_imm)
  );

  // reg halt_sig = 1;

  assign leds[5]   = btn;
  assign leds[4]   = sig_write_back;
  assign leds[3]   = uart.tx_data_ready;
  assign leds[2:0] = uart.uart_tx_inst.state[2:0];

endmodule
