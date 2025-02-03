`include "definitions.sv"

`define TESTS   \
   `X(32'd123)  \
   `X(122)      \
   `X(`FN3_BEQ) \
   `X(`FN3_BNE) \
   `X(`FN3_BLT) \
   `X(`FN3_BGE)

module InstructionTest;

  initial begin

    `define X(a) if(a==a) begin $display("a=%d",a); end
    `TESTS
    `undef X

  end

endmodule
