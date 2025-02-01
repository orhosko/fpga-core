
#include "VRegisterFile_tb.h"
#include "verilated.h"
#include <cstdio> // for fflush

vluint64_t main_time = 0;
double sc_time_stamp() { return main_time; }

int main(int argc, char **argv) {
  Verilated::commandArgs(argc, argv);
  VRegisterFile_tb *top = new VRegisterFile_tb;

  const vluint64_t sim_end = 1000; // Adjust simulation duration if needed
  const int clk_period = 10;       // Clock period in simulation ticks

  while (!Verilated::gotFinish() && main_time < sim_end) {
    // Toggle clock: high for half period, low for the other half
    top->clk = ((main_time % clk_period) < (clk_period / 2)) ? 1 : 0;

    top->eval();
    main_time++;

    // Optional: flush stdout every cycle (or every few cycles)
    std::fflush(stdout);
  }

  top->final();
  std::fflush(stdout); // Ensure all output is flushed before exit
  delete top;
  return 0;
}
