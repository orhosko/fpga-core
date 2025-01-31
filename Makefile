.PHONY: all clean flash

FILELIST ?= verible.filelist

# Optional top module, leave blank to skip hierarchy command
TOP_MODULE ?= 

all: flash

flash: packed.fs
	openFPGALoader -b tangnano20k packed.fs

packed.fs: pnr.json
	gowin_pack -d GW2A-18C -o packed.fs pnr.json

pnr.json: tangnano20k.cst synth.json
	nextpnr-himbaechel --json synth.json --write pnr.json --device GW2AR-LV18QN88C8/I7 --vopt family=GW2A-18C --vopt cst=tangnano20k.cst 

synth.json: $(FILELIST)
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
	script=$$script"synth_gowin -json synth.json -family gw2a;"; \
	yosys -p "$$script"

clean:
	rm -f synth.json pnr.json packed.fs

