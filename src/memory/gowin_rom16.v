//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.10.03 Education
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Tue Jan 28 00:25:12 2025

module Gowin_ROM16 (dout, ad);

output [7:0] dout;
input [3:0] ad;

ROM16 rom16_inst_0 (
    .DO(dout[0]),
    .AD(ad[3:0])
);

defparam rom16_inst_0.INIT_0 = 16'h0002;

ROM16 rom16_inst_1 (
    .DO(dout[1]),
    .AD(ad[3:0])
);

defparam rom16_inst_1.INIT_0 = 16'h0001;

ROM16 rom16_inst_2 (
    .DO(dout[2]),
    .AD(ad[3:0])
);

defparam rom16_inst_2.INIT_0 = 16'h0002;

ROM16 rom16_inst_3 (
    .DO(dout[3]),
    .AD(ad[3:0])
);

defparam rom16_inst_3.INIT_0 = 16'h0001;

ROM16 rom16_inst_4 (
    .DO(dout[4]),
    .AD(ad[3:0])
);

defparam rom16_inst_4.INIT_0 = 16'h0006;

ROM16 rom16_inst_5 (
    .DO(dout[5]),
    .AD(ad[3:0])
);

defparam rom16_inst_5.INIT_0 = 16'h0005;

ROM16 rom16_inst_6 (
    .DO(dout[6]),
    .AD(ad[3:0])
);

defparam rom16_inst_6.INIT_0 = 16'h0006;

ROM16 rom16_inst_7 (
    .DO(dout[7]),
    .AD(ad[3:0])
);

defparam rom16_inst_7.INIT_0 = 16'h0005;

endmodule //Gowin_ROM16
