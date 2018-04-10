/*
 * Redistributions of any form whatsoever must retain and/or include the
 * following acknowledgment, notices and disclaimer:
 *
 * This product includes software developed by Carnegie Mellon University. 
 *
 * Copyright (c) 2004 by Babak Falsafi and James Hoe,
 * Computer Architecture Lab at Carnegie Mellon (CALCM), 
 * Carnegie Mellon University.
 *
 * This source file was written and maintained by Jared Smolens 
 * as part of the Two-Way In-Order Superscalar project for Carnegie Mellon's 
 * Introduction to Computer Architecture course, 18-447. The source file
 * is in part derived from code originally written by Herman Schmit and 
 * Diana Marculescu.
 *
 * You may not use the name "Carnegie Mellon University" or derivations 
 * thereof to endorse or promote products derived from this software.
 *
 * If you modify the software you must place a notice on or within any 
 * modified version provided or made available to any third party stating 
 * that you have modified the software.  The notice shall include at least 
 * your name, address, phone number, email address and the date and purpose 
 * of the modification.
 *
 * THE SOFTWARE IS PROVIDED "AS-IS" WITHOUT ANY WARRANTY OF ANY KIND, EITHER 
 * EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO ANYWARRANTY 
 * THAT THE SOFTWARE WILL CONFORM TO SPECIFICATIONS OR BE ERROR-FREE AND ANY 
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, 
 * TITLE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY 
 * BE LIABLE FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO DIRECT, INDIRECT, 
 * SPECIAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF, RESULTING FROM, OR IN 
 * ANY WAY CONNECTED WITH THIS SOFTWARE (WHETHER OR NOT BASED UPON WARRANTY, 
 * CONTRACT, TORT OR OTHERWISE).
 *
 */

//////
////// MIPS Defines: Numerical parameters of the MIPS processor
//////



////
//// USEFUL CONSTANTS
////

// Mask for the coprocessor number from the opcode
`define OP__ZMASK       6'h03

// Mask to force word-alignment of addresses
`define ADDR_ALIGN_MASK 32'hfffffffc

// Mask particular bytes
`define BYTE_0_MASK     32'h000000ff
`define BYTE_1_MASK     32'h0000ff00
`define BYTE_2_MASK     32'h00ff0000
`define BYTE_3_MASK     32'hff000000
`define BYTE_0_1_MASK   32'h0000ffff
`define BYTE_0_2_MASK   32'h00ff00ff
`define BYTE_0_3_MASK   32'hff0000ff
`define BYTE_1_2_MASK   32'h00ffff00
`define BYTE_1_3_MASK   32'hff00ff00
`define BYTE_2_3_MASK   32'hffff0000
`define BYTE_0_1_2_MASK 32'h00ffffff
`define BYTE_0_1_3_MASK 32'hff00ffff
`define BYTE_0_2_3_MASK 32'hffff00ff
`define BYTE_1_2_3_MASK 32'hffffff00


////
//// OPCODES
////

// Main opcodes (op field)
`define OP_OTHER0   6'h00
`define OP_OTHER1   6'h01
`define OP_J        6'h02
`define OP_JAL      6'h03
`define OP_BEQ      6'h04
`define OP_BNE      6'h05
`define OP_BLEZ     6'h06
`define OP_BGTZ     6'h07
`define OP_ADDI     6'h08
`define OP_ADDIU    6'h09
`define OP_SLTI     6'h0a
`define OP_SLTIU    6'h0b
`define OP_ANDI     6'h0c
`define OP_ORI      6'h0d
`define OP_XORI     6'h0e
`define OP_LUI      6'h0f
`define OP_Z0       6'h10
`define OP_Z1       6'h11
`define OP_Z2       6'h12
`define OP_Z3       6'h13
`define OP_LB       6'h20
`define OP_LH       6'h21
`define OP_LWL      6'h22
`define OP_LW       6'h23
`define OP_LBU      6'h24
`define OP_LHU      6'h25
`define OP_LWR      6'h26
`define OP_SB       6'h28
`define OP_SH       6'h29
`define OP_SWL      6'h2a
`define OP_SW       6'h2b
`define OP_SWR      6'h2e
`define OP_LWC0     6'h30
`define OP_LWC1     6'h31
`define OP_LWC2     6'h32
`define OP_LWC3     6'h33
`define OP_SWC0     6'h38
`define OP_SWC1     6'h39
`define OP_SWC2     6'h3a
`define OP_SWC3     6'h3b

