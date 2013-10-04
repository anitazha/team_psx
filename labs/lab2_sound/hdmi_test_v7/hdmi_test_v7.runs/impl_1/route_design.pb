
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
2Z23-27
;

Starting %s Task
103*constraints2	
RoutingZ18-103
^
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
2Z35-254
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
§
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
Netlist sorting complete. 2
00:00:00.367ˇ”—FD◊ºê%2	
894.4802
0.000Z17-269
C
7Phase 1.1 Build Netlist & NodeGraph (MT) | Checksum: 0
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:02:26 . Memory (MB): peak = 1234.738 ; gain = 340.258
2
&Phase 1 Build RT Design | Checksum: 0
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:02:27 . Memory (MB): peak = 1234.738 ; gain = 340.258
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
0.94Z35-23
S
5Estimated Global Horizontal Wire Utilization = %s %%
22*route2
2.05Z35-22
E

Phase %s%s
101*constraints2
2.1 2
Restore RoutingZ18-101
=
Design has %s routable nets.
92*route2
68522Z35-249
?
#Restored %s nets from the routeDb.
95*route2
0Z35-252
E
)Found %s nets with FIXED_ROUTE property.
94*route2
0Z35-251
;
/Phase 2.1 Restore Routing | Checksum: 61d96161
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:02:28 . Memory (MB): peak = 1234.738 ; gain = 340.258
I

Phase %s%s
101*constraints2
2.2 2
Special Net RoutingZ18-101
?
3Phase 2.2 Special Net Routing | Checksum: 0d7acaf4
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:02:29 . Memory (MB): peak = 1347.246 ; gain = 452.766
R

Phase %s%s
101*constraints2
2.3 2
Non Guided Clock Net RoutingZ18-101
H
<Phase 2.3 Non Guided Clock Net Routing | Checksum: 0d7acaf4
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:02:29 . Memory (MB): peak = 1347.246 ; gain = 452.766
?
3Phase 2 Router Initialization | Checksum: 0d7acaf4
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:02:29 . Memory (MB): peak = 1347.766 ; gain = 453.285
C

Phase %s%s
101*constraints2
3 2
Initial RoutingZ18-101
9
-Phase 3 Initial Routing | Checksum: 4baf2910
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:03:23 . Memory (MB): peak = 1347.766 ; gain = 453.285
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
>
2Phase 4.1 Global Iteration 0 | Checksum: 104f17f5
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:04:17 . Memory (MB): peak = 1347.766 ; gain = 453.285
<
0Phase 4 Rip-up And Reroute | Checksum: 104f17f5
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:04:18 . Memory (MB): peak = 1347.766 ; gain = 453.285
A

Phase %s%s
101*constraints2
5 2
Post Hold FixZ18-101
7
+Phase 5 Post Hold Fix | Checksum: 104f17f5
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:04:18 . Memory (MB): peak = 1347.766 ; gain = 453.285
I

Phase %s%s
101*constraints2
6 2
Verifying routed netsZ18-101
?
3Phase 6 Verifying routed nets | Checksum: 104f17f5
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:04:18 . Memory (MB): peak = 1347.766 ; gain = 453.285
E

Phase %s%s
101*constraints2
7 2
Depositing RoutesZ18-101
;
/Phase 7 Depositing Routes | Checksum: 79c8cf59
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:04:32 . Memory (MB): peak = 1347.766 ; gain = 453.285
4
Router Completed Successfully
16*routeZ35-16
,
 Ending Route Task | Checksum: 0
*common
e

%s
*constraints2N
LTime (s): elapsed = 00:04:32 . Memory (MB): peak = 1347.766 ; gain = 453.285
j
QWebTalk data collection is enabled (User setting is ON. Install Setting is ON.).
118*projectZ1-118
Ÿ
Ü'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2Z
XC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.runs/impl_1/usage_statistics_webtalk.xml2
Thu Oct 03 17:26:48 20132?
=C:/Xilinx/14.3/ISE_DS/PlanAhead/doc/webtalk_introduction.htmlZ17-186
e

%s
*constraints2N
LTime (s): elapsed = 00:04:34 . Memory (MB): peak = 1347.766 ; gain = 453.285
?
Releasing license: %s
83*common2
ImplementationZ17-83
å
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
route_design: 2

00:04:362

1347.7662	
453.285Z17-269
5
Running DRC with %s threads
24*drc2
2Z23-27
Ì
#The results of DRC are in file %s.
168*coretcl2¨
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.runs/impl_1/top_test_drc_routed.rptSC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.runs/impl_1/top_test_drc_routed.rpt8Z2-168
à
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
report_drc: 2

00:00:122

1347.7662
0.000Z17-269
B
,Running Vector-less Activity Propagation...
51*powerZ33-51
G
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1
ä
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
report_power: 2

00:00:332

1347.7662
0.000Z17-269
n
UpdateTimingParams:%s.
91*timing2>
< Speed grade: -2, Delay Type: min_max, Constraints type: SDCZ38-91
a
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
2Z38-191
ì
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
report_timing_summary: 2

00:00:192

1347.7662
0.000Z17-269
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
ë
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
Write XDEF Complete: 2

00:00:142

1347.7662
0.000Z17-269
é
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
write_checkpoint: 2

00:00:182

1347.7662
0.000Z17-269


End Record