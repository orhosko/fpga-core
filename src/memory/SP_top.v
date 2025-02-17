module SP_test (
    output [5:0] leds,
    input clk,
    input [2:0] fn3
);


  SimDataMem sdm (
      .clk(clk),
      .data_in(data_in),
      .addr_in(addr_in),
      .wr_en(wr_en),
      .fn3(fn3),
      .data_out(data_out)
  );

  assign leds = sdm.data_out[5:0];
endmodule
