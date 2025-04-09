module i2c_top (
    input  logic       clk,
    input  logic       rst,
    input  logic [6:0] addr,
    input  logic       wr_en,        // Read/Write control (0: Write, 1: Read)
    input  logic [7:0] data_in,   // Data to be transmitted
    output logic [7:0] data_out,  // Data received (for read transactions)
    output logic       scl_pin,   // I²C clock
    inout  wire        sda_pin    // I²C data (bidirectional)
);

  parameter integer CLK_FREQ = 27_000_000;  // System clock frequency in Hz
  parameter integer I2C_FREQ = 100_000;  // I²C clock frequency in Hz

  logic       start = 0;  // Start transaction signal
  logic       busy;  // Busy flag indicates transaction in progress
  logic       done;  // Done flag pulses at transaction end

  logic       ready;
  assign ready = !busy;

  // Address Map
  localparam ADDR_CTRL = 2'b00;  // Control Register
  localparam ADDR_STAT = 2'b01;  // Status Register
  localparam ADDR_TX = 2'b10;  // TX Data Register
  localparam ADDR_RX = 2'b11;  // RX Data Register

  // Memory-Mapped Register Read
  always_comb begin
    case (addr)
      ADDR_CTRL: rd_data = 8'b00000000;  // Dummy control reg (can be used for enable bits)
      ADDR_STAT: rd_data = {6'b0, ready, 0};  // TX/RX status
      ADDR_TX:   rd_data = 8'b00000000;  // Writing-only
      // ADDR_RX:   rd_data = rx_data;  // Read received data
      default:   rd_data = 8'h00000000;
    endcase
  end

  // Memory-Mapped Register Write
  always @(posedge clk) begin
     if (start) begin
        start <= 1'b0;
     end

     if (wr_en && addr == ADDR_TX)  begin
        tx_data <= wr_data;
        start <= 1'b1;
     end

      if (tx_data_valid && tx_data_ready) tx_data_valid <= 1'b0;
  end

  i2c_master #(
      .CLK_FREQ(CLK_FREQ),
      .I2C_FREQ(I2C_FREQ)
  ) master (
      .clk     (clk),
      .rst     (rst),
      .start   (start),
      .addr    (addr),
      .rw      (0),
      .data_in (tx_data),
      .data_out(),
      .busy    (busy),
      .done    (done),
      .scl     (scl_pin),
      .sda     (sda_pin)
  );

endmodule
