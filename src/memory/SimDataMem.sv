`include "../definitions.svh"

module SimDataMem (
    input  logic        clk,
    input  logic [31:0] data_in,
    input  logic [31:0] addr_in,
    input  logic        wr_en,
    input  logic [ 2:0] fn3,
    output logic [31:0] data_out
);

  logic [7:0] mem[16384];

  logic [31:0] _addr_in;
  assign _addr_in = addr_in - 32'h80002000;

  always_ff @(negedge clk) begin
    if (wr_en) begin
      mem[_addr_in] <= data_in[7:0];
      if (fn3 == `FN3_SH || fn3 == `FN3_SW) begin
        mem[_addr_in+1] <= data_in[15:8];
      end
      if (fn3 == `FN3_SW) begin
        mem[_addr_in+2] <= data_in[23:16];
        mem[_addr_in+3] <= data_in[31:24];
      end
    end
  end

  always_comb begin
    if (fn3 == `FN3_LBU) begin
      data_out = {24'h000000, mem[_addr_in]};
    end else if (fn3 == `FN3_LHU) begin
      data_out = {16'h0000, mem[_addr_in+1], mem[_addr_in]};
    end else if (fn3 == `FN3_LW) begin
      data_out = {mem[_addr_in+3], mem[_addr_in+2], mem[_addr_in+1], mem[_addr_in]};
    end else if (fn3 == `FN3_LB) begin
      data_out = {{24{mem[_addr_in][7]}}, mem[_addr_in]};
    end else if (fn3 == `FN3_LH) begin
      data_out = {{16{mem[_addr_in+1][7]}}, mem[_addr_in+1], mem[_addr_in]};
    end else begin
      data_out = 32'habcdef12;
    end
  end

endmodule
