
?
Feature available: %s
81*common2
ImplementationZ17-81
:
Feature available: %s
81*common2
	SynthesisZ17-81
y
+Loading parts and site information from %s
36*device25
3C:/Xilinx/14.3/ISE_DS/PlanAhead/data/parts/arch.xmlZ21-36
Ü
!Parsing RTL primitives file [%s]
14*netlist2K
IC:/Xilinx/14.3/ISE_DS/PlanAhead/data/parts/xilinx/rtl/prims/rtl_prims.xmlZ29-14
è
*Finished parsing RTL primitives file [%s]
11*netlist2K
IC:/Xilinx/14.3/ISE_DS/PlanAhead/data/parts/xilinx/rtl/prims/rtl_prims.xmlZ29-11
/

Starting synthesis...

3*	vivadotclZ4-3
s
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2
	xc7vx485tZ17-347
c
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2
	xc7vx485tZ17-349
a
UUsing Xilinx IP in: C:/Xilinx/14.3/ISE_DS/ISE/coregen/ip/xilinx/primary/com/xilinx/ip*common


*common
w
%s*synth2h
fstarting Rtl Elaboration : Time (s): elapsed = 00:00:05 . Memory (MB): peak = 211.000 ; gain = 61.465

£
synthesizing module '%s'638*oasys2

