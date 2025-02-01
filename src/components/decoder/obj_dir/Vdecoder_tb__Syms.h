// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VDECODER_TB__SYMS_H_
#define VERILATED_VDECODER_TB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vdecoder_tb.h"

// INCLUDE MODULE CLASSES
#include "Vdecoder_tb___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)Vdecoder_tb__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vdecoder_tb* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vdecoder_tb___024root          TOP;

    // CONSTRUCTORS
    Vdecoder_tb__Syms(VerilatedContext* contextp, const char* namep, Vdecoder_tb* modelp);
    ~Vdecoder_tb__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
