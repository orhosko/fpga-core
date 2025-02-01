// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VRegisterFile_tb.h for the primary calling header

#ifndef VERILATED_VREGISTERFILE_TB___024ROOT_H_
#define VERILATED_VREGISTERFILE_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class VRegisterFile_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VRegisterFile_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    CData/*4:0*/ RegisterFile_tb__DOT__write_sel;
    CData/*4:0*/ RegisterFile_tb__DOT__read_selA;
    CData/*4:0*/ RegisterFile_tb__DOT__read_selB;
    CData/*0:0*/ RegisterFile_tb__DOT__write_en;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ RegisterFile_tb__DOT__data_in;
    IData/*31:0*/ RegisterFile_tb__DOT__data_outA;
    IData/*31:0*/ RegisterFile_tb__DOT__data_outB;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<IData/*31:0*/, 32> RegisterFile_tb__DOT__dut__DOT__registers;
    VlTriggerScheduler __VtrigSched_h21d37587__0;
    VlTriggerScheduler __VtrigSched_h21d375c6__0;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<3> __VactTriggered;
    VlTriggerVec<3> __VnbaTriggered;

    // INTERNAL VARIABLES
    VRegisterFile_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    VRegisterFile_tb___024root(VRegisterFile_tb__Syms* symsp, const char* v__name);
    ~VRegisterFile_tb___024root();
    VL_UNCOPYABLE(VRegisterFile_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
