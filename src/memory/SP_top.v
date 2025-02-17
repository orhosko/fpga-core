module SP_test(
    output [5:0] leds,
    input clk
);
   
logic [31:0] dout;
logic clk;
logic oce;
logic ce;
logic reset;
logic wre;
logic [13:0] ad;
logic [31:0] din;

Gowin_SP sp(
        .dout(dout), //output [31:0] dout
        .clk(clk), //input clk
        .oce(oce), //input oce
        .ce(ce), //input ce
        .reset(reset), //input reset
        .wre(wre), //input wre
        .ad(ad), //input [13:0] ad
        .din(din) //input [31:0] din
    );

   assign leds = dout[5:0];

endmodule
