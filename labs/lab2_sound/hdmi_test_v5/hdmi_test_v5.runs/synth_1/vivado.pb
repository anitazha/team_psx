
I
 Attempting to get a license: %s
78*common2
ImplementationZ17-78
?
Feature available: %s
81*common2
ImplementationZ17-81
D
 Attempting to get a license: %s
78*common2
	SynthesisZ17-78
:
Feature available: %s
81*common2
	SynthesisZ17-81
s
+Loading parts and site information from %s
36*device2/
-/opt/Xilinx/Vivado/2013.2/data/parts/arch.xmlZ21-36
Ä
!Parsing RTL primitives file [%s]
14*netlist2E
C/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/rtl/prims/rtl_prims.xmlZ29-14
â
*Finished parsing RTL primitives file [%s]
11*netlist2E
C/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/rtl/prims/rtl_prims.xmlZ29-11
n
$Using Tcl App repository from '%s'.
323*common2/
-/opt/Xilinx/Vivado/2013.2/data/XilinxTclStoreZ17-362
n
)Updating Tcl app persistent manifest '%s'325*common2*
(/root/.Xilinx/Vivado/tclapp/manifest.tclZ17-364
]
Command: %s
53*	vivadotcl25
3synth_design -top top_test -part xc7vx485tffg1761-2Z4-113
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
™
assignment to input %s1630*oasys2
RESET2d
`/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/top_test.sv2
338@Z8-1630
à
%s*synth2y
wstarting Rtl Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 188.785 ; gain = 72.312

¨
synthesizing module '%s'638*oasys2

top_test2d
`/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/top_test.sv2
68@Z8-638
Ñ
synthesizing module '%s'638*oasys2
IBUFDS2;
7/opt/Xilinx/Vivado/2013.2/scripts/rt/data/unisim_comp.v2
60748@Z8-638
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
ú
%done synthesizing module '%s' (%s#%s)256*oasys2
IBUFDS2
12
152;
7/opt/Xilinx/Vivado/2013.2/scripts/rt/data/unisim_comp.v2
60748@Z8-256
•
synthesizing module '%s'638*oasys2
hdmi2`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/hdmi.sv2
238@Z8-638
±
synthesizing module '%s'638*oasys2

iic_config2f
b/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/iic_config.sv2
338@Z8-638
H
%s*synth29
7	Parameter CLK_RATE_MHZ bound to: 200 - type: integer 

H
%s*synth29
7	Parameter SCK_PERIOD_US bound to: 30 - type: integer 

M
%s*synth2>
<	Parameter TRANSITION_CYCLE bound to: 3000 - type: integer 

O
%s*synth2@
>	Parameter TRANSITION_CYCLE_MSB bound to: 11 - type: integer 

>
%s*synth2/
-	Parameter SWITCH_ADDR bound to: 7'b1110100 

?
%s*synth20
.	Parameter SWITCH_DATA bound to: 8'b00100000 

=
%s*synth2.
,	Parameter SLAVE_ADDR bound to: 7'b0111001 

6
%s*synth2'
%	Parameter START_BIT bound to: 1'b1 

0
%s*synth2!
	Parameter ACK bound to: 1'b1 

2
%s*synth2#
!	Parameter WRITE bound to: 1'b0 

5
%s*synth2&
$	Parameter STOP_BIT bound to: 1'b0 

I
%s*synth2:
8	Parameter SDA_BUFFER_MSB bound to: 27 - type: integer 

H
%s*synth29
7	Parameter SDA_BUFFER_SW bound to: 18 - type: integer 

;
%s*synth2,
*	Parameter ADDR_00 bound to: 8'b01000001 

;
%s*synth2,
*	Parameter ADDR_01 bound to: 8'b00001011 

;
%s*synth2,
*	Parameter ADDR_02 bound to: 8'b00010100 

;
%s*synth2,
*	Parameter ADDR_03 bound to: 8'b00010101 

;
%s*synth2,
*	Parameter ADDR_04 bound to: 8'b00010110 

;
%s*synth2,
*	Parameter ADDR_05 bound to: 8'b00010111 

;
%s*synth2,
*	Parameter ADDR_06 bound to: 8'b00111100 

;
%s*synth2,
*	Parameter ADDR_07 bound to: 8'b00001010 

;
%s*synth2,
*	Parameter ADDR_08 bound to: 8'b01010101 

;
%s*synth2,
*	Parameter ADDR_09 bound to: 8'b01110011 

;
%s*synth2,
*	Parameter ADDR_10 bound to: 8'b10011101 

;
%s*synth2,
*	Parameter ADDR_11 bound to: 8'b10101111 

;
%s*synth2,
*	Parameter ADDR_12 bound to: 8'b11010111 

;
%s*synth2,
*	Parameter ADDR_13 bound to: 8'b11011000 

;
%s*synth2,
*	Parameter ADDR_14 bound to: 8'b11011001 

;
%s*synth2,
*	Parameter ADDR_15 bound to: 8'b11011010 

;
%s*synth2,
*	Parameter ADDR_16 bound to: 8'b11011011 

;
%s*synth2,
*	Parameter ADDR_17 bound to: 8'b11111001 

;
%s*synth2,
*	Parameter DATA_00 bound to: 8'b00010000 

;
%s*synth2,
*	Parameter DATA_01 bound to: 8'b11000111 

;
%s*synth2,
*	Parameter DATA_02 bound to: 8'b00000010 

;
%s*synth2,
*	Parameter DATA_03 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_04 bound to: 8'b00110010 

;
%s*synth2,
*	Parameter DATA_05 bound to: 8'b01100000 

;
%s*synth2,
*	Parameter DATA_06 bound to: 8'b00000010 

;
%s*synth2,
*	Parameter DATA_07 bound to: 8'b00010000 

;
%s*synth2,
*	Parameter DATA_08 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_09 bound to: 8'b00000001 

;
%s*synth2,
*	Parameter DATA_10 bound to: 8'b01100000 

;
%s*synth2,
*	Parameter DATA_11 bound to: 8'b00000110 

;
%s*synth2,
*	Parameter DATA_12 bound to: 8'b00000100 

;
%s*synth2,
*	Parameter DATA_13 bound to: 8'b00000011 

;
%s*synth2,
*	Parameter DATA_14 bound to: 8'b11100000 

;
%s*synth2,
*	Parameter DATA_15 bound to: 8'b00100100 

;
%s*synth2,
*	Parameter DATA_16 bound to: 8'b00000110 

;
%s*synth2,
*	Parameter DATA_17 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter ADDR_18 bound to: 8'b00111011 

;
%s*synth2,
*	Parameter ADDR_19 bound to: 8'b01000100 

;
%s*synth2,
*	Parameter ADDR_20 bound to: 8'b01001000 

;
%s*synth2,
*	Parameter ADDR_21 bound to: 8'b10010100 

;
%s*synth2,
*	Parameter ADDR_22 bound to: 8'b10010110 

;
%s*synth2,
*	Parameter ADDR_23 bound to: 8'b10011000 

;
%s*synth2,
*	Parameter ADDR_24 bound to: 8'b10011001 

;
%s*synth2,
*	Parameter ADDR_25 bound to: 8'b10011010 

;
%s*synth2,
*	Parameter ADDR_26 bound to: 8'b10011011 

;
%s*synth2,
*	Parameter ADDR_27 bound to: 8'b10011100 

;
%s*synth2,
*	Parameter ADDR_28 bound to: 8'b10011111 

;
%s*synth2,
*	Parameter ADDR_29 bound to: 8'b10100001 

;
%s*synth2,
*	Parameter ADDR_30 bound to: 8'b10100010 

;
%s*synth2,
*	Parameter ADDR_31 bound to: 8'b10100011 

;
%s*synth2,
*	Parameter ADDR_32 bound to: 8'b10100100 

;
%s*synth2,
*	Parameter ADDR_33 bound to: 8'b10100101 

;
%s*synth2,
*	Parameter ADDR_34 bound to: 8'b10100110 

;
%s*synth2,
*	Parameter ADDR_35 bound to: 8'b10100111 

;
%s*synth2,
*	Parameter ADDR_36 bound to: 8'b10101000 

;
%s*synth2,
*	Parameter ADDR_37 bound to: 8'b10101001 

;
%s*synth2,
*	Parameter ADDR_38 bound to: 8'b10101010 

;
%s*synth2,
*	Parameter ADDR_39 bound to: 8'b10101011 

;
%s*synth2,
*	Parameter ADDR_40 bound to: 8'b10111001 

;
%s*synth2,
*	Parameter ADDR_41 bound to: 8'b10111010 

;
%s*synth2,
*	Parameter ADDR_42 bound to: 8'b10111011 

;
%s*synth2,
*	Parameter ADDR_43 bound to: 8'b11000111 

;
%s*synth2,
*	Parameter ADDR_44 bound to: 8'b11001101 

;
%s*synth2,
*	Parameter ADDR_45 bound to: 8'b11001110 

;
%s*synth2,
*	Parameter ADDR_46 bound to: 8'b11001111 

;
%s*synth2,
*	Parameter ADDR_47 bound to: 8'b11010000 

;
%s*synth2,
*	Parameter ADDR_48 bound to: 8'b11010001 

;
%s*synth2,
*	Parameter ADDR_49 bound to: 8'b11010010 

;
%s*synth2,
*	Parameter ADDR_50 bound to: 8'b11010011 

;
%s*synth2,
*	Parameter ADDR_51 bound to: 8'b11010100 

;
%s*synth2,
*	Parameter ADDR_52 bound to: 8'b11010101 

;
%s*synth2,
*	Parameter ADDR_53 bound to: 8'b11010110 

;
%s*synth2,
*	Parameter ADDR_54 bound to: 8'b11011100 

;
%s*synth2,
*	Parameter ADDR_55 bound to: 8'b11011101 

;
%s*synth2,
*	Parameter ADDR_56 bound to: 8'b11011110 

;
%s*synth2,
*	Parameter ADDR_57 bound to: 8'b11011111 

;
%s*synth2,
*	Parameter ADDR_58 bound to: 8'b11100000 

;
%s*synth2,
*	Parameter ADDR_59 bound to: 8'b11100010 

;
%s*synth2,
*	Parameter ADDR_60 bound to: 8'b11100011 

;
%s*synth2,
*	Parameter ADDR_61 bound to: 8'b11100100 

;
%s*synth2,
*	Parameter ADDR_62 bound to: 8'b11111010 

;
%s*synth2,
*	Parameter DATA_18 bound to: 8'b11100000 

;
%s*synth2,
*	Parameter DATA_19 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_20 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_21 bound to: 8'b11000000 

;
%s*synth2,
*	Parameter DATA_22 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_23 bound to: 8'b00000011 

;
%s*synth2,
*	Parameter DATA_24 bound to: 8'b00000010 

;
%s*synth2,
*	Parameter DATA_25 bound to: 8'b11100000 

;
%s*synth2,
*	Parameter DATA_26 bound to: 8'b00011000 

;
%s*synth2,
*	Parameter DATA_27 bound to: 8'b00110000 

;
%s*synth2,
*	Parameter DATA_28 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_29 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_30 bound to: 8'b10100100 

;
%s*synth2,
*	Parameter DATA_31 bound to: 8'b10100100 

;
%s*synth2,
*	Parameter DATA_32 bound to: 8'b00001000 

;
%s*synth2,
*	Parameter DATA_33 bound to: 8'b00000100 

;
%s*synth2,
*	Parameter DATA_34 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_35 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_36 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_37 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_38 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_39 bound to: 8'b01000000 

;
%s*synth2,
*	Parameter DATA_40 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_41 bound to: 8'b00010000 

;
%s*synth2,
*	Parameter DATA_42 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_43 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_44 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_45 bound to: 8'b00000001 

;
%s*synth2,
*	Parameter DATA_46 bound to: 8'b00000100 

;
%s*synth2,
*	Parameter DATA_47 bound to: 8'b00111100 

;
%s*synth2,
*	Parameter DATA_48 bound to: 8'b11111111 

;
%s*synth2,
*	Parameter DATA_49 bound to: 8'b10000000 

;
%s*synth2,
*	Parameter DATA_50 bound to: 8'b10000000 

;
%s*synth2,
*	Parameter DATA_51 bound to: 8'b10000000 

;
%s*synth2,
*	Parameter DATA_52 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_53 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_54 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_55 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_56 bound to: 8'b00010000 

;
%s*synth2,
*	Parameter DATA_57 bound to: 8'b00000001 

;
%s*synth2,
*	Parameter DATA_58 bound to: 8'b00111100 

;
%s*synth2,
*	Parameter DATA_59 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_60 bound to: 8'b00000000 

;
%s*synth2,
*	Parameter DATA_61 bound to: 8'b01100000 

;
%s*synth2,
*	Parameter DATA_62 bound to: 8'b00000000 

ß
default block is never used226*oasys2f
b/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/iic_config.sv2
4528@Z8-226
Õ
2unable to generate logic for unpartitioned %s node2943*oasys2
	construct2f
b/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/iic_config.sv2
2108@Z8-2943
Õ
2unable to generate logic for unpartitioned %s node2943*oasys2
	construct2f
b/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/iic_config.sv2
2218@Z8-2943
…
%done synthesizing module '%s' (%s#%s)256*oasys2

iic_config2
22
152f
b/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/iic_config.sv2
338@Z8-256
¶
synthesizing module '%s'638*oasys2
video2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
18@Z8-638
™
synthesizing module '%s'638*oasys2	
counter2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-638
A
%s*synth22
0	Parameter WIDTH bound to: 121 - type: integer 

¬
%done synthesizing module '%s' (%s#%s)256*oasys2	
counter2
32
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-256
∫
synthesizing module '%s'638*oasys2
counter__parameterized02a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-638
@
%s*synth21
/	Parameter WIDTH bound to: 36 - type: integer 

“
%done synthesizing module '%s' (%s#%s)256*oasys2
counter__parameterized02
32
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-256
∫
synthesizing module '%s'638*oasys2
counter__parameterized12a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-638
A
%s*synth22
0	Parameter WIDTH bound to: 720 - type: integer 

“
%done synthesizing module '%s' (%s#%s)256*oasys2
counter__parameterized12
32
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-256
∫
synthesizing module '%s'638*oasys2
counter__parameterized22a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-638
A
%s*synth22
0	Parameter WIDTH bound to: 480 - type: integer 

“
%done synthesizing module '%s' (%s#%s)256*oasys2
counter__parameterized22
32
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1918@Z8-256
´
synthesizing module '%s'638*oasys2

register2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
2318@Z8-638
@
%s*synth21
/	Parameter WIDTH bound to: 36 - type: integer 

√
%done synthesizing module '%s' (%s#%s)256*oasys2

register2
42
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
2318@Z8-256
Œ
Fall outputs are unconnected for this instance and logic may be removed3605*oasys2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
428@Z8-4446
´
synthesizing module '%s'638*oasys2
	video_fsm2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
668@Z8-638
¥
-case statement is not full and has no default155*oasys2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
1588@Z8-155
√
%done synthesizing module '%s' (%s#%s)256*oasys2
	video_fsm2
52
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
668@Z8-256
Æ
synthesizing module '%s'638*oasys2
pixel_clock2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
2098@Z8-638
∆
%done synthesizing module '%s' (%s#%s)256*oasys2
pixel_clock2
62
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
2098@Z8-256
æ
%done synthesizing module '%s' (%s#%s)256*oasys2
video2
72
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/video.sv2
18@Z8-256
ß
synthesizing module '%s'638*oasys2
spdif2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/spdif.sv2
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
œ
Fall outputs are unconnected for this instance and logic may be removed3605*oasys2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/spdif.sv2
1828@Z8-4446
¶
synthesizing module '%s'638*oasys2
bmc2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/spdif.sv2
1968@Z8-638
æ
%done synthesizing module '%s' (%s#%s)256*oasys2
bmc2
82
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/spdif.sv2
1968@Z8-256
ø
%done synthesizing module '%s' (%s#%s)256*oasys2
spdif2
92
152a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/spdif.sv2
258@Z8-256
æ
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi2
102
152`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/hdmi.sv2
238@Z8-256
±
synthesizing module '%s'638*oasys2
hdmi_test_feeder2`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/feed.sv2
248@Z8-638
±
synthesizing module '%s'638*oasys2
hdmi_test_sender2`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/feed.sv2
618@Z8-638
D
%s*synth25
3	Parameter ADDR_SIZE bound to: 19 - type: integer 

≤
-case statement is not full and has no default155*oasys2`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/feed.sv2
988@Z8-155
 
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi_test_sender2
112
152`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/feed.sv2
618@Z8-256
ƒ
,$readmem data file '%s' is read successfully3426*oasys2
audio_mem.hex2`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/feed.sv2
498@Z8-3876
 
%done synthesizing module '%s' (%s#%s)256*oasys2
hdmi_test_feeder2
122
152`
\/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/feed.sv2
248@Z8-256
—
Fall outputs are unconnected for this instance and logic may be removed3605*oasys2d
`/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/top_test.sv2
828@Z8-4446
µ
synthesizing module '%s'638*oasys2
	hdmi_icon2k
g/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/chipscope_1/hdmi_icon.v2
218@Z8-638
Œ
%done synthesizing module '%s' (%s#%s)256*oasys2
	hdmi_icon2
132
152k
g/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/chipscope_1/hdmi_icon.v2
218@Z8-256
—
Fall outputs are unconnected for this instance and logic may be removed3605*oasys2d
`/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/top_test.sv2
848@Z8-4446
Ω
synthesizing module '%s'638*oasys2
chipscope_ila2o
k/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/chipscope_1/chipscope_ila.v2
218@Z8-638
÷
%done synthesizing module '%s' (%s#%s)256*oasys2
chipscope_ila2
142
152o
k/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/chipscope_1/chipscope_ila.v2
218@Z8-256
\
0Net %s in module/entity %s does not have driver.3422*oasys2
rst2

top_testZ8-3848
f
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_data[9:8]2

top_testZ8-3848
h
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_data[49:46]2

top_testZ8-3848
i
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_data[127:54]2

top_testZ8-3848
f
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_trig[9:8]2

top_testZ8-3848
h
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_trig[49:46]2

top_testZ8-3848
h
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_trig[63:54]2

top_testZ8-3848
≈
%done synthesizing module '%s' (%s#%s)256*oasys2

top_test2
152
152d
`/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/top_test.sv2
68@Z8-256
â
%s*synth2z
xfinished Rtl Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 508.551 ; gain = 392.078

á
%s*synth2x
vStart RTL Optimization : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 508.551 ; gain = 392.078
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
J
-Analyzing %s Unisim elements for replacement
17*netlist2
1Z29-17
O
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28
é
Loading clock regions from %s
13*device2W
U/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/virtex7/virtex7/xc7vx485t/ClockRegion.xmlZ21-13
è
Loading clock buffers from %s
11*device2X
V/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/virtex7/virtex7/xc7vx485t/ClockBuffers.xmlZ21-11
ä
&Loading clock placement rules from %s
318*place2J
H/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/virtex7/ClockPlacerRules.xmlZ30-318
à
)Loading package pin functions from %s...
17*device2F
D/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/virtex7/PinFunctions.xmlZ21-17
å
Loading package from %s
16*device2[
Y/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/virtex7/virtex7/xc7vx485t/ffg1761/Package.xmlZ21-16
}
Loading io standards from %s
15*device2G
E/opt/Xilinx/Vivado/2013.2/data/./parts/xilinx/virtex7/IOStandards.xmlZ21-15
â
+Loading device configuration modes from %s
14*device2E
C/opt/Xilinx/Vivado/2013.2/data/parts/xilinx/virtex7/ConfigModes.xmlZ21-14
M
 Attempting to get a license: %s
78*common2
Internal_bitstreamZ17-78
K
Failed to get a license: %s
295*common2
Internal_bitstreamZ17-301
5

Processing XDC Constraints
244*projectZ1-262
<
%Done setting XDC timing constraints.
35*timingZ38-35
ê
Parsing XDC File [%s]
179*designutils2Z
X/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/constrs_1/new/top_test.xdcZ20-179
ô
Finished Parsing XDC File [%s]
178*designutils2Z
X/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/constrs_1/new/top_test.xdcZ20-178
Õ
◊One or more synthesis constraints were not read correctly while reading constraint file [%s]. These constraints will be passed to synthesis. Check the synthesis log file to verify that they were applied correctly.  241*project2Z
X/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/constrs_1/new/top_test.xdcZ1-258
?
&Completed Processing XDC Constraints

245*projectZ1-263
c
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111
1
%Phase 0 | Netlist Checksum: adadfcc0
*common
â
%s*synth2z
xStart RTL Optimization : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1183.293 ; gain = 1066.820

•
%s*synth2ï
íFinished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1183.293 ; gain = 1066.820

á
%s*synth2x
vFinished Compilation : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1183.293 ; gain = 1066.820

j
3inferred FSM for state register '%s' in module '%s'802*oasys2
curr_state_reg2

iic_configZ8-802
„
.merging register '%s' into '%s' in module '%s'3438*oasys2
clr_capture_reg2
preamble_reg2
spdif2a
]/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/hdmi/spdif.sv2
1068@Z8-3888
ã
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
curr_state_reg2	
one-hot2

iic_configZ8-3354
\
0Net %s in module/entity %s does not have driver.3422*oasys2
rst2

top_testZ8-3848
f
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_data[9:8]2

top_testZ8-3848
h
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_data[49:46]2

top_testZ8-3848
i
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_data[127:54]2

top_testZ8-3848
f
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_trig[9:8]2

top_testZ8-3848
h
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_trig[49:46]2

top_testZ8-3848
h
0Net %s in module/entity %s does not have driver.3422*oasys2
ila_trig[63:54]2

top_testZ8-3848
)
%s*synth2
Report RTL Partitions: 

C
%s*synth24
2-----+---------------------+-----------+---------

C
%s*synth24
2     |RTL Partition        |Replication|Instances

C
%s*synth24
2-----+---------------------+-----------+---------

C
%s*synth24
21    |rom                  |          1|   262128

C
%s*synth24
22    |hdmi_test_feeder__GB1|          1|      482

C
%s*synth24
23    |top_test__GC0        |          1|     3417

C
%s*synth24
2-----+---------------------+-----------+---------

}
%s*synth2n
lPart Resources:
DSPs: 2800 (col length:140)
BRAMs: 2060 (col length: RAMB8 0 RAMB16 0 RAMB18 140 RAMB36 70)

°
%s*synth2ë
éFinished Loading Part and Timing Information : Time (s): cpu = 00:01:23 ; elapsed = 00:01:24 . Memory (MB): peak = 1478.875 ; gain = 1362.402

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input     12 Bit       Adders := 1     

?
%s*synth20
.	   2 Input     11 Bit       Adders := 1     

?
%s*synth20
.	   2 Input     10 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      9 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      8 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      7 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      6 Bit       Adders := 2     

?
%s*synth20
.	   2 Input      5 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      2 Bit       Adders := 1     
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
.	               38 Bit    Registers := 1     

?
%s*synth20
.	               36 Bit    Registers := 1     

?
%s*synth20
.	               32 Bit    Registers := 2     

?
%s*synth20
.	               28 Bit    Registers := 1     

?
%s*synth20
.	               16 Bit    Registers := 1     

?
%s*synth20
.	               12 Bit    Registers := 1     

?
%s*synth20
.	               11 Bit    Registers := 1     

?
%s*synth20
.	               10 Bit    Registers := 1     

?
%s*synth20
.	                9 Bit    Registers := 1     

?
%s*synth20
.	                8 Bit    Registers := 1     

?
%s*synth20
.	                7 Bit    Registers := 1     

?
%s*synth20
.	                6 Bit    Registers := 2     

?
%s*synth20
.	                5 Bit    Registers := 1     

?
%s*synth20
.	                2 Bit    Registers := 3     

?
%s*synth20
.	                1 Bit    Registers := 18    


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input     38 Bit        Muxes := 1     

?
%s*synth20
.	   3 Input     32 Bit        Muxes := 2     

?
%s*synth20
.	   2 Input     28 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input     12 Bit        Muxes := 2     

?
%s*synth20
.	   2 Input      9 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      8 Bit        Muxes := 5     

?
%s*synth20
.	   8 Input      8 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      6 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      5 Bit        Muxes := 1     

?
%s*synth20
.	   8 Input      3 Bit        Muxes := 1     

?
%s*synth20
.	   9 Input      3 Bit        Muxes := 2     

?
%s*synth20
.	   2 Input      3 Bit        Muxes := 6     

?
%s*synth20
.	   4 Input      2 Bit        Muxes := 2     

?
%s*synth20
.	   2 Input      2 Bit        Muxes := 4     

?
%s*synth20
.	   3 Input      1 Bit        Muxes := 5     

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 40    

?
%s*synth20
.	   4 Input      1 Bit        Muxes := 13    

4
%s*synth2%
#Hierarchical RTL Component report 

"
%s*synth2
Module top_test 

0
%s*synth2!
Detailed RTL Component Info : 

-
%s*synth2
Module hdmi_test_sender__1 

0
%s*synth2!
Detailed RTL Component Info : 

"
%s*synth2
+---Registers : 

?
%s*synth20
.	               32 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   3 Input     32 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     

?
%s*synth20
.	   3 Input      1 Bit        Muxes := 2     

$
%s*synth2
Module iic_config 

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input     12 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      6 Bit       Adders := 1     

"
%s*synth2
+---Registers : 

?
%s*synth20
.	               28 Bit    Registers := 1     

?
%s*synth20
.	               12 Bit    Registers := 1     

?
%s*synth20
.	                6 Bit    Registers := 1     

?
%s*synth20
.	                1 Bit    Registers := 6     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input     28 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input     12 Bit        Muxes := 2     

?
%s*synth20
.	   8 Input      8 Bit        Muxes := 1     

?
%s*synth20
.	   9 Input      3 Bit        Muxes := 2     

?
%s*synth20
.	   2 Input      3 Bit        Muxes := 6     

?
%s*synth20
.	   8 Input      3 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      2 Bit        Muxes := 2     

?
%s*synth20
.	   3 Input      1 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 10    

1
%s*synth2"
 Module counter__parameterized2 

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input     10 Bit       Adders := 1     

"
%s*synth2
+---Registers : 

?
%s*synth20
.	               10 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     

"
%s*synth2
Module register 

0
%s*synth2!
Detailed RTL Component Info : 

"
%s*synth2
+---Registers : 

?
%s*synth20
.	               36 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     


%s*synth2
Module video 

0
%s*synth2!
Detailed RTL Component Info : 

"
%s*synth2
+---Registers : 

?
%s*synth20
.	                1 Bit    Registers := 2     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 2     

*
%s*synth2
Module hdmi_test_sender 

0
%s*synth2!
Detailed RTL Component Info : 

"
%s*synth2
+---Registers : 

?
%s*synth20
.	               32 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   3 Input     32 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     

?
%s*synth20
.	   3 Input      1 Bit        Muxes := 2     

!
%s*synth2
Module counter 

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input      8 Bit       Adders := 1     

"
%s*synth2
+---Registers : 

?
%s*synth20
.	                8 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     


%s*synth2
Module bmc 

0
%s*synth2!
Detailed RTL Component Info : 

"
%s*synth2
+---Registers : 

?
%s*synth20
.	                1 Bit    Registers := 2     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 4     

1
%s*synth2"
 Module counter__parameterized1 

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input     11 Bit       Adders := 1     

"
%s*synth2
+---Registers : 

?
%s*synth20
.	               11 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     

*
%s*synth2
Module hdmi_test_feeder 

0
%s*synth2!
Detailed RTL Component Info : 

1
%s*synth2"
 Module counter__parameterized0 

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input      7 Bit       Adders := 1     

"
%s*synth2
+---Registers : 

?
%s*synth20
.	                7 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     


%s*synth2
Module spdif 

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input      9 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      6 Bit       Adders := 1     

?
%s*synth20
.	   2 Input      5 Bit       Adders := 1     
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
.	               38 Bit    Registers := 1     

?
%s*synth20
.	               16 Bit    Registers := 1     

?
%s*synth20
.	                9 Bit    Registers := 1     

?
%s*synth20
.	                6 Bit    Registers := 1     

?
%s*synth20
.	                5 Bit    Registers := 1     

?
%s*synth20
.	                1 Bit    Registers := 7     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input     38 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      9 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      8 Bit        Muxes := 5     

?
%s*synth20
.	   2 Input      6 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      5 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 10    

#
%s*synth2
Module video_fsm 

0
%s*synth2!
Detailed RTL Component Info : 

"
%s*synth2
+---Registers : 

?
%s*synth20
.	                2 Bit    Registers := 2     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   4 Input      2 Bit        Muxes := 2     

?
%s*synth20
.	   2 Input      2 Bit        Muxes := 1     

?
%s*synth20
.	   4 Input      1 Bit        Muxes := 13    

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 6     


%s*synth2
Module hdmi 

0
%s*synth2!
Detailed RTL Component Info : 

%
%s*synth2
Module pixel_clock 

0
%s*synth2!
Detailed RTL Component Info : 


%s*synth2
+---Adders : 

?
%s*synth20
.	   2 Input      2 Bit       Adders := 1     

"
%s*synth2
+---Registers : 

?
%s*synth20
.	                2 Bit    Registers := 1     

?
%s*synth20
.	                1 Bit    Registers := 1     


%s*synth2
+---Muxes : 

?
%s*synth20
.	   2 Input      2 Bit        Muxes := 1     

?
%s*synth20
.	   2 Input      1 Bit        Muxes := 1     

ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[0] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[1] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[2] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[3] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[4] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[5] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[6] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[7] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[8] 2

counter__5Z8-3332
ä
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[9] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[10] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[11] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[12] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[13] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[14] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[15] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[16] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[17] 2

counter__5Z8-3332
ã
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/addr_reg[18] 2

counter__5Z8-3332
ô
%s*synth2â
ÜFinished Cross Boundary Optimization : Time (s): cpu = 00:01:24 ; elapsed = 00:01:25 . Memory (MB): peak = 1478.875 ; gain = 1362.402

ê
%s*synth2Ä
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting

c
%s*synth2T
R---------------------------------------------------------------------------------

î
%s*synth2Ñ
Å---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting

c
%s*synth2T
R---------------------------------------------------------------------------------

Å
6propagating constant %s across sequential element (%s)3333*oasys2
02+
)i_0/\hdmi0/iic_config0/SDA_BUFFER_reg[0] Z8-3333
Ä
6propagating constant %s across sequential element (%s)3333*oasys2
02*
(i_0/\hdmi0/video0/pixel_reg/out_reg[27] Z8-3333
ò
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2'
%\hdmi0/iic_config0/SDA_BUFFER_reg[0] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[34] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[33] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[32] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[31] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[30] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[29] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[28] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[27] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[26] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[25] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[24] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[23] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[22] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[21] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[20] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[19] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[18] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[17] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[16] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[15] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[14] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[13] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[12] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[11] 2
top_test__GC0Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2&
$\hdmi0/video0/pixel_reg/out_reg[10] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[9] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[8] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[7] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[6] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[5] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[4] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[3] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[2] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[1] 2
top_test__GC0Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2%
#\hdmi0/video0/pixel_reg/out_reg[0] 2
top_test__GC0Z8-3332
~
6propagating constant %s across sequential element (%s)3333*oasys2
02(
&feeder0i_2/\audio_sender/state_reg[1] Z8-3333
~
6propagating constant %s across sequential element (%s)3333*oasys2
02(
&feeder0i_2/\video_sender/state_reg[1] Z8-3333
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[31] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[30] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[29] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[28] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[27] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[26] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[25] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[24] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[23] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[22] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[21] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[20] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[19] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[18] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[17] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[16] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[15] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[14] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[13] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[12] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[11] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[10] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[9] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[8] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[7] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[6] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[5] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[4] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[3] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[2] 2
hdmi_test_feeder__GB1Z8-3332
ñ
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\video_sender/state_reg[1] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[31] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[30] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[29] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[28] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[27] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[26] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[25] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[24] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[23] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[22] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[21] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[20] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[19] 2
hdmi_test_feeder__GB1Z8-3332
ó
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
\audio_sender/state_reg[18] 2
hdmi_test_feeder__GB1Z8-3332
∞
ÅMessage '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
100Z17-14
ç
%s*synth2~
|Finished Area Optimization : Time (s): cpu = 00:07:56 ; elapsed = 00:07:59 . Memory (MB): peak = 2703.520 ; gain = 2587.047

ù
%s*synth2ç
äFinished Applying XDC Timing Constraints : Time (s): cpu = 00:07:58 ; elapsed = 00:08:01 . Memory (MB): peak = 2703.520 ; gain = 2587.047

?
%s*synth20
.info: start optimizing sub-critical range ...

;
%s*synth2,
*info: done optimizing sub-critical range.

ê
%s*synth2Ä
~Finished Timing Optimization : Time (s): cpu = 00:07:58 ; elapsed = 00:08:01 . Memory (MB): peak = 2703.520 ; gain = 2587.047

1
%s*synth2"
 Start control sets optimization

§
ÑReached the limit for maximum flops that can be modified (%s). You can increase this by setting the parameter controlSetsOptMaxFlops3584*oasys2
20Z8-4428
u
%s*synth2f
dFinished control sets optimization. Modified 16 flops. Number of control sets: before: 21 after: 14

é
%s*synth2
}Finished Technology Mapping : Time (s): cpu = 00:08:20 ; elapsed = 00:08:23 . Memory (MB): peak = 2705.645 ; gain = 2589.172

W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[127]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[126]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[125]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[124]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[123]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[122]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[121]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[120]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[119]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[118]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[117]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[116]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[115]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[114]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[113]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[112]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[111]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[110]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[109]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[108]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[107]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[106]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[105]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[104]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[103]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[102]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[101]Z8-4442
W
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2
	DATA[100]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[99]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[98]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[97]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[96]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[95]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[94]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[93]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[92]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[91]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[90]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[89]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[88]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[87]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[86]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[85]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[84]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[83]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[82]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[81]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[80]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[79]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[78]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[77]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[76]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[75]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[74]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[73]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[72]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[71]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[70]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[69]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[68]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[67]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[66]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[65]Z8-4442
V
*BlackBox module %s has unconnected pin %s
3599*oasys2
ila2

DATA[64]Z8-4442
à
%s*synth2y
wFinished IO Insertion : Time (s): cpu = 00:08:26 ; elapsed = 00:08:29 . Memory (MB): peak = 2705.645 ; gain = 2589.172
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
ö
%s*synth2ä
áFinished Renaming Generated Instances : Time (s): cpu = 00:08:26 ; elapsed = 00:08:29 . Memory (MB): peak = 2705.645 ; gain = 2589.172

ó
%s*synth2á
ÑFinished Rebuilding User Hierarchy : Time (s): cpu = 00:08:41 ; elapsed = 00:08:44 . Memory (MB): peak = 2705.645 ; gain = 2589.172

ê
%s*synth2Ä
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting

c
%s*synth2T
R---------------------------------------------------------------------------------

î
%s*synth2Ñ
Å---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting

c
%s*synth2T
R---------------------------------------------------------------------------------

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
1    |hdmi_icon    |        1

/
%s*synth2 
2    |chipscope_ila|        1

/
%s*synth2 
-----+-------------+---------

%
%s*synth2
Report Cell Usage: 

+
%s*synth2
-----+-------------+-----

+
%s*synth2
     |Cell         |Count

+
%s*synth2
-----+-------------+-----

+
%s*synth2
1    |chipscope_ila|    1

+
%s*synth2
2    |hdmi_icon    |    1

+
%s*synth2
3    |BUFG         |    3

+
%s*synth2
4    |CARRY4       |   20

+
%s*synth2
5    |LUT1         |   67

+
%s*synth2
6    |LUT2         |   67

+
%s*synth2
7    |LUT3         |   68

+
%s*synth2
8    |LUT4         |  266

+
%s*synth2
9    |LUT5         | 1328

+
%s*synth2
10   |LUT6         |67713

+
%s*synth2
11   |MUXF7        |29785

+
%s*synth2
12   |MUXF8        | 7960

+
%s*synth2
13   |FDCE         |  601

+
%s*synth2
14   |FDPE         |   15

+
%s*synth2
15   |IBUF         |    1

+
%s*synth2
16   |IBUFDS       |    1

+
%s*synth2
17   |OBUF         |   46

+
%s*synth2
-----+-------------+-----

)
%s*synth2
Report Instance Areas: 

J
%s*synth2;
9-----+-------------------+-----------------------+------

J
%s*synth2;
9     |Instance           |Module                 |Cells 

J
%s*synth2;
9-----+-------------------+-----------------------+------

J
%s*synth2;
91    |top                |                       |107941

J
%s*synth2;
92    |  hdmi0            |hdmi                   |   558

J
%s*synth2;
93    |    spdif0         |spdif                  |   169

J
%s*synth2;
94    |      bmc0         |bmc                    |     7

J
%s*synth2;
95    |    iic_config0    |iic_config             |   266

J
%s*synth2;
96    |    video0         |video                  |   123

J
%s*synth2;
97    |      vblank_count |counter__parameterized0|    18

J
%s*synth2;
98    |      v_pixel_count|counter__parameterized2|    25

J
%s*synth2;
99    |      h_pixel_count|counter__parameterized1|    26

J
%s*synth2;
910   |      fsm          |video_fsm              |    22

J
%s*synth2;
911   |      hblank_count |counter                |    20

J
%s*synth2;
912   |      pclk         |pixel_clock            |     6

J
%s*synth2;
913   |      pixel_reg    |register               |     1

J
%s*synth2;
914   |  feeder0          |hdmi_test_feeder       |107332

J
%s*synth2;
915   |    audio_sender   |hdmi_test_sender       | 46785

J
%s*synth2;
916   |    video_sender   |hdmi_test_sender_0     |     3

J
%s*synth2;
9-----+-------------------+-----------------------+------

ñ
%s*synth2Ü
ÉFinished Writing Synthesis Report : Time (s): cpu = 00:09:19 ; elapsed = 00:09:23 . Memory (MB): peak = 2705.645 ; gain = 2589.172

Y
%s*synth2J
HSynthesis finished with 0 errors, 0 critical warnings and 188 warnings.

î
%s*synth2Ñ
ÅSynthesis Optimization Complete : Time (s): cpu = 00:09:19 ; elapsed = 00:09:23 . Memory (MB): peak = 2705.645 ; gain = 2589.172

‡
<Reading core file '%s' for (cell view '%s', library '%s'%s)
108*designutils2k
i/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/chipscope_1/hdmi_icon.ngc2
	hdmi_icon2
work2
 Z20-108
c
Parsing EDIF File [%s]
106*designutils2,
*./.ngc2edfcache/hdmi_icon_ngc_700d698.edifZ20-106
j
 Finished Parsing EDIF File [%s]
97*designutils2,
*./.ngc2edfcache/hdmi_icon_ngc_700d698.edifZ20-97
Ë
<Reading core file '%s' for (cell view '%s', library '%s'%s)
108*designutils2o
m/work/team_psx/labs/lab2_sound/hdmi_test_v5/hdmi_test_v5.srcs/sources_1/imports/chipscope_1/chipscope_ila.ngc2
chipscope_ila2
work2
 Z20-108
g
Parsing EDIF File [%s]
106*designutils20
../.ngc2edfcache/chipscope_ila_ngc_700d698.edifZ20-106
n
 Finished Parsing EDIF File [%s]
97*designutils20
../.ngc2edfcache/chipscope_ila_ngc_700d698.edifZ20-97
L
-Analyzing %s Unisim elements for replacement
17*netlist2
988Z29-17
O
2Unisim Transformation completed in %s CPU seconds
28*netlist2
1Z29-28
S
Netlist was created with %s %s291*project2
Xilinx ngc2edif2
P.68dZ1-479
1
Pushed %s inverter(s).
98*opt2
0Z31-138
í
!Unisim Transformation Summary:
%s111*project2’
“  A total of 925 instances were transformed.
  (MUXCY,XORCY) => CARRY4: 30 instances
  FD => FDCE: 321 instances
  FDC => FDCE: 9 instances
  FDE => FDCE: 32 instances
  FDP => FDPE: 66 instances
  FDR => FDRE: 60 instances
  FDS => FDSE: 10 instances
  INV => LUT1: 6 instances
  LDC => LDCE: 1 instances
  MUXF5 => LUT3: 2 instances
  MUXF6 => LUT3: 1 instances
  RAMB36 => RAMB36E1: 258 instances
  SRL16 => SRL16E: 128 instances
  SRLC16E => SRL16E: 1 instances
Z1-111
1
%Phase 0 | Netlist Checksum: c148b6e4
*common
w
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
632
1842
02
0Z4-41
C
%s completed successfully
29*	vivadotcl2
synth_designZ4-42
§
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:09:452

00:09:492

2705.6452

2551.945Z17-268
Ç
vreport_utilization: Time (s): cpu = 00:00:00.65 ; elapsed = 00:00:00.73 . Memory (MB): peak = 2705.645 ; gain = 0.000
*common
S
Exiting %s at %s...
206*common2
Vivado2
Tue Sep 24 19:46:04 2013Z17-206