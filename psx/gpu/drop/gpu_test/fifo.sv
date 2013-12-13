
module fifo_16x32(
		  input wire 	    clk, rst,
		  input wire [31:0] data_in,
		  input wire 	    re, we, clr,
		  output reg 	    full, empty,
		  output reg [31:0] data_out);

   /* Internal Lines */
   reg [15:0][31:0] 		    queue, queue_new;
   reg [4:0] 			    queue_end, queue_end_new;

   /* Queue storage */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 queue <= 'd0;
	 queue_end <= 5'd0;
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

	  queue_new = queue;
	  queue_end_new = queue_end;
	  
	  if (clr) begin
		 queue_new = 'd0;
		 queue_end_new = 5'd0;
	  end
	  else if (re & we) begin
		 queue_new[queue_end] = data_in;
		 queue_new = queue_new >> 'd32;
	  end
	  else if (re) begin
		 queue_new = queue >> 'd32;
		 queue_end_new = queue_end - 5'd1;
	  end
	  else if (we) begin
		 queue_new[queue_end] = data_in;
		 queue_end_new = queue_end + 5'd1;
	  end
   end
   
   /* Full/empty logic */
   assign full = (queue_end == 'd16);
   assign empty = (queue_end == 'd0);
   
endmodule // fifo_16x32
