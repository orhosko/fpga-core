`include "definitions.sv"

`define FOR_TESTCASE1(DO)   \
   `DO(0, 32'd123)  \
   `DO(0, 122)      \
   `DO(0, `FN3_BEQ) \
   `DO(0, `FN3_BNE) \
   `DO(0, `FN3_BLT) \
   `DO(0, `FN3_BGE)

module InstructionTest;

  initial begin

    `define CREATE_TESTCASE1(unused, a) if(a==a) begin $display("a=%d",a); end
    `FOR_TESTCASE1(CREATE_TESTCASE1)

  end

  logic clk = 0;
  always #50 clk = ~clk;

  Core core (.clk(clk));

endmodule
