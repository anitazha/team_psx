all:
	vcs -sverilog -R -debug -timescale=1ns/1ps components.sv 220model.v lpm_div.v gte_defines.sv gte.sv
clean:
	rm -rf csrc/ DVEfiles/ simv.daidir/
	rm inter.vpd simv ucli.key
