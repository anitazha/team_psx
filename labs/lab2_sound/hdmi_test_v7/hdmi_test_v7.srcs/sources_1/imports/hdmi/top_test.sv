`default_nettype none
  
/* Defines */
//`define sim

module top_test(
		input wire 	  RESET, SYSCLK_P, SYSCLK_N, B1,
		inout wire 	  IIC_SDA,
		inout wire 	  IIC_SCL,
		output bit 	  IIC_RST,
		output bit 	  HDMI_PXL_CLK,
		output bit 	  HDMI_SPDIF, HDMI_DE, HDMI_HSYNC, HDMI_VSYNC,
		output bit [35:0] HDMI_D,
		output bit [7:0]  GPIO_LED_LS);


   /* Internal Lines */
   bit 				  clk, rst;
   bit [23:0] 			  video_data;
   bit [15:0] 			  audio_data;
   bit 				  audio_rdy, video_rdy;
   bit 				  audio_valid, video_valid;
   bit 				  done_out;
   bit [7:0] 			  error;

   bit [31:0] 			  clk_counter;
   bit 				  slow_clk;

   bit 				  skip;
   
   assign skip = B1;
   assign slow_clk = clk_counter[0];
   
   /* Clock Generation */
`ifndef sim
   IBUFDS #(.DIFF_TERM("TRUE"),
	    .IBUF_LOW_PWR("TRUE"),
	    .IOSTANDARD("DEFAULT"))
   clk_ibufds (.O(clk),
	       .I(SYSCLK_P),
	       .IB(SYSCLK_N));

   assign rst = RESET;
`endif

   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 clk_counter <= 'd0;
      end
      else begin
	 clk_counter <= clk_counter + 1;
      end
   end

   //assign GPIO_LED_LS[6:0] = error[6:0];
   
   assign GPIO_LED_LS[7] = video_valid;
   assign GPIO_LED_LS[6] = video_rdy;
   assign GPIO_LED_LS[5] = audio_valid;
   assign GPIO_LED_LS[4] = audio_rdy;
   assign GPIO_LED_LS[3] = done_out;
   assign GPIO_LED_LS[2] = RESET;
   assign GPIO_LED_LS[1] = HDMI_SPDIF;
   assign GPIO_LED_LS[0] = HDMI_VSYNC;

   /* HDMI Module */
   hdmi hdmi0(.r(video_data[23:16]),
	      .g(video_data[15:8]),
	      .b(video_data[7:0]),
	      .video_valid(video_valid),
	      .video_rdy(video_rdy),
	      .audio_in(audio_data),
	      .audio_valid(audio_valid),
	      .audio_rdy(audio_rdy),
	      .clk(slow_clk),
	      .*);

   /* HDMI Feeder */
   hdmi_test_feeder feeder0(.video_out(video_data),
			    .video_rdy(video_rdy),
			    .video_valid(video_valid),
			    .audio_out(audio_data),
			    .audio_rdy(audio_rdy),
			    .audio_valid(audio_valid),
			    .clk(slow_clk),
			    .*);
/*				
   wire [127:0] 		  ila_data;
   wire [63:0] 			  ila_trig;
   
   assign ila_data[0] = RESET;
   assign ila_data[1] = IIC_SDA;
   assign ila_data[2] = IIC_SCL;
   assign ila_data[3] = HDMI_PXL_CLK;
   assign ila_data[4] = HDMI_SPDIF;
   assign ila_data[5] = HDMI_DE;
   assign ila_data[6] = HDMI_HSYNC;
   assign ila_data[7] = HDMI_VSYNC;
   assign ila_data[45:10] = HDMI_D;
   assign ila_data[50] = audio_rdy;
   assign ila_data[51] = audio_valid;
   assign ila_data[52] = video_rdy;
   assign ila_data[53] = video_valid;
   
   assign ila_trig = ila_data[63:0];
   

   wire [35:0] 			  control;
   
   
   hdmi_icon icon(.CONTROL0(control));
   
   chipscope_ila ila(.CONTROL(control),
		     .CLK(clk),
		     .DATA(ila_data),
		     .TRIG0(ila_trig)); */
   
`ifdef sim
   initial begin
      forever #5 clk = ~clk;
   end
      
   initial begin
	  rst <= 1'b0;
	  #1
      rst <= 1'b1;
      #3;
      rst <= 1'b0;
      repeat (7000000) begin
	 @(posedge clk);
      end
	  $finish;
	  
   end
`endif
endmodule // top_test
