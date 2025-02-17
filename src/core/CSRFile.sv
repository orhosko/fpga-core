module CSRFile (
    input  logic [11:0] sel,
    input  logic [31:0] wdata,
    input  logic        wen,
    input  logic        clk,
    input  logic        rst,
    output logic [31:0] rdata
);

  logic [31:0] registers[4096];
  initial begin
    for (int i = 0; i < 4096; i++) begin
      registers[i] = 32'b0;
    end
  end

  always_ff @(negedge clk) begin
    if (wen & ~(sel[11:10] == 2'b11)) begin
      registers[sel] <= (rst) ? 32'b0 : wdata;
    end
  end

  assign rdata = registers[sel];
endmodule
