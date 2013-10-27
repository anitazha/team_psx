

module interp(
	      input wire [11:0]  x0, y0, x1, y1, x2, y2,
	      input wire [11:0]  s0, s1, s2,
	      output wire [23:0] cx, cy, cs);
   
   /* Internal lines */
   wire [63:0] 			 x0_64, y0_64, x1_64, y1_64, x2_64, y2_64;
   wire [63:0] 			 s0_64, s1_64, s2_64;
   
   wire [63:0] 			 det;
   wire [63:0] 			 ndiv_cx, ndiv_cy;
   wire [63:0] 			 part1, part2, part3;
   wire [63:0] 			 ndiv_cs;
   
   wire [71:0] 			 r_cx, r_cy, r_cs;
   

   /* Expand inputs to 64-bits */
   assign x0_64 = {52'b0, x0};
   assign y0_64 = {52'b0, y0};
   assign x1_64 = {52'b0, x1};
   assign y1_64 = {52'b0, y1};
   assign x2_64 = {52'b0, x2};
   assign y2_64 = {52'b0, y2};
   assign s0_64 = {52'b0, s0};
   assign s1_64 = {52'b0, s1};
   assign s2_64 = {52'b0, s2};
   
   /* Determinant */
   assign det = x0_64 * (y1_64 - y2_64) + x1_64 * (y2_64 - y0_64) + x2_64 * (y_64 - y1_64);

   /* Non-div c's */
   always_comb begin
      /* Defaults */
      ndiv_cx = s0_64 * (y2_64 - y1_64) + s1_64 * (y2_64 - y0_64) + s2_64 * (y0_64 - y1_64);
      ndiv_cy = s0_64 * (x2_64 - x1_64) + s1_64 * (x0_64 - x2_64) + s2_64 * (x1_64 - x0_64);
      
      part1 = x1_64 * y2_64 - x2_64 * y1_64;
      part2 = x2_64 * y0_64 - x0_64 * y2_64;
      part3 = x0_64 * y1_64 - x1_64 * y0_64;

      ndiv_cs = s0_64 * part1 + s1_64 * part2 + s2_64 * part3;
   end // always_comb

   /* Do the divsion... */
   assign r_cx = {ndiv_cx, 8'b0} / det;
   assign r_cy = {ndiv_cy, 8'b0} / det;
   assign r_cs = {ndiv_cs, 8'b0} / det;

   assign cx = r_cx[26:2];
   assign cy = r_cy[26:2];
   assign cs = r_cs[26:2];
   
endmodule // interp

