// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vdecoder_tb.h for the primary calling header

#ifndef VERILATED_VDECODER_TB___024ROOT_H_
#define VERILATED_VDECODER_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vdecoder_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vdecoder_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*3:0*/ decoder_tb__DOT__in;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VactContinue;
    SData/*15:0*/ decoder_tb__DOT__out;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vdecoder_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vdecoder_tb___024root(Vdecoder_tb__Syms* symsp, const char* v__name);
    ~Vdecoder_tb___024root();
    VL_UNCOPYABLE(Vdecoder_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
