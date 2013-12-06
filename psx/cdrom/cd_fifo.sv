
module fifo8x16(
		input logic 	    clk, rst,
		input logic 	    we, re_8, re_16, clr,
		input logic [7:0]   data_in,
		output logic [16:0] data_out,
		output logic 	    full, empty);
   
   /* Interal lines */
   logic [3:0] 			    queue_read, queue_read_next;
   logic [4:0] 			    queue_write, queue_write_next;
   
   logic [15:0][7:0] 		    queue, queue_next;

   /* Queue hold register */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 queue <= 'd0;
	 queue_read <= 'd0;
	 queue_write <= 'd0;
      end
      else begin
	 queue <= queue_next;
	 queue_read <= queue_read_next;
	 queue_write <= queue_write_next;
      end
   end // always_ff @

   /* Queue logic */
   always_comb begin
      /* Defaults */
      queue_next = queue;

      queue_read_next = queue_read;
      queue_write_next = queue_write;

      if (clr) begin
	 queue_read_next = 4'd0;
	 queue_write_next = 5'd0;
	 queue_next = 'd0;
      end
      else begin
	 if (re_8) begin
	    queue_read_next = queue_read + 4'd1;
	 end
	 else if (re_16) begin
	    queue_read_next = queue_read + 4'd2;
	 end
	 else if (we) begin
	    queue_next[queue_write] = data_in;
	    queue_write_next = queue_write + 5'd1;
	 end
      end // else: !if(clr)
   end // always_comb

   /* Output logic */
   assign data_out = {queue[queue_read + 4'd1], queue[queue_read]};
   assign full = queue_write[4];
   assign empty = ~|queue_write;

endmodule // fifo8x16
