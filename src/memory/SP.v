//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.10.03 Education
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Mon Feb 17 19:03:58 2025

module Gowin_SP (
    dout,
    clk,
    oce,
    ce,
    reset,
    wre,
    ad,
    din,
    byte_en
);

  output [31:0] dout;
  input clk;
  input oce;
  input ce;
  input reset;
  input wre;
  input [8:0] ad;
  input [31:0] din;
  input [3:0] byte_en;

  wire gw_vcc;
  wire gw_gnd;

  assign gw_vcc = 1'b1;
  assign gw_gnd = 1'b0;

  SP sp_inst_0 (
      .DO(dout[31:0]),
      .CLK(clk),
      .OCE(oce),
      .CE(ce),
      .RESET(reset),
      .WRE(wre),
      .BLKSEL({gw_gnd, gw_gnd, gw_gnd}),
      .AD({ad[8:0], gw_gnd, bt_en[3:0]}),
      .DI(din[31:0])
  );

  defparam sp_inst_0.READ_MODE = 1'b0; defparam sp_inst_0.WRITE_MODE = 2'b00;
      defparam sp_inst_0.BIT_WIDTH = 32; defparam sp_inst_0.BLK_SEL = 3'b000;
      defparam sp_inst_0.RESET_MODE = "SYNC";

endmodule  //Gowin_SP
