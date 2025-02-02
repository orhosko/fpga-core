module sc_datapath(
  input         clk_i,         // main clock
  input         rst_i,         // global reset
  input [31:0]  imem_out_i,    // output from insn. memory
  input [31:0]  dmem_out_i,    // output from data memory
  output [4:0] imem_addr_o,   // insn. memory address (i.e., current PC)
  output        dmem_we_o,     // data memory write-enable
  output [31:0] dmem_addr_o,   // data memory address
  output [31:0] dmem_in_o,     // input to data memory

  output        regfile_we_o,        // testbench/debugging signal
  output [31:0] regfile_data_in_o,   // testbench/debugging signal
  ...
		   );


   // Program Counter
   // Increase or branch on positive edge of clk_i
   mod_pc(.clk_i(clk_i),
      .rst_i(rst_i),
      .init_i(pc_init_i), // Initial value of Program Counter
      .pc_o(pc_w),
	  ....);


   // Branch
   mod_branch(.data_i(branch_in_w), // 16-bit signed
	      .cond_i(ins_cond_w), // three-bit "NZP" 
	      .taken_o(branch_w), // 1 -> taken, 0 -> not taken
	      ...);
   

   // Controller
   mod_controller(.ins_i(imem_out_i),
		  .branch_i(branch_w),
		  .alu_ctr_o(alu_ctr_w), // control input of ALU 
		  .alu_in_sel_o(alu_in_sel_w), // select ALU's input (reg or imm)
		  .jump_o(jump_w), // 1 -> jump, 0 -> no jump
		  .load_o(load_w), // 1 -> load, 0 -> no load
		  ...
		  );


   // Register File
   // Write on positive edge of clock
   mod_reg_file(.clk_i(clk_i),
		.rst_i(rst_i),
		.rsel1_i(rsel1_w),
		.rsel2_i(rsel2_w),
		...);
   	
   // ALU input selection
   mod_mux(.sel_i(alu_in_sel_w),
	   .in0_i(alu_rs2_w),
	   .in1_i(alu_imm_w),
	   .out_o(alu_in2_w)
	   );
   
   
   // Arithmetic Logic Unit
   mod_alu(.ctr_i(alu_ctr_w),
	   .in1_i(alu_in1_w),
	   .in2_i(alu_in2_w),
	   .out_o(alu_out_w));

   // Register file input selection
   mod_mux(.sel_i(regin_sel_w),
	   .in0_i(alu_out_w),
	   .in1_i(dmem_out_i),
	   .out_o(regin_data_w)
	   );
   

end module;
   
   
	  
   
