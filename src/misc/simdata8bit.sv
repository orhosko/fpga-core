  // not working 8 bit wide memory
`ifdef seven
  (* ram_style = "block" *)
  // errors if not possible
  logic [7:0] mem[2**12];  // 4KB example

  logic [3:0] write_enable;
  always_comb begin
    case (fn3)
      `FN3_SB: write_enable = 4'b0001;
      `FN3_SH: write_enable = 4'b0011;
      `FN3_SW: write_enable = 4'b1111;
      default: write_enable = 4'b0000;
    endcase
  end

  logic [31:0] rdata;

  integer i;
  always @(negedge wclk) begin
    for (i = 0; i < 4; i = i + 1) begin
      if (write_enable[i] && wr_en) mem[_addr_in+i] <= data_in[8*i+:8];
    end
  end

  always @(negedge rclk) begin
    rdata <= 0;
    for (i = 0; i < 4; i = i + 1) begin
      rdata[8*i+:8] <= mem[_addr_in+i];
    end
  end

`else

  always @(posedge wclk) begin
    if (wr_en && fn3 == `FN3_SW)
      {mem[_addr_in>>2][3], mem[_addr_in>>2][2], mem[_addr_in>>2][1], mem[_addr_in>>2][0]} <= data_in;

    if (wr_en && fn3 == `FN3_SH && _addr_in[1] == 1)
      {mem[_addr_in>>2][3], mem[_addr_in>>2][2]} <= data_in[15:0];
    if (wr_en && fn3 == `FN3_SH && _addr_in[1] == 0)
      {mem[_addr_in>>2][1], mem[_addr_in>>2][0]} <= data_in[15:0];

    if (wr_en && fn3 == `FN3_SB) mem[_addr_in>>2][_addr_in[1:0]] <= data_in[7:0];
  end

`endif
