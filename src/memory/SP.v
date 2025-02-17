//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.10.03 Education
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Mon Feb 17 16:40:07 2025

module Gowin_SP (dout, clk, oce, ce, reset, wre, ad, din);

output [31:0] dout;
input clk;
input oce;
input ce;
input reset;
input wre;
input [13:0] ad;
input [31:0] din;

wire [26:0] spx9_inst_0_dout_w;
wire [8:0] spx9_inst_0_dout;
wire [26:0] spx9_inst_1_dout_w;
wire [8:0] spx9_inst_1_dout;
wire [26:0] spx9_inst_2_dout_w;
wire [8:0] spx9_inst_2_dout;
wire [26:0] spx9_inst_3_dout_w;
wire [8:0] spx9_inst_3_dout;
wire [26:0] spx9_inst_4_dout_w;
wire [8:0] spx9_inst_4_dout;
wire [26:0] spx9_inst_5_dout_w;
wire [8:0] spx9_inst_5_dout;
wire [26:0] spx9_inst_6_dout_w;
wire [8:0] spx9_inst_6_dout;
wire [26:0] spx9_inst_7_dout_w;
wire [8:0] spx9_inst_7_dout;
wire [26:0] spx9_inst_8_dout_w;
wire [17:9] spx9_inst_8_dout;
wire [26:0] spx9_inst_9_dout_w;
wire [17:9] spx9_inst_9_dout;
wire [26:0] spx9_inst_10_dout_w;
wire [17:9] spx9_inst_10_dout;
wire [26:0] spx9_inst_11_dout_w;
wire [17:9] spx9_inst_11_dout;
wire [26:0] spx9_inst_12_dout_w;
wire [17:9] spx9_inst_12_dout;
wire [26:0] spx9_inst_13_dout_w;
wire [17:9] spx9_inst_13_dout;
wire [26:0] spx9_inst_14_dout_w;
wire [17:9] spx9_inst_14_dout;
wire [26:0] spx9_inst_15_dout_w;
wire [17:9] spx9_inst_15_dout;
wire [26:0] spx9_inst_16_dout_w;
wire [26:18] spx9_inst_16_dout;
wire [26:0] spx9_inst_17_dout_w;
wire [26:18] spx9_inst_17_dout;
wire [26:0] spx9_inst_18_dout_w;
wire [26:18] spx9_inst_18_dout;
wire [26:0] spx9_inst_19_dout_w;
wire [26:18] spx9_inst_19_dout;
wire [26:0] spx9_inst_20_dout_w;
wire [26:18] spx9_inst_20_dout;
wire [26:0] spx9_inst_21_dout_w;
wire [26:18] spx9_inst_21_dout;
wire [26:0] spx9_inst_22_dout_w;
wire [26:18] spx9_inst_22_dout;
wire [26:0] spx9_inst_23_dout_w;
wire [26:18] spx9_inst_23_dout;
wire [30:0] sp_inst_24_dout_w;
wire [30:0] sp_inst_25_dout_w;
wire [30:0] sp_inst_26_dout_w;
wire [30:0] sp_inst_27_dout_w;
wire [30:0] sp_inst_28_dout_w;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire mux_o_0;
wire mux_o_1;
wire mux_o_2;
wire mux_o_3;
wire mux_o_4;
wire mux_o_5;
wire mux_o_7;
wire mux_o_8;
wire mux_o_9;
wire mux_o_10;
wire mux_o_11;
wire mux_o_12;
wire mux_o_14;
wire mux_o_15;
wire mux_o_16;
wire mux_o_17;
wire mux_o_18;
wire mux_o_19;
wire mux_o_21;
wire mux_o_22;
wire mux_o_23;
wire mux_o_24;
wire mux_o_25;
wire mux_o_26;
wire mux_o_28;
wire mux_o_29;
wire mux_o_30;
wire mux_o_31;
wire mux_o_32;
wire mux_o_33;
wire mux_o_35;
wire mux_o_36;
wire mux_o_37;
wire mux_o_38;
wire mux_o_39;
wire mux_o_40;
wire mux_o_42;
wire mux_o_43;
wire mux_o_44;
wire mux_o_45;
wire mux_o_46;
wire mux_o_47;
wire mux_o_49;
wire mux_o_50;
wire mux_o_51;
wire mux_o_52;
wire mux_o_53;
wire mux_o_54;
wire mux_o_56;
wire mux_o_57;
wire mux_o_58;
wire mux_o_59;
wire mux_o_60;
wire mux_o_61;
wire mux_o_63;
wire mux_o_64;
wire mux_o_65;
wire mux_o_66;
wire mux_o_67;
wire mux_o_68;
wire mux_o_70;
wire mux_o_71;
wire mux_o_72;
wire mux_o_73;
wire mux_o_74;
wire mux_o_75;
wire mux_o_77;
wire mux_o_78;
wire mux_o_79;
wire mux_o_80;
wire mux_o_81;
wire mux_o_82;
wire mux_o_84;
wire mux_o_85;
wire mux_o_86;
wire mux_o_87;
wire mux_o_88;
wire mux_o_89;
wire mux_o_91;
wire mux_o_92;
wire mux_o_93;
wire mux_o_94;
wire mux_o_95;
wire mux_o_96;
wire mux_o_98;
wire mux_o_99;
wire mux_o_100;
wire mux_o_101;
wire mux_o_102;
wire mux_o_103;
wire mux_o_105;
wire mux_o_106;
wire mux_o_107;
wire mux_o_108;
wire mux_o_109;
wire mux_o_110;
wire mux_o_112;
wire mux_o_113;
wire mux_o_114;
wire mux_o_115;
wire mux_o_116;
wire mux_o_117;
wire mux_o_119;
wire mux_o_120;
wire mux_o_121;
wire mux_o_122;
wire mux_o_123;
wire mux_o_124;
wire mux_o_126;
wire mux_o_127;
wire mux_o_128;
wire mux_o_129;
wire mux_o_130;
wire mux_o_131;
wire mux_o_133;
wire mux_o_134;
wire mux_o_135;
wire mux_o_136;
wire mux_o_137;
wire mux_o_138;
wire mux_o_140;
wire mux_o_141;
wire mux_o_142;
wire mux_o_143;
wire mux_o_144;
wire mux_o_145;
wire mux_o_147;
wire mux_o_148;
wire mux_o_149;
wire mux_o_150;
wire mux_o_151;
wire mux_o_152;
wire mux_o_154;
wire mux_o_155;
wire mux_o_156;
wire mux_o_157;
wire mux_o_158;
wire mux_o_159;
wire mux_o_161;
wire mux_o_162;
wire mux_o_163;
wire mux_o_164;
wire mux_o_165;
wire mux_o_166;
wire mux_o_168;
wire mux_o_169;
wire mux_o_170;
wire mux_o_171;
wire mux_o_172;
wire mux_o_173;
wire mux_o_175;
wire mux_o_176;
wire mux_o_177;
wire mux_o_178;
wire mux_o_179;
wire mux_o_180;
wire mux_o_182;
wire mux_o_183;
wire mux_o_184;
wire mux_o_185;
wire mux_o_186;
wire mux_o_187;
wire ce_w;
wire gw_gnd;

