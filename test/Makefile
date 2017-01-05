# This makefile can help you to build test inputs for your callgraph profiler
# and produce easier to interpret images from its output. If you wish to
# build call graphs using your tool as well, you must define the PROFILER
# variable below to contain the path to your compiled callgraph-profiler
# binary. If you wish to compile your own tests, set the paths for CLANG and
# OPT, as well.
#
# To build LLVM assembly files from C source files:
#   make llvmasm
#
# To remove previous output & intermediate files:
#   make clean
#

LLVM_BIN     := /home/nick/research/llvm-3.9.cmake/bin
PROFILER     := ../39/bin/callgraph-profiler
CSV_TO_GV    := ../scripts/csv_to_gv.py
CLANG        := $(LLVM_BIN)/clang
OPT          := $(LLVM_BIN)/opt
DOT          := dot
RM           := rm
SOURCE_FILES := $(sort $(wildcard c/*.c))
ASM_FILES    := $(addprefix ll/,$(notdir $(SOURCE_FILES:.c=.ll)))
BIN_FILES    := $(addprefix bin/,$(basename $(notdir $(ASM_FILES))))
CSV_FILES    := $(addprefix csv/,$(addsuffix .csv, $(notdir $(BIN_FILES))))


all: $(CSV_FILES)
llvmasm: $(ASM_FILES)
bin: $(BIN_FILES)
csv: $(CSV_FILES)


ll/%.ll: c/%.c
	$(CLANG) -g -emit-llvm -S $< -o - | $(OPT) -mem2reg -S -o $@

bin/%: ll/%.ll
	$(PROFILER) $< -o $@

csv/%.csv: bin/%
	$< 1 2 3 4 5 6
	mv profile-results.csv $@

clean:
	$(RM) -f $(CSV_FILES) bin/*

veryclean:
	$(RM) -f $(CSV_FILES) $(ASM_FILES) bin/*

