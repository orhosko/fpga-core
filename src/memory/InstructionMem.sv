module InstructionMem (
    input logic clk,
    input logic [31:0] addr,
    output logic [31:0] data_out
);

  logic [7:0] mem_array[2**14];  // 16KB

  logic [31:0] _addr = addr - 32'h80000000;

  always_ff @(posedge clk) begin
    data_out <= {mem_array[_addr+3], mem_array[_addr+2], mem_array[_addr+1], mem_array[_addr]};
  end

  initial begin
    $readmemh("../../mem_files/rv32ui-p-tests/rv32ui-p-sw.mem", mem_array);
  end

endmodule
