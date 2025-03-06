`include "../definitions.svh"
`include "../controlunit_definitions.svh"
`include "../alu_definitions.svh"

module Core (
    input wire clk,
    input wire btn,
    output logic [5:0] leds,
    output logic [31:0] tx_word
);

  logic [1:0] state_counter = 2'b00;
  always_ff @(posedge clk) begin
    state_counter <= (state_counter + 1)%3;
  end

  /* synth didn't likey
  always_ff @(negedge clk) begin
    state_counter <= state_counter + 1;
  end
  */

  logic sig_read_im;
  logic sig_data_read;
  // logic sig_compute;
  logic sig_write_back;

  // read inst mem
  // decode
  // read register(async)
  assign sig_read_im = (state_counter == 2'b00);

  // read data memory
  assign sig_data_read = (state_counter == 2'b01);

  // compute - combinational don't do anything
  // assign sig_compute = (state_counter == 2'b10);

  // write register & memory
  // update pc
  // assign sig_write_back = (state_counter == 2'b11);
  assign sig_write_back = (state_counter == 2'b10);

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


  logic [31:0] RF_wdata;
  assign RF_wdata = (RF_wdata_sel == `RF_WDATA_SEL_PC) ? program_counter + 4 :
                          (RF_wdata_sel == `RF_WDATA_SEL_ALU) ? ALU_OUT :
                          (RF_wdata_sel == `RF_WDATA_SEL_DM) ? DM_OUT : 32'h0;

  logic [31:0] RF_rdata1;
  logic [31:0] RF_rdata2;

  RegisterFile rf (
      .rclk(0), // async read
      .wclk(sig_write_back),
      .rsel1(RF_rsel1),
      .rsel2(RF_rsel2),
      .wsel(RF_wsel),
      .wen(RF_wen),
      .wdata(RF_wdata),
      .rdata1(RF_rdata1),
      .rdata2(RF_rdata2),
      .rst(0)
  );

  InstructionMem im (
      .clk(sig_read_im),
      .addr(program_counter),
      .data_out(instruction)
  );

  logic [31:0] DM_OUT;
  DataMem dm (
      .rclk(sig_data_read),
      .wclk(sig_write_back),
      .data_in(RF_rdata2),
      .addr_in(ALU_OUT),
      .wr_en(DM_wen),
      .fn3(instruction[14:12]),
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

  always_ff @(posedge sig_write_back) begin
    if (~halt) begin
      casez (instruction[6:0])
        B_TYPE: begin
          if (branch_taken == `BRANCH_SEL_ALU) begin
            program_counter <= ALU_OUT;
          end else program_counter <= program_counter + 4;
        end
        J_TYPE, `OPC_JALR: begin
          program_counter <= ALU_OUT;
        end
        default begin
          program_counter <= program_counter + 4;
        end
      endcase
    end
  end

  logic [31:0] Immediate_imm;
  Immediate immediate (
      .instruction(instruction),
      .imm(Immediate_imm)
  );

  logic halt = 0;

`define synth
`ifdef synth

  logic [31:0] gp;
  assign gp[31:0] = rf.registers[3];

  function [7:0] hex_to_ascii;
    input [3:0] hex_digit_1;
    begin
      if ({4'b0, hex_digit_1} < 8'd10) hex_to_ascii = "0" + {4'b0, hex_digit_1};
      else hex_to_ascii = "A" + ({4'b0, hex_digit_1} - 8'd10);
    end
  endfunction

  logic [  31:0] pass          [1];
  logic [  31:0] fail          [1];

  initial begin
    $readmemh("../../mem_files/rv32ui-p-tests/rv32ui-p-sw_pass.txt", pass);
    $readmemh("../../mem_files/rv32ui-p-tests/rv32ui-p-sw_fail.txt", fail);
    leds[5:1] = 5'b00000;
  end

  always_ff @(posedge clk) begin
    if (program_counter == fail[0]) begin
      halt <= 1;
      leds[5:1] <= 5'b11100;
      tx_word <= "fail";
    end else if (program_counter == pass[0]) begin
      leds[5:1] <= 5'b10101;
      halt <= 1;
      tx_word <= "pass";
    end else begin
      leds[5:1] <= program_counter[6:2];
      tx_word[31:24] <= hex_to_ascii(program_counter[15:12]);
      tx_word[23:16] <= hex_to_ascii(program_counter[11:8]);
      tx_word[15:8] <= hex_to_ascii(program_counter[7:4]);
      tx_word[7:0] <= hex_to_ascii(program_counter[3:0]);
    end
  end
`endif

endmodule
