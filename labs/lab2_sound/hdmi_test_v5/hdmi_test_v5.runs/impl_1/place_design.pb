
6
Command: %s
53*	vivadotcl2
place_designZ4-113
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
U
,Running DRC as a precondition to command %s
22*	vivadotcl2
place_designZ4-22
5
Running DRC with %s threads
24*drc2
4Z23-27
;
DRC finished with %s
79*	vivadotcl2

0 ErrorsZ4-198
\
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199
:

Starting %s Task
103*constraints2
PlacerZ18-103
b
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
4Z30-611
I

Phase %s%s
101*constraints2
1 2
Placer InitializationZ18-101
³
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2
00:00:00.062
00:00:00.062

1603.7272
0.000Z17-268
R

Phase %s%s
101*constraints2
1.1 2
Mandatory Logic OptimizationZ18-101
1
Pushed %s inverter(s).
98*opt2
0Z31-138
I
=Phase 1.1 Mandatory Logic Optimization | Checksum: 178cabafc
*common
t

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1603.727 ; gain = 0.000
]

Phase %s%s
101*constraints2
1.2 2)
'Build Super Logic Region (SLR) DatabaseZ18-101
T
HPhase 1.2 Build Super Logic Region (SLR) Database | Checksum: 178cabafc
*common
t

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1603.727 ; gain = 0.000
E

Phase %s%s
101*constraints2
1.3 2
Add ConstraintsZ18-101
<
0Phase 1.3 Add Constraints | Checksum: 178cabafc
*common
t

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1603.727 ; gain = 0.000
R

Phase %s%s
101*constraints2
1.4 2
Routing Based Site ExclusionZ18-101
I
=Phase 1.4 Routing Based Site Exclusion | Checksum: 178cabafc
*common
t

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1603.727 ; gain = 0.000
B

Phase %s%s
101*constraints2
1.5 2
Build MacrosZ18-101
8
,Phase 1.5 Build Macros | Checksum: dfd48d86
*common
t

