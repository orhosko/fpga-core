`include "../definitions.svh"

module DataMem (
    input  logic        rclk,     // CPU clock for BOTH sim & synth version
    input  logic        wclk,     // CPU clock for BOTH sim & synth version
    input  logic [31:0] data_in,
    input  logic [31:0] addr_in,
    input  logic        wr_en,    // 1 => store, 0 => load
    input  logic [ 2:0] fn3,
    output logic [31:0] data_out
);

  logic [31:0] _addr_in;
  assign _addr_in = addr_in; // - 32'h8000_2000;

  (* ram_style = "block" *) // errors if not possible
  logic [31:0] mem[2**13];  // 8KB max??

  logic [3:0] write_enable;
  always_comb begin
    case (fn3)
      `FN3_SB: write_enable = 1 << (_addr_in[1:0]);
      `FN3_SH: write_enable = 3 << (_addr_in[1:0]);
      `FN3_SW: write_enable = 4'b1111;
      default: write_enable = 4'b0000;
    endcase
  end

  logic   [31:0] wdata;
  always_comb begin
    wdata = data_in;
    /* verilator lint_off WIDTHEXPAND */
    if (fn3 == `FN3_SB) wdata = data_in[7:0] << (_addr_in[1:0] * 8);
    /* verilator lint_on WIDTHEXPAND */
    if (fn3 == `FN3_SH && _addr_in[1] == 0) wdata = {16'h0000, data_in[15:0]};
        if (fn3 == `FN3_SH && _addr_in[1] == 1) wdata = {data_in[15:0], 16'h0000};
     if (fn3 == `FN3_SW) wdata = data_in;
  end

  integer        i;
  always @(posedge wclk) begin
    for (i = 0; i < 4; i = i + 1) begin
        if (write_enable[i] && wr_en) mem[_addr_in>>2][8*i+:8] <= wdata[8*i+:8];
    end
  end

  logic [31:0] rdata;
  logic [ 4:0] read_start;
  always @(posedge rclk) begin
    read_start <= _addr_in[1:0] * 8;
    rdata <= mem[_addr_in>>2];
  end

  always_comb begin
    if (fn3 == `FN3_LBU) data_out = {24'h00_0000, rdata[read_start+:8]};
    else if (fn3 == `FN3_LHU) data_out = {16'h0000, rdata[read_start+:16]};
    else if (fn3 == `FN3_LW) data_out = rdata;
    else if (fn3 == `FN3_LB) data_out = {{24{rdata[read_start+7]}}, rdata[read_start+:8]};
    else if (fn3 == `FN3_LH) data_out = {{16{rdata[read_start+15]}}, rdata[read_start+:16]};
    else data_out = 32'hABCDEF12;
  end

  initial begin
    $readmemh("./mem_files/uart-test.data.mem", mem);
  end

endmodule