assign ce_w = ~wre & ce;
assign gw_gnd = 1'b0;

SPX9 spx9_inst_0 (
    .DO({spx9_inst_0_dout_w[26:0],spx9_inst_0_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_0.READ_MODE = 1'b0;
defparam spx9_inst_0.WRITE_MODE = 2'b00;
defparam spx9_inst_0.BIT_WIDTH = 9;
defparam spx9_inst_0.BLK_SEL = 3'b000;
defparam spx9_inst_0.RESET_MODE = "SYNC";

SPX9 spx9_inst_1 (
    .DO({spx9_inst_1_dout_w[26:0],spx9_inst_1_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_1.READ_MODE = 1'b0;
defparam spx9_inst_1.WRITE_MODE = 2'b00;
defparam spx9_inst_1.BIT_WIDTH = 9;
defparam spx9_inst_1.BLK_SEL = 3'b001;
defparam spx9_inst_1.RESET_MODE = "SYNC";

SPX9 spx9_inst_2 (
    .DO({spx9_inst_2_dout_w[26:0],spx9_inst_2_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_2.READ_MODE = 1'b0;
defparam spx9_inst_2.WRITE_MODE = 2'b00;
defparam spx9_inst_2.BIT_WIDTH = 9;
defparam spx9_inst_2.BLK_SEL = 3'b010;
defparam spx9_inst_2.RESET_MODE = "SYNC";

SPX9 spx9_inst_3 (
    .DO({spx9_inst_3_dout_w[26:0],spx9_inst_3_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_3.READ_MODE = 1'b0;
defparam spx9_inst_3.WRITE_MODE = 2'b00;
defparam spx9_inst_3.BIT_WIDTH = 9;
defparam spx9_inst_3.BLK_SEL = 3'b011;
defparam spx9_inst_3.RESET_MODE = "SYNC";

SPX9 spx9_inst_4 (
    .DO({spx9_inst_4_dout_w[26:0],spx9_inst_4_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_4.READ_MODE = 1'b0;
defparam spx9_inst_4.WRITE_MODE = 2'b00;
defparam spx9_inst_4.BIT_WIDTH = 9;
defparam spx9_inst_4.BLK_SEL = 3'b100;
defparam spx9_inst_4.RESET_MODE = "SYNC";

SPX9 spx9_inst_5 (
    .DO({spx9_inst_5_dout_w[26:0],spx9_inst_5_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_5.READ_MODE = 1'b0;
defparam spx9_inst_5.WRITE_MODE = 2'b00;
defparam spx9_inst_5.BIT_WIDTH = 9;
defparam spx9_inst_5.BLK_SEL = 3'b101;
defparam spx9_inst_5.RESET_MODE = "SYNC";

SPX9 spx9_inst_6 (
    .DO({spx9_inst_6_dout_w[26:0],spx9_inst_6_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_6.READ_MODE = 1'b0;
defparam spx9_inst_6.WRITE_MODE = 2'b00;
defparam spx9_inst_6.BIT_WIDTH = 9;
defparam spx9_inst_6.BLK_SEL = 3'b110;
defparam spx9_inst_6.RESET_MODE = "SYNC";

SPX9 spx9_inst_7 (
    .DO({spx9_inst_7_dout_w[26:0],spx9_inst_7_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_7.READ_MODE = 1'b0;
defparam spx9_inst_7.WRITE_MODE = 2'b00;
defparam spx9_inst_7.BIT_WIDTH = 9;
defparam spx9_inst_7.BLK_SEL = 3'b111;
defparam spx9_inst_7.RESET_MODE = "SYNC";

SPX9 spx9_inst_8 (
    .DO({spx9_inst_8_dout_w[26:0],spx9_inst_8_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_8.READ_MODE = 1'b0;
defparam spx9_inst_8.WRITE_MODE = 2'b00;
defparam spx9_inst_8.BIT_WIDTH = 9;
defparam spx9_inst_8.BLK_SEL = 3'b000;
defparam spx9_inst_8.RESET_MODE = "SYNC";

SPX9 spx9_inst_9 (
    .DO({spx9_inst_9_dout_w[26:0],spx9_inst_9_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_9.READ_MODE = 1'b0;
defparam spx9_inst_9.WRITE_MODE = 2'b00;
defparam spx9_inst_9.BIT_WIDTH = 9;
defparam spx9_inst_9.BLK_SEL = 3'b001;
defparam spx9_inst_9.RESET_MODE = "SYNC";

SPX9 spx9_inst_10 (
    .DO({spx9_inst_10_dout_w[26:0],spx9_inst_10_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_10.READ_MODE = 1'b0;
defparam spx9_inst_10.WRITE_MODE = 2'b00;
defparam spx9_inst_10.BIT_WIDTH = 9;
defparam spx9_inst_10.BLK_SEL = 3'b010;
defparam spx9_inst_10.RESET_MODE = "SYNC";

SPX9 spx9_inst_11 (
    .DO({spx9_inst_11_dout_w[26:0],spx9_inst_11_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_11.READ_MODE = 1'b0;
defparam spx9_inst_11.WRITE_MODE = 2'b00;
defparam spx9_inst_11.BIT_WIDTH = 9;
defparam spx9_inst_11.BLK_SEL = 3'b011;
defparam spx9_inst_11.RESET_MODE = "SYNC";

SPX9 spx9_inst_12 (
    .DO({spx9_inst_12_dout_w[26:0],spx9_inst_12_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_12.READ_MODE = 1'b0;
defparam spx9_inst_12.WRITE_MODE = 2'b00;
defparam spx9_inst_12.BIT_WIDTH = 9;
defparam spx9_inst_12.BLK_SEL = 3'b100;
defparam spx9_inst_12.RESET_MODE = "SYNC";

SPX9 spx9_inst_13 (
    .DO({spx9_inst_13_dout_w[26:0],spx9_inst_13_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_13.READ_MODE = 1'b0;
defparam spx9_inst_13.WRITE_MODE = 2'b00;
defparam spx9_inst_13.BIT_WIDTH = 9;
defparam spx9_inst_13.BLK_SEL = 3'b101;
defparam spx9_inst_13.RESET_MODE = "SYNC";

SPX9 spx9_inst_14 (
    .DO({spx9_inst_14_dout_w[26:0],spx9_inst_14_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_14.READ_MODE = 1'b0;
defparam spx9_inst_14.WRITE_MODE = 2'b00;
defparam spx9_inst_14.BIT_WIDTH = 9;
defparam spx9_inst_14.BLK_SEL = 3'b110;
defparam spx9_inst_14.RESET_MODE = "SYNC";

SPX9 spx9_inst_15 (
    .DO({spx9_inst_15_dout_w[26:0],spx9_inst_15_dout[17:9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]})
);

defparam spx9_inst_15.READ_MODE = 1'b0;
defparam spx9_inst_15.WRITE_MODE = 2'b00;
defparam spx9_inst_15.BIT_WIDTH = 9;
defparam spx9_inst_15.BLK_SEL = 3'b111;
defparam spx9_inst_15.RESET_MODE = "SYNC";

SPX9 spx9_inst_16 (
    .DO({spx9_inst_16_dout_w[26:0],spx9_inst_16_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_16.READ_MODE = 1'b0;
defparam spx9_inst_16.WRITE_MODE = 2'b00;
defparam spx9_inst_16.BIT_WIDTH = 9;
defparam spx9_inst_16.BLK_SEL = 3'b000;
defparam spx9_inst_16.RESET_MODE = "SYNC";

SPX9 spx9_inst_17 (
    .DO({spx9_inst_17_dout_w[26:0],spx9_inst_17_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_17.READ_MODE = 1'b0;
defparam spx9_inst_17.WRITE_MODE = 2'b00;
defparam spx9_inst_17.BIT_WIDTH = 9;
defparam spx9_inst_17.BLK_SEL = 3'b001;
defparam spx9_inst_17.RESET_MODE = "SYNC";

SPX9 spx9_inst_18 (
    .DO({spx9_inst_18_dout_w[26:0],spx9_inst_18_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_18.READ_MODE = 1'b0;
defparam spx9_inst_18.WRITE_MODE = 2'b00;
defparam spx9_inst_18.BIT_WIDTH = 9;
defparam spx9_inst_18.BLK_SEL = 3'b010;
defparam spx9_inst_18.RESET_MODE = "SYNC";

SPX9 spx9_inst_19 (
    .DO({spx9_inst_19_dout_w[26:0],spx9_inst_19_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_19.READ_MODE = 1'b0;
defparam spx9_inst_19.WRITE_MODE = 2'b00;
defparam spx9_inst_19.BIT_WIDTH = 9;
defparam spx9_inst_19.BLK_SEL = 3'b011;
defparam spx9_inst_19.RESET_MODE = "SYNC";

SPX9 spx9_inst_20 (
    .DO({spx9_inst_20_dout_w[26:0],spx9_inst_20_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_20.READ_MODE = 1'b0;
defparam spx9_inst_20.WRITE_MODE = 2'b00;
defparam spx9_inst_20.BIT_WIDTH = 9;
defparam spx9_inst_20.BLK_SEL = 3'b100;
defparam spx9_inst_20.RESET_MODE = "SYNC";

SPX9 spx9_inst_21 (
    .DO({spx9_inst_21_dout_w[26:0],spx9_inst_21_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_21.READ_MODE = 1'b0;
defparam spx9_inst_21.WRITE_MODE = 2'b00;
defparam spx9_inst_21.BIT_WIDTH = 9;
defparam spx9_inst_21.BLK_SEL = 3'b101;
defparam spx9_inst_21.RESET_MODE = "SYNC";

SPX9 spx9_inst_22 (
    .DO({spx9_inst_22_dout_w[26:0],spx9_inst_22_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_22.READ_MODE = 1'b0;
defparam spx9_inst_22.WRITE_MODE = 2'b00;
defparam spx9_inst_22.BIT_WIDTH = 9;
defparam spx9_inst_22.BLK_SEL = 3'b110;
defparam spx9_inst_22.RESET_MODE = "SYNC";

SPX9 spx9_inst_23 (
    .DO({spx9_inst_23_dout_w[26:0],spx9_inst_23_dout[26:18]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[13],ad[12],ad[11]}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]})
);

defparam spx9_inst_23.READ_MODE = 1'b0;
defparam spx9_inst_23.WRITE_MODE = 2'b00;
defparam spx9_inst_23.BIT_WIDTH = 9;
defparam spx9_inst_23.BLK_SEL = 3'b111;
defparam spx9_inst_23.RESET_MODE = "SYNC";

SP sp_inst_24 (
    .DO({sp_inst_24_dout_w[30:0],dout[27]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,gw_gnd}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[27]})
);

defparam sp_inst_24.READ_MODE = 1'b0;
defparam sp_inst_24.WRITE_MODE = 2'b00;
defparam sp_inst_24.BIT_WIDTH = 1;
defparam sp_inst_24.BLK_SEL = 3'b000;
defparam sp_inst_24.RESET_MODE = "SYNC";

SP sp_inst_25 (
    .DO({sp_inst_25_dout_w[30:0],dout[28]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,gw_gnd}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[28]})
);

defparam sp_inst_25.READ_MODE = 1'b0;
defparam sp_inst_25.WRITE_MODE = 2'b00;
defparam sp_inst_25.BIT_WIDTH = 1;
defparam sp_inst_25.BLK_SEL = 3'b000;
defparam sp_inst_25.RESET_MODE = "SYNC";

SP sp_inst_26 (
    .DO({sp_inst_26_dout_w[30:0],dout[29]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,gw_gnd}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[29]})
);

defparam sp_inst_26.READ_MODE = 1'b0;
defparam sp_inst_26.WRITE_MODE = 2'b00;
defparam sp_inst_26.BIT_WIDTH = 1;
defparam sp_inst_26.BLK_SEL = 3'b000;
defparam sp_inst_26.RESET_MODE = "SYNC";

SP sp_inst_27 (
    .DO({sp_inst_27_dout_w[30:0],dout[30]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,gw_gnd}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[30]})
);

defparam sp_inst_27.READ_MODE = 1'b0;
defparam sp_inst_27.WRITE_MODE = 2'b00;
defparam sp_inst_27.BIT_WIDTH = 1;
defparam sp_inst_27.BLK_SEL = 3'b000;
defparam sp_inst_27.RESET_MODE = "SYNC";

SP sp_inst_28 (
    .DO({sp_inst_28_dout_w[30:0],dout[31]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,gw_gnd}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[31]})
);

defparam sp_inst_28.READ_MODE = 1'b0;
defparam sp_inst_28.WRITE_MODE = 2'b00;
defparam sp_inst_28.BIT_WIDTH = 1;
defparam sp_inst_28.BLK_SEL = 3'b000;
defparam sp_inst_28.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ad[13]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ad[12]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(ad[11]),
  .CLK(clk),
  .CE(ce_w)
);
MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(spx9_inst_0_dout[0]),
  .I1(spx9_inst_1_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(spx9_inst_2_dout[0]),
  .I1(spx9_inst_3_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_2 (
  .O(mux_o_2),
  .I0(spx9_inst_4_dout[0]),
  .I1(spx9_inst_5_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(spx9_inst_6_dout[0]),
  .I1(spx9_inst_7_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_4 (
  .O(mux_o_4),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(dff_q_1)
);
MUX2 mux_inst_5 (
  .O(mux_o_5),
  .I0(mux_o_2),
  .I1(mux_o_3),
  .S0(dff_q_1)
);
MUX2 mux_inst_6 (
  .O(dout[0]),
  .I0(mux_o_4),
  .I1(mux_o_5),
  .S0(dff_q_0)
);
MUX2 mux_inst_7 (
  .O(mux_o_7),
  .I0(spx9_inst_0_dout[1]),
  .I1(spx9_inst_1_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_8 (
  .O(mux_o_8),
  .I0(spx9_inst_2_dout[1]),
  .I1(spx9_inst_3_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(spx9_inst_4_dout[1]),
  .I1(spx9_inst_5_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(spx9_inst_6_dout[1]),
  .I1(spx9_inst_7_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(mux_o_7),
  .I1(mux_o_8),
  .S0(dff_q_1)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(mux_o_9),
  .I1(mux_o_10),
  .S0(dff_q_1)
);
MUX2 mux_inst_13 (
  .O(dout[1]),
  .I0(mux_o_11),
  .I1(mux_o_12),
  .S0(dff_q_0)
);
MUX2 mux_inst_14 (
  .O(mux_o_14),
  .I0(spx9_inst_0_dout[2]),
  .I1(spx9_inst_1_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(spx9_inst_2_dout[2]),
  .I1(spx9_inst_3_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(spx9_inst_4_dout[2]),
  .I1(spx9_inst_5_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_17 (
  .O(mux_o_17),
  .I0(spx9_inst_6_dout[2]),
  .I1(spx9_inst_7_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(mux_o_14),
  .I1(mux_o_15),
  .S0(dff_q_1)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(mux_o_16),
  .I1(mux_o_17),
  .S0(dff_q_1)
);
MUX2 mux_inst_20 (
  .O(dout[2]),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(dff_q_0)
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(spx9_inst_0_dout[3]),
  .I1(spx9_inst_1_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_22 (
  .O(mux_o_22),
  .I0(spx9_inst_2_dout[3]),
  .I1(spx9_inst_3_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_23 (
  .O(mux_o_23),
  .I0(spx9_inst_4_dout[3]),
  .I1(spx9_inst_5_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(spx9_inst_6_dout[3]),
  .I1(spx9_inst_7_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(mux_o_21),
  .I1(mux_o_22),
  .S0(dff_q_1)
);
MUX2 mux_inst_26 (
  .O(mux_o_26),
  .I0(mux_o_23),
  .I1(mux_o_24),
  .S0(dff_q_1)
);
MUX2 mux_inst_27 (
  .O(dout[3]),
  .I0(mux_o_25),
  .I1(mux_o_26),
  .S0(dff_q_0)
);
MUX2 mux_inst_28 (
  .O(mux_o_28),
  .I0(spx9_inst_0_dout[4]),
  .I1(spx9_inst_1_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_29 (
  .O(mux_o_29),
  .I0(spx9_inst_2_dout[4]),
  .I1(spx9_inst_3_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(spx9_inst_4_dout[4]),
  .I1(spx9_inst_5_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(spx9_inst_6_dout[4]),
  .I1(spx9_inst_7_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(mux_o_28),
  .I1(mux_o_29),
  .S0(dff_q_1)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(mux_o_30),
  .I1(mux_o_31),
  .S0(dff_q_1)
);
MUX2 mux_inst_34 (
  .O(dout[4]),
  .I0(mux_o_32),
  .I1(mux_o_33),
  .S0(dff_q_0)
);
MUX2 mux_inst_35 (
  .O(mux_o_35),
  .I0(spx9_inst_0_dout[5]),
  .I1(spx9_inst_1_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(spx9_inst_2_dout[5]),
  .I1(spx9_inst_3_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(spx9_inst_4_dout[5]),
  .I1(spx9_inst_5_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_38 (
  .O(mux_o_38),
  .I0(spx9_inst_6_dout[5]),
  .I1(spx9_inst_7_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_35),
  .I1(mux_o_36),
  .S0(dff_q_1)
);
MUX2 mux_inst_40 (
  .O(mux_o_40),
  .I0(mux_o_37),
  .I1(mux_o_38),
  .S0(dff_q_1)
);
MUX2 mux_inst_41 (
  .O(dout[5]),
  .I0(mux_o_39),
  .I1(mux_o_40),
  .S0(dff_q_0)
);
MUX2 mux_inst_42 (
  .O(mux_o_42),
  .I0(spx9_inst_0_dout[6]),
  .I1(spx9_inst_1_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_43 (
  .O(mux_o_43),
  .I0(spx9_inst_2_dout[6]),
  .I1(spx9_inst_3_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_44 (
  .O(mux_o_44),
  .I0(spx9_inst_4_dout[6]),
  .I1(spx9_inst_5_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(spx9_inst_6_dout[6]),
  .I1(spx9_inst_7_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_46 (
  .O(mux_o_46),
  .I0(mux_o_42),
  .I1(mux_o_43),
  .S0(dff_q_1)
);
MUX2 mux_inst_47 (
  .O(mux_o_47),
  .I0(mux_o_44),
  .I1(mux_o_45),
  .S0(dff_q_1)
);
MUX2 mux_inst_48 (
  .O(dout[6]),
  .I0(mux_o_46),
  .I1(mux_o_47),
  .S0(dff_q_0)
);
MUX2 mux_inst_49 (
  .O(mux_o_49),
  .I0(spx9_inst_0_dout[7]),
  .I1(spx9_inst_1_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_50 (
  .O(mux_o_50),
  .I0(spx9_inst_2_dout[7]),
  .I1(spx9_inst_3_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_51 (
  .O(mux_o_51),
  .I0(spx9_inst_4_dout[7]),
  .I1(spx9_inst_5_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_52 (
  .O(mux_o_52),
  .I0(spx9_inst_6_dout[7]),
  .I1(spx9_inst_7_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_53 (
  .O(mux_o_53),
  .I0(mux_o_49),
  .I1(mux_o_50),
  .S0(dff_q_1)
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(mux_o_51),
  .I1(mux_o_52),
  .S0(dff_q_1)
);
MUX2 mux_inst_55 (
  .O(dout[7]),
  .I0(mux_o_53),
  .I1(mux_o_54),
  .S0(dff_q_0)
);
MUX2 mux_inst_56 (
  .O(mux_o_56),
  .I0(spx9_inst_0_dout[8]),
  .I1(spx9_inst_1_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(spx9_inst_2_dout[8]),
  .I1(spx9_inst_3_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(spx9_inst_4_dout[8]),
  .I1(spx9_inst_5_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_59 (
  .O(mux_o_59),
  .I0(spx9_inst_6_dout[8]),
  .I1(spx9_inst_7_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(mux_o_56),
  .I1(mux_o_57),
  .S0(dff_q_1)
);
MUX2 mux_inst_61 (
  .O(mux_o_61),
  .I0(mux_o_58),
  .I1(mux_o_59),
  .S0(dff_q_1)
);
MUX2 mux_inst_62 (
  .O(dout[8]),
  .I0(mux_o_60),
  .I1(mux_o_61),
  .S0(dff_q_0)
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(spx9_inst_8_dout[9]),
  .I1(spx9_inst_9_dout[9]),
  .S0(dff_q_2)
);
MUX2 mux_inst_64 (
  .O(mux_o_64),
  .I0(spx9_inst_10_dout[9]),
  .I1(spx9_inst_11_dout[9]),
  .S0(dff_q_2)
);
MUX2 mux_inst_65 (
  .O(mux_o_65),
  .I0(spx9_inst_12_dout[9]),
  .I1(spx9_inst_13_dout[9]),
  .S0(dff_q_2)
);
MUX2 mux_inst_66 (
  .O(mux_o_66),
  .I0(spx9_inst_14_dout[9]),
  .I1(spx9_inst_15_dout[9]),
  .S0(dff_q_2)
);
MUX2 mux_inst_67 (
  .O(mux_o_67),
  .I0(mux_o_63),
  .I1(mux_o_64),
  .S0(dff_q_1)
);
MUX2 mux_inst_68 (
  .O(mux_o_68),
  .I0(mux_o_65),
  .I1(mux_o_66),
  .S0(dff_q_1)
);
MUX2 mux_inst_69 (
  .O(dout[9]),
  .I0(mux_o_67),
  .I1(mux_o_68),
  .S0(dff_q_0)
);
MUX2 mux_inst_70 (
  .O(mux_o_70),
  .I0(spx9_inst_8_dout[10]),
  .I1(spx9_inst_9_dout[10]),
  .S0(dff_q_2)
);
MUX2 mux_inst_71 (
  .O(mux_o_71),
  .I0(spx9_inst_10_dout[10]),
  .I1(spx9_inst_11_dout[10]),
  .S0(dff_q_2)
);
MUX2 mux_inst_72 (
  .O(mux_o_72),
  .I0(spx9_inst_12_dout[10]),
  .I1(spx9_inst_13_dout[10]),
  .S0(dff_q_2)
);
MUX2 mux_inst_73 (
  .O(mux_o_73),
  .I0(spx9_inst_14_dout[10]),
  .I1(spx9_inst_15_dout[10]),
  .S0(dff_q_2)
);
MUX2 mux_inst_74 (
  .O(mux_o_74),
  .I0(mux_o_70),
  .I1(mux_o_71),
  .S0(dff_q_1)
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(mux_o_72),
  .I1(mux_o_73),
  .S0(dff_q_1)
);
MUX2 mux_inst_76 (
  .O(dout[10]),
  .I0(mux_o_74),
  .I1(mux_o_75),
  .S0(dff_q_0)
);
MUX2 mux_inst_77 (
  .O(mux_o_77),
  .I0(spx9_inst_8_dout[11]),
  .I1(spx9_inst_9_dout[11]),
  .S0(dff_q_2)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(spx9_inst_10_dout[11]),
  .I1(spx9_inst_11_dout[11]),
  .S0(dff_q_2)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(spx9_inst_12_dout[11]),
  .I1(spx9_inst_13_dout[11]),
  .S0(dff_q_2)
);
MUX2 mux_inst_80 (
  .O(mux_o_80),
  .I0(spx9_inst_14_dout[11]),
  .I1(spx9_inst_15_dout[11]),
  .S0(dff_q_2)
);
MUX2 mux_inst_81 (
  .O(mux_o_81),
  .I0(mux_o_77),
  .I1(mux_o_78),
  .S0(dff_q_1)
);
MUX2 mux_inst_82 (
  .O(mux_o_82),
  .I0(mux_o_79),
  .I1(mux_o_80),
  .S0(dff_q_1)
);
MUX2 mux_inst_83 (
  .O(dout[11]),
  .I0(mux_o_81),
  .I1(mux_o_82),
  .S0(dff_q_0)
);
MUX2 mux_inst_84 (
  .O(mux_o_84),
  .I0(spx9_inst_8_dout[12]),
  .I1(spx9_inst_9_dout[12]),
  .S0(dff_q_2)
);
MUX2 mux_inst_85 (
  .O(mux_o_85),
  .I0(spx9_inst_10_dout[12]),
  .I1(spx9_inst_11_dout[12]),
  .S0(dff_q_2)
);
MUX2 mux_inst_86 (
  .O(mux_o_86),
  .I0(spx9_inst_12_dout[12]),
  .I1(spx9_inst_13_dout[12]),
  .S0(dff_q_2)
);
MUX2 mux_inst_87 (
  .O(mux_o_87),
  .I0(spx9_inst_14_dout[12]),
  .I1(spx9_inst_15_dout[12]),
  .S0(dff_q_2)
);
MUX2 mux_inst_88 (
  .O(mux_o_88),
  .I0(mux_o_84),
  .I1(mux_o_85),
  .S0(dff_q_1)
);
MUX2 mux_inst_89 (
  .O(mux_o_89),
  .I0(mux_o_86),
  .I1(mux_o_87),
  .S0(dff_q_1)
);
MUX2 mux_inst_90 (
  .O(dout[12]),
  .I0(mux_o_88),
  .I1(mux_o_89),
  .S0(dff_q_0)
);
MUX2 mux_inst_91 (
  .O(mux_o_91),
  .I0(spx9_inst_8_dout[13]),
  .I1(spx9_inst_9_dout[13]),
  .S0(dff_q_2)
);
MUX2 mux_inst_92 (
  .O(mux_o_92),
  .I0(spx9_inst_10_dout[13]),
  .I1(spx9_inst_11_dout[13]),
  .S0(dff_q_2)
);
MUX2 mux_inst_93 (
  .O(mux_o_93),
  .I0(spx9_inst_12_dout[13]),
  .I1(spx9_inst_13_dout[13]),
  .S0(dff_q_2)
);
MUX2 mux_inst_94 (
  .O(mux_o_94),
  .I0(spx9_inst_14_dout[13]),
  .I1(spx9_inst_15_dout[13]),
  .S0(dff_q_2)
);
MUX2 mux_inst_95 (
  .O(mux_o_95),
  .I0(mux_o_91),
  .I1(mux_o_92),
  .S0(dff_q_1)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(mux_o_93),
  .I1(mux_o_94),
  .S0(dff_q_1)
);
MUX2 mux_inst_97 (
  .O(dout[13]),
  .I0(mux_o_95),
  .I1(mux_o_96),
  .S0(dff_q_0)
);
MUX2 mux_inst_98 (
  .O(mux_o_98),
  .I0(spx9_inst_8_dout[14]),
  .I1(spx9_inst_9_dout[14]),
  .S0(dff_q_2)
);
MUX2 mux_inst_99 (
  .O(mux_o_99),
  .I0(spx9_inst_10_dout[14]),
  .I1(spx9_inst_11_dout[14]),
  .S0(dff_q_2)
);
MUX2 mux_inst_100 (
  .O(mux_o_100),
  .I0(spx9_inst_12_dout[14]),
  .I1(spx9_inst_13_dout[14]),
  .S0(dff_q_2)
);
MUX2 mux_inst_101 (
  .O(mux_o_101),
  .I0(spx9_inst_14_dout[14]),
  .I1(spx9_inst_15_dout[14]),
  .S0(dff_q_2)
);
MUX2 mux_inst_102 (
  .O(mux_o_102),
  .I0(mux_o_98),
  .I1(mux_o_99),
  .S0(dff_q_1)
);
MUX2 mux_inst_103 (
  .O(mux_o_103),
  .I0(mux_o_100),
  .I1(mux_o_101),
  .S0(dff_q_1)
);
MUX2 mux_inst_104 (
  .O(dout[14]),
  .I0(mux_o_102),
  .I1(mux_o_103),
  .S0(dff_q_0)
);
MUX2 mux_inst_105 (
  .O(mux_o_105),
  .I0(spx9_inst_8_dout[15]),
  .I1(spx9_inst_9_dout[15]),
  .S0(dff_q_2)
);
MUX2 mux_inst_106 (
  .O(mux_o_106),
  .I0(spx9_inst_10_dout[15]),
  .I1(spx9_inst_11_dout[15]),
  .S0(dff_q_2)
);
MUX2 mux_inst_107 (
  .O(mux_o_107),
  .I0(spx9_inst_12_dout[15]),
  .I1(spx9_inst_13_dout[15]),
  .S0(dff_q_2)
);
MUX2 mux_inst_108 (
  .O(mux_o_108),
  .I0(spx9_inst_14_dout[15]),
  .I1(spx9_inst_15_dout[15]),
  .S0(dff_q_2)
);
MUX2 mux_inst_109 (
  .O(mux_o_109),
  .I0(mux_o_105),
  .I1(mux_o_106),
  .S0(dff_q_1)
);
MUX2 mux_inst_110 (
  .O(mux_o_110),
  .I0(mux_o_107),
  .I1(mux_o_108),
  .S0(dff_q_1)
);
MUX2 mux_inst_111 (
  .O(dout[15]),
  .I0(mux_o_109),
  .I1(mux_o_110),
  .S0(dff_q_0)
);
MUX2 mux_inst_112 (
  .O(mux_o_112),
  .I0(spx9_inst_8_dout[16]),
  .I1(spx9_inst_9_dout[16]),
  .S0(dff_q_2)
);
MUX2 mux_inst_113 (
  .O(mux_o_113),
  .I0(spx9_inst_10_dout[16]),
  .I1(spx9_inst_11_dout[16]),
  .S0(dff_q_2)
);
MUX2 mux_inst_114 (
  .O(mux_o_114),
  .I0(spx9_inst_12_dout[16]),
  .I1(spx9_inst_13_dout[16]),
  .S0(dff_q_2)
);
MUX2 mux_inst_115 (
  .O(mux_o_115),
  .I0(spx9_inst_14_dout[16]),
  .I1(spx9_inst_15_dout[16]),
  .S0(dff_q_2)
);
MUX2 mux_inst_116 (
  .O(mux_o_116),
  .I0(mux_o_112),
  .I1(mux_o_113),
  .S0(dff_q_1)
);
MUX2 mux_inst_117 (
  .O(mux_o_117),
  .I0(mux_o_114),
  .I1(mux_o_115),
  .S0(dff_q_1)
);
MUX2 mux_inst_118 (
  .O(dout[16]),
  .I0(mux_o_116),
  .I1(mux_o_117),
  .S0(dff_q_0)
);
MUX2 mux_inst_119 (
  .O(mux_o_119),
  .I0(spx9_inst_8_dout[17]),
  .I1(spx9_inst_9_dout[17]),
  .S0(dff_q_2)
);
MUX2 mux_inst_120 (
  .O(mux_o_120),
  .I0(spx9_inst_10_dout[17]),
  .I1(spx9_inst_11_dout[17]),
  .S0(dff_q_2)
);
MUX2 mux_inst_121 (
  .O(mux_o_121),
  .I0(spx9_inst_12_dout[17]),
  .I1(spx9_inst_13_dout[17]),
  .S0(dff_q_2)
);
MUX2 mux_inst_122 (
  .O(mux_o_122),
  .I0(spx9_inst_14_dout[17]),
  .I1(spx9_inst_15_dout[17]),
  .S0(dff_q_2)
);
MUX2 mux_inst_123 (
  .O(mux_o_123),
  .I0(mux_o_119),
  .I1(mux_o_120),
  .S0(dff_q_1)
);
MUX2 mux_inst_124 (
  .O(mux_o_124),
  .I0(mux_o_121),
  .I1(mux_o_122),
  .S0(dff_q_1)
);
MUX2 mux_inst_125 (
  .O(dout[17]),
  .I0(mux_o_123),
  .I1(mux_o_124),
  .S0(dff_q_0)
);
MUX2 mux_inst_126 (
  .O(mux_o_126),
  .I0(spx9_inst_16_dout[18]),
  .I1(spx9_inst_17_dout[18]),
  .S0(dff_q_2)
);
MUX2 mux_inst_127 (
  .O(mux_o_127),
  .I0(spx9_inst_18_dout[18]),
  .I1(spx9_inst_19_dout[18]),
  .S0(dff_q_2)
);
MUX2 mux_inst_128 (
  .O(mux_o_128),
  .I0(spx9_inst_20_dout[18]),
  .I1(spx9_inst_21_dout[18]),
  .S0(dff_q_2)
);
MUX2 mux_inst_129 (
  .O(mux_o_129),
  .I0(spx9_inst_22_dout[18]),
  .I1(spx9_inst_23_dout[18]),
  .S0(dff_q_2)
);
MUX2 mux_inst_130 (
  .O(mux_o_130),
  .I0(mux_o_126),
  .I1(mux_o_127),
  .S0(dff_q_1)
);
MUX2 mux_inst_131 (
  .O(mux_o_131),
  .I0(mux_o_128),
  .I1(mux_o_129),
  .S0(dff_q_1)
);
MUX2 mux_inst_132 (
  .O(dout[18]),
  .I0(mux_o_130),
  .I1(mux_o_131),
  .S0(dff_q_0)
);
MUX2 mux_inst_133 (
  .O(mux_o_133),
  .I0(spx9_inst_16_dout[19]),
  .I1(spx9_inst_17_dout[19]),
  .S0(dff_q_2)
);
MUX2 mux_inst_134 (
  .O(mux_o_134),
  .I0(spx9_inst_18_dout[19]),
  .I1(spx9_inst_19_dout[19]),
  .S0(dff_q_2)
);
MUX2 mux_inst_135 (
  .O(mux_o_135),
  .I0(spx9_inst_20_dout[19]),
  .I1(spx9_inst_21_dout[19]),
  .S0(dff_q_2)
);
MUX2 mux_inst_136 (
  .O(mux_o_136),
  .I0(spx9_inst_22_dout[19]),
  .I1(spx9_inst_23_dout[19]),
  .S0(dff_q_2)
);
MUX2 mux_inst_137 (
  .O(mux_o_137),
  .I0(mux_o_133),
  .I1(mux_o_134),
  .S0(dff_q_1)
);
MUX2 mux_inst_138 (
  .O(mux_o_138),
  .I0(mux_o_135),
  .I1(mux_o_136),
  .S0(dff_q_1)
);
MUX2 mux_inst_139 (
  .O(dout[19]),
  .I0(mux_o_137),
  .I1(mux_o_138),
  .S0(dff_q_0)
);
MUX2 mux_inst_140 (
  .O(mux_o_140),
  .I0(spx9_inst_16_dout[20]),
  .I1(spx9_inst_17_dout[20]),
  .S0(dff_q_2)
);
MUX2 mux_inst_141 (
  .O(mux_o_141),
  .I0(spx9_inst_18_dout[20]),
  .I1(spx9_inst_19_dout[20]),
  .S0(dff_q_2)
);
MUX2 mux_inst_142 (
  .O(mux_o_142),
  .I0(spx9_inst_20_dout[20]),
  .I1(spx9_inst_21_dout[20]),
  .S0(dff_q_2)
);
MUX2 mux_inst_143 (
  .O(mux_o_143),
  .I0(spx9_inst_22_dout[20]),
  .I1(spx9_inst_23_dout[20]),
  .S0(dff_q_2)
);
MUX2 mux_inst_144 (
  .O(mux_o_144),
  .I0(mux_o_140),
  .I1(mux_o_141),
  .S0(dff_q_1)
);
MUX2 mux_inst_145 (
  .O(mux_o_145),
  .I0(mux_o_142),
  .I1(mux_o_143),
  .S0(dff_q_1)
);
MUX2 mux_inst_146 (
  .O(dout[20]),
  .I0(mux_o_144),
  .I1(mux_o_145),
  .S0(dff_q_0)
);
MUX2 mux_inst_147 (
  .O(mux_o_147),
  .I0(spx9_inst_16_dout[21]),
  .I1(spx9_inst_17_dout[21]),
  .S0(dff_q_2)
);
MUX2 mux_inst_148 (
  .O(mux_o_148),
  .I0(spx9_inst_18_dout[21]),
  .I1(spx9_inst_19_dout[21]),
  .S0(dff_q_2)
);
MUX2 mux_inst_149 (
  .O(mux_o_149),
  .I0(spx9_inst_20_dout[21]),
  .I1(spx9_inst_21_dout[21]),
  .S0(dff_q_2)
);
MUX2 mux_inst_150 (
  .O(mux_o_150),
  .I0(spx9_inst_22_dout[21]),
  .I1(spx9_inst_23_dout[21]),
  .S0(dff_q_2)
);
MUX2 mux_inst_151 (
  .O(mux_o_151),
  .I0(mux_o_147),
  .I1(mux_o_148),
  .S0(dff_q_1)
);
MUX2 mux_inst_152 (
  .O(mux_o_152),
  .I0(mux_o_149),
  .I1(mux_o_150),
  .S0(dff_q_1)
);
MUX2 mux_inst_153 (
  .O(dout[21]),
  .I0(mux_o_151),
  .I1(mux_o_152),
  .S0(dff_q_0)
);
MUX2 mux_inst_154 (
  .O(mux_o_154),
  .I0(spx9_inst_16_dout[22]),
  .I1(spx9_inst_17_dout[22]),
  .S0(dff_q_2)
);
MUX2 mux_inst_155 (
  .O(mux_o_155),
  .I0(spx9_inst_18_dout[22]),
  .I1(spx9_inst_19_dout[22]),
  .S0(dff_q_2)
);
MUX2 mux_inst_156 (
  .O(mux_o_156),
  .I0(spx9_inst_20_dout[22]),
  .I1(spx9_inst_21_dout[22]),
  .S0(dff_q_2)
);
MUX2 mux_inst_157 (
  .O(mux_o_157),
  .I0(spx9_inst_22_dout[22]),
  .I1(spx9_inst_23_dout[22]),
  .S0(dff_q_2)
);
MUX2 mux_inst_158 (
  .O(mux_o_158),
  .I0(mux_o_154),
  .I1(mux_o_155),
  .S0(dff_q_1)
);
MUX2 mux_inst_159 (
  .O(mux_o_159),
  .I0(mux_o_156),
  .I1(mux_o_157),
  .S0(dff_q_1)
);
MUX2 mux_inst_160 (
  .O(dout[22]),
  .I0(mux_o_158),
  .I1(mux_o_159),
  .S0(dff_q_0)
);
MUX2 mux_inst_161 (
  .O(mux_o_161),
  .I0(spx9_inst_16_dout[23]),
  .I1(spx9_inst_17_dout[23]),
  .S0(dff_q_2)
);
MUX2 mux_inst_162 (
  .O(mux_o_162),
  .I0(spx9_inst_18_dout[23]),
  .I1(spx9_inst_19_dout[23]),
  .S0(dff_q_2)
);
MUX2 mux_inst_163 (
  .O(mux_o_163),
  .I0(spx9_inst_20_dout[23]),
  .I1(spx9_inst_21_dout[23]),
  .S0(dff_q_2)
);
MUX2 mux_inst_164 (
  .O(mux_o_164),
  .I0(spx9_inst_22_dout[23]),
  .I1(spx9_inst_23_dout[23]),
  .S0(dff_q_2)
);
MUX2 mux_inst_165 (
  .O(mux_o_165),
  .I0(mux_o_161),
  .I1(mux_o_162),
  .S0(dff_q_1)
);
MUX2 mux_inst_166 (
  .O(mux_o_166),
  .I0(mux_o_163),
  .I1(mux_o_164),
  .S0(dff_q_1)
);
MUX2 mux_inst_167 (
  .O(dout[23]),
  .I0(mux_o_165),
  .I1(mux_o_166),
  .S0(dff_q_0)
);
MUX2 mux_inst_168 (
  .O(mux_o_168),
  .I0(spx9_inst_16_dout[24]),
  .I1(spx9_inst_17_dout[24]),
  .S0(dff_q_2)
);
MUX2 mux_inst_169 (
  .O(mux_o_169),
  .I0(spx9_inst_18_dout[24]),
  .I1(spx9_inst_19_dout[24]),
  .S0(dff_q_2)
);
MUX2 mux_inst_170 (
  .O(mux_o_170),
  .I0(spx9_inst_20_dout[24]),
  .I1(spx9_inst_21_dout[24]),
  .S0(dff_q_2)
);
MUX2 mux_inst_171 (
  .O(mux_o_171),
  .I0(spx9_inst_22_dout[24]),
  .I1(spx9_inst_23_dout[24]),
  .S0(dff_q_2)
);
MUX2 mux_inst_172 (
  .O(mux_o_172),
  .I0(mux_o_168),
  .I1(mux_o_169),
  .S0(dff_q_1)
);
MUX2 mux_inst_173 (
  .O(mux_o_173),
  .I0(mux_o_170),
  .I1(mux_o_171),
  .S0(dff_q_1)
);
MUX2 mux_inst_174 (
  .O(dout[24]),
  .I0(mux_o_172),
  .I1(mux_o_173),
  .S0(dff_q_0)
);
MUX2 mux_inst_175 (
  .O(mux_o_175),
  .I0(spx9_inst_16_dout[25]),
  .I1(spx9_inst_17_dout[25]),
  .S0(dff_q_2)
);
MUX2 mux_inst_176 (
  .O(mux_o_176),
  .I0(spx9_inst_18_dout[25]),
  .I1(spx9_inst_19_dout[25]),
  .S0(dff_q_2)
);
MUX2 mux_inst_177 (
  .O(mux_o_177),
  .I0(spx9_inst_20_dout[25]),
  .I1(spx9_inst_21_dout[25]),
  .S0(dff_q_2)
);
MUX2 mux_inst_178 (
  .O(mux_o_178),
  .I0(spx9_inst_22_dout[25]),
  .I1(spx9_inst_23_dout[25]),
  .S0(dff_q_2)
);
MUX2 mux_inst_179 (
  .O(mux_o_179),
  .I0(mux_o_175),
  .I1(mux_o_176),
  .S0(dff_q_1)
);
MUX2 mux_inst_180 (
  .O(mux_o_180),
  .I0(mux_o_177),
  .I1(mux_o_178),
  .S0(dff_q_1)
);
MUX2 mux_inst_181 (
  .O(dout[25]),
  .I0(mux_o_179),
  .I1(mux_o_180),
  .S0(dff_q_0)
);
MUX2 mux_inst_182 (
  .O(mux_o_182),
  .I0(spx9_inst_16_dout[26]),
  .I1(spx9_inst_17_dout[26]),
  .S0(dff_q_2)
);
MUX2 mux_inst_183 (
  .O(mux_o_183),
  .I0(spx9_inst_18_dout[26]),
  .I1(spx9_inst_19_dout[26]),
  .S0(dff_q_2)
);
MUX2 mux_inst_184 (
  .O(mux_o_184),
  .I0(spx9_inst_20_dout[26]),
  .I1(spx9_inst_21_dout[26]),
  .S0(dff_q_2)
);
MUX2 mux_inst_185 (
  .O(mux_o_185),
  .I0(spx9_inst_22_dout[26]),
  .I1(spx9_inst_23_dout[26]),
  .S0(dff_q_2)
);
MUX2 mux_inst_186 (
  .O(mux_o_186),
  .I0(mux_o_182),
  .I1(mux_o_183),
  .S0(dff_q_1)
);
MUX2 mux_inst_187 (
  .O(mux_o_187),
  .I0(mux_o_184),
  .I1(mux_o_185),
  .S0(dff_q_1)
);
MUX2 mux_inst_188 (
  .O(dout[26]),
  .I0(mux_o_186),
  .I1(mux_o_187),
  .S0(dff_q_0)
);
endmodule //Gowin_SP
