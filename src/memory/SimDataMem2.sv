
////////////////////////////////////////////////////////////
// simdatamem.sv
////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

//----------------------------------------------------------------------
// 1) Define fn3 Macros (loads and stores share opcode bits in RISC-V)
//    For partial loads/stores: same fn3, but wr_en=1 => store, wr_en=0 => load
//----------------------------------------------------------------------
`define fn3_sb 3'b000
`define fn3_sh 3'b001
`define fn3_sw 3'b010

`define fn3_lb 3'b000
`define fn3_lh 3'b001
`define fn3_lw 3'b010
`define fn3_lbu 3'b100
`define fn3_lhu 3'b101

module SimDataMem (
    input  logic        clk,      // CPU clock for BOTH sim & synth version
    input  logic [31:0] data_in,
    input  logic [31:0] addr_in,
    input  logic        wr_en,    // 1 => store, 0 => load
    input  logic [ 2:0] fn3,
    output logic [31:0] data_out
);

  //=========================================================
  // S I M U L A T I O N   V E R S I O N
  //=========================================================
  // If `sim` is *not* defined, we use this (the original code).
  // ---------------------------------------------------------
`ifdef sim

  // A simple 8-bit memory array
  logic [7:0] mem[0:16384];  // 16KB example

  // Address offset from some base (e.g. 0x80002000)
  logic [31:0] _addr_in;
  assign _addr_in = addr_in - 32'h8000_2000;

  // Byte writes on negative edge for the simulation code
  always_ff @(negedge clk) begin
    if (wr_en) begin
      // Store byte
      mem[_addr_in] <= data_in[7:0];
      // If store halfword, also write the next byte
      if (fn3 == `fn3_sh || fn3 == `fn3_sw) begin
        mem[_addr_in+1] <= data_in[15:8];
      end
      // If store word, write 4 bytes
      if (fn3 == `fn3_sw) begin
        mem[_addr_in+2] <= data_in[23:16];
        mem[_addr_in+3] <= data_in[31:24];
      end
    end
  end

  // Combinational read with sign/zero extension
  always_comb begin
    if (fn3 == `fn3_lbu) data_out = {24'h00_0000, mem[_addr_in]};
    else if (fn3 == `fn3_lhu) data_out = {16'h0000, mem[_addr_in+1], mem[_addr_in]};
    else if (fn3 == `fn3_lw)
      data_out = {mem[_addr_in+3], mem[_addr_in+2], mem[_addr_in+1], mem[_addr_in]};
    else if (fn3 == `fn3_lb) data_out = {{24{mem[_addr_in][7]}}, mem[_addr_in]};
    else if (fn3 == `fn3_lh) data_out = {{16{mem[_addr_in+1][7]}}, mem[_addr_in+1], mem[_addr_in]};
    else data_out = 32'hAB_CDEF12;
  end


  //=========================================================
  // S Y N T H E S I S   V E R S I O N
  //=========================================================
  // If `sim` *is* defined, we use the RPLL + Gowin SP RAM + FSM code.
  // ---------------------------------------------------------
`else

  // ---------------------------------------------------------
  // 0) (Optional) Extra signals or resets. 
  //     In many designs, you might have resetn or similar.
  //     Here, for simplicity, define an internal resetn = 1 always.
  // ---------------------------------------------------------
  wire resetn = 1'b1;  // or bring in as input if needed

  // ---------------------------------------------------------
  // 1) Create a faster clock for the memory using Gowin RPLL
  // ---------------------------------------------------------
  wire mem_clk;
  wire lock_o, clkoutp_o, clkoutd_o, clkoutd3_o;
  wire gw_gnd = 1'b0;

  rPLL rpll_inst (
      .CLKOUT(clkout),
      .LOCK(lock_o),
      .CLKOUTP(clkoutp_o),
      .CLKOUTD(clkoutd),
      .CLKOUTD3(clkoutd3_o),
      .RESET(gw_gnd),
      .RESET_P(gw_gnd),
      .CLKIN(clkin),
      .CLKFB(gw_gnd),
      .FBDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .IDSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .ODSEL({gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .PSDA({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .DUTYDA({gw_gnd, gw_gnd, gw_gnd, gw_gnd}),
      .FDLY({gw_gnd, gw_gnd, gw_gnd, gw_gnd})
  );

  // The defparams you provided originally:
  defparam rpll_inst.FCLKIN           = "100";
  defparam rpll_inst.DYN_IDIV_SEL     = "false";
  defparam rpll_inst.IDIV_SEL         = 0;
  defparam rpll_inst.DYN_FBDIV_SEL    = "false";
  defparam rpll_inst.FBDIV_SEL        = 3;
  defparam rpll_inst.DYN_ODIV_SEL     = "false";
  defparam rpll_inst.ODIV_SEL         = 2;
  defparam rpll_inst.PSDA_SEL         = "0000";
  defparam rpll_inst.DYN_DA_EN        = "false";
  defparam rpll_inst.DUTYDA_SEL       = "1000";
  defparam rpll_inst.CLKOUT_FT_DIR    = 1'b1;
  defparam rpll_inst.CLKOUTP_FT_DIR   = 1'b1;
  defparam rpll_inst.CLKOUT_DLY_STEP  = 0;
  defparam rpll_inst.CLKOUTP_DLY_STEP = 0;
  defparam rpll_inst.CLKFB_SEL        = "internal";
  defparam rpll_inst.CLKOUT_BYPASS    = "false";
  defparam rpll_inst.CLKOUTP_BYPASS   = "false";
  defparam rpll_inst.CLKOUTD_BYPASS   = "false";
  defparam rpll_inst.DYN_SDIV_SEL     = 2;
  defparam rpll_inst.CLKOUTD_SRC      = "clkout";
  defparam rpll_inst.CLKOUTD3_SRC     = "clkout";
  defparam rpll_inst.DEVICE           = "gw2ar-18c";

  // ---------------------------------------------------------
  // 2) Gowin single-port RAM, 8 bits wide
  // ---------------------------------------------------------
  logic        ram_wre;
  logic        ram_ce;
  logic [ 7:0] ram_din;
  logic [ 7:0] ram_dout;
  logic [14:0] ram_ad;

  Gowin_SP ram_u (
      .dout (ram_dout),
      .clk  (mem_clk),
      .oce  (1'b1),      // always enable outputs
      .ce   (ram_ce),    // chip enable
      .reset(~resetn),   // active-high reset to RAM
      .wre  (ram_wre),   // write enable
      .ad   (ram_ad),
      .din  (ram_din)
  );

  // We'll keep the RAM always enabled
  initial ram_ce = 1'b1;

  // ---------------------------------------------------------
  // 3) Multi-cycle read/write state machine in mem_clk domain
  //    We'll do up to 4 byte accesses for a 32-bit word.
  // ---------------------------------------------------------

  // For simplicity, we do not implement CPU stalling. 
  // We'll assume the CPU is slow enough that each request 
  // arrives with plenty of time, or you add your own handshake.

  // We'll do: 
  //   - Subtract base 0x8000_2000 from addr_in 
  //   - If wr_en=1 => store, else => load
  //   - For store byte, write 1 byte 
  //   - For store half, write 2 bytes 
  //   - For store word, write 4 bytes 
  //   - For load (lb, lh, lw, lbu, lhu), read 1, 2, or 4 bytes in succession
  //   - Sign/zero extend at the end, then provide data_out

  // The real design might separate 'cpu_clk' from 'mem_clk' more thoroughly.
  // For brevity, we just use 'clk' signals as if the CPU data_in/fn3 are stable
  // when we begin the transaction. For production code, you'd want a handshake
  // or a latched request. We do a minimal approach here.

  // We'll do everything in the faster clock domain:
  //   - Step 1: Latch CPU signals (once) 
  //   - Step 2: Run the multi-byte FSM
  //   - Step 3: Output 'data_out' at the end (for loads)

  // Step 1) Latch signals from CPU clock domain to mem_clk domain
  //         (Here, for simplicity, we just re-latch them on mem_clk
  //          every cycle. In practice, you might want an explicit handshake.)
  logic [31:0] latched_addr;
  logic [31:0] latched_wdata;
  logic [ 2:0] latched_fn3;
  logic        latched_wr_en;

  always_ff @(posedge mem_clk or negedge resetn) begin
    if (!resetn) begin
      latched_addr  <= 32'b0;
      latched_wdata <= 32'b0;
      latched_fn3   <= 3'b0;
      latched_wr_en <= 1'b0;
    end else begin
      // Latch new request if it appears stable:
      latched_addr  <= addr_in;
      latched_wdata <= data_in;
      latched_fn3   <= fn3;
      latched_wr_en <= wr_en;
    end
  end

  // Pre-calculate offset from base
  wire  [31:0] addr_offset = latched_addr - 32'h8000_2000;

  // The read-data aggregator
  logic [31:0] read_accum;

  // FSM to handle sub‑transactions
  typedef enum logic [3:0] {
    S_IDLE,
    S_STORE_0,
    S_STORE_1,
    S_STORE_2,
    S_STORE_3,
    S_LOAD_0,
    S_LOAD_1,
    S_LOAD_2,
    S_LOAD_3,
    S_EXTEND
  } fsm_t;

  fsm_t state, next_state;
  logic [1:0] byte_index;  // 0..3

  // In the synchronous RAM, data out has a 1-cycle latency
  logic [7:0] ram_dout_q;
  always_ff @(posedge mem_clk) ram_dout_q <= ram_dout;

  // next-state logic
  always_comb begin
    next_state = state;

    case (state)
      //-----------------------------------------------------
      S_IDLE: begin
        // If wr_en=1 => start store
        // else => start load
        if (latched_wr_en) next_state = S_STORE_0;
        else next_state = S_LOAD_0;
      end

      //-----------------------------------------------------
      // Up to 4 sub-writes:
      S_STORE_0: next_state = S_STORE_1;
      S_STORE_1: next_state = S_STORE_2;
      S_STORE_2: next_state = S_STORE_3;
      S_STORE_3: next_state = S_IDLE;

      //-----------------------------------------------------
      // Up to 4 sub-reads (must read + wait 1 cycle to latch):
      S_LOAD_0: next_state = S_LOAD_1;
      S_LOAD_1: next_state = S_LOAD_2;
      S_LOAD_2: next_state = S_LOAD_3;
      S_LOAD_3: next_state = S_EXTEND;

      //-----------------------------------------------------
      // sign/zero extension step
      S_EXTEND: next_state = S_IDLE;
    endcase
  end

  // sequential
  always_ff @(posedge mem_clk or negedge resetn) begin
    if (!resetn) begin
      state      <= S_IDLE;
      byte_index <= 2'b0;
      read_accum <= 32'b0;
      ram_wre    <= 1'b0;
      ram_ad     <= 15'b0;
      ram_din    <= 8'b0;
      data_out   <= 32'h0;
    end else begin
      state   <= next_state;

      // By default, do not write:
      ram_wre <= 1'b0;

      case (next_state)

        //-----------------------------------------------------
        // S_STORE_0..S_STORE_3
        //-----------------------------------------------------
        S_STORE_0, S_STORE_1, S_STORE_2, S_STORE_3: begin
          // Figure out which sub‑byte index we are on
          // (store_0 => byte_index=0, store_1 => byte_index=1, etc.)
          byte_index <= state - S_STORE_0;  // 0..3

          // Address: offset + byte_index
          ram_ad <= addr_offset[14:0] + (state - S_STORE_0);

          // Select correct byte from latched_wdata
          case (state - S_STORE_0)
            2'd0: ram_din <= latched_wdata[7:0];
            2'd1: ram_din <= latched_wdata[15:8];
            2'd2: ram_din <= latched_wdata[23:16];
            2'd3: ram_din <= latched_wdata[31:24];
          endcase

          // Actually enable write if we *need* this sub-byte.
          // For store byte => only sub-byte 0
          // For store half => sub-byte 0..1
          // For store word => sub-byte 0..3
          if (latched_fn3 == `fn3_sb && (state == S_STORE_0)) ram_wre <= 1'b1;
          if (latched_fn3 == `fn3_sh && (state <= S_STORE_1)) ram_wre <= 1'b1;
          if (latched_fn3 == `fn3_sw) ram_wre <= 1'b1;
        end

        //-----------------------------------------------------
        // S_LOAD_0..S_LOAD_3
        //-----------------------------------------------------
        S_LOAD_0, S_LOAD_1, S_LOAD_2, S_LOAD_3: begin
          // On each cycle, we present address for sub-byte
          byte_index <= state - S_LOAD_0;
          ram_ad <= addr_offset[14:0] + (state - S_LOAD_0);
          ram_wre <= 1'b0;  // read

          // The byte we read from *previous* cycle is in ram_dout_q
          // So if state was S_LOAD_1, the data we got from S_LOAD_0 address
          // is now in ram_dout_q. Put it in read_accum.
          // A simple approach: *after* the first cycle, store the incoming byte
          if (state != S_LOAD_0) begin
            unique case (state - S_LOAD_0 - 1)
              2'd0: read_accum[7:0] <= ram_dout_q;
              2'd1: read_accum[15:8] <= ram_dout_q;
              2'd2: read_accum[23:16] <= ram_dout_q;
              2'd3: read_accum[31:24] <= ram_dout_q;
            endcase
          end
        end

        //-----------------------------------------------------
        // S_EXTEND
        //-----------------------------------------------------
        S_EXTEND: begin
          // The last byte read is in ram_dout_q from S_LOAD_3
          // So store that now:
          read_accum[31:24] <= ram_dout_q;

          // Sign or zero extension
          unique case (latched_fn3)
            `fn3_lb:  data_out <= {{24{ram_dout_q[7]}}, ram_dout_q};  // sign-extend final byte
            `fn3_lh:  data_out <= {{16{read_accum[15]}}, read_accum[15:0]};
            `fn3_lw:  data_out <= {ram_dout_q, read_accum[23:0]};  // all 4 bytes
            `fn3_lbu: data_out <= {24'b0, ram_dout_q};
            `fn3_lhu: data_out <= {16'b0, read_accum[15:0]};
            default:  data_out <= 32'hAB_CDEF12;
          endcase
        end

        //-----------------------------------------------------
        // S_IDLE
        //-----------------------------------------------------
        default: begin
          byte_index <= 2'b0;
        end
      endcase
    end
  end

`endif  // `ifndef sim ... `else ... `endif

endmodule
