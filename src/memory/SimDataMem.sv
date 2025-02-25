
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
  always_ff @(negedge clk) begin
    if (fn3 == `fn3_lbu) data_out <= {24'h00_0000, mem[_addr_in]};
    else if (fn3 == `fn3_lhu) data_out <= {16'h0000, mem[_addr_in+1], mem[_addr_in]};
    else if (fn3 == `fn3_lw)
      data_out <= {mem[_addr_in+3], mem[_addr_in+2], mem[_addr_in+1], mem[_addr_in]};
    else if (fn3 == `fn3_lb) data_out <= {{24{mem[_addr_in][7]}}, mem[_addr_in]};
    else if (fn3 == `fn3_lh) data_out <= {{16{mem[_addr_in+1][7]}}, mem[_addr_in+1], mem[_addr_in]};
    else data_out <= 32'hAB_CDEF12;
  end


  //=========================================================
  // S Y N T H E S I S   V E R S I O N
  //=========================================================
  // If `sim` *is* defined, we use the RPLL + Gowin SP RAM + FSM code.
  // ---------------------------------------------------------
`else
  logic [11:0] write_addr;
  logic [31:0] _addr_in;
  assign _addr_in   = addr_in - 32'h8000_2000;
  assign write_addr = _addr_in[11:0];
  logic [7:0] mem[2*8192];
  logic [11:0] read_addr;
  assign read_addr = write_addr;
  logic [31:0] write_data = data_in;
  logic [31:0] read_data;

  logic [ 3:0] write_enable;
  always_comb begin
    case (fn3)
      `fn3_sb: write_enable = 4'b0001;
      `fn3_sh: write_enable = 4'b0011;
      `fn3_sw: write_enable = 4'b1111;
      default: write_enable = 4'b0000;
    endcase
  end


  always_ff @(negedge clk) begin
    if (wr_en)
      $display(
          "[SDM W] Doing write operation, write_addr=%04x, write_data=%08x", write_addr, write_data
      );
    if (write_enable[0] && wr_en) mem[{write_addr, 2'b00}] <= write_data[7:0];
    if (write_enable[1] && wr_en) mem[{write_addr, 2'b01}] <= write_data[15:8];
    if (write_enable[2] && wr_en) mem[{write_addr, 2'b10}] <= write_data[23:16];
    if (write_enable[3] && wr_en) mem[{write_addr, 2'b11}] <= write_data[31:24];

    read_data[7:0]   <= mem[{read_addr, 2'b00}];
    read_data[15:8]  <= mem[{read_addr, 2'b01}];
    read_data[23:16] <= mem[{read_addr, 2'b10}];
    read_data[31:24] <= mem[{read_addr, 2'b11}];
  end

  always_comb begin
    if (fn3 == `fn3_lbu) data_out = {24'h00_0000, read_data[7:0]};
    else if (fn3 == `fn3_lhu) data_out = {16'h0000, read_data[15:0]};
    else if (fn3 == `fn3_lw) data_out = read_data;
    else if (fn3 == `fn3_lb) data_out = {{24{read_data[7]}}, read_data[7:0]};
    else if (fn3 == `fn3_lh) data_out = {{16{read_data[15]}}, read_data[15:0]};
    else data_out = 32'hAB_CDEF12;
  end

  always @(negedge clk) begin
    $display("[SIM DATA MEM BEGIN], clk=%d", clk);
    $display("[SDM] addr_in=%08x, _addr_in=%08x, write_addr=%04x, read_addr=%04x, data_out=%08x",
             addr_in, _addr_in, write_addr, read_addr, data_out);
    $display("[SDM] wr_en=%d, fn3=%d, write_data=%08x, read_data=%08x", wr_en, fn3, write_data,
             read_data);
    $display("[SDM] Spesifix data location 0x0000 %h, %h, %h, %h", mem[{12'h0000, 2'b00}], mem[{
             12'h0000, 2'b01}], mem[{12'h0000, 2'b10}], mem[{12'h0000, 2'b11}]);
    $display("[SDM] Spesifix data location 0x01c8 %h, %h, %h, %h", mem[{12'h01c8, 2'b00}], mem[{
             12'h01c8, 2'b01}], mem[{12'h01c8, 2'b10}], mem[{12'h01c8, 2'b11}]);
    $display("[SIM DATA MEM END]");
  end
`endif

endmodule