top_test2[
WC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/top_test.sv2
68@Z8-638
ã
synthesizing module '%s'638*oasys2
IBUFDS2A
=C:/Xilinx/14.3/ISE_DS/PlanAhead/scripts/rt/data/unisim_comp.v2	
108348@Z8-638
L
%s*synth2=
;	Parameter CAPACITANCE bound to: DONT_CARE - type: string 

E
%s*synth26
4	Parameter DIFF_TERM bound to: TRUE - type: string 

E
%s*synth26
4	Parameter DQS_BIAS bound to: FALSE - type: string 

I
%s*synth2:
8	Parameter IBUF_DELAY_VALUE bound to: 0 - type: string 

H
%s*synth29
7	Parameter IBUF_LOW_PWR bound to: TRUE - type: string 

K
%s*synth2<
:	Parameter IFD_DELAY_VALUE bound to: AUTO - type: string 

I
%s*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 

£
%done synthesizing module '%s' (%s#%s)256*oasys2
IBUFDS2
12
162A
=C:/Xilinx/14.3/ISE_DS/PlanAhead/scripts/rt/data/unisim_comp.v2	
108348@Z8-256
ú
synthesizing module '%s'638*oasys2
hdmi2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/hdmi.sv2
238@Z8-638
®
synthesizing module '%s'638*oasys2

i2c_config2]
YC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/i2c_config.sv2
318@Z8-638
Æ
synthesizing module '%s'638*oasys2
i2c_master_top2_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
788@Z8-638
5
%s*synth2&
$	Parameter ARST_LVL bound to: 1'b1 

∫
synthesizing module '%s'638*oasys2
i2c_master_byte_ctrl2e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
758@Z8-638
6
%s*synth2'
%	Parameter ST_IDLE bound to: 3'b000 

7
%s*synth2(
&	Parameter ST_START bound to: 3'b001 

6
%s*synth2'
%	Parameter ST_READ bound to: 3'b010 

7
%s*synth2(
&	Parameter ST_WRITE bound to: 3'b011 

5
%s*synth2&
$	Parameter ST_ACK bound to: 3'b100 

6
%s*synth2'
%	Parameter ST_STOP bound to: 3'b101 

π
synthesizing module '%s'638*oasys2
i2c_master_bit_ctrl2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
1438@Z8-638
C
%s*synth24
2	Parameter idle bound to: 18'b000000000000000000 

F
%s*synth27
5	Parameter start_a bound to: 18'b000000000000000001 

F
%s*synth27
5	Parameter start_b bound to: 18'b000000000000000010 

F
%s*synth27
5	Parameter start_c bound to: 18'b000000000000000100 

F
%s*synth27
5	Parameter start_d bound to: 18'b000000000000001000 

F
%s*synth27
5	Parameter start_e bound to: 18'b000000000000010000 

E
%s*synth26
4	Parameter stop_a bound to: 18'b000000000000100000 

E
%s*synth26
4	Parameter stop_b bound to: 18'b000000000001000000 

E
%s*synth26
4	Parameter stop_c bound to: 18'b000000000010000000 

E
%s*synth26
4	Parameter stop_d bound to: 18'b000000000100000000 

C
%s*synth24
2	Parameter rd_a bound to: 18'b000000001000000000 

C
%s*synth24
2	Parameter rd_b bound to: 18'b000000010000000000 

C
%s*synth24
2	Parameter rd_c bound to: 18'b000000100000000000 

C
%s*synth24
2	Parameter rd_d bound to: 18'b000001000000000000 

C
%s*synth24
2	Parameter wr_a bound to: 18'b000010000000000000 

C
%s*synth24
2	Parameter wr_b bound to: 18'b000100000000000000 

C
%s*synth24
2	Parameter wr_c bound to: 18'b001000000000000000 

C
%s*synth24
2	Parameter wr_d bound to: 18'b010000000000000000 

‹
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4068@Z8-3536
ÿ
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
	full_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4068@Z8-3536
‹
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4108@Z8-3536
ÿ
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
	full_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4108@Z8-3536
—
%done synthesizing module '%s' (%s#%s)256*oasys2
i2c_master_bit_ctrl2
22
162d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
1438@Z8-256
›
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
2328@Z8-3536
Ÿ
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
	full_case2e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
2328@Z8-3536
“
%done synthesizing module '%s' (%s#%s)256*oasys2
i2c_master_byte_ctrl2
32
162e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
758@Z8-256
◊
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
1648@Z8-3536
◊
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
1928@Z8-3536
∆
%done synthesizing module '%s' (%s#%s)256*oasys2
i2c_master_top2
42
162_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
788@Z8-256
∞
-case statement is not full and has no default155*oasys2]
YC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/i2c_config.sv2
3488@Z8-155
¿
%done synthesizing module '%s' (%s#%s)256*oasys2

i2c_config2
52
162]
YC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/i2c_config.sv2
318@Z8-256
û
synthesizing module '%s'638*oasys2
video2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
148@Z8-638
°
synthesizing module '%s'638*oasys2	
counter2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-638
A
%s*synth22
0	Parameter WIDTH bound to: 841 - type: integer 

π
%done synthesizing module '%s' (%s#%s)256*oasys2	
counter2
62
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-256
±
synthesizing module '%s'638*oasys2
counter__parameterized02X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-638
A
%s*synth22
0	Parameter WIDTH bound to: 516 - type: integer 

…
%done synthesizing module '%s' (%s#%s)256*oasys2
counter__parameterized02
62
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-256
¢
synthesizing module '%s'638*oasys2

register2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1568@Z8-638
@
%s*synth21
/	Parameter WIDTH bound to: 36 - type: integer 

∫
%done synthesizing module '%s' (%s#%s)256*oasys2

register2
72
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1568@Z8-256
¢
synthesizing module '%s'638*oasys2
	video_fsm2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
698@Z8-638
´
-case statement is not full and has no default155*oasys2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1028@Z8-155
∫
%done synthesizing module '%s' (%s#%s)256*oasys2
	video_fsm2
82
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
698@Z8-256
•
synthesizing module '%s'638*oasys2
pixel_clock2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1738@Z8-638
Ω
%done synthesizing module '%s' (%s#%s)256*oasys2
pixel_clock2
92
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1738@Z8-256
∑
%done synthesizing module '%s' (%s#%s)256*oasys2
video2
102
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
148@Z8-256
û
synthesizing module '%s'638*oasys2
spdif2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
258@Z8-638
@
%s*synth21
/	Parameter PREAMBLE_B_0 bound to: 8'b11101000 

@
%s*synth21
/	Parameter PREAMBLE_B_1 bound to: 8'b00010111 

@
%s*synth21
/	Parameter PREAMBLE_M_0 bound to: 8'b11100010 

@
%s*synth21
/	Parameter PREAMBLE_M_1 bound to: 8'b00011101 

@
%s*synth21
/	Parameter PREAMBLE_W_0 bound to: 8'b11100100 

@
%s*synth21
/	Parameter PREAMBLE_W_1 bound to: 8'b00011011 

ù
synthesizing module '%s'638*oasys2
bmc2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
1978@Z8-638
∂
%done synthesizing module '%s' (%s#%s)256*oasys2
bmc2
112
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
1978@Z8-256
∑
%done synthesizing module '%s' (%s#%s)256*oasys2
spdif2
122
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
258@Z8-256
µ
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi2
132
162W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/hdmi.sv2
238@Z8-256
®
synthesizing module '%s'638*oasys2
hdmi_test_feeder2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
248@Z8-638
®
synthesizing module '%s'638*oasys2
hdmi_test_sender2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
618@Z8-638
D
%s*synth25
3	Parameter ADDR_SIZE bound to: 19 - type: integer 

©
-case statement is not full and has no default155*oasys2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
988@Z8-155
¡
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi_test_sender2
142
162W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
618@Z8-256
¡
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi_test_feeder2
152
162W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
248@Z8-256
º
%done synthesizing module '%s' (%s#%s)256*oasys2

top_test2
162
162[
WC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/top_test.sv2
68@Z8-256
x
%s*synth2i
gfinished Rtl Elaboration : Time (s): elapsed = 00:00:18 . Memory (MB): peak = 501.285 ; gain = 351.750

(
%s*synth2
Report Check Netlist: 

R
%s*synth2C
A-----+-----------------+------+--------+------+-----------------

R
%s*synth2C
A     |Item             |Errors|Warnings|Status|Description      

R
%s*synth2C
A-----+-----------------+------+--------+------+-----------------

R
%s*synth2C
A1    |multi_driven_nets|     0|       0|Passed|Multi driven nets

R
%s*synth2C
A-----+-----------------+------+--------+------+-----------------

W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[35]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[34]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[33]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[32]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[31]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[30]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[29]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[28]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[27]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[26]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[25]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[24]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[23]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[22]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[21]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[20]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[19]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[18]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[17]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[16]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[15]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[14]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[13]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[12]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[11]Z8-3295
W
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[10]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[9]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[8]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[7]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[6]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[5]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[4]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[3]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[2]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[1]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	pixel_reg2
in[0]Z8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	video_fsm2
hsyncZ8-3295
V
'tying undriven pin %s:%s to constant 0
3295*oasys2
	video_fsm2
vsyncZ8-3295
î
Loading clock regions from %s
13*device2]
[C:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/virtex7/virtex7/xc7vx485t/ClockRegion.xmlZ21-13
ï
Loading clock buffers from %s
11*device2^
\C:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/virtex7/virtex7/xc7vx485t/ClockBuffers.xmlZ21-11
ê
&Loading clock placement rules from %s
318*place2P
NC:/Xilinx/14.3/ISE_DS/PlanAhead/data/parts/xilinx/virtex7/ClockPlacerRules.xmlZ30-318
é
)Loading package pin functions from %s...
17*device2L
JC:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/virtex7/PinFunctions.xmlZ21-17
í
Loading package from %s
16*device2a
_C:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/virtex7/virtex7/xc7vx485t/ffg1761/Package.xmlZ21-16
É
Loading io standards from %s
15*device2M
KC:/Xilinx/14.3/ISE_DS/PlanAhead/data\./parts/xilinx/virtex7/IOStandards.xmlZ21-15
è
+Loading device configuration modes from %s
14*device2K
IC:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/virtex7/ConfigModes.xmlZ21-14
ä
/Loading list of drcs for the architecture : %s
17*drc2E
CC:/Xilinx/14.3/ISE_DS/PlanAhead/data\./parts/xilinx/virtex7/drc.xmlZ23-17
5

Processing XDC Constraints
244*projectZ1-262
è
Parsing XDC File [%s]
179*designutils2Y
WC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/constrs_1/imports/new/top_test.xdcZ20-179
ò
Finished Parsing XDC File [%s]
178*designutils2Y
WC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/constrs_1/imports/new/top_test.xdcZ20-178
?
&Completed Processing XDC Constraints

245*projectZ1-263
c
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111
1
%Phase 0 | Netlist Checksum: 59eda915
*common
a
UUsing Xilinx IP in: C:/Xilinx/14.3/ISE_DS/ISE/coregen/ip/xilinx/primary/com/xilinx/ip*common


*common
s
%s*synth2d
bstarting synthesize : Time (s): elapsed = 00:00:42 . Memory (MB): peak = 637.242 ; gain = 487.707

£
synthesizing module '%s'638*oasys2

top_test2[
WC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/top_test.sv2
68@Z8-638
ã
synthesizing module '%s'638*oasys2
IBUFDS2A
=C:/Xilinx/14.3/ISE_DS/PlanAhead/scripts/rt/data/unisim_comp.v2	
108348@Z8-638
L
%s*synth2=
;	Parameter CAPACITANCE bound to: DONT_CARE - type: string 

E
%s*synth26
4	Parameter DIFF_TERM bound to: TRUE - type: string 

E
%s*synth26
4	Parameter DQS_BIAS bound to: FALSE - type: string 

I
%s*synth2:
8	Parameter IBUF_DELAY_VALUE bound to: 0 - type: string 

H
%s*synth29
7	Parameter IBUF_LOW_PWR bound to: TRUE - type: string 

K
%s*synth2<
:	Parameter IFD_DELAY_VALUE bound to: AUTO - type: string 

I
%s*synth2:
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 

£
%done synthesizing module '%s' (%s#%s)256*oasys2
IBUFDS2
12
162A
=C:/Xilinx/14.3/ISE_DS/PlanAhead/scripts/rt/data/unisim_comp.v2	
108348@Z8-256
ú
synthesizing module '%s'638*oasys2
hdmi2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/hdmi.sv2
238@Z8-638
®
synthesizing module '%s'638*oasys2

i2c_config2]
YC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/i2c_config.sv2
318@Z8-638
Æ
synthesizing module '%s'638*oasys2
i2c_master_top2_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
788@Z8-638
5
%s*synth2&
$	Parameter ARST_LVL bound to: 1'b1 

∫
synthesizing module '%s'638*oasys2
i2c_master_byte_ctrl2e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
758@Z8-638
6
%s*synth2'
%	Parameter ST_IDLE bound to: 3'b000 

7
%s*synth2(
&	Parameter ST_START bound to: 3'b001 

6
%s*synth2'
%	Parameter ST_READ bound to: 3'b010 

7
%s*synth2(
&	Parameter ST_WRITE bound to: 3'b011 

5
%s*synth2&
$	Parameter ST_ACK bound to: 3'b100 

6
%s*synth2'
%	Parameter ST_STOP bound to: 3'b101 

π
synthesizing module '%s'638*oasys2
i2c_master_bit_ctrl2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
1438@Z8-638
C
%s*synth24
2	Parameter idle bound to: 18'b000000000000000000 

F
%s*synth27
5	Parameter start_a bound to: 18'b000000000000000001 

F
%s*synth27
5	Parameter start_b bound to: 18'b000000000000000010 

F
%s*synth27
5	Parameter start_c bound to: 18'b000000000000000100 

F
%s*synth27
5	Parameter start_d bound to: 18'b000000000000001000 

F
%s*synth27
5	Parameter start_e bound to: 18'b000000000000010000 

E
%s*synth26
4	Parameter stop_a bound to: 18'b000000000000100000 

E
%s*synth26
4	Parameter stop_b bound to: 18'b000000000001000000 

E
%s*synth26
4	Parameter stop_c bound to: 18'b000000000010000000 

E
%s*synth26
4	Parameter stop_d bound to: 18'b000000000100000000 

C
%s*synth24
2	Parameter rd_a bound to: 18'b000000001000000000 

C
%s*synth24
2	Parameter rd_b bound to: 18'b000000010000000000 

C
%s*synth24
2	Parameter rd_c bound to: 18'b000000100000000000 

C
%s*synth24
2	Parameter rd_d bound to: 18'b000001000000000000 

C
%s*synth24
2	Parameter wr_a bound to: 18'b000010000000000000 

C
%s*synth24
2	Parameter wr_b bound to: 18'b000100000000000000 

C
%s*synth24
2	Parameter wr_c bound to: 18'b001000000000000000 

C
%s*synth24
2	Parameter wr_d bound to: 18'b010000000000000000 

‹
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4068@Z8-3536
ÿ
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
	full_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4068@Z8-3536
‹
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4108@Z8-3536
ÿ
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
	full_case2d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
4108@Z8-3536
—
%done synthesizing module '%s' (%s#%s)256*oasys2
i2c_master_bit_ctrl2
22
162d
`C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_bit_ctrl.v2
1438@Z8-256
›
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
2328@Z8-3536
Ÿ
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
	full_case2e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
2328@Z8-3536
“
%done synthesizing module '%s' (%s#%s)256*oasys2
i2c_master_byte_ctrl2
32
162e
aC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_byte_ctrl.v2
758@Z8-256
◊
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
1648@Z8-3536
◊
?HDL ADVISOR - Pragma %s detected. Simulation mismatch may occur3412*oasys2
parallel_case2_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
1928@Z8-3536
∆
%done synthesizing module '%s' (%s#%s)256*oasys2
i2c_master_top2
42
162_
[C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/i2c/i2c_master_top.v2
788@Z8-256
∞
-case statement is not full and has no default155*oasys2]
YC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/i2c_config.sv2
3488@Z8-155
¿
%done synthesizing module '%s' (%s#%s)256*oasys2

i2c_config2
52
162]
YC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/i2c_config.sv2
318@Z8-256
û
synthesizing module '%s'638*oasys2
video2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
148@Z8-638
°
synthesizing module '%s'638*oasys2	
counter2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-638
A
%s*synth22
0	Parameter WIDTH bound to: 841 - type: integer 

π
%done synthesizing module '%s' (%s#%s)256*oasys2	
counter2
62
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-256
±
synthesizing module '%s'638*oasys2
counter__parameterized02X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-638
A
%s*synth22
0	Parameter WIDTH bound to: 516 - type: integer 

…
%done synthesizing module '%s' (%s#%s)256*oasys2
counter__parameterized02
62
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1408@Z8-256
¢
synthesizing module '%s'638*oasys2

register2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1568@Z8-638
@
%s*synth21
/	Parameter WIDTH bound to: 36 - type: integer 

∫
%done synthesizing module '%s' (%s#%s)256*oasys2

register2
72
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1568@Z8-256
¢
synthesizing module '%s'638*oasys2
	video_fsm2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
698@Z8-638
´
-case statement is not full and has no default155*oasys2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1028@Z8-155
∫
%done synthesizing module '%s' (%s#%s)256*oasys2
	video_fsm2
82
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
698@Z8-256
•
synthesizing module '%s'638*oasys2
pixel_clock2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1738@Z8-638
Ω
%done synthesizing module '%s' (%s#%s)256*oasys2
pixel_clock2
92
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
1738@Z8-256
∑
%done synthesizing module '%s' (%s#%s)256*oasys2
video2
102
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/video.sv2
148@Z8-256
û
synthesizing module '%s'638*oasys2
spdif2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
258@Z8-638
@
%s*synth21
/	Parameter PREAMBLE_B_0 bound to: 8'b11101000 

@
%s*synth21
/	Parameter PREAMBLE_B_1 bound to: 8'b00010111 

@
%s*synth21
/	Parameter PREAMBLE_M_0 bound to: 8'b11100010 

@
%s*synth21
/	Parameter PREAMBLE_M_1 bound to: 8'b00011101 

@
%s*synth21
/	Parameter PREAMBLE_W_0 bound to: 8'b11100100 

@
%s*synth21
/	Parameter PREAMBLE_W_1 bound to: 8'b00011011 

ù
synthesizing module '%s'638*oasys2
bmc2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
1978@Z8-638
∂
%done synthesizing module '%s' (%s#%s)256*oasys2
bmc2
112
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
1978@Z8-256
⁄
.merging register '%s' into '%s' in module '%s'3423*oasys2
clr_capture_reg2
preamble_reg2
spdif2X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
1068@Z8-3845
∑
%done synthesizing module '%s' (%s#%s)256*oasys2
spdif2
122
162X
TC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/spdif.sv2
258@Z8-256
µ
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi2
132
162W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/hdmi.sv2
238@Z8-256
®
synthesizing module '%s'638*oasys2
hdmi_test_feeder2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
248@Z8-638
®
synthesizing module '%s'638*oasys2
hdmi_test_sender2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
618@Z8-638
D
%s*synth25
3	Parameter ADDR_SIZE bound to: 19 - type: integer 

©
-case statement is not full and has no default155*oasys2W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
988@Z8-155
¡
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi_test_sender2
142
162W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
618@Z8-256
¡
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi_test_feeder2
152
162W
SC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/feed.sv2
248@Z8-256
º
%done synthesizing module '%s' (%s#%s)256*oasys2

top_test2
162
162[
WC:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.srcs/sources_1/imports/hdmi/top_test.sv2
68@Z8-256
s
%s*synth2d
bfinished synthesize : Time (s): elapsed = 00:02:49 . Memory (MB): peak = 974.641 ; gain = 825.105



*common
]
Q---------------------------------------------------------------------------------*common


*common
6
*Applying 'set_property' XDC Constraints...*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
ë
%s*synth2Å
Finished applying 'set_property' XDC Constraints : Time (s): elapsed = 00:02:49 . Memory (MB): peak = 974.641 ; gain = 825.105

]
Q---------------------------------------------------------------------------------*common


*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
/
#Loading Part and Timing Information*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
,
 Loading part: xc7vx485tffg1761-2*common


*common
}
%s*synth2n
lPart Resources:
DSPs: 2800 (col length:140)
BRAMs: 2060 (col length: RAMB8 0 RAMB16 0 RAMB18 140 RAMB36 70)

]
Q---------------------------------------------------------------------------------*common


*common
å
%s*synth2}
{Finished Loading Part and Timing Information : Time (s): elapsed = 00:03:04 . Memory (MB): peak = 974.641 ; gain = 825.105

]
Q---------------------------------------------------------------------------------*common


*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
%
RTL Component Statistics *common


*common
]
Q---------------------------------------------------------------------------------*common


*common
0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input     32 Bit       Adders := 1     

?
%s*synth20
.	   2 Input     19 Bit       Adders := 2     

?
%s*synth20
.	   2 Input     16 Bit       Adders := 1     

?
%s*synth20
.	   2 Input     14 Bit       Adders := 1     

?
%s*synth20
.	   2 Input     11 Bit       Adders := 2     

?
%s*synth20
.	   2 Input      9 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      6 Bit       Adders := 4     

?
%s*synth20
.	   2 Input      5 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      3 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      2 Bit       Adders := 2     


%s*synth2
+---XORs : 

?
%s*synth20
.	   2 Input      1 Bit         XORs := 1     


%s*synth2
+---XORs : 

?
%s*synth20
.	               16 Bit    Wide XORs := 1     

"
%s*synth2
+---Registers : 

?
%s*synth20
.	               36 Bit    Registers := 2     

?
%s*synth20
.	               32 Bit    Registers := 3     

?
%s*synth20
.	               19 Bit    Registers := 2     

?
%s*synth20
.	               18 Bit    Registers := 1     

?
%s*synth20
.	               16 Bit    Registers := 3     

?
%s*synth20
.	               14 Bit    Registers := 1     

?
%s*synth20
.	               11 Bit    Registers := 2     

?
%s*synth20
.	                9 Bit    Registers := 1     

?
%s*synth20
.	                8 Bit    Registers := 7     

?
%s*synth20
.	                6 Bit    Registers := 5     

?
%s*synth20
.	                5 Bit    Registers := 1     

?
%s*synth20
.	                4 Bit    Registers := 1     

?
%s*synth20
.	                3 Bit    Registers := 5     

?
%s*synth20
.	                2 Bit    Registers := 5     

?
%s*synth20
.	                1 Bit    Registers := 42    


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input     36 Bit        Muxes := 1     

?
%s*synth20
.	   3 Input     32 Bit        Muxes := 2     

?
%s*synth20
.	  19 Input     18 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input     16 Bit        Muxes := 3     

A
%s*synth22
0	500001 Input     16 Bit        Muxes := 1     

?
%s*synth20
.	   5 Input     16 Bit        Muxes := 2     

?
%s*synth20
.	   2 Input     14 Bit        Muxes := 1     

?
%s*synth20
.	   5 Input     14 Bit        Muxes := 1     

?
%s*synth20
.	   8 Input      8 Bit        Muxes := 1     

?
%s*synth20
.	  63 Input      8 Bit        Muxes := 3     

?
%s*synth20
.	   2 Input      8 Bit        Muxes := 9     

?
%s*synth20
.	   4 Input      8 Bit        Muxes := 1     

?
%s*synth20
.	  63 Input      6 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      6 Bit        Muxes := 6     

?
%s*synth20
.	   2 Input      5 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      4 Bit        Muxes := 5     

?
%s*synth20
.	   7 Input      4 Bit        Muxes := 1     

?
%s*synth20
.	   4 Input      3 Bit        Muxes := 1     

?
%s*synth20
.	   7 Input      3 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      3 Bit        Muxes := 10    

?
%s*synth20
.	  63 Input      3 Bit        Muxes := 1     

?
%s*synth20
.	   5 Input      2 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      2 Bit        Muxes := 2     

?
%s*synth20
.	  63 Input      1 Bit        Muxes := 7     

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 56    

?
%s*synth20
.	  19 Input      1 Bit        Muxes := 5     

?
%s*synth20
.	   3 Input      1 Bit        Muxes := 11    

?
%s*synth20
.	   4 Input      1 Bit        Muxes := 3     

?
%s*synth20
.	   7 Input      1 Bit        Muxes := 6     

?
%s*synth20
.	   5 Input      1 Bit        Muxes := 2     



*common
]
Q---------------------------------------------------------------------------------*common


*common
.
"Finished RTL Component Statistics *common


*common
]
Q---------------------------------------------------------------------------------*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
-
!Start Cross Boundary Optimization*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[1] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[2] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[3] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[4] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[5] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[6] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[7] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[8] 2

counter__5Z8-3332
Ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[9] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[10] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[11] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[12] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[13] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[14] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[15] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[16] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[17] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[18] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[19] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[20] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[21] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[22] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[23] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[24] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[25] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[26] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[27] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[28] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[29] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[30] 2

counter__5Z8-3332
Ö
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\clk_counter_reg[31] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[0] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[1] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[2] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[3] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[4] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[5] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[6] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[7] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[8] 2

counter__6Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[9] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[10] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[11] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[12] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[13] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[14] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[15] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[16] 2

counter__6Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[17] 2

counter__6Z8-3332
Ø
ÅMessage '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
50Z17-14
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[18] 2

counter__6Z8-3332
]
Q---------------------------------------------------------------------------------*common


*common
Ñ
%s*synth2u
sFinished Cross Boundary Optimization : Time (s): elapsed = 00:03:05 . Memory (MB): peak = 974.641 ; gain = 825.105

]
Q---------------------------------------------------------------------------------*common


*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
#
Start Area Optimization*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
ß
6propagating constant %s across sequential element (%s)3333*oasys2
02Q
Oi_0/\hdmi0/i2c_config0/i2c_core/byte_controller/bit_controller/c_state_reg[17] Z8-3333
Ä
6propagating constant %s across sequential element (%s)3333*oasys2
02*
(i_0/\hdmi0/video0/fsm/curr_state_reg[1] Z8-3333
~
6propagating constant %s across sequential element (%s)3333*oasys2
02(
&feeder0i_2/\audio_sender/state_reg[1] Z8-3333
~
6propagating constant %s across sequential element (%s)3333*oasys2
02(
&feeder0i_2/\video_sender/state_reg[1] Z8-3333
]
Q---------------------------------------------------------------------------------*common


*common
{
%s*synth2l
jFinished Area Optimization : Time (s): elapsed = 00:03:51 . Memory (MB): peak = 1024.508 ; gain = 874.973

]
Q---------------------------------------------------------------------------------*common


*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
%
Start Timing Optimization*common


*common
]
Q---------------------------------------------------------------------------------*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
+
Applying XDC Timing Constraints*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
â
%s*synth2z
xFinished Applying XDC Timing Constraints : Time (s): elapsed = 00:03:53 . Memory (MB): peak = 1024.508 ; gain = 874.973

]
Q---------------------------------------------------------------------------------*common


*common


*common
?
%s*synth20
.info: start optimizing sub-critical range ...

;
%s*synth2,
*info: done optimizing sub-critical range.

]
Q---------------------------------------------------------------------------------*common


*common
}
%s*synth2n
lFinished Timing Optimization : Time (s): elapsed = 00:03:56 . Memory (MB): peak = 1024.508 ; gain = 874.973

]
Q---------------------------------------------------------------------------------*common


*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
$
Start Technology Mapping*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
|
%s*synth2m
kFinished Technology Mapping : Time (s): elapsed = 00:04:25 . Memory (MB): peak = 1024.508 ; gain = 874.973

]
Q---------------------------------------------------------------------------------*common


*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common

Start IO Insertion*common


*common
]
Q---------------------------------------------------------------------------------*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
0
$Start Flattening Before IO Insertion*common


*common
]
Q---------------------------------------------------------------------------------*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
3
'Finished Flattening Before IO Insertion*common


*common
]
Q---------------------------------------------------------------------------------*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
!
Final Netlist Cleanup*common


*common
]
Q---------------------------------------------------------------------------------*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
*
Finished Final Netlist Cleanup*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
v
%s*synth2g
eFinished IO Insertion : Time (s): elapsed = 00:04:33 . Memory (MB): peak = 1024.508 ; gain = 874.973

]
Q---------------------------------------------------------------------------------*common


*common


*common
(
%s*synth2
Report Check Netlist: 

R
%s*synth2C
A-----+-----------------+------+--------+------+-----------------

R
%s*synth2C
A     |Item             |Errors|Warnings|Status|Description      

R
%s*synth2C
A-----+-----------------+------+--------+------+-----------------

R
%s*synth2C
A1    |multi_driven_nets|     0|       0|Passed|Multi driven nets

R
%s*synth2C
A-----+-----------------+------+--------+------+-----------------



*common
]
Q---------------------------------------------------------------------------------*common


*common
.
"Start renaming generated instances*common


*common
]
Q---------------------------------------------------------------------------------*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
%
Rebuilding User Hierarchy*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
É
%s*synth2t
rFinished Rebuilding User Hierarchy : Time (s): elapsed = 00:05:07 . Memory (MB): peak = 1024.508 ; gain = 874.973

]
Q---------------------------------------------------------------------------------*common


*common


*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
$
Writing Synthesis Report*common


*common
]
Q---------------------------------------------------------------------------------*common


*common
%
%s*synth2
Report BlackBoxes: 

/
%s*synth2 
-----+-------------+---------

/
%s*synth2 
     |BlackBox name|Instances

/
%s*synth2 
-----+-------------+---------

/
%s*synth2 
-----+-------------+---------

%
%s*synth2
Report Cell Usage: 

$
%s*synth2
-----+------+-----

$
%s*synth2
     |Cell  |Count

$
%s*synth2
-----+------+-----

$
%s*synth2
1    |BUFG  |    2

$
%s*synth2
2    |CARRY4|   14

$
%s*synth2
3    |INV   |    2

$
%s*synth2
4    |LUT1  |   45

$
%s*synth2
5    |LUT2  |   60

$
%s*synth2
6    |LUT3  |  114

$
%s*synth2
7    |LUT4  |  283

$
%s*synth2
8    |LUT5  | 1564

$
%s*synth2
9    |LUT6  |76668

$
%s*synth2
10   |MUXF7 | 7761

$
%s*synth2
11   |MUXF8 | 2904

$
%s*synth2
12   |XORCY |    1

$
%s*synth2
13   |FD    |   11

$
%s*synth2
14   |FDC   |   74

$
%s*synth2
15   |FDCE  |  582

$
%s*synth2
16   |FDP   |   25

$
%s*synth2
17   |FDPE  |    8

$
%s*synth2
18   |IBUF  |    2

$
%s*synth2
19   |IBUFDS|    1

$
%s*synth2
20   |IOBUF |    2

$
%s*synth2
21   |OBUF  |   50

$
%s*synth2
-----+------+-----

)
%s*synth2
Report Instance Areas: 

N
%s*synth2?
=-----+------------------------+-----------------------+-----

N
%s*synth2?
=     |Instance                |Module                 |Cells

N
%s*synth2?
=-----+------------------------+-----------------------+-----

N
%s*synth2?
=1    |top                     |                       |90173

N
%s*synth2?
=2    |  hdmi0                 |hdmi                   |  758

N
%s*synth2?
=3    |    i2c_config0         |i2c_config             |  519

N
%s*synth2?
=4    |      i2c_core          |i2c_master_top         |  411

N
%s*synth2?
=5    |        byte_controller |i2c_master_byte_ctrl   |  293

N
%s*synth2?
=6    |          bit_controller|i2c_master_bit_ctrl    |  189

N
%s*synth2?
=7    |    spdif0              |spdif                  |  162

N
%s*synth2?
=8    |      bmc0              |bmc                    |    5

N
%s*synth2?
=9    |    video0              |video                  |   77

N
%s*synth2?
=10   |      fsm               |video_fsm              |    3

N
%s*synth2?
=11   |      pixel_clk         |pixel_clock            |    6

N
%s*synth2?
=12   |      h_count           |counter                |   28

N
%s*synth2?
=13   |      v_count           |counter__parameterized0|   26

N
%s*synth2?
=14   |  feeder0               |hdmi_test_feeder       |89354

N
%s*synth2?
=15   |    video_sender        |hdmi_test_sender       |    2

N
%s*synth2?
=16   |    audio_sender        |hdmi_test_sender_0     |28808

N
%s*synth2?
=-----+------------------------+-----------------------+-----

]
Q---------------------------------------------------------------------------------*common


*common
Ç
%s*synth2s
qFinished Writing Synthesis Report : Time (s): elapsed = 00:05:07 . Memory (MB): peak = 1024.508 ; gain = 874.973

]
Q---------------------------------------------------------------------------------*common


*common


*common
ü
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2#
!Synthesis Optimization Complete: 2

00:05:062

1024.5082	
831.965Z17-269
L
-Analyzing %s Unisim elements for replacement
17*netlist2
112Z29-17
O
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28
Æ
!Unisim Transformation Summary:
%s111*project2Ò
Ó  A total of 115 instances were transformed.
  (MUXCY,XORCY) => CARRY4: 1 instances
  FD => FDCE: 11 instances
  FDC => FDCE: 74 instances
  FDP => FDPE: 25 instances
  INV => LUT1: 2 instances
  IOBUF => IOBUF (OBUFT, IBUF): 2 instances
Z1-111
1
%Phase 0 | Netlist Checksum: 35ae1bd5
*common
:
Releasing license: %s
83*common2
	SynthesisZ17-83
å
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
synth_design: 2

00:05:372

1024.5082	
831.965Z17-269
Ç
vreport_utilization: Time (s): elapsed = 00:00:00.200º[‹¡Ë¨Ë¨@XÓxë5 . Memory (MB): peak = 1024.508 ; gain = 0.000
*common
S
Exiting %s at %s...
206*common2
Vivado2
Thu Oct 03 17:15:34 2013Z17-206