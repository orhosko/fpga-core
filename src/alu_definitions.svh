`define ALU_ADD 4'b0000
`define ALU_SUB 4'b0001
`define ALU_SLL 4'b0100
`define ALU_SRL 4'b0101
`define ALU_SRA 4'b0110
`define ALU_AND 4'b1000
`define ALU_OR 4'b1001
`define ALU_XOR 4'b1010

`define ALU_MUL 4'b0010 // not in isa
`define ALU_NOT 4'b0111
// Normally pseudo instruction
// NOT rd, rs: 1s complement
// xori rd, rs, -1

// NEG rd, rs: 2s complement
// sub rd, 0, rs
