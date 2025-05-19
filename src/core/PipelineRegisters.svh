typedef struct packed {
  logic [31:0] instruction;
  logic [31:0] program_counter;
} pipe_reg_if_dr_t;

typedef struct packed {
  logic [31:0] RF_rdata1;
  logic [31:0] RF_rdata2;
  logic [31:0] Immediate_imm;
  logic [31:0] program_counter;
  logic [6:0] opcode;
  logic [2:0] fn3;

  // control signals
  logic [4:0] RF_rsel1;
  logic [4:0] RF_rsel2;
  logic [4:0] RF_wsel;
  logic       RF_wen;
  logic       branch;
  logic       jump;
  logic [1:0] RF_wdata_sel;
  logic [1:0] mem_sel;
  logic       DM_read;
  logic       DM_wen;
  logic       ALU_OP1_SEL;
  logic       ALU_OP2_SEL;
  logic [3:0] ALU_Operation;
  logic [2:0] branch_condition;

} pipe_reg_id_ex_t;

typedef struct packed {
  logic [31:0] ALU_OUT;
  logic [31:0] program_counter;
  logic [31:0] RF_rdata2;
  logic [2:0] fn3;
  logic [31:0] target;

  // control signals
  logic [4:0] RF_wsel;
  logic       RF_wen;
  logic [1:0] RF_wdata_sel;
  logic [1:0] mem_sel;
  logic       DM_wen;
} pipe_reg_ex_mem_t;

typedef struct packed {
  logic [31:0] ALU_OUT;
  logic [31:0] MMU_OUT;
  logic [31:0] program_counter;

  // control signals
  logic [4:0] RF_wsel;
  logic       RF_wen;
  logic [1:0] RF_wdata_sel;
} pipe_reg_mem_wb_t;
