module ALU_Base (
    input  wire [31:0] A,
    input  wire [31:0] B,
    input  wire [ 3:0] Ctr,
    output reg  [31:0] Out
);

  // Arithmetic operations
  `define ADD 4'b0000
  `define SUB 4'b0001
  // ADDI SLT SLTI SLTU SLTIU

  // not in isa
  `define MUL 4'b0010

  // Shift operations
  `define SLL 4'b0100
  `define SRL 4'b0101
  `define SRA 4'b0110
  // I versions of these

  // Normally pseudo instruction
  // NOT rd, rs: 1s complement
  // xori rd, rs, -1
  `define NOT 4'b0111

  // NEG rd, rs: 2s complement
  // sub rd, 0, rs

  // logical operations
  `define AND 4'b1000
  `define OR 4'b1001
  `define XOR 4'b1010
  // I versions of these

  always_comb begin
    case (Ctr)
      `ADD: begin
        Out = A + B;
      end
      `SUB: begin
        Out = A - B;
      end
      `MUL: begin
        Out = A * B;
      end
      `SLL: begin
        Out = A << B[4:0];
      end
      `SRL: begin
        Out = A >> B[4:0];
      end
      `SRA: begin
        Out = $signed(A) >>> B[4:0];
      end
      `AND: begin
        Out = A & B;
      end
      `OR: begin
        Out = A | B;
      end
      `XOR: begin
        Out = A ^ B;
      end
      default: Out = 32'b0;
    endcase
  end

endmodule
