

module interp(
	      input logic 	  clk, rst,
	      input logic [11:0]  x0, y0, x1, y1, x2, y2,
	      input logic [11:0]  s0, s1, s2,
	      output logic [31:0] cx, cy, cs,
	      output logic 	  done);
   
   /* Internal lines */
   logic [31:0] 		  x0_32, y0_32, x1_32, y1_32, x2_32, y2_32;
   logic [31:0] 		  s0_32, s1_32, s2_32;
   
   logic [31:0] 		  det;
   logic [31:0] 		  ndiv_cx, ndiv_cy;
   logic [31:0] 		  part1, part2, part3;
   logic [31:0] 		  ndiv_cs;
   logic [31:0] 		  ndiv_cx_next, ndiv_cy_next, ndiv_cs_next, det_next;
   
   logic [31:0] 		  abs_ndiv_cx, abs_ndiv_cy, abs_ndiv_cs;
   logic [31:0] 		  abs_det;
   logic [31:0] 		  abs_ndiv_cx_next, abs_ndiv_cy_next, abs_ndiv_cs_next;
   logic [31:0] 		  abs_det_next;

   logic [63:0] 		  q_cx, q_cy, q_cs, q_cx_next, q_cy_next, q_cs_next;
   logic [64:0][31:0] 		  remain_cx, remain_cy, remain_cs;
   logic [63:0][31:0] 		  remain_cx_next, remain_cy_next, remain_cs_next;
   logic [63:0][32:0] 		  rem_cx, rem_cy, rem_cs;
   logic [63:0] 		  div_cx, div_cy, div_cs;
   
   logic [63:0] 		  r_cx, r_cy, r_cs;
   logic [63:0] 		  r_cx_next, r_cy_next, r_cs_next;
   logic [31:0] 		  abs_cx, abs_cy, abs_cs;
   
   logic [31:0] 		  cx_next, cy_next, cs_next;
   
   genvar 			  i;

   /* Expand inputs to 32-bits */
   assign x0_32 = {20'b0, x0};
   assign y0_32 = {20'b0, y0};
   assign x1_32 = {20'b0, x1};
   assign y1_32 = {20'b0, y1};
   assign x2_32 = {20'b0, x2};
   assign y2_32 = {20'b0, y2};
   assign s0_32 = {20'b0, s0};
   assign s1_32 = {20'b0, s1};
   assign s2_32 = {20'b0, s2};
   
   /* Determinant */
   assign det_next = x0_32 * (y1_32 - y2_32) + x1_32 * (y2_32 - y0_32) + x2_32 * (y0_32 - y1_32);

   /* Non-div c's */
   always_comb begin
      /* Defaults */
      ndiv_cx_next = s0_32 * (y1_32 - y2_32) + s1_32 * (y2_32 - y0_32) + s2_32 * (y0_32 - y1_32);
      ndiv_cy_next = s0_32 * (x2_32 - x1_32) + s1_32 * (x0_32 - x2_32) + s2_32 * (x1_32 - x0_32);
      
      part1 = x1_32 * y2_32 - x2_32 * y1_32;
      part2 = x2_32 * y0_32 - x0_32 * y2_32;
      part3 = x0_32 * y1_32 - x1_32 * y0_32;

      ndiv_cs_next = s0_32 * part1 + s1_32 * part2 + s2_32 * part3;
   end // always_comb

   /* Intermediate value hold */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 ndiv_cx <= 32'd0;
	 ndiv_cy <= 32'd0;
	 ndiv_cs <= 32'd0;
	 det <= 32'd0;
      end
      else begin
	 ndiv_cx <= ndiv_cx_next;
	 ndiv_cy <= ndiv_cy_next;
	 ndiv_cs <= ndiv_cs_next;
	 det <= det_next;
      end
   end // always_ff @
   
   /* Abs the values; avoid div-by-0 */
   assign abs_det_next = (det[31]) ? (~det + 32'd1) : ((det == 0) ? 32'd1 : det);
   assign abs_ndiv_cx_next = (ndiv_cx[31]) ? (~ndiv_cx + 32'd1) : ndiv_cx;
   assign abs_ndiv_cy_next = (ndiv_cy[31]) ? (~ndiv_cy + 32'd1) : ndiv_cy;
   assign abs_ndiv_cs_next = (ndiv_cs[31]) ? (~ndiv_cs + 32'd1) : ndiv_cs;

   /* Absolute value hold */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 abs_det <= 32'd0;
	 abs_ndiv_cx <= 32'd0;
	 abs_ndiv_cy <= 32'd0;
	 abs_ndiv_cs <= 32'd0;
      end
      else begin
	 abs_det <= abs_det_next;
	 abs_ndiv_cx <= abs_ndiv_cx_next;
	 abs_ndiv_cy <= abs_ndiv_cy_next;
	 abs_ndiv_cs <= abs_ndiv_cs_next;
      end // else: !if(rst)
   end // always_ff @

   assign remain_cx[64] = 32'd0;
   assign remain_cy[64] = 32'd0;
   assign remain_cs[64] = 32'd0;

   assign div_cx = {16'b0, abs_ndiv_cx, 16'b0};
   assign div_cy = {16'b0, abs_ndiv_cy, 16'b0};
   assign div_cs = {16'b0, abs_ndiv_cs, 16'b0};
   
   /* Do the divsion (pipelined!)... */
   generate
      for (i = 0; i < 64; i = i + 1) begin: int_div
	 always_comb begin
	    /* Defaults */
	    rem_cx[i] = {remain_cx[i+1], div_cx[i]} - {1'b0, abs_det};
	    rem_cy[i] = {remain_cy[i+1], div_cy[i]} - {1'b0, abs_det};
	    rem_cs[i] = {remain_cs[i+1], div_cs[i]} - {1'b0, abs_det};

	    q_cx_next[i] = ~rem_cx[i][32];
	    q_cy_next[i] = ~rem_cy[i][32];
	    q_cs_next[i] = ~rem_cs[i][32];

	    remain_cx_next[i] = ((~rem_cx[i][32]) ? rem_cx[i][31:0] : 
				 {remain_cx[i+1][30:0], div_cx[i]});
	    remain_cy_next[i] = ((~rem_cy[i][32]) ? rem_cy[i][31:0] : 
				 {remain_cy[i+1][30:0], div_cy[i]});
	    remain_cs_next[i] = ((~rem_cs[i][32]) ? rem_cs[i][31:0] : 
				 {remain_cs[i+1][30:0], div_cs[i]});
	 end // always_comb

	 always_ff @(posedge clk, posedge rst) begin
	    if (rst) begin
	       q_cx[i] <= 1'b0;
	       q_cy[i] <= 1'b0;
	       q_cs[i] <= 1'b0;
	       remain_cx[i] <= 32'd0;
	       remain_cy[i] <= 32'd0;
	       remain_cs[i] <= 32'd0;
	    end
	    else begin
	       q_cx[i] <= q_cx_next[i];
	       q_cy[i] <= q_cy_next[i];
	       q_cs[i] <= q_cs_next[i];
	       remain_cx[i] <= remain_cx_next[i];
	       remain_cy[i] <= remain_cy_next[i];
	       remain_cs[i] <= remain_cs_next[i];
	    end // else: !if(rst)
	 end // always_ff @
      end // block: int_div
   endgenerate
   
   assign r_cx_next = q_cx;
   assign r_cy_next = q_cy;
   assign r_cs_next = q_cs;

   /* Abs final value hold */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 r_cx <= 64'd0;
	 r_cy <= 64'd0;
	 r_cs <= 64'd0;
      end
      else begin
	 r_cx <= r_cx_next;
	 r_cy <= r_cy_next;
	 r_cs <= r_cs_next;
      end
   end // always_ff @

   assign abs_cx = r_cx[39:8];
   assign abs_cy = r_cy[39:8];
   assign abs_cs = r_cs[39:8];

   assign cx_next = (det[31] ^ ndiv_cx[31]) ? (~abs_cx + 32'd1) : abs_cx;
   assign cy_next = (det[31] ^ ndiv_cy[31]) ? (~abs_cy + 32'd1) : abs_cy;
   assign cs_next = (det[31] ^ ndiv_cs[31]) ? (~abs_cs + 32'd1) : abs_cs;

   /* Output hold */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 cx <= 32'd0;
	 cy <= 32'd0;
	 cs <= 32'd0;
      end
      else begin
	 cx <= cx_next;
	 cy <= cy_next;
	 cs <= cs_next;
      end
   end // always_ff

   /* If nothing is changing, we are done! */
   assign done = ((ndiv_cx == ndiv_cx_next) &
		  (ndiv_cy == ndiv_cy_next) &
		  (ndiv_cs == ndiv_cs_next) &
		  (det == det_next) &
		  (abs_ndiv_cx == abs_ndiv_cx_next) &
		  (abs_ndiv_cy == abs_ndiv_cy_next) &
		  (abs_ndiv_cs == abs_ndiv_cs_next) &
		  (abs_det == abs_det_next) &
		  (remain_cx == remain_cx_next) &
		  (remain_cy == remain_cy_next) &
		  (remain_cs == remain_cs_next) &
		  (r_cx == r_cx_next) &
		  (r_cy == r_cy_next) & 
		  (r_cs == r_cs_next) & 
		  (cx == cx_next) &
		  (cy == cy_next) &
		  (cs == cs_next));
   
endmodule // interp

