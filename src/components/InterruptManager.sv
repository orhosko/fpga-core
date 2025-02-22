`define MSTATUS_ADDR 12'h300
`define MISA_ADDR 12'h301
`define MEDELEG_ADDR 12'h302
`define MIDELEG_ADDR 12'h303
`define MIE_ADDR 12'h304
`define MTVEC_ADDR 12'h305
`define MCOUNTEREN_ADDR 12'h306
`define MSTATUSH_ADDR 12'h310
`define MEDELEGH_ADDR 12'h312
`define MSCRATCH_ADDR 12'h340
`define MEPC_ADDR 12'h341
`define MCAUSE_ADDR 12'h342
`define MTVAL_ADDR 12'h343
`define MIP_ADDR 12'h344
`define MTINST_ADDR 12'h34A
`define MTVAL2_ADDR 12'h34B
`define MSTATUS_INTERNAL_ADDR 0
`define MISA_INTERNAL_ADDR 1
`define MEDELEG_INTERNAL_ADDR 2
`define MIDELEG_INTERNAL_ADDR 3
`define MIE_INTERNAL_ADDR 4
`define MTVEC_INTERNAL_ADDR 5
`define MCOUNTEREN_INTERNAL_ADDR 6
`define MSTATUSH_INTERNAL_ADDR 7
`define MEDELEGH_INTERNAL_ADDR 8
`define MSCRATCH_INTERNAL_ADDR 9
`define MEPC_INTERNAL_ADDR 10
`define MCAUSE_INTERNAL_ADDR 11
`define MTVAL_INTERNAL_ADDR 12
`define MIP_INTERNAL_ADDR 13
`define MTINST_INTERNAL_ADDR 14
`define MTVAL2_INTERNAL_ADDR 15
`define INVALID_INTERNAL_ADDR 4'hF
// mstatus bit masks for RV32
`define MSTATUS_MASK_SD 32'h80000000  // SD bit (bit 31)
`define MSTATUS_MASK_TSR 32'h00400000  // TSR bit (bit 22)
`define MSTATUS_MASK_TW 32'h00200000  // TW bit (bit 21)
`define MSTATUS_MASK_TVM 32'h00100000  // TVM bit (bit 20)
`define MSTATUS_MASK_MXR 32'h00080000  // MXR bit (bit 19)
`define MSTATUS_MASK_SUM 32'h00040000  // SUM bit (bit 18)
`define MSTATUS_MASK_MPRV 32'h00020000  // MPRV bit (bit 17)
`define MSTATUS_MASK_XS 32'h00018000  // XS field (bits 16:15)
`define MSTATUS_MASK_FS 32'h00006000  // FS field (bits 14:13)
`define MSTATUS_MASK_MPP 32'h00001800  // MPP field (bits 12:11)
`define MSTATUS_MASK_VS 32'h00000600  // VS field (bits 10:9)
`define MSTATUS_MASK_SPP 32'h00000100  // SPP bit (bit 8)
`define MSTATUS_MASK_MPIE 32'h00000080  // MPIE bit (bit 7)
`define MSTATUS_MASK_UBE 32'h00000040  // UBE bit (bit 6)
`define MSTATUS_MASK_SPIE 32'h00000020  // SPIE bit (bit 5)
`define MSTATUS_MASK_MIE 32'h00000008  // MIE bit (bit 3)
`define MSTATUS_MASK_SIE 32'h00000002  // SIE bit (bit 1)

