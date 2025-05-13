module uart_test (
    input  clk,
    input  rst,
    output uart_tx
);

  parameter CLK_FRE = 27;  //Mhz
  parameter UART_FRE = 115200;  //Mhz

  localparam IDLE = 0;
  localparam SEND = 1;  //send
  localparam WAIT = 2;  //wait 1 second and send uart received data

  reg  [ 7:0] tx_data;
  reg  [ 7:0] tx_str;
  reg         tx_data_valid;
  wire        tx_data_ready;
  reg  [ 7:0] tx_cnt;
  reg  [31:0] wait_cnt;
  reg  [ 3:0] state;

  wire        rst_n = !rst;

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
            tx_cnt <= tx_cnt + 8'd1;  //Send data counter
          end
			else if(tx_data_valid && tx_data_ready)//last byte sent is complete
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

          if (tx_data_valid && tx_data_ready) begin
            tx_data_valid <= 1'b0;
          end else if (wait_cnt >= CLK_FRE * 1000_000)  // wait for 1 second
            state <= SEND;
        end
        default: state <= IDLE;
      endcase
  end

  //combinational logic

  parameter DATA_NUM = 3;  //20 + 1; //中文字符使用UTF8，占用3个字节
  // wire [ DATA_NUM * 8 - 1:0] send_data = {"Hello Tang Nano 20K",16'h0d0a};

  wire [7:0] dout;

  Gowin_pROM prom (
      .dout(dout),  //output [7:0] dout
      .clk(clk),  //input clk
      .oce(1'b1),  //input oce
      .ce(1'b1),  //input ce
      .reset(1'b0),  //input reset
      .ad(tx_cnt)  //input [3:0] ad
  );

  reg count_1s_flag;
  reg [23:0] count_1s = 'd0;

  always @(posedge clk) begin
    if (count_1s < 27000000 / 2) begin
      count_1s <= count_1s + 'd1;
      count_1s_flag <= 'd0;
    end else begin
      count_1s <= 'd0;
      count_1s_flag <= 'd1;
    end
  end

  reg flag = 'd1;

  always @(posedge clk) begin
    if (count_1s_flag) begin
      flag <= ~flag;
    end
  end

  //always@(*)
  // tx_str <= send_data[(DATA_NUM - 1 - tx_cnt) * 8 +: 8];

  assign tx_str = dout;

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
