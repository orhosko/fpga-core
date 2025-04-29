`include "../controlunit_definitions.svh"

module MMU (
    input  logic [31:0] addr_in,
    output logic        sram_wr_en,
    //output logic        prom_wr_en,
    output logic        uart_wr_en,
    output logic        i2c_wr_en,
    output logic [31:0] addr_out,
    output logic [ 1:0] mem_sel
);

  always_comb begin

    uart_wr_en = 1'b0;
    sram_wr_en = 1'b0;
    i2c_wr_en = 1'b0;

    if (addr_in >= 32'h8000_2000 && addr_in < 32'h8000_A000) begin
      sram_wr_en = 1'b1;

      addr_out = addr_in - 32'h8000_2000;
      mem_sel = `MEM_SEL_SRAM;

    end else if (addr_in >= 32'h1000_0000 && addr_in < 32'h1000_0010) begin
      uart_wr_en = 1'b1;

      addr_out = addr_in;  // addr_in[1:0];
      mem_sel = `MEM_SEL_UART;

    end else if (addr_in >= 32'h1000_2000 && addr_in < 32'h1000_2010) begin
      i2c_wr_en = 1'b1;

      addr_out = addr_in;  // addr_in[1:0];
      mem_sel = `MEM_SEL_I2C;

    end else begin
      addr_out = addr_in;
      mem_sel = 2'b00;
    end

  end

endmodule
//prom_wr_en = 1'b0;

// if (addr_in >= 32'h8000_0000 && addr_in < 32'h8000_2000) begin
//   prom_wr_en = 1'b1;
//   prom_addr = addr_in - 32'h8000_0000;
//   mem_sel = 2'b01;
// end
