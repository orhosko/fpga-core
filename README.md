# FPGA basics

## Basic usage

- Required tools:
  - Verilator - Simulation
  - Yosys - for general synth
  - nextpnr - Place and Route
  - gowin_pack - Creating packed version for tangnano20k
  - openFPGALoader - For loading into FPGA

For simulation verilator is enough.
```
cmake -S . -B build-sim/
cmake --build build-sim/
./build-sim/InstructionTest +testname=<test-name> # e.g. rv32ui-p-lh
```

Test file .mem files and others generated using mem_files/Makefile2. Since they already exist in this repo, you may skip this step.
```
cd mem_files
make --file Makefile2
```

To run all test at once we created another Makefile called test-Makefile. After cmake you can run this command in the root of the project. (Since relative paths not set correctly it doesn't work anywhere else)
```
make --file ./mem_files/test-Makefile run-tests > test-res.txt;
```

## Project Aims

- [X] UART basic data send
- [X] Block memory as ROM
- [X] read ROM and send on UART
- [X] Single cycle core
- [X] rv32ui-p tests
- [X] FPGA BSRAM usage
- [X] Memory mapped I/O
- [ ] Documentation
- [ ] UART "echo server"
- [ ] UART "echo server" + ROM
- [ ] Interrupts
- [ ] run binaries on core
- [ ] UART calculator
- [ ] ...
- [ ] pipelining

## TODO

- [ ] .rodata to inst mem
