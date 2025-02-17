`include "../definitions.svh"
`include "../alu_definitions.svh"
`include "../controlunit_definitions.svh"

module ControlUnit (
    input logic [31:0] instruction,
    input logic clk,
    output logic [4:0] RF_rsel1,
    output logic [4:0] RF_rsel2,
    output logic [4:0] RF_wsel,
    output logic RF_wen,
    output logic DM_wen,
    output logic [1:0] RF_wdata_sel,
    output logic ALU_OP1_SEL,
    output logic ALU_OP2_SEL,
    output logic [3:0] ALU_Operation,
    output logic [2:0] branch_condition,
    output logic CSR_SEL,
    output logic CSR_wen
);


  opcode_t OPC;
  always_comb begin
    OPC = opcode_t'(instruction[6:0]);
    OPC = (OPC == `OPC_JALR) ? I_TYPE : OPC; // TODO: BU BÖYLE OLMAZ!!!!!! instruction[6:0] ile kullanmayınca dev tuzak
  end

  always_comb begin
    casez (OPC)
      R_TYPE, I_TYPE, S_TYPE: ALU_OP1_SEL = `ALU_OP1_SEL_REG;
      U_TYPE: ALU_OP1_SEL = (instruction[6:0] == `OPC_AUIPC) ? `ALU_OP1_SEL_PC : `ALU_OP1_SEL_REG;
      default: ALU_OP1_SEL = `ALU_OP1_SEL_PC;
    endcase
  end

  always_comb begin
    case (OPC)
      R_TYPE:  ALU_OP2_SEL = `ALU_OP2_SEL_REG;
      default: ALU_OP2_SEL = `ALU_OP2_SEL_IMM;
    endcase
  end

  logic [2:0] fn3 = instruction[14:12];  // yosys doesn't allow nested initialization
  logic [6:0] fn7 = instruction[31:25];
  always_comb begin
    if (OPC == R_TYPE) begin
      unique case (fn3)
        `FN3_ADD:  ALU_Operation = (fn7 == `FN7_ADD) ? `ALU_ADD : `ALU_SUB;
        `FN3_SLL:  ALU_Operation = `ALU_SLL;
        `FN3_SLT:  ALU_Operation = `ALU_SLT;  // SLT, SLTI
        `FN3_SLTU: ALU_Operation = `ALU_SLTU;  // SLTU, SLTIU
        `FN3_XOR:  ALU_Operation = `ALU_XOR;  // XOR, XORI
        `FN3_SRL:  ALU_Operation = (fn7 == `FN7_SRL) ? `ALU_SRL : `ALU_SRA;
        `FN3_OR:   ALU_Operation = `ALU_OR;  // OR, ORI
        `FN3_AND:  ALU_Operation = `ALU_AND;  // AND, ANDI
        default:   ALU_Operation = `ALU_ADD;
      endcase
    end else if (OPC == I_TYPE) begin
      unique case (fn3)
        `FN3_ADDI: ALU_Operation = `ALU_ADD;
        `FN3_SLLI: ALU_Operation = `ALU_SLL;
        `FN3_SRLI: ALU_Operation = (fn7 == `FN7_SRL) ? `ALU_SRL : `ALU_SRA;
        `FN3_SLTI: ALU_Operation = `ALU_SLT;
        `FN3_SLTIU: ALU_Operation = `ALU_SLTU;
        `FN3_XORI: ALU_Operation = `ALU_XOR;
        `FN3_ORI: ALU_Operation = `ALU_OR;
        `FN3_ANDI: ALU_Operation = `ALU_AND;
        default: ALU_Operation = `ALU_ADD;
      endcase
    end else begin
      ALU_Operation = `ALU_ADD;
    end
  end

  assign DM_wen = (instruction[6:0] == `OPC_STORE) ? 1'b1 : 1'b0;

  logic [4:0] rd = instruction[11:7];
  always_comb begin
    casez (OPC)
      U_TYPE, R_TYPE, I_TYPE, J_TYPE: begin
        RF_wen = 1'b1;
      end
      S_TYPE: begin
        RF_wen = (instruction[6:0] == `OPC_LOAD) ? 1'b1 : 1'b0;
      end
      default: RF_wen = 1'b0;
    endcase
  end

  assign RF_wsel = rd;

  logic [4:0] rs1 = instruction[19:15];
  logic [4:0] rs2 = instruction[24:20];

  always_comb begin
    casez (OPC)
      R_TYPE, B_TYPE, S_TYPE: begin
        RF_rsel1 = rs1;
        RF_rsel2 = rs2;
      end
      I_TYPE: begin
        RF_rsel1 = rs1;
        RF_rsel2 = 5'b0;
      end
      default: begin
        RF_rsel1 = 5'b0;
        RF_rsel2 = 5'b0;
      end
    endcase
  end

  always_comb begin
    casez (instruction[6:0])
      J_TYPE: RF_wdata_sel = `RF_WDATA_SEL_PC;
      R_TYPE, I_TYPE, B_TYPE, U_TYPE:
      RF_wdata_sel = (instruction[6:0] != `OPC_JALR) ? `RF_WDATA_SEL_ALU : `RF_WDATA_SEL_PC;
      S_TYPE: RF_wdata_sel = `RF_WDATA_SEL_DM;
      default: RF_wdata_sel = 2'b00;
    endcase
  end

  always_comb begin
    casez (OPC)
      B_TYPE: begin
        branch_condition = fn3;
      end
      default begin
        branch_condition = 3'b000;
      end
    endcase
  end

  always_comb begin
    case (fn3)
      `FN3_CSRRW, `FN3_CSRRS, `FN3_CSRRC: CSR_SEL = `CSR_SEL_RS1;
      `FN3_CSRWI, `FN3_CSRSI, `FN3_CSRCI: CSR_SEL = `CSR_SEL_IMM;
      default: CSR_SEL = `CSR_SEL_RS1;
    endcase
  end

  always_comb begin
    CSR_wen = (OPC == CSR_TYPE) & (fn3 != 3'b000) ? 1'b1 : 1'b0;
  end

endmodule
