module MUX2 (
    input O,
    input I0,
    input I1,
    output reg S0
);

assign S0 = O ? I1 : I0;

endmodule
