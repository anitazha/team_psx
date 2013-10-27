module top;

   logic clk_1, rst_1;
   logic clk_2, rst_2;
   logic [31:0] data_in;
   logic 		data_rdy_1, data_rdy_2;
   logic [31:0] data;
   wire [5:0] 	com_channel;
   logic 		rdy_for_data;
   logic 		com_clk, com_req;


   VC707_side vc(.clk(clk_1),.rst(rst_1),.data_rdy(data_rdy_1),.*);
   DE2115_side de(.clk(clk_2),.rst(rst_2),.data_rdy(data_rdy_2),.*);

   initial begin
	  rst_1 = 1'b1;
	  clk_1 = 1'b0;
	  data_in = 'd1;
	  #5;
	  rst_1 = 1'b0;

	  forever #5 clk_1 = ~clk_2;
   end

   initial begin
	  rst_2 = 1'b1;
	  clk_2 = 1'b0;
	  data_in = 'd1;
	  #5;
	  rst_2 = 1'b0;

	  forever #20 clk_2 = ~clk_2;
   end // initial begin
   

   initial begin
	  @(posedge clk_1);
	  repeat (100) begin
		 data_in <= data_in + 'd1;
		 data_rdy_1 <= 1'b1;
		 @(posedge clk_1);
		 data_rdy_1 <= 1'b0;
		 @(posedge rdy_for_data);
	  end
	  repeat (10000) begin
		 @(posedge clk_1);
	  end
	  
	  $finish;
   end // initial begin

endmodule // top
