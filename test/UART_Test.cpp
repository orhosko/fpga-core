#include "VUART_Test.h"
#include "verilated.h"

#include <memory>

auto main(int argc, char **argv, char ** /*unused*/) -> int {
    Verilated::debug(0);

    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    contextp->commandArgs(argc, argv);

    const std::unique_ptr<VUART_Test> topp{new VUART_Test{contextp.get()}};

    Verilated::traceEverOn(true);

    while (!contextp->gotFinish()) {
        topp->eval();
        contextp->timeInc(1);
    }

    if (!contextp->gotFinish()) {
        VL_DEBUG_IF(VL_PRINTF("+ Exiting without $finish; no events left\n"););
    }

    topp->final();

    contextp->statsPrintSummary();

    return 0;
}
