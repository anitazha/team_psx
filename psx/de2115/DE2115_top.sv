
module top(input logic CLOCK_50, 
		   input logic [3:0] KEY, 
		   output logic [17:0] LEDR,
		   inout [35:0] GPIO);

   logic [31:0] 			  data;
   logic 					  rst;

   DE2115_side de(.clk(CLOCK_50),
				  .rst(rst),
				  .data_rdy(),
				  .data(data),
				  .com_channel(GPIO[5:0]),
				  .com_clk(GPIO[6]),
				  .com_req(GPIO[7]));

   assign rst = ~KEY[0];
   assign LEDR[15:0] = (~KEY[1]) ? data[15:0] : data[31:16];

endmodule // top
