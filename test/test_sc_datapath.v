 // Single Cycle RV32I Core Testbench
// This testbench is used to test the designed core described in Homerwork-2
// This is a template to test single instruction functionality
module test_sc_datapath;
   

   // Define input wires
  // **** Rename or add more input wire if needed ****
  wire                clk_i, rst_i;
  wire [31:0]        imem_out_i;
  wire [31:0]        dmem_out_i;
  // Define output wires
  // **** Rename or add more output wire if needed ****
  wire                dmem_we_o;
  wire [4:0]        imem_addr_o;
  wire [31:0]        dmem_addr_o, dmem_in_o;

  sc_datapath core(
                   .clk_i(clk_i), // main clock
                     .rst_i(rst_i), // global reset
                     .imem_out_i(imem_out_i), // output from insn. memory
                     .dmem_out_i(dmem_out_i), // output from data memory
                     .imem_addr_o(imem_addr_o), // insn. memory address (i.e., current PC)
                     .dmem_we_o(dmem_we_o), // data memory write-enable
                     .dmem_addr_o(dmem_addr_o), // data memory address
                     .dmem_in_o(dmem_in_o), // input to data memory
 
                     .regfile_we_o(regfile_we_o), // testbench/debugging signal
                     .regfile_data_in_o(regfile_data_in_o)); // testbench/debugging signal
            
   clk_i = 1;
   rst_i = 1;  // fix this depending on your reset condition

   rst_i = 0; 
   imem_out_i = 'h00001597; // AUIPC auipc x11, 1
   
   toggle_clk_rst;   
   imem_out_i = 'hcae58593; // ADDI addi x11, x11, -850
   
   toggle_clk_rst;
   imem_out_i = 'h00898cb3; // ADD add x25, x19, x8
   
   toggle_clk_rst;
   imem_out_i = 'h616000ef; // JAL jal x1, 1558
   assert(imem_addr_o == 'h80000616) else $error; // initial PC is assumed 0x80000000
   // pc+4 should be stored in x1
   
   toggle_clk_rst;
   imem_out_i = 'h00540463; // BEQ beq x8, x5, 8
   assert(imem_addr_o == 'h80000008) else $error; // initial PC is assumed 0x80000000
   
   toggle_clk_rst;
   imem_out_i = 'h0084ac03; // LW lw x24, 8(x9)
   dmem_out_i = 'h12345678; // write this to x24
   assert(dmem_addr_o == 'h00000008) else $error; // x9 is assumed to be 0
   assert(dmem_we_o == 1) else $error;
                   

   task toggle_clk;
      begin
         #10 clk_i = ~clk_i;
         #10 clk_i = ~clk_i;
      end
   endtask

   
   task toggle_clk_rst;
      begin
         toggle_clk;
         rst_i = 1; // fix this depending on your reset condition
         toggle_clk;
         rst_i = 0; // fix this depending on your reset condition
      end
   endtask

end module;
