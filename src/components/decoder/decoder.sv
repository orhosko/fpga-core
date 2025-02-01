module decoder #(
    parameter INPUT_WIDTH = 4
) (
    input logic [INPUT_WIDTH-1:0] in,
    output logic [2**INPUT_WIDTH-1:0] out
);

  //next state computation
  always_comb begin
    out = 1 << in;
  end
endmodule
