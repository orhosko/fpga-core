module RegisterFile (
    input  logic [ 4:0] write_sel,
    input  logic [ 4:0] read_selA,
    input  logic [ 4:0] read_selB,
    input  logic [31:0] data_in,
    input  logic        write_en,
    input  logic        clk,
    output logic [31:0] data_outA,
    output logic [31:0] data_outB
);

  logic [31:0] registers[0:31];
  initial begin
    for (int i = 0; i < 32; i++) begin
      registers[i] = 32'b0;
    end
  end

  always_ff @(negedge clk) begin
    if (write_en) begin
      registers[write_sel] <= data_in;
    end
  end

  always_ff @(posedge clk) begin
    data_outA <= registers[read_selA];
    data_outB <= registers[read_selB];
  end

endmodule

