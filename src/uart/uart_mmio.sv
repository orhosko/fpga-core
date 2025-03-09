module uart_mmio (
    input  clk,
    input  rst,
    input  uart_rx,
    output uart_tx,
    input  [1:0] addr,      // MMIO Address
    input  wr_en,           // Write Enable
    input  [7:0] wr_data,   // Data from CPU
    output reg [7:0] rd_data // Data to CPU
);

  parameter CLK_FRE  = 27;  // MHz
  parameter UART_FRE = 115200;

  reg [7:0] tx_data;
  reg       tx_data_valid;
  wire      tx_data_ready;
  wire [7:0] rx_data;
  wire       rx_data_valid;
  reg        rx_data_ack; // Software acknowledges RX data

  // Address Map
  localparam ADDR_CTRL = 2'b00;  // Control Register
  localparam ADDR_STAT = 2'b01;  // Status Register
  localparam ADDR_TX   = 2'b10;  // TX Data Register
  localparam ADDR_RX   = 2'b11;  // RX Data Register

  // Memory-Mapped Register Read
  always_comb begin
    case (addr)
      ADDR_CTRL: rd_data = 8'b00000001; // Dummy control reg (can be used for enable bits)
      ADDR_STAT: rd_data = {6'b0, tx_data_ready, rx_data_valid}; // TX/RX status
      ADDR_TX:   rd_data = 8'b0; // Writing-only
      ADDR_RX:   rd_data = rx_data; // Read received data
      default:   rd_data = 8'h00;
    endcase
  end

  // Memory-Mapped Register Write
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      tx_data_valid <= 1'b0;
      rx_data_ack   <= 1'b0;
    end else begin
      if (wr_en) begin
        case (addr)
          ADDR_TX: begin
            tx_data <= wr_data;
            tx_data_valid <= 1'b1; // Start TX when software writes
          end
        endcase
      end

      // Clear tx_data_valid when tx_data is accepted
      if (tx_data_valid && tx_data_ready)
        tx_data_valid <= 1'b0;

      // Acknowledge received data
      if (rx_data_valid && addr == ADDR_RX)
        rx_data_ack <= 1'b1;
      else
        rx_data_ack <= 1'b0;
    end
  end

  assign rx_data_ready = 1'b1; // Always ready to receive

  uart_rx #(
      .CLK_FRE  (CLK_FRE),
      .BAUD_RATE(UART_FRE)
  ) uart_rx_inst (
      .clk          (clk),
      .rst_n        (~rst),
      .rx_data      (rx_data),
      .rx_data_valid(rx_data_valid),
      .rx_data_ready(rx_data_ready),
      .rx_pin       (uart_rx)
  );

  uart_tx #(
      .CLK_FRE  (CLK_FRE),
      .BAUD_RATE(UART_FRE)
  ) uart_tx_inst (
      .clk          (clk),
      .rst_n        (~rst),
      .tx_data      (tx_data),
      .tx_data_valid(tx_data_valid),
      .tx_data_ready(tx_data_ready),
      .tx_pin       (uart_tx)
  );

endmodule
