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
./build-sim/UART_Test
```

Top level Makefile can be used for both synth and sim
```
make synth-all
make sim-run
```

## Project Aims

- [X] Single cycle core
- [X] rv32ui-p tests
- [X] FPGA BSRAM usage
- [X] Memory mapped I/O
- [X] run binaries on core
- [X] UART "echo server"
- [ ] pipelining
- [ ] UART calculator
- [ ] Documentation
- [ ] Interrupts
- [ ] ...

## TODO

- [ ] create a libc-like (maybe use newlib)
