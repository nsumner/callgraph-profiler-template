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

LLVM_BIN     := /usr/shared/CMPT/faculty/wsumner/llvm/bin/
PROFILER     := ../../cgbuild/bin/callgraph-profiler
CSV_TO_GV    := ../scripts/csv_to_gv.py
CLANG        := $(LLVM_BIN)clang
OPT          := $(LLVM_BIN)opt
DOT          := dot
RM           := rm
SOURCE_FILES := $(sort $(wildcard c/*.c))
ASM_FILES    := $(addprefix ll/,$(notdir $(SOURCE_FILES:.c=.ll)))
BIN_FILES    := $(addprefix bin/,$(basename $(notdir $(ASM_FILES))))
CSV_FILES    := $(addprefix csv/,$(addsuffix .csv, $(notdir $(BIN_FILES))))
GV_FILES     := $(addprefix gv/,$(notdir $(CSV_FILES:.csv=.gv)))
IMG_FILES    := $(addprefix img/,$(notdir $(GV_FILES:.gv=.png)))


all: $(IMG_FILES)
llvmasm: $(ASM_FILES)
bin: $(BIN_FILES)
csv: $(CSV_FILES)
gv: $(GV_FILES)
img: $(IMG_FILES)


ll/%.ll: c/%.c
	$(CLANG) -g -emit-llvm -S $< -o - | $(OPT) -mem2reg -S -o $@

bin/%: ll/%.ll
	$(PROFILER) $< -o $@

csv/%.csv: bin/%
	$< 1 2 3 4 5 6
	mv profile-results.csv $@

gv/%.gv: csv/%.csv
	$(CSV_TO_GV) $< > $@

img/%.png: gv/%.gv
	$(DOT) $< -Tpng -o $@

clean:
	$(RM) -f img/* gv/* csv/* bin/*

veryclean:
	$(RM) -f img/* gv/* csv/* bin/* ll/*

