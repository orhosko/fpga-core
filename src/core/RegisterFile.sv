module RegisterFile (
    input  logic [ 4:0] wsel,
    input  logic [ 4:0] rsel1,
    input  logic [ 4:0] rsel2,
    input  logic [31:0] wdata,
    input  logic        wen,
    input  logic        rclk,
    input  logic        wclk,
    input  logic        rst,
    output logic [31:0] rdata1,
    output logic [31:0] rdata2
);

  logic [31:0] registers[32];
  initial begin
    for (int i = 0; i < 32; i++) begin
      registers[i] = 32'b0;
    end
  end

  always_ff @(posedge wclk) begin
    if (wen & wsel != 5'b0) begin  // Ignore writes to register 0
      registers[wsel] <= (rst) ? 32'b0 : wdata;
    end
  end

  assign rdata1 = registers[rsel1];
  assign rdata2 = registers[rsel2];
endmodule
