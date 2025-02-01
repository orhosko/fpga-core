// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vdecoder_tb__pch.h"

//============================================================
// Constructors

Vdecoder_tb::Vdecoder_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vdecoder_tb__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vdecoder_tb::Vdecoder_tb(const char* _vcname__)
    : Vdecoder_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vdecoder_tb::~Vdecoder_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vdecoder_tb___024root___eval_debug_assertions(Vdecoder_tb___024root* vlSelf);
#endif  // VL_DEBUG
void Vdecoder_tb___024root___eval_static(Vdecoder_tb___024root* vlSelf);
void Vdecoder_tb___024root___eval_initial(Vdecoder_tb___024root* vlSelf);
void Vdecoder_tb___024root___eval_settle(Vdecoder_tb___024root* vlSelf);
void Vdecoder_tb___024root___eval(Vdecoder_tb___024root* vlSelf);

void Vdecoder_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vdecoder_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vdecoder_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vdecoder_tb___024root___eval_static(&(vlSymsp->TOP));
        Vdecoder_tb___024root___eval_initial(&(vlSymsp->TOP));
        Vdecoder_tb___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vdecoder_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vdecoder_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vdecoder_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vdecoder_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vdecoder_tb___024root___eval_final(Vdecoder_tb___024root* vlSelf);

VL_ATTR_COLD void Vdecoder_tb::final() {
    Vdecoder_tb___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vdecoder_tb::hierName() const { return vlSymsp->name(); }
const char* Vdecoder_tb::modelName() const { return "Vdecoder_tb"; }
unsigned Vdecoder_tb::threads() const { return 1; }
void Vdecoder_tb::prepareClone() const { contextp()->prepareClone(); }
void Vdecoder_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
