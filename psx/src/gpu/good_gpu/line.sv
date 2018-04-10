`default_nettype none

module line_finder(
		   input wire [15:0]  x0, y0, x1, y1,
		   input wire [15:0]  x, y,
		   output logic [1:0] result);

   /* Internal Lines */
   wire [31:0] 			      mult_x, mult_y;
   wire [31:0] 			      det, abs_det;
   wire [15:0] 			      dx, dy, abs_dx, abs_dy;
   wire [15:0] 			      max_x, max_y, min_x, min_y;
   wire [15:0] 			      mid_x, mid_y;
   wire [15:0] 			      max_abs_dxy;
   
   /* Line position logic/calculations */
   assign dx = x1 - x0;
   assign dy = y1 - y0;
   assign max_x = (x1 > x0) ? x1 : x0;
   assign max_y = (y1 > y0) ? y1 : y0;
   assign min_x = (x1 > x0) ? x0 : x1;
   assign min_y = (y1 > y0) ? y0 : y1;
   assign mid_x = ((max_x - min_x) >> 'd1) + min_x;
   assign mid_y = ((max_y - min_y) >> 'd1) + min_y;
   
   assign abs_dx = (y1 > y0) ? y1 - y0 : y0 - y1;
   assign abs_dy = (x1 > x0) ? x1 - x0 : x0 - x1;
   assign max_abs_dxy = (abs_dx > abs_dy) ? abs_dx : abs_dy;
   
   assign mult_x = ({16'b0, y0} - {16'b0, y1}) * ({16'b0, x} - {16'b0, x1});
   assign mult_y = ({16'b0, x0} - {16'b0, x1}) * ({16'b0, y} - {16'b0, y1});

   assign det = mult_y - mult_x;
   assign abs_det = (det[31]) ? ~det + 32'd1 : det;

   /* Final result logic */
   always_comb begin
      /* Defaults */
      /* Result is above or below the line based on sign of det */
      result = {det[31], 1'b1};

      if (abs_det < ((max_abs_dxy >> 'd1) + {15'b0, max_abs_dxy[0]})) begin
	 result = 2'b0;
      end
      else if (abs_det == (max_abs_dxy >> 'd1)) begin
	 /* If line is shallow */
	 if (abs_dx < abs_dy) begin
	    /* Line runs from origin (ish) */
	    if (dx[15] == dy[15]) begin
	       if ((x <= mid_x) & (y <= mid_y) & det[31]) begin
		  result = 2'b0;
	       end
	       else if ((x >= mid_x) & (y >= mid_y) & ~det[31]) begin
		  result = 2'b0;
	       end
	    end
	    else begin
	       if ((x <= mid_x) & (y >= mid_y) & det[31]) begin
		  result = 2'b0;
	       end
	       else if ((x >= mid_x) & (y <= mid_y) & ~det[31]) begin
		  result = 2'b0;
	       end
	    end // else: !if({x1 - x0}[15] == {y1 - y0}[15])
	 end // if (abs_dx < abs_dy)
	 else begin
	    /* The line is steep */
	    if (dx[15] == dy[15]) begin
	       if ((x <= mid_x) & (y <= mid_y) & ~det[31]) begin
		  result = 2'b0;
	       end
	       else if ((x >= mid_x) & (y >= mid_y) & det[31]) begin
		  result = 2'b0;
	       end
	    end
	    else begin
	       if ((x <= mid_x) & (y >= mid_y) & ~det[31]) begin
		  result = 2'b0;
	       end
	       else if ((x >= mid_x) & (y <= mid_y) & det[31]) begin
		  result = 2'b0;
	       end
	    end // else: !if(dx[15] == dy[15])
	 end // else: !if(abs_dx < abs_dy)
      end
   end // always_comb
      
endmodule // line_finder