/* verilator lint_off MULTIDRIVEN */
module InterruptManager (
    input logic clk,
    input logic wen,
    input logic return_from_int,
    input logic [31:0] wdata,
    input logic [11:0] addr,
    input logic [63:0] IRQ_lines,
    input logic [31:0] pc_in,
    output logic [31:0] pc_out,
    output logic [31:0] rdata,
    output logic interrupt_pending
);

  logic interrupt_line;
  logic [31:0] registers[12];
  logic [3:0] internal_addr;

  always_comb begin
    case (addr)
      `MSTATUS_ADDR:    internal_addr = `MSTATUS_INTERNAL_ADDR;  // mstatus
      `MISA_ADDR:       internal_addr = `MISA_INTERNAL_ADDR;  // misa
      `MEDELEG_ADDR:    internal_addr = `MEDELEG_INTERNAL_ADDR;  // medeleg
      `MIDELEG_ADDR:    internal_addr = `MIDELEG_INTERNAL_ADDR;  // mideleg
      `MIE_ADDR:        internal_addr = `MIE_INTERNAL_ADDR;  // mie
      `MTVEC_ADDR:      internal_addr = `MTVEC_INTERNAL_ADDR;  // mtvec
      `MCOUNTEREN_ADDR: internal_addr = `MCOUNTEREN_INTERNAL_ADDR;  // mcounteren
      `MSTATUSH_ADDR:   internal_addr = `MSTATUSH_INTERNAL_ADDR;  // mstatush
      `MEDELEGH_ADDR:   internal_addr = `MEDELEGH_INTERNAL_ADDR;  // medelegh
      `MSCRATCH_ADDR:   internal_addr = `MSCRATCH_INTERNAL_ADDR;  // mscratch
      `MEPC_ADDR:       internal_addr = `MEPC_INTERNAL_ADDR;  // mepc
      `MCAUSE_ADDR:     internal_addr = `MCAUSE_INTERNAL_ADDR;  // mcause
      `MTVAL_ADDR:      internal_addr = `MTVAL_INTERNAL_ADDR;  // mtval
      `MIP_ADDR:        internal_addr = `MIP_INTERNAL_ADDR;  // mip
      `MTINST_ADDR:     internal_addr = `MTINST_INTERNAL_ADDR;  // mtinst
      `MTVAL2_ADDR:     internal_addr = `MTVAL2_INTERNAL_ADDR;  // mtval2
      default:          internal_addr = `INVALID_INTERNAL_ADDR;
    endcase
    rdata = registers[internal_addr];

    interrupt_line = (|IRQ_lines & registers[`MSTATUS_INTERNAL_ADDR][3]); //uses reduction OR to check if any of the IRQ_lines & mie lines are high 
    interrupt_pending = interrupt_line;
  end

  always_ff @(negedge clk) begin
    if (return_from_int) begin
      /* https://five-embeddev.com/quickref/interrupts.html
      The exit procedure for a machine interrupt when mret is executed.
         //TODO: Privilege mode = mstatus.mpp, restore privilege NOT IMPLEMENTED mstatus.mpp = least-privileged supported mode (U if U-mode is implemented, else M)
         //TODO: IF mstatus.mpp != m: mstatus.mprv = 0
      */
      $display("InterruptManager: %0t, return_from_int: %b, mepc: 0x%h", $time, return_from_int,
               registers[`MEPC_INTERNAL_ADDR]);
      registers[`MSTATUS_INTERNAL_ADDR][3] <= registers[`MSTATUS_INTERNAL_ADDR][7];  // mstatus.mie = mstatus.mpie, restore interrupt enable
      registers[`MSTATUS_INTERNAL_ADDR] <= registers[`MSTATUS_INTERNAL_ADDR] | `MSTATUS_MASK_MPIE | `MSTATUS_MASK_MPP; // mstatus.mpie = 1 mpp set to MACHINE 
    end else begin
      if (interrupt_line) begin
        registers[`MEPC_INTERNAL_ADDR] <= pc_in;  //mepc = Interrupted PC, save the return address.
        registers[`MCAUSE_INTERNAL_ADDR] <= {
          {interrupt_line, 31'd11}
        };  // mcause.interrupt = 1; mcause.exception_code = I
        registers[`MSTATUS_INTERNAL_ADDR] <= registers[`MSTATUS_INTERNAL_ADDR] | `MSTATUS_MASK_MPIE | `MSTATUS_MASK_MPP & (~`MSTATUS_MASK_MIE);  // save previous interrupt enable
      end
    end

    if (wen & (internal_addr != `INVALID_INTERNAL_ADDR)) begin
      registers[internal_addr] <= wdata;
    end
    $display("InterruptManager: %0t, pc_out: %h, interrupt_line: %h, interrupt_pending: %h", $time,
             pc_out, interrupt_line, interrupt_pending);
    $display("InterruptManager: %0t, wdata: %h, rdata: %h, addr: %h, internal_addr: %h, wen: %b",
             $time, wdata, rdata, addr, internal_addr, wen);
    //print all registers
    for (int i = 0; i < 16; i++) begin
      $display("InterruptManager: %0t, registers[%0d]: %h", $time, i, registers[i]);
    end
  end

  always_comb begin
    if (return_from_int) pc_out = registers[`MEPC_INTERNAL_ADDR];  //PC = mepc
    else begin
      unique case (registers[`MTVEC_INTERNAL_ADDR][1:0])
        2'd0: pc_out = (registers[`MTVEC_INTERNAL_ADDR] & 32'hFFFFFFF0);  // PC = (mtvec & ~0xF)
        2'd1:
        pc_out = (registers[`MTVEC_INTERNAL_ADDR] & 32'hFFFFFFF0) + (11 * 4);  // PC = (mtvec & ~0xF) + (I * 4)
        default: pc_out = pc_in;
      endcase
    end
  end
endmodule
/* verilator lint_on MULTIDRIVEN */
