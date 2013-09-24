/* 18545 Fall 2013
 * Team PSX
 * 09-17-2013
 *
 * @MODULES:
 * spdif
 * bmc
 * 
 * @DESCRIPTION:
 * Implements the S/P DIF protocol used by the ADV7511 Chip on the VC707 board.
 * This is the standard for audio input for the HDMI port.
 *
 * @AUTHOR:
 * Michael Rosen
 * mrrosen
 *
 */



/* @MODULE: spdif
 * @DESCRIPTION:
 * Main S/P DIF Module
 */
module spdif(
	     input bit 	      clk, rst,
	     input bit [15:0] data,
	     input bit 	      valid,
	     output bit       SPDIF_OUT, rdy);

   /* Parameters */
   parameter PREAMBLE_B_0 = 8'hE8;
   parameter PREAMBLE_B_1 = 8'h17;
   parameter PREAMBLE_M_0 = 8'hE2;
   parameter PREAMBLE_M_1 = 8'h1D;
   parameter PREAMBLE_W_0 = 8'hE4;
   parameter PREAMBLE_W_1 = 8'h1B;

   /* Internal Lines */
   bit 					  clk_5_6MHz;
   bit [4:0] 			  clk_counter;
  
   bit 					  capture_valid, clr_capture;
   bit [15:0] 			  capture_data;
   
   bit [37:0] 		      stored_data;
   bit [5:0] 		      stored_bits;
   bit 					  second_part, parity;
   
   bit 					  preamble, right_channel;
   bit [7:0] 			  preamble_bits;
   
   bit [8:0] 		      subframe_count;

   bit 					  bcm_out;

   /* Clock Generator */
   always_ff @(posedge clk, posedge rst) begin
	  if (rst) begin
		 clk_5_6MHz <= 1'b0;
		 clk_counter <= 5'd0;
	  end
	  else begin
		 if (clk_counter == 5'd17) begin
			clk_counter <= 5'd0;
			clk_5_6MHz <= ~clk_5_6MHz;
		 end
		 else begin
			clk_counter <= clk_counter + 5'd1;
		 end
	  end // else: !if(rst)
   end // always_ff @ (posedge clk, posedge rst)

   /* Capture Data Register */
   always_ff @(posedge clk, posedge rst) begin
	  if (rst) begin
		 capture_data <= 16'd0;
		 capture_valid <= 16'd0;
		 rdy <= 1'b1;
	  end
	  else begin
		if (valid) begin
		   capture_data <= data;
		   capture_valid <= 1'b1;
		   rdy <= 1'b0;
		end
		else if (clr_capture) begin
		   capture_data <= 16'b0;
		   capture_valid <= 1'b0;
		end
		else if (~capture_valid & (stored_bits == 5'b0)) begin
		   rdy <= 1'b1;
		end
	  end
   end
   
   /* Data storage register */
   always_ff @(posedge clk_5_6MHz, posedge rst) begin
      if (rst) begin
		 stored_data <= 38'b0;
		 stored_bits <= 6'b0;
		 second_part <= 1'b0;
		 parity <= 1'b0;
		 preamble <= 1'b0;
		 right_channel <= 1'b0;
		 clr_capture <= 1'b0;
      end
      else begin
	 if (capture_valid) begin
	    stored_data <= {preamble_bits, 10'b0, capture_data, 3'b0, ^capture_data};
	    stored_bits <= 6'd37;
	    parity <= ^capture_data;
		preamble <= 1'b1;
		right_channel <= ~right_channel;
	    clr_capture <= 1'b1;
	 end
	 else if (stored_bits != 6'b0) begin
	    second_part <= ~second_part;
		
	    if (preamble | second_part) begin
	       stored_data <= {stored_data[36:0], 1'b0};
	       stored_bits <= stored_bits - 5'd1;
	    end

		if (stored_bits == 6'd30) begin
		   preamble <= 1'b0;
		   clr_capture <= 1'b0;
		end
	 end
      end
   end

   /* Preamble logic */
   always_comb begin
      /* Defaults */
      preamble_bits = PREAMBLE_B_0;
      
      if (subframe_count == 10'b0) begin
	 if (parity) begin
	    preamble_bits = PREAMBLE_B_1;
	 end
	 else begin
	    preamble_bits = PREAMBLE_B_0;
	 end
      end
      else if (right_channel) begin
	 if (parity) begin
	    preamble_bits = PREAMBLE_W_1;
	 end
	 else begin
	    preamble_bits = PREAMBLE_W_0;
	 end
      end
      else begin
	 if (parity) begin
	    preamble_bits = PREAMBLE_M_1;
         end
         else begin
	    preamble_bits = PREAMBLE_M_0;
         end
      end // else: !if(right_channel)
   end // always_comb
   
   /* Subframe Count register */
   always @(posedge clk_5_6MHz, posedge rst) begin
      if (rst) begin
	 subframe_count <= 9'b0;
      end
      else begin
	 if ((stored_bits == 6'd1) & second_part) begin
	    if (subframe_count < 9'd383) begin
	       subframe_count <= subframe_count + 9'd1;
	    end
	    else begin
	       subframe_count <= 9'd0;
	    end
	 end
      end // else: !if(rst)
   end // always @ (posedge clk, posedge rst)
   
   /* Performs BCM (Biphase Mark Code) on the data before transmission */
   bmc bmc0(.data(stored_data[37]),
	    .valid(~preamble & (stored_bits > 6'd0)),
			.start((stored_bits == 6'd30)),
	    .*);

   assign SPDIF_OUT = (preamble) ? stored_data[37] : bcm_out;
   
endmodule // spdif


/* @MODULE: bmc
 * @DESCRIPTION:
 * Biphase Mark Codes the incoming data as long as valid is asserted
 */
module bmc(
	   input bit  clk_5_6MHz, rst,
	   input bit  data, valid, start,
	   output bit bcm_out);

   /* Part indicates whether its the second half of the bit in data */
   bit 		      second_part;
   
   always_ff @(posedge clk_5_6MHz, posedge rst) begin
      if (rst) begin
		 bcm_out <= 1'b0;
		 second_part <= 1'b0;
      end
      else begin
		 /* Start BCM on opposite if last preamble bit */
		 if (start) begin
			second_part <= 1'b1;
			if (data) begin
			   bcm_out <= 1'b0;
			end
			else begin
			   bcm_out <= 1'b1;
			end
		 end
		 /* If the data on the line is valid, run the machine
	      otherwise, hold the current state */
		 else if (valid) begin
			second_part <= ~second_part;
			
			if (~second_part | data) begin
			   bcm_out <= ~bcm_out;
			end
		 end
      end // else: !if(rst)
   end // always_ff @

endmodule // bcm


/* @COMMENTING COMPLETE; EOF */
