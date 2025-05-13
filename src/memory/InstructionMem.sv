module InstructionMem (
    input logic clk,
    input logic [31:0] addr,
    input logic en,
    output logic [31:0] data_out
);

  logic [7:0] mem[2**14];  // 16KB

  logic [31:0] _addr;
  assign _addr = addr - 32'h80000000;

  always_ff @(negedge clk) begin
    if(en)
       data_out <= {mem[_addr+3], mem[_addr+2], mem[_addr+1], mem[_addr]};
  end

  initial begin
    $readmemh("./mem_files_compiled/uart-test.mem", mem);
  end

endmodule
