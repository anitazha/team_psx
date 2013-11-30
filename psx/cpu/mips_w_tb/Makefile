#
# Team PSX CPU Makefile.
# Heavily modified from the 18-447 Makefile to use VCS and SVerilog
#
# Author: Anita Zhang
#

###################################################################
### Setup
###################################################################

SRC ?= src gte memory dat_files
VCSLOG = vcs.log

CC = vcs
#CCFLAGS = -sverilog -nc -debug -line +lint=all,noVCDE,noFIAAS +warn=all -l $(VCSLOG)
CCFLAGS = -sverilog -nc -debug -line +warn=all -timescale=1ns/1ps -l $(VCSLOG)

TIMESTAMP := outputs/$(shell date +%m%d-%H%M%S)
OUTPUT ?= $(TIMESTAMP)

INPUT ?= 447inputs/addiu.s
REGDUMP := $(INPUT:.s=.reg)

BATCH ?= 447inputs/addiu.s

SYNTH = lab
TB = testbench

###################################################################
### Constants
###################################################################

# text attributes: normal, bold, underline
n=\e[0m
b=\e[1m
u=\e[4m

# bold+green
g=\e[1;32m

# bold+red
r=\e[1;31m

# debug message
m=$gTeam PSX: $n

###################################################################
### Help Screen
###################################################################

default:
	@echo -e "$mHELP SCREEN"
	@echo -e ""
	@echo -e "$bUSAGE:$n"
	@echo -e "\tmake $uTARGET$n [$uVARIABLE$n]..."
	@echo -e ""
	@echo -e ""
	@echo -e "$bTARGET:$n"
	@echo -e "\t$bcompile$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    places all outputs in $bOUTPUT$n"
	@echo -e ""
	@echo -e "\t$bsim$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    simulates Verilog using $bINPUT$n as input;"
	@echo -e "\t    places all outputs in $bOUTPUT$n"
	@echo -e ""
	@echo -e "\t$bverify$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    simulates Verilog using $bINPUT$n as input;"
	@echo -e "\t    places all outputs in $bOUTPUT$n"
	@echo -e "\t    verifies the simulation register-dump against the reference"
	@echo -e ""
	@echo -e "\t$bbatch-verify$n"
	@echo -e "\t    similar to $bverify$n, but uses $bBATCH$n as input"
	@echo -e ""
	@echo -e "\t$bsynth$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    synthesizes Verilog with XST"
	@echo -e "\t    places all outputs in $bOUTPUT$n"
	@echo -e ""
	@echo -e "\t$bbios$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    simulates Verilog using $bsrc/bios.dat$n as input;"
	@echo -e "\t    places all outputs in $bOUTPUT$n"
	@echo -e ""
	@echo -e ""
	@echo -e "$bVARIABLE:$n"
	@echo -e "\t$bSRC$n=$uSRC DIRECTORIES$n"
	@echo -e "\t    for $bsim$n and $bverify$n, specifies input Verilog directory;"
	@echo -e "\t    if unspecified, defaults to $usrc$n"
	@echo -e ""
	@echo -e "\t$bINPUT$n=$uASSEMBLY$n"
	@echo -e "\t    for $bsim$n and $bverify$n, specifies an input MIPS assemply file;"
	@echo -e "\t    if unspecified, defaults to $u447inputs/addiu.s$n"
	@echo -e ""
	@echo -e "\t$bBATCH$n=$uASSEMBLY FILES$n"
	@echo -e "\t    for $bbatch-verify$n, specifies one or more input MIPS assemply files;"
	@echo -e "\t    if unspecified, defaults to $u447inputs/addiu.s$n"
	@echo -e ""
	@echo -e "\t$bOUTPUT$n=$uDIR$n"
	@echo -e "\t    for all targets (except $bupdate$n/$bauto$n), specifies the output directory;"
	@echo -e "\t    if unspecified, defaults to $uoutputs/current-timestamp$n;"
	@echo -e ""
	@echo -e ""
	@echo -e "(END)"
	@exit 0

###################################################################
### Compile Verilog
###################################################################

compile: 
	@echo -e "$mCopying Verilog into $(OUTPUT)..."
	@mkdir -p $(OUTPUT)/sim/src
	cp -R memory/mif_files $(OUTPUT)/
	@cp `find $(SRC) 447src -iname '*.v*' -o -iname '*.sv*'` $(OUTPUT)/sim/src
	@echo -e "$mCompiling and Elaborating Design..."
	cd $(OUTPUT)/sim; $(CC) $(CCFLAGS) +incdir+src src/*
	@if grep 'Warning*' $(OUTPUT)/sim/$(VCSLOG) >/dev/null; \
		then echo -e '$m$rElaborator log has warnings!$n'; fi
	@if grep 'Lint*' $(OUTPUT)/sim/$(VCSLOG) >/dev/null; \
		then echo -e '$mElaborator log has lint messages!$n'; fi

###################################################################
### Assemble MIPS Assembly Input
###################################################################

assemble:
	@echo -e "$mCopying $(INPUT) into $(OUTPUT)..."
	@mkdir -p $(OUTPUT)/sim
	@([ -f $(INPUT) ] && cp $(INPUT) $(OUTPUT)/sim) || \
		(echo -e "$mERROR -- test input not found: $(INPUT)"; exit 1)
	@echo -e "$mAssembling input in $(OUTPUT)..."
	spim447 -notrap -vasm $(INPUT) $(OUTPUT)/sim/mem;


###################################################################
### Simulate Verilog
###################################################################

sim: compile
	@echo -e "$mSimulating Verilog in $(OUTPUT)..."
	@echo -e "$mTo run with the VCS GUI, navigate to $b$(OUTPUT)/sim $nand execute $b./simv -gui$n"

###################################################################
### Simulate DAT Files
###################################################################

dat: compile 
	@mkdir -p $(OUTPUT)/sim
	@cp `find $(SRC) -iname $(INPUT)` $(OUTPUT)/sim/mem.text.dat
	@touch $(OUTPUT)/sim/mem.data.dat; touch $(OUTPUT)/sim/mem.stack.dat
	@touch $(OUTPUT)/sim/mem.ktext.dat; touch $(OUTPUT)/sim/mem.kdata.dat
	@echo -e "$mSimulating Verilog in $(OUTPUT)..."
	cd $(OUTPUT)/sim; ./simv -l vcssim.log
	@if grep 'Warning*' $(OUTPUT)/sim/vcssim.log > /dev/null; \
		then echo -e '$m$rSimulator log has warnings!$n'; fi
	@echo -e "$mSimulation of $(INPUT) has completed in $(OUTPUT)."
	@echo -e "$mTo run with the VCS GUI, navigate to $b$(OUTPUT)/sim $nand execute $b./simv -gui$n"
	@echo -e "$mTo view the simulation output, execute the following command: $bcat $(OUTPUT)/sim/vcssim.log$n"

###################################################################
### Verify Simulation
###################################################################

verify: sim
	@([ -f $(REGDUMP) ] && cp $(REGDUMP) $(OUTPUT)/sim) || \
		(echo -e "$mERROR -- reference register-dump not found: $(REGDUMP)"; exit 1)
	447util/tester.pl $(OUTPUT)/sim/$(notdir $(REGDUMP)) $(OUTPUT)/sim/regdump.txt
	@echo -e "$mVerification of $(INPUT) has completed in $(OUTPUT)."
	@echo -e "$mTo view the simulation register-dump, execute the following command: $bcat $(OUTPUT)/sim/regdump.txt$n"

batch-verify: 
	for i in $(BATCH); do \
		make verify INPUT=$$i OUTPUT=$(OUTPUT); \
	done

###################################################################
### Synthesize Verilog
###################################################################

synth:
	@echo -e "$mCopying Verilog into $(OUTPUT)..."
	@mkdir -p $(OUTPUT)/synth/src
	@cp `find $(SRC) 447src -iname '*.v*' -o -iname '*.sv*'` $(OUTPUT)/synth/src
	@echo -e "$mCopying XST configuration into $(OUTPUT)..."
	@cp 447xst/* $(OUTPUT)/synth
	@echo -e "$mManipulating XST files in $(OUTPUT)..."
	@mkdir -p $(OUTPUT)/synth/temp
	@rm -rf $(OUTPUT)/synth/$(SYNTH).prj
	@echo work > $(OUTPUT)/synth/$(SYNTH).lso
	@cd $(OUTPUT)/synth; for i in src/*.*v; do echo verilog work '"'$$i'"' >> $(SYNTH).prj; done
	@echo -e "$mSynthesizing in $(OUTPUT)/synth..."
	cd $(OUTPUT)/synth; xst -ifn $(SYNTH).xst -ofn $(SYNTH).syr
	@echo -e "$mSynthesis has completed in $(OUTPUT)."
	@echo -e "$mTo view the synthesis report, execute the following command: $bcat $(OUTPUT)/synth/lab.syr | less$n"


###################################################################
### Misc.
###################################################################

clean:
	rm -rf outputs/

