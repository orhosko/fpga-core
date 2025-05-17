
    //$display("pc: %h, alu: %h", program_counter, ALU_OUT);
    if(program_counter == 32'h80000100) begin

    /*
    for(int i=0; i<640; i=i+1) begin
       $display("mem: %h", dm.mem[32'h960+i]);
    end
    */

    end



    /*
    if (mem_sel == 2'b11 && RF_wdata_sel == `RF_WDATA_SEL_DM && RF_wen)
      $display(
          "WHY THE FUCK YOU ARE HERE, mem_sel=%b, %b %b %b %b, %h",
          mem_sel,
          sig_read_im,
          sig_data_read,
          sig_compute,
          sig_write_back,
          ALU_OUT
      );
     */



  /*
  assign leds[5:0] = program_counter[7:2];
    */

`ifdef synth

  logic [31:0] gp;
  logic [31:0] tx_word;
  assign gp[31:0] = rf.registers[3];

  function [7:0] hex_to_ascii;
    input [3:0] hex_digit_1;
    begin
      if ({4'b0, hex_digit_1} < 8'd10) hex_to_ascii = "0" + {4'b0, hex_digit_1};
      else hex_to_ascii = "A" + ({4'b0, hex_digit_1} - 8'd10);
    end
  endfunction

  logic [31:0] pass[1];
  logic [31:0] fail[1];

  initial begin
    //$readmemh("../../mem_files/rv32ui-p-tests/rv32ui-p-sw_pass.txt", pass);
    //$readmemh("../../mem_files/rv32ui-p-tests/rv32ui-p-sw_fail.txt", fail);
    leds[5:1] = 5'b00000;
  end

  always_ff @(posedge clk) begin
    leds[0] <= halt_sig;
    if (program_counter == fail[0]) begin
      halt_sig  <= 0;
      leds[5:1] <= 5'b11100;
      tx_word   <= "fail";
    end else if (program_counter == pass[0]) begin
      leds[5:1] <= 5'b10101;
      halt_sig  <= 0;
      tx_word   <= "pass";
    end else begin
      leds[5:1] <= program_counter[6:2];
      tx_word[31:24] <= hex_to_ascii(program_counter[15:12]);
      tx_word[23:16] <= hex_to_ascii(program_counter[11:8]);
      tx_word[15:8] <= hex_to_ascii(program_counter[7:4]);
      tx_word[7:0] <= hex_to_ascii(program_counter[3:0]);
    end
  end
`endif
