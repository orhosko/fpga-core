module uart_core (
    input wire clk,
    output logic [5:0] leds,
    input wire rst,
    input logic uart_rx,
    output logic uart_tx
);

  logic [31:0] TX_WORD;
  uart_test ut (
      .clk(clk),
      .rst(rst),
      .uart_rx(uart_rx),
      .uart_tx(uart_tx),
      .wbuf(TX_WORD)
  );

  Core core (
      .clk(clk),
      .btn(rst),
      .leds(leds[5:0]),
      .tx_word(TX_WORD)
  );

endmodule
