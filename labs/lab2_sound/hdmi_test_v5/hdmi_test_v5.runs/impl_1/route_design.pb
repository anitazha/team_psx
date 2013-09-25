
6
Command: %s
53*	vivadotcl2
route_designZ4-113
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
route_designZ4-22
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
;

Starting %s Task
103*constraints2	
RoutingZ18-103
^
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
4Z35-254
9

Starting %s Task
103*constraints2
RouteZ18-103
C

Phase %s%s
101*constraints2
1 2
Build RT DesignZ18-101
T

Phase %s%s
101*constraints2
1.1 2 
Build Netlist & NodeGraph (MT)Z18-101
³
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2
00:00:00.202
00:00:00.102

1675.7852
0.000Z17-268
C
7Phase 1.1 Build Netlist & NodeGraph (MT) | Checksum: 0
*common
v

%s
*constraints2_
]Time (s): cpu = 00:01:53 ; elapsed = 00:01:13 . Memory (MB): peak = 1912.258 ; gain = 236.473
2
&Phase 1 Build RT Design | Checksum: 0
*common
v

%s
*constraints2_
]Time (s): cpu = 00:01:54 ; elapsed = 00:01:15 . Memory (MB): peak = 1912.258 ; gain = 236.473
I

Phase %s%s
101*constraints2
2 2
Router InitializationZ18-101
r
\No timing constraints were detected. The router will operate in resource-optimization mode.
64*routeZ35-64
Q
3Estimated Global Vertical Wire Utilization = %s %%
23*route2
0.80Z35-23
S
5Estimated Global Horizontal Wire Utilization = %s %%
22*route2
1.59Z35-22
E

Phase %s%s
101*constraints2
2.1 2
Restore RoutingZ18-101
=
Design has %s routable nets.
92*route2
46645Z35-249
?
#Restored %s nets from the routeDb.
95*route2
0Z35-252
E
)Found %s nets with FIXED_ROUTE property.
94*route2
0Z35-251
;
/Phase 2.1 Restore Routing | Checksum: 4c1b92ee
*common
v

%s
*constraints2_
]Time (s): cpu = 00:01:55 ; elapsed = 00:01:16 . Memory (MB): peak = 1912.258 ; gain = 236.473
I

Phase %s%s
101*constraints2
2.2 2
Special Net RoutingZ18-101
?
3Phase 2.2 Special Net Routing | Checksum: 5c8291b4
*common
v

%s
*constraints2_
]Time (s): cpu = 00:01:58 ; elapsed = 00:01:19 . Memory (MB): peak = 1960.352 ; gain = 284.566
M

Phase %s%s
101*constraints2
2.3 2
Local Clock Net RoutingZ18-101
C
7Phase 2.3 Local Clock Net Routing | Checksum: 5c8291b4
*common
v

%s
*constraints2_
]Time (s): cpu = 00:01:58 ; elapsed = 00:01:19 . Memory (MB): peak = 1960.352 ; gain = 284.566
?
3Phase 2 Router Initialization | Checksum: 5c8291b4
*common
v

%s
*constraints2_
]Time (s): cpu = 00:01:58 ; elapsed = 00:01:19 . Memory (MB): peak = 1960.352 ; gain = 284.566
C

Phase %s%s
101*constraints2
3 2
Initial RoutingZ18-101
9
-Phase 3 Initial Routing | Checksum: 176289c4
*common
v

%s
*constraints2_
]Time (s): cpu = 00:03:06 ; elapsed = 00:01:40 . Memory (MB): peak = 2026.133 ; gain = 350.348
F

Phase %s%s
101*constraints2
4 2
Rip-up And RerouteZ18-101
H

Phase %s%s
101*constraints2
4.1 2
Global Iteration 0Z18-101
G

Phase %s%s
101*constraints2
4.1.1 2
Remove OverlapsZ18-101
=
1Phase 4.1.1 Remove Overlaps | Checksum: 47814e65
*common
v

%s
*constraints2_
]Time (s): cpu = 00:04:15 ; elapsed = 00:02:09 . Memory (MB): peak = 2026.133 ; gain = 350.348
>
2Phase 4.1 Global Iteration 0 | Checksum: 47814e65
*common
v

