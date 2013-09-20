/* 18545 Fall 2013
 * Team PSX
 * 09-20-2013
 *
 * @MODULES:
 * hdmi_test_feeder
 * hdmi_test_sender
 * 
 * @DESCRIPTION:
 * HDMI test interface; sends test data to the HDMI video and audio modules
 * to see if they can properly send the data to the ADV7511
 *
 * @AUTHOR:
 * Michael Rosen
 * mrrosen
 *
 */


/* @MODULE: hdmi_test_feeder
 * @DESCRIPTION:
 * Main feeder module
 */
module hdmi_test_feeder(
			input bit 	  clk, rst,
			input bit 	  video_rdy, audio_rdy,
			output bit [15:0] audio_out,
			output bit [23:0] video_out,
			output bit 	  audio_valid, video_valid);

   /* Internal Lines */
   bit [31:0] 				  audio_addr;
   
   
   hdmi_test_sender #(32) audio_sender(.addr(audio_addr),
				       .valid(audio_valid),
				       .rdy(audio_rdy),
				       .*);

   /* Memories */
   bit [15:0] 				  audio_mem[32'hFFFFFFFF];
   assign audio_out = audio_mem[audio_addr];

   initial $readmemh("audio_mem.hex", audio_mem);

endmodule // hdmi_test_feeder


/* @MODULE: hdmi_test_sender
 * @DESCRIPTION:
 * The FSM which controls sending of data
 */
module hdmi_test_sender(
			input bit 		   clk, rst,
			input bit 		   rdy,
			output bit [ADDR_SIZE-1:0] addr,
			output bit 		   valid);

   /* Parameters */
   parameter ADDR_SIZE 8'd32;

   /* Internal Lines */
   enum {SEND, WAIT}			   state, next_state;

   /* State register */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 state <= WAIT;
      end
      else begin
	 state <= next_state;
      end
   end

   /* Address counter */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 addr <= 'd0;
      end
      else begin
	 if (rdy & (state == WAIT)) begin
	    addr <= addr + 'd1;
	 end
      end
   end

   /* Next state logic */
   always_comb begin
      /* Defaults */
      next_state = state;

      case (state)
	WAIT: begin
	   if (rdy) begin
	      next_state = state;
	   end
	end
	SEND: begin
	   next_state = state;
	end
      endcase // case (state)
   end // always_comb

   /* Ouput logic */
   always_comb begin
      /* Defaults */
      valid = 1'b0;

      if (state == SEND) begin
	 valid = 1'b1;
      end
   end

endmodule // hdmi_test_sender

      
      
      


/* @COMMENTING COMPLETE; EOF */
