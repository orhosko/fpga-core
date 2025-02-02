// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VRegisterFile_tb.h for the primary calling header

#include "VRegisterFile_tb__pch.h"
#include "VRegisterFile_tb__Syms.h"
#include "VRegisterFile_tb___024root.h"

VL_INLINE_OPT VlCoroutine VRegisterFile_tb___024root___eval_initial__TOP__Vtiming__0(VRegisterFile_tb___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VRegisterFile_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VRegisterFile_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0U;
    vlSelfRef.RegisterFile_tb__DOT__wsel = 0U;
    vlSelfRef.RegisterFile_tb__DOT__wdata = 0U;
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rst = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x3e8ULL, 
                                         nullptr, "RegisterFile_tb.sv", 
                                         52);
    VL_WRITEF_NX("=============================================================\n   Time   rsel1 rsel2 wsel wen  wdata         rdata1  rdata2 \n=============================================================\n\n--- TEST 1: Reset Behavior ---\n",0);
    vlSelfRef.RegisterFile_tb__DOT__rst = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         35);
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         36);
    vlSelfRef.RegisterFile_tb__DOT__rst = 0U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         38);
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 1U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 2U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 2U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 3U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 3U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 4U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 4U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 5U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 5U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 6U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 6U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 7U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 7U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 8U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 8U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 9U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 9U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0xaU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xaU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0xbU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xbU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0xcU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xcU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0xdU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xdU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0xeU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xeU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0xfU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xfU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x10U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x10U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x11U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x11U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x12U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x12U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x13U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x13U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x14U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x14U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x15U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x15U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x16U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x16U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x17U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x17U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x18U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x18U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x19U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x19U;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x1aU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x1aU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x1bU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x1bU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x1cU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x1cU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x1dU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x1dU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x1eU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x1eU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0x1fU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x1fU;
    vlSelfRef.RegisterFile_tb__DOT__rsel2 = 0U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         66);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:70: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel1),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 70, "");
    }
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata2))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:73: Assertion failed in %NRegisterFile_tb.unnamedblk1: Test 1 FAILED: Register r%0# not reset to 0 (Got 0x%08x)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__rsel2),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata2);
        VL_STOP_MT("RegisterFile_tb.sv", 73, "");
    }
    VL_WRITEF_NX("Test 1 PASSED (All registers read 0 after reset)\n\n--- TEST 2: Simple Write/Read ---\n",0);
    vlSelfRef.RegisterFile_tb__DOT__wsel = 0xaU;
    vlSelfRef.RegisterFile_tb__DOT__wdata = 0xabcd1234U;
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         85);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xaU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         88);
    if (VL_UNLIKELY((0xabcd1234U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:92: Assertion failed in %NRegisterFile_tb: Test 2 FAILED: Expected 0xABCD_1234 in r10, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 92, "");
    } else {
        VL_WRITEF_NX("Test 2 PASSED\n",0);
    }
    VL_WRITEF_NX("\n--- TEST 3: Write Attempt with wen=0 ---\n",0);
    vlSelfRef.RegisterFile_tb__DOT__wsel = 0xbU;
    vlSelfRef.RegisterFile_tb__DOT__wdata = 0xdeadbeefU;
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         104);
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xbU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         106);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:110: Assertion failed in %NRegisterFile_tb: Test 3 FAILED: Expected 0x00000000 in r11 when wen=0, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 110, "");
    } else {
        VL_WRITEF_NX("Test 3 PASSED\n",0);
    }
    VL_WRITEF_NX("\n--- TEST 4: Simultaneous Read/Write (Old data read) ---\n",0);
    vlSelfRef.RegisterFile_tb__DOT__wsel = 0xcU;
    vlSelfRef.RegisterFile_tb__DOT__wdata = 0xaaaa5555U;
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         124);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__wsel = 0xcU;
    vlSelfRef.RegisterFile_tb__DOT__wdata = 0xffff0000U;
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0xcU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         132);
    if (VL_UNLIKELY((0xaaaa5555U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:136: Assertion failed in %NRegisterFile_tb: Test 4 FAILED: Expected old data 0xAAAA_5555, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 136, "");
    }
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         140);
    if (VL_UNLIKELY((0xffff0000U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:142: Assertion failed in %NRegisterFile_tb: Test 4 FAILED: Expected new data 0xFFFF_0000, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 142, "");
    } else {
        VL_WRITEF_NX("Test 4 PASSED\n",0);
    }
    VL_WRITEF_NX("\n--- TEST 5: Edge Cases (r0 and r31) ---\n",0);
    vlSelfRef.RegisterFile_tb__DOT__wsel = 0U;
    vlSelfRef.RegisterFile_tb__DOT__wdata = 0xdecafbadU;
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         155);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         158);
    if (VL_UNLIKELY((0U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:162: Assertion failed in %NRegisterFile_tb: Test 5 FAILED (r0): Expected 0, got 0x%08x (RISC-V x0 is read-only=0)\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 162, "");
    } else {
        VL_WRITEF_NX("r0 forced to 0 as expected (RISC-V behavior)\n",0);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = 0x1fU;
    vlSelfRef.RegisterFile_tb__DOT__wdata = 0x12345678U;
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         171);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = 0x1fU;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         174);
    if (VL_UNLIKELY((0x12345678U != vlSelfRef.RegisterFile_tb__DOT__rdata1))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:178: Assertion failed in %NRegisterFile_tb: Test 5 FAILED (r31): Expected 0x12345678, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 178, "");
    } else {
        VL_WRITEF_NX("Test 5 PASSED (r31 read correct)\n",0);
    }
    VL_WRITEF_NX("\n--- TEST 6: Randomized Writes/Reads ---\n",0);
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 0: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 0 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 1: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 1 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 2: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 2 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 3: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 3 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 4: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 4 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 5: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 5 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 6: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 6 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 7: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 7 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 8: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 8 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    vlSelfRef.RegisterFile_tb__DOT__wsel = (0x1fU & 
                                            VL_URANDOM_RANGE_I(0x1fU, 0U));
    vlSelfRef.RegisterFile_tb__DOT__wdata = VL_RANDOM_I();
    vlSelfRef.RegisterFile_tb__DOT__wen = 1U;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         191);
    vlSelfRef.RegisterFile_tb__DOT__wen = 0U;
    vlSelfRef.RegisterFile_tb__DOT__rsel1 = vlSelfRef.RegisterFile_tb__DOT__wsel;
    co_await vlSelfRef.__VtrigSched_h21d375c6__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge clk)", 
                                                         "RegisterFile_tb.sv", 
                                                         195);
    if (VL_UNLIKELY((vlSelfRef.RegisterFile_tb__DOT__rdata1 
                     != vlSelfRef.RegisterFile_tb__DOT__wdata))) {
        VL_WRITEF_NX("[%0t] %%Error: RegisterFile_tb.sv:198: Assertion failed in %NRegisterFile_tb.unnamedblk2: Test 6 FAILED at iteration 9: Wrote 0x%08x to r%2#, got 0x%08x\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name(),
                     32,vlSelfRef.RegisterFile_tb__DOT__wdata,
                     5,(IData)(vlSelfRef.RegisterFile_tb__DOT__wsel),
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
        VL_STOP_MT("RegisterFile_tb.sv", 198, "");
    } else {
        VL_WRITEF_NX("Test 6 iteration 9 PASSED: r%2#=0x%08x\n",0,
                     5,vlSelfRef.RegisterFile_tb__DOT__wsel,
                     32,vlSelfRef.RegisterFile_tb__DOT__rdata1);
    }
    VL_WRITEF_NX("\nAll tests completed. Simulation will end now.\n\n",0);
    VL_FINISH_MT("RegisterFile_tb.sv", 206, "");
}

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
