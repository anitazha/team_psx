/* Multiplier unit for 18-447 MIPS
 * Not for pipelined synthesis
 * Author: Joshua Wise (jwise)
 *
 * Does not support division!
 */

module multiply_coprocessor(/*AUTOARG*/
   // Outputs
   mul__rd_data,
   // Inputs
   clk, rst_b, mul__opcode, mul__active, rt_data, rs_data
   );

	input              clk, rst_b;
	input        [2:0] mul__opcode;
	input              mul__active;
	input       [31:0] rt_data, rs_data;
	output reg  [31:0] mul__rd_data;
	
	reg [31:0] lo = 31'h0, hi = 31'h0;
	
	always @(posedge clk or negedge rst_b) begin
		if (!rst_b) begin
			lo <= 31'h0;
			hi <= 31'h0;
		end else begin
			case ({mul__active, mul__opcode})
			{1'b1,`MUL_MTHI}: hi <= rs_data;
			{1'b1,`MUL_MTLO}: lo <= rs_data;
			{1'b1,`MUL_MULT}: {hi, lo} <= {{32{rs_data[31]}},rs_data} * {{32{rt_data[31]}},rt_data};
			{1'b1,`MUL_MULTU}: {hi, lo} <= {32'h0,rs_data} * {32'h0,rt_data};
			{1'b1,`MUL_DIV},{1'b1,`MUL_DIVU}: begin
				{hi,lo} <= 64'hDEAD_BEEF_FEED_FACE;
				// synthesis translate_off
				$display("*W,multiplier: Divide is not supported!  Bailing out now.");
				$finish;
				// synthesis translate_on
			end
			endcase
		end
	end
	
	always @(*) begin
		mul__rd_data = {32{1'hx}};
		case (mul__opcode)
		`MUL_MFHI: mul__rd_data = hi;
		`MUL_MFLO: mul__rd_data = lo;
		endcase
	end	
endmodule
