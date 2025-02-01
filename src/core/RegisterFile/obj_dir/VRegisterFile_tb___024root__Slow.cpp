// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VRegisterFile_tb.h for the primary calling header

#include "VRegisterFile_tb__pch.h"
#include "VRegisterFile_tb__Syms.h"
#include "VRegisterFile_tb___024root.h"

void VRegisterFile_tb___024root___ctor_var_reset(VRegisterFile_tb___024root* vlSelf);

VRegisterFile_tb___024root::VRegisterFile_tb___024root(VRegisterFile_tb__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VRegisterFile_tb___024root___ctor_var_reset(this);
}

void VRegisterFile_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VRegisterFile_tb___024root::~VRegisterFile_tb___024root() {
}
