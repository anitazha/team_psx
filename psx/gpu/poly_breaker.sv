
module poly_breaker(
		    input wire [15:0] x0, y0, x1, y1,
		    input wire [15:0] x2, y2, x3, y3,
		    output reg [15:0] x0_0, y0_0, x1_0, y1_0, x2_0, y2_0,
		    output reg [15:0] x0_1, y0_1, x1_1, y1_1, x2_1, y2_1);
   
   /* Interal Lines */
   reg [1:0] 			      side0_12, side1_03, side2_03, side3_12;
   reg [1:0] 			      side1_02, side3_02;
   reg 				      is_bowtie, chosen_pairing, bowtie_pairing;
   reg [15:0] 			      bowtie_x, bowtie_y;

   /* Line finders */
   line_finder lf0_12(.x0(x1), .y0(y1),
		      .x1(x2), .y1(y2),
		      .x(x0), .y(y0),
		      .result(side0_12)),
     lf1_03(.x0(x0), .y0(y0),
	    .x1(x3), .y1(y3),
	    .x(x1), .y(y1),
	    .result(side1_03)),
     lf2_03(.x0(x0), .y0(y0),
	    .x1(x3), .y1(y3),
	    .x(x2), .y(y2),
	    .result(side2_03)),
     lf3_12(.x0(x1), .y0(y1),
	    .x1(x2), .y1(y2),
	    .x(x3), .y(y3),
	    .result(side3_12));

   line_finder lf1_02(.x0(x0), .y0(y0),
		      .x1(x2), .y1(y2),
		      .x(x1), .y(y1),
		      .result(side1_02)),
     lf3_02(.x0(x0), .y0(y0),
	    .x1(x2), .y1(y2),
	    .x(x3), .y(y3),
	    .result(side3_02));


   /* Regular/Chevron poly vs Bowtie poly logic (also splits chevrons and
      regular polys into triangles! */
   always_comb begin
      /* Defaults */
      is_bowtie = 1'b0;
      chosen_pairing = 1'b1;

      /* Test other 2 points against line forming diagonal:
         Regular - Both pairs on opposite sides
         Chevron - One pair on opposite sides, one pair on same side
         Bowtie - Both pairs on same side */
      if ((side0_12 == side3_12) & (side1_03 == side2_03)) begin
	 /* Its a bowtie... (more logic is needed...) */
	 is_bowtie = 1'b1;
      end
      else if ((side0_12 != side3_12) & (side1_03 == side2_03)) begin
	 /* Chevron - points 1 and 2 are on the same side; split by using 1, 2 */
	 chosen_pairing = 1'b0;
      end

      /* The other possibility, either Chevron with points 0, 3 or regular, are
         handled by the default split (splitting using 0, 3) */
   end // always_comb

   /* Bowtie logic */
   always_comb begin
      /* Defaults */
      bowtie_x = 16'b0;
      bowtie_y = 16'b0;
      bowtie_pairing = 1'b0;

   end

   /* Split logic */
   always_comb begin
      /* Default */
      x0_0 = 16'b0;
      y0_0 = 16'b0;
      x1_0 = 16'b0;
      y1_0 = 16'b0;
      x2_0 = 16'b0;
      y2_0 = 16'b0;

      x0_1 = 16'b0;
      y0_1 = 16'b0;
      x1_1 = 16'b0;
      y1_1 = 16'b0;
      x2_1 = 16'b0;
      y2_1 = 16'b0;

      /* If its a bowtie, use the bowtie x and y */
      if (is_bowtie) begin
	 x0_0 = bowtie_x;
	 y0_0 = bowtie_y;
	 x1_0 = bowtie_x;
	 y1_0 = bowtie_y;

	 if (bowtie_pairing) begin
	    x1_0 = x0;
	    y1_0 = y0;
	    x2_0 = x1;
	    y2_0 = y1;

	    x1_1 = x2;
	    y1_1 = y2;
	    x2_1 = x3;
	    y2_1 = y3;
	 end // if (bowtie_pairing)
	 else begin
	    x1_0 = x0;
	    y1_0 = y0;
	    x2_0 = x2;
	    y2_0 = y2;

	    x1_1 = x1;
	    y1_1 = y1;
	    x2_1 = x3;
	    y2_1 = y3;
	 end
      end
      else begin
	 if (chosen_pairing) begin
	    x0_0 = x0;
	    y0_0 = y0;
	    x1_0 = x3;
	    y1_0 = y3;
	    x2_0 = x1;
	    y2_0 = y1;

	    x0_1 = x0;
	    y0_1 = y0;
	    x1_1 = x3;
	    y1_1 = y3;
	    x2_1 = x2;
	    y2_1 = y2;
	 end // if (chosen_pairing)
	 else begin
	    x0_0 = x1;
	    y0_0 = y1;
	    x1_0 = x2;
	    y1_0 = y2;
	    x2_0 = x0;
	    y2_0 = y0;

	    x0_1 = x1;
	    y0_1 = y1;
	    x1_1 = x2;
	    y1_1 = y2;
	    x2_1 = x3;
	    y2_1 = y3;
	 end // else: !if(chosen_pairing)
      end // else: !if(is_bowtie)
   end // always_comb

endmodule // poly_breaker
