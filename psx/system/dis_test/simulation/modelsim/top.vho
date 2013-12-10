-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Full Version"

-- DATE "11/30/2013 23:47:53"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(17 DOWNTO 0);
	SRAM_DQ : INOUT std_logic_vector(15 DOWNTO 0);
	VGA_HS : OUT std_logic;
	VGA_VS : OUT std_logic;
	VGA_BLANK_N : OUT std_logic;
	VGA_SYNC_N : OUT std_logic;
	VGA_CLK : OUT std_logic;
	VGA_R : OUT std_logic_vector(7 DOWNTO 0);
	VGA_G : OUT std_logic_vector(7 DOWNTO 0);
	VGA_B : OUT std_logic_vector(7 DOWNTO 0);
	LEDR : OUT std_logic_vector(17 DOWNTO 0);
	SRAM_CE_N : OUT std_logic;
	SRAM_OE_N : OUT std_logic;
	SRAM_WE_N : OUT std_logic;
	SRAM_LB_N : OUT std_logic;
	SRAM_UB_N : OUT std_logic;
	SRAM_ADDR : OUT std_logic_vector(19 DOWNTO 0)
	);
END top;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_HS	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_VS	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_BLANK_N	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_SYNC_N	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_CLK	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[0]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[1]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[2]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[3]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[4]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[5]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[6]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[7]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[0]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[1]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[2]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[3]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[4]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[5]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[6]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[7]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[1]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[2]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[3]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[4]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[5]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[6]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[7]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[17]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_CE_N	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_OE_N	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_WE_N	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_LB_N	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_UB_N	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[0]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[1]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[2]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[3]	=>  Location: PIN_AC7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[4]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[5]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[6]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[7]	=>  Location: PIN_AC5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[8]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[9]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[10]	=>  Location: PIN_AF2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[11]	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[12]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[13]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[14]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[15]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[16]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[17]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[18]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_ADDR[19]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[0]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[1]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[2]	=>  Location: PIN_AG4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[3]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[4]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[5]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[6]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[7]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[8]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[9]	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[10]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[11]	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[12]	=>  Location: PIN_AE3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[13]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[14]	=>  Location: PIN_AF3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SRAM_DQ[15]	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[16]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[17]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL ww_VGA_BLANK_N : std_logic;
SIGNAL ww_VGA_SYNC_N : std_logic;
SIGNAL ww_VGA_CLK : std_logic;
SIGNAL ww_VGA_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_SRAM_CE_N : std_logic;
SIGNAL ww_SRAM_OE_N : std_logic;
SIGNAL ww_SRAM_WE_N : std_logic;
SIGNAL ww_SRAM_LB_N : std_logic;
SIGNAL ww_SRAM_UB_N : std_logic;
SIGNAL ww_SRAM_ADDR : std_logic_vector(19 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \pl|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \pl|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \dc|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \dc|Mult1|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \dc|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \dc|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \dc|Mult1|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \dc|Mult1|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_50MHz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_33MHz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_100MHz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dc|v|col_counter|Q[0]~11_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~0_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~2_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~16_combout\ : std_logic;
SIGNAL \dc|Add5~7_combout\ : std_logic;
SIGNAL \count[3]~30_combout\ : std_logic;
SIGNAL \count[9]~42_combout\ : std_logic;
SIGNAL \count[13]~50_combout\ : std_logic;
SIGNAL \count[25]~75\ : std_logic;
SIGNAL \count[26]~76_combout\ : std_logic;
SIGNAL \Add2~24_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~16_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~14_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~20_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~18_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~16_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~14_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_24~1_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_24~3_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_24~5_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_24~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_24~8_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~16_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_24~1_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_24~3_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_24~5_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_24~7_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_24~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_24~10_combout\ : std_logic;
SIGNAL \dc|storing_addr[6]~19_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT14\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT18\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~10\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~11\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~12\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~13\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~14\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~15\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT15\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~10\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~11\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~12\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~13\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~14\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~15\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~16\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \dc|v|LessThan4~1_combout\ : std_logic;
SIGNAL \dc|v|Equal0~0_combout\ : std_logic;
SIGNAL \dc|flag_ld~q\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[240]~196_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[239]~199_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[238]~201_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[237]~203_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[250]~205_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[249]~206_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[248]~209_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[262]~210_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[260]~212_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[259]~216_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[273]~217_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[272]~218_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[271]~219_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[284]~225_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[269]~232_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[281]~233_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[295]~234_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[294]~235_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[232]~237_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[256]~240_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[280]~242_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[292]~243_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[306]~244_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[304]~246_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[243]~247_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[279]~253_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[291]~254_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[303]~255_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[316]~257_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[254]~259_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[242]~260_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[242]~261_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[254]~262_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[266]~263_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[278]~264_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[290]~265_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[302]~266_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[339]~280_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[338]~281_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[337]~282_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[276]~283_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[264]~284_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[264]~285_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[276]~286_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[288]~287_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[300]~288_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[312]~289_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[324]~290_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[336]~291_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[218]~209_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[217]~210_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[216]~213_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[215]~214_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[214]~216_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[226]~220_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[238]~222_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[235]~226_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[212]~227_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[212]~228_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[247]~230_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[258]~237_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[268]~247_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[267]~248_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[278]~257_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[277]~258_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[275]~261_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[252]~266_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[287]~268_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[262]~276_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[298]~277_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[296]~279_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[295]~281_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[261]~282_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[261]~285_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[272]~286_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[308]~287_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[307]~288_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[306]~289_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[305]~290_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[305]~291_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[271]~292_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[260]~293_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[260]~294_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[271]~295_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[282]~296_combout\ : std_logic;
SIGNAL \dc|storing_color_next[3]~0_combout\ : std_logic;
SIGNAL \dc|storing_color_next[4]~1_combout\ : std_logic;
SIGNAL \dc|storing_color_next[13]~7_combout\ : std_logic;
SIGNAL \dc|storing_color_next[14]~8_combout\ : std_logic;
SIGNAL \dc|storing_color_next[20]~11_combout\ : std_logic;
SIGNAL \dc|storing_color_next[22]~13_combout\ : std_logic;
SIGNAL \dc|storing_color_next[23]~14_combout\ : std_logic;
SIGNAL \clk_33MHz~combout\ : std_logic;
SIGNAL \vc|sram_dq_out[0]~3_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[1]~6_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[2]~9_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[3]~12_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[9]~30_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[13]~42_combout\ : std_logic;
SIGNAL \color[3][3]~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[317]~321_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[278]~324_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[290]~325_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[302]~326_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[328]~328_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[301]~332_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[339]~335_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[338]~336_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[337]~337_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[300]~338_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[312]~339_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[324]~340_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[336]~341_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[248]~301_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[288]~325_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[308]~337_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[307]~338_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[306]~339_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[293]~340_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[304]~341_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[304]~342_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[251]~342_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[266]~351_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[288]~353_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[228]~343_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[225]~346_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[282]~356_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \clk_33MHz~clkctrl_outclk\ : std_logic;
SIGNAL \dc|mult_x[9]~feeder_combout\ : std_logic;
SIGNAL \dc|mult_y[5]~feeder_combout\ : std_logic;
SIGNAL \w_x[5]~1_combout\ : std_logic;
SIGNAL \Add2~20_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \Add2~1_cout\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Add2~19_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \Add2~18_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add2~15_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \w_x[5]~0_combout\ : std_logic;
SIGNAL \w_x[8]~2_combout\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~21_combout\ : std_logic;
SIGNAL \Add2~23_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \Add1~1_cout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \w_y[3]~0_combout\ : std_logic;
SIGNAL \w_y[4]~6_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \w_y[6]~4_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \w_y[9]~1_combout\ : std_logic;
SIGNAL \vc|counter[0]~2_combout\ : std_logic;
SIGNAL \vc|counter~1_combout\ : std_logic;
SIGNAL \vc|counter~0_combout\ : std_logic;
SIGNAL \vc|always5~0_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[0]~12\ : std_logic;
SIGNAL \dc|v|col_counter|Q[1]~13_combout\ : std_logic;
SIGNAL \dc|vram_ctrl~0_combout\ : std_logic;
SIGNAL \dc|v|LessThan4~0_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[9]~30\ : std_logic;
SIGNAL \dc|v|col_counter|Q[10]~31_combout\ : std_logic;
SIGNAL \dc|v|LessThan4~2_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[1]~14\ : std_logic;
SIGNAL \dc|v|col_counter|Q[2]~15_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[2]~16\ : std_logic;
SIGNAL \dc|v|col_counter|Q[3]~17_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[3]~18\ : std_logic;
SIGNAL \dc|v|col_counter|Q[4]~19_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[4]~20\ : std_logic;
SIGNAL \dc|v|col_counter|Q[5]~21_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[5]~22\ : std_logic;
SIGNAL \dc|v|col_counter|Q[6]~24\ : std_logic;
SIGNAL \dc|v|col_counter|Q[7]~25_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[7]~26\ : std_logic;
SIGNAL \dc|v|col_counter|Q[8]~27_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[8]~28\ : std_logic;
SIGNAL \dc|v|col_counter|Q[9]~29_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[9]~feeder_combout\ : std_logic;
SIGNAL \dc|vram_ctrl~1_combout\ : std_logic;
SIGNAL \dc|vram_ctrl~2_combout\ : std_logic;
SIGNAL \vc|GPU_en_next~0_combout\ : std_logic;
SIGNAL \vc|GPU_en~q\ : std_logic;
SIGNAL \always1~0_combout\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \w_y[2]~8_combout\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \w_y[7]~3_combout\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \w_y[5]~5_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \always1~1_combout\ : std_logic;
SIGNAL \always1~2_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~1\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~3\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~4_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q~0_combout\ : std_logic;
SIGNAL \dc|Equal0~0_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[3]~1_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~5\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~6_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[3]~4_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~7\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~9\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~10_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[5]~8_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[8]~5_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~11\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~12_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[6]~7_combout\ : std_logic;
SIGNAL \dc|Equal2~0_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~8_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[4]~3_combout\ : std_logic;
SIGNAL \dc|v|LessThan0~0_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q~10_combout\ : std_logic;
SIGNAL \dc|v|VS~1_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~13\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~15\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~17\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~18_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[9]~2_combout\ : std_logic;
SIGNAL \dc|v|LessThan3~0_combout\ : std_logic;
SIGNAL \dc|blk~0_combout\ : std_logic;
SIGNAL \dc|vram_re~combout\ : std_logic;
SIGNAL \Add2~22\ : std_logic;
SIGNAL \Add2~25\ : std_logic;
SIGNAL \Add2~26_combout\ : std_logic;
SIGNAL \w_x[9]~3_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[1]~0_combout\ : std_logic;
SIGNAL \color[2][3]~feeder_combout\ : std_logic;
SIGNAL \count[0]~78_combout\ : std_logic;
SIGNAL \count[1]~27\ : std_logic;
SIGNAL \count[2]~28_combout\ : std_logic;
SIGNAL \count[2]~29\ : std_logic;
SIGNAL \count[3]~31\ : std_logic;
SIGNAL \count[4]~33\ : std_logic;
SIGNAL \count[5]~34_combout\ : std_logic;
SIGNAL \count[5]~35\ : std_logic;
SIGNAL \count[6]~36_combout\ : std_logic;
SIGNAL \count[6]~37\ : std_logic;
SIGNAL \count[7]~38_combout\ : std_logic;
SIGNAL \count[7]~39\ : std_logic;
SIGNAL \count[8]~40_combout\ : std_logic;
SIGNAL \count[8]~41\ : std_logic;
SIGNAL \count[9]~43\ : std_logic;
SIGNAL \count[10]~44_combout\ : std_logic;
SIGNAL \count[10]~45\ : std_logic;
SIGNAL \count[11]~47\ : std_logic;
SIGNAL \count[12]~48_combout\ : std_logic;
SIGNAL \count[11]~46_combout\ : std_logic;
SIGNAL \color[3][3]~3_combout\ : std_logic;
SIGNAL \count[12]~49\ : std_logic;
SIGNAL \count[13]~51\ : std_logic;
SIGNAL \count[14]~52_combout\ : std_logic;
SIGNAL \count[14]~53\ : std_logic;
SIGNAL \count[15]~54_combout\ : std_logic;
SIGNAL \count[15]~55\ : std_logic;
SIGNAL \count[16]~56_combout\ : std_logic;
SIGNAL \count[16]~57\ : std_logic;
SIGNAL \count[17]~59\ : std_logic;
SIGNAL \count[18]~60_combout\ : std_logic;
SIGNAL \count[18]~61\ : std_logic;
SIGNAL \count[19]~63\ : std_logic;
SIGNAL \count[20]~65\ : std_logic;
SIGNAL \count[21]~66_combout\ : std_logic;
SIGNAL \count[21]~67\ : std_logic;
SIGNAL \count[22]~68_combout\ : std_logic;
SIGNAL \count[22]~69\ : std_logic;
SIGNAL \count[23]~70_combout\ : std_logic;
SIGNAL \count[23]~71\ : std_logic;
SIGNAL \count[24]~72_combout\ : std_logic;
SIGNAL \count[24]~73\ : std_logic;
SIGNAL \count[25]~74_combout\ : std_logic;
SIGNAL \color[3][3]~0_combout\ : std_logic;
SIGNAL \count[1]~26_combout\ : std_logic;
SIGNAL \count[4]~32_combout\ : std_logic;
SIGNAL \color[3][3]~1_combout\ : std_logic;
SIGNAL \color[3][3]~4_combout\ : std_logic;
SIGNAL \count[19]~62_combout\ : std_logic;
SIGNAL \count[17]~58_combout\ : std_logic;
SIGNAL \count[20]~64_combout\ : std_logic;
SIGNAL \color[3][3]~6_combout\ : std_logic;
SIGNAL \color[3][3]~5_combout\ : std_logic;
SIGNAL \color[3][3]~7_combout\ : std_logic;
SIGNAL \color[3][3]~8_combout\ : std_logic;
SIGNAL \color[2][3]~q\ : std_logic;
SIGNAL \color[1][3]~feeder_combout\ : std_logic;
SIGNAL \color[1][3]~q\ : std_logic;
SIGNAL \color[0][3]~q\ : std_logic;
SIGNAL \color[7][3]~56_combout\ : std_logic;
SIGNAL \color[7][3]~q\ : std_logic;
SIGNAL \color[6][3]~48_combout\ : std_logic;
SIGNAL \color[6][3]~q\ : std_logic;
SIGNAL \color[5][3]~41_combout\ : std_logic;
SIGNAL \color[5][3]~q\ : std_logic;
SIGNAL \color[4][3]~35_combout\ : std_logic;
SIGNAL \color[4][3]~q\ : std_logic;
SIGNAL \color[3][3]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[0]~4_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[0]~5_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[18]~39_combout\ : std_logic;
SIGNAL \color[1][4]~11_combout\ : std_logic;
SIGNAL \color[1][4]~q\ : std_logic;
SIGNAL \color[0][4]~9_combout\ : std_logic;
SIGNAL \color[0][4]~q\ : std_logic;
SIGNAL \color[7][4]~feeder_combout\ : std_logic;
SIGNAL \color[7][4]~q\ : std_logic;
SIGNAL \color[6][4]~49_combout\ : std_logic;
SIGNAL \color[6][4]~q\ : std_logic;
SIGNAL \color[5][4]~42_combout\ : std_logic;
SIGNAL \color[5][4]~q\ : std_logic;
SIGNAL \color[4][4]~36_combout\ : std_logic;
SIGNAL \color[4][4]~q\ : std_logic;
SIGNAL \color[3][4]~10_combout\ : std_logic;
SIGNAL \color[3][4]~q\ : std_logic;
SIGNAL \color[2][4]~feeder_combout\ : std_logic;
SIGNAL \color[2][4]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[1]~1_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[1]~2_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[1]~7_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[1]~8_combout\ : std_logic;
SIGNAL \color[2][5]~12_combout\ : std_logic;
SIGNAL \color[2][5]~q\ : std_logic;
SIGNAL \color[1][5]~feeder_combout\ : std_logic;
SIGNAL \color[1][5]~q\ : std_logic;
SIGNAL \color[0][5]~feeder_combout\ : std_logic;
SIGNAL \color[0][5]~q\ : std_logic;
SIGNAL \color[4][22]~40_combout\ : std_logic;
SIGNAL \color[4][22]~q\ : std_logic;
SIGNAL \color[3][22]~q\ : std_logic;
SIGNAL \color[2][22]~32_combout\ : std_logic;
SIGNAL \color[2][22]~q\ : std_logic;
SIGNAL \color[1][22]~31_combout\ : std_logic;
SIGNAL \color[1][22]~q\ : std_logic;
SIGNAL \color[0][22]~feeder_combout\ : std_logic;
SIGNAL \color[0][22]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[2]~10_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[2]~11_combout\ : std_logic;
SIGNAL \color[1][6]~feeder_combout\ : std_logic;
SIGNAL \color[1][6]~q\ : std_logic;
SIGNAL \color[0][6]~13_combout\ : std_logic;
SIGNAL \color[0][6]~q\ : std_logic;
SIGNAL \color[7][6]~feeder_combout\ : std_logic;
SIGNAL \color[7][6]~q\ : std_logic;
SIGNAL \color[6][6]~50_combout\ : std_logic;
SIGNAL \color[6][6]~q\ : std_logic;
SIGNAL \color[5][6]~feeder_combout\ : std_logic;
SIGNAL \color[5][6]~q\ : std_logic;
SIGNAL \color[4][6]~feeder_combout\ : std_logic;
SIGNAL \color[4][6]~q\ : std_logic;
SIGNAL \color[3][6]~q\ : std_logic;
SIGNAL \color[2][6]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[3]~13_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[3]~14_combout\ : std_logic;
SIGNAL \color[2][7]~15_combout\ : std_logic;
SIGNAL \color[2][7]~q\ : std_logic;
SIGNAL \color[1][7]~14_combout\ : std_logic;
SIGNAL \color[1][7]~q\ : std_logic;
SIGNAL \color[0][7]~q\ : std_logic;
SIGNAL \color[7][7]~57_combout\ : std_logic;
SIGNAL \color[7][7]~q\ : std_logic;
SIGNAL \color[6][7]~51_combout\ : std_logic;
SIGNAL \color[6][7]~q\ : std_logic;
SIGNAL \color[5][7]~43_combout\ : std_logic;
SIGNAL \color[5][7]~q\ : std_logic;
SIGNAL \color[4][7]~37_combout\ : std_logic;
SIGNAL \color[4][7]~q\ : std_logic;
SIGNAL \color[3][7]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[4]~15_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[4]~16_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[4]~17_combout\ : std_logic;
SIGNAL \color[1][11]~q\ : std_logic;
SIGNAL \color[0][11]~q\ : std_logic;
SIGNAL \color[7][11]~58_combout\ : std_logic;
SIGNAL \color[7][11]~q\ : std_logic;
SIGNAL \color[6][11]~52_combout\ : std_logic;
SIGNAL \color[6][11]~q\ : std_logic;
SIGNAL \color[5][11]~44_combout\ : std_logic;
SIGNAL \color[5][11]~q\ : std_logic;
SIGNAL \color[4][11]~q\ : std_logic;
SIGNAL \color[3][11]~16_combout\ : std_logic;
SIGNAL \color[3][11]~q\ : std_logic;
SIGNAL \color[2][11]~feeder_combout\ : std_logic;
SIGNAL \color[2][11]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[5]~18_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[5]~19_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[5]~20_combout\ : std_logic;
SIGNAL \color[2][12]~feeder_combout\ : std_logic;
SIGNAL \color[2][12]~q\ : std_logic;
SIGNAL \color[1][12]~18_combout\ : std_logic;
SIGNAL \color[1][12]~q\ : std_logic;
SIGNAL \color[0][12]~17_combout\ : std_logic;
SIGNAL \color[0][12]~q\ : std_logic;
SIGNAL \color[3][12]~feeder_combout\ : std_logic;
SIGNAL \color[3][12]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[6]~21_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[6]~22_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[6]~23_combout\ : std_logic;
SIGNAL \color[2][13]~feeder_combout\ : std_logic;
SIGNAL \color[2][13]~q\ : std_logic;
SIGNAL \color[1][13]~21_combout\ : std_logic;
SIGNAL \color[1][13]~q\ : std_logic;
SIGNAL \color[0][13]~19_combout\ : std_logic;
SIGNAL \color[0][13]~q\ : std_logic;
SIGNAL \color[7][13]~feeder_combout\ : std_logic;
SIGNAL \color[7][13]~q\ : std_logic;
SIGNAL \color[6][13]~feeder_combout\ : std_logic;
SIGNAL \color[6][13]~q\ : std_logic;
SIGNAL \color[5][13]~feeder_combout\ : std_logic;
SIGNAL \color[5][13]~q\ : std_logic;
SIGNAL \color[4][13]~38_combout\ : std_logic;
SIGNAL \color[4][13]~q\ : std_logic;
SIGNAL \color[3][13]~20_combout\ : std_logic;
SIGNAL \color[3][13]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[7]~24_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[7]~25_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[7]~26_combout\ : std_logic;
SIGNAL \color[2][14]~q\ : std_logic;
SIGNAL \color[1][14]~24_combout\ : std_logic;
SIGNAL \color[1][14]~q\ : std_logic;
SIGNAL \color[0][14]~23_combout\ : std_logic;
SIGNAL \color[0][14]~q\ : std_logic;
SIGNAL \color[1][19]~feeder_combout\ : std_logic;
SIGNAL \color[1][19]~q\ : std_logic;
SIGNAL \color[0][19]~q\ : std_logic;
SIGNAL \color[5][14]~feeder_combout\ : std_logic;
SIGNAL \color[5][14]~q\ : std_logic;
SIGNAL \color[4][14]~39_combout\ : std_logic;
SIGNAL \color[4][14]~q\ : std_logic;
SIGNAL \color[3][14]~22_combout\ : std_logic;
SIGNAL \color[3][14]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[8]~27_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[8]~28_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[8]~29_combout\ : std_logic;
SIGNAL \color[7][15]~59_combout\ : std_logic;
SIGNAL \color[7][15]~q\ : std_logic;
SIGNAL \color[6][15]~53_combout\ : std_logic;
SIGNAL \color[6][15]~q\ : std_logic;
SIGNAL \color[5][15]~45_combout\ : std_logic;
SIGNAL \color[5][15]~q\ : std_logic;
SIGNAL \color[4][15]~q\ : std_logic;
SIGNAL \color[3][15]~25_combout\ : std_logic;
SIGNAL \color[3][15]~q\ : std_logic;
SIGNAL \color[2][15]~27_combout\ : std_logic;
SIGNAL \color[2][15]~q\ : std_logic;
SIGNAL \color[1][15]~26_combout\ : std_logic;
SIGNAL \color[1][15]~q\ : std_logic;
SIGNAL \color[0][15]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[9]~31_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[9]~32_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[10]~33_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[10]~34_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[10]~35_combout\ : std_logic;
SIGNAL \color[2][20]~feeder_combout\ : std_logic;
SIGNAL \color[2][20]~q\ : std_logic;
SIGNAL \color[1][20]~28_combout\ : std_logic;
SIGNAL \color[1][20]~q\ : std_logic;
SIGNAL \color[0][20]~q\ : std_logic;
SIGNAL \color[7][20]~60_combout\ : std_logic;
SIGNAL \color[7][20]~q\ : std_logic;
SIGNAL \color[6][20]~54_combout\ : std_logic;
SIGNAL \color[6][20]~q\ : std_logic;
SIGNAL \color[5][20]~46_combout\ : std_logic;
SIGNAL \color[5][20]~q\ : std_logic;
SIGNAL \color[4][20]~feeder_combout\ : std_logic;
SIGNAL \color[4][20]~q\ : std_logic;
SIGNAL \color[3][20]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[11]~36_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[11]~37_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[11]~38_combout\ : std_logic;
SIGNAL \color[1][21]~q\ : std_logic;
SIGNAL \color[0][21]~29_combout\ : std_logic;
SIGNAL \color[0][21]~q\ : std_logic;
SIGNAL \color[7][21]~feeder_combout\ : std_logic;
SIGNAL \color[7][21]~q\ : std_logic;
SIGNAL \color[6][21]~feeder_combout\ : std_logic;
SIGNAL \color[6][21]~q\ : std_logic;
SIGNAL \color[5][21]~feeder_combout\ : std_logic;
SIGNAL \color[5][21]~q\ : std_logic;
SIGNAL \color[4][21]~feeder_combout\ : std_logic;
SIGNAL \color[4][21]~q\ : std_logic;
SIGNAL \color[3][21]~q\ : std_logic;
SIGNAL \color[2][21]~30_combout\ : std_logic;
SIGNAL \color[2][21]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[12]~39_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[12]~40_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[12]~41_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[13]~43_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[13]~44_combout\ : std_logic;
SIGNAL \color[2][23]~q\ : std_logic;
SIGNAL \color[1][23]~q\ : std_logic;
SIGNAL \color[0][23]~34_combout\ : std_logic;
SIGNAL \color[0][23]~q\ : std_logic;
SIGNAL \color[7][23]~feeder_combout\ : std_logic;
SIGNAL \color[7][23]~q\ : std_logic;
SIGNAL \color[6][23]~55_combout\ : std_logic;
SIGNAL \color[6][23]~q\ : std_logic;
SIGNAL \color[5][23]~47_combout\ : std_logic;
SIGNAL \color[5][23]~q\ : std_logic;
SIGNAL \color[4][23]~feeder_combout\ : std_logic;
SIGNAL \color[4][23]~q\ : std_logic;
SIGNAL \color[3][23]~33_combout\ : std_logic;
SIGNAL \color[3][23]~q\ : std_logic;
SIGNAL \vc|sram_dq_out[14]~45_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[14]~46_combout\ : std_logic;
SIGNAL \vc|sram_dq_out[14]~47_combout\ : std_logic;
SIGNAL \dc|v|col_counter|Q[6]~23_combout\ : std_logic;
SIGNAL \dc|v|HS~0_combout\ : std_logic;
SIGNAL \dc|v|HS~1_combout\ : std_logic;
SIGNAL \dc|v|VS~0_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q~9_combout\ : std_logic;
SIGNAL \dc|v|VS~2_combout\ : std_logic;
SIGNAL \pl|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ : std_logic;
SIGNAL \pl|altpll_component|auto_generated|pll_lock_sync~q\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \pl|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \pl|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \clk_50MHz~combout\ : std_logic;
SIGNAL \clk_50MHz~clkctrl_outclk\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \dc|Equal0~1_combout\ : std_logic;
SIGNAL \dc|Add5~2_combout\ : std_logic;
SIGNAL \dc|Add5~0_combout\ : std_logic;
SIGNAL \dc|storing_addr_next[0]~0_combout\ : std_logic;
SIGNAL \dc|Add5~3_combout\ : std_logic;
SIGNAL \dc|Add5~1\ : std_logic;
SIGNAL \dc|Add5~4_combout\ : std_logic;
SIGNAL \dc|storing_addr[1]~9_combout\ : std_logic;
SIGNAL \dc|vram_re~_wirecell_combout\ : std_logic;
SIGNAL \dc|storing~q\ : std_logic;
SIGNAL \dc|Add5~6_combout\ : std_logic;
SIGNAL \dc|storing_addr[1]~10\ : std_logic;
SIGNAL \dc|storing_addr[2]~11_combout\ : std_logic;
SIGNAL \dc|Add5~9_combout\ : std_logic;
SIGNAL \dc|storing_addr[2]~12\ : std_logic;
SIGNAL \dc|storing_addr[3]~13_combout\ : std_logic;
SIGNAL \dc|Add5~5\ : std_logic;
SIGNAL \dc|Add5~8\ : std_logic;
SIGNAL \dc|Add5~10_combout\ : std_logic;
SIGNAL \dc|Add5~12_combout\ : std_logic;
SIGNAL \dc|Add5~11\ : std_logic;
SIGNAL \dc|Add5~13_combout\ : std_logic;
SIGNAL \dc|storing_addr[3]~14\ : std_logic;
SIGNAL \dc|storing_addr[4]~15_combout\ : std_logic;
SIGNAL \dc|Add5~15_combout\ : std_logic;
SIGNAL \dc|Add5~14\ : std_logic;
SIGNAL \dc|Add5~16_combout\ : std_logic;
SIGNAL \dc|storing_addr[4]~16\ : std_logic;
SIGNAL \dc|storing_addr[5]~17_combout\ : std_logic;
SIGNAL \dc|Add5~18_combout\ : std_logic;
SIGNAL \dc|Add5~17\ : std_logic;
SIGNAL \dc|Add5~19_combout\ : std_logic;
SIGNAL \dc|Add5~21_combout\ : std_logic;
SIGNAL \dc|Add5~20\ : std_logic;
SIGNAL \dc|Add5~22_combout\ : std_logic;
SIGNAL \dc|storing_addr[5]~18\ : std_logic;
SIGNAL \dc|storing_addr[6]~20\ : std_logic;
SIGNAL \dc|storing_addr[7]~21_combout\ : std_logic;
SIGNAL \dc|Add5~24_combout\ : std_logic;
SIGNAL \dc|storing_addr[7]~22\ : std_logic;
SIGNAL \dc|storing_addr[8]~23_combout\ : std_logic;
SIGNAL \dc|Add5~23\ : std_logic;
SIGNAL \dc|Add5~25_combout\ : std_logic;
SIGNAL \dc|Add5~27_combout\ : std_logic;
SIGNAL \dc|storing_addr[8]~24\ : std_logic;
SIGNAL \dc|storing_addr[9]~25_combout\ : std_logic;
SIGNAL \dc|Add5~26\ : std_logic;
SIGNAL \dc|Add5~28_combout\ : std_logic;
SIGNAL \dc|Add5~30_combout\ : std_logic;
SIGNAL \dc|storing_color[3]~feeder_combout\ : std_logic;
SIGNAL \dc|storing_color[4]~feeder_combout\ : std_logic;
SIGNAL \SRAM_DQ[2]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[2]~feeder_combout\ : std_logic;
SIGNAL \dc|storing_color_next[5]~2_combout\ : std_logic;
SIGNAL \dc|storing_color[5]~feeder_combout\ : std_logic;
SIGNAL \SRAM_DQ[3]~input_o\ : std_logic;
SIGNAL \dc|storing_color_next[6]~3_combout\ : std_logic;
SIGNAL \dc|storing_color[6]~feeder_combout\ : std_logic;
SIGNAL \SRAM_DQ[4]~input_o\ : std_logic;
SIGNAL \dc|storing_color_next[7]~4_combout\ : std_logic;
SIGNAL \dc|storing_color[7]~feeder_combout\ : std_logic;
SIGNAL \dc|flag~0_combout\ : std_logic;
SIGNAL \dc|flag~q\ : std_logic;
SIGNAL \dc|Add1~0_combout\ : std_logic;
SIGNAL \dc|VGA_R~0_combout\ : std_logic;
SIGNAL \dc|VGA_R~1_combout\ : std_logic;
SIGNAL \dc|VGA_R~2_combout\ : std_logic;
SIGNAL \SRAM_DQ[0]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[0]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_R~3_combout\ : std_logic;
SIGNAL \SRAM_DQ[1]~input_o\ : std_logic;
SIGNAL \dc|VGA_R~4_combout\ : std_logic;
SIGNAL \dc|VGA_R~5_combout\ : std_logic;
SIGNAL \dc|VGA_R~6_combout\ : std_logic;
SIGNAL \dc|VGA_R~7_combout\ : std_logic;
SIGNAL \dc|VGA_G~0_combout\ : std_logic;
SIGNAL \SRAM_DQ[5]~input_o\ : std_logic;
SIGNAL \dc|storing_color_next[11]~5_combout\ : std_logic;
SIGNAL \dc|storing_color[11]~feeder_combout\ : std_logic;
SIGNAL \SRAM_DQ[6]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[6]~feeder_combout\ : std_logic;
SIGNAL \dc|storing_color_next[12]~6_combout\ : std_logic;
SIGNAL \dc|storing_color[12]~feeder_combout\ : std_logic;
SIGNAL \dc|storing_color[13]~feeder_combout\ : std_logic;
SIGNAL \dc|storing_color[14]~feeder_combout\ : std_logic;
SIGNAL \SRAM_DQ[9]~input_o\ : std_logic;
SIGNAL \dc|storing_color_next[15]~9_combout\ : std_logic;
SIGNAL \dc|storing_color[15]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_G~1_combout\ : std_logic;
SIGNAL \dc|VGA_G~2_combout\ : std_logic;
SIGNAL \dc|VGA_G~3_combout\ : std_logic;
SIGNAL \dc|VGA_G~4_combout\ : std_logic;
SIGNAL \SRAM_DQ[7]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[7]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_G~5_combout\ : std_logic;
SIGNAL \SRAM_DQ[8]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[8]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_G~6_combout\ : std_logic;
SIGNAL \dc|VGA_G~7_combout\ : std_logic;
SIGNAL \dc|VGA_B~0_combout\ : std_logic;
SIGNAL \dc|VGA_B~1_combout\ : std_logic;
SIGNAL \dc|storing_color_next[19]~10_combout\ : std_logic;
SIGNAL \dc|storing_color[20]~feeder_combout\ : std_logic;
SIGNAL \SRAM_DQ[12]~input_o\ : std_logic;
SIGNAL \dc|storing_color_next[21]~12_combout\ : std_logic;
SIGNAL \dc|storing_color[21]~feeder_combout\ : std_logic;
SIGNAL \dc|storing_color[22]~feeder_combout\ : std_logic;
SIGNAL \dc|storing_color[23]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_B~2_combout\ : std_logic;
SIGNAL \SRAM_DQ[10]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[10]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_B~3_combout\ : std_logic;
SIGNAL \SRAM_DQ[11]~input_o\ : std_logic;
SIGNAL \dc|VGA_B~4_combout\ : std_logic;
SIGNAL \dc|VGA_B~5_combout\ : std_logic;
SIGNAL \SRAM_DQ[13]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[13]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_B~6_combout\ : std_logic;
SIGNAL \SRAM_DQ[14]~input_o\ : std_logic;
SIGNAL \vc|VGA_data_hold[14]~feeder_combout\ : std_logic;
SIGNAL \dc|VGA_B~7_combout\ : std_logic;
SIGNAL \pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \clk_100MHz~combout\ : std_logic;
SIGNAL \clk_100MHz~clkctrl_outclk\ : std_logic;
SIGNAL \vc|GPU_data_out[0]~feeder_combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \vc|GPU_data_ld~0_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[2]~feeder_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[5]~feeder_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[6]~feeder_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[7]~feeder_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[8]~feeder_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[10]~feeder_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[13]~feeder_combout\ : std_logic;
SIGNAL \vc|GPU_data_out[14]~feeder_combout\ : std_logic;
SIGNAL \SRAM_DQ[15]~input_o\ : std_logic;
SIGNAL \vc|SRAM_OE_N~0_combout\ : std_logic;
SIGNAL \dc|dis_h_hold[5]~feeder_combout\ : std_logic;
SIGNAL \dc|int_x[0]~10_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[0]~2_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[0]~3_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[1]~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14_combout\ : std_logic;
SIGNAL \dc|Add0~0_combout\ : std_logic;
SIGNAL \dc|Add0~2_combout\ : std_logic;
SIGNAL \dc|Add0~1\ : std_logic;
SIGNAL \dc|Add0~3_combout\ : std_logic;
SIGNAL \dc|Add0~5_combout\ : std_logic;
SIGNAL \dc|Add0~4\ : std_logic;
SIGNAL \dc|Add0~6_combout\ : std_logic;
SIGNAL \dc|Add0~8_combout\ : std_logic;
SIGNAL \dc|Add0~7\ : std_logic;
SIGNAL \dc|Add0~9_combout\ : std_logic;
SIGNAL \dc|Add0~11_combout\ : std_logic;
SIGNAL \dc|Add0~10\ : std_logic;
SIGNAL \dc|Add0~12_combout\ : std_logic;
SIGNAL \dc|Add0~14_combout\ : std_logic;
SIGNAL \dc|Add0~13\ : std_logic;
SIGNAL \dc|Add0~15_combout\ : std_logic;
SIGNAL \dc|Add0~17_combout\ : std_logic;
SIGNAL \dc|Add0~16\ : std_logic;
SIGNAL \dc|Add0~18_combout\ : std_logic;
SIGNAL \dc|Add0~20_combout\ : std_logic;
SIGNAL \dc|Add0~19\ : std_logic;
SIGNAL \dc|Add0~21_combout\ : std_logic;
SIGNAL \dc|Add0~23_combout\ : std_logic;
SIGNAL \dc|Add0~22\ : std_logic;
SIGNAL \dc|Add0~24_combout\ : std_logic;
SIGNAL \dc|Add0~26_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~DATAOUT19\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~10\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~11\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~12\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~13\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~14\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_mult1~15\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT19\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT17\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[10]~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[240]~197_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[239]~198_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[238]~200_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT16\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[237]~202_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[10]~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[247]~346_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[235]~214_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[235]~213_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[247]~215_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[251]~204_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT15\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[10]~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[262]~292_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[261]~211_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[236]~207_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[236]~208_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[10]~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[246]~347_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[258]~299_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT13\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[234]~220_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[234]~221_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[246]~222_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[258]~223_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[270]~224_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[273]~296_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[284]~301_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[283]~226_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[282]~227_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT12\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[233]~228_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[233]~229_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[245]~230_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[245]~348_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[257]~231_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[257]~304_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[269]~305_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[295]~307_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[293]~236_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[244]~349_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[232]~238_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[244]~239_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[256]~310_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[268]~311_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[268]~241_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[280]~312_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[305]~245_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \dc|mult_x[10]~feeder_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[231]~248_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[231]~249_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[243]~250_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[255]~350_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[267]~317_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[255]~251_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[267]~252_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~14_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[279]~318_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[291]~319_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~4_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~2_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[306]~314_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[317]~256_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[315]~258_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[314]~267_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~8_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[328]~268_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[327]~269_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~0_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[326]~270_combout\ : std_logic;
SIGNAL \dc|Mult0|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \dc|mult_x[8]~feeder_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[277]~352_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[253]~272_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[253]~273_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[265]~274_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[265]~271_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_17~18_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[277]~275_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_18~16_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[289]~276_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[289]~331_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_19~14_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[301]~277_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_20~12_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[313]~278_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[313]~333_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_21~10_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|StageOut[325]~279_combout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~1\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~3\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~5\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~7_cout\ : std_logic;
SIGNAL \dc|Div0|auto_generated|divider|divider|op_23~8_combout\ : std_logic;
SIGNAL \dc|int_x[0]~11\ : std_logic;
SIGNAL \dc|int_x[1]~12_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[1]~5_combout\ : std_logic;
SIGNAL \dc|int_x[1]~13\ : std_logic;
SIGNAL \dc|int_x[2]~14_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[2]~6_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[2]~7_combout\ : std_logic;
SIGNAL \dc|int_x[2]~15\ : std_logic;
SIGNAL \dc|int_x[3]~16_combout\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \Add2~17_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[3]~8_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[3]~9_combout\ : std_logic;
SIGNAL \dc|int_x[3]~17\ : std_logic;
SIGNAL \dc|int_x[4]~18_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[4]~10_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[4]~11_combout\ : std_logic;
SIGNAL \dc|int_x[4]~19\ : std_logic;
SIGNAL \dc|int_x[5]~20_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[5]~12_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[5]~13_combout\ : std_logic;
SIGNAL \dc|int_x[5]~21\ : std_logic;
SIGNAL \dc|int_x[6]~22_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[6]~14_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[6]~15_combout\ : std_logic;
SIGNAL \dc|int_x[6]~23\ : std_logic;
SIGNAL \dc|int_x[7]~24_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[7]~16_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[7]~17_combout\ : std_logic;
SIGNAL \dc|int_x[7]~25\ : std_logic;
SIGNAL \dc|int_x[8]~26_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[8]~18_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[8]~19_combout\ : std_logic;
SIGNAL \dc|int_x[8]~27\ : std_logic;
SIGNAL \dc|int_x[9]~28_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[9]~20_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[9]~21_combout\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \Add1~21_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[10]~22_combout\ : std_logic;
SIGNAL \dc|int_y[0]~9_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[10]~23_combout\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[11]~24_combout\ : std_logic;
SIGNAL \dc|Add1~1\ : std_logic;
SIGNAL \dc|Add1~2_combout\ : std_logic;
SIGNAL \dc|Add1~3\ : std_logic;
SIGNAL \dc|Add1~4_combout\ : std_logic;
SIGNAL \dc|Equal2~1_combout\ : std_logic;
SIGNAL \dc|Equal2~2_combout\ : std_logic;
SIGNAL \dc|Add1~5\ : std_logic;
SIGNAL \dc|Add1~6_combout\ : std_logic;
SIGNAL \dc|Add1~7\ : std_logic;
SIGNAL \dc|Add1~8_combout\ : std_logic;
SIGNAL \dc|Add1~9\ : std_logic;
SIGNAL \dc|Add1~10_combout\ : std_logic;
SIGNAL \dc|Add1~11\ : std_logic;
SIGNAL \dc|Add1~12_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Add0~14_combout\ : std_logic;
SIGNAL \dc|v|row_counter|Q[7]~6_combout\ : std_logic;
SIGNAL \dc|Add1~13\ : std_logic;
SIGNAL \dc|Add1~14_combout\ : std_logic;
SIGNAL \dc|Add1~15\ : std_logic;
SIGNAL \dc|Add1~16_combout\ : std_logic;
SIGNAL \dc|Add1~17\ : std_logic;
SIGNAL \dc|Add1~18_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~10\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~11\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~12\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~13\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~14\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~15\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_mult1~16\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT18\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT17\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[9]~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[218]~208_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[217]~211_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT16\ : std_logic;
SIGNAL \dc|mult_y[16]~feeder_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[216]~212_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[215]~215_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT14\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[214]~217_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[9]~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[228]~218_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[227]~219_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[225]~221_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT13\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[9]~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[238]~297_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[237]~223_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[236]~224_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT12\ : std_logic;
SIGNAL \dc|mult_y[12]~feeder_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[223]~349_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[9]~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[248]~229_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[246]~231_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[245]~233_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[211]~234_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \dc|mult_y[11]~feeder_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[211]~235_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[222]~236_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[222]~350_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[233]~304_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[9]~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[258]~307_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[257]~238_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[256]~239_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[255]~241_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \dc|mult_y[10]~feeder_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[210]~243_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[210]~244_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[221]~245_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[221]~242_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[232]~246_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[232]~351_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[243]~310_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[9]~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[268]~313_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[266]~249_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[265]~251_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[220]~254_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[220]~253_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[242]~352_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[231]~255_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[231]~252_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[253]~316_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[278]~319_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_19~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[276]~259_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[242]~256_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[241]~262_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[230]~264_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[230]~263_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[241]~265_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[252]~353_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[263]~322_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~6_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[288]~267_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~2_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[286]~269_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_20~0_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[285]~271_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \dc|mult_y[7]~feeder_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[251]~272_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[240]~273_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[240]~274_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[251]~275_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[262]~354_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[273]~328_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~10_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[298]~331_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_21~4_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[297]~278_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\ : std_logic;
SIGNAL \dc|Mult1|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[250]~284_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[250]~283_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[272]~355_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[283]~334_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~1\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~3\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~5\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~7\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~9_cout\ : std_logic;
SIGNAL \dc|Div1|auto_generated|divider|divider|op_23~10_combout\ : std_logic;
SIGNAL \dc|int_y[0]~10\ : std_logic;
SIGNAL \dc|int_y[1]~11_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[11]~25_combout\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[12]~26_combout\ : std_logic;
SIGNAL \dc|int_y[1]~12\ : std_logic;
SIGNAL \dc|int_y[2]~13_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[12]~27_combout\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \w_y[3]~7_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[13]~28_combout\ : std_logic;
SIGNAL \dc|int_y[2]~14\ : std_logic;
SIGNAL \dc|int_y[3]~15_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[13]~29_combout\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[14]~30_combout\ : std_logic;
SIGNAL \dc|int_y[3]~16\ : std_logic;
SIGNAL \dc|int_y[4]~17_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[14]~31_combout\ : std_logic;
SIGNAL \dc|int_y[4]~18\ : std_logic;
SIGNAL \dc|int_y[5]~19_combout\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[15]~32_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[15]~33_combout\ : std_logic;
SIGNAL \dc|int_y[5]~20\ : std_logic;
SIGNAL \dc|int_y[6]~21_combout\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[16]~34_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[16]~35_combout\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \vc|SRAM_ADDR[17]~36_combout\ : std_logic;
SIGNAL \dc|int_y[6]~22\ : std_logic;
SIGNAL \dc|int_y[7]~23_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[17]~37_combout\ : std_logic;
SIGNAL \dc|int_y[7]~24\ : std_logic;
SIGNAL \dc|int_y[8]~25_combout\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \w_y[8]~2_combout\ : std_logic;
SIGNAL \vc|SRAM_ADDR[18]~38_combout\ : std_logic;
SIGNAL w_y : std_logic_vector(9 DOWNTO 0);
SIGNAL w_x : std_logic_vector(9 DOWNTO 0);
SIGNAL count : std_logic_vector(26 DOWNTO 0);
SIGNAL \vc|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \vc|VGA_data_hold\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \vc|GPU_data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \dc|storing_color\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \dc|storing_addr\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|mult_y\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dc|mult_x\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dc|int_y\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|int_x\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|dis_h_hold\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|v|row_counter|Q\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \dc|v|col_counter|Q\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dc|rh|altsyncram_component|auto_generated|q_a\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \pl|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;
SIGNAL \vc|ALT_INV_SRAM_ADDR[18]~39_combout\ : std_logic;
SIGNAL \ALT_INV_clk_50MHz~combout\ : std_logic;
SIGNAL \dc|ALT_INV_vram_re~combout\ : std_logic;
SIGNAL \dc|ALT_INV_blk~0_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
VGA_BLANK_N <= ww_VGA_BLANK_N;
VGA_SYNC_N <= ww_VGA_SYNC_N;
VGA_CLK <= ww_VGA_CLK;
VGA_R <= ww_VGA_R;
VGA_G <= ww_VGA_G;
VGA_B <= ww_VGA_B;
LEDR <= ww_LEDR;
SRAM_CE_N <= ww_SRAM_CE_N;
SRAM_OE_N <= ww_SRAM_OE_N;
SRAM_WE_N <= ww_SRAM_WE_N;
SRAM_LB_N <= ww_SRAM_LB_N;
SRAM_UB_N <= ww_SRAM_UB_N;
SRAM_ADDR <= ww_SRAM_ADDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\~GND~combout\ & \dc|storing_color\(7) & \dc|storing_color\(6) & \dc|storing_color\(5) & \dc|storing_color\(4) & \dc|storing_color\(3) & \~GND~combout\ & \~GND~combout\
& \~GND~combout\);

\dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\dc|Add5~30_combout\ & \dc|Add5~27_combout\ & \dc|Add5~24_combout\ & \dc|Add5~21_combout\ & \dc|Add5~18_combout\ & \dc|Add5~15_combout\ & \dc|Add5~12_combout\ & \dc|Add5~9_combout\
& \dc|Add5~6_combout\ & \dc|Add5~3_combout\);

\dc|rh|altsyncram_component|auto_generated|q_a\(0) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\dc|rh|altsyncram_component|auto_generated|q_a\(1) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\dc|rh|altsyncram_component|auto_generated|q_a\(2) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\dc|rh|altsyncram_component|auto_generated|q_a\(3) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\dc|rh|altsyncram_component|auto_generated|q_a\(4) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\dc|rh|altsyncram_component|auto_generated|q_a\(5) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\dc|rh|altsyncram_component|auto_generated|q_a\(6) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\dc|rh|altsyncram_component|auto_generated|q_a\(7) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\dc|rh|altsyncram_component|auto_generated|q_a\(8) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);

\dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\ <= (\~GND~combout\ & \~GND~combout\ & \dc|storing_color\(15) & \dc|storing_color\(14) & \dc|storing_color\(13) & \dc|storing_color\(12) & \dc|storing_color\(11) & \~GND~combout\
& \~GND~combout\);

\dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\dc|Add5~30_combout\ & \dc|Add5~27_combout\ & \dc|Add5~24_combout\ & \dc|Add5~21_combout\ & \dc|Add5~18_combout\ & \dc|Add5~15_combout\ & \dc|Add5~12_combout\ & \dc|Add5~9_combout\
& \dc|Add5~6_combout\ & \dc|Add5~3_combout\);

\dc|rh|altsyncram_component|auto_generated|q_a\(9) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);
\dc|rh|altsyncram_component|auto_generated|q_a\(10) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(1);
\dc|rh|altsyncram_component|auto_generated|q_a\(11) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(2);
\dc|rh|altsyncram_component|auto_generated|q_a\(12) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(3);
\dc|rh|altsyncram_component|auto_generated|q_a\(13) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(4);
\dc|rh|altsyncram_component|auto_generated|q_a\(14) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(5);
\dc|rh|altsyncram_component|auto_generated|q_a\(15) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(6);
\dc|rh|altsyncram_component|auto_generated|q_a\(16) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(7);
\dc|rh|altsyncram_component|auto_generated|q_a\(17) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(8);

\dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\ <= (gnd & gnd & gnd & \dc|storing_color\(23) & \dc|storing_color\(22) & \dc|storing_color\(21) & \dc|storing_color\(20) & \dc|storing_color\(19) & \~GND~combout\);

\dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (\dc|Add5~30_combout\ & \dc|Add5~27_combout\ & \dc|Add5~24_combout\ & \dc|Add5~21_combout\ & \dc|Add5~18_combout\ & \dc|Add5~15_combout\ & \dc|Add5~12_combout\ & 
\dc|Add5~9_combout\ & \dc|Add5~6_combout\ & \dc|Add5~3_combout\);

\dc|rh|altsyncram_component|auto_generated|q_a\(18) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(0);
\dc|rh|altsyncram_component|auto_generated|q_a\(19) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(1);
\dc|rh|altsyncram_component|auto_generated|q_a\(20) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(2);
\dc|rh|altsyncram_component|auto_generated|q_a\(21) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(3);
\dc|rh|altsyncram_component|auto_generated|q_a\(22) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(4);
\dc|rh|altsyncram_component|auto_generated|q_a\(23) <= \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(5);

\pl|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\pl|altpll_component|auto_generated|wire_pll1_clk\(0) <= \pl|altpll_component|auto_generated|pll1_CLK_bus\(0);
\pl|altpll_component|auto_generated|wire_pll1_clk\(1) <= \pl|altpll_component|auto_generated|pll1_CLK_bus\(1);
\pl|altpll_component|auto_generated|wire_pll1_clk\(2) <= \pl|altpll_component|auto_generated|pll1_CLK_bus\(2);
\pl|altpll_component|auto_generated|wire_pll1_clk\(3) <= \pl|altpll_component|auto_generated|pll1_CLK_bus\(3);
\pl|altpll_component|auto_generated|wire_pll1_clk\(4) <= \pl|altpll_component|auto_generated|pll1_CLK_bus\(4);

\dc|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\dc|Mult0|auto_generated|mac_mult1~DATAOUT19\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT18\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT17\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT16\ & 
\dc|Mult0|auto_generated|mac_mult1~DATAOUT15\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT14\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT13\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT12\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT11\ & 
\dc|Mult0|auto_generated|mac_mult1~DATAOUT10\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT9\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT7\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT6\ & 
\dc|Mult0|auto_generated|mac_mult1~DATAOUT5\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT4\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT3\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT2\ & \dc|Mult0|auto_generated|mac_mult1~DATAOUT1\ & 
\dc|Mult0|auto_generated|mac_mult1~dataout\ & \dc|Mult0|auto_generated|mac_mult1~15\ & \dc|Mult0|auto_generated|mac_mult1~14\ & \dc|Mult0|auto_generated|mac_mult1~13\ & \dc|Mult0|auto_generated|mac_mult1~12\ & \dc|Mult0|auto_generated|mac_mult1~11\ & 
\dc|Mult0|auto_generated|mac_mult1~10\ & \dc|Mult0|auto_generated|mac_mult1~9\ & \dc|Mult0|auto_generated|mac_mult1~8\ & \dc|Mult0|auto_generated|mac_mult1~7\ & \dc|Mult0|auto_generated|mac_mult1~6\ & \dc|Mult0|auto_generated|mac_mult1~5\ & 
\dc|Mult0|auto_generated|mac_mult1~4\ & \dc|Mult0|auto_generated|mac_mult1~3\ & \dc|Mult0|auto_generated|mac_mult1~2\ & \dc|Mult0|auto_generated|mac_mult1~1\ & \dc|Mult0|auto_generated|mac_mult1~0\);

\dc|Mult0|auto_generated|mac_out2~0\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\dc|Mult0|auto_generated|mac_out2~1\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\dc|Mult0|auto_generated|mac_out2~2\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\dc|Mult0|auto_generated|mac_out2~3\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\dc|Mult0|auto_generated|mac_out2~4\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\dc|Mult0|auto_generated|mac_out2~5\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\dc|Mult0|auto_generated|mac_out2~6\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\dc|Mult0|auto_generated|mac_out2~7\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\dc|Mult0|auto_generated|mac_out2~8\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\dc|Mult0|auto_generated|mac_out2~9\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\dc|Mult0|auto_generated|mac_out2~10\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\dc|Mult0|auto_generated|mac_out2~11\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\dc|Mult0|auto_generated|mac_out2~12\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\dc|Mult0|auto_generated|mac_out2~13\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\dc|Mult0|auto_generated|mac_out2~14\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\dc|Mult0|auto_generated|mac_out2~15\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\dc|Mult0|auto_generated|mac_out2~dataout\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\dc|Mult0|auto_generated|mac_out2~DATAOUT1\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);
\dc|Mult0|auto_generated|mac_out2~DATAOUT2\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(18);
\dc|Mult0|auto_generated|mac_out2~DATAOUT3\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(19);
\dc|Mult0|auto_generated|mac_out2~DATAOUT4\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(20);
\dc|Mult0|auto_generated|mac_out2~DATAOUT5\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(21);
\dc|Mult0|auto_generated|mac_out2~DATAOUT6\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(22);
\dc|Mult0|auto_generated|mac_out2~DATAOUT7\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(23);
\dc|Mult0|auto_generated|mac_out2~DATAOUT8\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(24);
\dc|Mult0|auto_generated|mac_out2~DATAOUT9\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(25);
\dc|Mult0|auto_generated|mac_out2~DATAOUT10\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(26);
\dc|Mult0|auto_generated|mac_out2~DATAOUT11\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(27);
\dc|Mult0|auto_generated|mac_out2~DATAOUT12\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(28);
\dc|Mult0|auto_generated|mac_out2~DATAOUT13\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(29);
\dc|Mult0|auto_generated|mac_out2~DATAOUT14\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(30);
\dc|Mult0|auto_generated|mac_out2~DATAOUT15\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(31);
\dc|Mult0|auto_generated|mac_out2~DATAOUT16\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(32);
\dc|Mult0|auto_generated|mac_out2~DATAOUT17\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(33);
\dc|Mult0|auto_generated|mac_out2~DATAOUT18\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(34);
\dc|Mult0|auto_generated|mac_out2~DATAOUT19\ <= \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\(35);

\dc|Mult1|auto_generated|mac_out2_DATAA_bus\ <= (\dc|Mult1|auto_generated|mac_mult1~DATAOUT18\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT17\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT16\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT15\ & 
\dc|Mult1|auto_generated|mac_mult1~DATAOUT14\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT13\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT12\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT11\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT10\ & 
\dc|Mult1|auto_generated|mac_mult1~DATAOUT9\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT8\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT7\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT6\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT5\ & 
\dc|Mult1|auto_generated|mac_mult1~DATAOUT4\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT3\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT2\ & \dc|Mult1|auto_generated|mac_mult1~DATAOUT1\ & \dc|Mult1|auto_generated|mac_mult1~dataout\ & 
\dc|Mult1|auto_generated|mac_mult1~16\ & \dc|Mult1|auto_generated|mac_mult1~15\ & \dc|Mult1|auto_generated|mac_mult1~14\ & \dc|Mult1|auto_generated|mac_mult1~13\ & \dc|Mult1|auto_generated|mac_mult1~12\ & \dc|Mult1|auto_generated|mac_mult1~11\ & 
\dc|Mult1|auto_generated|mac_mult1~10\ & \dc|Mult1|auto_generated|mac_mult1~9\ & \dc|Mult1|auto_generated|mac_mult1~8\ & \dc|Mult1|auto_generated|mac_mult1~7\ & \dc|Mult1|auto_generated|mac_mult1~6\ & \dc|Mult1|auto_generated|mac_mult1~5\ & 
\dc|Mult1|auto_generated|mac_mult1~4\ & \dc|Mult1|auto_generated|mac_mult1~3\ & \dc|Mult1|auto_generated|mac_mult1~2\ & \dc|Mult1|auto_generated|mac_mult1~1\ & \dc|Mult1|auto_generated|mac_mult1~0\);

\dc|Mult1|auto_generated|mac_out2~0\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(0);
\dc|Mult1|auto_generated|mac_out2~1\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(1);
\dc|Mult1|auto_generated|mac_out2~2\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(2);
\dc|Mult1|auto_generated|mac_out2~3\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(3);
\dc|Mult1|auto_generated|mac_out2~4\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(4);
\dc|Mult1|auto_generated|mac_out2~5\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(5);
\dc|Mult1|auto_generated|mac_out2~6\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(6);
\dc|Mult1|auto_generated|mac_out2~7\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(7);
\dc|Mult1|auto_generated|mac_out2~8\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(8);
\dc|Mult1|auto_generated|mac_out2~9\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(9);
\dc|Mult1|auto_generated|mac_out2~10\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(10);
\dc|Mult1|auto_generated|mac_out2~11\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(11);
\dc|Mult1|auto_generated|mac_out2~12\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(12);
\dc|Mult1|auto_generated|mac_out2~13\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(13);
\dc|Mult1|auto_generated|mac_out2~14\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(14);
\dc|Mult1|auto_generated|mac_out2~15\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(15);
\dc|Mult1|auto_generated|mac_out2~16\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(16);
\dc|Mult1|auto_generated|mac_out2~dataout\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(17);
\dc|Mult1|auto_generated|mac_out2~DATAOUT1\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(18);
\dc|Mult1|auto_generated|mac_out2~DATAOUT2\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(19);
\dc|Mult1|auto_generated|mac_out2~DATAOUT3\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(20);
\dc|Mult1|auto_generated|mac_out2~DATAOUT4\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(21);
\dc|Mult1|auto_generated|mac_out2~DATAOUT5\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(22);
\dc|Mult1|auto_generated|mac_out2~DATAOUT6\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(23);
\dc|Mult1|auto_generated|mac_out2~DATAOUT7\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(24);
\dc|Mult1|auto_generated|mac_out2~DATAOUT8\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(25);
\dc|Mult1|auto_generated|mac_out2~DATAOUT9\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(26);
\dc|Mult1|auto_generated|mac_out2~DATAOUT10\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(27);
\dc|Mult1|auto_generated|mac_out2~DATAOUT11\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(28);
\dc|Mult1|auto_generated|mac_out2~DATAOUT12\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(29);
\dc|Mult1|auto_generated|mac_out2~DATAOUT13\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(30);
\dc|Mult1|auto_generated|mac_out2~DATAOUT14\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(31);
\dc|Mult1|auto_generated|mac_out2~DATAOUT15\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(32);
\dc|Mult1|auto_generated|mac_out2~DATAOUT16\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(33);
\dc|Mult1|auto_generated|mac_out2~DATAOUT17\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(34);
\dc|Mult1|auto_generated|mac_out2~DATAOUT18\ <= \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\(35);

\dc|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\dc|Add0~26_combout\ & \dc|Add0~23_combout\ & \dc|Add0~20_combout\ & \dc|Add0~17_combout\ & \dc|Add0~14_combout\ & \dc|Add0~11_combout\ & \dc|Add0~8_combout\ & \dc|Add0~5_combout\ & \dc|Add0~2_combout\ & 
\dc|v|col_counter|Q\(1) & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\dc|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (\dc|dis_h_hold\(5) & gnd & \dc|dis_h_hold\(5) & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\dc|Mult0|auto_generated|mac_mult1~0\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\dc|Mult0|auto_generated|mac_mult1~1\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\dc|Mult0|auto_generated|mac_mult1~2\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\dc|Mult0|auto_generated|mac_mult1~3\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\dc|Mult0|auto_generated|mac_mult1~4\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\dc|Mult0|auto_generated|mac_mult1~5\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\dc|Mult0|auto_generated|mac_mult1~6\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\dc|Mult0|auto_generated|mac_mult1~7\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\dc|Mult0|auto_generated|mac_mult1~8\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\dc|Mult0|auto_generated|mac_mult1~9\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\dc|Mult0|auto_generated|mac_mult1~10\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\dc|Mult0|auto_generated|mac_mult1~11\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\dc|Mult0|auto_generated|mac_mult1~12\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\dc|Mult0|auto_generated|mac_mult1~13\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\dc|Mult0|auto_generated|mac_mult1~14\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\dc|Mult0|auto_generated|mac_mult1~15\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\dc|Mult0|auto_generated|mac_mult1~dataout\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(18);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(19);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(20);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(21);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(22);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(23);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(24);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(25);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(26);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(27);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT12\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(28);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT13\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(29);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT14\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(30);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT15\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(31);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT16\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(32);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT17\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(33);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT18\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(34);
\dc|Mult0|auto_generated|mac_mult1~DATAOUT19\ <= \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(35);

\dc|Mult1|auto_generated|mac_mult1_DATAA_bus\ <= (\dc|Add1~18_combout\ & \dc|Add1~16_combout\ & \dc|Add1~14_combout\ & \dc|Add1~12_combout\ & \dc|Add1~10_combout\ & \dc|Add1~8_combout\ & \dc|Add1~6_combout\ & \dc|Add1~4_combout\ & \dc|Add1~2_combout\ & 
\dc|Add1~0_combout\ & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\dc|Mult1|auto_generated|mac_mult1_DATAB_bus\ <= (\dc|dis_h_hold\(5) & \dc|dis_h_hold\(5) & \dc|dis_h_hold\(5) & \dc|dis_h_hold\(5) & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\dc|Mult1|auto_generated|mac_mult1~0\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(0);
\dc|Mult1|auto_generated|mac_mult1~1\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(1);
\dc|Mult1|auto_generated|mac_mult1~2\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(2);
\dc|Mult1|auto_generated|mac_mult1~3\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(3);
\dc|Mult1|auto_generated|mac_mult1~4\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(4);
\dc|Mult1|auto_generated|mac_mult1~5\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(5);
\dc|Mult1|auto_generated|mac_mult1~6\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(6);
\dc|Mult1|auto_generated|mac_mult1~7\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(7);
\dc|Mult1|auto_generated|mac_mult1~8\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(8);
\dc|Mult1|auto_generated|mac_mult1~9\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(9);
\dc|Mult1|auto_generated|mac_mult1~10\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(10);
\dc|Mult1|auto_generated|mac_mult1~11\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(11);
\dc|Mult1|auto_generated|mac_mult1~12\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(12);
\dc|Mult1|auto_generated|mac_mult1~13\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(13);
\dc|Mult1|auto_generated|mac_mult1~14\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(14);
\dc|Mult1|auto_generated|mac_mult1~15\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(15);
\dc|Mult1|auto_generated|mac_mult1~16\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(16);
\dc|Mult1|auto_generated|mac_mult1~dataout\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(17);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT1\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(18);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT2\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(19);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT3\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(20);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT4\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(21);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT5\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(22);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT6\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(23);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT7\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(24);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT8\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(25);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT9\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(26);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT10\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(27);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT11\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(28);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT12\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(29);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT13\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(30);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT14\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(31);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT15\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(32);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT16\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(33);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT17\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(34);
\dc|Mult1|auto_generated|mac_mult1~DATAOUT18\ <= \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(35);

\pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \pl|altpll_component|auto_generated|wire_pll1_clk\(1));

\pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \pl|altpll_component|auto_generated|wire_pll1_clk\(0));

\clk_50MHz~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50MHz~combout\);

\clk_33MHz~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_33MHz~combout\);

\clk_100MHz~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_100MHz~combout\);
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;
\vc|ALT_INV_SRAM_ADDR[18]~39_combout\ <= NOT \vc|SRAM_ADDR[18]~39_combout\;
\ALT_INV_clk_50MHz~combout\ <= NOT \clk_50MHz~combout\;
\dc|ALT_INV_vram_re~combout\ <= NOT \dc|vram_re~combout\;
\dc|ALT_INV_blk~0_combout\ <= NOT \dc|blk~0_combout\;

-- Location: FF_X31_Y31_N25
\count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[26]~76_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(26));

-- Location: FF_X38_Y36_N11
\dc|v|col_counter|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[0]~11_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(0));

-- Location: LCCOMB_X38_Y36_N10
\dc|v|col_counter|Q[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[0]~11_combout\ = \dc|v|col_counter|Q\(0) $ (VCC)
-- \dc|v|col_counter|Q[0]~12\ = CARRY(\dc|v|col_counter|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(0),
	datad => VCC,
	combout => \dc|v|col_counter|Q[0]~11_combout\,
	cout => \dc|v|col_counter|Q[0]~12\);

-- Location: LCCOMB_X41_Y36_N10
\dc|v|row_counter|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~0_combout\ = \dc|v|row_counter|Q\(0) $ (VCC)
-- \dc|v|row_counter|Add0~1\ = CARRY(\dc|v|row_counter|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(0),
	datad => VCC,
	combout => \dc|v|row_counter|Add0~0_combout\,
	cout => \dc|v|row_counter|Add0~1\);

-- Location: LCCOMB_X41_Y36_N12
\dc|v|row_counter|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~2_combout\ = (\dc|v|row_counter|Q\(1) & (!\dc|v|row_counter|Add0~1\)) # (!\dc|v|row_counter|Q\(1) & ((\dc|v|row_counter|Add0~1\) # (GND)))
-- \dc|v|row_counter|Add0~3\ = CARRY((!\dc|v|row_counter|Add0~1\) # (!\dc|v|row_counter|Q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(1),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~1\,
	combout => \dc|v|row_counter|Add0~2_combout\,
	cout => \dc|v|row_counter|Add0~3\);

-- Location: LCCOMB_X41_Y36_N26
\dc|v|row_counter|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~16_combout\ = (\dc|v|row_counter|Q\(8) & (\dc|v|row_counter|Add0~15\ $ (GND))) # (!\dc|v|row_counter|Q\(8) & (!\dc|v|row_counter|Add0~15\ & VCC))
-- \dc|v|row_counter|Add0~17\ = CARRY((\dc|v|row_counter|Q\(8) & !\dc|v|row_counter|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(8),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~15\,
	combout => \dc|v|row_counter|Add0~16_combout\,
	cout => \dc|v|row_counter|Add0~17\);

-- Location: PLL_1
\pl|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 9,
	c0_initial => 1,
	c0_low => 9,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 3,
	c1_initial => 1,
	c1_low => 3,
	c1_mode => "even",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 3,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 2,
	clk0_phase_shift => "0",
	clk1_counter => "c1",
	clk1_divide_by => 1,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 2,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 7101,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => \ALT_INV_KEY[0]~input_o\,
	fbin => \pl|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \pl|altpll_component|auto_generated|pll1_INCLK_bus\,
	locked => \pl|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \pl|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \pl|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: LCCOMB_X39_Y38_N16
\dc|Add5~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~7_combout\ = (\dc|v|col_counter|Q\(3) & (\dc|Add5~5\ $ (GND))) # (!\dc|v|col_counter|Q\(3) & (!\dc|Add5~5\ & VCC))
-- \dc|Add5~8\ = CARRY((\dc|v|col_counter|Q\(3) & !\dc|Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(3),
	datad => VCC,
	cin => \dc|Add5~5\,
	combout => \dc|Add5~7_combout\,
	cout => \dc|Add5~8\);

-- Location: FF_X38_Y38_N11
\dc|storing_addr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[6]~19_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(6));

-- Location: FF_X31_Y32_N31
\count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[13]~50_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(13));

-- Location: FF_X31_Y32_N23
\count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[9]~42_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(9));

-- Location: FF_X31_Y32_N11
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[3]~30_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X31_Y32_N10
\count[3]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[3]~30_combout\ = (count(3) & (\count[2]~29\ $ (GND))) # (!count(3) & (!\count[2]~29\ & VCC))
-- \count[3]~31\ = CARRY((count(3) & !\count[2]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datad => VCC,
	cin => \count[2]~29\,
	combout => \count[3]~30_combout\,
	cout => \count[3]~31\);

-- Location: LCCOMB_X31_Y32_N22
\count[9]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[9]~42_combout\ = (count(9) & (\count[8]~41\ $ (GND))) # (!count(9) & (!\count[8]~41\ & VCC))
-- \count[9]~43\ = CARRY((count(9) & !\count[8]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(9),
	datad => VCC,
	cin => \count[8]~41\,
	combout => \count[9]~42_combout\,
	cout => \count[9]~43\);

-- Location: LCCOMB_X31_Y32_N30
\count[13]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[13]~50_combout\ = (count(13) & (\count[12]~49\ $ (GND))) # (!count(13) & (!\count[12]~49\ & VCC))
-- \count[13]~51\ = CARRY((count(13) & !\count[12]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(13),
	datad => VCC,
	cin => \count[12]~49\,
	combout => \count[13]~50_combout\,
	cout => \count[13]~51\);

-- Location: LCCOMB_X31_Y31_N22
\count[25]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[25]~74_combout\ = (count(25) & (\count[24]~73\ $ (GND))) # (!count(25) & (!\count[24]~73\ & VCC))
-- \count[25]~75\ = CARRY((count(25) & !\count[24]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(25),
	datad => VCC,
	cin => \count[24]~73\,
	combout => \count[25]~74_combout\,
	cout => \count[25]~75\);

-- Location: LCCOMB_X31_Y31_N24
\count[26]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[26]~76_combout\ = count(26) $ (\count[25]~75\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(26),
	cin => \count[25]~75\,
	combout => \count[26]~76_combout\);

-- Location: LCCOMB_X34_Y30_N26
\Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~24_combout\ = (w_x(8) & (\Add2~22\ $ (GND))) # (!w_x(8) & (!\Add2~22\ & VCC))
-- \Add2~25\ = CARRY((w_x(8) & !\Add2~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_x(8),
	datad => VCC,
	cin => \Add2~22\,
	combout => \Add2~24_combout\,
	cout => \Add2~25\);

-- Location: LCCOMB_X43_Y28_N12
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2_combout\ = (\dc|mult_x\(18) & (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~1\ & VCC)) # (!\dc|mult_x\(18) & 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~1\))
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~3\ = CARRY((!\dc|mult_x\(18) & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(18),
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~1\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~3\);

-- Location: LCCOMB_X42_Y28_N8
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10_combout\ = \dc|mult_x\(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|mult_x\(16),
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10_combout\);

-- Location: LCCOMB_X43_Y28_N22
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[237]~203_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[237]~202_combout\)))
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[237]~203_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[237]~202_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[237]~203_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[237]~202_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~1\);

-- Location: LCCOMB_X41_Y28_N14
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[248]~209_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\)))
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[248]~209_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[248]~209_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~1\);

-- Location: LCCOMB_X41_Y28_N18
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~4_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[250]~205_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\)))) # (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[250]~205_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[250]~205_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[250]~205_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~3\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~5\);

-- Location: LCCOMB_X42_Y29_N22
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[259]~216_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\)))
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[259]~216_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[259]~216_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~1\);

-- Location: LCCOMB_X42_Y29_N26
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~4_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[261]~211_combout\)))) # (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[261]~211_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[261]~211_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[261]~211_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~3\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~5\);

-- Location: LCCOMB_X42_Y29_N6
\dc|Div0|auto_generated|divider|divider|op_17~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~4_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[272]~218_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_17~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[272]~218_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|op_17~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_17~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[272]~218_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[272]~218_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_17~3\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_17~5\);

-- Location: LCCOMB_X41_Y29_N12
\dc|Div0|auto_generated|divider|divider|op_17~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[269]~232_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[269]~305_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[269]~232_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[269]~305_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~10_combout\);

-- Location: LCCOMB_X40_Y29_N12
\dc|Div0|auto_generated|divider|divider|op_18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[281]~233_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_18~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[281]~233_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[281]~233_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_18~1\);

-- Location: LCCOMB_X40_Y29_N16
\dc|Div0|auto_generated|divider|divider|op_18~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~4_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[283]~226_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_18~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[283]~226_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|op_18~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_18~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[283]~226_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[283]~226_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_18~3\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_18~5\);

-- Location: LCCOMB_X38_Y29_N6
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[256]~240_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[256]~310_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[256]~240_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[256]~310_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14_combout\);

-- Location: LCCOMB_X38_Y29_N14
\dc|Div0|auto_generated|divider|divider|op_18~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[280]~242_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[280]~312_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[280]~242_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[280]~312_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~10_combout\);

-- Location: LCCOMB_X39_Y29_N18
\dc|Div0|auto_generated|divider|divider|op_19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[292]~243_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_19~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[292]~243_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[292]~243_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_19~1\);

-- Location: LCCOMB_X39_Y29_N22
\dc|Div0|auto_generated|divider|divider|op_19~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~4_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[294]~235_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_19~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[294]~235_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|op_19~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_19~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[294]~235_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[294]~235_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_19~3\,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_19~5\);

-- Location: LCCOMB_X39_Y28_N6
\dc|Div0|auto_generated|divider|divider|op_18~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[279]~318_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[279]~253_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[279]~318_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[279]~253_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~12_combout\);

-- Location: LCCOMB_X39_Y28_N16
\dc|Div0|auto_generated|divider|divider|op_19~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[291]~319_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[291]~254_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[291]~319_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[291]~254_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~10_combout\);

-- Location: LCCOMB_X39_Y29_N4
\dc|Div0|auto_generated|divider|divider|op_20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~2_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[304]~246_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_20~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[304]~246_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_20~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[304]~246_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[304]~246_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_20~1\,
	combout => \dc|Div0|auto_generated|divider|divider|op_20~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_20~3\);

-- Location: LCCOMB_X38_Y30_N20
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[242]~261_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[242]~260_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[242]~261_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[242]~260_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20_combout\);

-- Location: LCCOMB_X39_Y30_N28
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[254]~259_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[254]~262_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[254]~259_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[254]~262_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18_combout\);

-- Location: LCCOMB_X39_Y30_N18
\dc|Div0|auto_generated|divider|divider|op_17~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~16_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[266]~351_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[266]~263_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[266]~351_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[266]~263_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~16_combout\);

-- Location: LCCOMB_X39_Y30_N8
\dc|Div0|auto_generated|divider|divider|op_18~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~14_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[278]~324_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[278]~264_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[278]~324_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[278]~264_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~14_combout\);

-- Location: LCCOMB_X39_Y30_N22
\dc|Div0|auto_generated|divider|divider|op_19~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[290]~325_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[290]~265_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[290]~325_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[290]~265_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~12_combout\);

-- Location: LCCOMB_X39_Y30_N12
\dc|Div0|auto_generated|divider|divider|op_20~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[302]~326_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[302]~266_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[302]~326_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[302]~266_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_20~10_combout\);

-- Location: LCCOMB_X40_Y30_N6
\dc|Div0|auto_generated|divider|divider|op_21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_21~2_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[315]~258_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_21~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[315]~258_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_21~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[315]~258_combout\ & !\dc|Div0|auto_generated|divider|divider|op_21~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[315]~258_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_21~1\,
	combout => \dc|Div0|auto_generated|divider|divider|op_21~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_21~3\);

-- Location: LCCOMB_X40_Y30_N8
\dc|Div0|auto_generated|divider|divider|op_21~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_21~4_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[316]~257_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_21~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[316]~257_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|op_21~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_21~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[316]~257_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[316]~257_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_21~3\,
	combout => \dc|Div0|auto_generated|divider|divider|op_21~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_21~5\);

-- Location: LCCOMB_X41_Y30_N12
\dc|Div0|auto_generated|divider|divider|op_23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_23~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[325]~279_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_23~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[325]~279_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[325]~279_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|op_23~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_23~1\);

-- Location: LCCOMB_X41_Y30_N14
\dc|Div0|auto_generated|divider|divider|op_23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_23~2_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[326]~270_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_23~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[326]~270_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_23~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[326]~270_combout\ & !\dc|Div0|auto_generated|divider|divider|op_23~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[326]~270_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_23~1\,
	combout => \dc|Div0|auto_generated|divider|divider|op_23~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_23~3\);

-- Location: LCCOMB_X41_Y30_N16
\dc|Div0|auto_generated|divider|divider|op_23~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_23~4_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[327]~269_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_23~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[327]~269_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|op_23~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_23~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[327]~269_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[327]~269_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_23~3\,
	combout => \dc|Div0|auto_generated|divider|divider|op_23~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_23~5\);

-- Location: LCCOMB_X43_Y27_N16
\dc|Div0|auto_generated|divider|divider|op_17~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~20_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[264]~284_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[264]~285_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[264]~284_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[264]~285_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~20_combout\);

-- Location: LCCOMB_X43_Y30_N28
\dc|Div0|auto_generated|divider|divider|op_18~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~18_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[276]~283_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[276]~286_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[276]~283_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[276]~286_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~18_combout\);

-- Location: LCCOMB_X43_Y30_N6
\dc|Div0|auto_generated|divider|divider|op_19~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~16_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[288]~287_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[288]~353_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[288]~287_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[288]~353_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~16_combout\);

-- Location: LCCOMB_X43_Y30_N12
\dc|Div0|auto_generated|divider|divider|op_20~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~14_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[300]~338_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[300]~288_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[300]~338_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[300]~288_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_20~14_combout\);

-- Location: LCCOMB_X43_Y30_N22
\dc|Div0|auto_generated|divider|divider|op_21~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_21~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[312]~339_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[312]~289_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[312]~339_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[312]~289_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_21~12_combout\);

-- Location: LCCOMB_X43_Y30_N4
\dc|Div0|auto_generated|divider|divider|op_23~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_23~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[324]~290_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[324]~340_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[324]~290_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[324]~340_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_23~10_combout\);

-- Location: LCCOMB_X42_Y30_N2
\dc|Div0|auto_generated|divider|divider|op_24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_24~1_cout\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[336]~291_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[336]~341_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[336]~291_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[336]~341_combout\,
	datad => VCC,
	cout => \dc|Div0|auto_generated|divider|divider|op_24~1_cout\);

-- Location: LCCOMB_X42_Y30_N4
\dc|Div0|auto_generated|divider|divider|op_24~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_24~3_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[337]~337_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[337]~282_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_24~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[337]~337_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[337]~282_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_24~1_cout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_24~3_cout\);

-- Location: LCCOMB_X42_Y30_N6
\dc|Div0|auto_generated|divider|divider|op_24~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_24~5_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_24~3_cout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[338]~281_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[338]~336_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[338]~281_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[338]~336_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_24~3_cout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_24~5_cout\);

-- Location: LCCOMB_X42_Y30_N8
\dc|Div0|auto_generated|divider|divider|op_24~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_24~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[339]~335_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[339]~280_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_24~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[339]~335_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[339]~280_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_24~5_cout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_24~7_cout\);

-- Location: LCCOMB_X42_Y30_N10
\dc|Div0|auto_generated|divider|divider|op_24~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_24~8_combout\ = \dc|Div0|auto_generated|divider|divider|op_24~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|op_24~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_24~8_combout\);

-- Location: LCCOMB_X41_Y35_N16
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2_combout\ = (\dc|mult_y\(16) & (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~1\)) # (!\dc|mult_y\(16) & 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~1\) # (GND)))
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~3\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~1\) # (!\dc|mult_y\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(16),
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~1\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~3\);

-- Location: LCCOMB_X41_Y35_N20
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~6_combout\ = (\dc|mult_y\(18) & (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~5\)) # (!\dc|mult_y\(18) & 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~5\) # (GND)))
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~7\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~5\) # (!\dc|mult_y\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(18),
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~5\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~7\);

-- Location: LCCOMB_X40_Y35_N10
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[215]~214_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[215]~214_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[215]~215_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[215]~215_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[215]~214_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[215]~215_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[215]~214_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[215]~215_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~3\);

-- Location: LCCOMB_X39_Y35_N6
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[227]~219_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[227]~219_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[227]~219_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[227]~219_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~7\);

-- Location: LCCOMB_X38_Y35_N14
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[212]~227_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[212]~228_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[212]~227_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[212]~228_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12_combout\);

-- Location: LCCOMB_X39_Y34_N4
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[236]~224_combout\)))) # (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[236]~224_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[236]~224_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[236]~224_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~3\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\);

-- Location: LCCOMB_X38_Y34_N8
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[247]~230_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[247]~230_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[247]~230_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[247]~230_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~7\);

-- Location: LCCOMB_X36_Y34_N8
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[256]~239_combout\)))) # (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[256]~239_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[256]~239_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[256]~239_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~3\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\);

-- Location: LCCOMB_X36_Y34_N10
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[257]~238_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[257]~238_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[257]~238_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[257]~238_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~5\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~7\);

-- Location: LCCOMB_X35_Y34_N16
\dc|Div1|auto_generated|divider|divider|op_19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\)))
-- \dc|Div1|auto_generated|divider|divider|op_19~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_19~1\);

-- Location: LCCOMB_X35_Y34_N20
\dc|Div1|auto_generated|divider|divider|op_19~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~4_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[266]~249_combout\)))) 
-- # (!\dc|Div1|auto_generated|divider|divider|op_19~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[266]~249_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|op_19~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_19~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[266]~249_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[266]~249_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_19~3\,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_19~5\);

-- Location: LCCOMB_X35_Y34_N22
\dc|Div1|auto_generated|divider|divider|op_19~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[267]~248_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_19~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[267]~248_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_19~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_19~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_19~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[267]~248_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_19~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[267]~248_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_19~5\,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_19~7\);

-- Location: LCCOMB_X40_Y34_N12
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[252]~353_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[252]~266_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[252]~353_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[252]~266_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12_combout\);

-- Location: LCCOMB_X33_Y34_N28
\dc|Div1|auto_generated|divider|divider|op_19~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[262]~276_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[262]~354_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[262]~276_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[262]~354_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~12_combout\);

-- Location: LCCOMB_X34_Y33_N2
\dc|Div1|auto_generated|divider|divider|op_21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_21~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\)))
-- \dc|Div1|auto_generated|divider|divider|op_21~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|op_21~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_21~1\);

-- Location: LCCOMB_X34_Y33_N4
\dc|Div1|auto_generated|divider|divider|op_21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_21~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_21~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[285]~271_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_21~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[285]~271_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_21~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_21~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[285]~271_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_21~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[285]~271_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_21~1\,
	combout => \dc|Div1|auto_generated|divider|divider|op_21~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_21~3\);

-- Location: LCCOMB_X34_Y33_N8
\dc|Div1|auto_generated|divider|divider|op_21~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_21~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[287]~268_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_21~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[287]~268_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_21~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_21~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_21~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[287]~268_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_21~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[287]~268_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_21~5\,
	combout => \dc|Div1|auto_generated|divider|divider|op_21~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_21~7\);

-- Location: LCCOMB_X35_Y33_N6
\dc|Div1|auto_generated|divider|divider|op_19~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~14_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[261]~282_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[261]~285_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[261]~282_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[261]~285_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~14_combout\);

-- Location: LCCOMB_X35_Y33_N12
\dc|Div1|auto_generated|divider|divider|op_20~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[272]~286_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[272]~355_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[272]~286_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[272]~355_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_20~12_combout\);

-- Location: LCCOMB_X38_Y33_N10
\dc|Div1|auto_generated|divider|divider|op_23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_23~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\)))
-- \dc|Div1|auto_generated|divider|divider|op_23~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|op_23~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_23~1\);

-- Location: LCCOMB_X38_Y33_N12
\dc|Div1|auto_generated|divider|divider|op_23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_23~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[295]~281_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_23~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[295]~281_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_23~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_23~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_23~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[295]~281_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_23~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[295]~281_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_23~1\,
	combout => \dc|Div1|auto_generated|divider|divider|op_23~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_23~3\);

-- Location: LCCOMB_X38_Y33_N14
\dc|Div1|auto_generated|divider|divider|op_23~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_23~4_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[296]~279_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\)))) 
-- # (!\dc|Div1|auto_generated|divider|divider|op_23~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[296]~279_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|op_23~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_23~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[296]~279_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[296]~279_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_23~3\,
	combout => \dc|Div1|auto_generated|divider|divider|op_23~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_23~5\);

-- Location: LCCOMB_X38_Y33_N16
\dc|Div1|auto_generated|divider|divider|op_23~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_23~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_23~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[297]~278_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_23~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[297]~278_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_23~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_23~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[297]~278_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_23~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[297]~278_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_23~5\,
	combout => \dc|Div1|auto_generated|divider|divider|op_23~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_23~7\);

-- Location: LCCOMB_X33_Y34_N30
\dc|Div1|auto_generated|divider|divider|op_19~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~16_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[260]~293_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[260]~294_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[260]~293_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[260]~294_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~16_combout\);

-- Location: LCCOMB_X33_Y33_N20
\dc|Div1|auto_generated|divider|divider|op_20~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~14_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[271]~295_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[271]~292_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[271]~295_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[271]~292_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_20~14_combout\);

-- Location: LCCOMB_X33_Y33_N18
\dc|Div1|auto_generated|divider|divider|op_21~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_21~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[282]~296_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[282]~356_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[282]~296_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[282]~356_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_21~12_combout\);

-- Location: LCCOMB_X39_Y33_N2
\dc|Div1|auto_generated|divider|divider|op_24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_24~1_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[304]~342_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[304]~341_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[304]~342_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[304]~341_combout\,
	datad => VCC,
	cout => \dc|Div1|auto_generated|divider|divider|op_24~1_cout\);

-- Location: LCCOMB_X39_Y33_N4
\dc|Div1|auto_generated|divider|divider|op_24~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_24~3_cout\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[305]~290_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[305]~291_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_24~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[305]~290_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[305]~291_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_24~1_cout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_24~3_cout\);

-- Location: LCCOMB_X39_Y33_N6
\dc|Div1|auto_generated|divider|divider|op_24~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_24~5_cout\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_24~3_cout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[306]~289_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[306]~339_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[306]~289_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[306]~339_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_24~3_cout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_24~5_cout\);

-- Location: LCCOMB_X39_Y33_N8
\dc|Div1|auto_generated|divider|divider|op_24~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_24~7_cout\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[307]~338_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[307]~288_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_24~5_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[307]~338_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[307]~288_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_24~5_cout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_24~7_cout\);

-- Location: LCCOMB_X39_Y33_N10
\dc|Div1|auto_generated|divider|divider|op_24~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_24~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[308]~287_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[308]~337_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_24~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[308]~287_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[308]~337_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_24~7_cout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_24~9_cout\);

-- Location: LCCOMB_X39_Y33_N12
\dc|Div1|auto_generated|divider|divider|op_24~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_24~10_combout\ = !\dc|Div1|auto_generated|divider|divider|op_24~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|op_24~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_24~10_combout\);

-- Location: LCCOMB_X38_Y38_N10
\dc|storing_addr[6]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[6]~19_combout\ = (\dc|v|col_counter|Q\(7) & (\dc|storing_addr[5]~18\ & VCC)) # (!\dc|v|col_counter|Q\(7) & (!\dc|storing_addr[5]~18\))
-- \dc|storing_addr[6]~20\ = CARRY((!\dc|v|col_counter|Q\(7) & !\dc|storing_addr[5]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(7),
	datad => VCC,
	cin => \dc|storing_addr[5]~18\,
	combout => \dc|storing_addr[6]~19_combout\,
	cout => \dc|storing_addr[6]~20\);

-- Location: DSPOUT_X44_Y29_N2
\dc|Mult0|auto_generated|mac_out2\ : cycloneive_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \dc|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: DSPOUT_X44_Y36_N2
\dc|Mult1|auto_generated|mac_out2\ : cycloneive_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Mult1|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \dc|Mult1|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X35_Y26_N10
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!w_y(4) & (!w_y(3) & ((w_y(1)) # (w_y(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_y(1),
	datab => w_y(4),
	datac => w_y(0),
	datad => w_y(3),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X38_Y32_N12
\dc|v|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|LessThan4~1_combout\ = (!\dc|v|col_counter|Q\(8) & (!\dc|v|col_counter|Q\(7) & !\dc|v|col_counter|Q\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(8),
	datac => \dc|v|col_counter|Q\(7),
	datad => \dc|v|col_counter|Q\(6),
	combout => \dc|v|LessThan4~1_combout\);

-- Location: LCCOMB_X38_Y36_N4
\dc|v|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|Equal0~0_combout\ = (((\dc|v|col_counter|Q\(6)) # (\dc|v|col_counter|Q\(7))) # (!\dc|v|col_counter|Q\(1))) # (!\dc|v|col_counter|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(0),
	datab => \dc|v|col_counter|Q\(1),
	datac => \dc|v|col_counter|Q\(6),
	datad => \dc|v|col_counter|Q\(7),
	combout => \dc|v|Equal0~0_combout\);

-- Location: FF_X42_Y36_N13
\dc|flag_ld\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|v|LessThan3~0_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|flag_ld~q\);

-- Location: LCCOMB_X36_Y30_N4
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ((w_x(8)) # ((w_x(1)) # (!w_x(9)))) # (!w_x(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_x(7),
	datab => w_x(8),
	datac => w_x(1),
	datad => w_x(9),
	combout => \Equal0~0_combout\);

-- Location: FF_X43_Y28_N7
\dc|mult_x[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT18\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(18));

-- Location: LCCOMB_X43_Y28_N6
\dc|Div0|auto_generated|divider|divider|StageOut[240]~196\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[240]~196_combout\ = (\dc|mult_x\(19) & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_x\(19),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[240]~196_combout\);

-- Location: LCCOMB_X43_Y28_N20
\dc|Div0|auto_generated|divider|divider|StageOut[239]~199\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[239]~199_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[239]~199_combout\);

-- Location: LCCOMB_X42_Y28_N16
\dc|Div0|auto_generated|divider|divider|StageOut[238]~201\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[238]~201_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[238]~201_combout\);

-- Location: LCCOMB_X42_Y28_N0
\dc|Div0|auto_generated|divider|divider|StageOut[237]~203\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[237]~203_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[237]~203_combout\);

-- Location: LCCOMB_X42_Y28_N4
\dc|Div0|auto_generated|divider|divider|StageOut[250]~205\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[250]~205_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[250]~205_combout\);

-- Location: LCCOMB_X42_Y28_N30
\dc|Div0|auto_generated|divider|divider|StageOut[249]~206\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[249]~206_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[249]~206_combout\);

-- Location: LCCOMB_X41_Y28_N12
\dc|Div0|auto_generated|divider|divider|StageOut[248]~209\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[248]~209_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[248]~209_combout\);

-- Location: LCCOMB_X41_Y28_N6
\dc|Div0|auto_generated|divider|divider|StageOut[262]~210\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[262]~210_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~4_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[262]~210_combout\);

-- Location: LCCOMB_X41_Y28_N26
\dc|Div0|auto_generated|divider|divider|StageOut[260]~212\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[260]~212_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[260]~212_combout\);

-- Location: FF_X43_Y29_N19
\dc|mult_x[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT14\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(14));

-- Location: LCCOMB_X41_Y29_N14
\dc|Div0|auto_generated|divider|divider|StageOut[259]~216\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[259]~216_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[259]~216_combout\);

-- Location: LCCOMB_X42_Y29_N0
\dc|Div0|auto_generated|divider|divider|StageOut[273]~217\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[273]~217_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~4_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~4_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[273]~217_combout\);

-- Location: LCCOMB_X42_Y29_N12
\dc|Div0|auto_generated|divider|divider|StageOut[272]~218\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[272]~218_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[272]~218_combout\);

-- Location: LCCOMB_X42_Y29_N18
\dc|Div0|auto_generated|divider|divider|StageOut[271]~219\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[271]~219_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[271]~219_combout\);

-- Location: LCCOMB_X41_Y29_N4
\dc|Div0|auto_generated|divider|divider|StageOut[284]~225\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[284]~225_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~4_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[284]~225_combout\);

-- Location: LCCOMB_X41_Y29_N30
\dc|Div0|auto_generated|divider|divider|StageOut[269]~232\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[269]~232_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[269]~232_combout\);

-- Location: LCCOMB_X41_Y29_N20
\dc|Div0|auto_generated|divider|divider|StageOut[281]~233\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[281]~233_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~10_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[281]~233_combout\);

-- Location: LCCOMB_X40_Y29_N4
\dc|Div0|auto_generated|divider|divider|StageOut[295]~234\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[295]~234_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~4_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_18~4_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[295]~234_combout\);

-- Location: LCCOMB_X40_Y29_N6
\dc|Div0|auto_generated|divider|divider|StageOut[294]~235\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[294]~235_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~2_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_18~2_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[294]~235_combout\);

-- Location: LCCOMB_X42_Y28_N22
\dc|Div0|auto_generated|divider|divider|StageOut[232]~237\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[232]~237_combout\ = (\dc|mult_x\(11) & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(11),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[232]~237_combout\);

-- Location: LCCOMB_X38_Y29_N30
\dc|Div0|auto_generated|divider|divider|StageOut[256]~240\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[256]~240_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[256]~240_combout\);

-- Location: LCCOMB_X38_Y29_N22
\dc|Div0|auto_generated|divider|divider|StageOut[280]~242\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[280]~242_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_17~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_17~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[280]~242_combout\);

-- Location: LCCOMB_X38_Y29_N16
\dc|Div0|auto_generated|divider|divider|StageOut[292]~243\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[292]~243_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_18~10_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[292]~243_combout\);

-- Location: LCCOMB_X39_Y29_N0
\dc|Div0|auto_generated|divider|divider|StageOut[306]~244\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[306]~244_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_19~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~4_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[306]~244_combout\);

-- Location: LCCOMB_X39_Y29_N30
\dc|Div0|auto_generated|divider|divider|StageOut[304]~246\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[304]~246_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_19~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~0_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[304]~246_combout\);

-- Location: LCCOMB_X39_Y28_N30
\dc|Div0|auto_generated|divider|divider|StageOut[243]~247\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[243]~247_combout\ = (\dc|mult_x\(10) & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_x\(10),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[243]~247_combout\);

-- Location: LCCOMB_X39_Y28_N2
\dc|Div0|auto_generated|divider|divider|StageOut[279]~253\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[279]~253_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~14_combout\ & !\dc|Div0|auto_generated|divider|divider|op_17~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_17~14_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[279]~253_combout\);

-- Location: LCCOMB_X39_Y28_N12
\dc|Div0|auto_generated|divider|divider|StageOut[291]~254\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[291]~254_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[291]~254_combout\);

-- Location: LCCOMB_X39_Y29_N12
\dc|Div0|auto_generated|divider|divider|StageOut[303]~255\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[303]~255_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_19~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[303]~255_combout\);

-- Location: LCCOMB_X40_Y30_N26
\dc|Div0|auto_generated|divider|divider|StageOut[316]~257\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[316]~257_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_20~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~2_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[316]~257_combout\);

-- Location: FF_X38_Y30_N5
\dc|mult_x[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_x[9]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(9));

-- Location: LCCOMB_X39_Y30_N10
\dc|Div0|auto_generated|divider|divider|StageOut[254]~259\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[254]~259_combout\ = (\dc|mult_x\(9) & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_x\(9),
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[254]~259_combout\);

-- Location: LCCOMB_X38_Y30_N10
\dc|Div0|auto_generated|divider|divider|StageOut[242]~260\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[242]~260_combout\ = (\dc|mult_x\(9) & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_x\(9),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[242]~260_combout\);

-- Location: LCCOMB_X38_Y30_N8
\dc|Div0|auto_generated|divider|divider|StageOut[242]~261\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[242]~261_combout\ = (\dc|mult_x\(9) & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_x\(9),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[242]~261_combout\);

-- Location: LCCOMB_X38_Y30_N14
\dc|Div0|auto_generated|divider|divider|StageOut[254]~262\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[254]~262_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[254]~262_combout\);

-- Location: LCCOMB_X39_Y30_N24
\dc|Div0|auto_generated|divider|divider|StageOut[266]~263\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[266]~263_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[266]~263_combout\);

-- Location: LCCOMB_X39_Y30_N6
\dc|Div0|auto_generated|divider|divider|StageOut[278]~264\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[278]~264_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~16_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[278]~264_combout\);

-- Location: LCCOMB_X39_Y30_N0
\dc|Div0|auto_generated|divider|divider|StageOut[290]~265\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[290]~265_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~14_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_18~14_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[290]~265_combout\);

-- Location: LCCOMB_X39_Y30_N2
\dc|Div0|auto_generated|divider|divider|StageOut[302]~266\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[302]~266_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_19~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[302]~266_combout\);

-- Location: LCCOMB_X41_Y30_N30
\dc|Div0|auto_generated|divider|divider|StageOut[339]~280\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[339]~280_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~4_combout\ & !\dc|Div0|auto_generated|divider|divider|op_23~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_23~4_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[339]~280_combout\);

-- Location: LCCOMB_X41_Y30_N0
\dc|Div0|auto_generated|divider|divider|StageOut[338]~281\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[338]~281_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~2_combout\ & !\dc|Div0|auto_generated|divider|divider|op_23~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_23~2_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[338]~281_combout\);

-- Location: LCCOMB_X41_Y30_N6
\dc|Div0|auto_generated|divider|divider|StageOut[337]~282\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[337]~282_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~0_combout\ & !\dc|Div0|auto_generated|divider|divider|op_23~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_23~0_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[337]~282_combout\);

-- Location: FF_X43_Y27_N7
\dc|mult_x[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT7\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(7));

-- Location: LCCOMB_X43_Y30_N14
\dc|Div0|auto_generated|divider|divider|StageOut[276]~283\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[276]~283_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|mult_x\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|mult_x\(7),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[276]~283_combout\);

-- Location: LCCOMB_X43_Y27_N8
\dc|Div0|auto_generated|divider|divider|StageOut[264]~284\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[264]~284_combout\ = (\dc|mult_x\(7) & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_x\(7),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[264]~284_combout\);

-- Location: LCCOMB_X43_Y27_N18
\dc|Div0|auto_generated|divider|divider|StageOut[264]~285\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[264]~285_combout\ = (\dc|mult_x\(7) & !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_x\(7),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[264]~285_combout\);

-- Location: LCCOMB_X43_Y30_N20
\dc|Div0|auto_generated|divider|divider|StageOut[276]~286\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[276]~286_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~20_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[276]~286_combout\);

-- Location: LCCOMB_X43_Y30_N26
\dc|Div0|auto_generated|divider|divider|StageOut[288]~287\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[288]~287_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~18_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_18~18_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[288]~287_combout\);

-- Location: LCCOMB_X43_Y30_N16
\dc|Div0|auto_generated|divider|divider|StageOut[300]~288\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[300]~288_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_19~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~16_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[300]~288_combout\);

-- Location: LCCOMB_X43_Y30_N18
\dc|Div0|auto_generated|divider|divider|StageOut[312]~289\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[312]~289_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~14_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_20~14_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[312]~289_combout\);

-- Location: LCCOMB_X43_Y30_N8
\dc|Div0|auto_generated|divider|divider|StageOut[324]~290\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[324]~290_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_21~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_21~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[324]~290_combout\);

-- Location: LCCOMB_X43_Y30_N2
\dc|Div0|auto_generated|divider|divider|StageOut[336]~291\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[336]~291_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_23~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_23~10_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[336]~291_combout\);

-- Location: FF_X41_Y35_N13
\dc|mult_y[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT15\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(15));

-- Location: LCCOMB_X41_Y35_N2
\dc|Div1|auto_generated|divider|divider|StageOut[218]~209\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[218]~209_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~6_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~6_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[218]~209_combout\);

-- Location: LCCOMB_X41_Y35_N4
\dc|Div1|auto_generated|divider|divider|StageOut[217]~210\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[217]~210_combout\ = (\dc|mult_y\(17) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(17),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[217]~210_combout\);

-- Location: LCCOMB_X40_Y35_N30
\dc|Div1|auto_generated|divider|divider|StageOut[216]~213\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[216]~213_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[216]~213_combout\);

-- Location: LCCOMB_X41_Y35_N6
\dc|Div1|auto_generated|divider|divider|StageOut[215]~214\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[215]~214_combout\ = (\dc|mult_y\(15) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(15),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[215]~214_combout\);

-- Location: LCCOMB_X40_Y35_N26
\dc|Div1|auto_generated|divider|divider|StageOut[214]~216\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[214]~216_combout\ = (\dc|mult_y\(14) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(14),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[214]~216_combout\);

-- Location: LCCOMB_X40_Y35_N6
\dc|Div1|auto_generated|divider|divider|StageOut[226]~220\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[226]~220_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[226]~220_combout\);

-- Location: LCCOMB_X39_Y34_N12
\dc|Div1|auto_generated|divider|divider|StageOut[238]~222\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[238]~222_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~6_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[238]~222_combout\);

-- Location: LCCOMB_X39_Y34_N22
\dc|Div1|auto_generated|divider|divider|StageOut[235]~226\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[235]~226_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[235]~226_combout\);

-- Location: LCCOMB_X38_Y35_N8
\dc|Div1|auto_generated|divider|divider|StageOut[212]~227\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[212]~227_combout\ = (\dc|mult_y\(12) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(12),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[212]~227_combout\);

-- Location: LCCOMB_X38_Y35_N2
\dc|Div1|auto_generated|divider|divider|StageOut[212]~228\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[212]~228_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[212]~228_combout\);

-- Location: LCCOMB_X38_Y34_N30
\dc|Div1|auto_generated|divider|divider|StageOut[247]~230\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[247]~230_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[247]~230_combout\);

-- Location: LCCOMB_X39_Y34_N20
\dc|Div1|auto_generated|divider|divider|StageOut[245]~232\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\);

-- Location: LCCOMB_X38_Y34_N18
\dc|Div1|auto_generated|divider|divider|StageOut[258]~237\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[258]~237_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~6_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~6_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[258]~237_combout\);

-- Location: LCCOMB_X38_Y34_N16
\dc|Div1|auto_generated|divider|divider|StageOut[255]~240\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\);

-- Location: LCCOMB_X35_Y34_N12
\dc|Div1|auto_generated|divider|divider|StageOut[268]~247\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[268]~247_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~6_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[268]~247_combout\);

-- Location: LCCOMB_X35_Y34_N2
\dc|Div1|auto_generated|divider|divider|StageOut[267]~248\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[267]~248_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[267]~248_combout\);

-- Location: LCCOMB_X34_Y34_N24
\dc|Div1|auto_generated|divider|divider|StageOut[278]~257\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[278]~257_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~6_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_19~6_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[278]~257_combout\);

-- Location: LCCOMB_X34_Y34_N22
\dc|Div1|auto_generated|divider|divider|StageOut[277]~258\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[277]~258_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~4_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_19~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[277]~258_combout\);

-- Location: LCCOMB_X35_Y34_N30
\dc|Div1|auto_generated|divider|divider|StageOut[275]~261\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[275]~261_combout\ = (!\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_19~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~0_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[275]~261_combout\);

-- Location: LCCOMB_X40_Y34_N24
\dc|Div1|auto_generated|divider|divider|StageOut[252]~266\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[252]~266_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[252]~266_combout\);

-- Location: LCCOMB_X34_Y33_N26
\dc|Div1|auto_generated|divider|divider|StageOut[287]~268\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[287]~268_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~4_combout\ & !\dc|Div1|auto_generated|divider|divider|op_20~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_20~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[287]~268_combout\);

-- Location: LCCOMB_X33_Y34_N26
\dc|Div1|auto_generated|divider|divider|StageOut[262]~276\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[262]~276_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[262]~276_combout\);

-- Location: LCCOMB_X35_Y33_N30
\dc|Div1|auto_generated|divider|divider|StageOut[298]~277\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[298]~277_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~6_combout\ & !\dc|Div1|auto_generated|divider|divider|op_21~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_21~6_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[298]~277_combout\);

-- Location: LCCOMB_X35_Y33_N16
\dc|Div1|auto_generated|divider|divider|StageOut[296]~279\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[296]~279_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~2_combout\ & !\dc|Div1|auto_generated|divider|divider|op_21~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_21~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[296]~279_combout\);

-- Location: LCCOMB_X38_Y33_N22
\dc|Div1|auto_generated|divider|divider|StageOut[295]~281\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[295]~281_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~0_combout\ & !\dc|Div1|auto_generated|divider|divider|op_21~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_21~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[295]~281_combout\);

-- Location: LCCOMB_X35_Y33_N26
\dc|Div1|auto_generated|divider|divider|StageOut[261]~282\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[261]~282_combout\ = (\dc|mult_y\(6) & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(6),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[261]~282_combout\);

-- Location: LCCOMB_X35_Y33_N24
\dc|Div1|auto_generated|divider|divider|StageOut[261]~285\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[261]~285_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[261]~285_combout\);

-- Location: LCCOMB_X35_Y33_N14
\dc|Div1|auto_generated|divider|divider|StageOut[272]~286\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[272]~286_combout\ = (!\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_19~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~14_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[272]~286_combout\);

-- Location: LCCOMB_X38_Y33_N8
\dc|Div1|auto_generated|divider|divider|StageOut[308]~287\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[308]~287_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~6_combout\ & !\dc|Div1|auto_generated|divider|divider|op_23~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|op_23~6_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[308]~287_combout\);

-- Location: LCCOMB_X38_Y33_N30
\dc|Div1|auto_generated|divider|divider|StageOut[307]~288\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[307]~288_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~4_combout\ & !\dc|Div1|auto_generated|divider|divider|op_23~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_23~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[307]~288_combout\);

-- Location: LCCOMB_X38_Y33_N0
\dc|Div1|auto_generated|divider|divider|StageOut[306]~289\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[306]~289_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~2_combout\ & !\dc|Div1|auto_generated|divider|divider|op_23~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_23~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[306]~289_combout\);

-- Location: LCCOMB_X38_Y33_N2
\dc|Div1|auto_generated|divider|divider|StageOut[305]~290\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[305]~290_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[305]~290_combout\);

-- Location: LCCOMB_X38_Y33_N28
\dc|Div1|auto_generated|divider|divider|StageOut[305]~291\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[305]~291_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~0_combout\ & !\dc|Div1|auto_generated|divider|divider|op_23~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_23~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[305]~291_combout\);

-- Location: FF_X33_Y34_N21
\dc|mult_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_y[5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(5));

-- Location: LCCOMB_X33_Y33_N12
\dc|Div1|auto_generated|divider|divider|StageOut[271]~292\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[271]~292_combout\ = (\dc|mult_y\(5) & \dc|Div1|auto_generated|divider|divider|op_19~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(5),
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[271]~292_combout\);

-- Location: LCCOMB_X33_Y34_N22
\dc|Div1|auto_generated|divider|divider|StageOut[260]~293\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[260]~293_combout\ = (\dc|mult_y\(5) & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(5),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[260]~293_combout\);

-- Location: LCCOMB_X33_Y34_N0
\dc|Div1|auto_generated|divider|divider|StageOut[260]~294\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[260]~294_combout\ = (\dc|mult_y\(5) & !\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(5),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[260]~294_combout\);

-- Location: LCCOMB_X33_Y33_N26
\dc|Div1|auto_generated|divider|divider|StageOut[271]~295\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[271]~295_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~16_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_19~16_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[271]~295_combout\);

-- Location: LCCOMB_X33_Y33_N4
\dc|Div1|auto_generated|divider|divider|StageOut[282]~296\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[282]~296_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~14_combout\ & !\dc|Div1|auto_generated|divider|divider|op_20~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|op_20~14_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[282]~296_combout\);

-- Location: LCCOMB_X36_Y38_N8
\dc|storing_color_next[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[3]~0_combout\ = (!\dc|blk~0_combout\ & (\vc|VGA_data_hold\(0) & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|blk~0_combout\,
	datac => \vc|VGA_data_hold\(0),
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[3]~0_combout\);

-- Location: LCCOMB_X36_Y38_N30
\dc|storing_color_next[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[4]~1_combout\ = (!\dc|blk~0_combout\ & (\vc|VGA_data_hold\(1) & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|blk~0_combout\,
	datac => \vc|VGA_data_hold\(1),
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[4]~1_combout\);

-- Location: LCCOMB_X36_Y37_N30
\dc|storing_color_next[13]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[13]~7_combout\ = (\vc|VGA_data_hold\(7) & (\dc|v|row_counter|Q\(0) & !\dc|blk~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|VGA_data_hold\(7),
	datac => \dc|v|row_counter|Q\(0),
	datad => \dc|blk~0_combout\,
	combout => \dc|storing_color_next[13]~7_combout\);

-- Location: LCCOMB_X35_Y37_N4
\dc|storing_color_next[14]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[14]~8_combout\ = (!\dc|blk~0_combout\ & (\vc|VGA_data_hold\(8) & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|blk~0_combout\,
	datac => \vc|VGA_data_hold\(8),
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[14]~8_combout\);

-- Location: LCCOMB_X36_Y37_N26
\dc|storing_color_next[20]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[20]~11_combout\ = (\vc|VGA_data_hold\(11) & (\dc|v|row_counter|Q\(0) & !\dc|blk~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|VGA_data_hold\(11),
	datac => \dc|v|row_counter|Q\(0),
	datad => \dc|blk~0_combout\,
	combout => \dc|storing_color_next[20]~11_combout\);

-- Location: LCCOMB_X35_Y37_N14
\dc|storing_color_next[22]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[22]~13_combout\ = (\dc|v|row_counter|Q\(0) & (\vc|VGA_data_hold\(13) & !\dc|blk~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(0),
	datab => \vc|VGA_data_hold\(13),
	datad => \dc|blk~0_combout\,
	combout => \dc|storing_color_next[22]~13_combout\);

-- Location: LCCOMB_X36_Y37_N14
\dc|storing_color_next[23]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[23]~14_combout\ = (\vc|VGA_data_hold\(14) & (\dc|v|row_counter|Q\(0) & !\dc|blk~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|VGA_data_hold\(14),
	datac => \dc|v|row_counter|Q\(0),
	datad => \dc|blk~0_combout\,
	combout => \dc|storing_color_next[23]~14_combout\);

-- Location: LCCOMB_X57_Y2_N26
clk_33MHz : cycloneive_lcell_comb
-- Equation(s):
-- \clk_33MHz~combout\ = LCELL((\pl|altpll_component|auto_generated|pll_lock_sync~q\ & (\pl|altpll_component|auto_generated|wire_pll1_locked\ & GLOBAL(\pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pl|altpll_component|auto_generated|pll_lock_sync~q\,
	datac => \pl|altpll_component|auto_generated|wire_pll1_locked\,
	datad => \pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	combout => \clk_33MHz~combout\);

-- Location: LCCOMB_X33_Y28_N12
\vc|sram_dq_out[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[0]~3_combout\ = (\vc|sram_dq_out[1]~0_combout\ & (((\vc|sram_dq_out[1]~2_combout\)))) # (!\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\ & ((!\color[0][3]~q\))) # (!\vc|sram_dq_out[1]~2_combout\ & (!\color[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \color[1][3]~q\,
	datac => \color[0][3]~q\,
	datad => \vc|sram_dq_out[1]~2_combout\,
	combout => \vc|sram_dq_out[0]~3_combout\);

-- Location: LCCOMB_X33_Y30_N6
\vc|sram_dq_out[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[1]~6_combout\ = (\vc|sram_dq_out[1]~2_combout\ & (((\vc|sram_dq_out[1]~0_combout\)))) # (!\vc|sram_dq_out[1]~2_combout\ & ((\vc|sram_dq_out[1]~0_combout\ & ((\color[3][4]~q\))) # (!\vc|sram_dq_out[1]~0_combout\ & (!\color[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \color[1][4]~q\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \vc|sram_dq_out[1]~0_combout\,
	datad => \color[3][4]~q\,
	combout => \vc|sram_dq_out[1]~6_combout\);

-- Location: LCCOMB_X35_Y31_N20
\vc|sram_dq_out[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[2]~9_combout\ = (\vc|sram_dq_out[1]~0_combout\ & (\vc|sram_dq_out[1]~2_combout\)) # (!\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\ & (!\color[0][5]~q\)) # (!\vc|sram_dq_out[1]~2_combout\ & ((!\color[1][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \color[0][5]~q\,
	datad => \color[1][5]~q\,
	combout => \vc|sram_dq_out[2]~9_combout\);

-- Location: LCCOMB_X35_Y28_N10
\vc|sram_dq_out[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[3]~12_combout\ = (\vc|sram_dq_out[1]~0_combout\ & (((\color[3][6]~q\) # (\vc|sram_dq_out[1]~2_combout\)))) # (!\vc|sram_dq_out[1]~0_combout\ & (\color[1][6]~q\ & ((!\vc|sram_dq_out[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \color[1][6]~q\,
	datac => \color[3][6]~q\,
	datad => \vc|sram_dq_out[1]~2_combout\,
	combout => \vc|sram_dq_out[3]~12_combout\);

-- Location: LCCOMB_X35_Y31_N6
\vc|sram_dq_out[9]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[9]~30_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\) # ((!\color[3][15]~q\)))) # (!\vc|sram_dq_out[1]~0_combout\ & (!\vc|sram_dq_out[1]~2_combout\ & (!\color[1][15]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \color[1][15]~q\,
	datad => \color[3][15]~q\,
	combout => \vc|sram_dq_out[9]~30_combout\);

-- Location: LCCOMB_X35_Y31_N10
\vc|sram_dq_out[13]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[13]~42_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\) # ((\color[3][22]~q\)))) # (!\vc|sram_dq_out[1]~0_combout\ & (!\vc|sram_dq_out[1]~2_combout\ & ((\color[1][22]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \color[3][22]~q\,
	datad => \color[1][22]~q\,
	combout => \vc|sram_dq_out[13]~42_combout\);

-- Location: LCCOMB_X32_Y32_N4
\color[3][3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~2_combout\ = (count(5) & (count(7) & (count(6) & count(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(5),
	datab => count(7),
	datac => count(6),
	datad => count(8),
	combout => \color[3][3]~2_combout\);

-- Location: LCCOMB_X41_Y29_N2
\dc|Div0|auto_generated|divider|divider|StageOut[283]~302\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~0_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\);

-- Location: LCCOMB_X41_Y29_N26
\dc|Div0|auto_generated|divider|divider|StageOut[293]~309\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_17~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_17~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_17~10_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\);

-- Location: LCCOMB_X39_Y29_N14
\dc|Div0|auto_generated|divider|divider|StageOut[305]~315\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_18~0_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\);

-- Location: LCCOMB_X40_Y30_N30
\dc|Div0|auto_generated|divider|divider|StageOut[317]~321\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[317]~321_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_19~2_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_19~2_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[317]~321_combout\);

-- Location: LCCOMB_X40_Y30_N22
\dc|Div0|auto_generated|divider|divider|StageOut[315]~323\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_19~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_19~10_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\);

-- Location: LCCOMB_X39_Y30_N26
\dc|Div0|auto_generated|divider|divider|StageOut[278]~324\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[278]~324_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[266]~351_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[266]~351_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[2]~18_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[278]~324_combout\);

-- Location: LCCOMB_X39_Y30_N4
\dc|Div0|auto_generated|divider|divider|StageOut[290]~325\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[290]~325_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[278]~324_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_17~16_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[278]~324_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[290]~325_combout\);

-- Location: LCCOMB_X39_Y30_N14
\dc|Div0|auto_generated|divider|divider|StageOut[302]~326\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[302]~326_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[290]~325_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_18~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_18~14_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[290]~325_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[302]~326_combout\);

-- Location: LCCOMB_X39_Y30_N16
\dc|Div0|auto_generated|divider|divider|StageOut[314]~327\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[302]~326_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_19~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_19~12_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[302]~326_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\);

-- Location: LCCOMB_X40_Y30_N0
\dc|Div0|auto_generated|divider|divider|StageOut[328]~328\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[328]~328_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_20~2_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_20~2_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[328]~328_combout\);

-- Location: LCCOMB_X40_Y30_N14
\dc|Div0|auto_generated|divider|divider|StageOut[327]~329\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_20~0_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[315]~323_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\);

-- Location: LCCOMB_X41_Y30_N22
\dc|Div0|auto_generated|divider|divider|StageOut[326]~330\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_20~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_20~10_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\);

-- Location: LCCOMB_X40_Y28_N10
\dc|Div0|auto_generated|divider|divider|StageOut[301]~332\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[301]~332_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[289]~331_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_18~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_18~16_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[289]~331_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[301]~332_combout\);

-- Location: LCCOMB_X41_Y30_N8
\dc|Div0|auto_generated|divider|divider|StageOut[325]~334\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[313]~333_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_20~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[313]~333_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_20~12_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\);

-- Location: LCCOMB_X41_Y30_N10
\dc|Div0|auto_generated|divider|divider|StageOut[339]~335\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[339]~335_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_21~2_combout\ & !\dc|Div0|auto_generated|divider|divider|op_21~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[327]~329_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_21~2_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[339]~335_combout\);

-- Location: LCCOMB_X41_Y30_N28
\dc|Div0|auto_generated|divider|divider|StageOut[338]~336\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[338]~336_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_21~0_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[326]~330_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[338]~336_combout\);

-- Location: LCCOMB_X41_Y30_N26
\dc|Div0|auto_generated|divider|divider|StageOut[337]~337\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[337]~337_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_21~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_21~10_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[325]~334_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[337]~337_combout\);

-- Location: LCCOMB_X43_Y30_N24
\dc|Div0|auto_generated|divider|divider|StageOut[300]~338\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[300]~338_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[288]~353_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_18~18_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[288]~353_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_18~18_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[300]~338_combout\);

-- Location: LCCOMB_X43_Y30_N30
\dc|Div0|auto_generated|divider|divider|StageOut[312]~339\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[312]~339_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[300]~338_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_19~16_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_19~16_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[300]~338_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[312]~339_combout\);

-- Location: LCCOMB_X43_Y30_N0
\dc|Div0|auto_generated|divider|divider|StageOut[324]~340\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[324]~340_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[312]~339_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_20~14_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_20~14_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[312]~339_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[324]~340_combout\);

-- Location: LCCOMB_X42_Y30_N0
\dc|Div0|auto_generated|divider|divider|StageOut[336]~341\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[336]~341_combout\ = (\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[324]~340_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_21~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_21~12_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[324]~340_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[336]~341_combout\);

-- Location: LCCOMB_X39_Y35_N14
\dc|Div1|auto_generated|divider|divider|StageOut[237]~298\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~2_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\);

-- Location: LCCOMB_X39_Y35_N30
\dc|Div1|auto_generated|divider|divider|StageOut[234]~300\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[223]~349_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[223]~349_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\);

-- Location: LCCOMB_X38_Y34_N26
\dc|Div1|auto_generated|divider|divider|StageOut[248]~301\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[248]~301_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[248]~301_combout\);

-- Location: LCCOMB_X38_Y34_N22
\dc|Div1|auto_generated|divider|divider|StageOut[244]~306\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[233]~304_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[233]~304_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\);

-- Location: LCCOMB_X36_Y34_N26
\dc|Div1|auto_generated|divider|divider|StageOut[256]~309\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\);

-- Location: LCCOMB_X36_Y34_N20
\dc|Div1|auto_generated|divider|divider|StageOut[266]~315\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\);

-- Location: LCCOMB_X35_Y34_N6
\dc|Div1|auto_generated|divider|divider|StageOut[274]~324\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\ = (!\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[263]~322_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[263]~322_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\);

-- Location: LCCOMB_X34_Y34_N8
\dc|Div1|auto_generated|divider|divider|StageOut[288]~325\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[288]~325_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_19~4_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_19~4_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[288]~325_combout\);

-- Location: LCCOMB_X34_Y34_N0
\dc|Div1|auto_generated|divider|divider|StageOut[286]~327\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_19~0_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_19~0_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\);

-- Location: LCCOMB_X34_Y33_N22
\dc|Div1|auto_generated|divider|divider|StageOut[297]~332\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_20~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_20~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\);

-- Location: LCCOMB_X35_Y33_N18
\dc|Div1|auto_generated|divider|divider|StageOut[294]~335\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[283]~334_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_20~12_combout\ & !\dc|Div1|auto_generated|divider|divider|op_20~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_20~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[283]~334_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[294]~335_combout\);

-- Location: LCCOMB_X38_Y33_N6
\dc|Div1|auto_generated|divider|divider|StageOut[308]~337\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[308]~337_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_21~4_combout\ & !\dc|Div1|auto_generated|divider|divider|op_21~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[297]~332_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_21~4_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[308]~337_combout\);

-- Location: LCCOMB_X34_Y33_N14
\dc|Div1|auto_generated|divider|divider|StageOut[307]~338\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[307]~338_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_21~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_21~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[307]~338_combout\);

-- Location: LCCOMB_X38_Y33_N4
\dc|Div1|auto_generated|divider|divider|StageOut[306]~339\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[306]~339_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_21~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[306]~339_combout\);

-- Location: LCCOMB_X33_Y33_N10
\dc|Div1|auto_generated|divider|divider|StageOut[293]~340\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[293]~340_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[282]~356_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_20~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_20~14_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[282]~356_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[293]~340_combout\);

-- Location: LCCOMB_X39_Y33_N0
\dc|Div1|auto_generated|divider|divider|StageOut[304]~341\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[304]~341_combout\ = (\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[293]~340_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_21~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_21~12_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[293]~340_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[304]~341_combout\);

-- Location: LCCOMB_X38_Y33_N26
\dc|Div1|auto_generated|divider|divider|StageOut[304]~342\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[304]~342_combout\ = (!\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[293]~340_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_21~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_21~12_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[293]~340_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[304]~342_combout\);

-- Location: LCCOMB_X42_Y28_N2
\dc|Div0|auto_generated|divider|divider|StageOut[251]~342\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[251]~342_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|mult_x\(18))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(18),
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~2_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[251]~342_combout\);

-- Location: LCCOMB_X39_Y30_N30
\dc|Div0|auto_generated|divider|divider|StageOut[266]~351\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[266]~351_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & (\dc|mult_x\(9))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datab => \dc|mult_x\(9),
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[1]~20_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[266]~351_combout\);

-- Location: LCCOMB_X43_Y30_N10
\dc|Div0|auto_generated|divider|divider|StageOut[288]~353\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[288]~353_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & (\dc|mult_x\(7))) # 
-- (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|op_17~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(7),
	datab => \dc|Div0|auto_generated|divider|divider|op_17~20_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[288]~353_combout\);

-- Location: LCCOMB_X40_Y35_N20
\dc|Div1|auto_generated|divider|divider|StageOut[228]~343\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[228]~343_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & ((\dc|mult_y\(17)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	datac => \dc|mult_y\(17),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[228]~343_combout\);

-- Location: LCCOMB_X40_Y35_N2
\dc|Div1|auto_generated|divider|divider|StageOut[227]~344\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & (\dc|mult_y\(16))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(16),
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\);

-- Location: LCCOMB_X39_Y35_N12
\dc|Div1|auto_generated|divider|divider|StageOut[225]~346\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[225]~346_combout\ = (\dc|mult_y\(14) & \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(14),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[225]~346_combout\);

-- Location: LCCOMB_X33_Y33_N24
\dc|Div1|auto_generated|divider|divider|StageOut[282]~356\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[282]~356_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & (\dc|mult_y\(5))) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_19~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(5),
	datab => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_19~16_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[282]~356_combout\);

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: CLKCTRL_G3
\pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \pl|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: CLKCTRL_G15
\clk_33MHz~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_33MHz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_33MHz~clkctrl_outclk\);

-- Location: LCCOMB_X38_Y30_N4
\dc|mult_x[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_x[9]~feeder_combout\ = \dc|Mult0|auto_generated|mac_out2~DATAOUT9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|Mult0|auto_generated|mac_out2~DATAOUT9\,
	combout => \dc|mult_x[9]~feeder_combout\);

-- Location: LCCOMB_X33_Y34_N20
\dc|mult_y[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_y[5]~feeder_combout\ = \dc|Mult1|auto_generated|mac_out2~DATAOUT5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|Mult1|auto_generated|mac_out2~DATAOUT5\,
	combout => \dc|mult_y[5]~feeder_combout\);

-- Location: IOOBUF_X38_Y73_N16
\VGA_HS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|v|HS~1_combout\,
	devoe => ww_devoe,
	o => ww_VGA_HS);

-- Location: IOOBUF_X54_Y73_N2
\VGA_VS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|v|VS~2_combout\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

-- Location: IOOBUF_X31_Y73_N9
\VGA_BLANK_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|ALT_INV_blk~0_combout\,
	devoe => ww_devoe,
	o => ww_VGA_BLANK_N);

-- Location: IOOBUF_X35_Y73_N16
\VGA_SYNC_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_SYNC_N);

-- Location: IOOBUF_X47_Y73_N2
\VGA_CLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_clk_50MHz~combout\,
	devoe => ww_devoe,
	o => ww_VGA_CLK);

-- Location: IOOBUF_X33_Y73_N2
\VGA_R[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~0_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(0));

-- Location: IOOBUF_X31_Y73_N2
\VGA_R[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~1_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(1));

-- Location: IOOBUF_X35_Y73_N23
\VGA_R[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~2_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(2));

-- Location: IOOBUF_X33_Y73_N9
\VGA_R[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~3_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(3));

-- Location: IOOBUF_X20_Y73_N9
\VGA_R[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~4_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(4));

-- Location: IOOBUF_X40_Y73_N9
\VGA_R[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~5_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(5));

-- Location: IOOBUF_X11_Y73_N23
\VGA_R[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~6_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(6));

-- Location: IOOBUF_X20_Y73_N16
\VGA_R[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_R~7_combout\,
	devoe => ww_devoe,
	o => ww_VGA_R(7));

-- Location: IOOBUF_X11_Y73_N16
\VGA_G[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~0_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(0));

-- Location: IOOBUF_X25_Y73_N16
\VGA_G[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~1_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(1));

-- Location: IOOBUF_X11_Y73_N9
\VGA_G[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~2_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(2));

-- Location: IOOBUF_X25_Y73_N23
\VGA_G[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~3_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(3));

-- Location: IOOBUF_X16_Y73_N9
\VGA_G[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~4_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(4));

-- Location: IOOBUF_X16_Y73_N2
\VGA_G[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~5_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(5));

-- Location: IOOBUF_X20_Y73_N2
\VGA_G[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~6_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(6));

-- Location: IOOBUF_X23_Y73_N16
\VGA_G[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_G~7_combout\,
	devoe => ww_devoe,
	o => ww_VGA_G(7));

-- Location: IOOBUF_X38_Y73_N9
\VGA_B[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~0_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(0));

-- Location: IOOBUF_X38_Y73_N2
\VGA_B[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~1_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(1));

-- Location: IOOBUF_X23_Y73_N2
\VGA_B[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~2_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(2));

-- Location: IOOBUF_X42_Y73_N9
\VGA_B[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~3_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(3));

-- Location: IOOBUF_X42_Y73_N2
\VGA_B[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~4_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(4));

-- Location: IOOBUF_X52_Y73_N16
\VGA_B[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~5_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(5));

-- Location: IOOBUF_X23_Y73_N9
\VGA_B[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~6_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(6));

-- Location: IOOBUF_X52_Y73_N23
\VGA_B[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dc|VGA_B~7_combout\,
	devoe => ww_devoe,
	o => ww_VGA_B(7));

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(0),
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(1),
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(2),
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(3),
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(4),
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(5),
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(6),
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(7),
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X69_Y73_N2
\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(8),
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X83_Y73_N23
\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(9),
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOOBUF_X60_Y73_N23
\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(10),
	devoe => ww_devoe,
	o => ww_LEDR(10));

-- Location: IOOBUF_X65_Y73_N23
\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(11),
	devoe => ww_devoe,
	o => ww_LEDR(11));

-- Location: IOOBUF_X65_Y73_N16
\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(12),
	devoe => ww_devoe,
	o => ww_LEDR(12));

-- Location: IOOBUF_X67_Y73_N9
\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(13),
	devoe => ww_devoe,
	o => ww_LEDR(13));

-- Location: IOOBUF_X58_Y73_N2
\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(14),
	devoe => ww_devoe,
	o => ww_LEDR(14));

-- Location: IOOBUF_X65_Y73_N9
\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|GPU_data_out\(15),
	devoe => ww_devoe,
	o => ww_LEDR(15));

-- Location: IOOBUF_X67_Y73_N2
\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(16));

-- Location: IOOBUF_X60_Y73_N16
\LEDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(17));

-- Location: IOOBUF_X23_Y0_N16
\SRAM_CE_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SRAM_CE_N);

-- Location: IOOBUF_X1_Y0_N23
\SRAM_OE_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_OE_N~0_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_OE_N);

-- Location: IOOBUF_X23_Y0_N23
\SRAM_WE_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_WE_N);

-- Location: IOOBUF_X1_Y0_N9
\SRAM_LB_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SRAM_LB_N);

-- Location: IOOBUF_X0_Y4_N2
\SRAM_UB_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SRAM_UB_N);

-- Location: IOOBUF_X16_Y0_N2
\SRAM_ADDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[0]~3_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(0));

-- Location: IOOBUF_X3_Y0_N2
\SRAM_ADDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[1]~5_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(1));

-- Location: IOOBUF_X20_Y0_N16
\SRAM_ADDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[2]~7_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(2));

-- Location: IOOBUF_X9_Y0_N2
\SRAM_ADDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[3]~9_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(3));

-- Location: IOOBUF_X0_Y4_N9
\SRAM_ADDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[4]~11_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(4));

-- Location: IOOBUF_X1_Y0_N16
\SRAM_ADDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[5]~13_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(5));

-- Location: IOOBUF_X0_Y4_N23
\SRAM_ADDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[6]~15_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(6));

-- Location: IOOBUF_X0_Y5_N16
\SRAM_ADDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[7]~17_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(7));

-- Location: IOOBUF_X5_Y0_N16
\SRAM_ADDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[8]~19_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(8));

-- Location: IOOBUF_X0_Y31_N16
\SRAM_ADDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[9]~21_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(9));

-- Location: IOOBUF_X0_Y6_N2
\SRAM_ADDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[10]~23_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(10));

-- Location: IOOBUF_X0_Y22_N16
\SRAM_ADDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[11]~25_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(11));

-- Location: IOOBUF_X0_Y8_N23
\SRAM_ADDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[12]~27_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(12));

-- Location: IOOBUF_X0_Y23_N23
\SRAM_ADDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[13]~29_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(13));

-- Location: IOOBUF_X0_Y19_N2
\SRAM_ADDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[14]~31_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(14));

-- Location: IOOBUF_X27_Y0_N9
\SRAM_ADDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[15]~33_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(15));

-- Location: IOOBUF_X49_Y0_N9
\SRAM_ADDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[16]~35_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(16));

-- Location: IOOBUF_X11_Y0_N9
\SRAM_ADDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[17]~37_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(17));

-- Location: IOOBUF_X11_Y0_N2
\SRAM_ADDR[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[18]~38_combout\,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(18));

-- Location: IOOBUF_X0_Y20_N16
\SRAM_ADDR[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SRAM_ADDR(19));

-- Location: IOOBUF_X5_Y0_N9
\SRAM_DQ[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[0]~5_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(0));

-- Location: IOOBUF_X1_Y0_N2
\SRAM_DQ[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[1]~8_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(1));

-- Location: IOOBUF_X9_Y0_N23
\SRAM_DQ[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[2]~11_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(2));

-- Location: IOOBUF_X9_Y0_N16
\SRAM_DQ[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[3]~14_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(3));

-- Location: IOOBUF_X7_Y0_N16
\SRAM_DQ[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[4]~17_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(4));

-- Location: IOOBUF_X11_Y0_N23
\SRAM_DQ[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[5]~20_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(5));

-- Location: IOOBUF_X11_Y0_N16
\SRAM_DQ[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[6]~23_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(6));

-- Location: IOOBUF_X20_Y0_N9
\SRAM_DQ[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[7]~26_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(7));

-- Location: IOOBUF_X0_Y21_N16
\SRAM_DQ[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[8]~29_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(8));

-- Location: IOOBUF_X0_Y22_N23
\SRAM_DQ[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[9]~32_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(9));

-- Location: IOOBUF_X0_Y17_N16
\SRAM_DQ[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[10]~35_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(10));

-- Location: IOOBUF_X0_Y16_N16
\SRAM_DQ[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[11]~38_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(11));

-- Location: IOOBUF_X0_Y7_N9
\SRAM_DQ[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[12]~41_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(12));

-- Location: IOOBUF_X3_Y0_N23
\SRAM_DQ[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[13]~44_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(13));

-- Location: IOOBUF_X7_Y0_N23
\SRAM_DQ[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vc|sram_dq_out[14]~47_combout\,
	oe => \vc|ALT_INV_SRAM_ADDR[18]~39_combout\,
	devoe => ww_devoe,
	o => SRAM_DQ(14));

-- Location: IOOBUF_X3_Y0_N16
\SRAM_DQ[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \vc|SRAM_ADDR[18]~39_combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => SRAM_DQ(15));

-- Location: LCCOMB_X35_Y30_N24
\w_x[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_x[5]~1_combout\ = (\always1~2_combout\) # (!count(26))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datac => \always1~2_combout\,
	combout => \w_x[5]~1_combout\);

-- Location: LCCOMB_X35_Y30_N12
\Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~20_combout\ = (\always1~2_combout\ & !w_x(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datac => w_x(0),
	combout => \Add2~20_combout\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: FF_X35_Y30_N13
\w_x[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~20_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(0));

-- Location: LCCOMB_X34_Y30_N10
\Add2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~1_cout\ = CARRY(!w_x(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_x(0),
	datad => VCC,
	cout => \Add2~1_cout\);

-- Location: LCCOMB_X34_Y30_N12
\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (w_x(1) & ((\Add2~1_cout\) # (GND))) # (!w_x(1) & (!\Add2~1_cout\))
-- \Add2~3\ = CARRY((w_x(1)) # (!\Add2~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => w_x(1),
	datad => VCC,
	cin => \Add2~1_cout\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X34_Y30_N2
\Add2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~19_combout\ = (\w_x[5]~0_combout\ & !\Add2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \w_x[5]~0_combout\,
	datad => \Add2~2_combout\,
	combout => \Add2~19_combout\);

-- Location: FF_X34_Y30_N3
\w_x[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~19_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(1));

-- Location: LCCOMB_X34_Y30_N14
\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (w_x(2) & (\Add2~3\ $ (GND))) # (!w_x(2) & (!\Add2~3\ & VCC))
-- \Add2~5\ = CARRY((w_x(2) & !\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => w_x(2),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: LCCOMB_X35_Y30_N8
\Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~18_combout\ = (\w_x[5]~0_combout\ & \Add2~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_x[5]~0_combout\,
	datad => \Add2~4_combout\,
	combout => \Add2~18_combout\);

-- Location: FF_X35_Y30_N9
\w_x[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~18_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(2));

-- Location: LCCOMB_X34_Y30_N16
\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (w_x(3) & (!\Add2~5\)) # (!w_x(3) & ((\Add2~5\) # (GND)))
-- \Add2~7\ = CARRY((!\Add2~5\) # (!w_x(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_x(3),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X34_Y30_N18
\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (w_x(4) & (\Add2~7\ $ (GND))) # (!w_x(4) & (!\Add2~7\ & VCC))
-- \Add2~9\ = CARRY((w_x(4) & !\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_x(4),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X34_Y30_N4
\Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = (\w_x[5]~0_combout\ & \Add2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \w_x[5]~0_combout\,
	datad => \Add2~8_combout\,
	combout => \Add2~16_combout\);

-- Location: FF_X34_Y30_N5
\w_x[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~16_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(4));

-- Location: LCCOMB_X34_Y30_N20
\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (w_x(5) & (!\Add2~9\)) # (!w_x(5) & ((\Add2~9\) # (GND)))
-- \Add2~11\ = CARRY((!\Add2~9\) # (!w_x(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => w_x(5),
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: LCCOMB_X34_Y30_N30
\Add2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~15_combout\ = (\w_x[5]~0_combout\ & \Add2~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \w_x[5]~0_combout\,
	datad => \Add2~10_combout\,
	combout => \Add2~15_combout\);

-- Location: FF_X34_Y30_N31
\w_x[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~15_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(5));

-- Location: LCCOMB_X34_Y30_N22
\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = (w_x(6) & (\Add2~11\ $ (GND))) # (!w_x(6) & (!\Add2~11\ & VCC))
-- \Add2~13\ = CARRY((w_x(6) & !\Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => w_x(6),
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: LCCOMB_X34_Y30_N0
\Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (\w_x[5]~0_combout\ & \Add2~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_x[5]~0_combout\,
	datac => \Add2~12_combout\,
	combout => \Add2~14_combout\);

-- Location: FF_X34_Y30_N1
\w_x[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~14_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(6));

-- Location: LCCOMB_X34_Y30_N8
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!w_x(3) & (!w_x(4) & (!w_x(5) & !w_x(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_x(3),
	datab => w_x(4),
	datac => w_x(5),
	datad => w_x(6),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X35_Y30_N2
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!w_x(2) & \LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => w_x(2),
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X35_Y30_N20
\w_x[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_x[5]~0_combout\ = (\always1~2_combout\ & ((\Equal0~0_combout\) # ((!w_x(0)) # (!\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \LessThan0~1_combout\,
	datac => \always1~2_combout\,
	datad => w_x(0),
	combout => \w_x[5]~0_combout\);

-- Location: LCCOMB_X35_Y30_N30
\w_x[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_x[8]~2_combout\ = (\w_x[5]~1_combout\ & (\Add2~24_combout\ & ((\w_x[5]~0_combout\)))) # (!\w_x[5]~1_combout\ & (((w_x(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~24_combout\,
	datab => \w_x[5]~1_combout\,
	datac => w_x(8),
	datad => \w_x[5]~0_combout\,
	combout => \w_x[8]~2_combout\);

-- Location: FF_X35_Y30_N31
\w_x[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_x[8]~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(8));

-- Location: LCCOMB_X34_Y30_N24
\Add2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~21_combout\ = (w_x(7) & (!\Add2~13\)) # (!w_x(7) & ((\Add2~13\) # (GND)))
-- \Add2~22\ = CARRY((!\Add2~13\) # (!w_x(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => w_x(7),
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~21_combout\,
	cout => \Add2~22\);

-- Location: LCCOMB_X35_Y30_N14
\Add2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~23_combout\ = (\w_x[5]~0_combout\ & \Add2~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_x[5]~0_combout\,
	datad => \Add2~21_combout\,
	combout => \Add2~23_combout\);

-- Location: FF_X35_Y30_N15
\w_x[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~23_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(7));

-- Location: LCCOMB_X35_Y30_N16
\LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ((\LessThan0~1_combout\ & ((w_x(0)) # (w_x(1))))) # (!w_x(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_x(0),
	datab => w_x(1),
	datac => w_x(7),
	datad => \LessThan0~1_combout\,
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X36_Y26_N0
\Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~1_cout\ = CARRY(!w_y(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_y(0),
	datad => VCC,
	cout => \Add1~1_cout\);

-- Location: LCCOMB_X36_Y26_N2
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (w_y(1) & ((\Add1~1_cout\) # (GND))) # (!w_y(1) & (!\Add1~1_cout\))
-- \Add1~3\ = CARRY((w_y(1)) # (!\Add1~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_y(1),
	datad => VCC,
	cin => \Add1~1_cout\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X36_Y26_N4
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (w_y(2) & (\Add1~3\ $ (GND))) # (!w_y(2) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((w_y(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_y(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X36_Y26_N6
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (w_y(3) & (!\Add1~5\)) # (!w_y(3) & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!w_y(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_y(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X36_Y26_N8
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (w_y(4) & (\Add1~7\ $ (GND))) # (!w_y(4) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((w_y(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => w_y(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X35_Y30_N26
\w_y[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[3]~0_combout\ = (!\w_x[5]~0_combout\ & ((\always1~2_combout\) # (!count(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datac => \always1~2_combout\,
	datad => \w_x[5]~0_combout\,
	combout => \w_y[3]~0_combout\);

-- Location: LCCOMB_X35_Y26_N18
\w_y[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[4]~6_combout\ = (\w_y[3]~0_combout\ & (\always1~2_combout\ & (\Add1~8_combout\))) # (!\w_y[3]~0_combout\ & (((w_y(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \Add1~8_combout\,
	datac => w_y(4),
	datad => \w_y[3]~0_combout\,
	combout => \w_y[4]~6_combout\);

-- Location: FF_X35_Y26_N19
\w_y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[4]~6_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(4));

-- Location: LCCOMB_X36_Y26_N10
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (w_y(5) & (!\Add1~9\)) # (!w_y(5) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!w_y(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_y(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X36_Y26_N12
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (w_y(6) & (\Add1~11\ $ (GND))) # (!w_y(6) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((w_y(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => w_y(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X35_Y26_N28
\w_y[6]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[6]~4_combout\ = (\w_y[3]~0_combout\ & (\always1~2_combout\ & (\Add1~12_combout\))) # (!\w_y[3]~0_combout\ & (((w_y(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \Add1~12_combout\,
	datac => w_y(6),
	datad => \w_y[3]~0_combout\,
	combout => \w_y[6]~4_combout\);

-- Location: FF_X35_Y26_N29
\w_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[6]~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(6));

-- Location: LCCOMB_X36_Y26_N14
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (w_y(7) & (!\Add1~13\)) # (!w_y(7) & ((\Add1~13\) # (GND)))
-- \Add1~15\ = CARRY((!\Add1~13\) # (!w_y(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_y(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X36_Y26_N16
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (w_y(8) & (\Add1~15\ $ (GND))) # (!w_y(8) & (!\Add1~15\ & VCC))
-- \Add1~17\ = CARRY((w_y(8) & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => w_y(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X36_Y26_N18
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = \Add1~17\ $ (w_y(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => w_y(9),
	cin => \Add1~17\,
	combout => \Add1~18_combout\);

-- Location: LCCOMB_X36_Y26_N20
\w_y[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[9]~1_combout\ = (\w_y[3]~0_combout\ & (\always1~2_combout\ & ((\Add1~18_combout\)))) # (!\w_y[3]~0_combout\ & (((w_y(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_y[3]~0_combout\,
	datab => \always1~2_combout\,
	datac => w_y(9),
	datad => \Add1~18_combout\,
	combout => \w_y[9]~1_combout\);

-- Location: FF_X36_Y26_N21
\w_y[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[9]~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(9));

-- Location: LCCOMB_X38_Y32_N18
\vc|counter[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|counter[0]~2_combout\ = !\vc|counter\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vc|counter\(0),
	combout => \vc|counter[0]~2_combout\);

-- Location: FF_X38_Y32_N19
\vc|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|counter[0]~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|counter\(0));

-- Location: LCCOMB_X38_Y32_N8
\vc|counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|counter~1_combout\ = (\vc|counter\(2) & ((!\vc|counter\(0)))) # (!\vc|counter\(2) & (\vc|counter\(1) & \vc|counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|counter\(1),
	datac => \vc|counter\(2),
	datad => \vc|counter\(0),
	combout => \vc|counter~1_combout\);

-- Location: FF_X38_Y32_N9
\vc|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|counter~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|counter\(2));

-- Location: LCCOMB_X38_Y32_N24
\vc|counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|counter~0_combout\ = (\vc|counter\(1) & ((!\vc|counter\(0)))) # (!\vc|counter\(1) & (!\vc|counter\(2) & \vc|counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|counter\(2),
	datac => \vc|counter\(1),
	datad => \vc|counter\(0),
	combout => \vc|counter~0_combout\);

-- Location: FF_X38_Y32_N25
\vc|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|counter~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|counter\(1));

-- Location: LCCOMB_X38_Y32_N20
\vc|always5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|always5~0_combout\ = (!\vc|counter\(1) & (!\vc|counter\(2) & !\vc|counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|counter\(1),
	datac => \vc|counter\(2),
	datad => \vc|counter\(0),
	combout => \vc|always5~0_combout\);

-- Location: LCCOMB_X38_Y36_N12
\dc|v|col_counter|Q[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[1]~13_combout\ = (\dc|v|col_counter|Q\(1) & (!\dc|v|col_counter|Q[0]~12\)) # (!\dc|v|col_counter|Q\(1) & ((\dc|v|col_counter|Q[0]~12\) # (GND)))
-- \dc|v|col_counter|Q[1]~14\ = CARRY((!\dc|v|col_counter|Q[0]~12\) # (!\dc|v|col_counter|Q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(1),
	datad => VCC,
	cin => \dc|v|col_counter|Q[0]~12\,
	combout => \dc|v|col_counter|Q[1]~13_combout\,
	cout => \dc|v|col_counter|Q[1]~14\);

-- Location: LCCOMB_X38_Y32_N28
\dc|vram_ctrl~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|vram_ctrl~0_combout\ = (\dc|v|col_counter|Q\(5) & (\dc|v|col_counter|Q\(4) & \dc|v|col_counter|Q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(5),
	datac => \dc|v|col_counter|Q\(4),
	datad => \dc|v|col_counter|Q\(3),
	combout => \dc|vram_ctrl~0_combout\);

-- Location: LCCOMB_X38_Y32_N14
\dc|v|LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|LessThan4~0_combout\ = (((!\dc|vram_ctrl~0_combout\) # (!\dc|v|col_counter|Q\(2))) # (!\dc|v|col_counter|Q\(1))) # (!\dc|v|col_counter|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(0),
	datab => \dc|v|col_counter|Q\(1),
	datac => \dc|v|col_counter|Q\(2),
	datad => \dc|vram_ctrl~0_combout\,
	combout => \dc|v|LessThan4~0_combout\);

-- Location: LCCOMB_X38_Y36_N28
\dc|v|col_counter|Q[9]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[9]~29_combout\ = (\dc|v|col_counter|Q\(9) & (!\dc|v|col_counter|Q[8]~28\)) # (!\dc|v|col_counter|Q\(9) & ((\dc|v|col_counter|Q[8]~28\) # (GND)))
-- \dc|v|col_counter|Q[9]~30\ = CARRY((!\dc|v|col_counter|Q[8]~28\) # (!\dc|v|col_counter|Q\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(9),
	datad => VCC,
	cin => \dc|v|col_counter|Q[8]~28\,
	combout => \dc|v|col_counter|Q[9]~29_combout\,
	cout => \dc|v|col_counter|Q[9]~30\);

-- Location: LCCOMB_X38_Y36_N30
\dc|v|col_counter|Q[10]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[10]~31_combout\ = \dc|v|col_counter|Q[9]~30\ $ (!\dc|v|col_counter|Q\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \dc|v|col_counter|Q\(10),
	cin => \dc|v|col_counter|Q[9]~30\,
	combout => \dc|v|col_counter|Q[10]~31_combout\);

-- Location: FF_X38_Y36_N31
\dc|v|col_counter|Q[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[10]~31_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(10));

-- Location: LCCOMB_X38_Y32_N6
\dc|v|LessThan4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|LessThan4~2_combout\ = (\dc|v|col_counter|Q\(9) & (\dc|v|col_counter|Q\(10) & ((!\dc|v|LessThan4~0_combout\) # (!\dc|v|LessThan4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|LessThan4~1_combout\,
	datab => \dc|v|LessThan4~0_combout\,
	datac => \dc|v|col_counter|Q\(9),
	datad => \dc|v|col_counter|Q\(10),
	combout => \dc|v|LessThan4~2_combout\);

-- Location: FF_X38_Y36_N13
\dc|v|col_counter|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[1]~13_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(1));

-- Location: LCCOMB_X38_Y36_N14
\dc|v|col_counter|Q[2]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[2]~15_combout\ = (\dc|v|col_counter|Q\(2) & (\dc|v|col_counter|Q[1]~14\ $ (GND))) # (!\dc|v|col_counter|Q\(2) & (!\dc|v|col_counter|Q[1]~14\ & VCC))
-- \dc|v|col_counter|Q[2]~16\ = CARRY((\dc|v|col_counter|Q\(2) & !\dc|v|col_counter|Q[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(2),
	datad => VCC,
	cin => \dc|v|col_counter|Q[1]~14\,
	combout => \dc|v|col_counter|Q[2]~15_combout\,
	cout => \dc|v|col_counter|Q[2]~16\);

-- Location: FF_X38_Y36_N15
\dc|v|col_counter|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[2]~15_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(2));

-- Location: LCCOMB_X38_Y36_N16
\dc|v|col_counter|Q[3]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[3]~17_combout\ = (\dc|v|col_counter|Q\(3) & (!\dc|v|col_counter|Q[2]~16\)) # (!\dc|v|col_counter|Q\(3) & ((\dc|v|col_counter|Q[2]~16\) # (GND)))
-- \dc|v|col_counter|Q[3]~18\ = CARRY((!\dc|v|col_counter|Q[2]~16\) # (!\dc|v|col_counter|Q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(3),
	datad => VCC,
	cin => \dc|v|col_counter|Q[2]~16\,
	combout => \dc|v|col_counter|Q[3]~17_combout\,
	cout => \dc|v|col_counter|Q[3]~18\);

-- Location: FF_X38_Y36_N17
\dc|v|col_counter|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[3]~17_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(3));

-- Location: LCCOMB_X38_Y36_N18
\dc|v|col_counter|Q[4]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[4]~19_combout\ = (\dc|v|col_counter|Q\(4) & (\dc|v|col_counter|Q[3]~18\ $ (GND))) # (!\dc|v|col_counter|Q\(4) & (!\dc|v|col_counter|Q[3]~18\ & VCC))
-- \dc|v|col_counter|Q[4]~20\ = CARRY((\dc|v|col_counter|Q\(4) & !\dc|v|col_counter|Q[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(4),
	datad => VCC,
	cin => \dc|v|col_counter|Q[3]~18\,
	combout => \dc|v|col_counter|Q[4]~19_combout\,
	cout => \dc|v|col_counter|Q[4]~20\);

-- Location: FF_X38_Y36_N19
\dc|v|col_counter|Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[4]~19_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(4));

-- Location: LCCOMB_X38_Y36_N20
\dc|v|col_counter|Q[5]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[5]~21_combout\ = (\dc|v|col_counter|Q\(5) & (!\dc|v|col_counter|Q[4]~20\)) # (!\dc|v|col_counter|Q\(5) & ((\dc|v|col_counter|Q[4]~20\) # (GND)))
-- \dc|v|col_counter|Q[5]~22\ = CARRY((!\dc|v|col_counter|Q[4]~20\) # (!\dc|v|col_counter|Q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(5),
	datad => VCC,
	cin => \dc|v|col_counter|Q[4]~20\,
	combout => \dc|v|col_counter|Q[5]~21_combout\,
	cout => \dc|v|col_counter|Q[5]~22\);

-- Location: FF_X38_Y36_N21
\dc|v|col_counter|Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[5]~21_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(5));

-- Location: LCCOMB_X38_Y36_N22
\dc|v|col_counter|Q[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[6]~23_combout\ = (\dc|v|col_counter|Q\(6) & (\dc|v|col_counter|Q[5]~22\ $ (GND))) # (!\dc|v|col_counter|Q\(6) & (!\dc|v|col_counter|Q[5]~22\ & VCC))
-- \dc|v|col_counter|Q[6]~24\ = CARRY((\dc|v|col_counter|Q\(6) & !\dc|v|col_counter|Q[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(6),
	datad => VCC,
	cin => \dc|v|col_counter|Q[5]~22\,
	combout => \dc|v|col_counter|Q[6]~23_combout\,
	cout => \dc|v|col_counter|Q[6]~24\);

-- Location: LCCOMB_X38_Y36_N24
\dc|v|col_counter|Q[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[7]~25_combout\ = (\dc|v|col_counter|Q\(7) & (!\dc|v|col_counter|Q[6]~24\)) # (!\dc|v|col_counter|Q\(7) & ((\dc|v|col_counter|Q[6]~24\) # (GND)))
-- \dc|v|col_counter|Q[7]~26\ = CARRY((!\dc|v|col_counter|Q[6]~24\) # (!\dc|v|col_counter|Q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(7),
	datad => VCC,
	cin => \dc|v|col_counter|Q[6]~24\,
	combout => \dc|v|col_counter|Q[7]~25_combout\,
	cout => \dc|v|col_counter|Q[7]~26\);

-- Location: FF_X38_Y36_N25
\dc|v|col_counter|Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[7]~25_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(7));

-- Location: LCCOMB_X38_Y36_N26
\dc|v|col_counter|Q[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[8]~27_combout\ = (\dc|v|col_counter|Q\(8) & (\dc|v|col_counter|Q[7]~26\ $ (GND))) # (!\dc|v|col_counter|Q\(8) & (!\dc|v|col_counter|Q[7]~26\ & VCC))
-- \dc|v|col_counter|Q[8]~28\ = CARRY((\dc|v|col_counter|Q\(8) & !\dc|v|col_counter|Q[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(8),
	datad => VCC,
	cin => \dc|v|col_counter|Q[7]~26\,
	combout => \dc|v|col_counter|Q[8]~27_combout\,
	cout => \dc|v|col_counter|Q[8]~28\);

-- Location: FF_X38_Y36_N27
\dc|v|col_counter|Q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[8]~27_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(8));

-- Location: LCCOMB_X38_Y36_N0
\dc|v|col_counter|Q[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|col_counter|Q[9]~feeder_combout\ = \dc|v|col_counter|Q[9]~29_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|v|col_counter|Q[9]~29_combout\,
	combout => \dc|v|col_counter|Q[9]~feeder_combout\);

-- Location: FF_X38_Y36_N1
\dc|v|col_counter|Q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[9]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(9));

-- Location: LCCOMB_X38_Y32_N22
\dc|vram_ctrl~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|vram_ctrl~1_combout\ = (\dc|vram_ctrl~0_combout\ & ((\dc|v|col_counter|Q\(2)) # ((\dc|v|col_counter|Q\(0) & \dc|v|col_counter|Q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(0),
	datab => \dc|v|col_counter|Q\(1),
	datac => \dc|v|col_counter|Q\(2),
	datad => \dc|vram_ctrl~0_combout\,
	combout => \dc|vram_ctrl~1_combout\);

-- Location: LCCOMB_X38_Y32_N16
\dc|vram_ctrl~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|vram_ctrl~2_combout\ = (\dc|v|col_counter|Q\(9) & (\dc|v|col_counter|Q\(10) & ((\dc|vram_ctrl~1_combout\) # (!\dc|v|LessThan4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|LessThan4~1_combout\,
	datab => \dc|v|col_counter|Q\(9),
	datac => \dc|vram_ctrl~1_combout\,
	datad => \dc|v|col_counter|Q\(10),
	combout => \dc|vram_ctrl~2_combout\);

-- Location: LCCOMB_X38_Y32_N26
\vc|GPU_en_next~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_en_next~0_combout\ = (\dc|vram_re~combout\ & (\dc|vram_ctrl~2_combout\ & ((\vc|always5~0_combout\) # (\vc|GPU_en~q\)))) # (!\dc|vram_re~combout\ & ((\vc|always5~0_combout\) # ((\vc|GPU_en~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|vram_re~combout\,
	datab => \vc|always5~0_combout\,
	datac => \vc|GPU_en~q\,
	datad => \dc|vram_ctrl~2_combout\,
	combout => \vc|GPU_en_next~0_combout\);

-- Location: FF_X38_Y32_N27
\vc|GPU_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_en_next~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_en~q\);

-- Location: LCCOMB_X35_Y32_N0
\always1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \always1~0_combout\ = (count(26) & (!w_y(9) & !\vc|GPU_en~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datab => w_y(9),
	datad => \vc|GPU_en~q\,
	combout => \always1~0_combout\);

-- Location: LCCOMB_X36_Y26_N26
\w_y[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[2]~8_combout\ = (\w_y[3]~0_combout\ & (\Add1~4_combout\ & ((\always1~2_combout\)))) # (!\w_y[3]~0_combout\ & (((w_y(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_y[3]~0_combout\,
	datab => \Add1~4_combout\,
	datac => w_y(2),
	datad => \always1~2_combout\,
	combout => \w_y[2]~8_combout\);

-- Location: FF_X36_Y26_N27
\w_y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[2]~8_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(2));

-- Location: LCCOMB_X36_Y26_N24
\w_y[7]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[7]~3_combout\ = (\w_y[3]~0_combout\ & (\Add1~14_combout\ & ((\always1~2_combout\)))) # (!\w_y[3]~0_combout\ & (((w_y(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_y[3]~0_combout\,
	datab => \Add1~14_combout\,
	datac => w_y(7),
	datad => \always1~2_combout\,
	combout => \w_y[7]~3_combout\);

-- Location: FF_X36_Y26_N25
\w_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[7]~3_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(7));

-- Location: LCCOMB_X36_Y26_N22
\w_y[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[5]~5_combout\ = (\w_y[3]~0_combout\ & (\always1~2_combout\ & ((\Add1~10_combout\)))) # (!\w_y[3]~0_combout\ & (((w_y(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_y[3]~0_combout\,
	datab => \always1~2_combout\,
	datac => w_y(5),
	datad => \Add1~10_combout\,
	combout => \w_y[5]~5_combout\);

-- Location: FF_X36_Y26_N23
\w_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[5]~5_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(5));

-- Location: LCCOMB_X36_Y26_N28
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (((!w_y(6)) # (!w_y(5))) # (!w_y(7))) # (!w_y(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_y(8),
	datab => w_y(7),
	datac => w_y(5),
	datad => w_y(6),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X35_Y32_N24
\always1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \always1~1_combout\ = (\always1~0_combout\ & ((\LessThan1~0_combout\) # ((\LessThan1~1_combout\ & !w_y(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datab => \always1~0_combout\,
	datac => w_y(2),
	datad => \LessThan1~0_combout\,
	combout => \always1~1_combout\);

-- Location: LCCOMB_X35_Y32_N18
\always1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \always1~2_combout\ = (\always1~1_combout\ & (((!w_x(8) & \LessThan0~2_combout\)) # (!w_x(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_x(9),
	datab => w_x(8),
	datac => \LessThan0~2_combout\,
	datad => \always1~1_combout\,
	combout => \always1~2_combout\);

-- Location: LCCOMB_X41_Y36_N14
\dc|v|row_counter|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~4_combout\ = (\dc|v|row_counter|Q\(2) & (\dc|v|row_counter|Add0~3\ $ (GND))) # (!\dc|v|row_counter|Q\(2) & (!\dc|v|row_counter|Add0~3\ & VCC))
-- \dc|v|row_counter|Add0~5\ = CARRY((\dc|v|row_counter|Q\(2) & !\dc|v|row_counter|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(2),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~3\,
	combout => \dc|v|row_counter|Add0~4_combout\,
	cout => \dc|v|row_counter|Add0~5\);

-- Location: LCCOMB_X41_Y36_N0
\dc|v|row_counter|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q~0_combout\ = (\dc|v|row_counter|Add0~4_combout\ & \dc|v|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|v|row_counter|Add0~4_combout\,
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q~0_combout\);

-- Location: LCCOMB_X38_Y32_N0
\dc|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Equal0~0_combout\ = (\dc|v|col_counter|Q\(10) & (!\dc|v|col_counter|Q\(8) & (\dc|v|col_counter|Q\(2) & \dc|vram_ctrl~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(10),
	datab => \dc|v|col_counter|Q\(8),
	datac => \dc|v|col_counter|Q\(2),
	datad => \dc|vram_ctrl~0_combout\,
	combout => \dc|Equal0~0_combout\);

-- Location: LCCOMB_X41_Y36_N2
\dc|v|row_counter|Q[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[3]~1_combout\ = ((!\dc|v|Equal0~0_combout\ & (\dc|v|col_counter|Q\(9) & \dc|Equal0~0_combout\))) # (!\dc|v|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|Equal0~0_combout\,
	datab => \dc|v|col_counter|Q\(9),
	datac => \dc|Equal0~0_combout\,
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q[3]~1_combout\);

-- Location: FF_X41_Y36_N1
\dc|v|row_counter|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|v|row_counter|Q[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(2));

-- Location: LCCOMB_X41_Y36_N16
\dc|v|row_counter|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~6_combout\ = (\dc|v|row_counter|Q\(3) & (!\dc|v|row_counter|Add0~5\)) # (!\dc|v|row_counter|Q\(3) & ((\dc|v|row_counter|Add0~5\) # (GND)))
-- \dc|v|row_counter|Add0~7\ = CARRY((!\dc|v|row_counter|Add0~5\) # (!\dc|v|row_counter|Q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(3),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~5\,
	combout => \dc|v|row_counter|Add0~6_combout\,
	cout => \dc|v|row_counter|Add0~7\);

-- Location: LCCOMB_X41_Y36_N4
\dc|v|row_counter|Q[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[3]~4_combout\ = (\dc|v|row_counter|Q[3]~1_combout\ & (\dc|v|LessThan0~0_combout\ & (\dc|v|row_counter|Add0~6_combout\))) # (!\dc|v|row_counter|Q[3]~1_combout\ & (((\dc|v|row_counter|Q\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|LessThan0~0_combout\,
	datab => \dc|v|row_counter|Add0~6_combout\,
	datac => \dc|v|row_counter|Q\(3),
	datad => \dc|v|row_counter|Q[3]~1_combout\,
	combout => \dc|v|row_counter|Q[3]~4_combout\);

-- Location: FF_X41_Y36_N5
\dc|v|row_counter|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q[3]~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(3));

-- Location: LCCOMB_X41_Y36_N18
\dc|v|row_counter|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~8_combout\ = (\dc|v|row_counter|Q\(4) & (\dc|v|row_counter|Add0~7\ $ (GND))) # (!\dc|v|row_counter|Q\(4) & (!\dc|v|row_counter|Add0~7\ & VCC))
-- \dc|v|row_counter|Add0~9\ = CARRY((\dc|v|row_counter|Q\(4) & !\dc|v|row_counter|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(4),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~7\,
	combout => \dc|v|row_counter|Add0~8_combout\,
	cout => \dc|v|row_counter|Add0~9\);

-- Location: LCCOMB_X41_Y36_N20
\dc|v|row_counter|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~10_combout\ = (\dc|v|row_counter|Q\(5) & (!\dc|v|row_counter|Add0~9\)) # (!\dc|v|row_counter|Q\(5) & ((\dc|v|row_counter|Add0~9\) # (GND)))
-- \dc|v|row_counter|Add0~11\ = CARRY((!\dc|v|row_counter|Add0~9\) # (!\dc|v|row_counter|Q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(5),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~9\,
	combout => \dc|v|row_counter|Add0~10_combout\,
	cout => \dc|v|row_counter|Add0~11\);

-- Location: LCCOMB_X42_Y36_N18
\dc|v|row_counter|Q[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[5]~8_combout\ = (\dc|v|row_counter|Q[3]~1_combout\ & (\dc|v|row_counter|Add0~10_combout\ & ((\dc|v|LessThan0~0_combout\)))) # (!\dc|v|row_counter|Q[3]~1_combout\ & (((\dc|v|row_counter|Q\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q[3]~1_combout\,
	datab => \dc|v|row_counter|Add0~10_combout\,
	datac => \dc|v|row_counter|Q\(5),
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q[5]~8_combout\);

-- Location: FF_X42_Y36_N19
\dc|v|row_counter|Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q[5]~8_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(5));

-- Location: LCCOMB_X42_Y36_N8
\dc|v|row_counter|Q[8]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[8]~5_combout\ = (\dc|v|row_counter|Q[3]~1_combout\ & (\dc|v|row_counter|Add0~16_combout\ & (\dc|v|LessThan0~0_combout\))) # (!\dc|v|row_counter|Q[3]~1_combout\ & (((\dc|v|row_counter|Q\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Add0~16_combout\,
	datab => \dc|v|LessThan0~0_combout\,
	datac => \dc|v|row_counter|Q\(8),
	datad => \dc|v|row_counter|Q[3]~1_combout\,
	combout => \dc|v|row_counter|Q[8]~5_combout\);

-- Location: FF_X42_Y36_N9
\dc|v|row_counter|Q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q[8]~5_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(8));

-- Location: LCCOMB_X41_Y36_N22
\dc|v|row_counter|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~12_combout\ = (\dc|v|row_counter|Q\(6) & (\dc|v|row_counter|Add0~11\ $ (GND))) # (!\dc|v|row_counter|Q\(6) & (!\dc|v|row_counter|Add0~11\ & VCC))
-- \dc|v|row_counter|Add0~13\ = CARRY((\dc|v|row_counter|Q\(6) & !\dc|v|row_counter|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(6),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~11\,
	combout => \dc|v|row_counter|Add0~12_combout\,
	cout => \dc|v|row_counter|Add0~13\);

-- Location: LCCOMB_X42_Y36_N0
\dc|v|row_counter|Q[6]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[6]~7_combout\ = (\dc|v|row_counter|Q[3]~1_combout\ & (\dc|v|row_counter|Add0~12_combout\ & ((\dc|v|LessThan0~0_combout\)))) # (!\dc|v|row_counter|Q[3]~1_combout\ & (((\dc|v|row_counter|Q\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q[3]~1_combout\,
	datab => \dc|v|row_counter|Add0~12_combout\,
	datac => \dc|v|row_counter|Q\(6),
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q[6]~7_combout\);

-- Location: FF_X42_Y36_N1
\dc|v|row_counter|Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q[6]~7_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(6));

-- Location: LCCOMB_X42_Y36_N16
\dc|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Equal2~0_combout\ = (!\dc|v|row_counter|Q\(7) & (!\dc|v|row_counter|Q\(5) & (!\dc|v|row_counter|Q\(8) & !\dc|v|row_counter|Q\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(7),
	datab => \dc|v|row_counter|Q\(5),
	datac => \dc|v|row_counter|Q\(8),
	datad => \dc|v|row_counter|Q\(6),
	combout => \dc|Equal2~0_combout\);

-- Location: LCCOMB_X41_Y36_N30
\dc|v|row_counter|Q[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[4]~3_combout\ = (\dc|v|row_counter|Q[3]~1_combout\ & (\dc|v|LessThan0~0_combout\ & (\dc|v|row_counter|Add0~8_combout\))) # (!\dc|v|row_counter|Q[3]~1_combout\ & (((\dc|v|row_counter|Q\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|LessThan0~0_combout\,
	datab => \dc|v|row_counter|Add0~8_combout\,
	datac => \dc|v|row_counter|Q\(4),
	datad => \dc|v|row_counter|Q[3]~1_combout\,
	combout => \dc|v|row_counter|Q[4]~3_combout\);

-- Location: FF_X41_Y36_N31
\dc|v|row_counter|Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q[4]~3_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(4));

-- Location: LCCOMB_X42_Y36_N2
\dc|v|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|LessThan0~0_combout\ = ((\dc|Equal2~0_combout\ & (!\dc|v|row_counter|Q\(3) & !\dc|v|row_counter|Q\(4)))) # (!\dc|v|row_counter|Q\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(9),
	datab => \dc|Equal2~0_combout\,
	datac => \dc|v|row_counter|Q\(3),
	datad => \dc|v|row_counter|Q\(4),
	combout => \dc|v|LessThan0~0_combout\);

-- Location: LCCOMB_X41_Y36_N8
\dc|v|row_counter|Q~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q~10_combout\ = (\dc|v|row_counter|Add0~0_combout\ & \dc|v|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Add0~0_combout\,
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q~10_combout\);

-- Location: FF_X41_Y36_N9
\dc|v|row_counter|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q~10_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|v|row_counter|Q[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(0));

-- Location: LCCOMB_X42_Y36_N4
\dc|v|VS~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|VS~1_combout\ = (\dc|v|row_counter|Q\(7) & (\dc|v|row_counter|Q\(5) & (\dc|v|row_counter|Q\(8) & \dc|v|row_counter|Q\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(7),
	datab => \dc|v|row_counter|Q\(5),
	datac => \dc|v|row_counter|Q\(8),
	datad => \dc|v|row_counter|Q\(6),
	combout => \dc|v|VS~1_combout\);

-- Location: LCCOMB_X41_Y36_N24
\dc|v|row_counter|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~14_combout\ = (\dc|v|row_counter|Q\(7) & (!\dc|v|row_counter|Add0~13\)) # (!\dc|v|row_counter|Q\(7) & ((\dc|v|row_counter|Add0~13\) # (GND)))
-- \dc|v|row_counter|Add0~15\ = CARRY((!\dc|v|row_counter|Add0~13\) # (!\dc|v|row_counter|Q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(7),
	datad => VCC,
	cin => \dc|v|row_counter|Add0~13\,
	combout => \dc|v|row_counter|Add0~14_combout\,
	cout => \dc|v|row_counter|Add0~15\);

-- Location: LCCOMB_X41_Y36_N28
\dc|v|row_counter|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Add0~18_combout\ = \dc|v|row_counter|Add0~17\ $ (\dc|v|row_counter|Q\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \dc|v|row_counter|Q\(9),
	cin => \dc|v|row_counter|Add0~17\,
	combout => \dc|v|row_counter|Add0~18_combout\);

-- Location: LCCOMB_X42_Y36_N24
\dc|v|row_counter|Q[9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[9]~2_combout\ = (\dc|v|row_counter|Q[3]~1_combout\ & (\dc|v|row_counter|Add0~18_combout\ & ((\dc|v|LessThan0~0_combout\)))) # (!\dc|v|row_counter|Q[3]~1_combout\ & (((\dc|v|row_counter|Q\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q[3]~1_combout\,
	datab => \dc|v|row_counter|Add0~18_combout\,
	datac => \dc|v|row_counter|Q\(9),
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q[9]~2_combout\);

-- Location: FF_X42_Y36_N25
\dc|v|row_counter|Q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q[9]~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(9));

-- Location: LCCOMB_X42_Y36_N20
\dc|v|LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|LessThan3~0_combout\ = (\dc|v|VS~1_combout\) # (\dc|v|row_counter|Q\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|v|VS~1_combout\,
	datad => \dc|v|row_counter|Q\(9),
	combout => \dc|v|LessThan3~0_combout\);

-- Location: LCCOMB_X38_Y36_N2
\dc|blk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|blk~0_combout\ = (\dc|v|LessThan3~0_combout\) # ((\dc|v|col_counter|Q\(10) & ((\dc|v|col_counter|Q\(8)) # (\dc|v|col_counter|Q\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(8),
	datab => \dc|v|col_counter|Q\(9),
	datac => \dc|v|col_counter|Q\(10),
	datad => \dc|v|LessThan3~0_combout\,
	combout => \dc|blk~0_combout\);

-- Location: LCCOMB_X35_Y32_N4
\dc|vram_re\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|vram_re~combout\ = (\dc|blk~0_combout\) # (!\dc|v|row_counter|Q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(0),
	datad => \dc|blk~0_combout\,
	combout => \dc|vram_re~combout\);

-- Location: LCCOMB_X34_Y30_N28
\Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~26_combout\ = \Add2~25\ $ (w_x(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => w_x(9),
	cin => \Add2~25\,
	combout => \Add2~26_combout\);

-- Location: LCCOMB_X35_Y30_N28
\w_x[9]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_x[9]~3_combout\ = (\w_x[5]~1_combout\ & (\Add2~26_combout\ & ((\w_x[5]~0_combout\)))) # (!\w_x[5]~1_combout\ & (((w_x(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_x[5]~1_combout\,
	datab => \Add2~26_combout\,
	datac => w_x(9),
	datad => \w_x[5]~0_combout\,
	combout => \w_x[9]~3_combout\);

-- Location: FF_X35_Y30_N29
\w_x[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_x[9]~3_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(9));

-- Location: LCCOMB_X35_Y30_N18
\vc|sram_dq_out[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[1]~0_combout\ = (w_x(9)) # ((w_x(8) & ((w_x(6)) # (w_x(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_x(6),
	datab => w_x(7),
	datac => w_x(8),
	datad => w_x(9),
	combout => \vc|sram_dq_out[1]~0_combout\);

-- Location: LCCOMB_X33_Y28_N0
\color[2][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][3]~feeder_combout\ = \color[3][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][3]~q\,
	combout => \color[2][3]~feeder_combout\);

-- Location: LCCOMB_X31_Y31_N26
\count[0]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~78_combout\ = !count(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count(0),
	combout => \count[0]~78_combout\);

-- Location: FF_X31_Y31_N27
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[0]~78_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X31_Y32_N6
\count[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[1]~26_combout\ = (count(1) & (count(0) $ (VCC))) # (!count(1) & (count(0) & VCC))
-- \count[1]~27\ = CARRY((count(1) & count(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datab => count(0),
	datad => VCC,
	combout => \count[1]~26_combout\,
	cout => \count[1]~27\);

-- Location: LCCOMB_X31_Y32_N8
\count[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[2]~28_combout\ = (count(2) & (!\count[1]~27\)) # (!count(2) & ((\count[1]~27\) # (GND)))
-- \count[2]~29\ = CARRY((!\count[1]~27\) # (!count(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(2),
	datad => VCC,
	cin => \count[1]~27\,
	combout => \count[2]~28_combout\,
	cout => \count[2]~29\);

-- Location: FF_X31_Y32_N9
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[2]~28_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X31_Y32_N12
\count[4]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[4]~32_combout\ = (count(4) & (!\count[3]~31\)) # (!count(4) & ((\count[3]~31\) # (GND)))
-- \count[4]~33\ = CARRY((!\count[3]~31\) # (!count(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(4),
	datad => VCC,
	cin => \count[3]~31\,
	combout => \count[4]~32_combout\,
	cout => \count[4]~33\);

-- Location: LCCOMB_X31_Y32_N14
\count[5]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[5]~34_combout\ = (count(5) & (\count[4]~33\ $ (GND))) # (!count(5) & (!\count[4]~33\ & VCC))
-- \count[5]~35\ = CARRY((count(5) & !\count[4]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(5),
	datad => VCC,
	cin => \count[4]~33\,
	combout => \count[5]~34_combout\,
	cout => \count[5]~35\);

-- Location: FF_X31_Y32_N15
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[5]~34_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LCCOMB_X31_Y32_N16
\count[6]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[6]~36_combout\ = (count(6) & (!\count[5]~35\)) # (!count(6) & ((\count[5]~35\) # (GND)))
-- \count[6]~37\ = CARRY((!\count[5]~35\) # (!count(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(6),
	datad => VCC,
	cin => \count[5]~35\,
	combout => \count[6]~36_combout\,
	cout => \count[6]~37\);

-- Location: FF_X31_Y32_N17
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[6]~36_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: LCCOMB_X31_Y32_N18
\count[7]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[7]~38_combout\ = (count(7) & (\count[6]~37\ $ (GND))) # (!count(7) & (!\count[6]~37\ & VCC))
-- \count[7]~39\ = CARRY((count(7) & !\count[6]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(7),
	datad => VCC,
	cin => \count[6]~37\,
	combout => \count[7]~38_combout\,
	cout => \count[7]~39\);

-- Location: FF_X31_Y32_N19
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[7]~38_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LCCOMB_X31_Y32_N20
\count[8]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[8]~40_combout\ = (count(8) & (!\count[7]~39\)) # (!count(8) & ((\count[7]~39\) # (GND)))
-- \count[8]~41\ = CARRY((!\count[7]~39\) # (!count(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(8),
	datad => VCC,
	cin => \count[7]~39\,
	combout => \count[8]~40_combout\,
	cout => \count[8]~41\);

-- Location: FF_X31_Y32_N21
\count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[8]~40_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(8));

-- Location: LCCOMB_X31_Y32_N24
\count[10]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[10]~44_combout\ = (count(10) & (!\count[9]~43\)) # (!count(10) & ((\count[9]~43\) # (GND)))
-- \count[10]~45\ = CARRY((!\count[9]~43\) # (!count(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(10),
	datad => VCC,
	cin => \count[9]~43\,
	combout => \count[10]~44_combout\,
	cout => \count[10]~45\);

-- Location: FF_X31_Y32_N25
\count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[10]~44_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(10));

-- Location: LCCOMB_X31_Y32_N26
\count[11]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[11]~46_combout\ = (count(11) & (\count[10]~45\ $ (GND))) # (!count(11) & (!\count[10]~45\ & VCC))
-- \count[11]~47\ = CARRY((count(11) & !\count[10]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(11),
	datad => VCC,
	cin => \count[10]~45\,
	combout => \count[11]~46_combout\,
	cout => \count[11]~47\);

-- Location: LCCOMB_X31_Y32_N28
\count[12]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[12]~48_combout\ = (count(12) & (!\count[11]~47\)) # (!count(12) & ((\count[11]~47\) # (GND)))
-- \count[12]~49\ = CARRY((!\count[11]~47\) # (!count(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(12),
	datad => VCC,
	cin => \count[11]~47\,
	combout => \count[12]~48_combout\,
	cout => \count[12]~49\);

-- Location: FF_X31_Y32_N29
\count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[12]~48_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(12));

-- Location: FF_X31_Y32_N27
\count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[11]~46_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(11));

-- Location: LCCOMB_X31_Y32_N2
\color[3][3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~3_combout\ = (count(9) & (count(12) & (count(11) & count(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(9),
	datab => count(12),
	datac => count(11),
	datad => count(10),
	combout => \color[3][3]~3_combout\);

-- Location: LCCOMB_X31_Y31_N0
\count[14]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[14]~52_combout\ = (count(14) & (!\count[13]~51\)) # (!count(14) & ((\count[13]~51\) # (GND)))
-- \count[14]~53\ = CARRY((!\count[13]~51\) # (!count(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(14),
	datad => VCC,
	cin => \count[13]~51\,
	combout => \count[14]~52_combout\,
	cout => \count[14]~53\);

-- Location: FF_X31_Y31_N1
\count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[14]~52_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(14));

-- Location: LCCOMB_X31_Y31_N2
\count[15]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[15]~54_combout\ = (count(15) & (\count[14]~53\ $ (GND))) # (!count(15) & (!\count[14]~53\ & VCC))
-- \count[15]~55\ = CARRY((count(15) & !\count[14]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(15),
	datad => VCC,
	cin => \count[14]~53\,
	combout => \count[15]~54_combout\,
	cout => \count[15]~55\);

-- Location: FF_X31_Y31_N3
\count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[15]~54_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(15));

-- Location: LCCOMB_X31_Y31_N4
\count[16]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[16]~56_combout\ = (count(16) & (!\count[15]~55\)) # (!count(16) & ((\count[15]~55\) # (GND)))
-- \count[16]~57\ = CARRY((!\count[15]~55\) # (!count(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(16),
	datad => VCC,
	cin => \count[15]~55\,
	combout => \count[16]~56_combout\,
	cout => \count[16]~57\);

-- Location: FF_X31_Y31_N5
\count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[16]~56_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(16));

-- Location: LCCOMB_X31_Y31_N6
\count[17]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[17]~58_combout\ = (count(17) & (\count[16]~57\ $ (GND))) # (!count(17) & (!\count[16]~57\ & VCC))
-- \count[17]~59\ = CARRY((count(17) & !\count[16]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(17),
	datad => VCC,
	cin => \count[16]~57\,
	combout => \count[17]~58_combout\,
	cout => \count[17]~59\);

-- Location: LCCOMB_X31_Y31_N8
\count[18]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[18]~60_combout\ = (count(18) & (!\count[17]~59\)) # (!count(18) & ((\count[17]~59\) # (GND)))
-- \count[18]~61\ = CARRY((!\count[17]~59\) # (!count(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(18),
	datad => VCC,
	cin => \count[17]~59\,
	combout => \count[18]~60_combout\,
	cout => \count[18]~61\);

-- Location: FF_X31_Y31_N9
\count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[18]~60_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(18));

-- Location: LCCOMB_X31_Y31_N10
\count[19]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[19]~62_combout\ = (count(19) & (\count[18]~61\ $ (GND))) # (!count(19) & (!\count[18]~61\ & VCC))
-- \count[19]~63\ = CARRY((count(19) & !\count[18]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(19),
	datad => VCC,
	cin => \count[18]~61\,
	combout => \count[19]~62_combout\,
	cout => \count[19]~63\);

-- Location: LCCOMB_X31_Y31_N12
\count[20]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[20]~64_combout\ = (count(20) & (!\count[19]~63\)) # (!count(20) & ((\count[19]~63\) # (GND)))
-- \count[20]~65\ = CARRY((!\count[19]~63\) # (!count(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(20),
	datad => VCC,
	cin => \count[19]~63\,
	combout => \count[20]~64_combout\,
	cout => \count[20]~65\);

-- Location: LCCOMB_X31_Y31_N14
\count[21]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[21]~66_combout\ = (count(21) & (\count[20]~65\ $ (GND))) # (!count(21) & (!\count[20]~65\ & VCC))
-- \count[21]~67\ = CARRY((count(21) & !\count[20]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(21),
	datad => VCC,
	cin => \count[20]~65\,
	combout => \count[21]~66_combout\,
	cout => \count[21]~67\);

-- Location: FF_X31_Y31_N15
\count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[21]~66_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(21));

-- Location: LCCOMB_X31_Y31_N16
\count[22]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[22]~68_combout\ = (count(22) & (!\count[21]~67\)) # (!count(22) & ((\count[21]~67\) # (GND)))
-- \count[22]~69\ = CARRY((!\count[21]~67\) # (!count(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(22),
	datad => VCC,
	cin => \count[21]~67\,
	combout => \count[22]~68_combout\,
	cout => \count[22]~69\);

-- Location: FF_X31_Y31_N17
\count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[22]~68_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(22));

-- Location: LCCOMB_X31_Y31_N18
\count[23]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[23]~70_combout\ = (count(23) & (\count[22]~69\ $ (GND))) # (!count(23) & (!\count[22]~69\ & VCC))
-- \count[23]~71\ = CARRY((count(23) & !\count[22]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(23),
	datad => VCC,
	cin => \count[22]~69\,
	combout => \count[23]~70_combout\,
	cout => \count[23]~71\);

-- Location: FF_X31_Y31_N19
\count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[23]~70_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(23));

-- Location: LCCOMB_X31_Y31_N20
\count[24]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[24]~72_combout\ = (count(24) & (!\count[23]~71\)) # (!count(24) & ((\count[23]~71\) # (GND)))
-- \count[24]~73\ = CARRY((!\count[23]~71\) # (!count(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(24),
	datad => VCC,
	cin => \count[23]~71\,
	combout => \count[24]~72_combout\,
	cout => \count[24]~73\);

-- Location: FF_X31_Y31_N21
\count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[24]~72_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(24));

-- Location: FF_X31_Y31_N23
\count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[25]~74_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(25));

-- Location: LCCOMB_X31_Y31_N28
\color[3][3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~0_combout\ = (count(0) & (count(23) & (count(25) & count(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datab => count(23),
	datac => count(25),
	datad => count(24),
	combout => \color[3][3]~0_combout\);

-- Location: FF_X31_Y32_N7
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[1]~26_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: FF_X31_Y32_N13
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[4]~32_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X31_Y32_N0
\color[3][3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~1_combout\ = (count(3) & (count(1) & (count(2) & count(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datab => count(1),
	datac => count(2),
	datad => count(4),
	combout => \color[3][3]~1_combout\);

-- Location: LCCOMB_X31_Y32_N4
\color[3][3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~4_combout\ = (\color[3][3]~2_combout\ & (\color[3][3]~3_combout\ & (\color[3][3]~0_combout\ & \color[3][3]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \color[3][3]~2_combout\,
	datab => \color[3][3]~3_combout\,
	datac => \color[3][3]~0_combout\,
	datad => \color[3][3]~1_combout\,
	combout => \color[3][3]~4_combout\);

-- Location: FF_X31_Y31_N11
\count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[19]~62_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(19));

-- Location: FF_X31_Y31_N7
\count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[17]~58_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(17));

-- Location: FF_X31_Y31_N13
\count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \count[20]~64_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(20));

-- Location: LCCOMB_X32_Y31_N0
\color[3][3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~6_combout\ = (count(18) & (count(19) & (count(17) & count(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(18),
	datab => count(19),
	datac => count(17),
	datad => count(20),
	combout => \color[3][3]~6_combout\);

-- Location: LCCOMB_X31_Y31_N30
\color[3][3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~5_combout\ = (count(13) & (count(15) & (count(16) & count(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(13),
	datab => count(15),
	datac => count(16),
	datad => count(14),
	combout => \color[3][3]~5_combout\);

-- Location: LCCOMB_X32_Y31_N6
\color[3][3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~7_combout\ = (count(21) & (\color[3][3]~6_combout\ & (count(22) & \color[3][3]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(21),
	datab => \color[3][3]~6_combout\,
	datac => count(22),
	datad => \color[3][3]~5_combout\,
	combout => \color[3][3]~7_combout\);

-- Location: LCCOMB_X35_Y32_N20
\color[3][3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][3]~8_combout\ = (count(26) & (!\always1~2_combout\ & (\color[3][3]~4_combout\ & \color[3][3]~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datab => \always1~2_combout\,
	datac => \color[3][3]~4_combout\,
	datad => \color[3][3]~7_combout\,
	combout => \color[3][3]~8_combout\);

-- Location: FF_X33_Y28_N1
\color[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][3]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][3]~q\);

-- Location: LCCOMB_X33_Y28_N14
\color[1][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][3]~feeder_combout\ = \color[2][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][3]~q\,
	combout => \color[1][3]~feeder_combout\);

-- Location: FF_X33_Y28_N15
\color[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][3]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][3]~q\);

-- Location: FF_X33_Y28_N13
\color[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[1][3]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][3]~q\);

-- Location: LCCOMB_X33_Y28_N18
\color[7][3]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][3]~56_combout\ = !\color[0][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[0][3]~q\,
	combout => \color[7][3]~56_combout\);

-- Location: FF_X33_Y28_N19
\color[7][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][3]~56_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][3]~q\);

-- Location: LCCOMB_X33_Y28_N10
\color[6][3]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][3]~48_combout\ = !\color[7][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[7][3]~q\,
	combout => \color[6][3]~48_combout\);

-- Location: FF_X33_Y28_N11
\color[6][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][3]~48_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][3]~q\);

-- Location: LCCOMB_X33_Y28_N6
\color[5][3]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][3]~41_combout\ = !\color[6][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[6][3]~q\,
	combout => \color[5][3]~41_combout\);

-- Location: FF_X33_Y28_N7
\color[5][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][3]~41_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][3]~q\);

-- Location: LCCOMB_X33_Y28_N22
\color[4][3]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][3]~35_combout\ = !\color[5][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][3]~q\,
	combout => \color[4][3]~35_combout\);

-- Location: FF_X33_Y28_N23
\color[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][3]~35_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][3]~q\);

-- Location: FF_X33_Y28_N25
\color[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[4][3]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][3]~q\);

-- Location: LCCOMB_X33_Y28_N24
\vc|sram_dq_out[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[0]~4_combout\ = (\vc|sram_dq_out[0]~3_combout\ & (((!\color[2][3]~q\)) # (!\vc|sram_dq_out[1]~0_combout\))) # (!\vc|sram_dq_out[0]~3_combout\ & (\vc|sram_dq_out[1]~0_combout\ & (!\color[3][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[0]~3_combout\,
	datab => \vc|sram_dq_out[1]~0_combout\,
	datac => \color[3][3]~q\,
	datad => \color[2][3]~q\,
	combout => \vc|sram_dq_out[0]~4_combout\);

-- Location: LCCOMB_X34_Y28_N4
\vc|sram_dq_out[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[0]~5_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[0]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[0]~4_combout\,
	combout => \vc|sram_dq_out[0]~5_combout\);

-- Location: LCCOMB_X35_Y32_N14
\vc|SRAM_ADDR[18]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[18]~39_combout\ = ((\vc|counter\(1)) # ((!\dc|blk~0_combout\ & \dc|v|row_counter|Q\(0)))) # (!\always1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|blk~0_combout\,
	datab => \always1~2_combout\,
	datac => \vc|counter\(1),
	datad => \dc|v|row_counter|Q\(0),
	combout => \vc|SRAM_ADDR[18]~39_combout\);

-- Location: LCCOMB_X33_Y30_N22
\color[1][4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][4]~11_combout\ = !\color[2][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][4]~q\,
	combout => \color[1][4]~11_combout\);

-- Location: FF_X33_Y30_N23
\color[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][4]~11_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][4]~q\);

-- Location: LCCOMB_X33_Y30_N16
\color[0][4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][4]~9_combout\ = !\color[1][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[1][4]~q\,
	combout => \color[0][4]~9_combout\);

-- Location: FF_X33_Y30_N17
\color[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][4]~9_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][4]~q\);

-- Location: LCCOMB_X33_Y30_N4
\color[7][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][4]~feeder_combout\ = \color[0][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][4]~q\,
	combout => \color[7][4]~feeder_combout\);

-- Location: FF_X33_Y30_N5
\color[7][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][4]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][4]~q\);

-- Location: LCCOMB_X33_Y30_N20
\color[6][4]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][4]~49_combout\ = !\color[7][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[7][4]~q\,
	combout => \color[6][4]~49_combout\);

-- Location: FF_X33_Y30_N21
\color[6][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][4]~49_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][4]~q\);

-- Location: LCCOMB_X33_Y30_N12
\color[5][4]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][4]~42_combout\ = !\color[6][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[6][4]~q\,
	combout => \color[5][4]~42_combout\);

-- Location: FF_X33_Y30_N13
\color[5][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][4]~42_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][4]~q\);

-- Location: LCCOMB_X33_Y30_N26
\color[4][4]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][4]~36_combout\ = !\color[5][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][4]~q\,
	combout => \color[4][4]~36_combout\);

-- Location: FF_X33_Y30_N27
\color[4][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][4]~36_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][4]~q\);

-- Location: LCCOMB_X33_Y30_N2
\color[3][4]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][4]~10_combout\ = !\color[4][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[4][4]~q\,
	combout => \color[3][4]~10_combout\);

-- Location: FF_X33_Y30_N3
\color[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[3][4]~10_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][4]~q\);

-- Location: LCCOMB_X33_Y30_N18
\color[2][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][4]~feeder_combout\ = \color[3][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][4]~q\,
	combout => \color[2][4]~feeder_combout\);

-- Location: FF_X33_Y30_N19
\color[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][4]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][4]~q\);

-- Location: LCCOMB_X35_Y30_N4
\vc|sram_dq_out[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[1]~1_combout\ = (w_x(6) & (((w_x(8) & !w_x(5))) # (!w_x(7)))) # (!w_x(6) & ((w_x(7) & ((w_x(8)) # (!w_x(5)))) # (!w_x(7) & (!w_x(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001111100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_x(6),
	datab => w_x(7),
	datac => w_x(8),
	datad => w_x(5),
	combout => \vc|sram_dq_out[1]~1_combout\);

-- Location: LCCOMB_X35_Y30_N10
\vc|sram_dq_out[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[1]~2_combout\ = (!w_x(9) & \vc|sram_dq_out[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_x(9),
	datac => \vc|sram_dq_out[1]~1_combout\,
	combout => \vc|sram_dq_out[1]~2_combout\);

-- Location: LCCOMB_X33_Y30_N28
\vc|sram_dq_out[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[1]~7_combout\ = (\vc|sram_dq_out[1]~6_combout\ & ((\color[2][4]~q\) # ((!\vc|sram_dq_out[1]~2_combout\)))) # (!\vc|sram_dq_out[1]~6_combout\ & (((\vc|sram_dq_out[1]~2_combout\ & \color[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~6_combout\,
	datab => \color[2][4]~q\,
	datac => \vc|sram_dq_out[1]~2_combout\,
	datad => \color[0][4]~q\,
	combout => \vc|sram_dq_out[1]~7_combout\);

-- Location: LCCOMB_X34_Y28_N18
\vc|sram_dq_out[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[1]~8_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[1]~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[1]~7_combout\,
	combout => \vc|sram_dq_out[1]~8_combout\);

-- Location: LCCOMB_X34_Y31_N6
\color[2][5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][5]~12_combout\ = !\color[0][22]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][22]~q\,
	combout => \color[2][5]~12_combout\);

-- Location: FF_X34_Y31_N7
\color[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][5]~12_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][5]~q\);

-- Location: LCCOMB_X34_Y31_N24
\color[1][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][5]~feeder_combout\ = \color[2][5]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][5]~q\,
	combout => \color[1][5]~feeder_combout\);

-- Location: FF_X34_Y31_N25
\color[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][5]~q\);

-- Location: LCCOMB_X35_Y31_N22
\color[0][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][5]~feeder_combout\ = \color[1][5]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[1][5]~q\,
	combout => \color[0][5]~feeder_combout\);

-- Location: FF_X35_Y31_N23
\color[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][5]~q\);

-- Location: LCCOMB_X35_Y31_N8
\color[4][22]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][22]~40_combout\ = !\color[0][5]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[0][5]~q\,
	combout => \color[4][22]~40_combout\);

-- Location: FF_X35_Y31_N9
\color[4][22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][22]~40_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][22]~q\);

-- Location: FF_X35_Y31_N11
\color[3][22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[4][22]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][22]~q\);

-- Location: LCCOMB_X35_Y31_N4
\color[2][22]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][22]~32_combout\ = !\color[3][22]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[3][22]~q\,
	combout => \color[2][22]~32_combout\);

-- Location: FF_X35_Y31_N5
\color[2][22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][22]~32_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][22]~q\);

-- Location: LCCOMB_X35_Y31_N2
\color[1][22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][22]~31_combout\ = !\color[2][22]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[2][22]~q\,
	combout => \color[1][22]~31_combout\);

-- Location: FF_X35_Y31_N3
\color[1][22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][22]~31_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][22]~q\);

-- Location: LCCOMB_X35_Y31_N18
\color[0][22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][22]~feeder_combout\ = \color[1][22]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[1][22]~q\,
	combout => \color[0][22]~feeder_combout\);

-- Location: FF_X35_Y31_N19
\color[0][22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][22]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][22]~q\);

-- Location: LCCOMB_X34_Y31_N0
\vc|sram_dq_out[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[2]~10_combout\ = (\vc|sram_dq_out[2]~9_combout\ & (((!\color[2][5]~q\) # (!\vc|sram_dq_out[1]~0_combout\)))) # (!\vc|sram_dq_out[2]~9_combout\ & (\color[0][22]~q\ & (\vc|sram_dq_out[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[2]~9_combout\,
	datab => \color[0][22]~q\,
	datac => \vc|sram_dq_out[1]~0_combout\,
	datad => \color[2][5]~q\,
	combout => \vc|sram_dq_out[2]~10_combout\);

-- Location: LCCOMB_X34_Y25_N14
\vc|sram_dq_out[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[2]~11_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[2]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[2]~10_combout\,
	combout => \vc|sram_dq_out[2]~11_combout\);

-- Location: LCCOMB_X35_Y28_N14
\color[1][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][6]~feeder_combout\ = \color[2][6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][6]~q\,
	combout => \color[1][6]~feeder_combout\);

-- Location: FF_X35_Y28_N15
\color[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][6]~q\);

-- Location: LCCOMB_X35_Y28_N24
\color[0][6]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][6]~13_combout\ = !\color[1][6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[1][6]~q\,
	combout => \color[0][6]~13_combout\);

-- Location: FF_X35_Y28_N25
\color[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][6]~13_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][6]~q\);

-- Location: LCCOMB_X35_Y28_N4
\color[7][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][6]~feeder_combout\ = \color[0][6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][6]~q\,
	combout => \color[7][6]~feeder_combout\);

-- Location: FF_X35_Y28_N5
\color[7][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][6]~q\);

-- Location: LCCOMB_X35_Y28_N20
\color[6][6]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][6]~50_combout\ = !\color[7][6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[7][6]~q\,
	combout => \color[6][6]~50_combout\);

-- Location: FF_X35_Y28_N21
\color[6][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][6]~50_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][6]~q\);

-- Location: LCCOMB_X35_Y28_N16
\color[5][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][6]~feeder_combout\ = \color[6][6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[6][6]~q\,
	combout => \color[5][6]~feeder_combout\);

-- Location: FF_X35_Y28_N17
\color[5][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][6]~q\);

-- Location: LCCOMB_X35_Y28_N22
\color[4][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][6]~feeder_combout\ = \color[5][6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][6]~q\,
	combout => \color[4][6]~feeder_combout\);

-- Location: FF_X35_Y28_N23
\color[4][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][6]~q\);

-- Location: FF_X35_Y28_N11
\color[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[4][6]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][6]~q\);

-- Location: FF_X35_Y28_N19
\color[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[3][6]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][6]~q\);

-- Location: LCCOMB_X35_Y28_N18
\vc|sram_dq_out[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[3]~13_combout\ = (\vc|sram_dq_out[3]~12_combout\ & (((\color[2][6]~q\)) # (!\vc|sram_dq_out[1]~2_combout\))) # (!\vc|sram_dq_out[3]~12_combout\ & (\vc|sram_dq_out[1]~2_combout\ & ((!\color[0][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[3]~12_combout\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \color[2][6]~q\,
	datad => \color[0][6]~q\,
	combout => \vc|sram_dq_out[3]~13_combout\);

-- Location: LCCOMB_X34_Y28_N24
\vc|sram_dq_out[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[3]~14_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[3]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[3]~13_combout\,
	combout => \vc|sram_dq_out[3]~14_combout\);

-- Location: LCCOMB_X33_Y28_N26
\color[2][7]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][7]~15_combout\ = !\color[3][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][7]~q\,
	combout => \color[2][7]~15_combout\);

-- Location: FF_X33_Y28_N27
\color[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][7]~15_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][7]~q\);

-- Location: LCCOMB_X33_Y28_N4
\color[1][7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][7]~14_combout\ = !\color[2][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[2][7]~q\,
	combout => \color[1][7]~14_combout\);

-- Location: FF_X33_Y28_N5
\color[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][7]~14_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][7]~q\);

-- Location: FF_X33_Y28_N31
\color[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[1][7]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][7]~q\);

-- Location: LCCOMB_X33_Y28_N16
\color[7][7]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][7]~57_combout\ = !\color[0][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[0][7]~q\,
	combout => \color[7][7]~57_combout\);

-- Location: FF_X33_Y28_N17
\color[7][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][7]~57_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][7]~q\);

-- Location: LCCOMB_X33_Y28_N2
\color[6][7]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][7]~51_combout\ = !\color[7][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[7][7]~q\,
	combout => \color[6][7]~51_combout\);

-- Location: FF_X33_Y28_N3
\color[6][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][7]~51_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][7]~q\);

-- Location: LCCOMB_X33_Y28_N20
\color[5][7]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][7]~43_combout\ = !\color[6][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[6][7]~q\,
	combout => \color[5][7]~43_combout\);

-- Location: FF_X33_Y28_N21
\color[5][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][7]~43_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][7]~q\);

-- Location: LCCOMB_X33_Y28_N8
\color[4][7]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][7]~37_combout\ = !\color[5][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][7]~q\,
	combout => \color[4][7]~37_combout\);

-- Location: FF_X33_Y28_N9
\color[4][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][7]~37_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][7]~q\);

-- Location: FF_X33_Y28_N29
\color[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[4][7]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][7]~q\);

-- Location: LCCOMB_X33_Y28_N30
\vc|sram_dq_out[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[4]~15_combout\ = (\vc|sram_dq_out[1]~2_combout\ & (((\vc|sram_dq_out[1]~0_combout\) # (!\color[0][7]~q\)))) # (!\vc|sram_dq_out[1]~2_combout\ & (!\color[1][7]~q\ & ((!\vc|sram_dq_out[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~2_combout\,
	datab => \color[1][7]~q\,
	datac => \color[0][7]~q\,
	datad => \vc|sram_dq_out[1]~0_combout\,
	combout => \vc|sram_dq_out[4]~15_combout\);

-- Location: LCCOMB_X33_Y28_N28
\vc|sram_dq_out[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[4]~16_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[4]~15_combout\ & (\color[2][7]~q\)) # (!\vc|sram_dq_out[4]~15_combout\ & ((!\color[3][7]~q\))))) # (!\vc|sram_dq_out[1]~0_combout\ & (((\vc|sram_dq_out[4]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \color[2][7]~q\,
	datab => \vc|sram_dq_out[1]~0_combout\,
	datac => \color[3][7]~q\,
	datad => \vc|sram_dq_out[4]~15_combout\,
	combout => \vc|sram_dq_out[4]~16_combout\);

-- Location: LCCOMB_X34_Y28_N6
\vc|sram_dq_out[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[4]~17_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[4]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[4]~16_combout\,
	combout => \vc|sram_dq_out[4]~17_combout\);

-- Location: FF_X33_Y30_N25
\color[1][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[2][11]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][11]~q\);

-- Location: FF_X33_Y30_N31
\color[0][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[1][11]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][11]~q\);

-- Location: LCCOMB_X33_Y30_N10
\color[7][11]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][11]~58_combout\ = !\color[0][11]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[0][11]~q\,
	combout => \color[7][11]~58_combout\);

-- Location: FF_X33_Y30_N11
\color[7][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][11]~58_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][11]~q\);

-- Location: LCCOMB_X34_Y31_N14
\color[6][11]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][11]~52_combout\ = !\color[7][11]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[7][11]~q\,
	combout => \color[6][11]~52_combout\);

-- Location: FF_X34_Y31_N15
\color[6][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][11]~52_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][11]~q\);

-- Location: LCCOMB_X34_Y31_N30
\color[5][11]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][11]~44_combout\ = !\color[6][11]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[6][11]~q\,
	combout => \color[5][11]~44_combout\);

-- Location: FF_X34_Y31_N31
\color[5][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][11]~44_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][11]~q\);

-- Location: FF_X33_Y30_N9
\color[4][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[5][11]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][11]~q\);

-- Location: LCCOMB_X33_Y30_N0
\color[3][11]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][11]~16_combout\ = !\color[4][11]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[4][11]~q\,
	combout => \color[3][11]~16_combout\);

-- Location: FF_X33_Y30_N1
\color[3][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[3][11]~16_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][11]~q\);

-- Location: LCCOMB_X33_Y30_N14
\color[2][11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][11]~feeder_combout\ = \color[3][11]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][11]~q\,
	combout => \color[2][11]~feeder_combout\);

-- Location: FF_X33_Y30_N15
\color[2][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][11]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][11]~q\);

-- Location: LCCOMB_X33_Y30_N24
\vc|sram_dq_out[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[5]~18_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\) # ((!\color[3][11]~q\)))) # (!\vc|sram_dq_out[1]~0_combout\ & (!\vc|sram_dq_out[1]~2_combout\ & (!\color[1][11]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \color[1][11]~q\,
	datad => \color[3][11]~q\,
	combout => \vc|sram_dq_out[5]~18_combout\);

-- Location: LCCOMB_X33_Y30_N30
\vc|sram_dq_out[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[5]~19_combout\ = (\vc|sram_dq_out[1]~2_combout\ & ((\vc|sram_dq_out[5]~18_combout\ & (!\color[2][11]~q\)) # (!\vc|sram_dq_out[5]~18_combout\ & ((!\color[0][11]~q\))))) # (!\vc|sram_dq_out[1]~2_combout\ & 
-- (((\vc|sram_dq_out[5]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~2_combout\,
	datab => \color[2][11]~q\,
	datac => \color[0][11]~q\,
	datad => \vc|sram_dq_out[5]~18_combout\,
	combout => \vc|sram_dq_out[5]~19_combout\);

-- Location: LCCOMB_X34_Y25_N4
\vc|sram_dq_out[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[5]~20_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[5]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[5]~19_combout\,
	combout => \vc|sram_dq_out[5]~20_combout\);

-- Location: LCCOMB_X34_Y29_N20
\color[2][12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][12]~feeder_combout\ = \color[3][12]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][12]~q\,
	combout => \color[2][12]~feeder_combout\);

-- Location: FF_X34_Y29_N21
\color[2][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][12]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][12]~q\);

-- Location: LCCOMB_X34_Y29_N0
\color[1][12]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][12]~18_combout\ = !\color[2][12]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][12]~q\,
	combout => \color[1][12]~18_combout\);

-- Location: FF_X34_Y29_N1
\color[1][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][12]~18_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][12]~q\);

-- Location: LCCOMB_X34_Y29_N12
\color[0][12]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][12]~17_combout\ = !\color[1][12]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[1][12]~q\,
	combout => \color[0][12]~17_combout\);

-- Location: FF_X34_Y29_N13
\color[0][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][12]~17_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][12]~q\);

-- Location: LCCOMB_X34_Y29_N24
\color[3][12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][12]~feeder_combout\ = \color[0][12]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][12]~q\,
	combout => \color[3][12]~feeder_combout\);

-- Location: FF_X34_Y29_N25
\color[3][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[3][12]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][12]~q\);

-- Location: LCCOMB_X34_Y29_N22
\vc|sram_dq_out[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[6]~21_combout\ = (\vc|sram_dq_out[1]~0_combout\ & (((\vc|sram_dq_out[1]~2_combout\)))) # (!\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\ & ((!\color[0][12]~q\))) # (!\vc|sram_dq_out[1]~2_combout\ & (\color[1][12]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \color[1][12]~q\,
	datac => \vc|sram_dq_out[1]~2_combout\,
	datad => \color[0][12]~q\,
	combout => \vc|sram_dq_out[6]~21_combout\);

-- Location: LCCOMB_X34_Y29_N30
\vc|sram_dq_out[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[6]~22_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[6]~21_combout\ & ((!\color[2][12]~q\))) # (!\vc|sram_dq_out[6]~21_combout\ & (!\color[3][12]~q\)))) # (!\vc|sram_dq_out[1]~0_combout\ & 
-- (((\vc|sram_dq_out[6]~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \color[3][12]~q\,
	datac => \vc|sram_dq_out[6]~21_combout\,
	datad => \color[2][12]~q\,
	combout => \vc|sram_dq_out[6]~22_combout\);

-- Location: LCCOMB_X34_Y28_N28
\vc|sram_dq_out[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[6]~23_combout\ = (\vc|sram_dq_out[6]~22_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \always1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[6]~22_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \always1~2_combout\,
	combout => \vc|sram_dq_out[6]~23_combout\);

-- Location: LCCOMB_X34_Y31_N26
\color[2][13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][13]~feeder_combout\ = \color[3][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][13]~q\,
	combout => \color[2][13]~feeder_combout\);

-- Location: FF_X34_Y31_N27
\color[2][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][13]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][13]~q\);

-- Location: LCCOMB_X34_Y31_N2
\color[1][13]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][13]~21_combout\ = !\color[2][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[2][13]~q\,
	combout => \color[1][13]~21_combout\);

-- Location: FF_X34_Y31_N3
\color[1][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][13]~21_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][13]~q\);

-- Location: LCCOMB_X34_Y31_N10
\color[0][13]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][13]~19_combout\ = !\color[1][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[1][13]~q\,
	combout => \color[0][13]~19_combout\);

-- Location: FF_X34_Y31_N11
\color[0][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][13]~19_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][13]~q\);

-- Location: LCCOMB_X34_Y31_N18
\color[7][13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][13]~feeder_combout\ = \color[0][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][13]~q\,
	combout => \color[7][13]~feeder_combout\);

-- Location: FF_X34_Y31_N19
\color[7][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][13]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][13]~q\);

-- Location: LCCOMB_X34_Y31_N28
\color[6][13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][13]~feeder_combout\ = \color[7][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[7][13]~q\,
	combout => \color[6][13]~feeder_combout\);

-- Location: FF_X34_Y31_N29
\color[6][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][13]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][13]~q\);

-- Location: LCCOMB_X34_Y31_N12
\color[5][13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][13]~feeder_combout\ = \color[6][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[6][13]~q\,
	combout => \color[5][13]~feeder_combout\);

-- Location: FF_X34_Y31_N13
\color[5][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][13]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][13]~q\);

-- Location: LCCOMB_X34_Y31_N22
\color[4][13]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][13]~38_combout\ = !\color[5][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][13]~q\,
	combout => \color[4][13]~38_combout\);

-- Location: FF_X34_Y31_N23
\color[4][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][13]~38_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][13]~q\);

-- Location: LCCOMB_X34_Y31_N16
\color[3][13]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][13]~20_combout\ = !\color[4][13]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[4][13]~q\,
	combout => \color[3][13]~20_combout\);

-- Location: FF_X34_Y31_N17
\color[3][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[3][13]~20_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][13]~q\);

-- Location: LCCOMB_X34_Y31_N4
\vc|sram_dq_out[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[7]~24_combout\ = (\vc|sram_dq_out[1]~2_combout\ & (((\vc|sram_dq_out[1]~0_combout\)))) # (!\vc|sram_dq_out[1]~2_combout\ & ((\vc|sram_dq_out[1]~0_combout\ & (\color[3][13]~q\)) # (!\vc|sram_dq_out[1]~0_combout\ & ((!\color[1][13]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~2_combout\,
	datab => \color[3][13]~q\,
	datac => \vc|sram_dq_out[1]~0_combout\,
	datad => \color[1][13]~q\,
	combout => \vc|sram_dq_out[7]~24_combout\);

-- Location: LCCOMB_X34_Y31_N8
\vc|sram_dq_out[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[7]~25_combout\ = (\vc|sram_dq_out[1]~2_combout\ & ((\vc|sram_dq_out[7]~24_combout\ & (\color[2][13]~q\)) # (!\vc|sram_dq_out[7]~24_combout\ & ((\color[0][13]~q\))))) # (!\vc|sram_dq_out[1]~2_combout\ & (\vc|sram_dq_out[7]~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~2_combout\,
	datab => \vc|sram_dq_out[7]~24_combout\,
	datac => \color[2][13]~q\,
	datad => \color[0][13]~q\,
	combout => \vc|sram_dq_out[7]~25_combout\);

-- Location: LCCOMB_X34_Y28_N2
\vc|sram_dq_out[7]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[7]~26_combout\ = (\vc|sram_dq_out[7]~25_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \always1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[7]~25_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \always1~2_combout\,
	combout => \vc|sram_dq_out[7]~26_combout\);

-- Location: FF_X34_Y29_N19
\color[2][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[3][14]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][14]~q\);

-- Location: LCCOMB_X34_Y29_N28
\color[1][14]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][14]~24_combout\ = !\color[2][14]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][14]~q\,
	combout => \color[1][14]~24_combout\);

-- Location: FF_X34_Y29_N29
\color[1][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][14]~24_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][14]~q\);

-- Location: LCCOMB_X34_Y29_N10
\color[0][14]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][14]~23_combout\ = !\color[1][14]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[1][14]~q\,
	combout => \color[0][14]~23_combout\);

-- Location: FF_X34_Y29_N11
\color[0][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][14]~23_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][14]~q\);

-- Location: LCCOMB_X34_Y29_N8
\color[1][19]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][19]~feeder_combout\ = \color[0][14]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][14]~q\,
	combout => \color[1][19]~feeder_combout\);

-- Location: FF_X34_Y29_N9
\color[1][19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][19]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][19]~q\);

-- Location: FF_X34_Y29_N3
\color[0][19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[1][19]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][19]~q\);

-- Location: LCCOMB_X34_Y29_N4
\color[5][14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][14]~feeder_combout\ = \color[0][19]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][19]~q\,
	combout => \color[5][14]~feeder_combout\);

-- Location: FF_X34_Y29_N5
\color[5][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][14]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][14]~q\);

-- Location: LCCOMB_X34_Y29_N16
\color[4][14]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][14]~39_combout\ = !\color[5][14]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[5][14]~q\,
	combout => \color[4][14]~39_combout\);

-- Location: FF_X34_Y29_N17
\color[4][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][14]~39_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][14]~q\);

-- Location: LCCOMB_X34_Y29_N14
\color[3][14]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][14]~22_combout\ = !\color[4][14]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[4][14]~q\,
	combout => \color[3][14]~22_combout\);

-- Location: FF_X34_Y29_N15
\color[3][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[3][14]~22_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][14]~q\);

-- Location: LCCOMB_X34_Y29_N6
\vc|sram_dq_out[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[8]~27_combout\ = (\vc|sram_dq_out[1]~0_combout\ & (((\vc|sram_dq_out[1]~2_combout\)))) # (!\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\ & ((!\color[0][14]~q\))) # (!\vc|sram_dq_out[1]~2_combout\ & (\color[1][14]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \color[1][14]~q\,
	datab => \vc|sram_dq_out[1]~0_combout\,
	datac => \vc|sram_dq_out[1]~2_combout\,
	datad => \color[0][14]~q\,
	combout => \vc|sram_dq_out[8]~27_combout\);

-- Location: LCCOMB_X34_Y29_N18
\vc|sram_dq_out[8]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[8]~28_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[8]~27_combout\ & ((!\color[2][14]~q\))) # (!\vc|sram_dq_out[8]~27_combout\ & (!\color[3][14]~q\)))) # (!\vc|sram_dq_out[1]~0_combout\ & 
-- (((\vc|sram_dq_out[8]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \color[3][14]~q\,
	datac => \color[2][14]~q\,
	datad => \vc|sram_dq_out[8]~27_combout\,
	combout => \vc|sram_dq_out[8]~28_combout\);

-- Location: LCCOMB_X34_Y28_N12
\vc|sram_dq_out[8]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[8]~29_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[8]~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[8]~28_combout\,
	combout => \vc|sram_dq_out[8]~29_combout\);

-- Location: LCCOMB_X35_Y31_N26
\color[7][15]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][15]~59_combout\ = !\color[0][15]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][15]~q\,
	combout => \color[7][15]~59_combout\);

-- Location: FF_X35_Y31_N27
\color[7][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][15]~59_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][15]~q\);

-- Location: LCCOMB_X35_Y31_N14
\color[6][15]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][15]~53_combout\ = !\color[7][15]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[7][15]~q\,
	combout => \color[6][15]~53_combout\);

-- Location: FF_X35_Y31_N15
\color[6][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][15]~53_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][15]~q\);

-- Location: LCCOMB_X35_Y31_N12
\color[5][15]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][15]~45_combout\ = !\color[6][15]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[6][15]~q\,
	combout => \color[5][15]~45_combout\);

-- Location: FF_X35_Y31_N13
\color[5][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][15]~45_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][15]~q\);

-- Location: FF_X34_Y31_N21
\color[4][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[5][15]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][15]~q\);

-- Location: LCCOMB_X35_Y31_N0
\color[3][15]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][15]~25_combout\ = !\color[4][15]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[4][15]~q\,
	combout => \color[3][15]~25_combout\);

-- Location: FF_X35_Y31_N1
\color[3][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[3][15]~25_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][15]~q\);

-- Location: LCCOMB_X35_Y31_N24
\color[2][15]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][15]~27_combout\ = !\color[3][15]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][15]~q\,
	combout => \color[2][15]~27_combout\);

-- Location: FF_X35_Y31_N25
\color[2][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][15]~27_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][15]~q\);

-- Location: LCCOMB_X35_Y31_N30
\color[1][15]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][15]~26_combout\ = !\color[2][15]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][15]~q\,
	combout => \color[1][15]~26_combout\);

-- Location: FF_X35_Y31_N31
\color[1][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][15]~26_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][15]~q\);

-- Location: FF_X35_Y31_N29
\color[0][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[1][15]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][15]~q\);

-- Location: LCCOMB_X35_Y31_N28
\vc|sram_dq_out[9]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[9]~31_combout\ = (\vc|sram_dq_out[9]~30_combout\ & (((\color[2][15]~q\)) # (!\vc|sram_dq_out[1]~2_combout\))) # (!\vc|sram_dq_out[9]~30_combout\ & (\vc|sram_dq_out[1]~2_combout\ & (!\color[0][15]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[9]~30_combout\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \color[0][15]~q\,
	datad => \color[2][15]~q\,
	combout => \vc|sram_dq_out[9]~31_combout\);

-- Location: LCCOMB_X34_Y25_N2
\vc|sram_dq_out[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[9]~32_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[9]~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[9]~31_combout\,
	combout => \vc|sram_dq_out[9]~32_combout\);

-- Location: LCCOMB_X34_Y29_N2
\vc|sram_dq_out[10]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[10]~33_combout\ = (\vc|sram_dq_out[1]~2_combout\ & (((\vc|sram_dq_out[1]~0_combout\) # (!\color[0][19]~q\)))) # (!\vc|sram_dq_out[1]~2_combout\ & (!\color[1][19]~q\ & ((!\vc|sram_dq_out[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~2_combout\,
	datab => \color[1][19]~q\,
	datac => \color[0][19]~q\,
	datad => \vc|sram_dq_out[1]~0_combout\,
	combout => \vc|sram_dq_out[10]~33_combout\);

-- Location: LCCOMB_X34_Y29_N26
\vc|sram_dq_out[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[10]~34_combout\ = (\vc|sram_dq_out[10]~33_combout\ & (((!\color[0][14]~q\) # (!\vc|sram_dq_out[1]~0_combout\)))) # (!\vc|sram_dq_out[10]~33_combout\ & (\color[1][14]~q\ & (\vc|sram_dq_out[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \color[1][14]~q\,
	datab => \vc|sram_dq_out[10]~33_combout\,
	datac => \vc|sram_dq_out[1]~0_combout\,
	datad => \color[0][14]~q\,
	combout => \vc|sram_dq_out[10]~34_combout\);

-- Location: LCCOMB_X34_Y28_N22
\vc|sram_dq_out[10]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[10]~35_combout\ = (\vc|sram_dq_out[10]~34_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \always1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[10]~34_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \always1~2_combout\,
	combout => \vc|sram_dq_out[10]~35_combout\);

-- Location: LCCOMB_X33_Y29_N6
\color[2][20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][20]~feeder_combout\ = \color[3][20]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][20]~q\,
	combout => \color[2][20]~feeder_combout\);

-- Location: FF_X33_Y29_N7
\color[2][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][20]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][20]~q\);

-- Location: LCCOMB_X33_Y29_N22
\color[1][20]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[1][20]~28_combout\ = !\color[2][20]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[2][20]~q\,
	combout => \color[1][20]~28_combout\);

-- Location: FF_X33_Y29_N23
\color[1][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[1][20]~28_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][20]~q\);

-- Location: FF_X33_Y29_N5
\color[0][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[1][20]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][20]~q\);

-- Location: LCCOMB_X33_Y29_N14
\color[7][20]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][20]~60_combout\ = !\color[0][20]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[0][20]~q\,
	combout => \color[7][20]~60_combout\);

-- Location: FF_X33_Y29_N15
\color[7][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][20]~60_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][20]~q\);

-- Location: LCCOMB_X33_Y29_N0
\color[6][20]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][20]~54_combout\ = !\color[7][20]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[7][20]~q\,
	combout => \color[6][20]~54_combout\);

-- Location: FF_X33_Y29_N1
\color[6][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][20]~54_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][20]~q\);

-- Location: LCCOMB_X33_Y29_N24
\color[5][20]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][20]~46_combout\ = !\color[6][20]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[6][20]~q\,
	combout => \color[5][20]~46_combout\);

-- Location: FF_X33_Y29_N25
\color[5][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][20]~46_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][20]~q\);

-- Location: LCCOMB_X33_Y29_N26
\color[4][20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][20]~feeder_combout\ = \color[5][20]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][20]~q\,
	combout => \color[4][20]~feeder_combout\);

-- Location: FF_X33_Y29_N27
\color[4][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][20]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][20]~q\);

-- Location: FF_X33_Y29_N17
\color[3][20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[4][20]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][20]~q\);

-- Location: LCCOMB_X33_Y29_N16
\vc|sram_dq_out[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[11]~36_combout\ = (\vc|sram_dq_out[1]~0_combout\ & (((\color[3][20]~q\) # (\vc|sram_dq_out[1]~2_combout\)))) # (!\vc|sram_dq_out[1]~0_combout\ & (!\color[1][20]~q\ & ((!\vc|sram_dq_out[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \color[1][20]~q\,
	datab => \vc|sram_dq_out[1]~0_combout\,
	datac => \color[3][20]~q\,
	datad => \vc|sram_dq_out[1]~2_combout\,
	combout => \vc|sram_dq_out[11]~36_combout\);

-- Location: LCCOMB_X33_Y29_N4
\vc|sram_dq_out[11]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[11]~37_combout\ = (\vc|sram_dq_out[1]~2_combout\ & ((\vc|sram_dq_out[11]~36_combout\ & ((\color[2][20]~q\))) # (!\vc|sram_dq_out[11]~36_combout\ & (!\color[0][20]~q\)))) # (!\vc|sram_dq_out[1]~2_combout\ & 
-- (\vc|sram_dq_out[11]~36_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111001000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~2_combout\,
	datab => \vc|sram_dq_out[11]~36_combout\,
	datac => \color[0][20]~q\,
	datad => \color[2][20]~q\,
	combout => \vc|sram_dq_out[11]~37_combout\);

-- Location: LCCOMB_X34_Y28_N0
\vc|sram_dq_out[11]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[11]~38_combout\ = (\vc|sram_dq_out[11]~37_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \always1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[11]~37_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \always1~2_combout\,
	combout => \vc|sram_dq_out[11]~38_combout\);

-- Location: FF_X33_Y29_N13
\color[1][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[2][21]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][21]~q\);

-- Location: LCCOMB_X33_Y29_N28
\color[0][21]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][21]~29_combout\ = !\color[1][21]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[1][21]~q\,
	combout => \color[0][21]~29_combout\);

-- Location: FF_X33_Y29_N29
\color[0][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][21]~29_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][21]~q\);

-- Location: LCCOMB_X33_Y29_N20
\color[7][21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][21]~feeder_combout\ = \color[0][21]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][21]~q\,
	combout => \color[7][21]~feeder_combout\);

-- Location: FF_X33_Y29_N21
\color[7][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][21]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][21]~q\);

-- Location: LCCOMB_X33_Y29_N10
\color[6][21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][21]~feeder_combout\ = \color[7][21]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[7][21]~q\,
	combout => \color[6][21]~feeder_combout\);

-- Location: FF_X33_Y29_N11
\color[6][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][21]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][21]~q\);

-- Location: LCCOMB_X33_Y29_N2
\color[5][21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][21]~feeder_combout\ = \color[6][21]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[6][21]~q\,
	combout => \color[5][21]~feeder_combout\);

-- Location: FF_X33_Y29_N3
\color[5][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][21]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][21]~q\);

-- Location: LCCOMB_X33_Y29_N30
\color[4][21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][21]~feeder_combout\ = \color[5][21]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][21]~q\,
	combout => \color[4][21]~feeder_combout\);

-- Location: FF_X33_Y29_N31
\color[4][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][21]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][21]~q\);

-- Location: FF_X33_Y29_N19
\color[3][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[4][21]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][21]~q\);

-- Location: LCCOMB_X33_Y29_N8
\color[2][21]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[2][21]~30_combout\ = !\color[3][21]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[3][21]~q\,
	combout => \color[2][21]~30_combout\);

-- Location: FF_X33_Y29_N9
\color[2][21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[2][21]~30_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][21]~q\);

-- Location: LCCOMB_X33_Y29_N12
\vc|sram_dq_out[12]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[12]~39_combout\ = (\vc|sram_dq_out[1]~2_combout\ & ((\vc|sram_dq_out[1]~0_combout\) # ((!\color[0][21]~q\)))) # (!\vc|sram_dq_out[1]~2_combout\ & (!\vc|sram_dq_out[1]~0_combout\ & (\color[1][21]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~2_combout\,
	datab => \vc|sram_dq_out[1]~0_combout\,
	datac => \color[1][21]~q\,
	datad => \color[0][21]~q\,
	combout => \vc|sram_dq_out[12]~39_combout\);

-- Location: LCCOMB_X33_Y29_N18
\vc|sram_dq_out[12]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[12]~40_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[12]~39_combout\ & (\color[2][21]~q\)) # (!\vc|sram_dq_out[12]~39_combout\ & ((!\color[3][21]~q\))))) # (!\vc|sram_dq_out[1]~0_combout\ & 
-- (((\vc|sram_dq_out[12]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \color[2][21]~q\,
	datac => \color[3][21]~q\,
	datad => \vc|sram_dq_out[12]~39_combout\,
	combout => \vc|sram_dq_out[12]~40_combout\);

-- Location: LCCOMB_X34_Y25_N8
\vc|sram_dq_out[12]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[12]~41_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[12]~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[12]~40_combout\,
	combout => \vc|sram_dq_out[12]~41_combout\);

-- Location: LCCOMB_X35_Y31_N16
\vc|sram_dq_out[13]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[13]~43_combout\ = (\vc|sram_dq_out[13]~42_combout\ & (((!\vc|sram_dq_out[1]~2_combout\)) # (!\color[2][22]~q\))) # (!\vc|sram_dq_out[13]~42_combout\ & (((\vc|sram_dq_out[1]~2_combout\ & \color[0][22]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[13]~42_combout\,
	datab => \color[2][22]~q\,
	datac => \vc|sram_dq_out[1]~2_combout\,
	datad => \color[0][22]~q\,
	combout => \vc|sram_dq_out[13]~43_combout\);

-- Location: LCCOMB_X34_Y25_N30
\vc|sram_dq_out[13]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[13]~44_combout\ = (\always1~2_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \vc|sram_dq_out[13]~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|sram_dq_out[13]~43_combout\,
	combout => \vc|sram_dq_out[13]~44_combout\);

-- Location: FF_X35_Y28_N9
\color[2][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[3][23]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[2][23]~q\);

-- Location: FF_X35_Y28_N13
\color[1][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	asdata => \color[2][23]~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[1][23]~q\);

-- Location: LCCOMB_X35_Y28_N0
\color[0][23]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[0][23]~34_combout\ = !\color[1][23]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[1][23]~q\,
	combout => \color[0][23]~34_combout\);

-- Location: FF_X35_Y28_N1
\color[0][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[0][23]~34_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[0][23]~q\);

-- Location: LCCOMB_X35_Y28_N6
\color[7][23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[7][23]~feeder_combout\ = \color[0][23]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[0][23]~q\,
	combout => \color[7][23]~feeder_combout\);

-- Location: FF_X35_Y28_N7
\color[7][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[7][23]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[7][23]~q\);

-- Location: LCCOMB_X35_Y28_N30
\color[6][23]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[6][23]~55_combout\ = !\color[7][23]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[7][23]~q\,
	combout => \color[6][23]~55_combout\);

-- Location: FF_X35_Y28_N31
\color[6][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[6][23]~55_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[6][23]~q\);

-- Location: LCCOMB_X35_Y28_N2
\color[5][23]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[5][23]~47_combout\ = !\color[6][23]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[6][23]~q\,
	combout => \color[5][23]~47_combout\);

-- Location: FF_X35_Y28_N3
\color[5][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[5][23]~47_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[5][23]~q\);

-- Location: LCCOMB_X35_Y28_N26
\color[4][23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[4][23]~feeder_combout\ = \color[5][23]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \color[5][23]~q\,
	combout => \color[4][23]~feeder_combout\);

-- Location: FF_X35_Y28_N27
\color[4][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[4][23]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[4][23]~q\);

-- Location: LCCOMB_X35_Y28_N28
\color[3][23]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \color[3][23]~33_combout\ = !\color[4][23]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \color[4][23]~q\,
	combout => \color[3][23]~33_combout\);

-- Location: FF_X35_Y28_N29
\color[3][23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \color[3][23]~33_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \color[3][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \color[3][23]~q\);

-- Location: LCCOMB_X35_Y28_N12
\vc|sram_dq_out[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[14]~45_combout\ = (\vc|sram_dq_out[1]~0_combout\ & (\vc|sram_dq_out[1]~2_combout\)) # (!\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[1]~2_combout\ & ((!\color[0][23]~q\))) # (!\vc|sram_dq_out[1]~2_combout\ & (\color[1][23]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \vc|sram_dq_out[1]~2_combout\,
	datac => \color[1][23]~q\,
	datad => \color[0][23]~q\,
	combout => \vc|sram_dq_out[14]~45_combout\);

-- Location: LCCOMB_X35_Y28_N8
\vc|sram_dq_out[14]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[14]~46_combout\ = (\vc|sram_dq_out[1]~0_combout\ & ((\vc|sram_dq_out[14]~45_combout\ & ((\color[2][23]~q\))) # (!\vc|sram_dq_out[14]~45_combout\ & (\color[3][23]~q\)))) # (!\vc|sram_dq_out[1]~0_combout\ & 
-- (((\vc|sram_dq_out[14]~45_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[1]~0_combout\,
	datab => \color[3][23]~q\,
	datac => \color[2][23]~q\,
	datad => \vc|sram_dq_out[14]~45_combout\,
	combout => \vc|sram_dq_out[14]~46_combout\);

-- Location: LCCOMB_X34_Y28_N30
\vc|sram_dq_out[14]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|sram_dq_out[14]~47_combout\ = (\vc|sram_dq_out[14]~46_combout\ & (!\vc|counter\(1) & (\dc|vram_re~combout\ & \always1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|sram_dq_out[14]~46_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \always1~2_combout\,
	combout => \vc|sram_dq_out[14]~47_combout\);

-- Location: FF_X38_Y36_N23
\dc|v|col_counter|Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|col_counter|Q[6]~23_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|v|LessThan4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|col_counter|Q\(6));

-- Location: LCCOMB_X38_Y36_N6
\dc|v|HS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|HS~0_combout\ = ((\dc|v|col_counter|Q\(5) & (\dc|v|col_counter|Q\(6) & \dc|v|col_counter|Q\(7))) # (!\dc|v|col_counter|Q\(5) & (!\dc|v|col_counter|Q\(6) & !\dc|v|col_counter|Q\(7)))) # (!\dc|v|col_counter|Q\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(8),
	datab => \dc|v|col_counter|Q\(5),
	datac => \dc|v|col_counter|Q\(6),
	datad => \dc|v|col_counter|Q\(7),
	combout => \dc|v|HS~0_combout\);

-- Location: LCCOMB_X38_Y36_N8
\dc|v|HS~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|HS~1_combout\ = (\dc|v|HS~0_combout\) # ((\dc|v|col_counter|Q\(9)) # (!\dc|v|col_counter|Q\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|HS~0_combout\,
	datab => \dc|v|col_counter|Q\(10),
	datad => \dc|v|col_counter|Q\(9),
	combout => \dc|v|HS~1_combout\);

-- Location: LCCOMB_X42_Y36_N10
\dc|v|VS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|VS~0_combout\ = (\dc|v|row_counter|Q\(2)) # ((\dc|v|row_counter|Q\(4)) # ((\dc|v|row_counter|Q\(9)) # (!\dc|v|row_counter|Q\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(2),
	datab => \dc|v|row_counter|Q\(4),
	datac => \dc|v|row_counter|Q\(3),
	datad => \dc|v|row_counter|Q\(9),
	combout => \dc|v|VS~0_combout\);

-- Location: LCCOMB_X41_Y36_N6
\dc|v|row_counter|Q~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q~9_combout\ = (\dc|v|row_counter|Add0~2_combout\ & \dc|v|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Add0~2_combout\,
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q~9_combout\);

-- Location: FF_X41_Y36_N7
\dc|v|row_counter|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q~9_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|v|row_counter|Q[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(1));

-- Location: LCCOMB_X42_Y36_N22
\dc|v|VS~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|VS~2_combout\ = (\dc|v|VS~0_combout\) # ((!\dc|v|row_counter|Q\(1)) # (!\dc|v|VS~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|VS~0_combout\,
	datab => \dc|v|VS~1_combout\,
	datac => \dc|v|row_counter|Q\(1),
	combout => \dc|v|VS~2_combout\);

-- Location: LCCOMB_X1_Y36_N0
\pl|altpll_component|auto_generated|pll_lock_sync~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pl|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \pl|altpll_component|auto_generated|pll_lock_sync~feeder_combout\);

-- Location: FF_X1_Y36_N1
\pl|altpll_component|auto_generated|pll_lock_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pl|altpll_component|auto_generated|wire_pll1_locked\,
	d => \pl|altpll_component|auto_generated|pll_lock_sync~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pl|altpll_component|auto_generated|pll_lock_sync~q\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: LCCOMB_X1_Y36_N22
clk_50MHz : cycloneive_lcell_comb
-- Equation(s):
-- \clk_50MHz~combout\ = LCELL((\pl|altpll_component|auto_generated|pll_lock_sync~q\ & (\pl|altpll_component|auto_generated|wire_pll1_locked\ & \CLOCK_50~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pl|altpll_component|auto_generated|pll_lock_sync~q\,
	datac => \pl|altpll_component|auto_generated|wire_pll1_locked\,
	datad => \CLOCK_50~input_o\,
	combout => \clk_50MHz~combout\);

-- Location: CLKCTRL_G1
\clk_50MHz~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50MHz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50MHz~clkctrl_outclk\);

-- Location: LCCOMB_X38_Y37_N22
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X38_Y32_N2
\dc|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Equal0~1_combout\ = (\dc|v|col_counter|Q\(7) & (\dc|Equal0~0_combout\ & (!\dc|v|col_counter|Q\(9) & \dc|v|col_counter|Q\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(7),
	datab => \dc|Equal0~0_combout\,
	datac => \dc|v|col_counter|Q\(9),
	datad => \dc|v|col_counter|Q\(6),
	combout => \dc|Equal0~1_combout\);

-- Location: LCCOMB_X38_Y37_N0
\dc|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~2_combout\ = (!\dc|storing~q\ & (\dc|vram_re~combout\ & ((!\dc|Equal0~1_combout\) # (!\dc|v|col_counter|Q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing~q\,
	datab => \dc|vram_re~combout\,
	datac => \dc|v|col_counter|Q\(1),
	datad => \dc|Equal0~1_combout\,
	combout => \dc|Add5~2_combout\);

-- Location: LCCOMB_X39_Y38_N12
\dc|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~0_combout\ = \dc|v|col_counter|Q\(1) $ (VCC)
-- \dc|Add5~1\ = CARRY(\dc|v|col_counter|Q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(1),
	datad => VCC,
	combout => \dc|Add5~0_combout\,
	cout => \dc|Add5~1\);

-- Location: LCCOMB_X38_Y38_N18
\dc|storing_addr_next[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr_next[0]~0_combout\ = (\dc|v|col_counter|Q\(1) & (!\dc|blk~0_combout\ & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(1),
	datac => \dc|blk~0_combout\,
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_addr_next[0]~0_combout\);

-- Location: FF_X38_Y38_N19
\dc|storing_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr_next[0]~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(0));

-- Location: LCCOMB_X38_Y38_N28
\dc|Add5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~3_combout\ = (\dc|storing~q\ & ((\dc|storing_addr\(0)) # ((\dc|Add5~2_combout\ & \dc|Add5~0_combout\)))) # (!\dc|storing~q\ & (\dc|Add5~2_combout\ & (\dc|Add5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing~q\,
	datab => \dc|Add5~2_combout\,
	datac => \dc|Add5~0_combout\,
	datad => \dc|storing_addr\(0),
	combout => \dc|Add5~3_combout\);

-- Location: LCCOMB_X39_Y38_N14
\dc|Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~4_combout\ = (\dc|v|col_counter|Q\(2) & (!\dc|Add5~1\)) # (!\dc|v|col_counter|Q\(2) & ((\dc|Add5~1\) # (GND)))
-- \dc|Add5~5\ = CARRY((!\dc|Add5~1\) # (!\dc|v|col_counter|Q\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(2),
	datad => VCC,
	cin => \dc|Add5~1\,
	combout => \dc|Add5~4_combout\,
	cout => \dc|Add5~5\);

-- Location: LCCOMB_X38_Y38_N0
\dc|storing_addr[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[1]~9_combout\ = \dc|v|col_counter|Q\(2) $ (VCC)
-- \dc|storing_addr[1]~10\ = CARRY(\dc|v|col_counter|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(2),
	datad => VCC,
	combout => \dc|storing_addr[1]~9_combout\,
	cout => \dc|storing_addr[1]~10\);

-- Location: FF_X38_Y38_N1
\dc|storing_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[1]~9_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(1));

-- Location: LCCOMB_X36_Y37_N0
\dc|vram_re~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|vram_re~_wirecell_combout\ = !\dc|vram_re~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|vram_re~combout\,
	combout => \dc|vram_re~_wirecell_combout\);

-- Location: FF_X36_Y37_N1
\dc|storing\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|vram_re~_wirecell_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing~q\);

-- Location: LCCOMB_X39_Y38_N4
\dc|Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~6_combout\ = (\dc|Add5~2_combout\ & ((\dc|Add5~4_combout\) # ((\dc|storing_addr\(1) & \dc|storing~q\)))) # (!\dc|Add5~2_combout\ & (((\dc|storing_addr\(1) & \dc|storing~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Add5~2_combout\,
	datab => \dc|Add5~4_combout\,
	datac => \dc|storing_addr\(1),
	datad => \dc|storing~q\,
	combout => \dc|Add5~6_combout\);

-- Location: LCCOMB_X38_Y38_N2
\dc|storing_addr[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[2]~11_combout\ = (\dc|v|col_counter|Q\(3) & (\dc|storing_addr[1]~10\ & VCC)) # (!\dc|v|col_counter|Q\(3) & (!\dc|storing_addr[1]~10\))
-- \dc|storing_addr[2]~12\ = CARRY((!\dc|v|col_counter|Q\(3) & !\dc|storing_addr[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(3),
	datad => VCC,
	cin => \dc|storing_addr[1]~10\,
	combout => \dc|storing_addr[2]~11_combout\,
	cout => \dc|storing_addr[2]~12\);

-- Location: FF_X38_Y38_N3
\dc|storing_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[2]~11_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(2));

-- Location: LCCOMB_X38_Y38_N30
\dc|Add5~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~9_combout\ = (\dc|Add5~7_combout\ & ((\dc|Add5~2_combout\) # ((\dc|storing_addr\(2) & \dc|storing~q\)))) # (!\dc|Add5~7_combout\ & (\dc|storing_addr\(2) & (\dc|storing~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Add5~7_combout\,
	datab => \dc|storing_addr\(2),
	datac => \dc|storing~q\,
	datad => \dc|Add5~2_combout\,
	combout => \dc|Add5~9_combout\);

-- Location: LCCOMB_X38_Y38_N4
\dc|storing_addr[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[3]~13_combout\ = (\dc|v|col_counter|Q\(4) & ((GND) # (!\dc|storing_addr[2]~12\))) # (!\dc|v|col_counter|Q\(4) & (\dc|storing_addr[2]~12\ $ (GND)))
-- \dc|storing_addr[3]~14\ = CARRY((\dc|v|col_counter|Q\(4)) # (!\dc|storing_addr[2]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(4),
	datad => VCC,
	cin => \dc|storing_addr[2]~12\,
	combout => \dc|storing_addr[3]~13_combout\,
	cout => \dc|storing_addr[3]~14\);

-- Location: FF_X38_Y38_N5
\dc|storing_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[3]~13_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(3));

-- Location: LCCOMB_X39_Y38_N18
\dc|Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~10_combout\ = (\dc|v|col_counter|Q\(4) & (!\dc|Add5~8\)) # (!\dc|v|col_counter|Q\(4) & ((\dc|Add5~8\) # (GND)))
-- \dc|Add5~11\ = CARRY((!\dc|Add5~8\) # (!\dc|v|col_counter|Q\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(4),
	datad => VCC,
	cin => \dc|Add5~8\,
	combout => \dc|Add5~10_combout\,
	cout => \dc|Add5~11\);

-- Location: LCCOMB_X38_Y38_N20
\dc|Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~12_combout\ = (\dc|storing~q\ & ((\dc|storing_addr\(3)) # ((\dc|Add5~2_combout\ & \dc|Add5~10_combout\)))) # (!\dc|storing~q\ & (\dc|Add5~2_combout\ & ((\dc|Add5~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing~q\,
	datab => \dc|Add5~2_combout\,
	datac => \dc|storing_addr\(3),
	datad => \dc|Add5~10_combout\,
	combout => \dc|Add5~12_combout\);

-- Location: LCCOMB_X39_Y38_N20
\dc|Add5~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~13_combout\ = (\dc|v|col_counter|Q\(5) & (\dc|Add5~11\ $ (GND))) # (!\dc|v|col_counter|Q\(5) & (!\dc|Add5~11\ & VCC))
-- \dc|Add5~14\ = CARRY((\dc|v|col_counter|Q\(5) & !\dc|Add5~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(5),
	datad => VCC,
	cin => \dc|Add5~11\,
	combout => \dc|Add5~13_combout\,
	cout => \dc|Add5~14\);

-- Location: LCCOMB_X38_Y38_N6
\dc|storing_addr[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[4]~15_combout\ = (\dc|v|col_counter|Q\(5) & (\dc|storing_addr[3]~14\ & VCC)) # (!\dc|v|col_counter|Q\(5) & (!\dc|storing_addr[3]~14\))
-- \dc|storing_addr[4]~16\ = CARRY((!\dc|v|col_counter|Q\(5) & !\dc|storing_addr[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(5),
	datad => VCC,
	cin => \dc|storing_addr[3]~14\,
	combout => \dc|storing_addr[4]~15_combout\,
	cout => \dc|storing_addr[4]~16\);

-- Location: FF_X38_Y38_N7
\dc|storing_addr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[4]~15_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(4));

-- Location: LCCOMB_X38_Y38_N26
\dc|Add5~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~15_combout\ = (\dc|storing~q\ & ((\dc|storing_addr\(4)) # ((\dc|Add5~2_combout\ & \dc|Add5~13_combout\)))) # (!\dc|storing~q\ & (\dc|Add5~2_combout\ & (\dc|Add5~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing~q\,
	datab => \dc|Add5~2_combout\,
	datac => \dc|Add5~13_combout\,
	datad => \dc|storing_addr\(4),
	combout => \dc|Add5~15_combout\);

-- Location: LCCOMB_X39_Y38_N22
\dc|Add5~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~16_combout\ = (\dc|v|col_counter|Q\(6) & (!\dc|Add5~14\)) # (!\dc|v|col_counter|Q\(6) & ((\dc|Add5~14\) # (GND)))
-- \dc|Add5~17\ = CARRY((!\dc|Add5~14\) # (!\dc|v|col_counter|Q\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(6),
	datad => VCC,
	cin => \dc|Add5~14\,
	combout => \dc|Add5~16_combout\,
	cout => \dc|Add5~17\);

-- Location: LCCOMB_X38_Y38_N8
\dc|storing_addr[5]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[5]~17_combout\ = (\dc|v|col_counter|Q\(6) & ((GND) # (!\dc|storing_addr[4]~16\))) # (!\dc|v|col_counter|Q\(6) & (\dc|storing_addr[4]~16\ $ (GND)))
-- \dc|storing_addr[5]~18\ = CARRY((\dc|v|col_counter|Q\(6)) # (!\dc|storing_addr[4]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(6),
	datad => VCC,
	cin => \dc|storing_addr[4]~16\,
	combout => \dc|storing_addr[5]~17_combout\,
	cout => \dc|storing_addr[5]~18\);

-- Location: FF_X38_Y38_N9
\dc|storing_addr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[5]~17_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(5));

-- Location: LCCOMB_X39_Y38_N10
\dc|Add5~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~18_combout\ = (\dc|Add5~2_combout\ & ((\dc|Add5~16_combout\) # ((\dc|storing~q\ & \dc|storing_addr\(5))))) # (!\dc|Add5~2_combout\ & (\dc|storing~q\ & ((\dc|storing_addr\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Add5~2_combout\,
	datab => \dc|storing~q\,
	datac => \dc|Add5~16_combout\,
	datad => \dc|storing_addr\(5),
	combout => \dc|Add5~18_combout\);

-- Location: LCCOMB_X39_Y38_N24
\dc|Add5~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~19_combout\ = (\dc|v|col_counter|Q\(7) & (\dc|Add5~17\ $ (GND))) # (!\dc|v|col_counter|Q\(7) & (!\dc|Add5~17\ & VCC))
-- \dc|Add5~20\ = CARRY((\dc|v|col_counter|Q\(7) & !\dc|Add5~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(7),
	datad => VCC,
	cin => \dc|Add5~17\,
	combout => \dc|Add5~19_combout\,
	cout => \dc|Add5~20\);

-- Location: LCCOMB_X38_Y38_N24
\dc|Add5~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~21_combout\ = (\dc|storing_addr\(6) & ((\dc|storing~q\) # ((\dc|Add5~2_combout\ & \dc|Add5~19_combout\)))) # (!\dc|storing_addr\(6) & (\dc|Add5~2_combout\ & ((\dc|Add5~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_addr\(6),
	datab => \dc|Add5~2_combout\,
	datac => \dc|storing~q\,
	datad => \dc|Add5~19_combout\,
	combout => \dc|Add5~21_combout\);

-- Location: LCCOMB_X39_Y38_N26
\dc|Add5~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~22_combout\ = (\dc|v|col_counter|Q\(8) & (!\dc|Add5~20\)) # (!\dc|v|col_counter|Q\(8) & ((\dc|Add5~20\) # (GND)))
-- \dc|Add5~23\ = CARRY((!\dc|Add5~20\) # (!\dc|v|col_counter|Q\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(8),
	datad => VCC,
	cin => \dc|Add5~20\,
	combout => \dc|Add5~22_combout\,
	cout => \dc|Add5~23\);

-- Location: LCCOMB_X38_Y38_N12
\dc|storing_addr[7]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[7]~21_combout\ = (\dc|v|col_counter|Q\(8) & ((GND) # (!\dc|storing_addr[6]~20\))) # (!\dc|v|col_counter|Q\(8) & (\dc|storing_addr[6]~20\ $ (GND)))
-- \dc|storing_addr[7]~22\ = CARRY((\dc|v|col_counter|Q\(8)) # (!\dc|storing_addr[6]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(8),
	datad => VCC,
	cin => \dc|storing_addr[6]~20\,
	combout => \dc|storing_addr[7]~21_combout\,
	cout => \dc|storing_addr[7]~22\);

-- Location: FF_X38_Y38_N13
\dc|storing_addr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[7]~21_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(7));

-- Location: LCCOMB_X39_Y38_N8
\dc|Add5~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~24_combout\ = (\dc|Add5~2_combout\ & ((\dc|Add5~22_combout\) # ((\dc|storing~q\ & \dc|storing_addr\(7))))) # (!\dc|Add5~2_combout\ & (\dc|storing~q\ & ((\dc|storing_addr\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Add5~2_combout\,
	datab => \dc|storing~q\,
	datac => \dc|Add5~22_combout\,
	datad => \dc|storing_addr\(7),
	combout => \dc|Add5~24_combout\);

-- Location: LCCOMB_X38_Y38_N14
\dc|storing_addr[8]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[8]~23_combout\ = (\dc|v|col_counter|Q\(9) & (\dc|storing_addr[7]~22\ & VCC)) # (!\dc|v|col_counter|Q\(9) & (!\dc|storing_addr[7]~22\))
-- \dc|storing_addr[8]~24\ = CARRY((!\dc|v|col_counter|Q\(9) & !\dc|storing_addr[7]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(9),
	datad => VCC,
	cin => \dc|storing_addr[7]~22\,
	combout => \dc|storing_addr[8]~23_combout\,
	cout => \dc|storing_addr[8]~24\);

-- Location: FF_X38_Y38_N15
\dc|storing_addr[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[8]~23_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(8));

-- Location: LCCOMB_X39_Y38_N28
\dc|Add5~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~25_combout\ = (\dc|v|col_counter|Q\(9) & (\dc|Add5~23\ $ (GND))) # (!\dc|v|col_counter|Q\(9) & (!\dc|Add5~23\ & VCC))
-- \dc|Add5~26\ = CARRY((\dc|v|col_counter|Q\(9) & !\dc|Add5~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(9),
	datad => VCC,
	cin => \dc|Add5~23\,
	combout => \dc|Add5~25_combout\,
	cout => \dc|Add5~26\);

-- Location: LCCOMB_X38_Y38_N22
\dc|Add5~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~27_combout\ = (\dc|storing~q\ & ((\dc|storing_addr\(8)) # ((\dc|Add5~2_combout\ & \dc|Add5~25_combout\)))) # (!\dc|storing~q\ & (\dc|Add5~2_combout\ & ((\dc|Add5~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing~q\,
	datab => \dc|Add5~2_combout\,
	datac => \dc|storing_addr\(8),
	datad => \dc|Add5~25_combout\,
	combout => \dc|Add5~27_combout\);

-- Location: LCCOMB_X38_Y38_N16
\dc|storing_addr[9]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_addr[9]~25_combout\ = \dc|storing_addr[8]~24\ $ (\dc|v|col_counter|Q\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \dc|v|col_counter|Q\(10),
	cin => \dc|storing_addr[8]~24\,
	combout => \dc|storing_addr[9]~25_combout\);

-- Location: FF_X38_Y38_N17
\dc|storing_addr[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_addr[9]~25_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \dc|vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_addr\(9));

-- Location: LCCOMB_X39_Y38_N30
\dc|Add5~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~28_combout\ = \dc|v|col_counter|Q\(10) $ (\dc|Add5~26\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(10),
	cin => \dc|Add5~26\,
	combout => \dc|Add5~28_combout\);

-- Location: LCCOMB_X39_Y38_N6
\dc|Add5~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add5~30_combout\ = (\dc|Add5~2_combout\ & ((\dc|Add5~28_combout\) # ((\dc|storing_addr\(9) & \dc|storing~q\)))) # (!\dc|Add5~2_combout\ & (\dc|storing_addr\(9) & ((\dc|storing~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Add5~2_combout\,
	datab => \dc|storing_addr\(9),
	datac => \dc|Add5~28_combout\,
	datad => \dc|storing~q\,
	combout => \dc|Add5~30_combout\);

-- Location: LCCOMB_X36_Y38_N20
\dc|storing_color[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[3]~feeder_combout\ = \dc|storing_color_next[3]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_color_next[3]~0_combout\,
	combout => \dc|storing_color[3]~feeder_combout\);

-- Location: FF_X36_Y38_N21
\dc|storing_color[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[3]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(3));

-- Location: LCCOMB_X36_Y38_N14
\dc|storing_color[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[4]~feeder_combout\ = \dc|storing_color_next[4]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_color_next[4]~1_combout\,
	combout => \dc|storing_color[4]~feeder_combout\);

-- Location: FF_X36_Y38_N15
\dc|storing_color[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[4]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(4));

-- Location: IOIBUF_X9_Y0_N22
\SRAM_DQ[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(2),
	o => \SRAM_DQ[2]~input_o\);

-- Location: LCCOMB_X34_Y38_N10
\vc|VGA_data_hold[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[2]~feeder_combout\ = \SRAM_DQ[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[2]~input_o\,
	combout => \vc|VGA_data_hold[2]~feeder_combout\);

-- Location: FF_X34_Y38_N11
\vc|VGA_data_hold[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[2]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(2));

-- Location: LCCOMB_X36_Y38_N0
\dc|storing_color_next[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[5]~2_combout\ = (!\dc|blk~0_combout\ & (\vc|VGA_data_hold\(2) & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|blk~0_combout\,
	datac => \vc|VGA_data_hold\(2),
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[5]~2_combout\);

-- Location: LCCOMB_X36_Y38_N12
\dc|storing_color[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[5]~feeder_combout\ = \dc|storing_color_next[5]~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|storing_color_next[5]~2_combout\,
	combout => \dc|storing_color[5]~feeder_combout\);

-- Location: FF_X36_Y38_N13
\dc|storing_color[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(5));

-- Location: IOIBUF_X9_Y0_N15
\SRAM_DQ[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(3),
	o => \SRAM_DQ[3]~input_o\);

-- Location: FF_X34_Y38_N29
\vc|VGA_data_hold[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[3]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(3));

-- Location: LCCOMB_X36_Y38_N10
\dc|storing_color_next[6]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[6]~3_combout\ = (!\dc|blk~0_combout\ & (\vc|VGA_data_hold\(3) & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|blk~0_combout\,
	datac => \vc|VGA_data_hold\(3),
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[6]~3_combout\);

-- Location: LCCOMB_X36_Y38_N18
\dc|storing_color[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[6]~feeder_combout\ = \dc|storing_color_next[6]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|storing_color_next[6]~3_combout\,
	combout => \dc|storing_color[6]~feeder_combout\);

-- Location: FF_X36_Y38_N19
\dc|storing_color[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(6));

-- Location: IOIBUF_X7_Y0_N15
\SRAM_DQ[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(4),
	o => \SRAM_DQ[4]~input_o\);

-- Location: FF_X34_Y38_N7
\vc|VGA_data_hold[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[4]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(4));

-- Location: LCCOMB_X36_Y38_N28
\dc|storing_color_next[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[7]~4_combout\ = (!\dc|blk~0_combout\ & (\vc|VGA_data_hold\(4) & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|blk~0_combout\,
	datac => \vc|VGA_data_hold\(4),
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[7]~4_combout\);

-- Location: LCCOMB_X36_Y38_N4
\dc|storing_color[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[7]~feeder_combout\ = \dc|storing_color_next[7]~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|storing_color_next[7]~4_combout\,
	combout => \dc|storing_color[7]~feeder_combout\);

-- Location: FF_X36_Y38_N5
\dc|storing_color[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[7]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(7));

-- Location: M9K_X37_Y38_N0
\dc|rh|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "display_out:dc|row_hold:rh|altsyncram:altsyncram_component|altsyncram_3dh1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 640,
	port_a_logical_ram_width => 24,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \dc|storing~q\,
	portare => VCC,
	clk0 => \clk_50MHz~clkctrl_outclk\,
	portadatain => \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \dc|rh|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X42_Y36_N6
\dc|flag~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|flag~0_combout\ = \dc|flag~q\ $ (((!\dc|flag_ld~q\ & ((\dc|v|VS~1_combout\) # (\dc|v|row_counter|Q\(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|flag_ld~q\,
	datab => \dc|v|VS~1_combout\,
	datac => \dc|flag~q\,
	datad => \dc|v|row_counter|Q\(9),
	combout => \dc|flag~0_combout\);

-- Location: FF_X42_Y36_N7
\dc|flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|flag~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|flag~q\);

-- Location: LCCOMB_X43_Y36_N2
\dc|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~0_combout\ = (\dc|v|row_counter|Q\(0) & (\dc|flag~q\ $ (VCC))) # (!\dc|v|row_counter|Q\(0) & (\dc|flag~q\ & VCC))
-- \dc|Add1~1\ = CARRY((\dc|v|row_counter|Q\(0) & \dc|flag~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(0),
	datab => \dc|flag~q\,
	datad => VCC,
	combout => \dc|Add1~0_combout\,
	cout => \dc|Add1~1\);

-- Location: LCCOMB_X34_Y38_N4
\dc|VGA_R~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~0_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(0) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(0),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~0_combout\);

-- Location: LCCOMB_X35_Y50_N16
\dc|VGA_R~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~1_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(1) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(1),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~1_combout\);

-- Location: LCCOMB_X35_Y50_N18
\dc|VGA_R~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~2_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(2) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(2),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~2_combout\);

-- Location: IOIBUF_X5_Y0_N8
\SRAM_DQ[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(0),
	o => \SRAM_DQ[0]~input_o\);

-- Location: LCCOMB_X34_Y38_N22
\vc|VGA_data_hold[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[0]~feeder_combout\ = \SRAM_DQ[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[0]~input_o\,
	combout => \vc|VGA_data_hold[0]~feeder_combout\);

-- Location: FF_X34_Y38_N23
\vc|VGA_data_hold[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[0]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(0));

-- Location: LCCOMB_X36_Y38_N16
\dc|VGA_R~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~3_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(0)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|rh|altsyncram_component|auto_generated|q_a\(3),
	datac => \vc|VGA_data_hold\(0),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~3_combout\);

-- Location: IOIBUF_X1_Y0_N1
\SRAM_DQ[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(1),
	o => \SRAM_DQ[1]~input_o\);

-- Location: FF_X34_Y38_N1
\vc|VGA_data_hold[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[1]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(1));

-- Location: LCCOMB_X36_Y38_N6
\dc|VGA_R~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~4_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(1)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|rh|altsyncram_component|auto_generated|q_a\(4),
	datac => \vc|VGA_data_hold\(1),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~4_combout\);

-- Location: LCCOMB_X36_Y38_N24
\dc|VGA_R~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~5_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(2)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|rh|altsyncram_component|auto_generated|q_a\(5),
	datac => \vc|VGA_data_hold\(2),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~5_combout\);

-- Location: LCCOMB_X34_Y38_N28
\dc|VGA_R~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~6_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(3)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|rh|altsyncram_component|auto_generated|q_a\(6),
	datac => \vc|VGA_data_hold\(3),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~6_combout\);

-- Location: LCCOMB_X34_Y38_N6
\dc|VGA_R~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_R~7_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(4)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|rh|altsyncram_component|auto_generated|q_a\(7),
	datac => \vc|VGA_data_hold\(4),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_R~7_combout\);

-- Location: LCCOMB_X35_Y50_N0
\dc|VGA_G~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~0_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(8) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(8),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_G~0_combout\);

-- Location: IOIBUF_X11_Y0_N22
\SRAM_DQ[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(5),
	o => \SRAM_DQ[5]~input_o\);

-- Location: FF_X34_Y38_N21
\vc|VGA_data_hold[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[5]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(5));

-- Location: LCCOMB_X34_Y38_N26
\dc|storing_color_next[11]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[11]~5_combout\ = (\vc|VGA_data_hold\(5) & (!\dc|blk~0_combout\ & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|VGA_data_hold\(5),
	datac => \dc|blk~0_combout\,
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[11]~5_combout\);

-- Location: LCCOMB_X36_Y40_N16
\dc|storing_color[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[11]~feeder_combout\ = \dc|storing_color_next[11]~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|storing_color_next[11]~5_combout\,
	combout => \dc|storing_color[11]~feeder_combout\);

-- Location: FF_X36_Y40_N17
\dc|storing_color[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[11]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(11));

-- Location: IOIBUF_X11_Y0_N15
\SRAM_DQ[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(6),
	o => \SRAM_DQ[6]~input_o\);

-- Location: LCCOMB_X35_Y37_N24
\vc|VGA_data_hold[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[6]~feeder_combout\ = \SRAM_DQ[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[6]~input_o\,
	combout => \vc|VGA_data_hold[6]~feeder_combout\);

-- Location: FF_X35_Y37_N25
\vc|VGA_data_hold[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(6));

-- Location: LCCOMB_X36_Y38_N22
\dc|storing_color_next[12]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[12]~6_combout\ = (\vc|VGA_data_hold\(6) & (!\dc|blk~0_combout\ & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|VGA_data_hold\(6),
	datac => \dc|blk~0_combout\,
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[12]~6_combout\);

-- Location: LCCOMB_X36_Y38_N2
\dc|storing_color[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[12]~feeder_combout\ = \dc|storing_color_next[12]~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|storing_color_next[12]~6_combout\,
	combout => \dc|storing_color[12]~feeder_combout\);

-- Location: FF_X36_Y38_N3
\dc|storing_color[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[12]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(12));

-- Location: LCCOMB_X36_Y40_N10
\dc|storing_color[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[13]~feeder_combout\ = \dc|storing_color_next[13]~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_color_next[13]~7_combout\,
	combout => \dc|storing_color[13]~feeder_combout\);

-- Location: FF_X36_Y40_N11
\dc|storing_color[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[13]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(13));

-- Location: LCCOMB_X36_Y40_N12
\dc|storing_color[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[14]~feeder_combout\ = \dc|storing_color_next[14]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_color_next[14]~8_combout\,
	combout => \dc|storing_color[14]~feeder_combout\);

-- Location: FF_X36_Y40_N13
\dc|storing_color[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[14]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(14));

-- Location: IOIBUF_X0_Y22_N22
\SRAM_DQ[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(9),
	o => \SRAM_DQ[9]~input_o\);

-- Location: FF_X35_Y37_N19
\vc|VGA_data_hold[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[9]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(9));

-- Location: LCCOMB_X35_Y37_N2
\dc|storing_color_next[15]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[15]~9_combout\ = (!\dc|blk~0_combout\ & (\vc|VGA_data_hold\(9) & \dc|v|row_counter|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|blk~0_combout\,
	datac => \vc|VGA_data_hold\(9),
	datad => \dc|v|row_counter|Q\(0),
	combout => \dc|storing_color_next[15]~9_combout\);

-- Location: LCCOMB_X36_Y40_N2
\dc|storing_color[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[15]~feeder_combout\ = \dc|storing_color_next[15]~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|storing_color_next[15]~9_combout\,
	combout => \dc|storing_color[15]~feeder_combout\);

-- Location: FF_X36_Y40_N3
\dc|storing_color[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[15]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(15));

-- Location: M9K_X37_Y40_N0
\dc|rh|altsyncram_component|auto_generated|ram_block1a9\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "display_out:dc|row_hold:rh|altsyncram:altsyncram_component|altsyncram_3dh1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 640,
	port_a_logical_ram_width => 24,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \dc|storing~q\,
	portare => VCC,
	clk0 => \clk_50MHz~clkctrl_outclk\,
	portadatain => \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \dc|rh|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

-- Location: LCCOMB_X35_Y50_N2
\dc|VGA_G~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~1_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(9) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(9),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_G~1_combout\);

-- Location: LCCOMB_X35_Y50_N12
\dc|VGA_G~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~2_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(10) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(10),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_G~2_combout\);

-- Location: LCCOMB_X34_Y38_N20
\dc|VGA_G~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~3_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(5)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|rh|altsyncram_component|auto_generated|q_a\(11),
	datac => \vc|VGA_data_hold\(5),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_G~3_combout\);

-- Location: LCCOMB_X36_Y38_N26
\dc|VGA_G~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~4_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(6)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|rh|altsyncram_component|auto_generated|q_a\(12),
	datac => \vc|VGA_data_hold\(6),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_G~4_combout\);

-- Location: IOIBUF_X20_Y0_N8
\SRAM_DQ[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(7),
	o => \SRAM_DQ[7]~input_o\);

-- Location: LCCOMB_X35_Y37_N22
\vc|VGA_data_hold[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[7]~feeder_combout\ = \SRAM_DQ[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[7]~input_o\,
	combout => \vc|VGA_data_hold[7]~feeder_combout\);

-- Location: FF_X35_Y37_N23
\vc|VGA_data_hold[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[7]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(7));

-- Location: LCCOMB_X36_Y37_N24
\dc|VGA_G~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~5_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(7)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|rh|altsyncram_component|auto_generated|q_a\(13),
	datab => \vc|VGA_data_hold\(7),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_G~5_combout\);

-- Location: IOIBUF_X0_Y21_N15
\SRAM_DQ[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(8),
	o => \SRAM_DQ[8]~input_o\);

-- Location: LCCOMB_X35_Y37_N0
\vc|VGA_data_hold[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[8]~feeder_combout\ = \SRAM_DQ[8]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[8]~input_o\,
	combout => \vc|VGA_data_hold[8]~feeder_combout\);

-- Location: FF_X35_Y37_N1
\vc|VGA_data_hold[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[8]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(8));

-- Location: LCCOMB_X36_Y37_N22
\dc|VGA_G~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~6_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(8)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|rh|altsyncram_component|auto_generated|q_a\(14),
	datab => \vc|VGA_data_hold\(8),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_G~6_combout\);

-- Location: LCCOMB_X35_Y37_N18
\dc|VGA_G~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_G~7_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(9)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|rh|altsyncram_component|auto_generated|q_a\(15),
	datab => \dc|Add1~0_combout\,
	datac => \vc|VGA_data_hold\(9),
	combout => \dc|VGA_G~7_combout\);

-- Location: LCCOMB_X38_Y65_N0
\dc|VGA_B~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~0_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(16) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(16),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_B~0_combout\);

-- Location: LCCOMB_X38_Y65_N2
\dc|VGA_B~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~1_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(17) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(17),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_B~1_combout\);

-- Location: LCCOMB_X36_Y37_N8
\dc|storing_color_next[19]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[19]~10_combout\ = (\vc|VGA_data_hold\(10) & (\dc|v|row_counter|Q\(0) & !\dc|blk~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|VGA_data_hold\(10),
	datac => \dc|v|row_counter|Q\(0),
	datad => \dc|blk~0_combout\,
	combout => \dc|storing_color_next[19]~10_combout\);

-- Location: FF_X36_Y37_N23
\dc|storing_color[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|storing_color_next[19]~10_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(19));

-- Location: LCCOMB_X36_Y37_N10
\dc|storing_color[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[20]~feeder_combout\ = \dc|storing_color_next[20]~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_color_next[20]~11_combout\,
	combout => \dc|storing_color[20]~feeder_combout\);

-- Location: FF_X36_Y37_N11
\dc|storing_color[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[20]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(20));

-- Location: IOIBUF_X0_Y7_N8
\SRAM_DQ[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(12),
	o => \SRAM_DQ[12]~input_o\);

-- Location: FF_X35_Y37_N15
\vc|VGA_data_hold[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[12]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(12));

-- Location: LCCOMB_X36_Y37_N12
\dc|storing_color_next[21]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color_next[21]~12_combout\ = (!\dc|blk~0_combout\ & (\dc|v|row_counter|Q\(0) & \vc|VGA_data_hold\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|blk~0_combout\,
	datac => \dc|v|row_counter|Q\(0),
	datad => \vc|VGA_data_hold\(12),
	combout => \dc|storing_color_next[21]~12_combout\);

-- Location: LCCOMB_X36_Y37_N16
\dc|storing_color[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[21]~feeder_combout\ = \dc|storing_color_next[21]~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|storing_color_next[21]~12_combout\,
	combout => \dc|storing_color[21]~feeder_combout\);

-- Location: FF_X36_Y37_N17
\dc|storing_color[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[21]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(21));

-- Location: LCCOMB_X36_Y37_N6
\dc|storing_color[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[22]~feeder_combout\ = \dc|storing_color_next[22]~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_color_next[22]~13_combout\,
	combout => \dc|storing_color[22]~feeder_combout\);

-- Location: FF_X36_Y37_N7
\dc|storing_color[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[22]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(22));

-- Location: LCCOMB_X36_Y37_N4
\dc|storing_color[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|storing_color[23]~feeder_combout\ = \dc|storing_color_next[23]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|storing_color_next[23]~14_combout\,
	combout => \dc|storing_color[23]~feeder_combout\);

-- Location: FF_X36_Y37_N5
\dc|storing_color[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|storing_color[23]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|storing_color\(23));

-- Location: M9K_X37_Y37_N0
\dc|rh|altsyncram_component|auto_generated|ram_block1a18\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "display_out:dc|row_hold:rh|altsyncram:altsyncram_component|altsyncram_3dh1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 18,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 640,
	port_a_logical_ram_width => 24,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \dc|storing~q\,
	portare => VCC,
	clk0 => \clk_50MHz~clkctrl_outclk\,
	portadatain => \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\,
	portaaddr => \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \dc|rh|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\);

-- Location: LCCOMB_X35_Y50_N22
\dc|VGA_B~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~2_combout\ = (\dc|rh|altsyncram_component|auto_generated|q_a\(18) & !\dc|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(18),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_B~2_combout\);

-- Location: IOIBUF_X0_Y17_N15
\SRAM_DQ[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(10),
	o => \SRAM_DQ[10]~input_o\);

-- Location: LCCOMB_X35_Y37_N20
\vc|VGA_data_hold[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[10]~feeder_combout\ = \SRAM_DQ[10]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[10]~input_o\,
	combout => \vc|VGA_data_hold[10]~feeder_combout\);

-- Location: FF_X35_Y37_N21
\vc|VGA_data_hold[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[10]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(10));

-- Location: LCCOMB_X36_Y37_N20
\dc|VGA_B~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~3_combout\ = (\dc|Add1~0_combout\ & (\vc|VGA_data_hold\(10))) # (!\dc|Add1~0_combout\ & ((\dc|rh|altsyncram_component|auto_generated|q_a\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|VGA_data_hold\(10),
	datab => \dc|rh|altsyncram_component|auto_generated|q_a\(19),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_B~3_combout\);

-- Location: IOIBUF_X0_Y16_N15
\SRAM_DQ[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(11),
	o => \SRAM_DQ[11]~input_o\);

-- Location: FF_X35_Y32_N5
\vc|VGA_data_hold[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[11]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(11));

-- Location: LCCOMB_X36_Y37_N2
\dc|VGA_B~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~4_combout\ = (\dc|Add1~0_combout\ & (\vc|VGA_data_hold\(11))) # (!\dc|Add1~0_combout\ & ((\dc|rh|altsyncram_component|auto_generated|q_a\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|VGA_data_hold\(11),
	datac => \dc|rh|altsyncram_component|auto_generated|q_a\(20),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_B~4_combout\);

-- Location: LCCOMB_X36_Y37_N28
\dc|VGA_B~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~5_combout\ = (\dc|Add1~0_combout\ & (\vc|VGA_data_hold\(12))) # (!\dc|Add1~0_combout\ & ((\dc|rh|altsyncram_component|auto_generated|q_a\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|VGA_data_hold\(12),
	datab => \dc|rh|altsyncram_component|auto_generated|q_a\(21),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_B~5_combout\);

-- Location: IOIBUF_X3_Y0_N22
\SRAM_DQ[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(13),
	o => \SRAM_DQ[13]~input_o\);

-- Location: LCCOMB_X35_Y32_N26
\vc|VGA_data_hold[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[13]~feeder_combout\ = \SRAM_DQ[13]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[13]~input_o\,
	combout => \vc|VGA_data_hold[13]~feeder_combout\);

-- Location: FF_X35_Y32_N27
\vc|VGA_data_hold[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[13]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(13));

-- Location: LCCOMB_X35_Y37_N8
\dc|VGA_B~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~6_combout\ = (\dc|Add1~0_combout\ & (\vc|VGA_data_hold\(13))) # (!\dc|Add1~0_combout\ & ((\dc|rh|altsyncram_component|auto_generated|q_a\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vc|VGA_data_hold\(13),
	datac => \dc|Add1~0_combout\,
	datad => \dc|rh|altsyncram_component|auto_generated|q_a\(22),
	combout => \dc|VGA_B~6_combout\);

-- Location: IOIBUF_X7_Y0_N22
\SRAM_DQ[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(14),
	o => \SRAM_DQ[14]~input_o\);

-- Location: LCCOMB_X34_Y38_N30
\vc|VGA_data_hold[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|VGA_data_hold[14]~feeder_combout\ = \SRAM_DQ[14]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[14]~input_o\,
	combout => \vc|VGA_data_hold[14]~feeder_combout\);

-- Location: FF_X34_Y38_N31
\vc|VGA_data_hold[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|VGA_data_hold[14]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \dc|ALT_INV_vram_re~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|VGA_data_hold\(14));

-- Location: LCCOMB_X36_Y37_N18
\dc|VGA_B~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|VGA_B~7_combout\ = (\dc|Add1~0_combout\ & ((\vc|VGA_data_hold\(14)))) # (!\dc|Add1~0_combout\ & (\dc|rh|altsyncram_component|auto_generated|q_a\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|rh|altsyncram_component|auto_generated|q_a\(23),
	datac => \vc|VGA_data_hold\(14),
	datad => \dc|Add1~0_combout\,
	combout => \dc|VGA_B~7_combout\);

-- Location: CLKCTRL_G4
\pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y36_N14
clk_100MHz : cycloneive_lcell_comb
-- Equation(s):
-- \clk_100MHz~combout\ = LCELL((\pl|altpll_component|auto_generated|pll_lock_sync~q\ & (\pl|altpll_component|auto_generated|wire_pll1_locked\ & GLOBAL(\pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pl|altpll_component|auto_generated|pll_lock_sync~q\,
	datac => \pl|altpll_component|auto_generated|wire_pll1_locked\,
	datad => \pl|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	combout => \clk_100MHz~combout\);

-- Location: CLKCTRL_G0
\clk_100MHz~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_100MHz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_100MHz~clkctrl_outclk\);

-- Location: LCCOMB_X34_Y38_N24
\vc|GPU_data_out[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[0]~feeder_combout\ = \SRAM_DQ[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[0]~input_o\,
	combout => \vc|GPU_data_out[0]~feeder_combout\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: LCCOMB_X35_Y32_N22
\vc|GPU_data_ld~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_ld~0_combout\ = (!\vc|counter\(1) & (!\always1~2_combout\ & (\dc|vram_re~combout\ & !\KEY[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|counter\(1),
	datab => \always1~2_combout\,
	datac => \dc|vram_re~combout\,
	datad => \KEY[2]~input_o\,
	combout => \vc|GPU_data_ld~0_combout\);

-- Location: FF_X34_Y38_N25
\vc|GPU_data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[0]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(0));

-- Location: FF_X34_Y38_N19
\vc|GPU_data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[1]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(1));

-- Location: LCCOMB_X34_Y38_N12
\vc|GPU_data_out[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[2]~feeder_combout\ = \SRAM_DQ[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[2]~input_o\,
	combout => \vc|GPU_data_out[2]~feeder_combout\);

-- Location: FF_X34_Y38_N13
\vc|GPU_data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[2]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(2));

-- Location: FF_X34_Y38_N3
\vc|GPU_data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[3]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(3));

-- Location: FF_X34_Y38_N17
\vc|GPU_data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[4]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(4));

-- Location: LCCOMB_X34_Y38_N14
\vc|GPU_data_out[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[5]~feeder_combout\ = \SRAM_DQ[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[5]~input_o\,
	combout => \vc|GPU_data_out[5]~feeder_combout\);

-- Location: FF_X34_Y38_N15
\vc|GPU_data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(5));

-- Location: LCCOMB_X35_Y37_N6
\vc|GPU_data_out[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[6]~feeder_combout\ = \SRAM_DQ[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[6]~input_o\,
	combout => \vc|GPU_data_out[6]~feeder_combout\);

-- Location: FF_X35_Y37_N7
\vc|GPU_data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(6));

-- Location: LCCOMB_X35_Y37_N12
\vc|GPU_data_out[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[7]~feeder_combout\ = \SRAM_DQ[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[7]~input_o\,
	combout => \vc|GPU_data_out[7]~feeder_combout\);

-- Location: FF_X35_Y37_N13
\vc|GPU_data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[7]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(7));

-- Location: LCCOMB_X35_Y37_N30
\vc|GPU_data_out[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[8]~feeder_combout\ = \SRAM_DQ[8]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[8]~input_o\,
	combout => \vc|GPU_data_out[8]~feeder_combout\);

-- Location: FF_X35_Y37_N31
\vc|GPU_data_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[8]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(8));

-- Location: FF_X35_Y37_N17
\vc|GPU_data_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[9]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(9));

-- Location: LCCOMB_X35_Y37_N26
\vc|GPU_data_out[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[10]~feeder_combout\ = \SRAM_DQ[10]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[10]~input_o\,
	combout => \vc|GPU_data_out[10]~feeder_combout\);

-- Location: FF_X35_Y37_N27
\vc|GPU_data_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[10]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(10));

-- Location: FF_X35_Y32_N1
\vc|GPU_data_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[11]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(11));

-- Location: FF_X35_Y37_N29
\vc|GPU_data_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[12]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(12));

-- Location: LCCOMB_X35_Y32_N10
\vc|GPU_data_out[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[13]~feeder_combout\ = \SRAM_DQ[13]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[13]~input_o\,
	combout => \vc|GPU_data_out[13]~feeder_combout\);

-- Location: FF_X35_Y32_N11
\vc|GPU_data_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[13]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(13));

-- Location: LCCOMB_X34_Y38_N8
\vc|GPU_data_out[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|GPU_data_out[14]~feeder_combout\ = \SRAM_DQ[14]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ[14]~input_o\,
	combout => \vc|GPU_data_out[14]~feeder_combout\);

-- Location: FF_X34_Y38_N9
\vc|GPU_data_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	d => \vc|GPU_data_out[14]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(14));

-- Location: IOIBUF_X3_Y0_N15
\SRAM_DQ[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => SRAM_DQ(15),
	o => \SRAM_DQ[15]~input_o\);

-- Location: FF_X35_Y37_N11
\vc|GPU_data_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100MHz~clkctrl_outclk\,
	asdata => \SRAM_DQ[15]~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vc|GPU_data_ld~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vc|GPU_data_out\(15));

-- Location: LCCOMB_X34_Y25_N0
\vc|SRAM_OE_N~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_OE_N~0_combout\ = (\dc|vram_re~combout\ & ((\KEY[2]~input_o\) # ((\always1~2_combout\) # (\vc|counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => \dc|vram_re~combout\,
	datac => \always1~2_combout\,
	datad => \vc|counter\(1),
	combout => \vc|SRAM_OE_N~0_combout\);

-- Location: LCCOMB_X38_Y30_N22
\dc|dis_h_hold[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|dis_h_hold[5]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \dc|dis_h_hold[5]~feeder_combout\);

-- Location: FF_X38_Y30_N23
\dc|dis_h_hold[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|dis_h_hold[5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|dis_h_hold\(5));

-- Location: LCCOMB_X42_Y30_N12
\dc|int_x[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[0]~10_combout\ = (\dc|Div0|auto_generated|divider|divider|op_24~8_combout\ & (\dc|dis_h_hold\(5) & VCC)) # (!\dc|Div0|auto_generated|divider|divider|op_24~8_combout\ & (\dc|dis_h_hold\(5) $ (VCC)))
-- \dc|int_x[0]~11\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_24~8_combout\ & \dc|dis_h_hold\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_24~8_combout\,
	datab => \dc|dis_h_hold\(5),
	datad => VCC,
	combout => \dc|int_x[0]~10_combout\,
	cout => \dc|int_x[0]~11\);

-- Location: FF_X42_Y30_N13
\dc|int_x[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[0]~10_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(0));

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X35_Y30_N22
\vc|SRAM_ADDR[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[0]~2_combout\ = (\always1~2_combout\ & (((!w_x(0))))) # (!\always1~2_combout\ & (\SW[0]~input_o\ & (!\KEY[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[0]~input_o\,
	datac => \KEY[2]~input_o\,
	datad => w_x(0),
	combout => \vc|SRAM_ADDR[0]~2_combout\);

-- Location: LCCOMB_X35_Y32_N8
\vc|SRAM_ADDR[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[0]~3_combout\ = (\dc|vram_re~combout\ & (((\vc|SRAM_ADDR[0]~2_combout\ & !\vc|counter\(1))))) # (!\dc|vram_re~combout\ & (\dc|int_x\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|int_x\(0),
	datab => \vc|SRAM_ADDR[0]~2_combout\,
	datac => \vc|counter\(1),
	datad => \dc|vram_re~combout\,
	combout => \vc|SRAM_ADDR[0]~3_combout\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LCCOMB_X38_Y30_N0
\vc|SRAM_ADDR[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[1]~4_combout\ = (\always1~2_combout\ & (((!w_x(1))))) # (!\always1~2_combout\ & (\SW[1]~input_o\ & (!\KEY[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[1]~input_o\,
	datac => \KEY[2]~input_o\,
	datad => w_x(1),
	combout => \vc|SRAM_ADDR[1]~4_combout\);

-- Location: LCCOMB_X43_Y29_N28
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14_combout\ = \dc|mult_x\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(14),
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14_combout\);

-- Location: LCCOMB_X40_Y33_N12
\dc|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~0_combout\ = \dc|v|col_counter|Q\(2) $ (VCC)
-- \dc|Add0~1\ = CARRY(\dc|v|col_counter|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(2),
	datad => VCC,
	combout => \dc|Add0~0_combout\,
	cout => \dc|Add0~1\);

-- Location: LCCOMB_X43_Y33_N12
\dc|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~2_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~0_combout\,
	combout => \dc|Add0~2_combout\);

-- Location: LCCOMB_X40_Y33_N14
\dc|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~3_combout\ = (\dc|v|col_counter|Q\(3) & (!\dc|Add0~1\)) # (!\dc|v|col_counter|Q\(3) & ((\dc|Add0~1\) # (GND)))
-- \dc|Add0~4\ = CARRY((!\dc|Add0~1\) # (!\dc|v|col_counter|Q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(3),
	datad => VCC,
	cin => \dc|Add0~1\,
	combout => \dc|Add0~3_combout\,
	cout => \dc|Add0~4\);

-- Location: LCCOMB_X43_Y33_N10
\dc|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~5_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~3_combout\,
	combout => \dc|Add0~5_combout\);

-- Location: LCCOMB_X40_Y33_N16
\dc|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~6_combout\ = (\dc|v|col_counter|Q\(4) & (\dc|Add0~4\ $ (GND))) # (!\dc|v|col_counter|Q\(4) & (!\dc|Add0~4\ & VCC))
-- \dc|Add0~7\ = CARRY((\dc|v|col_counter|Q\(4) & !\dc|Add0~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(4),
	datad => VCC,
	cin => \dc|Add0~4\,
	combout => \dc|Add0~6_combout\,
	cout => \dc|Add0~7\);

-- Location: LCCOMB_X43_Y33_N4
\dc|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~8_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~6_combout\,
	combout => \dc|Add0~8_combout\);

-- Location: LCCOMB_X40_Y33_N18
\dc|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~9_combout\ = (\dc|v|col_counter|Q\(5) & (!\dc|Add0~7\)) # (!\dc|v|col_counter|Q\(5) & ((\dc|Add0~7\) # (GND)))
-- \dc|Add0~10\ = CARRY((!\dc|Add0~7\) # (!\dc|v|col_counter|Q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(5),
	datad => VCC,
	cin => \dc|Add0~7\,
	combout => \dc|Add0~9_combout\,
	cout => \dc|Add0~10\);

-- Location: LCCOMB_X43_Y33_N30
\dc|Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~11_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datac => \dc|Add0~9_combout\,
	combout => \dc|Add0~11_combout\);

-- Location: LCCOMB_X40_Y33_N20
\dc|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~12_combout\ = (\dc|v|col_counter|Q\(6) & (\dc|Add0~10\ $ (GND))) # (!\dc|v|col_counter|Q\(6) & (!\dc|Add0~10\ & VCC))
-- \dc|Add0~13\ = CARRY((\dc|v|col_counter|Q\(6) & !\dc|Add0~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(6),
	datad => VCC,
	cin => \dc|Add0~10\,
	combout => \dc|Add0~12_combout\,
	cout => \dc|Add0~13\);

-- Location: LCCOMB_X43_Y33_N20
\dc|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~14_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~12_combout\,
	combout => \dc|Add0~14_combout\);

-- Location: LCCOMB_X40_Y33_N22
\dc|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~15_combout\ = (\dc|v|col_counter|Q\(7) & (!\dc|Add0~13\)) # (!\dc|v|col_counter|Q\(7) & ((\dc|Add0~13\) # (GND)))
-- \dc|Add0~16\ = CARRY((!\dc|Add0~13\) # (!\dc|v|col_counter|Q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(7),
	datad => VCC,
	cin => \dc|Add0~13\,
	combout => \dc|Add0~15_combout\,
	cout => \dc|Add0~16\);

-- Location: LCCOMB_X43_Y33_N6
\dc|Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~17_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~15_combout\,
	combout => \dc|Add0~17_combout\);

-- Location: LCCOMB_X40_Y33_N24
\dc|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~18_combout\ = (\dc|v|col_counter|Q\(8) & (\dc|Add0~16\ $ (GND))) # (!\dc|v|col_counter|Q\(8) & (!\dc|Add0~16\ & VCC))
-- \dc|Add0~19\ = CARRY((\dc|v|col_counter|Q\(8) & !\dc|Add0~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|col_counter|Q\(8),
	datad => VCC,
	cin => \dc|Add0~16\,
	combout => \dc|Add0~18_combout\,
	cout => \dc|Add0~19\);

-- Location: LCCOMB_X43_Y33_N16
\dc|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~20_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~18_combout\,
	combout => \dc|Add0~20_combout\);

-- Location: LCCOMB_X40_Y33_N26
\dc|Add0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~21_combout\ = (\dc|v|col_counter|Q\(9) & (!\dc|Add0~19\)) # (!\dc|v|col_counter|Q\(9) & ((\dc|Add0~19\) # (GND)))
-- \dc|Add0~22\ = CARRY((!\dc|Add0~19\) # (!\dc|v|col_counter|Q\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|col_counter|Q\(9),
	datad => VCC,
	cin => \dc|Add0~19\,
	combout => \dc|Add0~21_combout\,
	cout => \dc|Add0~22\);

-- Location: LCCOMB_X43_Y33_N14
\dc|Add0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~23_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~21_combout\,
	combout => \dc|Add0~23_combout\);

-- Location: LCCOMB_X40_Y33_N28
\dc|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~24_combout\ = \dc|Add0~22\ $ (!\dc|v|col_counter|Q\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \dc|v|col_counter|Q\(10),
	cin => \dc|Add0~22\,
	combout => \dc|Add0~24_combout\);

-- Location: LCCOMB_X43_Y33_N24
\dc|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add0~26_combout\ = (!\dc|Equal0~1_combout\ & \dc|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Equal0~1_combout\,
	datad => \dc|Add0~24_combout\,
	combout => \dc|Add0~26_combout\);

-- Location: DSPMULT_X44_Y29_N0
\dc|Mult0|auto_generated|mac_mult1\ : cycloneive_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "none",
	dataa_width => 18,
	datab_clock => "none",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => GND,
	signb => GND,
	dataa => \dc|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \dc|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \dc|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: FF_X43_Y28_N5
\dc|mult_x[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT19\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(19));

-- Location: FF_X43_Y28_N21
\dc|mult_x[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT17\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(17));

-- Location: LCCOMB_X43_Y28_N10
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0_combout\ = \dc|mult_x\(17) $ (VCC)
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~1\ = CARRY(\dc|mult_x\(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_x\(17),
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~1\);

-- Location: LCCOMB_X43_Y28_N14
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~4_combout\ = (\dc|mult_x\(19) & (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~3\ $ (GND))) # (!\dc|mult_x\(19) & 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~3\ & VCC))
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~5\ = CARRY((\dc|mult_x\(19) & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_x\(19),
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[8]~3\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~5\);

-- Location: LCCOMB_X43_Y28_N16
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[10]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[10]~7_cout\ = CARRY(!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~5\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[10]~7_cout\);

-- Location: LCCOMB_X43_Y28_N18
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ = \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[10]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[10]~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\);

-- Location: LCCOMB_X43_Y28_N2
\dc|Div0|auto_generated|divider|divider|StageOut[240]~197\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[240]~197_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~4_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[9]~4_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[240]~197_combout\);

-- Location: LCCOMB_X43_Y28_N4
\dc|Div0|auto_generated|divider|divider|StageOut[239]~198\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[239]~198_combout\ = (\dc|mult_x\(18) & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(18),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[239]~198_combout\);

-- Location: LCCOMB_X43_Y28_N0
\dc|Div0|auto_generated|divider|divider|StageOut[238]~200\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[238]~200_combout\ = (\dc|mult_x\(17) & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_x\(17),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[238]~200_combout\);

-- Location: FF_X42_Y28_N19
\dc|mult_x[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT16\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(16));

-- Location: LCCOMB_X42_Y28_N6
\dc|Div0|auto_generated|divider|divider|StageOut[237]~202\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[237]~202_combout\ = (\dc|mult_x\(16) & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_x\(16),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[237]~202_combout\);

-- Location: LCCOMB_X43_Y28_N24
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[238]~201_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[238]~200_combout\)))) # (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[238]~201_combout\ & 
-- (!\dc|Div0|auto_generated|divider|divider|StageOut[238]~200_combout\)))
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[238]~201_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[238]~200_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[238]~201_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[238]~200_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~1\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~3\);

-- Location: LCCOMB_X43_Y28_N26
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~4_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[239]~199_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[239]~198_combout\)))) # (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[239]~199_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[239]~198_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[239]~199_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[239]~198_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[239]~199_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[239]~198_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~3\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~5\);

-- Location: LCCOMB_X43_Y28_N28
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[10]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[10]~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[240]~196_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[240]~197_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[240]~196_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[240]~197_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~5\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[10]~7_cout\);

-- Location: LCCOMB_X43_Y28_N30
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ = \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[10]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[10]~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\);

-- Location: LCCOMB_X43_Y29_N8
\dc|Div0|auto_generated|divider|divider|StageOut[247]~346\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[247]~346_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|mult_x\(14))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(14),
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[247]~346_combout\);

-- Location: LCCOMB_X43_Y29_N22
\dc|Div0|auto_generated|divider|divider|StageOut[235]~214\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[235]~214_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[4]~14_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[235]~214_combout\);

-- Location: LCCOMB_X43_Y29_N16
\dc|Div0|auto_generated|divider|divider|StageOut[235]~213\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[235]~213_combout\ = (\dc|mult_x\(14) & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(14),
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[235]~213_combout\);

-- Location: LCCOMB_X43_Y29_N14
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[235]~214_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[235]~213_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[235]~214_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[235]~213_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12_combout\);

-- Location: LCCOMB_X43_Y29_N12
\dc|Div0|auto_generated|divider|divider|StageOut[247]~215\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[247]~215_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[247]~215_combout\);

-- Location: LCCOMB_X43_Y29_N20
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[247]~346_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[247]~215_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[247]~346_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[247]~215_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10_combout\);

-- Location: LCCOMB_X43_Y28_N8
\dc|Div0|auto_generated|divider|divider|StageOut[250]~343\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|mult_x\(17))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(17),
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[7]~0_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\);

-- Location: LCCOMB_X42_Y28_N10
\dc|Div0|auto_generated|divider|divider|StageOut[251]~204\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[251]~204_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[9]~4_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[251]~204_combout\);

-- Location: LCCOMB_X42_Y28_N24
\dc|Div0|auto_generated|divider|divider|StageOut[249]~344\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|mult_x\(16)))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[6]~10_combout\,
	datab => \dc|mult_x\(16),
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\);

-- Location: FF_X40_Y28_N19
\dc|mult_x[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT15\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(15));

-- Location: LCCOMB_X41_Y28_N2
\dc|Div0|auto_generated|divider|divider|StageOut[248]~345\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|mult_x\(15)))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12_combout\,
	datab => \dc|mult_x\(15),
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\);

-- Location: LCCOMB_X41_Y28_N16
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[249]~206_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\)))) # (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[249]~206_combout\ & 
-- (!\dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\)))
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[249]~206_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[249]~206_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~1\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~3\);

-- Location: LCCOMB_X41_Y28_N20
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[10]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[10]~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[251]~342_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[251]~204_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[251]~342_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[251]~204_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[9]~5\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[10]~7_cout\);

-- Location: LCCOMB_X41_Y28_N22
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ = \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[10]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[10]~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\);

-- Location: LCCOMB_X41_Y28_N28
\dc|Div0|auto_generated|divider|divider|StageOut[262]~292\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[262]~292_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[250]~343_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[8]~2_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[262]~292_combout\);

-- Location: LCCOMB_X41_Y28_N0
\dc|Div0|auto_generated|divider|divider|StageOut[261]~211\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[261]~211_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[261]~211_combout\);

-- Location: LCCOMB_X40_Y28_N0
\dc|Div0|auto_generated|divider|divider|StageOut[236]~207\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[236]~207_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|mult_x\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|mult_x\(15),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[236]~207_combout\);

-- Location: LCCOMB_X40_Y28_N12
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12_combout\ = \dc|mult_x\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|mult_x\(15),
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12_combout\);

-- Location: LCCOMB_X40_Y28_N30
\dc|Div0|auto_generated|divider|divider|StageOut[236]~208\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[236]~208_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[5]~12_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[236]~208_combout\);

-- Location: LCCOMB_X41_Y28_N24
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[236]~207_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[236]~208_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[236]~207_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[236]~208_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10_combout\);

-- Location: LCCOMB_X41_Y28_N4
\dc|Div0|auto_generated|divider|divider|StageOut[260]~294\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[6]~10_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[248]~345_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\);

-- Location: LCCOMB_X43_Y29_N10
\dc|Div0|auto_generated|divider|divider|StageOut[259]~295\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[247]~346_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[5]~12_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[247]~346_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\);

-- Location: LCCOMB_X42_Y29_N24
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[260]~212_combout\) # 
-- (\dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\)))) # (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[260]~212_combout\ & 
-- (!\dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\)))
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[260]~212_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[260]~212_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[7]~1\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~3\);

-- Location: LCCOMB_X42_Y29_N28
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[10]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[10]~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[262]~210_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[262]~292_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[262]~210_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[262]~292_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[9]~5\,
	cout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[10]~7_cout\);

-- Location: LCCOMB_X42_Y29_N30
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ = \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[10]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[10]~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\);

-- Location: LCCOMB_X41_Y29_N6
\dc|Div0|auto_generated|divider|divider|StageOut[271]~298\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[6]~10_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[259]~295_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\);

-- Location: LCCOMB_X43_Y29_N18
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16_combout\ = \dc|mult_x\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(13),
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16_combout\);

-- Location: LCCOMB_X43_Y29_N2
\dc|Div0|auto_generated|divider|divider|StageOut[246]~347\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[246]~347_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|mult_x\(13))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(13),
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[246]~347_combout\);

-- Location: LCCOMB_X43_Y29_N0
\dc|Div0|auto_generated|divider|divider|StageOut[258]~299\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[258]~299_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[246]~347_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[246]~347_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[258]~299_combout\);

-- Location: FF_X43_Y29_N29
\dc|mult_x[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT13\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(13));

-- Location: LCCOMB_X43_Y27_N26
\dc|Div0|auto_generated|divider|divider|StageOut[234]~220\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[234]~220_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|mult_x\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|mult_x\(13),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[234]~220_combout\);

-- Location: LCCOMB_X43_Y27_N12
\dc|Div0|auto_generated|divider|divider|StageOut[234]~221\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[234]~221_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[3]~16_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[234]~221_combout\);

-- Location: LCCOMB_X43_Y27_N20
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[234]~220_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[234]~221_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[234]~220_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[234]~221_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14_combout\);

-- Location: LCCOMB_X43_Y29_N26
\dc|Div0|auto_generated|divider|divider|StageOut[246]~222\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[246]~222_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[4]~14_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[246]~222_combout\);

-- Location: LCCOMB_X43_Y29_N4
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[246]~222_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[246]~347_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[246]~222_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[246]~347_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12_combout\);

-- Location: LCCOMB_X43_Y29_N24
\dc|Div0|auto_generated|divider|divider|StageOut[258]~223\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[258]~223_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[258]~223_combout\);

-- Location: LCCOMB_X43_Y29_N6
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[258]~299_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[258]~223_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[258]~299_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[258]~223_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10_combout\);

-- Location: LCCOMB_X42_Y29_N20
\dc|Div0|auto_generated|divider|divider|StageOut[270]~224\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[270]~224_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[270]~224_combout\);

-- Location: LCCOMB_X42_Y29_N2
\dc|Div0|auto_generated|divider|divider|op_17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[270]~224_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_17~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[270]~224_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[270]~224_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_17~1\);

-- Location: LCCOMB_X42_Y29_N4
\dc|Div0|auto_generated|divider|divider|op_17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~2_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[271]~219_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_17~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[271]~219_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_17~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[271]~219_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\ & !\dc|Div0|auto_generated|divider|divider|op_17~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[271]~219_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[271]~298_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_17~1\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_17~3\);

-- Location: LCCOMB_X41_Y28_N10
\dc|Div0|auto_generated|divider|divider|StageOut[261]~293\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[7]~0_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[249]~344_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\);

-- Location: LCCOMB_X42_Y29_N14
\dc|Div0|auto_generated|divider|divider|StageOut[273]~296\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[273]~296_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[8]~2_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[261]~293_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[273]~296_combout\);

-- Location: LCCOMB_X42_Y29_N16
\dc|Div0|auto_generated|divider|divider|StageOut[272]~297\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[7]~0_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[260]~294_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\);

-- Location: LCCOMB_X42_Y29_N8
\dc|Div0|auto_generated|divider|divider|op_17~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[273]~217_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[273]~296_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_17~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[273]~217_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[273]~296_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_17~5\,
	cout => \dc|Div0|auto_generated|divider|divider|op_17~7_cout\);

-- Location: LCCOMB_X42_Y29_N10
\dc|Div0|auto_generated|divider|divider|op_17~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~8_combout\ = \dc|Div0|auto_generated|divider|divider|op_17~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|op_17~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\);

-- Location: LCCOMB_X41_Y29_N28
\dc|Div0|auto_generated|divider|divider|StageOut[284]~301\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[284]~301_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[8]~2_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[272]~297_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[284]~301_combout\);

-- Location: LCCOMB_X40_Y29_N0
\dc|Div0|auto_generated|divider|divider|StageOut[283]~226\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[283]~226_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~2_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[283]~226_combout\);

-- Location: LCCOMB_X40_Y29_N2
\dc|Div0|auto_generated|divider|divider|StageOut[282]~227\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[282]~227_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~0_combout\ & !\dc|Div0|auto_generated|divider|divider|op_17~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~0_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[282]~227_combout\);

-- Location: FF_X42_Y28_N29
\dc|mult_x[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT12\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(12));

-- Location: LCCOMB_X41_Y28_N8
\dc|Div0|auto_generated|divider|divider|StageOut[233]~228\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[233]~228_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|mult_x\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|mult_x\(12),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[233]~228_combout\);

-- Location: LCCOMB_X42_Y28_N14
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18_combout\ = \dc|mult_x\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|mult_x\(12),
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18_combout\);

-- Location: LCCOMB_X42_Y28_N12
\dc|Div0|auto_generated|divider|divider|StageOut[233]~229\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[233]~229_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[233]~229_combout\);

-- Location: LCCOMB_X41_Y28_N30
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[233]~228_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[233]~229_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[233]~228_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[233]~229_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16_combout\);

-- Location: LCCOMB_X41_Y29_N22
\dc|Div0|auto_generated|divider|divider|StageOut[245]~230\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[245]~230_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[245]~230_combout\);

-- Location: LCCOMB_X42_Y28_N26
\dc|Div0|auto_generated|divider|divider|StageOut[245]~348\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[245]~348_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|mult_x\(12)))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[2]~18_combout\,
	datad => \dc|mult_x\(12),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[245]~348_combout\);

-- Location: LCCOMB_X41_Y29_N0
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[245]~230_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[245]~348_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[245]~230_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[245]~348_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14_combout\);

-- Location: LCCOMB_X41_Y29_N8
\dc|Div0|auto_generated|divider|divider|StageOut[257]~231\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[257]~231_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[257]~231_combout\);

-- Location: LCCOMB_X41_Y29_N16
\dc|Div0|auto_generated|divider|divider|StageOut[257]~304\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[257]~304_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[245]~348_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[245]~348_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[3]~16_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[257]~304_combout\);

-- Location: LCCOMB_X41_Y29_N10
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[257]~231_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[257]~304_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[257]~231_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[257]~304_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12_combout\);

-- Location: LCCOMB_X41_Y29_N18
\dc|Div0|auto_generated|divider|divider|StageOut[269]~305\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[269]~305_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[257]~304_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[4]~14_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[257]~304_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[269]~305_combout\);

-- Location: LCCOMB_X41_Y29_N24
\dc|Div0|auto_generated|divider|divider|StageOut[281]~306\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[269]~305_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[5]~12_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[269]~305_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[281]~306_combout\);

-- Location: LCCOMB_X40_Y29_N14
\dc|Div0|auto_generated|divider|divider|op_18~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~2_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[282]~227_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_18~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[282]~227_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_18~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[282]~227_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[282]~227_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_18~1\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_18~3\);

-- Location: LCCOMB_X40_Y29_N18
\dc|Div0|auto_generated|divider|divider|op_18~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[284]~225_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[284]~301_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_18~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[284]~225_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[284]~301_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_18~5\,
	cout => \dc|Div0|auto_generated|divider|divider|op_18~7_cout\);

-- Location: LCCOMB_X40_Y29_N20
\dc|Div0|auto_generated|divider|divider|op_18~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~8_combout\ = \dc|Div0|auto_generated|divider|divider|op_18~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|op_18~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\);

-- Location: LCCOMB_X40_Y29_N10
\dc|Div0|auto_generated|divider|divider|StageOut[295]~307\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[295]~307_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_17~2_combout\ & !\dc|Div0|auto_generated|divider|divider|op_17~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[283]~302_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_17~2_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[295]~307_combout\);

-- Location: LCCOMB_X43_Y29_N30
\dc|Div0|auto_generated|divider|divider|StageOut[270]~300\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[258]~299_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[258]~299_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[5]~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\);

-- Location: LCCOMB_X40_Y29_N26
\dc|Div0|auto_generated|divider|divider|StageOut[282]~303\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[6]~10_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[270]~300_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\);

-- Location: LCCOMB_X40_Y29_N24
\dc|Div0|auto_generated|divider|divider|StageOut[294]~308\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_17~0_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[282]~303_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\);

-- Location: LCCOMB_X40_Y29_N28
\dc|Div0|auto_generated|divider|divider|StageOut[293]~236\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[293]~236_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~0_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~0_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[293]~236_combout\);

-- Location: FF_X42_Y28_N9
\dc|mult_x[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult0|auto_generated|mac_out2~DATAOUT11\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(11));

-- Location: LCCOMB_X42_Y28_N28
\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20_combout\ = \dc|mult_x\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|mult_x\(11),
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20_combout\);

-- Location: LCCOMB_X38_Y29_N26
\dc|Div0|auto_generated|divider|divider|StageOut[244]~349\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[244]~349_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & (\dc|mult_x\(11))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(11),
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[244]~349_combout\);

-- Location: LCCOMB_X42_Y28_N20
\dc|Div0|auto_generated|divider|divider|StageOut[232]~238\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[232]~238_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[1]~20_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[232]~238_combout\);

-- Location: LCCOMB_X42_Y28_N18
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[232]~237_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[232]~238_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[232]~237_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[232]~238_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18_combout\);

-- Location: LCCOMB_X38_Y29_N12
\dc|Div0|auto_generated|divider|divider|StageOut[244]~239\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[244]~239_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[244]~239_combout\);

-- Location: LCCOMB_X38_Y29_N28
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[244]~349_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[244]~239_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[244]~349_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[244]~239_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16_combout\);

-- Location: LCCOMB_X38_Y29_N10
\dc|Div0|auto_generated|divider|divider|StageOut[256]~310\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[256]~310_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[244]~349_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[2]~18_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[244]~349_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[256]~310_combout\);

-- Location: LCCOMB_X38_Y29_N8
\dc|Div0|auto_generated|divider|divider|StageOut[268]~311\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[268]~311_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[256]~310_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[3]~16_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[256]~310_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[268]~311_combout\);

-- Location: LCCOMB_X38_Y29_N20
\dc|Div0|auto_generated|divider|divider|StageOut[268]~241\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[268]~241_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[268]~241_combout\);

-- Location: LCCOMB_X38_Y29_N24
\dc|Div0|auto_generated|divider|divider|op_17~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[268]~311_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[268]~241_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[268]~311_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[268]~241_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~12_combout\);

-- Location: LCCOMB_X38_Y29_N2
\dc|Div0|auto_generated|divider|divider|StageOut[280]~312\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[280]~312_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[268]~311_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[4]~14_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[268]~311_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[280]~312_combout\);

-- Location: LCCOMB_X38_Y29_N4
\dc|Div0|auto_generated|divider|divider|StageOut[292]~313\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[280]~312_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_17~12_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[280]~312_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\);

-- Location: LCCOMB_X39_Y29_N20
\dc|Div0|auto_generated|divider|divider|op_19~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~2_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~1\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[293]~236_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_19~1\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[293]~236_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_19~3\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[293]~236_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[293]~309_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[293]~236_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_19~1\,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~2_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_19~3\);

-- Location: LCCOMB_X39_Y29_N24
\dc|Div0|auto_generated|divider|divider|op_19~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[295]~234_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[295]~307_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_19~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[295]~234_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[295]~307_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_19~5\,
	cout => \dc|Div0|auto_generated|divider|divider|op_19~7_cout\);

-- Location: LCCOMB_X39_Y29_N26
\dc|Div0|auto_generated|divider|divider|op_19~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~8_combout\ = \dc|Div0|auto_generated|divider|divider|op_19~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|op_19~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\);

-- Location: LCCOMB_X39_Y29_N28
\dc|Div0|auto_generated|divider|divider|StageOut[305]~245\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[305]~245_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_19~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~2_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[305]~245_combout\);

-- Location: LCCOMB_X39_Y30_N20
\dc|Div0|auto_generated|divider|divider|StageOut[304]~316\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_18~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~10_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[292]~313_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\);

-- Location: LCCOMB_X43_Y27_N10
\dc|mult_x[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_x[10]~feeder_combout\ = \dc|Mult0|auto_generated|mac_out2~DATAOUT10\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Mult0|auto_generated|mac_out2~DATAOUT10\,
	combout => \dc|mult_x[10]~feeder_combout\);

-- Location: FF_X43_Y27_N11
\dc|mult_x[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_x[10]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(10));

-- Location: LCCOMB_X43_Y27_N4
\dc|Div0|auto_generated|divider|divider|StageOut[231]~248\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[231]~248_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|mult_x\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|mult_x\(10),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[231]~248_combout\);

-- Location: LCCOMB_X43_Y27_N6
\dc|Div0|auto_generated|divider|divider|StageOut[231]~249\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[231]~249_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\ & \dc|mult_x\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_21_result_int[11]~8_combout\,
	datad => \dc|mult_x\(10),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[231]~249_combout\);

-- Location: LCCOMB_X43_Y27_N22
\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[231]~248_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[231]~249_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[231]~248_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[231]~249_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20_combout\);

-- Location: LCCOMB_X39_Y28_N4
\dc|Div0|auto_generated|divider|divider|StageOut[243]~250\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[243]~250_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[243]~250_combout\);

-- Location: LCCOMB_X39_Y28_N20
\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[243]~247_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[243]~250_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[243]~247_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[243]~250_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18_combout\);

-- Location: LCCOMB_X39_Y28_N10
\dc|Div0|auto_generated|divider|divider|StageOut[255]~350\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[255]~350_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & (\dc|mult_x\(10))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_x\(10),
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[1]~20_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[255]~350_combout\);

-- Location: LCCOMB_X39_Y28_N14
\dc|Div0|auto_generated|divider|divider|StageOut[267]~317\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[267]~317_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[255]~350_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[255]~350_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[267]~317_combout\);

-- Location: LCCOMB_X39_Y28_N22
\dc|Div0|auto_generated|divider|divider|StageOut[255]~251\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[255]~251_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[2]~18_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[255]~251_combout\);

-- Location: LCCOMB_X39_Y28_N18
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[255]~251_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[255]~350_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[255]~251_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[255]~350_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16_combout\);

-- Location: LCCOMB_X39_Y28_N24
\dc|Div0|auto_generated|divider|divider|StageOut[267]~252\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[267]~252_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[267]~252_combout\);

-- Location: LCCOMB_X39_Y28_N28
\dc|Div0|auto_generated|divider|divider|op_17~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~14_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[267]~317_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[267]~252_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[267]~317_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[267]~252_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~14_combout\);

-- Location: LCCOMB_X39_Y28_N8
\dc|Div0|auto_generated|divider|divider|StageOut[279]~318\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[279]~318_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[267]~317_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16_combout\ & !\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[3]~16_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[267]~317_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[279]~318_combout\);

-- Location: LCCOMB_X39_Y28_N26
\dc|Div0|auto_generated|divider|divider|StageOut[291]~319\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[291]~319_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[279]~318_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_17~14_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[279]~318_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[291]~319_combout\);

-- Location: LCCOMB_X39_Y28_N0
\dc|Div0|auto_generated|divider|divider|StageOut[303]~320\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[291]~319_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_18~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~12_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[291]~319_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\);

-- Location: LCCOMB_X39_Y29_N2
\dc|Div0|auto_generated|divider|divider|op_20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[303]~255_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_20~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[303]~255_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[303]~255_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[303]~320_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|op_20~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_20~1\);

-- Location: LCCOMB_X39_Y29_N6
\dc|Div0|auto_generated|divider|divider|op_20~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~4_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~3\ & (((\dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[305]~245_combout\)))) 
-- # (!\dc|Div0|auto_generated|divider|divider|op_20~3\ & ((((\dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[305]~245_combout\)))))
-- \dc|Div0|auto_generated|divider|divider|op_20~5\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_20~3\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[305]~245_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[305]~315_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[305]~245_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_20~3\,
	combout => \dc|Div0|auto_generated|divider|divider|op_20~4_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_20~5\);

-- Location: LCCOMB_X39_Y29_N16
\dc|Div0|auto_generated|divider|divider|StageOut[306]~314\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[306]~314_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\) # 
-- ((!\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_18~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_18~2_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[294]~308_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[306]~314_combout\);

-- Location: LCCOMB_X39_Y29_N8
\dc|Div0|auto_generated|divider|divider|op_20~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[306]~244_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[306]~314_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_20~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[306]~244_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[306]~314_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_20~5\,
	cout => \dc|Div0|auto_generated|divider|divider|op_20~7_cout\);

-- Location: LCCOMB_X39_Y29_N10
\dc|Div0|auto_generated|divider|divider|op_20~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~8_combout\ = \dc|Div0|auto_generated|divider|divider|op_20~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|op_20~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\);

-- Location: LCCOMB_X40_Y30_N20
\dc|Div0|auto_generated|divider|divider|StageOut[317]~256\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[317]~256_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~4_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_20~4_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[317]~256_combout\);

-- Location: LCCOMB_X40_Y30_N24
\dc|Div0|auto_generated|divider|divider|StageOut[316]~322\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_19~0_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_19~0_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[304]~316_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[316]~322_combout\);

-- Location: LCCOMB_X40_Y30_N2
\dc|Div0|auto_generated|divider|divider|StageOut[315]~258\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[315]~258_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~0_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_20~0_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[315]~258_combout\);

-- Location: LCCOMB_X40_Y30_N16
\dc|Div0|auto_generated|divider|divider|StageOut[314]~267\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[314]~267_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_20~10_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[314]~267_combout\);

-- Location: LCCOMB_X40_Y30_N4
\dc|Div0|auto_generated|divider|divider|op_21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_21~0_combout\ = (((\dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[314]~267_combout\)))
-- \dc|Div0|auto_generated|divider|divider|op_21~1\ = CARRY((\dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[314]~267_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[314]~327_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[314]~267_combout\,
	datad => VCC,
	combout => \dc|Div0|auto_generated|divider|divider|op_21~0_combout\,
	cout => \dc|Div0|auto_generated|divider|divider|op_21~1\);

-- Location: LCCOMB_X40_Y30_N10
\dc|Div0|auto_generated|divider|divider|op_21~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_21~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[317]~321_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[317]~256_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_21~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[317]~321_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[317]~256_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_21~5\,
	cout => \dc|Div0|auto_generated|divider|divider|op_21~7_cout\);

-- Location: LCCOMB_X40_Y30_N12
\dc|Div0|auto_generated|divider|divider|op_21~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_21~8_combout\ = \dc|Div0|auto_generated|divider|divider|op_21~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|op_21~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\);

-- Location: LCCOMB_X41_Y30_N2
\dc|Div0|auto_generated|divider|divider|StageOut[328]~268\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[328]~268_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~4_combout\ & !\dc|Div0|auto_generated|divider|divider|op_21~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_21~4_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[328]~268_combout\);

-- Location: LCCOMB_X40_Y30_N18
\dc|Div0|auto_generated|divider|divider|StageOut[327]~269\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[327]~269_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~2_combout\ & !\dc|Div0|auto_generated|divider|divider|op_21~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_21~2_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[327]~269_combout\);

-- Location: LCCOMB_X40_Y30_N28
\dc|Div0|auto_generated|divider|divider|StageOut[326]~270\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[326]~270_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~0_combout\ & !\dc|Div0|auto_generated|divider|divider|op_21~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_21~0_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[326]~270_combout\);

-- Location: LCCOMB_X38_Y30_N16
\dc|mult_x[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_x[8]~feeder_combout\ = \dc|Mult0|auto_generated|mac_out2~DATAOUT8\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|Mult0|auto_generated|mac_out2~DATAOUT8\,
	combout => \dc|mult_x[8]~feeder_combout\);

-- Location: FF_X38_Y30_N17
\dc|mult_x[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_x[8]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_x\(8));

-- Location: LCCOMB_X40_Y28_N22
\dc|Div0|auto_generated|divider|divider|StageOut[277]~352\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[277]~352_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|mult_x\(8)))) # 
-- (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20_combout\,
	datab => \dc|mult_x\(8),
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[277]~352_combout\);

-- Location: LCCOMB_X38_Y30_N26
\dc|Div0|auto_generated|divider|divider|StageOut[253]~272\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[253]~272_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|mult_x\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|mult_x\(8),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[253]~272_combout\);

-- Location: LCCOMB_X38_Y30_N28
\dc|Div0|auto_generated|divider|divider|StageOut[253]~273\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[253]~273_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & \dc|mult_x\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => \dc|mult_x\(8),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[253]~273_combout\);

-- Location: LCCOMB_X38_Y30_N6
\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[253]~272_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[253]~273_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[253]~272_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[253]~273_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20_combout\);

-- Location: LCCOMB_X40_Y28_N18
\dc|Div0|auto_generated|divider|divider|StageOut[265]~274\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[265]~274_combout\ = (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[1]~20_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[265]~274_combout\);

-- Location: LCCOMB_X38_Y28_N28
\dc|Div0|auto_generated|divider|divider|StageOut[265]~271\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[265]~271_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & \dc|mult_x\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => \dc|mult_x\(8),
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[265]~271_combout\);

-- Location: LCCOMB_X40_Y28_N6
\dc|Div0|auto_generated|divider|divider|op_17~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_17~18_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[265]~274_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[265]~271_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[265]~274_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[265]~271_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_17~18_combout\);

-- Location: LCCOMB_X40_Y28_N16
\dc|Div0|auto_generated|divider|divider|StageOut[277]~275\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[277]~275_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_17~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_17~18_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[277]~275_combout\);

-- Location: LCCOMB_X40_Y28_N4
\dc|Div0|auto_generated|divider|divider|op_18~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_18~16_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[277]~352_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[277]~275_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[277]~352_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[277]~275_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_18~16_combout\);

-- Location: LCCOMB_X40_Y28_N14
\dc|Div0|auto_generated|divider|divider|StageOut[289]~276\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[289]~276_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~16_combout\ & !\dc|Div0|auto_generated|divider|divider|op_18~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_18~16_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[289]~276_combout\);

-- Location: LCCOMB_X40_Y28_N20
\dc|Div0|auto_generated|divider|divider|StageOut[289]~331\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[289]~331_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[277]~352_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_17~18_combout\ & !\dc|Div0|auto_generated|divider|divider|op_17~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_17~18_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[277]~352_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[289]~331_combout\);

-- Location: LCCOMB_X40_Y28_N2
\dc|Div0|auto_generated|divider|divider|op_19~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_19~14_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[289]~276_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[289]~331_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[289]~276_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[289]~331_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_19~14_combout\);

-- Location: LCCOMB_X40_Y28_N28
\dc|Div0|auto_generated|divider|divider|StageOut[301]~277\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[301]~277_combout\ = (!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & \dc|Div0|auto_generated|divider|divider|op_19~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_19~14_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[301]~277_combout\);

-- Location: LCCOMB_X40_Y28_N24
\dc|Div0|auto_generated|divider|divider|op_20~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_20~12_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[301]~332_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[301]~277_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[301]~332_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[301]~277_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_20~12_combout\);

-- Location: LCCOMB_X40_Y28_N26
\dc|Div0|auto_generated|divider|divider|StageOut[313]~278\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[313]~278_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~12_combout\ & !\dc|Div0|auto_generated|divider|divider|op_20~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_20~12_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[313]~278_combout\);

-- Location: LCCOMB_X40_Y28_N8
\dc|Div0|auto_generated|divider|divider|StageOut[313]~333\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[313]~333_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & ((\dc|Div0|auto_generated|divider|divider|StageOut[301]~332_combout\) # 
-- ((\dc|Div0|auto_generated|divider|divider|op_19~14_combout\ & !\dc|Div0|auto_generated|divider|divider|op_19~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[301]~332_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|op_19~14_combout\,
	datac => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[313]~333_combout\);

-- Location: LCCOMB_X41_Y30_N4
\dc|Div0|auto_generated|divider|divider|op_21~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_21~10_combout\ = (\dc|Div0|auto_generated|divider|divider|StageOut[313]~278_combout\) # (\dc|Div0|auto_generated|divider|divider|StageOut[313]~333_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|StageOut[313]~278_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|StageOut[313]~333_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_21~10_combout\);

-- Location: LCCOMB_X41_Y30_N24
\dc|Div0|auto_generated|divider|divider|StageOut[325]~279\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|StageOut[325]~279_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~10_combout\ & !\dc|Div0|auto_generated|divider|divider|op_21~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div0|auto_generated|divider|divider|op_21~10_combout\,
	datad => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	combout => \dc|Div0|auto_generated|divider|divider|StageOut[325]~279_combout\);

-- Location: LCCOMB_X41_Y30_N18
\dc|Div0|auto_generated|divider|divider|op_23~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_23~7_cout\ = CARRY((!\dc|Div0|auto_generated|divider|divider|StageOut[328]~328_combout\ & (!\dc|Div0|auto_generated|divider|divider|StageOut[328]~268_combout\ & 
-- !\dc|Div0|auto_generated|divider|divider|op_23~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|StageOut[328]~328_combout\,
	datab => \dc|Div0|auto_generated|divider|divider|StageOut[328]~268_combout\,
	datad => VCC,
	cin => \dc|Div0|auto_generated|divider|divider|op_23~5\,
	cout => \dc|Div0|auto_generated|divider|divider|op_23~7_cout\);

-- Location: LCCOMB_X41_Y30_N20
\dc|Div0|auto_generated|divider|divider|op_23~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div0|auto_generated|divider|divider|op_23~8_combout\ = \dc|Div0|auto_generated|divider|divider|op_23~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div0|auto_generated|divider|divider|op_23~7_cout\,
	combout => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\);

-- Location: LCCOMB_X42_Y30_N14
\dc|int_x[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[1]~12_combout\ = (\dc|dis_h_hold\(5) & ((\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & (!\dc|int_x[0]~11\)) # (!\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & (\dc|int_x[0]~11\ & VCC)))) # (!\dc|dis_h_hold\(5) & 
-- ((\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & ((\dc|int_x[0]~11\) # (GND))) # (!\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & (!\dc|int_x[0]~11\))))
-- \dc|int_x[1]~13\ = CARRY((\dc|dis_h_hold\(5) & (\dc|Div0|auto_generated|divider|divider|op_23~8_combout\ & !\dc|int_x[0]~11\)) # (!\dc|dis_h_hold\(5) & ((\dc|Div0|auto_generated|divider|divider|op_23~8_combout\) # (!\dc|int_x[0]~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|dis_h_hold\(5),
	datab => \dc|Div0|auto_generated|divider|divider|op_23~8_combout\,
	datad => VCC,
	cin => \dc|int_x[0]~11\,
	combout => \dc|int_x[1]~12_combout\,
	cout => \dc|int_x[1]~13\);

-- Location: FF_X42_Y30_N15
\dc|int_x[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[1]~12_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(1));

-- Location: LCCOMB_X38_Y30_N2
\vc|SRAM_ADDR[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[1]~5_combout\ = (\dc|vram_re~combout\ & (\vc|SRAM_ADDR[1]~4_combout\ & (!\vc|counter\(1)))) # (!\dc|vram_re~combout\ & (((\dc|int_x\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|vram_re~combout\,
	datab => \vc|SRAM_ADDR[1]~4_combout\,
	datac => \vc|counter\(1),
	datad => \dc|int_x\(1),
	combout => \vc|SRAM_ADDR[1]~5_combout\);

-- Location: LCCOMB_X42_Y30_N16
\dc|int_x[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[2]~14_combout\ = (\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & (!\dc|int_x[1]~13\ & VCC)) # (!\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & (\dc|int_x[1]~13\ $ (GND)))
-- \dc|int_x[2]~15\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_21~8_combout\ & !\dc|int_x[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_21~8_combout\,
	datad => VCC,
	cin => \dc|int_x[1]~13\,
	combout => \dc|int_x[2]~14_combout\,
	cout => \dc|int_x[2]~15\);

-- Location: FF_X42_Y30_N17
\dc|int_x[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[2]~14_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(2));

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LCCOMB_X35_Y30_N0
\vc|SRAM_ADDR[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[2]~6_combout\ = (\always1~2_combout\ & (w_x(2))) # (!\always1~2_combout\ & (((!\KEY[2]~input_o\ & \SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => w_x(2),
	datac => \KEY[2]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \vc|SRAM_ADDR[2]~6_combout\);

-- Location: LCCOMB_X35_Y30_N6
\vc|SRAM_ADDR[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[2]~7_combout\ = (\dc|vram_re~combout\ & (!\vc|counter\(1) & ((\vc|SRAM_ADDR[2]~6_combout\)))) # (!\dc|vram_re~combout\ & (((\dc|int_x\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|counter\(1),
	datab => \dc|int_x\(2),
	datac => \dc|vram_re~combout\,
	datad => \vc|SRAM_ADDR[2]~6_combout\,
	combout => \vc|SRAM_ADDR[2]~7_combout\);

-- Location: LCCOMB_X42_Y30_N18
\dc|int_x[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[3]~16_combout\ = (\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & ((\dc|int_x[2]~15\) # (GND))) # (!\dc|Div0|auto_generated|divider|divider|op_20~8_combout\ & (!\dc|int_x[2]~15\))
-- \dc|int_x[3]~17\ = CARRY((\dc|Div0|auto_generated|divider|divider|op_20~8_combout\) # (!\dc|int_x[2]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_20~8_combout\,
	datad => VCC,
	cin => \dc|int_x[2]~15\,
	combout => \dc|int_x[3]~16_combout\,
	cout => \dc|int_x[3]~17\);

-- Location: FF_X42_Y30_N19
\dc|int_x[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[3]~16_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(3));

-- Location: LCCOMB_X34_Y30_N6
\Add2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~17_combout\ = (\w_x[5]~0_combout\ & \Add2~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \w_x[5]~0_combout\,
	datad => \Add2~6_combout\,
	combout => \Add2~17_combout\);

-- Location: FF_X34_Y30_N7
\w_x[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add2~17_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_x[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_x(3));

-- Location: LCCOMB_X34_Y28_N8
\vc|SRAM_ADDR[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[3]~8_combout\ = (\always1~2_combout\ & (((w_x(3))))) # (!\always1~2_combout\ & (\SW[3]~input_o\ & ((!\KEY[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => w_x(3),
	datac => \KEY[2]~input_o\,
	datad => \always1~2_combout\,
	combout => \vc|SRAM_ADDR[3]~8_combout\);

-- Location: LCCOMB_X34_Y28_N10
\vc|SRAM_ADDR[3]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[3]~9_combout\ = (\dc|vram_re~combout\ & (((\vc|SRAM_ADDR[3]~8_combout\ & !\vc|counter\(1))))) # (!\dc|vram_re~combout\ & (\dc|int_x\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|int_x\(3),
	datab => \vc|SRAM_ADDR[3]~8_combout\,
	datac => \dc|vram_re~combout\,
	datad => \vc|counter\(1),
	combout => \vc|SRAM_ADDR[3]~9_combout\);

-- Location: LCCOMB_X42_Y30_N20
\dc|int_x[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[4]~18_combout\ = (\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & (!\dc|int_x[3]~17\ & VCC)) # (!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & (\dc|int_x[3]~17\ $ (GND)))
-- \dc|int_x[4]~19\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_19~8_combout\ & !\dc|int_x[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_19~8_combout\,
	datad => VCC,
	cin => \dc|int_x[3]~17\,
	combout => \dc|int_x[4]~18_combout\,
	cout => \dc|int_x[4]~19\);

-- Location: FF_X42_Y30_N21
\dc|int_x[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[4]~18_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(4));

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LCCOMB_X34_Y28_N16
\vc|SRAM_ADDR[4]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[4]~10_combout\ = (\always1~2_combout\ & (((w_x(4))))) # (!\always1~2_combout\ & (\SW[4]~input_o\ & (!\KEY[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[4]~input_o\,
	datac => \KEY[2]~input_o\,
	datad => w_x(4),
	combout => \vc|SRAM_ADDR[4]~10_combout\);

-- Location: LCCOMB_X34_Y28_N14
\vc|SRAM_ADDR[4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[4]~11_combout\ = (\dc|vram_re~combout\ & (((!\vc|counter\(1) & \vc|SRAM_ADDR[4]~10_combout\)))) # (!\dc|vram_re~combout\ & (\dc|int_x\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|int_x\(4),
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|SRAM_ADDR[4]~10_combout\,
	combout => \vc|SRAM_ADDR[4]~11_combout\);

-- Location: LCCOMB_X42_Y30_N22
\dc|int_x[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[5]~20_combout\ = (\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & ((\dc|int_x[4]~19\) # (GND))) # (!\dc|Div0|auto_generated|divider|divider|op_18~8_combout\ & (!\dc|int_x[4]~19\))
-- \dc|int_x[5]~21\ = CARRY((\dc|Div0|auto_generated|divider|divider|op_18~8_combout\) # (!\dc|int_x[4]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|op_18~8_combout\,
	datad => VCC,
	cin => \dc|int_x[4]~19\,
	combout => \dc|int_x[5]~20_combout\,
	cout => \dc|int_x[5]~21\);

-- Location: FF_X42_Y30_N23
\dc|int_x[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[5]~20_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(5));

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: LCCOMB_X34_Y28_N20
\vc|SRAM_ADDR[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[5]~12_combout\ = (\always1~2_combout\ & (w_x(5))) # (!\always1~2_combout\ & (((\SW[5]~input_o\ & !\KEY[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_x(5),
	datab => \SW[5]~input_o\,
	datac => \KEY[2]~input_o\,
	datad => \always1~2_combout\,
	combout => \vc|SRAM_ADDR[5]~12_combout\);

-- Location: LCCOMB_X34_Y28_N26
\vc|SRAM_ADDR[5]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[5]~13_combout\ = (\dc|vram_re~combout\ & (((!\vc|counter\(1) & \vc|SRAM_ADDR[5]~12_combout\)))) # (!\dc|vram_re~combout\ & (\dc|int_x\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|int_x\(5),
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|SRAM_ADDR[5]~12_combout\,
	combout => \vc|SRAM_ADDR[5]~13_combout\);

-- Location: LCCOMB_X42_Y30_N24
\dc|int_x[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[6]~22_combout\ = (\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & (!\dc|int_x[5]~21\ & VCC)) # (!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & (\dc|int_x[5]~21\ $ (GND)))
-- \dc|int_x[6]~23\ = CARRY((!\dc|Div0|auto_generated|divider|divider|op_17~8_combout\ & !\dc|int_x[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|op_17~8_combout\,
	datad => VCC,
	cin => \dc|int_x[5]~21\,
	combout => \dc|int_x[6]~22_combout\,
	cout => \dc|int_x[6]~23\);

-- Location: FF_X42_Y30_N25
\dc|int_x[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[6]~22_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(6));

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: LCCOMB_X34_Y25_N22
\vc|SRAM_ADDR[6]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[6]~14_combout\ = (\always1~2_combout\ & (((w_x(6))))) # (!\always1~2_combout\ & (\SW[6]~input_o\ & (!\KEY[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[6]~input_o\,
	datac => \KEY[2]~input_o\,
	datad => w_x(6),
	combout => \vc|SRAM_ADDR[6]~14_combout\);

-- Location: LCCOMB_X34_Y25_N20
\vc|SRAM_ADDR[6]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[6]~15_combout\ = (\dc|vram_re~combout\ & (((\vc|SRAM_ADDR[6]~14_combout\ & !\vc|counter\(1))))) # (!\dc|vram_re~combout\ & (\dc|int_x\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|int_x\(6),
	datab => \dc|vram_re~combout\,
	datac => \vc|SRAM_ADDR[6]~14_combout\,
	datad => \vc|counter\(1),
	combout => \vc|SRAM_ADDR[6]~15_combout\);

-- Location: LCCOMB_X42_Y30_N26
\dc|int_x[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[7]~24_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & ((\dc|int_x[6]~23\) # (GND))) # (!\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\ & (!\dc|int_x[6]~23\))
-- \dc|int_x[7]~25\ = CARRY((\dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\) # (!\dc|int_x[6]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div0|auto_generated|divider|divider|add_sub_24_result_int[11]~8_combout\,
	datad => VCC,
	cin => \dc|int_x[6]~23\,
	combout => \dc|int_x[7]~24_combout\,
	cout => \dc|int_x[7]~25\);

-- Location: FF_X42_Y30_N27
\dc|int_x[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[7]~24_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(7));

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: LCCOMB_X38_Y30_N12
\vc|SRAM_ADDR[7]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[7]~16_combout\ = (\always1~2_combout\ & (((w_x(7))))) # (!\always1~2_combout\ & (\SW[7]~input_o\ & (!\KEY[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[7]~input_o\,
	datac => \KEY[2]~input_o\,
	datad => w_x(7),
	combout => \vc|SRAM_ADDR[7]~16_combout\);

-- Location: LCCOMB_X38_Y30_N30
\vc|SRAM_ADDR[7]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[7]~17_combout\ = (\dc|vram_re~combout\ & (((!\vc|counter\(1) & \vc|SRAM_ADDR[7]~16_combout\)))) # (!\dc|vram_re~combout\ & (\dc|int_x\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|vram_re~combout\,
	datab => \dc|int_x\(7),
	datac => \vc|counter\(1),
	datad => \vc|SRAM_ADDR[7]~16_combout\,
	combout => \vc|SRAM_ADDR[7]~17_combout\);

-- Location: LCCOMB_X42_Y30_N28
\dc|int_x[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[8]~26_combout\ = (\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & (!\dc|int_x[7]~25\ & VCC)) # (!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & (\dc|int_x[7]~25\ $ (GND)))
-- \dc|int_x[8]~27\ = CARRY((!\dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\ & !\dc|int_x[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div0|auto_generated|divider|divider|add_sub_23_result_int[11]~8_combout\,
	datad => VCC,
	cin => \dc|int_x[7]~25\,
	combout => \dc|int_x[8]~26_combout\,
	cout => \dc|int_x[8]~27\);

-- Location: FF_X42_Y30_N29
\dc|int_x[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[8]~26_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(8));

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: LCCOMB_X34_Y25_N6
\vc|SRAM_ADDR[8]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[8]~18_combout\ = (\always1~2_combout\ & (((w_x(8))))) # (!\always1~2_combout\ & (!\KEY[2]~input_o\ & (\SW[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \always1~2_combout\,
	datad => w_x(8),
	combout => \vc|SRAM_ADDR[8]~18_combout\);

-- Location: LCCOMB_X34_Y25_N28
\vc|SRAM_ADDR[8]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[8]~19_combout\ = (\dc|vram_re~combout\ & (((!\vc|counter\(1) & \vc|SRAM_ADDR[8]~18_combout\)))) # (!\dc|vram_re~combout\ & (\dc|int_x\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|int_x\(8),
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|SRAM_ADDR[8]~18_combout\,
	combout => \vc|SRAM_ADDR[8]~19_combout\);

-- Location: LCCOMB_X42_Y30_N30
\dc|int_x[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_x[9]~28_combout\ = \dc|int_x[8]~27\ $ (!\dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \dc|Div0|auto_generated|divider|divider|add_sub_22_result_int[11]~8_combout\,
	cin => \dc|int_x[8]~27\,
	combout => \dc|int_x[9]~28_combout\);

-- Location: FF_X42_Y30_N31
\dc|int_x[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_x[9]~28_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_x\(9));

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: LCCOMB_X38_Y30_N24
\vc|SRAM_ADDR[9]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[9]~20_combout\ = (\always1~2_combout\ & (((w_x(9))))) # (!\always1~2_combout\ & (\SW[9]~input_o\ & (!\KEY[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[9]~input_o\,
	datac => \KEY[2]~input_o\,
	datad => w_x(9),
	combout => \vc|SRAM_ADDR[9]~20_combout\);

-- Location: LCCOMB_X38_Y30_N18
\vc|SRAM_ADDR[9]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[9]~21_combout\ = (\dc|vram_re~combout\ & (((!\vc|counter\(1) & \vc|SRAM_ADDR[9]~20_combout\)))) # (!\dc|vram_re~combout\ & (\dc|int_x\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|vram_re~combout\,
	datab => \dc|int_x\(9),
	datac => \vc|counter\(1),
	datad => \vc|SRAM_ADDR[9]~20_combout\,
	combout => \vc|SRAM_ADDR[9]~21_combout\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: LCCOMB_X35_Y26_N8
\Add1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~21_combout\ = (\always1~2_combout\ & !w_y(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datac => w_y(0),
	combout => \Add1~21_combout\);

-- Location: FF_X35_Y26_N9
\w_y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add1~21_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_y[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(0));

-- Location: LCCOMB_X35_Y26_N0
\vc|SRAM_ADDR[10]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[10]~22_combout\ = (\always1~2_combout\ & (((!w_y(0))))) # (!\always1~2_combout\ & (\SW[10]~input_o\ & ((!\KEY[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[10]~input_o\,
	datac => w_y(0),
	datad => \KEY[2]~input_o\,
	combout => \vc|SRAM_ADDR[10]~22_combout\);

-- Location: LCCOMB_X39_Y33_N14
\dc|int_y[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[0]~9_combout\ = (\dc|Div1|auto_generated|divider|divider|op_24~10_combout\ & (\dc|dis_h_hold\(5) & VCC)) # (!\dc|Div1|auto_generated|divider|divider|op_24~10_combout\ & (\dc|dis_h_hold\(5) $ (VCC)))
-- \dc|int_y[0]~10\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_24~10_combout\ & \dc|dis_h_hold\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_24~10_combout\,
	datab => \dc|dis_h_hold\(5),
	datad => VCC,
	combout => \dc|int_y[0]~9_combout\,
	cout => \dc|int_y[0]~10\);

-- Location: FF_X39_Y33_N15
\dc|int_y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[0]~9_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(0));

-- Location: LCCOMB_X35_Y26_N6
\vc|SRAM_ADDR[10]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[10]~23_combout\ = (\dc|vram_re~combout\ & (!\vc|counter\(1) & (\vc|SRAM_ADDR[10]~22_combout\))) # (!\dc|vram_re~combout\ & (((\dc|int_y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|counter\(1),
	datab => \vc|SRAM_ADDR[10]~22_combout\,
	datac => \dc|int_y\(0),
	datad => \dc|vram_re~combout\,
	combout => \vc|SRAM_ADDR[10]~23_combout\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: LCCOMB_X35_Y26_N26
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (\always1~2_combout\ & !\Add1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \always1~2_combout\,
	datad => \Add1~2_combout\,
	combout => \Add1~20_combout\);

-- Location: FF_X35_Y26_N27
\w_y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \Add1~20_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \w_y[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(1));

-- Location: LCCOMB_X35_Y26_N4
\vc|SRAM_ADDR[11]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[11]~24_combout\ = (\always1~2_combout\ & (((!w_y(1))))) # (!\always1~2_combout\ & (\SW[11]~input_o\ & ((!\KEY[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \SW[11]~input_o\,
	datac => w_y(1),
	datad => \KEY[2]~input_o\,
	combout => \vc|SRAM_ADDR[11]~24_combout\);

-- Location: LCCOMB_X43_Y36_N4
\dc|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~2_combout\ = (\dc|v|row_counter|Q\(1) & (\dc|Add1~1\ & VCC)) # (!\dc|v|row_counter|Q\(1) & (!\dc|Add1~1\))
-- \dc|Add1~3\ = CARRY((!\dc|v|row_counter|Q\(1) & !\dc|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(1),
	datad => VCC,
	cin => \dc|Add1~1\,
	combout => \dc|Add1~2_combout\,
	cout => \dc|Add1~3\);

-- Location: LCCOMB_X43_Y36_N6
\dc|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~4_combout\ = (\dc|v|row_counter|Q\(2) & ((GND) # (!\dc|Add1~3\))) # (!\dc|v|row_counter|Q\(2) & (\dc|Add1~3\ $ (GND)))
-- \dc|Add1~5\ = CARRY((\dc|v|row_counter|Q\(2)) # (!\dc|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(2),
	datad => VCC,
	cin => \dc|Add1~3\,
	combout => \dc|Add1~4_combout\,
	cout => \dc|Add1~5\);

-- Location: LCCOMB_X42_Y36_N26
\dc|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Equal2~1_combout\ = (!\dc|v|row_counter|Q\(2) & (!\dc|v|row_counter|Q\(1) & (\dc|v|row_counter|Q\(3) & \dc|v|row_counter|Q\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(2),
	datab => \dc|v|row_counter|Q\(1),
	datac => \dc|v|row_counter|Q\(3),
	datad => \dc|v|row_counter|Q\(9),
	combout => \dc|Equal2~1_combout\);

-- Location: LCCOMB_X42_Y36_N28
\dc|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Equal2~2_combout\ = (!\dc|v|row_counter|Q\(0) & (!\dc|v|row_counter|Q\(4) & (\dc|Equal2~1_combout\ & \dc|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(0),
	datab => \dc|v|row_counter|Q\(4),
	datac => \dc|Equal2~1_combout\,
	datad => \dc|Equal2~0_combout\,
	combout => \dc|Equal2~2_combout\);

-- Location: LCCOMB_X43_Y36_N8
\dc|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~6_combout\ = (\dc|v|row_counter|Q\(3) & ((\dc|Equal2~2_combout\ & (!\dc|Add1~5\)) # (!\dc|Equal2~2_combout\ & (\dc|Add1~5\ & VCC)))) # (!\dc|v|row_counter|Q\(3) & (((!\dc|Add1~5\))))
-- \dc|Add1~7\ = CARRY((!\dc|Add1~5\ & ((\dc|Equal2~2_combout\) # (!\dc|v|row_counter|Q\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(3),
	datab => \dc|Equal2~2_combout\,
	datad => VCC,
	cin => \dc|Add1~5\,
	combout => \dc|Add1~6_combout\,
	cout => \dc|Add1~7\);

-- Location: LCCOMB_X43_Y36_N10
\dc|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~8_combout\ = (\dc|v|row_counter|Q\(4) & ((GND) # (!\dc|Add1~7\))) # (!\dc|v|row_counter|Q\(4) & (\dc|Add1~7\ $ (GND)))
-- \dc|Add1~9\ = CARRY((\dc|v|row_counter|Q\(4)) # (!\dc|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(4),
	datad => VCC,
	cin => \dc|Add1~7\,
	combout => \dc|Add1~8_combout\,
	cout => \dc|Add1~9\);

-- Location: LCCOMB_X43_Y36_N12
\dc|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~10_combout\ = (\dc|v|row_counter|Q\(5) & (\dc|Add1~9\ & VCC)) # (!\dc|v|row_counter|Q\(5) & (!\dc|Add1~9\))
-- \dc|Add1~11\ = CARRY((!\dc|v|row_counter|Q\(5) & !\dc|Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(5),
	datad => VCC,
	cin => \dc|Add1~9\,
	combout => \dc|Add1~10_combout\,
	cout => \dc|Add1~11\);

-- Location: LCCOMB_X43_Y36_N14
\dc|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~12_combout\ = (\dc|v|row_counter|Q\(6) & ((GND) # (!\dc|Add1~11\))) # (!\dc|v|row_counter|Q\(6) & (\dc|Add1~11\ $ (GND)))
-- \dc|Add1~13\ = CARRY((\dc|v|row_counter|Q\(6)) # (!\dc|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(6),
	datad => VCC,
	cin => \dc|Add1~11\,
	combout => \dc|Add1~12_combout\,
	cout => \dc|Add1~13\);

-- Location: LCCOMB_X42_Y36_N30
\dc|v|row_counter|Q[7]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|v|row_counter|Q[7]~6_combout\ = (\dc|v|row_counter|Q[3]~1_combout\ & (\dc|v|row_counter|Add0~14_combout\ & ((\dc|v|LessThan0~0_combout\)))) # (!\dc|v|row_counter|Q[3]~1_combout\ & (((\dc|v|row_counter|Q\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q[3]~1_combout\,
	datab => \dc|v|row_counter|Add0~14_combout\,
	datac => \dc|v|row_counter|Q\(7),
	datad => \dc|v|LessThan0~0_combout\,
	combout => \dc|v|row_counter|Q[7]~6_combout\);

-- Location: FF_X42_Y36_N31
\dc|v|row_counter|Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|v|row_counter|Q[7]~6_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|v|row_counter|Q\(7));

-- Location: LCCOMB_X43_Y36_N16
\dc|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~14_combout\ = (\dc|v|row_counter|Q\(7) & (\dc|Add1~13\ & VCC)) # (!\dc|v|row_counter|Q\(7) & (!\dc|Add1~13\))
-- \dc|Add1~15\ = CARRY((!\dc|v|row_counter|Q\(7) & !\dc|Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|v|row_counter|Q\(7),
	datad => VCC,
	cin => \dc|Add1~13\,
	combout => \dc|Add1~14_combout\,
	cout => \dc|Add1~15\);

-- Location: LCCOMB_X43_Y36_N18
\dc|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~16_combout\ = (\dc|v|row_counter|Q\(8) & ((GND) # (!\dc|Add1~15\))) # (!\dc|v|row_counter|Q\(8) & (\dc|Add1~15\ $ (GND)))
-- \dc|Add1~17\ = CARRY((\dc|v|row_counter|Q\(8)) # (!\dc|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|v|row_counter|Q\(8),
	datad => VCC,
	cin => \dc|Add1~15\,
	combout => \dc|Add1~16_combout\,
	cout => \dc|Add1~17\);

-- Location: LCCOMB_X43_Y36_N20
\dc|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Add1~18_combout\ = \dc|Add1~17\ $ (((\dc|Equal2~2_combout\) # (!\dc|v|row_counter|Q\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|Equal2~2_combout\,
	datad => \dc|v|row_counter|Q\(9),
	cin => \dc|Add1~17\,
	combout => \dc|Add1~18_combout\);

-- Location: DSPMULT_X44_Y36_N0
\dc|Mult1|auto_generated|mac_mult1\ : cycloneive_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "none",
	dataa_width => 18,
	datab_clock => "none",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => GND,
	signb => GND,
	dataa => \dc|Mult1|auto_generated|mac_mult1_DATAA_bus\,
	datab => \dc|Mult1|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \dc|Mult1|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: FF_X41_Y35_N27
\dc|mult_y[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT18\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(18));

-- Location: FF_X41_Y35_N9
\dc|mult_y[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT17\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(17));

-- Location: LCCOMB_X41_Y35_N14
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0_combout\ = \dc|mult_y\(15) $ (VCC)
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~1\ = CARRY(\dc|mult_y\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(15),
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~1\);

-- Location: LCCOMB_X41_Y35_N18
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4_combout\ = (\dc|mult_y\(17) & (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~3\ $ (GND))) # (!\dc|mult_y\(17) & 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~3\ & VCC))
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~5\ = CARRY((\dc|mult_y\(17) & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(17),
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[6]~3\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~5\);

-- Location: LCCOMB_X41_Y35_N22
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[9]~9_cout\ = CARRY(!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[8]~7\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[9]~9_cout\);

-- Location: LCCOMB_X41_Y35_N24
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ = !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[9]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[9]~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\);

-- Location: LCCOMB_X41_Y35_N0
\dc|Div1|auto_generated|divider|divider|StageOut[218]~208\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[218]~208_combout\ = (\dc|mult_y\(18) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(18),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[218]~208_combout\);

-- Location: LCCOMB_X41_Y35_N10
\dc|Div1|auto_generated|divider|divider|StageOut[217]~211\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[217]~211_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[7]~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[217]~211_combout\);

-- Location: LCCOMB_X41_Y35_N30
\dc|mult_y[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_y[16]~feeder_combout\ = \dc|Mult1|auto_generated|mac_out2~DATAOUT16\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|Mult1|auto_generated|mac_out2~DATAOUT16\,
	combout => \dc|mult_y[16]~feeder_combout\);

-- Location: FF_X41_Y35_N31
\dc|mult_y[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_y[16]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(16));

-- Location: LCCOMB_X41_Y35_N28
\dc|Div1|auto_generated|divider|divider|StageOut[216]~212\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[216]~212_combout\ = (\dc|mult_y\(16) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(16),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[216]~212_combout\);

-- Location: LCCOMB_X40_Y35_N24
\dc|Div1|auto_generated|divider|divider|StageOut[215]~215\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[215]~215_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[215]~215_combout\);

-- Location: FF_X40_Y35_N5
\dc|mult_y[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT14\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(14));

-- Location: LCCOMB_X40_Y35_N28
\dc|Div1|auto_generated|divider|divider|StageOut[214]~217\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[214]~217_combout\ = (\dc|mult_y\(14) & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(14),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[214]~217_combout\);

-- Location: LCCOMB_X40_Y35_N8
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[214]~216_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[214]~217_combout\)))
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[214]~216_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[214]~217_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[214]~216_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[214]~217_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~1\);

-- Location: LCCOMB_X40_Y35_N12
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[216]~213_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[216]~212_combout\)))) # (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[216]~213_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[216]~212_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[216]~213_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[216]~212_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[216]~213_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[216]~212_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[6]~3\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\);

-- Location: LCCOMB_X40_Y35_N14
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[217]~210_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[217]~210_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[217]~211_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[217]~211_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[217]~210_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[217]~211_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[217]~210_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[217]~211_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~5\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~7\);

-- Location: LCCOMB_X40_Y35_N16
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[9]~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[218]~209_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[218]~208_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[218]~209_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[218]~208_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~7\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[9]~9_cout\);

-- Location: LCCOMB_X40_Y35_N18
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ = !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[9]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[9]~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\);

-- Location: LCCOMB_X39_Y35_N16
\dc|Div1|auto_generated|divider|divider|StageOut[228]~218\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[228]~218_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~6_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[8]~6_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[228]~218_combout\);

-- Location: LCCOMB_X39_Y35_N18
\dc|Div1|auto_generated|divider|divider|StageOut[227]~219\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[227]~219_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[227]~219_combout\);

-- Location: LCCOMB_X40_Y35_N0
\dc|Div1|auto_generated|divider|divider|StageOut[226]~345\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & (\dc|mult_y\(15))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(15),
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[5]~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\);

-- Location: LCCOMB_X39_Y35_N20
\dc|Div1|auto_generated|divider|divider|StageOut[225]~221\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[225]~221_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[225]~221_combout\);

-- Location: FF_X40_Y35_N29
\dc|mult_y[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT13\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(13));

-- Location: LCCOMB_X40_Y35_N4
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12_combout\ = \dc|mult_y\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|mult_y\(13),
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12_combout\);

-- Location: LCCOMB_X40_Y35_N22
\dc|Div1|auto_generated|divider|divider|StageOut[224]~347\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & (\dc|mult_y\(13))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(13),
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\);

-- Location: LCCOMB_X39_Y35_N0
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\)))
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\);

-- Location: LCCOMB_X39_Y35_N2
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[225]~346_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[225]~346_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[225]~221_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[225]~221_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[225]~346_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[225]~221_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[225]~346_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[225]~221_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~1\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~3\);

-- Location: LCCOMB_X39_Y35_N4
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[226]~220_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\)))) # (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[226]~220_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[226]~220_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[226]~220_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[226]~345_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~3\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~5\);

-- Location: LCCOMB_X39_Y35_N8
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[9]~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[228]~343_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[228]~218_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[228]~343_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[228]~218_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[8]~7\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[9]~9_cout\);

-- Location: LCCOMB_X39_Y35_N10
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ = !\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[9]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[9]~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\);

-- Location: LCCOMB_X39_Y35_N28
\dc|Div1|auto_generated|divider|divider|StageOut[238]~297\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[238]~297_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[227]~344_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[7]~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[238]~297_combout\);

-- Location: LCCOMB_X39_Y34_N18
\dc|Div1|auto_generated|divider|divider|StageOut[237]~223\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[237]~223_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[7]~4_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[237]~223_combout\);

-- Location: LCCOMB_X39_Y34_N16
\dc|Div1|auto_generated|divider|divider|StageOut[236]~224\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[236]~224_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[236]~224_combout\);

-- Location: LCCOMB_X39_Y35_N22
\dc|Div1|auto_generated|divider|divider|StageOut[224]~348\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & ((\dc|mult_y\(13)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[3]~12_combout\,
	datab => \dc|mult_y\(13),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\);

-- Location: LCCOMB_X39_Y35_N26
\dc|Div1|auto_generated|divider|divider|StageOut[235]~225\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[224]~347_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[224]~348_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\);

-- Location: LCCOMB_X38_Y35_N18
\dc|mult_y[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_y[12]~feeder_combout\ = \dc|Mult1|auto_generated|mac_out2~DATAOUT12\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|Mult1|auto_generated|mac_out2~DATAOUT12\,
	combout => \dc|mult_y[12]~feeder_combout\);

-- Location: FF_X38_Y35_N19
\dc|mult_y[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_y[12]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(12));

-- Location: LCCOMB_X38_Y35_N20
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14_combout\ = \dc|mult_y\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|mult_y\(12),
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14_combout\);

-- Location: LCCOMB_X38_Y35_N26
\dc|Div1|auto_generated|divider|divider|StageOut[223]~349\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[223]~349_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & (\dc|mult_y\(12))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	datab => \dc|mult_y\(12),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[2]~14_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[223]~349_combout\);

-- Location: LCCOMB_X39_Y35_N24
\dc|Div1|auto_generated|divider|divider|StageOut[234]~299\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[223]~349_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[3]~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[223]~349_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\);

-- Location: LCCOMB_X39_Y34_N0
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\)))
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[234]~300_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[234]~299_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\);

-- Location: LCCOMB_X39_Y34_N2
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[235]~226_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[235]~226_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[235]~226_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[235]~226_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~1\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~3\);

-- Location: LCCOMB_X39_Y34_N6
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[237]~223_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[237]~223_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[237]~223_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[237]~298_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[237]~223_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~5\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~7\);

-- Location: LCCOMB_X39_Y34_N8
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[9]~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[238]~222_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[238]~297_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[238]~222_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[238]~297_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~7\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[9]~9_cout\);

-- Location: LCCOMB_X39_Y34_N10
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ = !\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[9]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[9]~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\);

-- Location: LCCOMB_X39_Y34_N30
\dc|Div1|auto_generated|divider|divider|StageOut[246]~303\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[5]~0_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[235]~225_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\);

-- Location: LCCOMB_X38_Y34_N0
\dc|Div1|auto_generated|divider|divider|StageOut[248]~229\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[248]~229_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[8]~6_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[248]~229_combout\);

-- Location: LCCOMB_X39_Y34_N26
\dc|Div1|auto_generated|divider|divider|StageOut[236]~357\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|mult_y\(14)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[5]~0_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datac => \dc|mult_y\(14),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\);

-- Location: LCCOMB_X39_Y34_N28
\dc|Div1|auto_generated|divider|divider|StageOut[247]~302\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[6]~2_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[236]~357_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\);

-- Location: LCCOMB_X38_Y34_N24
\dc|Div1|auto_generated|divider|divider|StageOut[246]~231\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[246]~231_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[246]~231_combout\);

-- Location: LCCOMB_X39_Y34_N14
\dc|Div1|auto_generated|divider|divider|StageOut[245]~233\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[245]~233_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[5]~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[245]~233_combout\);

-- Location: LCCOMB_X38_Y35_N30
\dc|Div1|auto_generated|divider|divider|StageOut[211]~234\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[211]~234_combout\ = (\dc|mult_y\(11) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(11),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[211]~234_combout\);

-- Location: LCCOMB_X38_Y35_N12
\dc|mult_y[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_y[11]~feeder_combout\ = \dc|Mult1|auto_generated|mac_out2~DATAOUT11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Mult1|auto_generated|mac_out2~DATAOUT11\,
	combout => \dc|mult_y[11]~feeder_combout\);

-- Location: FF_X38_Y35_N13
\dc|mult_y[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_y[11]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(11));

-- Location: LCCOMB_X38_Y35_N4
\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16_combout\ = \dc|mult_y\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dc|mult_y\(11),
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16_combout\);

-- Location: LCCOMB_X38_Y35_N0
\dc|Div1|auto_generated|divider|divider|StageOut[211]~235\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[211]~235_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[211]~235_combout\);

-- Location: LCCOMB_X38_Y35_N10
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[211]~234_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[211]~235_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[211]~234_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[211]~235_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14_combout\);

-- Location: LCCOMB_X38_Y35_N22
\dc|Div1|auto_generated|divider|divider|StageOut[222]~236\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[222]~236_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[222]~236_combout\);

-- Location: LCCOMB_X38_Y35_N16
\dc|Div1|auto_generated|divider|divider|StageOut[222]~350\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[222]~350_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & (\dc|mult_y\(11))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(11),
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[1]~16_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[222]~350_combout\);

-- Location: LCCOMB_X38_Y35_N24
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[222]~236_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[222]~350_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[222]~236_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[222]~350_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12_combout\);

-- Location: LCCOMB_X38_Y35_N28
\dc|Div1|auto_generated|divider|divider|StageOut[233]~304\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[233]~304_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[222]~350_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[2]~14_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[222]~350_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[233]~304_combout\);

-- Location: LCCOMB_X38_Y34_N20
\dc|Div1|auto_generated|divider|divider|StageOut[244]~305\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[233]~304_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[3]~12_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[233]~304_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\);

-- Location: LCCOMB_X38_Y34_N2
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\)))
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[244]~306_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[244]~305_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\);

-- Location: LCCOMB_X38_Y34_N4
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[245]~233_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[245]~233_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[245]~233_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[245]~232_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[245]~233_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~1\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~3\);

-- Location: LCCOMB_X38_Y34_N6
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[246]~231_combout\)))) # (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[246]~231_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[246]~231_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[246]~231_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~3\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~5\);

-- Location: LCCOMB_X38_Y34_N10
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[9]~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[248]~301_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[248]~229_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[248]~301_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[248]~229_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[8]~7\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[9]~9_cout\);

-- Location: LCCOMB_X38_Y34_N12
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ = !\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[9]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[9]~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\);

-- Location: LCCOMB_X38_Y34_N28
\dc|Div1|auto_generated|divider|divider|StageOut[257]~308\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[6]~2_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[246]~303_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\);

-- Location: LCCOMB_X36_Y34_N24
\dc|Div1|auto_generated|divider|divider|StageOut[258]~307\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[258]~307_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[7]~4_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[247]~302_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[258]~307_combout\);

-- Location: LCCOMB_X36_Y34_N28
\dc|Div1|auto_generated|divider|divider|StageOut[257]~238\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[257]~238_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[257]~238_combout\);

-- Location: LCCOMB_X36_Y34_N18
\dc|Div1|auto_generated|divider|divider|StageOut[256]~239\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[256]~239_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[256]~239_combout\);

-- Location: LCCOMB_X36_Y34_N16
\dc|Div1|auto_generated|divider|divider|StageOut[255]~241\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[255]~241_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[5]~0_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[255]~241_combout\);

-- Location: LCCOMB_X41_Y34_N22
\dc|mult_y[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_y[10]~feeder_combout\ = \dc|Mult1|auto_generated|mac_out2~DATAOUT10\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Mult1|auto_generated|mac_out2~DATAOUT10\,
	combout => \dc|mult_y[10]~feeder_combout\);

-- Location: FF_X41_Y34_N23
\dc|mult_y[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_y[10]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(10));

-- Location: LCCOMB_X41_Y34_N30
\dc|Div1|auto_generated|divider|divider|StageOut[210]~243\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[210]~243_combout\ = (\dc|mult_y\(10) & \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(10),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[210]~243_combout\);

-- Location: LCCOMB_X41_Y34_N28
\dc|Div1|auto_generated|divider|divider|StageOut[210]~244\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[210]~244_combout\ = (\dc|mult_y\(10) & !\dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(10),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_21_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[210]~244_combout\);

-- Location: LCCOMB_X41_Y34_N16
\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[210]~243_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[210]~244_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[210]~243_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[210]~244_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16_combout\);

-- Location: LCCOMB_X41_Y34_N14
\dc|Div1|auto_generated|divider|divider|StageOut[221]~245\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[221]~245_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[221]~245_combout\);

-- Location: LCCOMB_X41_Y34_N12
\dc|Div1|auto_generated|divider|divider|StageOut[221]~242\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[221]~242_combout\ = (\dc|mult_y\(10) & \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(10),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[221]~242_combout\);

-- Location: LCCOMB_X41_Y34_N10
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[221]~245_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[221]~242_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[221]~245_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[221]~242_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14_combout\);

-- Location: LCCOMB_X41_Y34_N8
\dc|Div1|auto_generated|divider|divider|StageOut[232]~246\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[232]~246_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[232]~246_combout\);

-- Location: LCCOMB_X41_Y34_N18
\dc|Div1|auto_generated|divider|divider|StageOut[232]~351\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[232]~351_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & (\dc|mult_y\(10))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(10),
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[1]~16_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[232]~351_combout\);

-- Location: LCCOMB_X41_Y34_N20
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[232]~246_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[232]~351_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[232]~246_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[232]~351_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12_combout\);

-- Location: LCCOMB_X41_Y34_N26
\dc|Div1|auto_generated|divider|divider|StageOut[243]~310\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[243]~310_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[232]~351_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[2]~14_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[232]~351_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[243]~310_combout\);

-- Location: LCCOMB_X41_Y34_N4
\dc|Div1|auto_generated|divider|divider|StageOut[254]~311\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[243]~310_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[243]~310_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\);

-- Location: LCCOMB_X36_Y34_N4
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\)))
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\);

-- Location: LCCOMB_X36_Y34_N6
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\ & (((!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[255]~241_combout\ & (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[255]~241_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[255]~241_combout\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[255]~240_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[255]~241_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~1\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~3\);

-- Location: LCCOMB_X36_Y34_N12
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[9]~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[258]~237_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[258]~307_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[258]~237_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[258]~307_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[8]~7\,
	cout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[9]~9_cout\);

-- Location: LCCOMB_X36_Y34_N14
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ = !\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[9]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[9]~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\);

-- Location: LCCOMB_X38_Y34_N14
\dc|Div1|auto_generated|divider|divider|StageOut[268]~313\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[268]~313_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[257]~308_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[7]~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[268]~313_combout\);

-- Location: LCCOMB_X36_Y34_N22
\dc|Div1|auto_generated|divider|divider|StageOut[267]~314\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[256]~309_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[6]~2_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\);

-- Location: LCCOMB_X35_Y34_N28
\dc|Div1|auto_generated|divider|divider|StageOut[266]~249\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[266]~249_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[266]~249_combout\);

-- Location: LCCOMB_X35_Y34_N14
\dc|Div1|auto_generated|divider|divider|StageOut[265]~251\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[265]~251_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[265]~251_combout\);

-- Location: FF_X41_Y35_N5
\dc|mult_y[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT9\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(9));

-- Location: LCCOMB_X41_Y35_N26
\dc|Div1|auto_generated|divider|divider|StageOut[220]~254\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[220]~254_combout\ = (\dc|mult_y\(9) & !\dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(9),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[220]~254_combout\);

-- Location: LCCOMB_X41_Y35_N8
\dc|Div1|auto_generated|divider|divider|StageOut[220]~253\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[220]~253_combout\ = (\dc|mult_y\(9) & \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(9),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_22_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[220]~253_combout\);

-- Location: LCCOMB_X41_Y35_N12
\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[220]~254_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[220]~253_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[220]~254_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[220]~253_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16_combout\);

-- Location: LCCOMB_X40_Y34_N18
\dc|Div1|auto_generated|divider|divider|StageOut[242]~352\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[242]~352_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & (\dc|mult_y\(9))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(9),
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[242]~352_combout\);

-- Location: LCCOMB_X40_Y34_N8
\dc|Div1|auto_generated|divider|divider|StageOut[231]~255\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[231]~255_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[1]~16_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[231]~255_combout\);

-- Location: LCCOMB_X40_Y34_N2
\dc|Div1|auto_generated|divider|divider|StageOut[231]~252\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[231]~252_combout\ = (\dc|mult_y\(9) & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(9),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[231]~252_combout\);

-- Location: LCCOMB_X40_Y34_N0
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[231]~255_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[231]~252_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[231]~255_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[231]~252_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14_combout\);

-- Location: LCCOMB_X39_Y34_N24
\dc|Div1|auto_generated|divider|divider|StageOut[253]~316\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[253]~316_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[242]~352_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[242]~352_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[253]~316_combout\);

-- Location: LCCOMB_X35_Y34_N4
\dc|Div1|auto_generated|divider|divider|StageOut[264]~317\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[253]~316_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[253]~316_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\);

-- Location: LCCOMB_X35_Y34_N18
\dc|Div1|auto_generated|divider|divider|op_19~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_19~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[265]~251_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_19~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[265]~251_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_19~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_19~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[265]~251_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_19~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[265]~251_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_19~1\,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_19~3\);

-- Location: LCCOMB_X35_Y34_N24
\dc|Div1|auto_generated|divider|divider|op_19~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[268]~247_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[268]~313_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_19~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[268]~247_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[268]~313_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_19~7\,
	cout => \dc|Div1|auto_generated|divider|divider|op_19~9_cout\);

-- Location: LCCOMB_X35_Y34_N26
\dc|Div1|auto_generated|divider|divider|op_19~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_19~10_combout\ = !\dc|Div1|auto_generated|divider|divider|op_19~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|op_19~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\);

-- Location: LCCOMB_X36_Y34_N0
\dc|Div1|auto_generated|divider|divider|StageOut[254]~312\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[243]~310_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[3]~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[243]~310_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\);

-- Location: LCCOMB_X36_Y34_N30
\dc|Div1|auto_generated|divider|divider|StageOut[265]~250\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[254]~311_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[254]~312_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\);

-- Location: LCCOMB_X34_Y34_N4
\dc|Div1|auto_generated|divider|divider|StageOut[276]~321\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[265]~250_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[5]~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\);

-- Location: LCCOMB_X35_Y34_N10
\dc|Div1|auto_generated|divider|divider|StageOut[278]~319\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[278]~319_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[7]~4_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[267]~314_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[278]~319_combout\);

-- Location: LCCOMB_X35_Y34_N0
\dc|Div1|auto_generated|divider|divider|StageOut[277]~320\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[266]~315_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[6]~2_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\);

-- Location: LCCOMB_X34_Y34_N28
\dc|Div1|auto_generated|divider|divider|StageOut[276]~259\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[276]~259_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~2_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|op_19~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[276]~259_combout\);

-- Location: LCCOMB_X40_Y34_N22
\dc|Div1|auto_generated|divider|divider|StageOut[242]~256\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[242]~256_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[2]~14_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[242]~256_combout\);

-- Location: LCCOMB_X40_Y34_N30
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[242]~256_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[242]~352_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[242]~256_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[242]~352_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12_combout\);

-- Location: LCCOMB_X36_Y34_N2
\dc|Div1|auto_generated|divider|divider|StageOut[264]~318\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[253]~316_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[253]~316_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[3]~12_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\);

-- Location: LCCOMB_X35_Y34_N8
\dc|Div1|auto_generated|divider|divider|StageOut[275]~260\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[264]~317_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[264]~318_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\);

-- Location: FF_X39_Y36_N5
\dc|mult_y[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT8\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(8));

-- Location: LCCOMB_X39_Y36_N26
\dc|Div1|auto_generated|divider|divider|StageOut[241]~262\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[241]~262_combout\ = (\dc|mult_y\(8) & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(8),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[241]~262_combout\);

-- Location: LCCOMB_X39_Y36_N4
\dc|Div1|auto_generated|divider|divider|StageOut[230]~264\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[230]~264_combout\ = (\dc|mult_y\(8) & !\dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(8),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[230]~264_combout\);

-- Location: LCCOMB_X39_Y36_N24
\dc|Div1|auto_generated|divider|divider|StageOut[230]~263\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[230]~263_combout\ = (\dc|mult_y\(8) & \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(8),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[230]~263_combout\);

-- Location: LCCOMB_X39_Y36_N12
\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[230]~264_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[230]~263_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[230]~264_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[230]~263_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16_combout\);

-- Location: LCCOMB_X39_Y36_N2
\dc|Div1|auto_generated|divider|divider|StageOut[241]~265\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[241]~265_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[241]~265_combout\);

-- Location: LCCOMB_X39_Y36_N10
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[241]~262_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[241]~265_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[241]~262_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[241]~265_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14_combout\);

-- Location: LCCOMB_X39_Y36_N28
\dc|Div1|auto_generated|divider|divider|StageOut[252]~353\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[252]~353_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|mult_y\(8)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[1]~16_combout\,
	datab => \dc|mult_y\(8),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[252]~353_combout\);

-- Location: LCCOMB_X33_Y34_N6
\dc|Div1|auto_generated|divider|divider|StageOut[263]~322\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[263]~322_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[252]~353_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[2]~14_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[252]~353_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[263]~322_combout\);

-- Location: LCCOMB_X34_Y34_N2
\dc|Div1|auto_generated|divider|divider|StageOut[274]~323\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[263]~322_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[3]~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[263]~322_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\);

-- Location: LCCOMB_X34_Y34_N10
\dc|Div1|auto_generated|divider|divider|op_20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~0_combout\ = (((\dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\)))
-- \dc|Div1|auto_generated|divider|divider|op_20~1\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\,
	datad => VCC,
	combout => \dc|Div1|auto_generated|divider|divider|op_20~0_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_20~1\);

-- Location: LCCOMB_X34_Y34_N12
\dc|Div1|auto_generated|divider|divider|op_20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~2_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[275]~261_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_20~1\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[275]~261_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_20~1\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_20~1\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_20~3\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[275]~261_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_20~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[275]~261_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[275]~260_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_20~1\,
	combout => \dc|Div1|auto_generated|divider|divider|op_20~2_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_20~3\);

-- Location: LCCOMB_X34_Y34_N14
\dc|Div1|auto_generated|divider|divider|op_20~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~4_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[276]~259_combout\)))) 
-- # (!\dc|Div1|auto_generated|divider|divider|op_20~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[276]~259_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|op_20~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_20~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[276]~259_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[276]~259_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_20~3\,
	combout => \dc|Div1|auto_generated|divider|divider|op_20~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_20~5\);

-- Location: LCCOMB_X34_Y34_N16
\dc|Div1|auto_generated|divider|divider|op_20~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~6_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[277]~258_combout\ & (((!\dc|Div1|auto_generated|divider|divider|op_20~5\)))) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[277]~258_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\ & (!\dc|Div1|auto_generated|divider|divider|op_20~5\)) # 
-- (!\dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\ & ((\dc|Div1|auto_generated|divider|divider|op_20~5\) # (GND)))))
-- \dc|Div1|auto_generated|divider|divider|op_20~7\ = CARRY(((!\dc|Div1|auto_generated|divider|divider|StageOut[277]~258_combout\ & !\dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\)) # (!\dc|Div1|auto_generated|divider|divider|op_20~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[277]~258_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[277]~320_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_20~5\,
	combout => \dc|Div1|auto_generated|divider|divider|op_20~6_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_20~7\);

-- Location: LCCOMB_X34_Y34_N18
\dc|Div1|auto_generated|divider|divider|op_20~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[278]~257_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[278]~319_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_20~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[278]~257_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[278]~319_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_20~7\,
	cout => \dc|Div1|auto_generated|divider|divider|op_20~9_cout\);

-- Location: LCCOMB_X34_Y34_N20
\dc|Div1|auto_generated|divider|divider|op_20~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_20~10_combout\ = !\dc|Div1|auto_generated|divider|divider|op_20~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|op_20~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\);

-- Location: LCCOMB_X34_Y34_N6
\dc|Div1|auto_generated|divider|divider|StageOut[287]~326\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_19~2_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_19~2_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[276]~321_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\);

-- Location: LCCOMB_X34_Y33_N28
\dc|Div1|auto_generated|divider|divider|StageOut[288]~267\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[288]~267_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~6_combout\ & !\dc|Div1|auto_generated|divider|divider|op_20~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_20~6_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[288]~267_combout\);

-- Location: LCCOMB_X34_Y33_N24
\dc|Div1|auto_generated|divider|divider|StageOut[286]~269\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[286]~269_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~2_combout\ & !\dc|Div1|auto_generated|divider|divider|op_20~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_20~2_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[286]~269_combout\);

-- Location: LCCOMB_X34_Y33_N18
\dc|Div1|auto_generated|divider|divider|StageOut[285]~271\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[285]~271_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~0_combout\ & !\dc|Div1|auto_generated|divider|divider|op_20~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|op_20~0_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[285]~271_combout\);

-- Location: LCCOMB_X33_Y34_N24
\dc|mult_y[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|mult_y[7]~feeder_combout\ = \dc|Mult1|auto_generated|mac_out2~DATAOUT7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Mult1|auto_generated|mac_out2~DATAOUT7\,
	combout => \dc|mult_y[7]~feeder_combout\);

-- Location: FF_X33_Y34_N25
\dc|mult_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|mult_y[7]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(7));

-- Location: LCCOMB_X33_Y34_N14
\dc|Div1|auto_generated|divider|divider|StageOut[251]~272\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[251]~272_combout\ = (\dc|mult_y\(7) & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|mult_y\(7),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[251]~272_combout\);

-- Location: LCCOMB_X33_Y34_N8
\dc|Div1|auto_generated|divider|divider|StageOut[240]~273\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[240]~273_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|mult_y\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|mult_y\(7),
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[240]~273_combout\);

-- Location: LCCOMB_X33_Y34_N10
\dc|Div1|auto_generated|divider|divider|StageOut[240]~274\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[240]~274_combout\ = (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & \dc|mult_y\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => \dc|mult_y\(7),
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[240]~274_combout\);

-- Location: LCCOMB_X33_Y34_N4
\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[240]~273_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[240]~274_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[240]~273_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[240]~274_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16_combout\);

-- Location: LCCOMB_X33_Y34_N12
\dc|Div1|auto_generated|divider|divider|StageOut[251]~275\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[251]~275_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16_combout\ & !\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[251]~275_combout\);

-- Location: LCCOMB_X33_Y34_N18
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[251]~272_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[251]~275_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[251]~272_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[251]~275_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14_combout\);

-- Location: LCCOMB_X33_Y34_N2
\dc|Div1|auto_generated|divider|divider|StageOut[262]~354\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[262]~354_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & (\dc|mult_y\(7))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datab => \dc|mult_y\(7),
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[1]~16_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[262]~354_combout\);

-- Location: LCCOMB_X33_Y34_N16
\dc|Div1|auto_generated|divider|divider|StageOut[273]~328\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[273]~328_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[262]~354_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[2]~14_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[262]~354_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[273]~328_combout\);

-- Location: LCCOMB_X34_Y34_N26
\dc|Div1|auto_generated|divider|divider|StageOut[284]~329\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[273]~328_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_19~12_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_19~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[273]~328_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\);

-- Location: LCCOMB_X34_Y33_N6
\dc|Div1|auto_generated|divider|divider|op_21~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_21~4_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~3\ & (((\dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[286]~269_combout\)))) 
-- # (!\dc|Div1|auto_generated|divider|divider|op_21~3\ & ((((\dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[286]~269_combout\)))))
-- \dc|Div1|auto_generated|divider|divider|op_21~5\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_21~3\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[286]~269_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[286]~327_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[286]~269_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_21~3\,
	combout => \dc|Div1|auto_generated|divider|divider|op_21~4_combout\,
	cout => \dc|Div1|auto_generated|divider|divider|op_21~5\);

-- Location: LCCOMB_X34_Y33_N10
\dc|Div1|auto_generated|divider|divider|op_21~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_21~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[288]~325_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[288]~267_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_21~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[288]~325_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[288]~267_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_21~7\,
	cout => \dc|Div1|auto_generated|divider|divider|op_21~9_cout\);

-- Location: LCCOMB_X34_Y33_N12
\dc|Div1|auto_generated|divider|divider|op_21~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_21~10_combout\ = !\dc|Div1|auto_generated|divider|divider|op_21~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|op_21~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\);

-- Location: LCCOMB_X34_Y33_N16
\dc|Div1|auto_generated|divider|divider|StageOut[298]~331\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[298]~331_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_20~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[287]~326_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_20~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[298]~331_combout\);

-- Location: LCCOMB_X38_Y33_N24
\dc|Div1|auto_generated|divider|divider|StageOut[297]~278\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[297]~278_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~4_combout\ & !\dc|Div1|auto_generated|divider|divider|op_21~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|op_21~4_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[297]~278_combout\);

-- Location: LCCOMB_X34_Y34_N30
\dc|Div1|auto_generated|divider|divider|StageOut[285]~270\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[274]~324_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[274]~323_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\);

-- Location: LCCOMB_X34_Y33_N20
\dc|Div1|auto_generated|divider|divider|StageOut[296]~333\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\) # 
-- ((!\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & \dc|Div1|auto_generated|divider|divider|op_20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_20~0_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[285]~270_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[296]~333_combout\);

-- Location: LCCOMB_X34_Y33_N30
\dc|Div1|auto_generated|divider|divider|StageOut[284]~330\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\ = (!\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[273]~328_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_19~12_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_19~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[273]~328_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\);

-- Location: LCCOMB_X34_Y33_N0
\dc|Div1|auto_generated|divider|divider|StageOut[295]~280\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\) # 
-- (\dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[284]~329_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[284]~330_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[295]~280_combout\);

-- Location: FF_X41_Y34_N29
\dc|mult_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	asdata => \dc|Mult1|auto_generated|mac_out2~DATAOUT6\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|mult_y\(6));

-- Location: LCCOMB_X35_Y33_N22
\dc|Div1|auto_generated|divider|divider|StageOut[250]~284\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[250]~284_combout\ = (\dc|mult_y\(6) & !\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(6),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[250]~284_combout\);

-- Location: LCCOMB_X35_Y33_N0
\dc|Div1|auto_generated|divider|divider|StageOut[250]~283\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[250]~283_combout\ = (\dc|mult_y\(6) & \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|mult_y\(6),
	datad => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[250]~283_combout\);

-- Location: LCCOMB_X35_Y33_N20
\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16_combout\ = (\dc|Div1|auto_generated|divider|divider|StageOut[250]~284_combout\) # (\dc|Div1|auto_generated|divider|divider|StageOut[250]~283_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[250]~284_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[250]~283_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16_combout\);

-- Location: LCCOMB_X35_Y33_N10
\dc|Div1|auto_generated|divider|divider|StageOut[272]~355\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[272]~355_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & (\dc|mult_y\(6))) # 
-- (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|mult_y\(6),
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[1]~16_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[272]~355_combout\);

-- Location: LCCOMB_X35_Y33_N4
\dc|Div1|auto_generated|divider|divider|StageOut[283]~334\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[283]~334_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[272]~355_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_19~14_combout\ & !\dc|Div1|auto_generated|divider|divider|op_19~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_19~14_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|StageOut[272]~355_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[283]~334_combout\);

-- Location: LCCOMB_X35_Y33_N28
\dc|Div1|auto_generated|divider|divider|StageOut[294]~336\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\ = (!\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & ((\dc|Div1|auto_generated|divider|divider|StageOut[283]~334_combout\) # 
-- ((\dc|Div1|auto_generated|divider|divider|op_20~12_combout\ & !\dc|Div1|auto_generated|divider|divider|op_20~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_20~12_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datac => \dc|Div1|auto_generated|divider|divider|StageOut[283]~334_combout\,
	datad => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	combout => \dc|Div1|auto_generated|divider|divider|StageOut[294]~336_combout\);

-- Location: LCCOMB_X38_Y33_N18
\dc|Div1|auto_generated|divider|divider|op_23~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_23~9_cout\ = CARRY((\dc|Div1|auto_generated|divider|divider|StageOut[298]~277_combout\) # ((\dc|Div1|auto_generated|divider|divider|StageOut[298]~331_combout\) # 
-- (!\dc|Div1|auto_generated|divider|divider|op_23~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|StageOut[298]~277_combout\,
	datab => \dc|Div1|auto_generated|divider|divider|StageOut[298]~331_combout\,
	datad => VCC,
	cin => \dc|Div1|auto_generated|divider|divider|op_23~7\,
	cout => \dc|Div1|auto_generated|divider|divider|op_23~9_cout\);

-- Location: LCCOMB_X38_Y33_N20
\dc|Div1|auto_generated|divider|divider|op_23~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|Div1|auto_generated|divider|divider|op_23~10_combout\ = !\dc|Div1|auto_generated|divider|divider|op_23~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \dc|Div1|auto_generated|divider|divider|op_23~9_cout\,
	combout => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\);

-- Location: LCCOMB_X39_Y33_N16
\dc|int_y[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[1]~11_combout\ = (\dc|dis_h_hold\(5) & ((\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & (!\dc|int_y[0]~10\)) # (!\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & (\dc|int_y[0]~10\ & VCC)))) # (!\dc|dis_h_hold\(5) & 
-- ((\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & ((\dc|int_y[0]~10\) # (GND))) # (!\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & (!\dc|int_y[0]~10\))))
-- \dc|int_y[1]~12\ = CARRY((\dc|dis_h_hold\(5) & (\dc|Div1|auto_generated|divider|divider|op_23~10_combout\ & !\dc|int_y[0]~10\)) # (!\dc|dis_h_hold\(5) & ((\dc|Div1|auto_generated|divider|divider|op_23~10_combout\) # (!\dc|int_y[0]~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|dis_h_hold\(5),
	datab => \dc|Div1|auto_generated|divider|divider|op_23~10_combout\,
	datad => VCC,
	cin => \dc|int_y[0]~10\,
	combout => \dc|int_y[1]~11_combout\,
	cout => \dc|int_y[1]~12\);

-- Location: FF_X39_Y33_N17
\dc|int_y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[1]~11_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(1));

-- Location: LCCOMB_X35_Y26_N2
\vc|SRAM_ADDR[11]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[11]~25_combout\ = (\dc|vram_re~combout\ & (!\vc|counter\(1) & (\vc|SRAM_ADDR[11]~24_combout\))) # (!\dc|vram_re~combout\ & (((\dc|int_y\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|counter\(1),
	datab => \vc|SRAM_ADDR[11]~24_combout\,
	datac => \dc|int_y\(1),
	datad => \dc|vram_re~combout\,
	combout => \vc|SRAM_ADDR[11]~25_combout\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: LCCOMB_X34_Y25_N26
\vc|SRAM_ADDR[12]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[12]~26_combout\ = (\always1~2_combout\ & (((w_y(2))))) # (!\always1~2_combout\ & (!\KEY[2]~input_o\ & ((\SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => w_y(2),
	datac => \always1~2_combout\,
	datad => \SW[12]~input_o\,
	combout => \vc|SRAM_ADDR[12]~26_combout\);

-- Location: LCCOMB_X39_Y33_N18
\dc|int_y[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[2]~13_combout\ = (\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & (!\dc|int_y[1]~12\ & VCC)) # (!\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & (\dc|int_y[1]~12\ $ (GND)))
-- \dc|int_y[2]~14\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_21~10_combout\ & !\dc|int_y[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_21~10_combout\,
	datad => VCC,
	cin => \dc|int_y[1]~12\,
	combout => \dc|int_y[2]~13_combout\,
	cout => \dc|int_y[2]~14\);

-- Location: FF_X39_Y33_N19
\dc|int_y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[2]~13_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(2));

-- Location: LCCOMB_X34_Y25_N24
\vc|SRAM_ADDR[12]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[12]~27_combout\ = (\dc|vram_re~combout\ & (\vc|SRAM_ADDR[12]~26_combout\ & (!\vc|counter\(1)))) # (!\dc|vram_re~combout\ & (((\dc|int_y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|SRAM_ADDR[12]~26_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \dc|int_y\(2),
	combout => \vc|SRAM_ADDR[12]~27_combout\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: LCCOMB_X35_Y26_N12
\w_y[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[3]~7_combout\ = (\w_y[3]~0_combout\ & (\always1~2_combout\ & (\Add1~6_combout\))) # (!\w_y[3]~0_combout\ & (((w_y(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always1~2_combout\,
	datab => \Add1~6_combout\,
	datac => w_y(3),
	datad => \w_y[3]~0_combout\,
	combout => \w_y[3]~7_combout\);

-- Location: FF_X35_Y26_N13
\w_y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[3]~7_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(3));

-- Location: LCCOMB_X35_Y26_N16
\vc|SRAM_ADDR[13]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[13]~28_combout\ = (\always1~2_combout\ & (((w_y(3))))) # (!\always1~2_combout\ & (!\KEY[2]~input_o\ & (\SW[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \always1~2_combout\,
	datad => w_y(3),
	combout => \vc|SRAM_ADDR[13]~28_combout\);

-- Location: LCCOMB_X39_Y33_N20
\dc|int_y[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[3]~15_combout\ = (\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & ((\dc|int_y[2]~14\) # (GND))) # (!\dc|Div1|auto_generated|divider|divider|op_20~10_combout\ & (!\dc|int_y[2]~14\))
-- \dc|int_y[3]~16\ = CARRY((\dc|Div1|auto_generated|divider|divider|op_20~10_combout\) # (!\dc|int_y[2]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|op_20~10_combout\,
	datad => VCC,
	cin => \dc|int_y[2]~14\,
	combout => \dc|int_y[3]~15_combout\,
	cout => \dc|int_y[3]~16\);

-- Location: FF_X39_Y33_N21
\dc|int_y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[3]~15_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(3));

-- Location: LCCOMB_X35_Y26_N22
\vc|SRAM_ADDR[13]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[13]~29_combout\ = (\dc|vram_re~combout\ & (!\vc|counter\(1) & (\vc|SRAM_ADDR[13]~28_combout\))) # (!\dc|vram_re~combout\ & (((\dc|int_y\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|counter\(1),
	datab => \vc|SRAM_ADDR[13]~28_combout\,
	datac => \dc|int_y\(3),
	datad => \dc|vram_re~combout\,
	combout => \vc|SRAM_ADDR[13]~29_combout\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: LCCOMB_X35_Y26_N20
\vc|SRAM_ADDR[14]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[14]~30_combout\ = (\always1~2_combout\ & (((w_y(4))))) # (!\always1~2_combout\ & (!\KEY[2]~input_o\ & (\SW[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => \SW[14]~input_o\,
	datac => \always1~2_combout\,
	datad => w_y(4),
	combout => \vc|SRAM_ADDR[14]~30_combout\);

-- Location: LCCOMB_X39_Y33_N22
\dc|int_y[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[4]~17_combout\ = (\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & (!\dc|int_y[3]~16\ & VCC)) # (!\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & (\dc|int_y[3]~16\ $ (GND)))
-- \dc|int_y[4]~18\ = CARRY((!\dc|Div1|auto_generated|divider|divider|op_19~10_combout\ & !\dc|int_y[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|op_19~10_combout\,
	datad => VCC,
	cin => \dc|int_y[3]~16\,
	combout => \dc|int_y[4]~17_combout\,
	cout => \dc|int_y[4]~18\);

-- Location: FF_X39_Y33_N23
\dc|int_y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[4]~17_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(4));

-- Location: LCCOMB_X35_Y26_N14
\vc|SRAM_ADDR[14]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[14]~31_combout\ = (\dc|vram_re~combout\ & (!\vc|counter\(1) & (\vc|SRAM_ADDR[14]~30_combout\))) # (!\dc|vram_re~combout\ & (((\dc|int_y\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|counter\(1),
	datab => \vc|SRAM_ADDR[14]~30_combout\,
	datac => \dc|int_y\(4),
	datad => \dc|vram_re~combout\,
	combout => \vc|SRAM_ADDR[14]~31_combout\);

-- Location: LCCOMB_X39_Y33_N24
\dc|int_y[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[5]~19_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & ((\dc|int_y[4]~18\) # (GND))) # (!\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\ & (!\dc|int_y[4]~18\))
-- \dc|int_y[5]~20\ = CARRY((\dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\) # (!\dc|int_y[4]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_26_result_int[10]~10_combout\,
	datad => VCC,
	cin => \dc|int_y[4]~18\,
	combout => \dc|int_y[5]~19_combout\,
	cout => \dc|int_y[5]~20\);

-- Location: FF_X39_Y33_N25
\dc|int_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[5]~19_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(5));

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: LCCOMB_X34_Y25_N18
\vc|SRAM_ADDR[15]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[15]~32_combout\ = (\always1~2_combout\ & (((w_y(5))))) # (!\always1~2_combout\ & (!\KEY[2]~input_o\ & ((\SW[15]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => w_y(5),
	datac => \always1~2_combout\,
	datad => \SW[15]~input_o\,
	combout => \vc|SRAM_ADDR[15]~32_combout\);

-- Location: LCCOMB_X34_Y25_N16
\vc|SRAM_ADDR[15]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[15]~33_combout\ = (\dc|vram_re~combout\ & (((!\vc|counter\(1) & \vc|SRAM_ADDR[15]~32_combout\)))) # (!\dc|vram_re~combout\ & (\dc|int_y\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|int_y\(5),
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \vc|SRAM_ADDR[15]~32_combout\,
	combout => \vc|SRAM_ADDR[15]~33_combout\);

-- Location: LCCOMB_X39_Y33_N26
\dc|int_y[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[6]~21_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & (!\dc|int_y[5]~20\ & VCC)) # (!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & (\dc|int_y[5]~20\ $ (GND)))
-- \dc|int_y[6]~22\ = CARRY((!\dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\ & !\dc|int_y[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_25_result_int[10]~10_combout\,
	datad => VCC,
	cin => \dc|int_y[5]~20\,
	combout => \dc|int_y[6]~21_combout\,
	cout => \dc|int_y[6]~22\);

-- Location: FF_X39_Y33_N27
\dc|int_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[6]~21_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(6));

-- Location: IOIBUF_X115_Y13_N1
\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

-- Location: LCCOMB_X35_Y26_N24
\vc|SRAM_ADDR[16]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[16]~34_combout\ = (\always1~2_combout\ & (((w_y(6))))) # (!\always1~2_combout\ & (!\KEY[2]~input_o\ & (\SW[16]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => \SW[16]~input_o\,
	datac => \always1~2_combout\,
	datad => w_y(6),
	combout => \vc|SRAM_ADDR[16]~34_combout\);

-- Location: LCCOMB_X35_Y26_N30
\vc|SRAM_ADDR[16]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[16]~35_combout\ = (\dc|vram_re~combout\ & (((!\vc|counter\(1) & \vc|SRAM_ADDR[16]~34_combout\)))) # (!\dc|vram_re~combout\ & (\dc|int_y\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dc|vram_re~combout\,
	datab => \dc|int_y\(6),
	datac => \vc|counter\(1),
	datad => \vc|SRAM_ADDR[16]~34_combout\,
	combout => \vc|SRAM_ADDR[16]~35_combout\);

-- Location: IOIBUF_X115_Y14_N8
\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

-- Location: LCCOMB_X34_Y25_N10
\vc|SRAM_ADDR[17]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[17]~36_combout\ = (\always1~2_combout\ & (((w_y(7))))) # (!\always1~2_combout\ & (!\KEY[2]~input_o\ & (\SW[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[2]~input_o\,
	datab => \SW[17]~input_o\,
	datac => \always1~2_combout\,
	datad => w_y(7),
	combout => \vc|SRAM_ADDR[17]~36_combout\);

-- Location: LCCOMB_X39_Y33_N28
\dc|int_y[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[7]~23_combout\ = (\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & ((\dc|int_y[6]~22\) # (GND))) # (!\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\ & (!\dc|int_y[6]~22\))
-- \dc|int_y[7]~24\ = CARRY((\dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\) # (!\dc|int_y[6]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dc|Div1|auto_generated|divider|divider|add_sub_24_result_int[10]~10_combout\,
	datad => VCC,
	cin => \dc|int_y[6]~22\,
	combout => \dc|int_y[7]~23_combout\,
	cout => \dc|int_y[7]~24\);

-- Location: FF_X39_Y33_N29
\dc|int_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[7]~23_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(7));

-- Location: LCCOMB_X34_Y25_N12
\vc|SRAM_ADDR[17]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[17]~37_combout\ = (\dc|vram_re~combout\ & (\vc|SRAM_ADDR[17]~36_combout\ & (!\vc|counter\(1)))) # (!\dc|vram_re~combout\ & (((\dc|int_y\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|SRAM_ADDR[17]~36_combout\,
	datab => \vc|counter\(1),
	datac => \dc|vram_re~combout\,
	datad => \dc|int_y\(7),
	combout => \vc|SRAM_ADDR[17]~37_combout\);

-- Location: LCCOMB_X39_Y33_N30
\dc|int_y[8]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \dc|int_y[8]~25_combout\ = \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\ $ (\dc|int_y[7]~24\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dc|Div1|auto_generated|divider|divider|add_sub_23_result_int[10]~10_combout\,
	cin => \dc|int_y[7]~24\,
	combout => \dc|int_y[8]~25_combout\);

-- Location: FF_X39_Y33_N31
\dc|int_y[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~clkctrl_outclk\,
	d => \dc|int_y[8]~25_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dc|int_y\(8));

-- Location: LCCOMB_X36_Y26_N30
\w_y[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_y[8]~2_combout\ = (\w_y[3]~0_combout\ & (\always1~2_combout\ & ((\Add1~16_combout\)))) # (!\w_y[3]~0_combout\ & (((w_y(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_y[3]~0_combout\,
	datab => \always1~2_combout\,
	datac => w_y(8),
	datad => \Add1~16_combout\,
	combout => \w_y[8]~2_combout\);

-- Location: FF_X36_Y26_N31
\w_y[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_33MHz~clkctrl_outclk\,
	d => \w_y[8]~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => w_y(8));

-- Location: LCCOMB_X34_Y26_N24
\vc|SRAM_ADDR[18]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \vc|SRAM_ADDR[18]~38_combout\ = (\vc|SRAM_ADDR[18]~39_combout\ & (!\dc|vram_re~combout\ & (\dc|int_y\(8)))) # (!\vc|SRAM_ADDR[18]~39_combout\ & ((w_y(8)) # ((!\dc|vram_re~combout\ & \dc|int_y\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vc|SRAM_ADDR[18]~39_combout\,
	datab => \dc|vram_re~combout\,
	datac => \dc|int_y\(8),
	datad => w_y(8),
	combout => \vc|SRAM_ADDR[18]~38_combout\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);
END structure;


