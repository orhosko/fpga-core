RV32UI_P_DIR := ./rv32ui-p
RV32UI_P_TESTS_DIR := ./rv32ui-p-tests

OBJCOPY=riscv64-unknown-elf-objcopy

# Find all input files in rv32ui-p directory
BINARY_TESTS := $(filter-out %.dump, $(wildcard $(RV32UI_P_DIR)/*))
DUMPS := $(wildcard $(RV32UI_P_DIR)/*.dump)
BINS := $(patsubst $(RV32UI_P_DIR)/%, $(RV32UI_P_TESTS_DIR)/%, $(BINARY_TESTS))
MEMS := $(patsubst $(RV32UI_P_DIR)/%, $(RV32UI_P_TESTS_DIR)/%.mem, $(BINARY_TESTS))
DATA_MEMS := $(patsubst $(RV32UI_P_DIR)/%, $(RV32UI_P_TESTS_DIR)/%.data.mem, $(BINARY_TESTS))
PASS := $(patsubst $(RV32UI_P_DIR)/%.dump, $(RV32UI_P_TESTS_DIR)/%_pass.txt, $(DUMPS))
FAIL := $(patsubst $(RV32UI_P_DIR)/%.dump, $(RV32UI_P_TESTS_DIR)/%_fail.txt, $(DUMPS))

all: $(BINS) $(MEMS) $(DATA_MEMS) $(PASS) $(FAIL)

$(RV32UI_P_TESTS_DIR)/%: $(RV32UI_P_DIR)/%
	@mkdir -p $(RV32UI_P_TESTS_DIR)
	$(OBJCOPY) -O binary -j .text* $< $@

$(RV32UI_P_TESTS_DIR)/%.mem: $(RV32UI_P_TESTS_DIR)/%
	hexdump -v -e '1/4 "%08x\n"' $< > $@

$(RV32UI_P_TESTS_DIR)/%.data: $(RV32UI_P_DIR)/%
	@mkdir -p $(RV32UI_P_TESTS_DIR)
	$(OBJCOPY) -O binary -j .data* $< $@

$(RV32UI_P_TESTS_DIR)/%.data.mem: $(RV32UI_P_TESTS_DIR)/%.data
	hexdump -v -e '1/4 "%08x\n"' $< > $@


$(RV32UI_P_TESTS_DIR)/%_pass.txt: $(RV32UI_P_DIR)/%.dump
	grep '<pass>:' $< | awk '{print $$1}' > $@

$(RV32UI_P_TESTS_DIR)/%_fail.txt: $(RV32UI_P_DIR)/%.dump
	grep '<fail>:' $< | awk '{print $$1}' > $@

clean:
	rm -rf $(RV32UI_P_TESTS_DIR)



TESTS := $(shell find $(RV32UI_P_DIR) -type f ! -name "*.dump" -exec basename {} \;)

# Run tests target
run-tests:
	@for test in $(TESTS); do \
		echo "Running $$test"; \
		../build-sim/InstructionTest +testname=$$test || exit 1; \
	done
