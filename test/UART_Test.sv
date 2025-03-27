module UART_Test;

  `define CLK_UNIT_TIME 1
  `define UART_UNIT_TIME (27000000 / 115200 / `CLK_UNIT_TIME)

  logic clk = 0;
  always #`CLK_UNIT_TIME clk = ~clk;

  logic uart_rx = 1'b1;

  Core core (
      .clk(clk),
      .leds(),
      .btn(),
      .uart_rx(),
      .uart_tx()
  );

  /*
  initial begin
    int i;

    for (i = 70; i < 90; i = i + 1) begin
      #`UART_UNIT_TIME;
      uart_rx = 1'b0;  // start bit
      #`UART_UNIT_TIME;
      uart_rx = i[7];
      #`UART_UNIT_TIME;
      uart_rx = i[6];
      #`UART_UNIT_TIME;
      uart_rx = i[5];
      #`UART_UNIT_TIME;
      uart_rx = i[4];
      #`UART_UNIT_TIME;
      uart_rx = i[3];
      #`UART_UNIT_TIME;
      uart_rx = i[2];
      #`UART_UNIT_TIME;
      uart_rx = i[1];
      #`UART_UNIT_TIME;
      uart_rx = i[0];
      #`UART_UNIT_TIME;
      uart_rx = 1'b1;
      #(`UART_UNIT_TIME * 10);
    end

  end

  always_ff @(negedge clk) begin
     if(core.ALU_OUT == 32'h1000_0008) begin
        $display("PC: %h", core.program_counter);
        s.itoa(t_data);
        $display("uart_tx_state: %b", core.uart.uart_tx_inst.state);
        $display("uart_tx_next_state: %b", core.uart.uart_tx_inst.next_state);
        $display("tx_data_valid: %b", core.uart.tx_data_valid);
        $display("tx_data_ready: %b", core.uart.tx_data_ready);
        $display("t_data: %s", s);
        $display("rx_data_valid: %b", core.uart.rx_data_valid);
        $display("rd_data: %b", core.uart.rd_data);
        $display("wr_en: %b", core.uart.wr_en);
        $display("addr: %h", core.mmu_addr_out);
        $display("uart_addr: %b", core.uart.addr);
        //$display("r_data: %b", r_data);
        $display("----------------------------");
    end
  end
   */

  int i, j;
  string s;
  logic [7:0] r_data = 8'b0;
  logic [7:0] t_data = 8'b0;
  always_ff @(posedge core.uart.tx_data_valid) begin // negedge clk
    for (j = 0; j < 100; j = j + 1) begin

      for (i = 0; i < 10; i = i + 1) begin
        //#(`UART_UNIT_TIME);
        //#1;
      end
        s.itoa(core.uart.tx_data);
        $display("uart_tx_state: %b", core.uart.uart_tx_inst.state);
        $display("uart_tx_next_state: %b", core.uart.uart_tx_inst.next_state);
        $display("tx_data_valid: %b", core.uart.tx_data_valid);
        $display("tx_data_ready: %b", core.uart.tx_data_ready);
        $display("tx_data: %s", s);
        $display("rx_data_valid: %b", core.uart.rx_data_valid);
        $display("rd_data: %b", core.uart.rd_data);
        $display("wr_en: %b", core.uart.wr_en);
        $display("addr: %h", core.mmu_addr_out);
        $display("uart_addr: %b", core.uart.addr);
        //$display("r_data: %b", r_data);
        $display("----------------------------");

    end

    $finish;

  end


  /*
  logic [7:0] data = 8'b0;

  int i;
  int j;
  initial begin

    $display("UART TIME: %d", `UART_UNIT_TIME);
    $display("uart_CYCLE: %b", core.uart.uart_tx_inst.CYCLE);

    for (j = 0; j < 100; j = j + 1) begin
      // verilator lint_off ASSIGNIN

      core.uart.wr_data[7:0] = 8'b01011010;
      core.uart.wr_en = 1'b1;
      core.uart.addr = 2'b10;  // write
      #10;
      core.uart.wr_en = 1'b0;

      for (i = 0; i < 10; i = i + 1) begin
        $display("uart_tx_state: %b", core.uart.uart_tx_inst.state);
        $display("uart_tx_next_state: %b", core.uart.uart_tx_inst.next_state);
        $display("uart_tx_tx_data: %b", core.uart.uart_tx_inst.tx_data);
        $display("bit_count: %d, tx_data: %b", core.uart.uart_tx_inst.bit_cnt,
                 core.uart.uart_tx_inst.tx_data);

        $display("**********uart unit time*********");
        #(`UART_UNIT_TIME);
        if (i != 0 && i != 9) begin
          #(`UART_UNIT_TIME);
          data[i-1] = core.uart_tx;
        end
      end
      $display("tx_data: %b, valid: %b,ready: %b", data, core.uart.tx_data_valid, core.uart.tx_data_ready);
      #(`UART_UNIT_TIME * 5 - 100);
      $display("5**********5 uart unit time*********5");
      $display("tx_data: %b, valid: %b,ready: %b", data, core.uart.tx_data_valid,
               core.uart.tx_data_ready);

      while (core.uart.tx_data_ready != 1) begin
        #1;
        $display("**********wait until ready*********");
      end
        $display("uart_tx_state: %b", core.uart.uart_tx_inst.state);
        $display("uart_tx_next_state: %b", core.uart.uart_tx_inst.next_state);
        $display("uart_tx_tx_data: %b", core.uart.uart_tx_inst.tx_data);
        $display("bit_count: %d, tx_data: %b", core.uart.uart_tx_inst.bit_cnt, core.uart.tx_data_ready);
      $display("tx_data: %b, valid: %b,ready: %b", data, core.uart.tx_data_valid, core.uart.tx_data_ready);

        #(`UART_UNIT_TIME * 50);
    end
    $finish;
  end
  */



endmodule