// Secondary opcodes (rs field; OP_Z[0-3])
`define OPZ_MFCZ    5'h00
`define OPZ_CFCZ    5'h02
`define OPZ_MTCZ    5'h04
`define OPZ_CTCZ    5'h06
`define OPZ_BCZ     5'h08
`define OPZ_COPZS   5'h10
`define OPZ_COPZD   5'h11

// Tertiary opcodes (bczft field; OP_Z[0-3] && OPZ_BCZ)
`define OPB_BCZF    1'h0
`define OPB_BCZT    1'h1

// Tertiary opcodes (funct1 field; OP_Z0 && OPZ_COPZS)
`define OPC_TLBR    5'h01
`define OPC_TLBWI   5'h02
`define OPC_TLBWR   5'h06
`define OPC_TLBP    5'h08
`define OPC_RFE     5'h10

// Secondary opcodes (rt field; OP_OTHER1)
`define OP1_BLTZ    5'h00
`define OP1_BGEZ    5'h01
`define OP1_BLTZAL  5'h10
`define OP1_BGEZAL  5'h11

// Secondary opcodes (funct2 field; OP_OTHER0)
`define OP0_SLL     6'h00
`define OP0_SRL     6'h02
`define OP0_SRA     6'h03
`define OP0_SLLV    6'h04
`define OP0_SRLV    6'h06
`define OP0_SRAV    6'h07
`define OP0_JR      6'h08
`define OP0_JALR    6'h09
`define OP0_SYSCALL 6'h0c
`define OP0_BREAK   6'h0d
`define OP0_MFHI    6'h10
`define OP0_MTHI    6'h11
`define OP0_MFLO    6'h12
`define OP0_MTLO    6'h13
`define OP0_MULT    6'h18
`define OP0_MULTU   6'h19
`define OP0_DIV     6'h1a
`define OP0_DIVU    6'h1b
`define OP0_ADD     6'h20
`define OP0_ADDU    6'h21
`define OP0_SUB     6'h22
`define OP0_SUBU    6'h23
`define OP0_AND     6'h24
`define OP0_OR      6'h25
`define OP0_XOR     6'h26
`define OP0_NOR     6'h27
`define OP0_SLT     6'h2a
`define OP0_SLTU    6'h2b

// Tertiary opcodes (funct2 field; OP_Z1 && (OPZ_COPZS || OPZ_COPZD))
`define OPF_ADDF    6'h00
`define OPF_SUBF    6'h01
`define OPF_MULF    6'h02
`define OPF_DIVF    6'h03
`define OPF_ABSF    6'h05
`define OPF_MOVF    6'h06
`define OPF_NEGF    6'h07
`define OPF_CVTSF   6'h20
`define OPF_CVTDF   6'h21
`define OPF_CVTWF   6'h24
`define OPF_CFF     6'h30
`define OPF_CUNF    6'h31
`define OPF_CEQF    6'h32
`define OPF_CUEQF   6'h33
`define OPF_COLTF   6'h34
`define OPF_CULTF   6'h35
`define OPF_COLEF   6'h36
`define OPF_CULEF   6'h37
`define OPF_CSFF    6'h38
`define OPF_CNGLEF  6'h39
`define OPF_CSEQF   6'h3a
`define OPF_CNGLF   6'h3b
`define OPF_CLTF    6'h3c
`define OPF_CNGEF   6'h3d
`define OPF_CLEF    6'h3e
`define OPF_CNGTF   6'h3f


