
////////////////////////////////////////////////////////////
// simdatamem.sv
////////////////////////////////////////////////////////////
//----------------------------------------------------------------------
// 1) Define fn3 Macros (loads and stores share opcode bits in RISC-V)
//    For partial loads/stores: same fn3, but wr_en=1 => store, wr_en=0 => load
//----------------------------------------------------------------------
`define fn3_sb 3'b000
`define fn3_sh 3'b001
`define fn3_sw 3'b010

`define fn3_lb 3'b000
`define fn3_lh 3'b001
`define fn3_lw 3'b010
`define fn3_lbu 3'b100
`define fn3_lhu 3'b101

module SimDataMem (
    input  logic        clk,      // CPU clock for BOTH sim & synth version
    input  logic [31:0] data_in,
    input  logic [31:0] addr_in,
    input  logic        wr_en,    // 1 => store, 0 => load
    input  logic [ 2:0] fn3,
    output logic [31:0] data_out
);

  //=========================================================
  // S I M U L A T I O N   V E R S I O N
  //=========================================================
  // If `sim` is *not* defined, we use this (the original code).
  // ---------------------------------------------------------
`ifdef sim

  // A simple 8-bit memory array
  logic [7:0] mem[0:16384];  // 16KB example

  // Address offset from some base (e.g. 0x80002000)
  logic [31:0] _addr_in;
  assign _addr_in = addr_in - 32'h8000_2000;

  // Byte writes on negative edge for the simulation code
  always_ff @(negedge clk) begin
    if (wr_en) begin
      // Store byte
      mem[_addr_in] <= data_in[7:0];
      // If store halfword, also write the next byte
      if (fn3 == `fn3_sh || fn3 == `fn3_sw) begin
        mem[_addr_in+1] <= data_in[15:8];
      end
      // If store word, write 4 bytes
      if (fn3 == `fn3_sw) begin
        mem[_addr_in+2] <= data_in[23:16];
        mem[_addr_in+3] <= data_in[31:24];
      end
    end
  end

  // Combinational read with sign/zero extension
  always_comb begin
    if (fn3 == `fn3_lbu) data_out = {24'h00_0000, mem[_addr_in]};
    else if (fn3 == `fn3_lhu) data_out = {16'h0000, mem[_addr_in+1], mem[_addr_in]};
    else if (fn3 == `fn3_lw)
      data_out = {mem[_addr_in+3], mem[_addr_in+2], mem[_addr_in+1], mem[_addr_in]};
    else if (fn3 == `fn3_lb) data_out = {{24{mem[_addr_in][7]}}, mem[_addr_in]};
    else if (fn3 == `fn3_lh) data_out = {{16{mem[_addr_in+1][7]}}, mem[_addr_in+1], mem[_addr_in]};
    else data_out = 32'hAB_CDEF12;
  end


  //=========================================================
  // S Y N T H E S I S   V E R S I O N
  //=========================================================
  // If `sim` *is* defined, we use the RPLL + Gowin SP RAM + FSM code.
  // ---------------------------------------------------------
`else
  logic [3:0] byte_sel;  // 4-bit byte select
  always_comb begin
    case (fn3)
      `fn3_sb: byte_sel = 4'b0001;
      `fn3_sh: byte_sel = 4'b0011;
      `fn3_sw: byte_sel = 4'b1111;
      default: byte_sel = 4'b0000;
    endcase
  end
  logic [31:0] _addr_in;
  assign _addr_in = addr_in - 32'h8000_2000;
  Gowin_SP your_instance_name (
      .dout(data_out),  //output [31:0] dout
      .clk(clk),  //input clk
      .oce(1'b1),  //input oce
      .ce(1'b1),  //input ce
      .reset(1'b0),  //input reset
      .wre(wr_en),  //input wre
      .ad(_addr_in[8:0]),  //input [8:0] ad
      .din(data_in),  //input [31:0] din
      .byte_en(byte_sel)  //input byte_en
  );
`endif  // `ifndef sim ... `else ... `endif

endmodule
