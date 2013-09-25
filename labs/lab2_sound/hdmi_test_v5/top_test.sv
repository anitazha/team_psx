`default_nettype none
  
/* Defines */
`define sim

module top_test(
		input bit 	  RESET, SYSCLK_P, SYSCLK_N,
		output bit 	  IIC_SDA,
		output bit 	  IIC_SCL,
		output bit 	  HDMI_PXL_CLK,
		output bit 	  HDMI_SPDIF, HDMI_DE, HDMI_HSYNC, HDMI_VSYNC,
		output bit [35:0] HDMI_D,
        output bit    GPIO_LED_0_LS, GPIO_LED_1_LS);


   /* Internal Lines */
   bit 				  clk, rst;
   bit [23:0] 			  video_data;
   bit [15:0] 			  audio_data;
   bit 				  audio_rdy, video_rdy;
   bit 				  audio_valid, video_valid;
   
   /* Clock Generation */
`ifndef sim
   IBUFDS #(.DIFF_TERM("TRUE"),
	    .IBUF_LOW_PWR("TRUE"),
	    .IOSTANDARD("DEFAULT"))
   clk_ibufds (.O(clk),
	       .I(SYSCLK_P),
	       .IB(SYSCLK_N));

   assign RESET = rst;
`endif
   
   assign GPIO_LED_0_LS = video_valid;
   assign GPIO_LED_1_LS = video_rdy;

   /* HDMI Module */
   hdmi hdmi0(.r(video_data[23:16]),
	      .g(video_data[15:8]),
	      .b(video_data[7:0]),
	      .video_valid(video_valid),
	      .video_rdy(video_rdy),
	      .audio_in(audio_data),
	      .audio_valid(audio_valid),
	      .audio_rdy(audio_rdy),
	      .*);

   /* HDMI Feeder */
   hdmi_test_feeder feeder0(.video_out(video_data),
			    .video_rdy(video_rdy),
			    .video_valid(video_valid),
			    .audio_out(audio_data),
			    .audio_rdy(audio_rdy),
			    .audio_valid(audio_valid),
			    .*);

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
