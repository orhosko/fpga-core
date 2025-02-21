.PHONY: clean flash pack pnr synth synth-all sim-build cmake-cache sim-run sim-test

FILELIST ?= verible.filelist

# Optional top module, leave blank to skip hierarchy command
TOP_MODULE ?= Core

synth-all: flash

flash: pack
	openFPGALoader -b tangnano20k build/packed.fs

pack: pnr
	gowin_pack -d GW2A-18C -o build/packed.fs build/pnr.json

pnr: synth/tangnano20k.cst synth
	nextpnr-himbaechel --json build/synth.json --write build/pnr.json --device GW2AR-LV18QN88C8/I7 --vopt family=GW2A-18C --vopt cst=synth/tangnano20k.cst

synth: $(FILELIST)
	mkdir -p build

	@if [ ! -f $(FILELIST) ]; then \
		echo "Error: File list $(FILELIST) not found."; \
		exit 1; \
	fi
	@echo "Generating Yosys script..."
	@base_dir=$$(dirname $(FILELIST)); \
	script=""; \
	while read -r line; do \
		script=$$script"read_verilog -sv -defer $$base_dir/$$line; "; \
	done < $(FILELIST); \
	if [ -n "$(TOP_MODULE)" ]; then \
		script=$$script"hierarchy -top $(TOP_MODULE); "; \
		echo "Using top module: $(TOP_MODULE)"; \
	fi; \
	script=$$script"synth_gowin -json build/synth.json -family gw2a;"; \
	yosys -p "$$script"

clean:
	rm -rf build
	rm -rf build-sim

sim-build: cmake-cache
	cmake --build build-sim

cmake-cache: CMakelists.txt
	cmake -S . -B build-sim

sim-test: sim-build
	cd mem_files && make && cd -

sim-run: sim-test
	cd mem_files && make run-tests && cd -
