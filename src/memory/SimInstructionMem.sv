module SimInstructionMem (
    input logic clk,
    input logic [31:0] addr,  // Address input
    output logic [31:0] data_out  // Data output for read operations
);

  logic [7:0] mem_array[1024];

  logic [31:0] _addr = addr - 32'h80000000;

  always_ff @(posedge clk) begin
    data_out <= {mem_array[_addr+3], mem_array[_addr+2], mem_array[_addr+1], mem_array[_addr]};
  end

  initial begin
    $readmemh("./mem_files/add.mem", mem_array);
  end

endmodule
