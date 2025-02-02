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
    CData/*4:0*/ RegisterFile_tb__DOT__rsel1;
    CData/*4:0*/ RegisterFile_tb__DOT__rsel2;
    CData/*4:0*/ RegisterFile_tb__DOT__wsel;
    CData/*0:0*/ RegisterFile_tb__DOT__wen;
    CData/*0:0*/ RegisterFile_tb__DOT__rst;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ RegisterFile_tb__DOT__wdata;
    IData/*31:0*/ RegisterFile_tb__DOT__rdata1;
    IData/*31:0*/ RegisterFile_tb__DOT__rdata2;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<IData/*31:0*/, 32> RegisterFile_tb__DOT__DUT__DOT__registers;
    VlDelayScheduler __VdlySched;
    VlTriggerScheduler __VtrigSched_h21d375c6__0;
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
