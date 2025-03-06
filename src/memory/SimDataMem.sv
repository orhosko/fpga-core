`include "../definitions.svh"

module SimDataMem (
    input  logic        rclk,     // CPU clock for BOTH sim & synth version
    input  logic        wclk,     // CPU clock for BOTH sim & synth version
    input  logic [31:0] data_in,
    input  logic [31:0] addr_in,
    input  logic        wr_en,    // 1 => store, 0 => load
    input  logic [ 2:0] fn3,
    output logic [31:0] data_out
);

  logic [31:0] _addr_in;
  assign _addr_in = addr_in - 32'h8000_2000;

  // not working 8 bit wide memory
`ifdef seven
  (* ram_style = "block" *)
  // errors if not possible
  logic [7:0] mem[2**12];  // 4KB example

  logic [3:0] write_enable;
  always_comb begin
    case (fn3)
      `FN3_SB: write_enable = 4'b0001;
      `FN3_SH: write_enable = 4'b0011;
      `FN3_SW: write_enable = 4'b1111;
      default: write_enable = 4'b0000;
    endcase
  end

  logic [31:0] rdata;

  integer i;
  always @(negedge wclk) begin
    for (i = 0; i < 4; i = i + 1) begin
      if (write_enable[i] && wr_en) mem[_addr_in+i] <= data_in[8*i+:8];
    end
  end

  always @(negedge rclk) begin
    rdata <= 0;
    for (i = 0; i < 4; i = i + 1) begin
      rdata[8*i+:8] <= mem[_addr_in+i];
    end
  end

`else

  (* ram_style = "block" *)
  // errors if not possible
  logic [31:0] mem[2**12];  // 4KB example

  logic [3:0] write_enable;
  always_comb begin
    case (fn3)
      `FN3_SB: write_enable = 1 << (_addr_in[1:0]);
      `FN3_SH: write_enable = 3 << (_addr_in[1:0]);  // TODO: check misallignment
      `FN3_SW: write_enable = 4'b1111;
      default: write_enable = 4'b0000;
    endcase
  end

  logic [31:0] rdata;
  logic [ 4:0] write_start;

  assign write_start = _addr_in[1:0] << 3;

  integer i;
  integer j;

  always @(posedge wclk) begin
    j <= 0;
    for (i = 0; i < 4; i = i + 1) begin
      /* verilator lint_off WIDTHEXPAND */
      if (write_enable[i] && wr_en && fn3 == `FN3_SW) mem[_addr_in>>2][8*i+:8] <= data_in[8*i+:8];
      /* verilator lint_on WIDTHEXPAND */

      if (write_enable[i] && wr_en && fn3 == `FN3_SH && j < 2) begin
        mem[_addr_in>>2][8*i+:8] <= data_in[8*j+:8];
        j <= +1;
      end

      if (write_enable[i] && wr_en && fn3 == `FN3_SB) mem[_addr_in>>2][8*i+:8] <= data_in[7:0];

    end
  end

  logic [4:0] read_start;
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
`endif

  initial begin
    $readmemh("../../mem_files/rv32ui-p-tests/rv32ui-p-sw.data.mem", mem);
  end

endmodule
