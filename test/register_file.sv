module register_file;

  // Testbench signals
  logic [ 4:0] write_sel;
  logic [ 4:0] read_selA;
  logic [ 4:0] read_selB;
  logic [31:0] data_in;
  logic        write_en;
  logic        clk = 0;
  logic        rst = 0;
  logic [31:0] data_outA;
  logic [31:0] data_outB;


  // Instantiate the DUT
  RegisterFile dut (
      .rsel1(read_selA),
      .rsel2(read_selB),
      .wsel(write_sel),
      .rdata1(data_outA),
      .rdata2(data_outB),
      .wdata(data_in),
      .wen(write_en),
      .rst(rst),
      .clk(clk)
  );


  // Test sequence
  initial begin
    $display("Starting Register File testbench");
    // Initialize inputs
    write_en  = 0;
    data_in   = 32'd0;
    write_sel = 5'd0;
    read_selA = 5'd0;
    read_selB = 5'd0;

    // ------------------------------------------
    // Test Case 1: Write and then read register 5
    // ------------------------------------------

    #10;
    clk = 1;
    #10;
    clk = 0;

    write_sel = 5'd5;
    data_in = 32'hDEADBEEF;
    write_en = 1;

    #10;
    clk = 1;
    #10;
    clk = 0;

    write_en = 0;

    $display("Starting Register File testbench");

    #10;
    clk = 1;
    #10;
    clk = 0;

    read_selA = 5'd5;
    read_selB = 5'd5;

    #10;
    clk = 1;
    #10;
    clk = 0;

    if (data_outA !== 32'hDEADBEEF || data_outB !== 32'hDEADBEEF) begin
      $display("Test Case 1 FAILED: Expected 0xDEADBEEF, got data_outA = %h, data_outB = %h",
               data_outA, data_outB);
    end else begin
      $display("Test Case 1 PASSED");
    end

    // ------------------------------------------------------
    // Test Case 2: Write to registers 10 and 15 and verify
    // ------------------------------------------------------

    #10;
    clk = 1;
    #10;
    clk = 0;

    write_sel = 5'd10;
    data_in = 32'h12345678;
    write_en = 1;

    #10;
    clk = 1;
    #10;
    clk = 0;

    write_en = 0;

    #10;
    clk = 1;
    #10;
    clk = 0;

    read_selA = 5'd10;
    read_selB = 5'd15;

    #10;
    clk = 1;
    #10;
    clk = 0;
    if (data_outA !== 32'h12345678)
      $display("Test Case 2 FAILED (Register 10): Expected 0x12345678, got %h", data_outA);
    else $display("Test Case 2 PASSED for Register 10");

    #10;
    clk = 1;
    #10;
    clk = 0;

    write_sel = 5'd15;
    data_in = 32'hAAAAAAAA;
    write_en = 1;

    #10;
    clk = 1;
    #10;
    clk = 0;

    write_en = 0;

    #10;
    clk = 1;
    #10;
    clk = 0;

    read_selB = 5'd15;

    #10;
    clk = 1;
    #10;
    clk = 0;

    if (data_outB !== 32'hAAAAAAAA)
      $display("Test Case 2 FAILED (Register 15): Expected 0xAAAAAAAA, got %h", data_outB);
    else $display("Test Case 2 PASSED for Register 15");

    #10;
    clk = 1;
    #10;
    clk = 0;

    read_selA = 5'd0;
    read_selB = 5'd15;
    data_in = 32'h00000001;
    write_sel = 5'd15;
    write_en = 1;

    if (data_outB !== 32'hAAAAAAAA)
      $display("Test Case 3 FAILED (Register 15): Expected 0xAAAAAAAA, got %h", data_outB);
    else $display("Test Case 3 PASSED for Register 15");

    #10;
    clk = 1;
    #10;
    clk = 0;

    write_en = 0;

    if (data_outB !== 32'h00000001)
      $display("Test Case 3 FAILED (Register 15): Expected 0x00000001, got %h", data_outB);
    else $display("Test Case 3 PASSED for Register 15");

    #20;
    $finish;
  end

endmodule
