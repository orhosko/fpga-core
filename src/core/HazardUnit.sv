module HazardUnit (
    input wire DM_wen,
    input wire id_ex_DM_read,  // only for hazard unit
    input wire RF_rsel1,
    input wire RF_rsel2,
    input wire ALU_OP2_SEL,

    input wire id_ex_branch_taken,
    input wire branch_taken,
    input wire [6:0] id_ex_opcode,

    input wire [4:0] id_ex_RF_wsel,
    input wire [4:0] ex_mem_RF_wsel,
    input wire [4:0] mem_wb_RF_wsel,

    input wire id_ex_RF_wen,
    input wire ex_mem_RF_wen,
    input wire mem_wb_RF_wen,

    output wire if_dr_en,
    output wire id_ex_en
);

  wire raw_hazard;
  always_comb begin
    raw_hazard = 1'b0;
    if (id_ex_RF_wen && (id_ex_RF_wsel == RF_rsel1) && (id_ex_RF_wsel != 0)) raw_hazard = 1'b1;
    if (id_ex_RF_wen && (id_ex_RF_wsel == RF_rsel2) && (id_ex_RF_wsel != 0)) raw_hazard = 1'b1;
    if (ex_mem_RF_wen && (ex_mem_RF_wsel == RF_rsel1) && (ex_mem_RF_wsel != 0)) raw_hazard = 1'b1;
    if (ex_mem_RF_wen && (ex_mem_RF_wsel == RF_rsel2) && (ex_mem_RF_wsel != 0)) raw_hazard = 1'b1;
    if (mem_wb_RF_wen && (mem_wb_RF_wsel == RF_rsel1) && (mem_wb_RF_wsel != 0)) raw_hazard = 1'b1;
    if (mem_wb_RF_wen && (mem_wb_RF_wsel == RF_rsel2) && (mem_wb_RF_wsel != 0)) raw_hazard = 1'b1;
  end

  assign if_dr_en = ~raw_hazard;

  wire branch_hazard;
  always_comb begin
     branch_hazard = 1'b0;

     if ((id_ex_opcode == 7'b1100011) && id_ex_branch_taken) branch_hazard = 1'b1;
     if ((id_ex_opcode == 7'b1100011) && branch_taken) branch_hazard = 1'b1;
     if ((DM_wen || id_ex_DM_read) && ALU_OP2_SEL)branch_hazard = 1'b1;
  end

  assign id_ex_en = ~branch_hazard;

endmodule