%s
*constraints2]
[Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1603.727 ; gain = 0.000
V

Phase %s%s
101*constraints2
1.6 2"
 Implementation Feasibility checkZ18-101
‹
„A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place23
1icon/U0/U_ICON/U_CTRL_OUT/F_NCP[0].F_CMD[9].U_LCE2
122
0	ila/U0/I_YES_D.U_ILA/U_STAT/U_DIRTY_LDC {LDCE}
Z30-568
L
@Phase 1.6 Implementation Feasibility check | Checksum: dfd48d86
*common
t

%s
*constraints2]
[Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 1603.727 ; gain = 0.000
E

Phase %s%s
101*constraints2
1.7 2
Pre-Place CellsZ18-101
;
/Phase 1.7 Pre-Place Cells | Checksum: c8eedd4c
*common
t

%s
*constraints2]
[Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 1603.727 ; gain = 0.000
h

Phase %s%s
101*constraints2
1.8 24
2IO Placement/ Clock Placement/ Build Placer DeviceZ18-101
^
RPhase 1.8 IO Placement/ Clock Placement/ Build Placer Device | Checksum: c8eedd4c
*common
u

%s
*constraints2^
\Time (s): cpu = 00:00:13 ; elapsed = 00:00:12 . Memory (MB): peak = 1633.738 ; gain = 30.012
P

Phase %s%s
101*constraints2
1.9 2
Build Placer Netlist ModelZ18-101
I

Phase %s%s
101*constraints2
1.9.1 2
Place Init DesignZ18-101
?
3Phase 1.9.1 Place Init Design | Checksum: 4e0725dc
*common
u

%s
*constraints2^
\Time (s): cpu = 00:00:15 ; elapsed = 00:00:14 . Memory (MB): peak = 1633.738 ; gain = 30.012
F
:Phase 1.9 Build Placer Netlist Model | Checksum: 4e0725dc
*common
u

%s
*constraints2^
\Time (s): cpu = 00:00:15 ; elapsed = 00:00:14 . Memory (MB): peak = 1633.738 ; gain = 30.012
N

Phase %s%s
101*constraints2
1.10 2
Constrain Clocks/MacrosZ18-101
Y

Phase %s%s
101*constraints2	
1.10.1 2"
 Constrain Global/Regional ClocksZ18-101
O
CPhase 1.10.1 Constrain Global/Regional Clocks | Checksum: 4e0725dc
*common
u

%s
*constraints2^
\Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 1633.738 ; gain = 30.012
D
8Phase 1.10 Constrain Clocks/Macros | Checksum: 4e0725dc
*common
u

%s
*constraints2^
\Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 1633.738 ; gain = 30.012
?
3Phase 1 Placer Initialization | Checksum: 4e0725dc
*common
u

%s
*constraints2^
\Time (s): cpu = 00:00:15 ; elapsed = 00:00:15 . Memory (MB): peak = 1633.738 ; gain = 30.012
D

Phase %s%s
101*constraints2
2 2
Global PlacementZ18-101
:
.Phase 2 Global Placement | Checksum: de630c44
*common
u

%s
*constraints2^
\Time (s): cpu = 00:03:54 ; elapsed = 00:01:33 . Memory (MB): peak = 1633.738 ; gain = 30.012
D

Phase %s%s
101*constraints2
3 2
Detail PlacementZ18-101
P

Phase %s%s
101*constraints2
3.1 2
Commit Multi Column MacrosZ18-101
F
:Phase 3.1 Commit Multi Column Macros | Checksum: de630c44
*common
u

%s
*constraints2^
\Time (s): cpu = 00:03:55 ; elapsed = 00:01:34 . Memory (MB): peak = 1633.738 ; gain = 30.012
R

Phase %s%s
101*constraints2
3.2 2
Commit Most Macros & LUTRAMsZ18-101
H
<Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 8c337de3
*common
u

%s
*constraints2^
\Time (s): cpu = 00:03:56 ; elapsed = 00:01:35 . Memory (MB): peak = 1633.738 ; gain = 30.012
L

Phase %s%s
101*constraints2
3.3 2
Area Swap OptimizationZ18-101
C
7Phase 3.3 Area Swap Optimization | Checksum: 124880dec
*common
u

%s
*constraints2^
\Time (s): cpu = 00:03:57 ; elapsed = 00:01:36 . Memory (MB): peak = 1633.738 ; gain = 30.012
K

Phase %s%s
101*constraints2
3.4 2
Timing Path OptimizerZ18-101
B
6Phase 3.4 Timing Path Optimizer | Checksum: 124880dec
*common
u

%s
*constraints2^
\Time (s): cpu = 00:03:57 ; elapsed = 00:01:36 . Memory (MB): peak = 1633.738 ; gain = 30.012
V

Phase %s%s
101*constraints2
3.5 2"
 Commit Small Macros & Core LogicZ18-101
M
APhase 3.5 Commit Small Macros & Core Logic | Checksum: 151652fad
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:18 ; elapsed = 00:01:51 . Memory (MB): peak = 1663.750 ; gain = 60.023
H

Phase %s%s
101*constraints2
3.6 2
Re-assign LUT pinsZ18-101
?
3Phase 3.6 Re-assign LUT pins | Checksum: 151652fad
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:22 ; elapsed = 00:01:55 . Memory (MB): peak = 1663.750 ; gain = 60.023
;
/Phase 3 Detail Placement | Checksum: 151652fad
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:22 ; elapsed = 00:01:55 . Memory (MB): peak = 1663.750 ; gain = 60.023
\

Phase %s%s
101*constraints2
4 2*
(Post Placement Optimization and Clean-UpZ18-101
L

Phase %s%s
101*constraints2
4.1 2
Post Placement CleanupZ18-101
C
7Phase 4.1 Post Placement Cleanup | Checksum: 1a8e1d11d
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:23 ; elapsed = 00:01:56 . Memory (MB): peak = 1663.750 ; gain = 60.023
F

Phase %s%s
101*constraints2
4.2 2
Placer ReportingZ18-101
=
1Phase 4.2 Placer Reporting | Checksum: 1a8e1d11d
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:24 ; elapsed = 00:01:56 . Memory (MB): peak = 1663.750 ; gain = 60.023
M

Phase %s%s
101*constraints2
4.3 2
Final Placement CleanupZ18-101
D
8Phase 4.3 Final Placement Cleanup | Checksum: 16560ae39
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:24 ; elapsed = 00:01:57 . Memory (MB): peak = 1663.750 ; gain = 60.023
S
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 16560ae39
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:24 ; elapsed = 00:01:57 . Memory (MB): peak = 1663.750 ; gain = 60.023
5
)Ending Placer Task | Checksum: 18e134696
*common
u

%s
*constraints2^
\Time (s): cpu = 00:04:24 ; elapsed = 00:01:57 . Memory (MB): peak = 1663.750 ; gain = 60.023
w
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
312
1062
42
0Z4-41
C
%s completed successfully
29*	vivadotcl2
place_designZ4-42
¢
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
place_design: 2

00:04:252

00:01:582

1663.7502
60.023Z17-268
O

DEBUG : %s144*timing2*
(Generate clock report | CPU: 0.69 secs 
Z38-163
‚
vreport_utilization: Time (s): cpu = 00:00:00.63 ; elapsed = 00:00:00.67 . Memory (MB): peak = 1663.750 ; gain = 0.000
*common
[

DEBUG : %s134*designutils21
/Generate Control Sets report | CPU: 0.08 secs 
Z20-134
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
¨
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write XDEF Complete: 2

00:00:072

00:00:072

1664.1252
0.375Z17-268
¥
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_checkpoint: 2

00:00:102

00:00:102

1664.1252
0.375Z17-268


End Record