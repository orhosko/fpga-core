// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdecoder_tb.h for the primary calling header

#include "Vdecoder_tb__pch.h"
#include "Vdecoder_tb__Syms.h"
#include "Vdecoder_tb___024root.h"

void Vdecoder_tb___024root___ctor_var_reset(Vdecoder_tb___024root* vlSelf);

Vdecoder_tb___024root::Vdecoder_tb___024root(Vdecoder_tb__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vdecoder_tb___024root___ctor_var_reset(this);
}

void Vdecoder_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vdecoder_tb___024root::~Vdecoder_tb___024root() {
}
