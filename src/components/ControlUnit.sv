module ControlUnit (
    input logic [31:0] instruction,
    input logic clk,
    output logic [4:0] RF_rsel1,
    RF_rsel2,
    RF_wsel,
    output logic [4:0] RF_wen,
    output logic branch_taken,
    output logic DM_wen,
    output logic [1:0] RF_data_in_sel,
    output logic ALU_arg_1_sel,
    output logic ALU_arg_2_sel,
    output logic [4:0] ALU_opcode
);



endmodule
