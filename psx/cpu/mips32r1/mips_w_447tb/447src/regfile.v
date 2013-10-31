/*
 * Redistributions of any form whatsoever must retain and/or include the
 * following acknowledgment, notices and disclaimer:
 *
 * This product includes software developed by Carnegie Mellon University. 
 *
 * Copyright (c) 2008 James C. Hoe,
 * Computer Architecture Lab at Carnegie Mellon (CALCM), 
 * Carnegie Mellon University.
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
 */

module regfile (/*AUTOARG*/
   // Outputs
   rs_data, rt_data,
   // Inputs
   rs_num, rt_num, rd_num, rd_data, rd_we, clk, rst_b, halted
   );
	input       [4:0]  rs_num, rt_num, rd_num; 
	input       [31:0] rd_data;
	input              rd_we, clk, rst_b, halted;
	output wire [31:0] rs_data, rt_data;

	reg         [31:0] mem[0:31];
	integer            i;

	always @(posedge clk or negedge rst_b) begin 
		if (!rst_b) begin
			for (i = 0; i < 32; i = i+1)
				mem[i] <= 32'b0;
		end else if (rd_we && (rd_num != 0)) begin 
			mem[rd_num] <= rd_data; 
		end 
	end 

	assign rs_data = (rs_num == 0) ? 32'h0 : mem[rs_num];
	assign rt_data = (rt_num == 0) ? 32'h0 : mem[rt_num];
	
	// synthesis translate_off
	integer fd;
	always @(halted) begin
		if (rst_b && halted) begin
			fd = $fopen("regdump.txt");

			$display("--- 18-447 Register file dump ---");
			$display("=== Simulation Cycle %d ===", $time);
			
			$fdisplay(fd, "--- 18-447 Register file dump ---");
			$fdisplay(fd, "=== Simulation Cycle %d ===", $time);
			
			for(i = 0; i < 32; i = i+1) begin
				$display("R%d\t= 0x%8x\t( %0d )", i, mem[i], mem[i]);
				$fdisplay(fd, "R%d\t= 0x%8h\t( %0d )", i, mem[i], mem[i]); 
			end
			
			$display("--- End register file dump ---");
			$fdisplay(fd, "--- End register file dump ---");
			
			$fclose(fd);
		end
	end
	// synthesis translate_on

endmodule

