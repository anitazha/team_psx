

module triangle_fill(
		     input wire [15:0] x0, y0, x1, y1, x2, y2,
		     input wire [15:0] x, y,
		     input wire [1:0]  side0, side1, side2,
		     output reg        in);

   /* Interal lines */
   wire [1:0] 			  res_01, res_12, res_20;
   wire [15:0] 			  min_x01, min_y01, max_x01, max_y01;
   wire [15:0] 			  min_x12, min_y12, max_x12, max_y12;
   wire [15:0] 			  min_x20, min_y20, max_x20, max_y20;
   
   /* Line checkers */
   line_finder lf01(.x0(x0), .y0(y0),
		    .x1(x1), .y1(y1),
		    .result(res_01),
		    .*),
     lf12(.x0(x1), .y0(y1),
	  .x1(x2), .y1(y2),
	  .result(res_12),
	  .*),
     lf20(.x0(x0), .y0(y0),
	  .x1(x2), .y1(y2),
	  .result(res_20),
	  .*);

   /* Determine line end points */
   assign min_x01 = (x0 > x1) ? x1 : x0;
   assign min_y01 = (y0 > y1) ? y1 : y0;
   assign max_x01 = (x0 > x1) ? x0 : x1;
   assign max_y01 = (y0 > y1) ? y0 : y1;
   
   assign min_x12 = (x2 > x1) ? x1 : x2;
   assign min_y12 = (y2 > y1) ? y1 : y2;
   assign max_x12 = (x2 > x1) ? x2 : x1;
   assign max_y12 = (y2 > y1) ? y2 : y1;
   
   assign min_x20 = (x0 > x2) ? x2 : x0;
   assign min_y20 = (y0 > y2) ? y2 : y0;
   assign max_x20 = (x0 > x2) ? x0 : x2;
   assign max_y20 = (y0 > y2) ? y0 : y2;
   

   /* Inside Triangle logic */
   always_comb begin
      /* Defaults */
      in = 1'b0;

      /* If on any lines (but within the x,ys for those lines), 
         its inside */
      if (((res_01 == 2'b0) & 
	   (x <= max_x01) & (y <= max_y01) & (x >= min_x01) & (y >= min_y01)) |
	  ((res_12 == 2'b0) &
	   (x <= max_x12) & (y <= max_y12) & (x >= min_x12) & (y >= min_y12)) |
	  ((res_20 == 2'b0) &
	   (x <= max_x20) & (y <= max_y20) & (x >= min_x20) & (y >= min_y20))) begin
	 in = 1'b1;
      end

      /* Check if point is on same side of each line */
      if ((res_01 == side2) &
	  (res_12 == side0) &
	  (res_20 == side1)) begin
	 in = 1'b1;
      end
   end // always_comb

endmodule // triangle_fill
