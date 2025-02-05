`include "../alu_definitions.svh"

module ALU_Base (
    input  wire [31:0] A,
    input  wire [31:0] B,
    input  wire [ 3:0] Ctr,
    output reg  [31:0] Out
);

  always_comb begin
    case (Ctr)
      `ALU_ADD: begin
        Out = A + B;
      end
      `ALU_SUB: begin
        Out = A - B;
      end
      // `ALU_MUL: begin
      //   Out = A * B;
      // end
      `ALU_SLL: begin
        Out = A << B[4:0];
      end
      `ALU_SRL: begin
        Out = A >> B[4:0];
      end
      `ALU_SRA: begin
        Out = $signed(A) >>> B[4:0];
      end
      `ALU_AND: begin
        Out = A & B;
      end
      `ALU_OR: begin
        Out = A | B;
      end
      `ALU_XOR: begin
        Out = A ^ B;
      end
      `ALU_SLT: begin
        Out = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
      end
      `ALU_SLTU: begin
        Out = ($unsigned(A) < $unsigned(B)) ? 32'd1 : 32'd0;
      end
      default: Out = 32'b0;
    endcase
  end

endmodule
