// 32-bit ALU Testbench
// This testbench tests the 32-bit ALU described in Homework-1
// The Multiplier has the following IO:
//      two 32-bit signed data input
//      4-bit control input
//      32-bit signed data output
module ALUTest;

   // Define input registers
   // **** Rename or add more input register if needed ****
   reg clk;
   // Encoding of Ctr signal:
   // **** Change the encoding if needed ****
   `define ADD 4'b0000
   `define SUB 4'b0001
   `define MUL 4'b0010
   `define SLL 4'b0100
   `define SRL 4'b0101
   `define SRA 4'b0110

   reg [3:0] Ctr;
   reg [31:0] In0, In1;
   // Define output wires
   // **** Rename or add more output wire if needed ****
   wire [31:0] Out;

   // Instantiate device under test (DUT)
   // **** Replace this with your module ****
   ALU_Base alu (
       .Ctr(Ctr),
       .A  (In0),
       .B  (In1),
       .Out(Out)
   );


   // Test sequence. 
   // **** Increase the size if you want to add more test vector ****
   // **** Increase the size if you need more field in a test vector ****
   // Examples : testSeq with 15 test vector which inlcudes 7 element = testSeq [0:14][0:6]
   //            testSeq with 5 test vector which inlcudes 3 element  = testSeq [0:4][0:2]
   int testAddSeq[0:11][0:3];  // Addition test
   int testSubSeq[0:7][0:3];  // Subtranction test
   int testMulSeq[0:10][0:3];  // Logical left shift test
   int testSeqLLS[0:9][0:3];  // Logical left shift test
   int testSeqLRS[0:9][0:3];  // Logical right shift test
   int testSeqARS[0:15][0:3];  // Arithmetic right shift test
   int testSeq[0:66][0:3];

   initial begin

      // Assign test cases
      // Order of a test vector = {In0, In1, Ctr, Out}

      /* verilator lint_off WIDTHEXPAND */
      testAddSeq = '{
          '{'h00000001, 'hffffffff, `ADD, 'h00000000},
          '{'h00000002, 'hffffffff, `ADD, 'h00000001},
          '{'h00000002, 'hffffffff, `ADD, 'h00000001},
          '{'hfffffffe, 'h80000000, `ADD, 'h7ffffffe},
          '{'h40120087, 'h54181533, `ADD, 'h942a15Ba},
          '{'hbfedff79, 'h40120087, `ADD, 'h00000000},
          '{'h40000001, 'h3fffffff, `ADD, 'h80000000},
          '{'hfffffffe, 'h80000000, `ADD, 'h7ffffffe},
          '{'hffffffff, 'hffffffff, `ADD, 'hfffffffe},
          '{'h7fffffff, 'h80000001, `ADD, 'h00000000},
          '{'h00000000, 'hfffffabc, `ADD, 'hfffffabc},
          '{'h00000000, 'h00000abc, `ADD, 'h00000abc}
      };

      testSubSeq = '{
          '{'h00000001, 'hffffffff, `SUB, 'h00000002},
          '{'h12345678, 'h12345678, `SUB, 'h00000000},
          '{'h00000001, 'h00000002, `SUB, 'hffffffff},
          '{'h7fffffff, 'hffffffff, `SUB, 'h80000000},
          '{'h7fffffff, 'h7fffffff, `SUB, 'h00000000},
          '{'hffffffff, 'h7fffffff, `SUB, 'h80000000},
          '{'h80000001, 'h80000001, `SUB, 'h00000000},
          '{'h00000001, 'h7fffffff, `SUB, 'h80000002}
      };

      testMulSeq = '{
          '{'h00000001, 'hffffffff, `MUL, 'hffffffff},
          '{'h00010000, 'hffffffff, `MUL, 'hffff0000},
          '{'h12345678, 'h00000000, `MUL, 'h00000000},
          '{'h00000000, 'h12345678, `MUL, 'h00000000},
          '{'h00000005, 'h00000005, `MUL, 'h00000019},
          '{'hfffffffb, 'hfffffffb, `MUL, 'h00000019},
          '{'hfffffffb, 'h00000005, `MUL, 'hffffffe7},
          '{'h00000005, 'hfffffffb, `MUL, 'hffffffe7},
          '{'h12340000, 'h12340000, `MUL, 'h00000000},
          '{'h00010000, 'h00010000, `MUL, 'h00000000},
          '{'hfff00000, 'hfff00000, `MUL, 'h00000000}
      };

      testSeqLLS = '{
          '{'h55555555, 'h00000001, `SLL, 'haaaaaaaa},
          '{'haaaaaaaa, 'h00000001, `SLL, 'h55555554},
          '{'h55555555, 'h00000002, `SLL, 'h55555554},
          '{'haaaaaaaa, 'h00000002, `SLL, 'haaaaaaa8},
          '{'h00000001, 'h0000001f, `SLL, 'h80000000},
          '{'h00000002, 'h0000001f, `SLL, 'h00000000},
          '{'hffffffff, 'h00000000, `SLL, 'hffffffff},
          '{'hffffffff, 'h0000001f, `SLL, 'h80000000},
          '{'hffffffff, 'h00000010, `SLL, 'hffff0000},
          '{'h00000000, 'h00000010, `SLL, 'h00000000}
      };

      testSeqLRS = '{
          '{'h55555555, 'h00000001, `SRL, 'h2aaaaaaa},
          '{'haaaaaaaa, 'h00000001, `SRL, 'h55555555},
          '{'h55555555, 'h00000002, `SRL, 'h15555555},
          '{'haaaaaaaa, 'h00000002, `SRL, 'h2aaaaaaa},
          '{'h80000000, 'h0000001f, `SRL, 'h00000001},
          '{'h40000000, 'h0000001f, `SRL, 'h00000000},
          '{'hffffffff, 'h00000000, `SRL, 'hffffffff},
          '{'hffffffff, 'h0000001f, `SRL, 'h00000001},
          '{'hffffffff, 'h00000010, `SRL, 'h0000ffff},
          '{'h00000000, 'h00000010, `SRL, 'h00000000}
      };

      testSeqARS = '{
          '{'h55555555, 'h00000001, `SRA, 'h2aaaaaaa},
          '{'h2aaaaaaa, 'h00000001, `SRA, 'h15555555},
          '{'hd5555555, 'h00000001, `SRA, 'heaaaaaaa},
          '{'haaaaaaaa, 'h00000001, `SRA, 'hd5555555},
          '{'h55555555, 'h00000002, `SRA, 'h15555555},
          '{'h2aaaaaaa, 'h00000002, `SRA, 'h0aaaaaaa},
          '{'hd5555555, 'h00000002, `SRA, 'hf5555555},
          '{'haaaaaaaa, 'h00000002, `SRA, 'heaaaaaaa},
          '{'h80000000, 'h0000001f, `SRA, 'hffffffff},
          '{'h40000000, 'h0000001e, `SRA, 'h00000001},
          '{'h80000000, 'h0000001e, `SRA, 'hfffffffe},
          '{'h40000000, 'h0000001f, `SRA, 'h00000000},
          '{'hffffffff, 'h00000000, `SRA, 'hffffffff},
          '{'hffffffff, 'h0000001f, `SRA, 'hffffffff},
          '{'hffffffff, 'h00000010, `SRA, 'hffffffff},
          '{'h00000000, 'h00000010, `SRA, 'h00000000}
      };
      /* verilator lint_on WIDTHEXPAND */


      testSeq = {testAddSeq, testSubSeq, testMulSeq, testSeqLLS, testSeqLRS, testSeqARS};


      // Dump waves
      $dumpfile("dump.vcd");
      $dumpvars(1, ALUTest);
      clk = 1;

      for (int i = 0; i < $size(testSeq); i = i + 1) begin
         // Assign test case to inputs of DUT
         // **** Modify these assignments if your DUT has different inputs than this **** 
         In0 = testSeq[i][0];
         In1 = testSeq[i][1];
         /* verilator lint_off WIDTHTRUNC */
         Ctr = testSeq[i][2];
         /* verilator lint_on WIDTHTRUNC */
         toggle_clk;  // Clock is added for waveform analysis
         $display("Test %0d running", i);
         // **** Fix the outputs and testSeq index if needed **** 
         // **** Fix the asserion messages if needed **** 
         assert (Out == testSeq[i][3])
         else
            $error(
                "Test %0d failed Out = %0h expected but got Out = %0h; Ctr = %0h, In0 = %0h, In1 = %0h\n",
                i,
                testSeq[i][3],
                Out,
                Ctr,
                In0,
                In1
            );
      end

      $finish;
   end

   task toggle_clk;
      begin
         #10 clk = ~clk;
         #10 clk = ~clk;
      end
   endtask

endmodule

