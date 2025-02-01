// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VRegisterFile_tb__pch.h"

//============================================================
// Constructors

VRegisterFile_tb::VRegisterFile_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VRegisterFile_tb__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

VRegisterFile_tb::VRegisterFile_tb(const char* _vcname__)
    : VRegisterFile_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VRegisterFile_tb::~VRegisterFile_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VRegisterFile_tb___024root___eval_debug_assertions(VRegisterFile_tb___024root* vlSelf);
#endif  // VL_DEBUG
void VRegisterFile_tb___024root___eval_static(VRegisterFile_tb___024root* vlSelf);
void VRegisterFile_tb___024root___eval_initial(VRegisterFile_tb___024root* vlSelf);
void VRegisterFile_tb___024root___eval_settle(VRegisterFile_tb___024root* vlSelf);
void VRegisterFile_tb___024root___eval(VRegisterFile_tb___024root* vlSelf);

void VRegisterFile_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VRegisterFile_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VRegisterFile_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VRegisterFile_tb___024root___eval_static(&(vlSymsp->TOP));
        VRegisterFile_tb___024root___eval_initial(&(vlSymsp->TOP));
        VRegisterFile_tb___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VRegisterFile_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool VRegisterFile_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t VRegisterFile_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* VRegisterFile_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VRegisterFile_tb___024root___eval_final(VRegisterFile_tb___024root* vlSelf);

VL_ATTR_COLD void VRegisterFile_tb::final() {
    VRegisterFile_tb___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VRegisterFile_tb::hierName() const { return vlSymsp->name(); }
const char* VRegisterFile_tb::modelName() const { return "VRegisterFile_tb"; }
unsigned VRegisterFile_tb::threads() const { return 1; }
void VRegisterFile_tb::prepareClone() const { contextp()->prepareClone(); }
void VRegisterFile_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
