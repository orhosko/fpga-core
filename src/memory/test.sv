module test (
    //input  wire [1:0] buttons,
    input  wire clk,
    output wire [5:0] leds
); 

wire [7:0] dout;
wire [3:0] ad;

Gowin_pROM prom(
    .dout(dout), //output [7:0] dout
    .clk(clk), //input clk
    .oce(1'b1), //input oce
    .ce(1'b1), //input ce
    .reset(1'b0), //input reset
    .ad(ad) //input [3:0] ad
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

assign ad = flag ? 4'b0 : 4'b1;
assign leds = dout[5:0];

endmodule
