`timescale 1ns / 1ps
`include "RegisterFile.sv"
module RegisterFile_tb (

    input logic clk
);
  // Testbench signals
  logic [ 4:0] write_sel;
  logic [ 4:0] read_selA;
  logic [ 4:0] read_selB;
  logic [31:0] data_in;
  logic        write_en;
  logic [31:0] data_outA;
  logic [31:0] data_outB;
  // Instantiate the DUT
  RegisterFile dut (
      .write_sel(write_sel),
      .read_selA(read_selA),
      .read_selB(read_selB),
      .data_in  (data_in),
      .write_en (write_en),
      .clk      (clk),
      .data_outA(data_outA),
      .data_outB(data_outB)
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
    // On the negative edge, write to register 5
    @(negedge clk);
    write_sel = 5'd5;
    data_in   = 32'hDEADBEEF;
    write_en  = 1;
    @(negedge clk);  // Allow the write to complete on a negative edge
    write_en = 0;

    $display("Starting Register File testbench");
    // On the next positive edge, set read selectors (reads are synchronous)
    @(posedge clk);
    read_selA = 5'd5;
    read_selB = 5'd5;
    // Wait one more positive edge for the outputs to update
    @(posedge clk);
    if (data_outA !== 32'hDEADBEEF || data_outB !== 32'hDEADBEEF) begin
      $display("Test Case 1 FAILED: Expected 0xDEADBEEF, got data_outA = %h, data_outB = %h",
               data_outA, data_outB);
    end else begin
      $display("Test Case 1 PASSED");
    end

    // ------------------------------------------------------
    // Test Case 2: Write to registers 10 and 15 and verify
    // ------------------------------------------------------
    // Write to register 10
    @(negedge clk);
    write_sel = 5'd10;
    data_in   = 32'h12345678;
    write_en  = 1;
    @(negedge clk);
    write_en = 0;

    // Wait for the new value to be available at the outputs
    @(posedge clk);
    // Set read selectors to check registers 10 and 15 concurrently.
    read_selA = 5'd10;
    read_selB = 5'd15;
    @(posedge clk);
    if (data_outA !== 32'h12345678)
      $display("Test Case 2 FAILED (Register 10): Expected 0x12345678, got %h", data_outA);
    else $display("Test Case 2 PASSED for Register 10");

    // Write to register 15
    @(negedge clk);
    write_sel = 5'd15;
    data_in   = 32'hAAAAAAAA;
    write_en  = 1;
    @(negedge clk);
    write_en = 0;

    @(posedge clk);
    // Now check register 15
    read_selB = 5'd15;
    @(posedge clk);
    if (data_outB !== 32'hAAAAAAAA)
      $display("Test Case 2 FAILED (Register 15): Expected 0xAAAAAAAA, got %h", data_outB);
    else $display("Test Case 2 PASSED for Register 15");

    #20;
    $finish;
  end

endmodule
