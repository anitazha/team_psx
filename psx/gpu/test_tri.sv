module test_line;


   parameter H = 'd48;
   parameter W = 'd48;
   parameter X0 = 16'd14;
   parameter Y0 = 16'd1;
   parameter X1 = 16'd45;
   parameter Y1 = 16'd23;
   parameter X2 = 16'd26;
   parameter Y2 = 16'd2;
   
   reg [15:0] x, y;
   reg 	      in;
   reg [1:0]  side0, side1, side2;
   
   /* Side finders */
   line_finder sf2(.x0(X0), .y0(Y0),
		   .x1(X1), .y1(Y1),
		   .x(X2), .y(Y2),
		   .result(side2)),
     sf1(.x0(X0), .y0(Y0),
	 .x1(X2), .y1(Y2),
	 .x(X1), .y(Y1),
	 .result(side1)),
     sf0(.x0(X1), .y0(Y1),
	 .x1(X2), .y1(Y2),
	 .x(X0), .y(Y0),
	 .result(side0));

   triangle_fill tf(.x0(X0), .y0(Y0),
                    .x1(X1), .y1(Y1),
		    .x2(X2), .y2(Y2),
		    .*);
   

   initial begin

      for (y = 0; y < H; y=y+1) begin
	 $write(" %2d | ", y);
	 for (x = 0; x < W; x=x+1) begin
	    #10;
	    if (in) begin
	       $write(" # ");
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
