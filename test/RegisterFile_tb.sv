module RegisterFile_tb(
  input logic        clk
);

  // DUT Signals
  logic [4:0]  rsel1;
  logic [4:0]  rsel2;
  logic [4:0]  wsel;
  logic [31:0] wdata;
  logic        wen;
  logic [31:0] rdata1;
  logic [31:0] rdata2;
  logic        rst;

  // Instantiate the DUT
  RegisterFile DUT (
    .rsel1  (rsel1),
    .rsel2  (rsel2),
    .wsel   (wsel),
    .wdata  (wdata),
    .wen    (wen),
    .rdata1 (rdata1),
    .rdata2 (rdata2),
    .rst    (rst),
    .clk    (clk)
  );

  // Task: Apply reset for two cycles
  task do_reset();
    begin
      rst = 1;
      @(posedge clk);
      @(posedge clk);
      rst = 0;
      @(posedge clk); // one extra cycle after de-assert
    end
  endtask

  initial begin
    // Initialize signals
    rsel1  = 5'd0;
    rsel2  = 5'd0;
    wsel   = 5'd0;
    wdata  = 32'd0;
    wen    = 1'b0;
    rst    = 1'b0;

    // Small delay for external clock startup (if any)
    #1;

    $display("=============================================================");
    $display("   Time   rsel1 rsel2 wsel wen  wdata         rdata1  rdata2 ");
    $display("=============================================================");

    //----------------------------------------------------------------
    // TEST 1: Reset behavior
    //----------------------------------------------------------------
    $display("\n--- TEST 1: Reset Behavior ---");
    do_reset();
    for (int i = 0; i < 32; i++) begin
      rsel1 = 5'(i);
      rsel2 = 5'((i + 1) % 32);
      @(posedge clk);

      // Expect registers to be 0 after reset
      if (rdata1 !== 32'h0) begin
        $error("Test 1 FAILED: Register r%0d not reset to 0 (Got 0x%08h)", rsel1, rdata1);
      end
      if (rdata2 !== 32'h0) begin
        $error("Test 1 FAILED: Register r%0d not reset to 0 (Got 0x%08h)", rsel2, rdata2);
      end
    end
    $display("Test 1 PASSED (All registers read 0 after reset)");

    //----------------------------------------------------------------
    // TEST 2: Simple Write/Read
    //----------------------------------------------------------------
    $display("\n--- TEST 2: Simple Write/Read ---");
    wsel   = 5'd10;
    wdata  = 32'hABCD_1234;
    wen    = 1'b1;
    @(posedge clk); // perform the write
    wen    = 1'b0;
    rsel1  = 5'd10;
    @(posedge clk);

    // Check read
    if (rdata1 !== 32'hABCD_1234) begin
      $error("Test 2 FAILED: Expected 0xABCD_1234 in r10, got 0x%08h", rdata1);
    end else begin
      $display("Test 2 PASSED");
    end

    //----------------------------------------------------------------
    // TEST 3: Attempt Write with wen=0 (shouldn't change the register)
    //----------------------------------------------------------------
    $display("\n--- TEST 3: Write Attempt with wen=0 ---");
    wsel   = 5'd11;
    wdata  = 32'hDEAD_BEEF;
    wen    = 1'b0;
    @(posedge clk);
    rsel1  = 5'd11;
    @(posedge clk);

    // Check read (expect still 0, if never written before)
    if (rdata1 !== 32'h00000000) begin
      $error("Test 3 FAILED: Expected 0x00000000 in r11 when wen=0, got 0x%08h", rdata1);
    end else begin
      $display("Test 3 PASSED");
    end

    //----------------------------------------------------------------
    // TEST 4: Simultaneous Read/Write to same register
    //         Old data must be read, new data is visible next cycle
    //----------------------------------------------------------------
    $display("\n--- TEST 4: Simultaneous Read/Write (Old data read) ---");
    // Write a known value to r12
    wsel   = 5'd12;
    wdata  = 32'hAAAA_5555;
    wen    = 1'b1;
    @(posedge clk);
    wen    = 1'b0;

    // Next cycle, read & write r12 simultaneously
    wsel   = 5'd12;
    wdata  = 32'hFFFF_0000;
    wen    = 1'b1;
    rsel1  = 5'd12;
    @(posedge clk);

    // Check old data
    if (rdata1 !== 32'hAAAA_5555) begin
      $error("Test 4 FAILED: Expected old data 0xAAAA_5555, got 0x%08h", rdata1);
    end
    // Now read new data in subsequent cycle
    wen   = 1'b0;
    @(posedge clk);
    if (rdata1 !== 32'hFFFF_0000) begin
      $error("Test 4 FAILED: Expected new data 0xFFFF_0000, got 0x%08h", rdata1);
    end else begin
      $display("Test 4 PASSED");
    end

    //----------------------------------------------------------------
    // TEST 5: Edge Cases (r0 and r31)
    //----------------------------------------------------------------
    $display("\n--- TEST 5: Edge Cases (r0 and r31) ---");
    // r0 (in RISC-V typically remains 0 no matter what)
    wsel  = 5'd0;
    wdata = 32'hDECAFBAD;
    wen   = 1'b1;
    @(posedge clk);
    wen   = 1'b0;
    rsel1 = 5'd0;
    @(posedge clk);

    // Check if r0 stays 0
    if (rdata1 !== 32'h00000000) begin
      $error("Test 5 FAILED (r0): Expected 0, got 0x%08h (RISC-V x0 is read-only=0)", rdata1);
    end else begin
      $display("r0 forced to 0 as expected (RISC-V behavior)");
    end

    // r31
    wsel  = 5'd31;
    wdata = 32'h12345678;
    wen   = 1'b1;
    @(posedge clk);
    wen   = 1'b0;
    rsel1 = 5'd31;
    @(posedge clk);

    // Check read
    if (rdata1 !== 32'h12345678) begin
      $error("Test 5 FAILED (r31): Expected 0x12345678, got 0x%08h", rdata1);
    end else begin
      $display("Test 5 PASSED (r31 read correct)");
    end

    //----------------------------------------------------------------
    // TEST 6: Randomized Writes/Reads
    //----------------------------------------------------------------
    $display("\n--- TEST 6: Randomized Writes/Reads ---");
    for (int i = 0; i < 10; i++) begin
      wsel  = 5'($urandom_range(31, 0));
      wdata = $urandom();
      wen   = 1'b1;
      @(posedge clk);
      wen   = 1'b0;
      // Read back
      rsel1 = wsel;
      @(posedge clk);

      if (rdata1 !== wdata) begin
        $error("Test 6 FAILED at iteration %0d: Wrote 0x%08h to r%d, got 0x%08h",
               i, wdata, wsel, rdata1);
      end else begin
        $display("Test 6 iteration %0d PASSED: r%d=0x%08h", i, wsel, rdata1);
      end
    end

    $display("\nAll tests completed. Simulation will end now.\n");
    $finish;
  end

endmodule
