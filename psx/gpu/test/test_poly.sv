`default_nettype none

module test_line;


   parameter H = 'd48;
   parameter W = 'd48;
   parameter X0 = 16'd4;
   parameter Y0 = 16'd4;
   parameter X1 = 16'd36;
   parameter Y1 = 16'd4;
   parameter X2 = 16'd4;
   parameter Y2 = 16'd36;
   parameter X3 = 16'd36;
   parameter Y3 = 16'd36;
   
   reg [15:0] x, y;
   reg [15:0] tri1_x0, tri1_y0, tri1_x1, tri1_y1, tri1_x2, tri1_y2;
   reg [15:0] tri2_x0, tri2_y0, tri2_x1, tri2_y1, tri2_x2, tri2_y2;
   reg 	      in1, in2;
   reg [1:0]  tri1_side0, tri1_side1, tri1_side2;
   reg [1:0]  tri2_side0, tri2_side1, tri2_side2;
   
   /* Poly breaker */
   poly_breaker pb(.x0(X0), .y0(Y0), .x1(X1), .y1(Y1),
		   .x2(X2), .y2(Y2), .x3(X3), .y3(Y3),
		   .x0_0(tri1_x0), .y0_0(tri1_y0), .x1_0(tri1_x1), 
		   .y1_0(tri1_y1), .x2_0(tri1_x2), .y2_0(tri1_y2),
		   .x0_1(tri2_x0), .y0_1(tri2_y0), .x1_1(tri2_x1), 
		   .y1_1(tri2_y1), .x2_1(tri2_x2), .y2_1(tri2_y2));
   
   /* Side finders (tri1) */
   line_finder sf2_1(.x0(tri1_x0), .y0(tri1_y0),
		     .x1(tri1_x1), .y1(tri1_y1),
		     .x(tri1_x2), .y(tri1_y2),
		     .result(tri1_side2)),
     sf1_1(.x0(tri1_x0), .y0(tri1_y0),
	   .x1(tri1_x2), .y1(tri1_y2),
	   .x(tri1_x1), .y(tri1_y1),
	   .result(tri1_side1)),
     sf0_1(.x0(tri1_x1), .y0(tri1_y1),
	   .x1(tri1_x2), .y1(tri1_y2),
	   .x(tri1_x0), .y(tri1_y0),
	   .result(tri1_side0));

   /* Tri1 */
   triangle_fill tf1(.x0(tri1_x0), .y0(tri1_y0),
                     .x1(tri1_x1), .y1(tri1_y1),
		     .x2(tri1_x2), .y2(tri1_y2),
		     .side0(tri1_side0), .side1(tri1_side1), .side2(tri1_side2),
		     .in(in1),
		     .*);

   /* Side finders (tr2) */
   line_finder sf2_2(.x0(tri2_x0), .y0(tri2_y0),
		     .x1(tri2_x1), .y1(tri2_y1),
		     .x(tri2_x2), .y(tri2_y2),
		     .result(tri2_side2)),
     sf1_2(.x0(tri2_x0), .y0(tri2_y0),
	   .x1(tri2_x2), .y1(tri2_y2),
	   .x(tri2_x1), .y(tri2_y1),
	   .result(tri2_side1)),
     sf0_2(.x0(tri2_x1), .y0(tri2_y1),
	   .x1(tri2_x2), .y1(tri2_y2),
	   .x(tri2_x0), .y(tri2_y0),
	   .result(tri2_side0));
   
   /* Tri1 */
   triangle_fill tf2(.x0(tri2_x0), .y0(tri2_y0),
		     .x1(tri2_x1), .y1(tri2_y1),
		     .x2(tri2_x2), .y2(tri2_y2),
		     .side0(tri2_side0), .side1(tri2_side1), .side2(tri2_side2),
		     .in(in2), 
		     .*);

   initial begin

      #1;
      $display(" TRIANGLE1: (%d, %d) (%d, %d) (%d, %d)", 
	       tri1_x0, tri1_y0, tri1_x1, tri1_y1, tri1_x2, tri1_y2);
      $display(" TRIANGLE2: (%d, %d) (%d, %d) (%d, %d)",
	       tri2_x0, tri2_y0, tri2_x1, tri2_y1, tri2_x2, tri2_y2);

      
      for (y = 0; y < H; y=y+1) begin
	 $write(" %2d | ", y);
	 for (x = 0; x < W; x=x+1) begin
	    #10;
	    if (in1 & in2) begin
	       $write(" B ");
	    end
	    else if (in1) begin
	       $write(" 1 ");
	    end
	    else if (in2) begin
	       $write(" 2 ");
	    end
	    else begin
	       $write(" . ");
	    end
	 end
	 $display("");
      end // for (y = 0; y < H; y=y+1)

      $write("    +-");
      for (x = 0; x < W; x=x+1) begin
	 $write("---");

      end

      $display("");
      
      $write("      ");
      for (x = 0; x < W; x=x+1) begin
	 $write("%2d ", x);
      end
      $display("");
      $display("");
   end // initial begin
   

endmodule // test_line
