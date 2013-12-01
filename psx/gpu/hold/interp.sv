

module interp(
	      input logic [11:0]  x0, y0, x1, y1, x2, y2,
	      input logic [11:0]  s0, s1, s2,
	      output logic [63:0] cx, cy, cs);
   
   /* Internal lines */
   logic [63:0] 		  x0_64, y0_64, x1_64, y1_64, x2_64, y2_64;
   logic [63:0] 		  s0_64, s1_64, s2_64;
   
   logic [63:0] 		  det;
   logic [63:0] 		  ndiv_cx, ndiv_cy;
   logic [63:0] 		  part1, part2, part3;
   logic [63:0] 		  ndiv_cs;
   logic [63:0] 		  abs_ndiv_cx, abs_ndiv_cy, abs_ndiv_cs;
   logic [63:0] 		  abs_det;
   
   logic [127:0] 		  r_cx, r_cy, r_cs;
   logic [63:0] 		  abs_cx, abs_cy, abs_cs;
   

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
   assign det = x0_64 * (y1_64 - y2_64) + x1_64 * (y2_64 - y0_64) + x2_64 * (y0_64 - y1_64);

   /* Non-div c's */
   always_comb begin
      /* Defaults */
      ndiv_cx = s0_64 * (y1_64 - y2_64) + s1_64 * (y2_64 - y0_64) + s2_64 * (y0_64 - y1_64);
      ndiv_cy = s0_64 * (x2_64 - x1_64) + s1_64 * (x0_64 - x2_64) + s2_64 * (x1_64 - x0_64);
      
      part1 = x1_64 * y2_64 - x2_64 * y1_64;
      part2 = x2_64 * y0_64 - x0_64 * y2_64;
      part3 = x0_64 * y1_64 - x1_64 * y0_64;

      ndiv_cs = s0_64 * part1 + s1_64 * part2 + s2_64 * part3;
   end // always_comb

   /* Abs the values */
   assign abs_det = (det[63]) ? (~det + 64'd1) : det;
   assign abs_ndiv_cx = (ndiv_cx[63]) ? (~ndiv_cx + 64'd1) : ndiv_cx;
   assign abs_ndiv_cy = (ndiv_cy[63]) ? (~ndiv_cy + 64'd1) : ndiv_cy;
   assign abs_ndiv_cs = (ndiv_cs[63]) ? (~ndiv_cs + 64'd1) : ndiv_cs;
   
   /* Do the divsion... */
   assign r_cx = {abs_ndiv_cx, 64'b0} / abs_det;
   assign r_cy = {abs_ndiv_cy, 64'b0} / abs_det;
   assign r_cs = {abs_ndiv_cs, 64'b0} / abs_det;

   assign abs_cx = r_cx[111:48];
   assign abs_cy = r_cy[111:48];
   assign abs_cs = r_cs[111:48];

   assign cx = (det[63] ^ ndiv_cx[63]) ? (~abs_cx + 24'd1) : abs_cx;
   assign cy = (det[63] ^ ndiv_cy[63]) ? (~abs_cy + 24'd1) : abs_cy;
   assign cs = (det[63] ^ ndiv_cs[63]) ? (~abs_cs + 24'd1) : abs_cs;
   
endmodule // interp

