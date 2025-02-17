module DPB_test(
    output [5:0] leds,
    input clk
);

logic [31:0] douta;
logic [31:0] doutb;
logic clka;
logic ocea;
logic cea;
logic reseta;
logic wrea;
logic clkb;
logic oceb;
logic ceb;
logic resetb;
logic wreb;
logic [4:0] ada;
logic [31:0] dina;
logic [4:0] adb;
logic [31:0] dinb;


    Gowin_DPB dpb(
        .douta(douta), //output [31:0] douta
        .doutb(doutb), //output [31:0] doutb
        .clka(clka), //input clka
        .ocea(ocea), //input ocea
        .cea(cea), //input cea
        .reseta(reseta), //input reseta
        .wrea(wrea), //input wrea
        .clkb(clkb), //input clkb
        .oceb(oceb), //input oceb
        .ceb(ceb), //input ceb
        .resetb(resetb), //input resetb
        .wreb(wreb), //input wreb
        .ada(ada), //input [4:0] ada
        .dina(dina), //input [31:0] dina
        .adb(adb), //input [4:0] adb
        .dinb(dinb) //input [31:0] dinb
    );

assign leds = douta[5:0];

endmodule
