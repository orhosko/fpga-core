// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VRegisterFile_tb.h for the primary calling header

#include "VRegisterFile_tb__pch.h"
#include "VRegisterFile_tb___024root.h"

VL_ATTR_COLD void VRegisterFile_tb___024root___eval_static(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_static\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VRegisterFile_tb___024root___eval_initial__TOP(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_initial__TOP\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[1U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[2U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[3U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[4U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[5U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[6U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[7U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[8U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[9U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0xaU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0xbU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0xcU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0xdU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0xeU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0xfU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x10U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x11U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x12U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x13U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x14U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x15U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x16U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x17U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x18U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x19U] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x1aU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x1bU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x1cU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x1dU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x1eU] = 0U;
    vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[0x1fU] = 0U;
}

VL_ATTR_COLD void VRegisterFile_tb___024root___eval_final(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_final\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VRegisterFile_tb___024root___eval_settle(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_settle\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VRegisterFile_tb___024root___dump_triggers__act(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___dump_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(negedge clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(posedge clk)\n");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VRegisterFile_tb___024root___dump_triggers__nba(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___dump_triggers__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(negedge clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(posedge clk)\n");
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VRegisterFile_tb___024root___ctor_var_reset(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___ctor_var_reset\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->RegisterFile_tb__DOT__rsel1 = VL_RAND_RESET_I(5);
    vlSelf->RegisterFile_tb__DOT__rsel2 = VL_RAND_RESET_I(5);
    vlSelf->RegisterFile_tb__DOT__wsel = VL_RAND_RESET_I(5);
    vlSelf->RegisterFile_tb__DOT__wdata = VL_RAND_RESET_I(32);
    vlSelf->RegisterFile_tb__DOT__wen = VL_RAND_RESET_I(1);
    vlSelf->RegisterFile_tb__DOT__rdata1 = VL_RAND_RESET_I(32);
    vlSelf->RegisterFile_tb__DOT__rdata2 = VL_RAND_RESET_I(32);
    vlSelf->RegisterFile_tb__DOT__rst = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 32; ++__Vi0) {
        vlSelf->RegisterFile_tb__DOT__DUT__DOT__registers[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = VL_RAND_RESET_I(1);
}
