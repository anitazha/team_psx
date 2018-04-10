module io_test();

   /* INPUTS */
   reg        clk, rst;
   reg [31:0] addr;
   reg [31:0] data_i;
   reg 	      wen, ren;
   reg [ 3:0] be;
   
   /* OUTPUTS */
   reg 	      ack;
   reg [31:0] data_o;

   /* TIMERS */
   reg 	      hblank, vblank;
   reg 	      dotclock;

   /* counters */
   reg [31:0] counter;
   
   assign hblank = counter[4];
   assign vblank = counter[6];
   assign dotclock = counter[0];                   

   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 counter <= 32'b0;
      end
      else begin
	 counter <= counter + 32'b1;
      end
   end
   
   io_controller io(.*);

   initial begin
      clk <= 1'b1;
      
      forever #5 clk = ~clk;
   end
   
   initial begin
      wen <= 1'b0;
      ren <= 1'b0;
            
      rst <= 1'b0;
      #1;
      rst <= 1'b1;
      #3;
      rst <= 1'b0;
      #1;

      /* TIMER0 */
      // write to counter value
      #5;
      addr   <= 32'h1F80_1100;
      data_i <= 32'h0000_0100;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;

      // change target value
      #5;
      addr   <= 32'h1F80_1108;
      data_i <= 32'h0000_0080;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;

      // change timer mode
      #5;
      addr   <= 32'h1F80_1104;
      data_i <= 32'b0000_0000_0000_0000_0000_0011_0111_1001;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;
           

      /* TIMER1 */
      // write to counter value
      #5;
      addr   <= 32'h1F80_1110;
      data_i <= 32'h0000_FF00;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;

      // change target value
      #5;
      addr   <= 32'h1F80_1118;
      data_i <= 32'h0000_0006;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;

      // change timer mode
      #5;
      addr   <= 32'h1F80_1114;
      data_i <= 32'b0000_0000_0000_0000_0000_0011_0111_1001;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;


      /* TIMER2 */
      // write to counter value
      #5;
      addr   <= 32'h1F80_1120;
      data_i <= 32'h0000_0100;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;

      // change target value
      #5;
      addr   <= 32'h1F80_1128;
      data_i <= 32'h0000_0004;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;

      // change timer mode
      #5;
      addr   <= 32'h1F80_1124;
      data_i <= 32'b0000_0000_0000_0000_0000_0011_0011_1001;
      be     <= 4'b0011;
      #5;
      wen <= 1'b1;
      #20;
      wen <= 1'b0;
      
      repeat (7000) begin
	 @(posedge clk);
      end

      $finish;
   end
   
endmodule // io_test
