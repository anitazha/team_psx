
module test_controller();

   reg       clk, rst, start;
   reg       DATA, ACK, COMMAND, ATT;
   reg       c_clk;
   reg       SLCT, STRT, UP, DOWN, RGHT, LEFT;
   reg       L1, L2, R1, R2, TRI, SQU, XXX, CIR;
   reg [7:0] RJOY_X, RJOY_Y, LJOY_X, LJOY_Y;
   reg 	     RJOY, LJOY;
   

   controller_io C1(.*);

   initial begin
      clk  <= 1'b0;
      forever #5 clk = ~clk;
   end

   initial begin
      start <= 1'b0;
      ACK <= 1'b1;
      DATA <= 1'b1;
      
      rst <= 1'b0;
      #1;
      rst <= 1'b1;
      #3;
      rst <= 1'b0;

      #5;
      start <= 1'b1;
      #10;
      start <= 1'b0;

      repeat (100000) begin
	 @(posedge clk);
      end
      $finish;
   end // initial begin

endmodule // test_controller