%s
*constraints2_
]Time (s): cpu = 00:04:15 ; elapsed = 00:02:10 . Memory (MB): peak = 2026.133 ; gain = 350.348
<
0Phase 4 Rip-up And Reroute | Checksum: 47814e65
*common
v

%s
*constraints2_
]Time (s): cpu = 00:04:15 ; elapsed = 00:02:10 . Memory (MB): peak = 2026.133 ; gain = 350.348
A

Phase %s%s
101*constraints2
5 2
Post Hold FixZ18-101
7
+Phase 5 Post Hold Fix | Checksum: 47814e65
*common
v

%s
*constraints2_
]Time (s): cpu = 00:04:15 ; elapsed = 00:02:10 . Memory (MB): peak = 2026.133 ; gain = 350.348
I

Phase %s%s
101*constraints2
6 2
Verifying routed netsZ18-101
?
3Phase 6 Verifying routed nets | Checksum: 47814e65
*common
v

%s
*constraints2_
]Time (s): cpu = 00:04:16 ; elapsed = 00:02:10 . Memory (MB): peak = 2026.133 ; gain = 350.348
E

Phase %s%s
101*constraints2
7 2
Depositing RoutesZ18-101
;
/Phase 7 Depositing Routes | Checksum: 6b892743
*common
v

%s
*constraints2_
]Time (s): cpu = 00:04:25 ; elapsed = 00:02:19 . Memory (MB): peak = 2026.133 ; gain = 350.348
4
Router Completed Successfully
16*routeZ35-16
,
 Ending Route Task | Checksum: 0
*common
v

%s
*constraints2_
]Time (s): cpu = 00:04:25 ; elapsed = 00:02:19 . Memory (MB): peak = 2026.133 ; gain = 350.348
j
QWebTalk data collection is enabled (User setting is ON. Install Setting is ON.).
118*projectZ1-118
s
ZWebTalk report has not been sent to Xilinx. Please check your network and proxy settings.
185*commonZ17-185
v

%s
*constraints2_
]Time (s): cpu = 00:04:25 ; elapsed = 00:02:20 . Memory (MB): peak = 2026.133 ; gain = 350.348
w
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
482
1062
42
0Z4-41
C
%s completed successfully
29*	vivadotcl2
route_designZ4-42
£
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
route_design: 2

00:04:282

00:02:222

2026.1332	
362.008Z17-268
5
Running DRC with %s threads
24*drc2
4Z23-27
ÿ
#The results of DRC are in file %s.
168*coretcl2¾
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.runs/impl_1/top_test_drc_routed.rpt\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.runs/impl_1/top_test_drc_routed.rpt8Z2-168
Ÿ
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
report_drc: 2

00:00:202

00:00:092

2026.1332
0.000Z17-268
Ê
{ Setting default frequency of %s MHz on the clock %s . Please specify frequency of this clock for accurate power estimate.
164*power2
0.002-
+icon/U0/U_ICON/I_YES_BSCAN.U_BS/iDRCK_LOCALZ33-164
²
{ Setting default frequency of %s MHz on the clock %s . Please specify frequency of this clock for accurate power estimate.
164*power2
0.002
icon/U0/iUPDATE_OUTZ33-164
®
{ Setting default frequency of %s MHz on the clock %s . Please specify frequency of this clock for accurate power estimate.
164*power2
0.002
hdmi0/spdif0/O3Z33-164
³
{ Setting default frequency of %s MHz on the clock %s . Please specify frequency of this clock for accurate power estimate.
164*power2
0.002
hdmi0/video0/pclk/O2Z33-164
§
{ Setting default frequency of %s MHz on the clock %s . Please specify frequency of this clock for accurate power estimate.
164*power2
0.002

SYSCLK_PZ33-164
B
,Running Vector-less Activity Propagation...
51*powerZ33-51
G
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1
£
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
report_power: 2

00:01:532

00:01:192

2139.4842	
113.352Z17-268
n
UpdateTimingParams:%s.
91*timing2>
< Speed grade: -2, Delay Type: min_max, Constraints type: SDCZ38-91
a
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
4Z38-191
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

00:00:102

00:00:112

2139.4842
0.000Z17-268
¥
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_checkpoint: 2

00:00:142

00:00:152

2139.4842
0.000Z17-268


End Record