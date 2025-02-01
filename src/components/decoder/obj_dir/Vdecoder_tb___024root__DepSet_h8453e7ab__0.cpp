// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdecoder_tb.h for the primary calling header

#include "Vdecoder_tb__pch.h"
#include "Vdecoder_tb___024root.h"

VlCoroutine Vdecoder_tb___024root___eval_initial__TOP__Vtiming__0(Vdecoder_tb___024root* vlSelf);

void Vdecoder_tb___024root___eval_initial(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval_initial\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vdecoder_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
}

VL_INLINE_OPT VlCoroutine Vdecoder_tb___024root___eval_initial__TOP__Vtiming__0(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.decoder_tb__DOT__in = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 2U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 3U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 4U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 5U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 6U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 7U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 8U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 9U;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 0xaU;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 0xbU;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 0xcU;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 0xdU;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 0xeU;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    vlSelfRef.decoder_tb__DOT__in = 0xfU;
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         25);
    if (((IData)(vlSelfRef.decoder_tb__DOT__out) != 
         ((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)))) {
        VL_WRITEF_NX("Test FAILED for input %b: expected %x, got %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     32,((IData)(1U) << (IData)(vlSelfRef.decoder_tb__DOT__in)),
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    } else {
        VL_WRITEF_NX("Test PASSED for input %b: output %x\n",0,
                     4,vlSelfRef.decoder_tb__DOT__in,
                     16,(IData)(vlSelfRef.decoder_tb__DOT__out));
    }
    co_await vlSelfRef.__VdlySched.delay(0x7d0ULL, 
                                         nullptr, "decoder_tb.sv", 
                                         36);
    VL_FINISH_MT("decoder_tb.sv", 37, "");
}

void Vdecoder_tb___024root___act_sequent__TOP__0(Vdecoder_tb___024root* vlSelf);

void Vdecoder_tb___024root___eval_act(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval_act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        Vdecoder_tb___024root___act_sequent__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vdecoder_tb___024root___act_sequent__TOP__0(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___act_sequent__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.decoder_tb__DOT__out = (0xffffU & ((IData)(1U) 
                                                 << (IData)(vlSelfRef.decoder_tb__DOT__in)));
}

void Vdecoder_tb___024root___eval_nba(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval_nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vdecoder_tb___024root___act_sequent__TOP__0(vlSelf);
    }
}

void Vdecoder_tb___024root___timing_resume(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___timing_resume\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vdecoder_tb___024root___eval_triggers__act(Vdecoder_tb___024root* vlSelf);

bool Vdecoder_tb___024root___eval_phase__act(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval_phase__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vdecoder_tb___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vdecoder_tb___024root___timing_resume(vlSelf);
        Vdecoder_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vdecoder_tb___024root___eval_phase__nba(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval_phase__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vdecoder_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder_tb___024root___dump_triggers__nba(Vdecoder_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder_tb___024root___dump_triggers__act(Vdecoder_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vdecoder_tb___024root___eval(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval\n"); );
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
            Vdecoder_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("decoder_tb.sv", 3, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                Vdecoder_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("decoder_tb.sv", 3, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vdecoder_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vdecoder_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vdecoder_tb___024root___eval_debug_assertions(Vdecoder_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder_tb___024root___eval_debug_assertions\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
