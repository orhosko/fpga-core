module decoder_tb;
  // Parameter for the input width (should match the decoder module)
  parameter INPUT_WIDTH = 5;

  // Declare testbench signals
  reg [INPUT_WIDTH-1:0] in;
  wire [2**INPUT_WIDTH-1:0] out;

  // Instantiate the decoder module
  Decoder #(
      .INPUT_WIDTH(INPUT_WIDTH)
  ) uut (
      .in (in),
      .out(out)
  );

  // Loop index for testing
  integer i;

  initial begin
    for (i = 0; i < (2 ** INPUT_WIDTH); i = i + 1) begin
      in = i[INPUT_WIDTH-1:0];
      #1;

      if (out !== (1 << in)) begin
        $display("Test FAILED for input %b: expected %h, got %h", in, (1 << in), out);
      end else begin
        $display("Test PASSED for input %b: output %h", in, out);
      end
    end

    #2;
    $finish;
  end
endmodule
