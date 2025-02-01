#include "Vdecoder_tb.h"     // Generated from your top module "decoder_tb"
#include <verilated.h>       // Defines common routines
#include <verilated_vcd_c.h> // (Optional) If you want VCD waveform tracing

int main(int argc, char **argv) {
  // Pass command-line arguments to Verilator
  Verilated::commandArgs(argc, argv);

  // Create an instance of our top-level testbench module
  Vdecoder_tb *tb = new Vdecoder_tb;

#if VM_TRACE
  // Initialize trace (VCD) dump if you want waveforms
  VerilatedVcdC *tfp = nullptr;
  Verilated::traceEverOn(true);
  tfp = new VerilatedVcdC;
  tb->trace(tfp, 99); // Trace 99 levels of hierarchy
  tfp->open("decoder.vcd");
#endif

  // While simulation is not finished
  while (!Verilated::gotFinish()) {
    // Evaluate the model
    tb->eval();

    // (Optional) Toggle clock signals here if your testbench doesn't already do
    // it internally However, if your testbench has its own clock generation,
    // you can skip toggling here.
    //
    // Example:
    // tb->clk = !tb->clk;  // Toggle the clock
    // tb->eval();          // Evaluate again after clock toggle

#if VM_TRACE
    // Dump the current simulation time to the trace file
    tfp->dump(Verilated::time());
#endif

    // Increment time
    Verilated::timeInc(1);

    // If your testbench uses a finite number of steps or uses $finish,
    // Verilator will exit when $finish is called, or we can check
    // some condition in C++ (e.g., a max time).
  }

#if VM_TRACE
  // Close the trace file
  tfp->close();
  delete tfp;
#endif

  // Cleanup
  tb->final(); // Model cleanup
  delete tb;
  return 0;
}
