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

`include "mips_defines.vh"

module exception_unit(/*AUTOARG*/
   // Outputs
   exception_halt, load_ex_regs, load_bva, cause, load_bva_sel,
   // Inputs
   pc, IBE, DBE, RI, Ov, BP, AdEL_inst, AdEL_data, AdES, CpU, clk,
   rst_b
   );

	output wire      exception_halt, load_ex_regs, load_bva;
	output reg [4:0] cause;
	output wire      load_bva_sel;
	input     [31:0] pc;
	input            IBE, DBE, RI, Ov, BP, AdEL_inst, AdEL_data, AdES, CpU;
	input            clk, rst_b;

	assign exception_halt = rst_b && (AdEL_inst || IBE);
	
	assign load_ex_regs = rst_b && (IBE || DBE || RI || Ov || BP || AdEL_inst ||
	                                AdEL_data || AdES || CpU);
	
	assign load_bva = rst_b && (AdEL_inst || AdEL_data || AdES || IBE || DBE);
	assign load_bva_sel = AdEL_data || AdES || DBE;

	always @(*) begin
		cause = 0;
		
		case (1'b1)
		AdEL_inst: cause = `EX_ADEL;
		AdEL_data: cause = `EX_ADEL;
		AdES:      cause = `EX_ADES;
		IBE:       cause = `EX_IBE;
		DBE:       cause = `EX_DBE;
		CpU:       cause = `EX_CPU;
		RI:        cause = `EX_RI;
		Ov:        cause = `EX_OV;
		BP:        cause = `EX_BP;
		endcase
	end

	// synthesis translate_off
	always @(posedge clk or negedge rst_b) begin
		if (rst_b) begin
			// Address errors take priority over bus errors.
			// Coprocessor exceptions take priority over reserved instruction
			//   exceptions.
			// Instruction bus/address errors are fatal.
			if(AdEL_inst == 1'b1)
				$display(`MSG_ADEL_S, pc);
			else if(AdEL_data == 1'b1)
				$display(`MSG_ADEL_S, pc);
			else if(AdES == 1'b1)
				$display(`MSG_ADES_S, pc);
			else if(IBE == 1'b1)
				$display(`MSG_IBE_S, pc);
			else if(DBE == 1'b1)
				$display(`MSG_DBE_S, pc);
			else if(CpU == 1'b1)
				$display(`MSG_CPU_S, pc);
			else if(RI == 1'b1)
				$display(`MSG_RI_S, pc);
			else if(Ov == 1'b1)
				$display(`MSG_OV_S, pc);
			else if(BP == 1'b1)
				$display(`MSG_BP_S, pc);
		end
	end
	// synthesis translate_on

endmodule
