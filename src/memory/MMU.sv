module MMU (
    input  logic [31:0] addr_in,
    output logic        sram_wr_en,
    //output logic        prom_wr_en,
    output logic        uart_wr_en,
    output logic [31:0] addr_out,
    output logic [ 1:0] mem_sel
);

  always_comb begin
    sram_wr_en = 1'b0;
    prom_wr_en = 1'b0;

    // if (addr_in >= 32'h8000_0000 && addr_in < 32'h8000_2000) begin
    //   prom_wr_en = 1'b1;
    //   prom_addr = addr_in - 32'h8000_0000;
    //   mem_sel = 2'b01;
    // end
     if (addr_in >= 32'h8000_2000 && addr_in < 32'h8000_4000) begin
      sram_wr_en = 1'b1;
      addr_out = addr_in - 32'h8000_2000;
      mem_sel = 2'b10;
    end else if (addr_in >= 32'h4000_0000 && addr_in < 32'h4000_0004) begin
      addr_out = addr_in[1:0];
      mem_sel   = 2'b11;
    end else begin
      mem_sel = 2'b00;
    end

  end

endmodule
