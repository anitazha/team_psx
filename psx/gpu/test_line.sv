module test_line;


   parameter H = 'd10;
   parameter W = 'd10;
   parameter X0 = 16'd2;
   parameter Y0 = 16'd1;
   parameter X1 = 16'd7;
   parameter Y1 = 16'd8;
   
   reg [15:0] x, y;
   reg [1:0]  result;
   reg signed [31:0] stuff;
   
   
   line_finder lf(.x0(X0), .y0(Y0),
		  .x1(X1), .y1(Y1),
		  .*);
   

   initial begin
      for (y = 0; y < H; y=y+1) begin
	 for (x = 0; x < W; x=x+1) begin
	    #10;
	    stuff = lf.det;
	    $write(" %3d ", stuff);
	 end
	 $display("");
      end

      $display("");

      for (y = 0; y < H; y=y+1) begin
	 for (x = 0; x < W; x=x+1) begin
	    #10;
	    $write(" %3d ", result);
	 end
	 $display("");
      end // for (y = 0; y < H; y=y+1)
      
   end

endmodule // test_line
