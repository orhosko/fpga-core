`include "../definitions.svh"

module HazardUnit (
    input wire DM_wen,
    input wire id_ex_DM_read,  // only for hazard unit
    input wire [4:0] RF_rsel1,
    input wire [4:0] RF_rsel2,
    input wire ALU_OP2_SEL,

    input wire id_ex_branch,
    input wire id_ex_jump,
    input wire branch_taken,
    input wire [6:0] id_ex_opcode,

    input wire [4:0] id_ex_RF_wsel,
    input wire [4:0] ex_mem_RF_wsel,
    input wire [4:0] mem_wb_RF_wsel,

    input wire id_ex_RF_wen,
    input wire ex_mem_RF_wen,
    input wire mem_wb_RF_wen,

    output logic if_dr_en,
    output logic id_ex_en,
    output logic if_dr_clear,
    output logic id_ex_clear
);

   // TODO: read and write to same address in data memory is also hazard

  logic raw_hazard;
  always_comb begin
    raw_hazard = 1'b0;
    if (id_ex_RF_wen && (id_ex_RF_wsel == RF_rsel1) && (id_ex_RF_wsel != 0)) raw_hazard = 1'b1;
    if (id_ex_RF_wen && (id_ex_RF_wsel == RF_rsel2) && (id_ex_RF_wsel != 0)) raw_hazard = 1'b1;
    if (ex_mem_RF_wen && (ex_mem_RF_wsel == RF_rsel1) && (ex_mem_RF_wsel != 0)) raw_hazard = 1'b1;
    if (ex_mem_RF_wen && (ex_mem_RF_wsel == RF_rsel2) && (ex_mem_RF_wsel != 0)) raw_hazard = 1'b1;
    if (mem_wb_RF_wen && (mem_wb_RF_wsel == RF_rsel1) && (mem_wb_RF_wsel != 0)) raw_hazard = 1'b1;
    if (mem_wb_RF_wen && (mem_wb_RF_wsel == RF_rsel2) && (mem_wb_RF_wsel != 0)) raw_hazard = 1'b1;
  end

  // TODO: some jumps only to next instruction, optimize??
  // jump
  always_comb begin
    id_ex_en = 1'b1;
    if_dr_en = ~raw_hazard;

    if_dr_clear = 1'b0;
    id_ex_clear = 1'b0;

    if (id_ex_jump) begin
      if_dr_en = 1'b1; // TODO: not sure about this
      if_dr_clear = 1'b1;
      id_ex_clear = 1'b1;
    end

    if (branch_taken && id_ex_branch) begin
      if_dr_en = 1'b1;
      if_dr_clear = 1'b1;
      id_ex_clear = 1'b1;
    end

    if (raw_hazard) begin
      id_ex_clear = 1'b1;
    end
endmodule

/*
  always_comb begin
     branch_hazard = 1'b0;

     if ((id_ex_opcode == 7'b1100011) && id_ex_branch_taken) branch_hazard = 1'b1;
     if ((id_ex_opcode == 7'b1100011) && branch_taken) branch_hazard = 1'b1;
     if ((DM_wen || id_ex_DM_read) && ALU_OP2_SEL)branch_hazard = 1'b1;
  end

  assign id_ex_en = ~branch_hazard;
*/
