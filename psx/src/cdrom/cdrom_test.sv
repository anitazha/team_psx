module top(
	   input logic 	       CLOCK_50,
	   input logic [3:0]   KEY,
	   input logic [17:0]  SW,
	   inout logic [34:0] GPIO,
	   output logic [17:0] LEDR);
	   
	   
	   /* Internal lines */
	   
	   logic [7:0] RASPI_DATA;
	   logic [3:0] RASPI_CMD;
	   logic RASPI_ACK, RASPI_EN;
	   logic RASPI_CLK;
	   
	   logic clk, rst;
	   logic to_addr0, to_addr1, to_addr2, to_addr3;
	   logic addr0_re, addr1_re, addr2_re, addr3_re;
	   logic [7:0] CD_addr0_in, CD_addr1_in, CD_addr2_in, CD_addr3_in;
	   logic [15:0] CD_addr0_out, CD_addr1_out, CD_addr2_out, CD_addr3_out;
	   
	   enum logic [2:0] {START, SEND1, DONE} state, state_next;
	   
	   assign RASPI_DATA = GPIO[7:0];
	   assign GPIO[13:10] = RASPI_CMD;
	   assign GPIO[14] = RASPI_CLK;
	   assign GPIO[9] = RASPI_EN;
	   assign RASPI_ACK = GPIO[8];
	   
	   
	   assign rst = ~KEY[0];
	   
	   assign LDER[17:15] = state;
	   assign LEDR[7:0] = ((SW[1]) ? ((SW[0]) ? CD_addr3_out : CD_addr2_out) :
		                             ((SW[0]) ? CD_addr1_out : CD_addr0_out));
	   cdrom cd(.*);
	 
	   
	   /* Command Simulator */
	   always_ff @(posedge clk, posedge rst) begin
	   if (rst) begin
	   state <= START;
	   end
	   else begin
	   state <= state_next;
	   end
	   
	   always_comb begin
	   state_next = state;
	   
	   to_addr0 = 1'b0;
	   to_addr1 = 1'b0;
	   to_addr2 = 1'b0;
	   to_addr3 = 1'b0;
	   
	   addr0_re = 1'b0;
	   addr1_re = 1'b0;
	   addr2_re = 1'b0;
	   addr3_re = 1'b0;
	   
	   case (state)
	   START: begin
	   if (~KEY[2]) begin
	   state_next = SEND1;
	   end
	   end
	   SEND1: begin
	   to_addr0 = 1'b1;
	   CD_addr0_in = 8'h6;
	   state_next = DONE;
	   end
	   DONE: begin
	   end
	   endcase
	   end
endmodule