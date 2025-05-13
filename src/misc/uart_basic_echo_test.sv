module uart_test (
    input  clk,
    input  rst,
    input  uart_rx,
    output uart_tx
);

  parameter CLK_FRE = 27;  //Mhz
  parameter UART_FRE = 115200;  //Mhz

  localparam IDLE = 0;
  localparam SEND = 1;  //send
  localparam WAIT = 2;  //wait 1 second and send uart received data

  reg  [ 7:0] tx_data;
  reg         tx_data_valid;
  wire        tx_data_ready;
  reg  [ 7:0] tx_cnt;
  wire [ 7:0] rx_data;
  wire        rx_data_valid;
  wire        rx_data_ready;
  reg  [31:0] wait_cnt;
  reg  [ 3:0] state;

  wire        rst_n = !rst;

  assign rx_data_ready = 1'b1;  //always can receive data

  always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
      wait_cnt <= 32'd0;
      tx_data <= 8'd0;
      state <= IDLE;
      tx_cnt <= 8'd0;
      tx_data_valid <= 1'b0;
    end else
      case (state)
        IDLE: state <= WAIT;

        SEND: begin
          wait_cnt <= 32'd0;
          // tx_data  <= tx_str;

          if (tx_data_valid && tx_data_ready) begin // send 1 byte
            tx_cnt <= 8'd0;
            tx_data_valid <= 1'b0;
            state <= WAIT;
          end else begin
             state <= WAIT;
          end
        end

        WAIT: begin
          wait_cnt <= wait_cnt + 32'd1;

          if (rx_data_valid == 1'b1) begin
            tx_data_valid <= 1'b1;
            tx_data <= rx_data;  // send uart received data
          end else if (tx_data_valid && tx_data_ready) begin
            tx_data_valid <= 1'b0;
          end else if (wait_cnt >= CLK_FRE * 100_000)  // wait for 0.1 second
            state <= SEND;
        end

        default: state <= IDLE;
      endcase
  end

  uart_rx #(
      .CLK_FRE  (CLK_FRE),
      .BAUD_RATE(UART_FRE)
  ) uart_rx_inst (
      .clk          (clk),
      .rst_n        (rst_n),
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
      .rst_n        (rst_n),
      .tx_data      (tx_data),
      .tx_data_valid(tx_data_valid),
      .tx_data_ready(tx_data_ready),
      .tx_pin       (uart_tx)
  );
endmodule
