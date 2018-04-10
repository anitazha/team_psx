#
# Team PSX CPU Makefile. Modified from the ECE 18-447 Makefile.
#
# - History: 
#   - 2011: Joshua Wise
#   - 2013: Yoongu Kim
#   - 2013: Anita Zhang
#


###################################################################
### Setup
###################################################################

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
	@echo -e "\t$bsim$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    simulates Verilog using $bINPUT$n as input;"
	@echo -e "\t    places all outputs (logs, waveforms, regdump, etc.) in $bOUTPUT$n"
	@echo -e ""
	@echo -e "\t$bverify$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    simulates Verilog using $bINPUT$n as input;"
	@echo -e "\t    places all outputs (logs, waveforms, regdump, etc.) in $bOUTPUT$n"
	@echo -e "\t    verifies the simulation register-dump against the reference"
	@echo -e ""
	@echo -e "\t$bbatch-verify$n"
	@echo -e "\t    similar to $bverify$n, but uses $bBATCH$n as input"
	@echo -e ""
	@echo -e "\t$bsynth$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    synthesizes Verilog"
	@echo -e "\t    places all outputs (reports, schematics, etc.) in $bOUTPUT$n"
	@echo -e ""
	@echo -e "\t$bauto$n"
	@echo -e "\t    automatically \"wires\" up Verilog modules found in $usrc/*.v$n;"
	@echo -e "\t    (not mandatory -- merely for your convenience)"
	@echo -e ""
	@echo -e "\t$bbios$n"
	@echo -e "\t    compiles Verilog found in $usrc$n directory;"
	@echo -e "\t    simulates Verilog using $bsrc/bios.dat$n as input;"
	@echo -e "\t    places all outputs (logs, waveforms, regdump, etc.) in $bOUTPUT$n"
	@echo -e ""
	@echo -e ""
	@echo -e "$bVARIABLE:$n"
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
	@echo -e "$bEXAMPLES:$n"
	@echo -e "\tmake sim"
	@echo -e "\tmake sim INPUT=inputs/mytest.s OUTPUT=outputs/myoutput"
	@echo -e "\tmake verify"
	@echo -e "\tmake verify INPUT=inputs/mytest.s OUTPUT=outputs/myoutput"
	@echo -e "\tmake batch-verify BATCH=447inputs/*.s"
	@echo -e "\tmake batch-verify BATCH=447inputs/*.s OUTPUT=outputs/myoutput"
	@echo -e "\tmake synth"
	@echo -e "\tmake synth OUTPUT=outputs/myoutput"
	@echo -e "\tmake bios"
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
	@cp `find src 447src -iname '*.v' -o -iname '*.vh'`	$(OUTPUT)/sim/src
	@echo -e "$mCompiling Verilog..."
	cd $(OUTPUT)/sim; ncvlog -linedebug -messages -incdir src src/*.v
	@if grep '*W' $(OUTPUT)/sim/ncvlog.log >/dev/null; \
		then echo -e '$m$rCompiler log has warnings!$n'; fi
	@echo -e "$mElaborating Verilog..."
	cd $(OUTPUT)/sim; ncelab +access+rwc -messages worklib.$(TB)
	@if grep '*W' $(OUTPUT)/sim/ncelab.log >/dev/null; \
		then echo -e '$m$rElaborator log has warnings!$n'; fi


###################################################################
### Assemble MIPS Assembly Input
###################################################################

assemble:
	@echo -e "$mCopying $(INPUT) into $(OUTPUT)..."
	@mkdir -p $(OUTPUT)/sim
	@([ -f $(INPUT) ] && cp $(INPUT) $(OUTPUT)/sim) || \
		(echo -e "$mERROR -- test input not found: $(INPUT)"; exit 1)
	@echo -e "$mAssemblying input in $(OUTPUT)..."
	spim447 -notrap -vasm $(INPUT) $(OUTPUT)/sim/mem;


###################################################################
### Simulate Verilog
###################################################################

sim: compile assemble
	@echo -e "$mCopying NCSim configuration into $(OUTPUT)..."
	@cp ncsim/* $(OUTPUT)/sim
	@cp 447ncsim/* $(OUTPUT)/sim
	@echo -e "$mSimulating Verilog in $(OUTPUT)..."
	cd $(OUTPUT)/sim; ncsim worklib.$(TB):module -input 447ncsim.tcl -input ncsim.tcl
	@if grep '*W' $(OUTPUT)/sim/ncsim.log >/dev/null; \
		then echo -e '$m$rSimulator log has warnings!$n'; fi
	@echo -e "$mSimulation of $(INPUT) has completed in $(OUTPUT)."
	@echo -e "$mTo view waveforms, execute the following command: $bsimvision $(OUTPUT)/sim/waveforms.shm$n"

###################################################################
### Simulate Verilog
###################################################################

bios: compile
	@echo -e "$mCopying NCSim configuration into $(OUTPUT)..."
	@mkdir -p $(OUTPUT)/sim
	@cp ncsim/* $(OUTPUT)/sim
	@cp 447ncsim/* $(OUTPUT)/sim
	@cp `find src -iname '*.dat'` $(OUTPUT)/sim/
	@echo -e "$mSimulating Verilog in $(OUTPUT)..."
	cd $(OUTPUT)/sim; ncsim worklib.$(TB):module -input 447ncsim.tcl -input ncsim.tcl
	@if grep '*W' $(OUTPUT)/sim/ncsim.log >/dev/null; \
		then echo -e '$m$rSimulator log has warnings!$n'; fi
	@echo -e "$mSimulation of $(INPUT) has completed in $(OUTPUT)."
	@echo -e "$mTo view waveforms, execute the following command: $bsimvision $(OUTPUT)/sim/waveforms.shm$n"

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
	@cp `find src 447src -iname '*.v' -o -iname '*.vh'`	$(OUTPUT)/synth/src
	@echo -e "$mCopying XST configuration into $(OUTPUT)..."
	@cp 447xst/* $(OUTPUT)/synth
	@echo -e "$mManipulating XST files in $(OUTPUT)..."
	@mkdir -p $(OUTPUT)/synth/temp
	@rm -rf $(OUTPUT)/synth/$(SYNTH).prj
	@echo work > $(OUTPUT)/synth/$(SYNTH).lso
	@cd $(OUTPUT)/synth; for i in src/*.v; do echo verilog work '"'$$i'"' >> $(SYNTH).prj; done
	@echo -e "$mSynthesizing in $(OUTPUT)/synth..."
	cd $(OUTPUT)/synth; xst -ifn $(SYNTH).xst -ofn $(SYNTH).syr
	@echo -e "$mSynthesis has completed in $(OUTPUT)."
	@echo -e "$mTo view the synthesis report, execute the following command: $bcat $(OUTPUT)/synth/lab.syr | less$n"


###################################################################
### Misc.
###################################################################

auto:
	@emacs -l /afs/ece/class/ece447/elisp/quicklaunch.el -l /afs/ece/class/ece447/elisp/verilog-mode.el --batch `find src -iname '*.v'` -f verilog-batch-auto
