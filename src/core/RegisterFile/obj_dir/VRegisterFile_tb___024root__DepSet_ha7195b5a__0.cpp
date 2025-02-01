// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VRegisterFile_tb.h for the primary calling header

#include "VRegisterFile_tb__pch.h"
#include "VRegisterFile_tb__Syms.h"
#include "VRegisterFile_tb___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VRegisterFile_tb___024root___dump_triggers__act(VRegisterFile_tb___024root* vlSelf);
#endif  // VL_DEBUG

void VRegisterFile_tb___024root___eval_triggers__act(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, ((~ (IData)(vlSelfRef.clk)) 
                                       & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0)));
    vlSelfRef.__VactTriggered.set(1U, ((IData)(vlSelfRef.clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0))));
    vlSelfRef.__VactTriggered.set(2U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VRegisterFile_tb___024root___dump_triggers__act(vlSelf);
    }
#endif
}
