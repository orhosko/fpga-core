//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.10.03 Education
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Tue Jan 28 14:37:26 2025

module Gowin_pROM (dout, clk, oce, ce, reset, ad);

output [7:0] dout;
input clk;
input oce;
input ce;
input reset;
input [3:0] ad;

wire [23:0] prom_inst_0_dout_w;
wire gw_gnd;

assign gw_gnd = 1'b0;

pROM prom_inst_0 (
    .DO({prom_inst_0_dout_w[23:0],dout[7:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .AD({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,ad[3:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam prom_inst_0.READ_MODE = 1'b0;
defparam prom_inst_0.BIT_WIDTH = 8;
defparam prom_inst_0.RESET_MODE = "SYNC";
// defparam prom_inst_0.INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000F055AA;

// echo>
// 01100101 01100011 01101000 01101111 00111110
// 01111100 11110110 00010110 11000110 10100110
// 7CF616C6A6
defparam prom_inst_0.INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000007CF616C6A6;

endmodule //Gowin_pROM
