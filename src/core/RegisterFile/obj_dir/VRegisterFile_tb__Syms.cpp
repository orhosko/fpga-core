// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "VRegisterFile_tb__pch.h"
#include "VRegisterFile_tb.h"
#include "VRegisterFile_tb___024root.h"

// FUNCTIONS
VRegisterFile_tb__Syms::~VRegisterFile_tb__Syms()
{
}

VRegisterFile_tb__Syms::VRegisterFile_tb__Syms(VerilatedContext* contextp, const char* namep, VRegisterFile_tb* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP{this, namep}
{
        // Check resources
        Verilated::stackCheck(23);
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-9);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    // Setup scopes
    __Vscope_RegisterFile_tb.configure(this, name(), "RegisterFile_tb", "RegisterFile_tb", "<null>", -9, VerilatedScope::SCOPE_OTHER);
    __Vscope_RegisterFile_tb__unnamedblk1.configure(this, name(), "RegisterFile_tb.unnamedblk1", "unnamedblk1", "<null>", -9, VerilatedScope::SCOPE_OTHER);
    __Vscope_RegisterFile_tb__unnamedblk2.configure(this, name(), "RegisterFile_tb.unnamedblk2", "unnamedblk2", "<null>", -9, VerilatedScope::SCOPE_OTHER);
}
