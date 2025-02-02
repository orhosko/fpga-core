#include <verilated.h>
#include "VRegisterFile_tb.h"   // Verilator-generated header for your testbench module

#if VM_TRACE
# include <verilated_vcd_c.h>   // If you want VCD waveform tracing
#endif

// A global time for the simulation
static vluint64_t main_time = 0;

// Verilator calls this function to get the current simulation time
double sc_time_stamp() {
    return main_time;
}

int main(int argc, char** argv) {
    // Pass arguments to Verilated
    Verilated::commandArgs(argc, argv);

    // Instantiate the top-level testbench
    VRegisterFile_tb* tb = new VRegisterFile_tb;

    // (Optional) Enable wave traces
    #if VM_TRACE
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    tb->trace(tfp, 99);     // Trace 99 levels of hierarchy
    tfp->open("dump.vcd");  // Name of VCD file
    #endif

    // Simulation loop
    const vluint64_t max_time = 2000;  // Arbitrary stop time to avoid infinite loops
    const vluint64_t clk_period = 10;  // Each clock cycle is 10 time units

    while (!Verilated::gotFinish()) {
        // Drive the testbench clock from C++
        tb->clk = ((main_time % clk_period) < (clk_period/2)) ? 0 : 1;

        // Evaluate the model
        tb->eval();

        // Dump trace if enabled
        #if VM_TRACE
        tfp->dump(main_time);
        #endif

        main_time++;

        // Optionally stop if we've run long enough
        if (main_time > max_time) {
            break;
        }
    }

    // Final model cleanup
    tb->final();

    // Close waveform file
    #if VM_TRACE
    tfp->close();
    delete tfp;
    #endif

    delete tb;
    return 0;
}
