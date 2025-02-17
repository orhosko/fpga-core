module DPB_test (
    output [5:0] leds,
    input clk
);

  logic [7:0] douta;
  logic [7:0] doutb;
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
  logic [13:0] ada;
  logic [7:0] dina;
  logic [13:0] adb;
  logic [7:0] dinb;


  Gowin_DPB your_instance_name (
      .douta(douta),  //output [7:0] douta
      .doutb(doutb),  //output [7:0] doutb
      .clka(clka),  //input clka
      .ocea(ocea),  //input ocea
      .cea(cea),  //input cea
      .reseta(reseta),  //input reseta
      .wrea(wrea),  //input wrea
      .clkb(clkb),  //input clkb
      .oceb(oceb),  //input oceb
      .ceb(ceb),  //input ceb
      .resetb(resetb),  //input resetb
      .wreb(wreb),  //input wreb
      .ada(ada),  //input [13:0] ada
      .dina(dina),  //input [7:0] dina
      .adb(adb),  //input [13:0] adb
      .dinb(dinb)  //input [7:0] dinb
  );

  assign leds = douta[5:0];

  logic [7:0] counter = 0;
  always_ff @(posedge clk) begin
    counter <= counter + 1;
    if (counter == 100) begin
      reseta <= 1'b1;
    end
  end

  assign dina = counter;
  assign wrea = 1'b1;

endmodule
