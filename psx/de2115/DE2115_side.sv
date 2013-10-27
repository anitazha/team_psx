
module DE2115_side(
				   input logic clk, rst,
				   input logic com_clk, com_req,
				   inout [5:0] com_channel,
				   output logic [31:0] data,
				   output logic data_rdy);

   /* Parameters */
   localparam CMD_LED     = 32'h1;
   localparam CMD_CNTRL1  = 32'h2;
   localparam CMD_CNTRL2  = 32'h4;
   localparam CMD_DISPLAY = 32'h8;

   /* Internal Lines */
   logic [5:0] 			 com_channel_temp;
   logic [5:0] 			 com_count, com_count_next;
   logic [31:0] 		 hold_reg, hold_reg_next;
   logic 				 hold_reg_v, hold_reg_v_next;
   logic 				 data_got;
   
   enum logic [2:0] {WAIT, GETCMD, GETDATA, SENDDATA} com_state, com_state_next;

   assign com_channel = com_channel_temp;
   
   /* Receiver FSM */
   always_ff @(negedge com_clk, posedge rst) begin
	  if (rst) begin
		 com_state <= WAIT;
		 com_count <= 6'b0;
	  end
	  else begin
		 com_state <= com_state_next;
		 com_count <= com_count_next;
	  end
   end

   /* Next state + output logic */
   always_comb begin
	  /* Defaults */
	  com_state_next = com_state;
	  com_count_next = com_count;

	  com_channel_temp = 6'bz;

	  hold_reg_next = hold_reg;
	  hold_reg_v_next = hold_reg_v;

	  case (com_state)
		WAIT: begin
		   com_count_next = 6'd0;
		   if (com_req) begin
			  com_state_next = GETCMD;
		   end
		end
		GETCMD: begin
		   if ((com_channel == CMD_CNTRL1) |
			   (com_channel == CMD_CNTRL2)) begin
			  com_channel_temp = 6'h2A;
			  com_count_next = com_count + 6'd6;
			  com_state_next = SENDDATA;
		   end
		   else begin
			  com_state_next = GETDATA;
		   end
		end // case: GETCMD
		GETDATA: begin
		   hold_reg_next[(com_count + 6'd5)] = com_channel[5];
		   hold_reg_next[(com_count + 6'd4)] = com_channel[4];
		   hold_reg_next[(com_count + 6'd3)] = com_channel[3];
		   hold_reg_next[(com_count + 6'd2)] = com_channel[2];
		   hold_reg_next[(com_count + 6'd1)] = com_channel[1];
		   hold_reg_next[(com_count + 6'd0)] = com_channel[0];

		   com_count_next = com_count + 6'd6;
		   if (com_count_next == 6'd36) begin
			  com_state_next = WAIT;
			  hold_reg_v_next = 1'b1;
		   end
		end
		   
		   
	  endcase // case (com_state)
   end // always_comb begin

   /* Hold Register */
   always_ff @(negedge com_clk, posedge rst) begin
	  if (rst) begin
		 hold_reg <= 32'd0;
		 hold_reg_v <= 1'b0;
	  end
	  else begin
		 hold_reg <= hold_reg_next;
		 if (data_got) begin
			hold_reg_v <= 1'b0;
		 end
		 else begin
			hold_reg_v <= hold_reg_v_next;
		 end
	  end
   end // always_ff @ (negedge com_clk, posedge rst)

   /* Output register */
   always_ff @(posedge clk, posedge rst) begin
	  if (rst) begin
		 data <= 32'd0;
		 data_rdy <= 1'b0;
		 data_got <= 1'b0;
	  end
	  else begin
		 if (hold_reg_v) begin
			data <= hold_reg;
			data_rdy <= 1'b1;
			data_got <= 1'b1;
		 end
		 else if (~hold_reg_v) begin
			data_got <= 1'b0;
			data_rdy <= 1'b0;
		 end
	  end // else: !if(rst)
   end // always_ff @ (posedge clk, posedge rst)

endmodule // DE2115_side
