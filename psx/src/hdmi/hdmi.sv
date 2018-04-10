/* 18545 Fall 2013
 * Team PSX
 * 09-18-2013
 *
 * @MODULES:
 * hdmi
 * 
 * @DESCRIPTION:
 * Top-level HDMI module for interface to the board and user system
 *
 * @AUTHOR:
 * Michael Rosen
 * mrrosen
 *
 */



/* @MODULE: hdmi
 * @DESCRIPTION:
 * Top-level HDMI module, linking all the others together
 */
module hdmi(
	    input bit 	      clk, rst,
	    input bit [7:0]   r, g, b,
	    input bit 	      video_valid,
	    input bit [15:0]  audio_in,
	    input bit 	      audio_valid,
	    output bit 	      audio_rdy, video_rdy,
	    output bit 	      IIC_SCL,
	    output bit 	      IIC_RST,
	    output bit 	      IIC_SDA, 
	    output bit [35:0] HDMI_D,
	    output bit 	      HDMI_HSYNC, HDMI_VSYNC, HDMI_DE, HDMI_PXL_CLK,
	    output bit 	      HDMI_SPDIF);

   /* Internal Lines */
   bit 			      audio_mod_rdy, video_mod_rdy, config_done;

   assign video_rdy = video_mod_rdy & config_done;
   assign audio_rdy = audio_mod_rdy & config_done;
   
   /* IIC Module */
   i2c_config iic_config0(.done(config_done),
			  .SDA(IIC_SDA),
			  .SCL(IIC_SCL),
			  .error(),
			  .*);

   /* HDMI Video Module */
   video video0(.data({r, g, b}),
			  .en(video_valid),
			  .rdy(video_mod_rdy),
			  .HDMI_DATA(HDMI_D),
			  .HDMI_EN(HDMI_DE),
			  .HDMI_HSYNC(HDMI_HSYNC),
			  .HDMI_VSYNC(HDMI_VSYNC),
			  .HDMI_CLK(HDMI_PXL_CLK),
			  .*);

   /* HDMI Audio Module */
   spdif spdif0(.data(audio_in),
		.valid(audio_valid),
		.SPDIF_OUT(HDMI_SPDIF),
		.rdy(audio_mod_rdy),
		.*);

endmodule // hdmi



/* @COMMENTING COMPLETE; EOF */
