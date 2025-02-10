module SimDataMem (
    input logic clk,
    input logic [31:0] data_in,
    input logic [31:0] addr_in,
    input logic wr_en,
    output logic [31:0] data_out
);

  logic [7:0] mem[8196];

  always_ff @(negedge clk) begin
    if (wr_en) begin
      mem[addr_in]   <= data_in[7:0];
      mem[addr_in+1] <= data_in[15:8];
      mem[addr_in+2] <= data_in[23:16];
      mem[addr_in+3] <= data_in[31:24];
    end
  end

  assign data_out = {mem[addr_in+3], mem[addr_in+2], mem[addr_in+1], mem[addr_in]};

endmodule
