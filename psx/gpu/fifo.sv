
module fifo_16x32(
		  input wire 	    clk, rst,
		  input wire [31:0] data_in,
		  input wire 	    re, we,
		  output reg 	    full, empty,
		  output reg [31:0] data_out);

   /* Internal Lines */
   reg [15:0][31:0] 		    queue;
   reg [4:0] 			    queue_end;

   /* Queue storage */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 queue <= 'd0;
	 queue_end <= 5
      end
      else begin
	 if (re) begin
	    queue <= queue << 'd32;
	    queue_end <= queue_end - 'd1;
	 end
	 if (we) begin
	    queue[queue_end] <= data_in;
	    queue_end <= queue_end + 'd1;
	 end
      end // else: !if(rst)
   end // always_ff @

   /* Full/empty logic */
   assign full = (queue_end == 'd16);
   assign empty = (queue_end == 'd0);

endmodule // fifo_16x32
