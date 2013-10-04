
x
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2
	xc7vx485tZ17-347
h
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2
	xc7vx485tZ17-349
<
%Done setting XDC timing constraints.
35*timingZ38-35
F

Starting %s Task
103*constraints2
Logic OptimizationZ18-103
4
(Logic Optimization | Checksum: 739bf192
*common
§
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
Netlist sorting complete. 2
00:00:00.549
|’è†·Æê%2	
726.9142
0.000Z17-269
<

Phase %s%s
101*constraints2
1 2

RetargetZ18-101
0
Retargeted %s cell(s).
49*opt2
0Z31-49
2
&Phase 1 Retarget | Checksum: 75586258
*common
b

%s
*constraints2K
ITime (s): elapsed = 00:00:01 . Memory (MB): peak = 726.914 ; gain = 0.000
H

Phase %s%s
101*constraints2
2 2
Constant PropagationZ18-101
/
Eliminated %s cells.
10*opt2
50Z31-10
>
2Phase 2 Constant Propagation | Checksum: 91f361bb
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:26 . Memory (MB): peak = 804.023 ; gain = 77.109
9

Phase %s%s
101*constraints2
3 2
SweepZ18-101
C
Deleting driverless net: %s.
6*opt2
icon/CONTROL0[3]Z31-6
;
 Eliminated %s unconnected nets.
12*opt2
107Z31-12
õ
¿Problem: A %s cell in the design is missing a connection on input pin I%s, which is used by the LUT equation. This pin has either been left unconnected in the design or the connection was removed due to the trimming of unused logic. The LUT cell name is: %s 
Resolution: Please review the preceding OPT INFO messages that detail what has been trimmed in the design to determine if the removal of unused logic is causing this error. If opt_design is being specified directly, it will need to be rerun with opt_design -verbose to generate detailed INFO messages about trimming.
67*opt2
LUT62
427
5icon/U0/U_ICON/U_TDO_MUX/U_CS_MUX/I4.U_MUX16/Mmux_O11Z31-67
;
!Eliminated %s unconnected cells.
11*opt2
77Z31-11
/
#Phase 3 Sweep | Checksum: 44d732cf
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:27 . Memory (MB): peak = 804.023 ; gain = 77.109
@
4Ending Logic Optimization Task | Checksum: 44d732cf
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:27 . Memory (MB): peak = 804.023 ; gain = 77.109
?
Releasing license: %s
83*common2
ImplementationZ17-83
S
Exiting %s at %s...
206*common2
Vivado2
Thu Oct 03 22:14:36 2013Z17-206