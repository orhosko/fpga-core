// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VRegisterFile_tb.h for the primary calling header

#include "VRegisterFile_tb__pch.h"
#include "VRegisterFile_tb___024root.h"

VL_ATTR_COLD void VRegisterFile_tb___024root___eval_initial__TOP(VRegisterFile_tb___024root* vlSelf);
VlCoroutine VRegisterFile_tb___024root___eval_initial__TOP__Vtiming__0(VRegisterFile_tb___024root* vlSelf);

void VRegisterFile_tb___024root___eval_initial(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_initial\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VRegisterFile_tb___024root___eval_initial__TOP(vlSelf);
    VRegisterFile_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
}

void VRegisterFile_tb___024root___eval_act(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void VRegisterFile_tb___024root___nba_sequent__TOP__0(VRegisterFile_tb___024root* vlSelf);
void VRegisterFile_tb___024root___nba_sequent__TOP__1(VRegisterFile_tb___024root* vlSelf);

void VRegisterFile_tb___024root___eval_nba(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VRegisterFile_tb___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VRegisterFile_tb___024root___nba_sequent__TOP__1(vlSelf);
    }
}

VL_INLINE_OPT void VRegisterFile_tb___024root___nba_sequent__TOP__0(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___nba_sequent__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VdlyVal__RegisterFile_tb__DOT__DUT__DOT__registers__v0;
    __VdlyVal__RegisterFile_tb__DOT__DUT__DOT__registers__v0 = 0;
    CData/*4:0*/ __VdlyDim0__RegisterFile_tb__DOT__DUT__DOT__registers__v0;
    __VdlyDim0__RegisterFile_tb__DOT__DUT__DOT__registers__v0 = 0;
    CData/*0:0*/ __VdlySet__RegisterFile_tb__DOT__DUT__DOT__registers__v0;
    __VdlySet__RegisterFile_tb__DOT__DUT__DOT__registers__v0 = 0;
    // Body
    __VdlySet__RegisterFile_tb__DOT__DUT__DOT__registers__v0 = 0U;
    if (((IData)(vlSelfRef.RegisterFile_tb__DOT__wen) 
         & (0U != (IData)(vlSelfRef.RegisterFile_tb__DOT__wsel)))) {
        __VdlyVal__RegisterFile_tb__DOT__DUT__DOT__registers__v0 
            = ((IData)(vlSelfRef.RegisterFile_tb__DOT__rst)
                ? 0U : vlSelfRef.RegisterFile_tb__DOT__wdata);
        __VdlyDim0__RegisterFile_tb__DOT__DUT__DOT__registers__v0 
            = vlSelfRef.RegisterFile_tb__DOT__wsel;
        __VdlySet__RegisterFile_tb__DOT__DUT__DOT__registers__v0 = 1U;
    }
    if (__VdlySet__RegisterFile_tb__DOT__DUT__DOT__registers__v0) {
        vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers[__VdlyDim0__RegisterFile_tb__DOT__DUT__DOT__registers__v0] 
            = __VdlyVal__RegisterFile_tb__DOT__DUT__DOT__registers__v0;
    }
}

VL_INLINE_OPT void VRegisterFile_tb___024root___nba_sequent__TOP__1(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___nba_sequent__TOP__1\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.RegisterFile_tb__DOT__rdata1 = vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers
        [vlSelfRef.RegisterFile_tb__DOT__rsel1];
    vlSelfRef.RegisterFile_tb__DOT__rdata2 = vlSelfRef.RegisterFile_tb__DOT__DUT__DOT__registers
        [vlSelfRef.RegisterFile_tb__DOT__rsel2];
}

void VRegisterFile_tb___024root___timing_commit(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___timing_commit\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((! (2ULL & vlSelfRef.__VactTriggered.word(0U)))) {
        vlSelfRef.__VtrigSched_h21d375c6__0.commit(
                                                   "@(posedge clk)");
    }
}

void VRegisterFile_tb___024root___timing_resume(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___timing_resume\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VtrigSched_h21d375c6__0.resume(
                                                   "@(posedge clk)");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VRegisterFile_tb___024root___eval_triggers__act(VRegisterFile_tb___024root* vlSelf);

bool VRegisterFile_tb___024root___eval_phase__act(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_phase__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<3> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    VRegisterFile_tb___024root___eval_triggers__act(vlSelf);
    VRegisterFile_tb___024root___timing_commit(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        VRegisterFile_tb___024root___timing_resume(vlSelf);
        VRegisterFile_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VRegisterFile_tb___024root___eval_phase__nba(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_phase__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        VRegisterFile_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VRegisterFile_tb___024root___dump_triggers__nba(VRegisterFile_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VRegisterFile_tb___024root___dump_triggers__act(VRegisterFile_tb___024root* vlSelf);
#endif  // VL_DEBUG

void VRegisterFile_tb___024root___eval(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            VRegisterFile_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("RegisterFile_tb.sv", 4, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                VRegisterFile_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("RegisterFile_tb.sv", 4, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (VRegisterFile_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (VRegisterFile_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void VRegisterFile_tb___024root___eval_debug_assertions(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_debug_assertions\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY((vlSelfRef.clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
}
#endif  // VL_DEBUG
