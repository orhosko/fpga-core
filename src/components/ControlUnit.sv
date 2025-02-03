`include "../definitions.sv"
`include "../alu_definitions.svh"

module ControlUnit (
    input logic [31:0] instruction,
    input logic clk,
    output logic [4:0] RF_rsel1,
    output logic [4:0] RF_rsel2,
    output logic [4:0] RF_wsel,
    output logic RF_wen,
    output logic branch_taken, // TODO: different design
    output logic DM_wen,
    output logic [1:0] RF_data_in_sel,  // TODO: ??
    output logic ALU_OP1_SEL,
    output logic ALU_OP2_SEL,
    output logic [3:0] ALU_Operation
);

  typedef enum logic [6:0] {
    R_TYPE = `OPC_OP,
    I_TYPE = `OPC_OP_IMM,
    J_TYPE = `OPC_JAL,   // `OPC_JALR uses I_TYPE encoding
    _JALR_TYPE = `OPC_JALR,
    U_TYPE = 7'b0?10111,   // `OPC_LUI, `OPC_AUIPC
    B_TYPE = `OPC_BRANCH,
    S_TYPE = 7'b0?00011    // `OPC_STORE, `OPC_LOAD
  } opcode_t;

  opcode_t OPC;
  always_comb begin
   OPC = opcode_t'(instruction[6:0]);
   OPC = (OPC == `OPC_JALR) ? I_TYPE : OPC;
  end

  `define ALU_OP1_SEL_REG 1'b0
  `define ALU_OP1_SEL_PC 1'b1

  `define ALU_OP2_SEL_REG 1'b0
  `define ALU_OP2_SEL_IMM 1'b1

  always_ff @(posedge clk) begin
    case (OPC)
      R_TYPE: ALU_OP2_SEL <= `ALU_OP2_SEL_REG;
      default: ALU_OP2_SEL <= `ALU_OP2_SEL_IMM;
    endcase
  end

  // TODO: AUIPC 0, LUI 1 demiş ama LUI 0 da olabilir galiba
  always_ff @(posedge clk) begin
     casez(OPC)
       R_TYPE, I_TYPE, S_TYPE: ALU_OP1_SEL <= `ALU_OP1_SEL_REG;
         default: ALU_OP1_SEL <= `ALU_OP1_SEL_PC;
    endcase
  end

  logic [2:0] fn3 = instruction[14:12]; // yosys doesn't allow nested initialization
  logic [6:0] fn7 = instruction[31:25];
  always_ff@(posedge clk) begin
     if(OPC == R_TYPE) begin
        case(fn3)
          `FN3_ADD: ALU_Operation <= (fn7 == `FN7_ADD) ? `ALU_ADD : `ALU_SUB;
          `FN3_SLL: ALU_Operation <= `ALU_SLL;
          // `FN3_SLT: ALU_Operation <= `ALU_SLT; // SLT, SLTI
          // `FN3_SLTU: ALU_Operation <= `ALU_SLTU; // SLTU, SLTIU
          `FN3_XOR: ALU_Operation <= `ALU_XOR; // XOR, XORI
          `FN3_SRL: ALU_Operation <= `ALU_SRL; // SRL, SRA
          `FN3_OR: ALU_Operation <= `ALU_OR; // OR, ORI
          `FN3_AND: ALU_Operation <= `ALU_AND; // AND, ANDI
          default: ALU_Operation <= `ALU_ADD;
        endcase
    end

    if(OPC == I_TYPE) begin
       case(fn3)
         `FN3_ADDI: ALU_Operation <= `ALU_ADD;
         // `FN3_SLTI: ALU_Operation <= `ALU_SLT;
         // `FN3_SLTIU: ALU_Operation <= `ALU_SLTU;
         `FN3_XORI: ALU_Operation <= `ALU_XOR;
         `FN3_ORI: ALU_Operation <= `ALU_OR;
         `FN3_ANDI: ALU_Operation <= `ALU_AND;
         default: ALU_Operation <= `ALU_ADD;
       endcase
    end
  end

  assign DM_wen = (instruction[6:0] == `OPC_STORE) ? 1'b1 : 1'b0;

  // TODO: why slt and sltu are not included in the RF_WR_EN?
  // assign RF_WR_EN = (R_TYPE && func3 != 7'h2 && func3 != 7'h3) ? 1'b1 :
  //                   ((I_TYPE && func3 !=7'h2 && func3 != 7'h3)) ||
  //                   (LOAD_TYPE || J_TYPE || JALR_TYPE) ? 1'b1 :
  //                   (LUI_TYPE || AUIPC_TYPE) ? 1'b1 : 1'b0;

  logic [4:0] rd = instruction[11:7];
  // TODO: U_TYPE ??
  always_ff @(posedge clk) begin
     casez(OPC)
       R_TYPE, I_TYPE, J_TYPE, S_TYPE: begin
          RF_wen <= 1'b1;
          RF_wsel <= rd;
          end
         default: RF_wen <= 1'b0;
     endcase
  end

  logic [4:0] rs1 = instruction[19:15];
  logic [4:0] rs2 = instruction[24:20];

   // TODO: LUI ??
    always_ff @(posedge clk) begin
         casez(OPC)
         R_TYPE, B_TYPE: begin
            RF_rsel1 <= rs1;
            RF_rsel2 <= rs2;
            end
         I_TYPE, S_TYPE: begin
            RF_rsel1 <= rs1;
            RF_rsel2 <= 5'b0;
            end
         J_TYPE: begin
            RF_rsel1 <= rs1;
            RF_rsel2 <= 5'b0;
            end
         default: begin
            RF_rsel1 <= 5'b0;
            RF_rsel2 <= 5'b0;
         end
         endcase
    end


endmodule