////
//// Register Mnemonics
////

// Main processor
`define R_ZERO 'd0
`define R_AT   'd1
`define R_V0   'd2
`define R_V1   'd3
`define R_A0   'd4
`define R_A1   'd5
`define R_A2   'd6
`define R_A3   'd7
`define R_T0   'd8
`define R_T1   'd9
`define R_T2   'd10
`define R_T3   'd11
`define R_T4   'd12
`define R_T5   'd13
`define R_T6   'd14
`define R_T7   'd15
`define R_S0   'd16
`define R_S1   'd17
`define R_S2   'd18
`define R_S3   'd19
`define R_S4   'd20
`define R_S5   'd21
`define R_S6   'd22
`define R_S7   'd23
`define R_T8   'd24
`define R_T9   'd25
`define R_K0   'd26
`define R_K1   'd27
`define R_GP   'd28
`define R_SP   'd29
`define R_FP   'd30
`define R_RA   'd31

// Coprocessor 0 register mnemonics
`define CR_EPC      'd14
`define CR_BADVADDR 'd8
`define CR_STATUS   'd12
`define CR_CAUSE    'd13


////
//// Exception Codes
////

// Left shift amount to align exception code from cause register
`define EX__SHIFT 'd2
// Mask to extract exception code from CAUSE register
`define EX__MASK  32'h0000007c

// Exception codes
`define EX_INT    5'd0
`define EX_MOD    5'd1
`define EX_TLBL   5'd2
`define EX_TLBS   5'd3
`define EX_ADEL   5'd4
`define EX_ADES   5'd5
`define EX_IBE    5'd6
`define EX_DBE    5'd7
`define EX_SYS    5'd8
`define EX_BP     5'd9
`define EX_RI     5'd10
`define EX_CPU    5'd11
`define EX_OV     5'd12
`define EX_TR     5'd13
`define EX_VCEI   5'd14
`define EX_FPE    5'd15
`define EX_WATCH  5'd23
`define EX_VCED   5'd31


////
//// MIPS447 constants
////

// System calls
`define SYS_EXIT         32'h0a

// Messages
`define MSG_UNCLASS     'h0
`define MSG_UNCLASS_S   "[0x%h]"
`define MSG_EOP         'h1
`define MSG_EOP_S       "[End of program at 0x%h]"
`define MSG_SWDUMP      'h3
`define MSG_SWDUMP_S    "[Program register dump at 0x%h]"

`define MSG_EXCPT       'h10
`define MSG_EXCPT_S     "[Exception at %h]"
`define MSG_ADEL        'h11
`define MSG_ADEL_S      "[Address error exception on load at 0x%h]"
`define MSG_ADES        'h12
`define MSG_ADES_S      "[Address error exception on store at 0x%h]"
`define MSG_IBE         'h13
`define MSG_IBE_S       "[Instruction bus error exception at 0x%h]"
`define MSG_DBE         'h14
`define MSG_DBE_S       "[Data bus error exception at 0x%h]"
`define MSG_BP          'h15
`define MSG_BP_S        "[Breakpoint exception at 0x%h]"
`define MSG_RI          'h16
`define MSG_RI_S        "[Reserved instruction exception at 0x%h]"
`define MSG_CPU 	'h17
`define MSG_CPU_S	"[Coprocessor unusable exception at 0x%h]"
`define MSG_OV          'h18
`define MSG_OV_S        "[Arithmetic overflow exception at 0x%h]"

////
//// Multiply unit opcodes
////

`define MUL_MFHI    3'h0
`define MUL_MTHI    3'h1
`define MUL_MFLO    3'h2
`define MUL_MTLO    3'h3
`define MUL_MULT    3'h4
`define MUL_MULTU   3'h5
`define MUL_DIV     3'h6
`define MUL_DIVU    3'h7
