module UART_Test;

  `define CLK_UNIT_TIME 1
  `define UART_UNIT_TIME (27000000 / 115200 / `CLK_UNIT_TIME)

  logic clk = 0;
  always #`CLK_UNIT_TIME clk = ~clk;

  logic uart_rx = 1'b1;

  Core core (
      .clk(clk),
      .leds(),
      .btn(0),
      .uart_rx(uart_rx),
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

   int  a;

  int i, j;
  string s;
  logic [7:0] r_data = 8'b0;
  logic [7:0] t_data = 8'b0;
  // always_ff @(posedge core.uart.tx_data_valid) begin // negedge clk
  always_ff @(posedge clk) begin // negedge clk

      if(core.uart.tx_data_ready == 1) begin
        for (i = 0; i < 10; i = i + 1) begin
          //#(`UART_UNIT_TIME);
          //#1;
        end
      end

     if(a%270==135) begin
        $display("-------- 135 --------------");
        
     end

        $display("PC: %h", core.program_counter);
        $display("PC[7:2]: %b", core.program_counter[7:2]);
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
        $display("tx_pin: %b", core.uart_tx);
        //$display("r_data: %b", r_data);
        $display("----------------------------");
      $display("Read data: %h", core.im.data_out);

      $display(">> PC: %h", core.program_counter);
      $display(">> Instruction: %h", core.instruction);
      $display(">> Branch taken: %h", core.branch_taken);

      $display(">> RF:");
      $display(">>>> RF_rsel1: %h", core.RF_rsel1);
      $display(">>>> RF_rdata1: %h", core.RF_rdata1);
      $display(">>>> RF_rsel2: %h", core.RF_rsel2);
      $display(">>>> RF_rdata2: %h", core.RF_rdata2);
      $display(">>>> RF_wdata_sel:%h", core.RF_wdata_sel);
      $display(">>>> RF_wsel: %h", core.RF_wsel);
      if (core.cu.RF_wen) begin
        $display(">>>>>> RF_wen: %h", core.cu.RF_wen);
        $display(">>>>>> RF_wdata: %h", core.RF_wdata);
      end

      $display(">> ALU:");
      $display(">>>> ALU_OP1_SEL: %h", core.ALU_OP1_SEL);
      $display(">>>> ALU_A: %h", core.ALU_A);
      $display(">>>> ALU_OP2_SEL: %h", core.ALU_OP2_SEL);
      $display(">>>> ALU_B: %h", core.ALU_B);
      $display(">>>> ALU_OUT: %h", core.ALU_OUT);

      $display(">> Imm: %h", core.Immediate_imm);

      $display(">> DM:");
      $display(">>>> DM_wen: %h", core.DM_wen);
      if (core.DM_wen) begin
        $display(">>>>>> DM_ADDR: %h", core.ALU_OUT);
        $display(">>>>>> DM_IN: %h", core.RF_rdata2);
      end
      $display(">>>> DM_OUT: %h", core.DM_OUT);

      $display(">> Registers:");
      for (int i = 0; i < 32; i++) begin
        $display(">>>> R[%d]: %h", i, core.rf.registers[i]);
      end

      $display("[SIM DATA MEM BEGIN], clk=%d", clk);
      $display("[SDM] addr_in=%08x, _addr_in=%08x, data_out=%08x", core.dm.addr_in,
               core.dm._addr_in, core.dm.data_out);
      $display("[SDM] +0 data=%08x", core.dm.mem[(core.dm._addr_in>>2)]);
      $display("[SDM] +1 data=%08x", core.dm.mem[(core.dm._addr_in>>2)+1]);
      $display("[SDM] +2 data=%08x", core.dm.mem[(core.dm._addr_in>>2)+2]);
      $display("[SDM] wr_en=%d, fn3=%d, rdata=%08x", core.dm.wr_en, core.dm.fn3, core.dm.rdata);
      $display("[SIM DATA MEM END]");
        $display("----------------------------");

     a = a + 1;
     if (a == 10000) begin
       $finish;
     end

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
