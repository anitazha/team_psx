
module fifo_16x32(
		  input logic 	    clk, rst,
		  input logic [31:0] data_in,
		  input logic 	    re, we, clr,
		  output logic 	    full, empty,
		  output logic [31:0] data_out);
   
   /* Internal Lines */
   logic [15:0][31:0] 		    queue, queue_new;
   logic [4:0] 			    queue_end, queue_end_new;
	
   /* Queue storage */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 queue <= 'd0;
	 queue_end <= 'd0;
      end
      else begin
	 queue <= queue_new;
	 queue_end <= queue_end_new;
      end
   end // always_ff @
   
   /* Queue logic */
   always_comb begin
      /* Defaults */
      data_out = queue[0];
      full = queue_end[4];
      empty = ~(|(queue_end));
      
      queue_new = queue;
      queue_end_new = queue_end;
      
      if (clr) begin
			queue_new = 'd0;
			queue_end_new = 'd0;
      end
      else if (re & we) begin
			queue_new[queue_end] = data_in;
			queue_new = {32'd0, queue_new[15:1]};
      end
      else if (re) begin
			queue_new = {32'd0, queue_new[15:1]};
			queue_end_new -= 'b1;
      end
      else if (we) begin
			queue_new[queue_end] = data_in;
			queue_end_new += 'b1;
      end
   end
   
endmodule // fifo_16x32
