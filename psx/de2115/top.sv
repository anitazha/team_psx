module top(input wire RESET, SYSCLK_P, SYSCLK_N,
	   input logic [7:0]  GPIO_DIP,
	   inout logic [5:0]  COM_CHANNEL,
	   output logic [7:0] GPIO_LED_LS,
	   output logic       COM_CLK, COM_REQ);


   wire 		     clk, rst;
   wire 		     data_rdy, rdy_for_data;
   wire [31:0] 		     data_in;

   /* clock generation */
   IBUFDS #(.DIFF_TERM("TRUE"),
	    .IBUF_LOW_PWR("TRUE"),
	    .IOSTANDARD("DEFAULT"))
   clk_ibufds (.O(clk),
	       .I(SYSCLK_P),
	       .IB(SYSCLK_N));

   assign rst = RESET;
   
   VC707_side VC707(.clk(clk),
		    .rst(rst),
		    .data_in(data_in),
		    .data_rdy(data_rdy),
		    .com_channel(COM_CHANNEL),
		    .rdy_for_data(rdy_for_data),
		    .com_clk(COM_CLK),
		    .com_req(COM_REQ));

   test_xil_dip xil_dip(.*);
   
endmodule // top
