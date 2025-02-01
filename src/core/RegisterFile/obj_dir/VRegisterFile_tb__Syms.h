// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VREGISTERFILE_TB__SYMS_H_
#define VERILATED_VREGISTERFILE_TB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VRegisterFile_tb.h"

// INCLUDE MODULE CLASSES
#include "VRegisterFile_tb___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)VRegisterFile_tb__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VRegisterFile_tb* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VRegisterFile_tb___024root     TOP;

    // CONSTRUCTORS
    VRegisterFile_tb__Syms(VerilatedContext* contextp, const char* namep, VRegisterFile_tb* modelp);
    ~VRegisterFile_tb__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
