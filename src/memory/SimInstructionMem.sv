module SimInstructionMem (
    input logic clock,
    input logic [31:0] addr,  // Address input
    output logic [31:0] data_out  // Data output for read operations
);

  logic [7:0] mem_array[1024];
  always_ff @(posedge clock) begin
    data_out <= {mem_array[addr+3], mem_array[addr+2], mem_array[addr+1], mem_array[addr+0]};
  end

  initial begin
    $readmemh("memory/instructions.mem",
              mem_array);  // Replace "memory_file.mem" with your variable file name
  end

endmodule
