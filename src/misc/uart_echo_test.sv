module uart_test (
    input clk,
    input rst,
    input uart_rx,
    output uart_tx,
    input logic [32:0] wbuf
);

  parameter CLK_FRE = 27;  //Mhz
  parameter UART_FRE = 115200;  //Mhz

  localparam IDLE = 0;
  localparam SEND = 1;  //send
  localparam WAIT = 2;  //wait 1 second and send uart received data
  localparam ECHO = 3;

  reg  [ 7:0] tx_data;
  reg  [ 7:0] tx_str;
  reg         tx_data_valid;
  wire        tx_data_ready;
  reg  [ 7:0] tx_cnt;
  wire [ 7:0] rx_data;
  wire        rx_data_valid;
  wire        rx_data_ready;
  reg  [31:0] wait_cnt;
  reg  [ 3:0] state;

  wire        rst_n = !rst;

  assign rx_data_ready = 1'b1;  //always can receive data,

  always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
      wait_cnt <= 32'd0;
      tx_data <= 8'd0;
      state <= IDLE;
      tx_cnt <= 8'd0;
      tx_data_valid <= 1'b0;
    end else
      case (state)
        IDLE: state <= SEND;

        SEND: begin
          wait_cnt <= 32'd0;
          tx_data  <= tx_str;

          if(tx_data_valid == 1'b1 && tx_data_ready == 1'b1 && tx_cnt < DATA_NUM - 1)//Send 12 bytes data
          begin
            tx_cnt <= tx_cnt + 8'd1;
          end

          else if(tx_data_valid && tx_data_ready) //last byte sent is complete
          begin
            tx_cnt <= 8'd0;
            tx_data_valid <= 1'b0;
            state <= WAIT;
          end else if (~tx_data_valid) begin
            tx_data_valid <= 1'b1;
          end
        end

        WAIT: begin
          wait_cnt <= wait_cnt + 32'd1;

          if (rx_data_valid == 1'b1) begin

            //rbuf[rbuf_cnt] <= rx_data;

            rbuf_cnt = rbuf_cnt + 1;
            // TODO: is it wrap around?
            // if (rbuf_cnt == RBUF_SIZE - 1) rbuf_cnt <= 0;

            if (rx_data == 16'h0d) begin
              state <= ECHO;
            end

          end else if (tx_data_valid && tx_data_ready) begin
            tx_data_valid <= 1'b0;
          end else if (wait_cnt >= CLK_FRE * 1000_000)  // wait for 1 second
            state <= SEND;
        end
        ECHO: begin
          wait_cnt <= wait_cnt + 32'd1;

          // send_data <= {"echo> ", rbuf ,16'h0d0a};

          if (wait_cnt >= CLK_FRE * 1000_000)  // wait for 1 second
            state <= SEND;
        end
        default: state <= IDLE;
      endcase
  end

  parameter PROMPT_SIZE = 6;  // "echo> "
  parameter RBUF_SIZE = 64;

  reg [5:0] rbuf_cnt;

  parameter DATA_NUM = 4 + 2;
  wire [47:0] send_data = {wbuf, 16'h0d0a};

  always @(*) tx_str <= send_data[(DATA_NUM-1-tx_cnt)*8+:8];

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
