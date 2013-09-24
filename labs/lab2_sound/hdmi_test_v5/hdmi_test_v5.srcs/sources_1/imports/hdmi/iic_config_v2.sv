module iic_config(input logic  clk,
		  input logic  rst,
		  inout logic  SDA,
		  output logic SCL,
		  output logic IIC_RST,
		  output logic done,
		  output logic error);

   /* Parameters */
   parameter  CLK_RATE_MHZ = 200;
   parameter  SCK_PERIOD_US = 30;
   parameter  TRANSITION_CYCLE = (CLK_RATE_MHZ * SCK_PERIOD_US) / 2;
   parameter  TRANSITION_CYCLE_MSB = 11;

   /* IIC Switch configuration addr & data */
   localparam SWITCH_ADDR = 7'h74;
   localparam SWITCH_DATA = 8'h20;

   /* ADV7511 IIC Bus Address */
   localparam  SLAVE_ADDR = 7'h39;
   
   /* IIC protocol signals */
   localparam  START_BIT = 1'b1;
   localparam  ACK = 1'b1;
   localparam  WRITE = 1'b0;
   localparam  STOP_BIT = 1'b0;
   localparam  SDA_BUFFER_MSB = 27;
   localparam  SDA_BUFFER_SW = 18;

   /* register addresses */
   localparam  ADDR_00 = 8'h41;  /* power-up power-down */
   localparam  ADDR_01 = 8'h0B;  /* SPDIF config */
   localparam  ADDR_02 = 8'h14;  /* audio sample word length */
   localparam  ADDR_03 = 8'h15;  /* input video format */
   localparam  ADDR_04 = 8'h16;  /* color depth, video input edge, RGB */
   localparam  ADDR_05 = 8'h17;  /* vsync hsync polarity */
   localparam  ADDR_06 = 8'h3C;  /* VIC to send to Rx */
   localparam  ADDR_07 = 8'h0A;  /* audio type select */
   localparam  ADDR_08 = 8'h55;  /* video output format */
   localparam  ADDR_09 = 8'h73;  /* audio channel count */
   localparam  ADDR_10 = 8'h9D;  /* input pixel clock divide */
   localparam  ADDR_11 = 8'hAF;  /* HDCP encryption, HDMI mode */
   localparam  ADDR_12 = 8'hD7;  /* vsync hsync durations */
   localparam  ADDR_13 = 8'hD8;
   localparam  ADDR_14 = 8'hD9;
   localparam  ADDR_15 = 8'hDA;
   localparam  ADDR_16 = 8'hDB;
   localparam  ADDR_17 = 8'hF9;  /* fixed I2C address */
   
   /* value that needs to be put in the above registers */
   localparam  DATA_00 = 8'h10;  /* power on ADV7511 */
   localparam  DATA_01 = 8'hC7;
   localparam  DATA_02 = 8'h02;  /* 16-bit */
   localparam  DATA_03 = 8'h00;  /* 24-bit RGB 4:4:4 */
   localparam  DATA_04 = 8'h32;  /* color depth 8-bit, rising edge */
   localparam  DATA_05 = 8'h60;  /* low polarity */
   localparam  DATA_06 = 8'h02;
   localparam  DATA_07 = 8'h10;  /* SPDIF, MCLK */
   localparam  DATA_08 = 8'h00;  /* RGB output */
   localparam  DATA_09 = 8'h01;  /* 2-channel audio */
   localparam  DATA_10 = 8'h60;  /* clock not divided */
   localparam  DATA_11 = 8'h06;  /* disable encryption, HDMI */
   localparam  DATA_12 = 8'h04;  /* hsync front porch = ???? */
   localparam  DATA_13 = 8'h03;  /* hsync duration    = ???? */
   localparam  DATA_14 = 8'hE0;  /* vsync front porch = ???? */
   localparam  DATA_15 = 8'h24;  /* vsync duration    = ???? */
   localparam  DATA_16 = 8'h06;
   localparam  DATA_17 = 8'h00;  /* set to come non-conflicting address */   
   
   /* other required registers (not for config) */
   localparam  ADDR_18 = 8'h3B;
   localparam  ADDR_19 = 8'h44;
   localparam  ADDR_20 = 8'h48;
   localparam  ADDR_21 = 8'h94;
   localparam  ADDR_22 = 8'h96;
   localparam  ADDR_23 = 8'h98;
   localparam  ADDR_24 = 8'h99;
   localparam  ADDR_25 = 8'h9A;
   localparam  ADDR_26 = 8'h9B;
   localparam  ADDR_27 = 8'h9C;
   localparam  ADDR_28 = 8'h9F;
   localparam  ADDR_29 = 8'hA1;
   localparam  ADDR_30 = 8'hA2;
   localparam  ADDR_31 = 8'hA3;
   localparam  ADDR_32 = 8'hA4;
   localparam  ADDR_33 = 8'hA5;
   localparam  ADDR_34 = 8'hA6;
   localparam  ADDR_35 = 8'hA7;
   localparam  ADDR_36 = 8'hA8;
   localparam  ADDR_37 = 8'hA9;
   localparam  ADDR_38 = 8'hAA;
   localparam  ADDR_39 = 8'hAB;
   localparam  ADDR_40 = 8'hB9;
   localparam  ADDR_41 = 8'hBA;
   localparam  ADDR_42 = 8'hBB;
   localparam  ADDR_43 = 8'hC7;
   localparam  ADDR_44 = 8'hCD;
   localparam  ADDR_45 = 8'hCE;
   localparam  ADDR_46 = 8'hCF;
   localparam  ADDR_47 = 8'hD0;
   localparam  ADDR_48 = 8'hD1;
   localparam  ADDR_49 = 8'hD2;
   localparam  ADDR_50 = 8'hD3;
   localparam  ADDR_51 = 8'hD4;
   localparam  ADDR_52 = 8'hD5;
   localparam  ADDR_53 = 8'hD6;
   localparam  ADDR_54 = 8'hDC;
   localparam  ADDR_55 = 8'hDD;
   localparam  ADDR_56 = 8'hDE;
   localparam  ADDR_57 = 8'hDF;
   localparam  ADDR_58 = 8'hE0;
   localparam  ADDR_59 = 8'hE2;
   localparam  ADDR_60 = 8'hE3;
   localparam  ADDR_61 = 8'hE4;
   localparam  ADDR_62 = 8'hFA;
   
   localparam  DATA_18 = 8'hE0;
   localparam  DATA_19 = 8'h00;
   localparam  DATA_20 = 8'h00;
   localparam  DATA_21 = 8'hC0;
   localparam  DATA_22 = 8'h00;
   localparam  DATA_23 = 8'h03;
   localparam  DATA_24 = 8'h02;
   localparam  DATA_25 = 8'hE0;
   localparam  DATA_26 = 8'h18;
   localparam  DATA_27 = 8'h30;
   localparam  DATA_28 = 8'h00;
   localparam  DATA_29 = 8'h00;
   localparam  DATA_30 = 8'hA4;
   localparam  DATA_31 = 8'hA4;
   localparam  DATA_32 = 8'h08;
   localparam  DATA_33 = 8'h04;
   localparam  DATA_34 = 8'h00;
   localparam  DATA_35 = 8'h00;
   localparam  DATA_36 = 8'h00;
   localparam  DATA_37 = 8'h00;
   localparam  DATA_38 = 8'h00;
   localparam  DATA_39 = 8'h40;
   localparam  DATA_40 = 8'h00;
   localparam  DATA_41 = 8'h10;
   localparam  DATA_42 = 8'h00;
   localparam  DATA_43 = 8'h00;
   localparam  DATA_44 = 8'h00;
   localparam  DATA_45 = 8'h01;
   localparam  DATA_46 = 8'h04;
   localparam  DATA_47 = 8'h3C;
   localparam  DATA_48 = 8'hFF;
   localparam  DATA_49 = 8'h80;
   localparam  DATA_50 = 8'h80;
   localparam  DATA_51 = 8'h80;
   localparam  DATA_52 = 8'h00;
   localparam  DATA_53 = 8'h00;
   localparam  DATA_54 = 8'h00;
   localparam  DATA_55 = 8'h00;
   localparam  DATA_56 = 8'h10;
   localparam  DATA_57 = 8'h01;
   localparam  DATA_58 = 8'h3C;
   localparam  DATA_59 = 8'h00;
   localparam  DATA_60 = 8'h00;
   localparam  DATA_61 = 8'h60;
   localparam  DATA_62 = 8'h00;

   /* internal lines */
   reg 			        SDA_out;
   reg 			        SCL_out;
   reg 				IIC_RST_out;
   reg 			        done_out;
   reg 				error_out;
   reg [TRANSITION_CYCLE_MSB:0] cycle_count;
   reg [5:0] 			write_count;
   reg [31:0] 			bit_count;
   reg 				switch_config;
   reg 				switch_reset;				
   reg [SDA_BUFFER:0] 		SDA_BUFFER;
   reg 				write_en;
   reg 				SDA_in;
   
   wire 			transition;

   /* FSM state */
   iic_fsm_t                    curr_state, next_state;

   /* connect outputs to internal registers */
   assign SDA     = write_en ? SDA_out : 1'bz;
   assign SCL     = SCL_out;
   assign IIC_RST = IIC_RST_out;
   assign done    = done_out;
   assign error   = error_out;
   
   /* push MSB of serial data, set output lines, set initial registers */
   always @ (posedge clk, posedge rst) begin
      // both SDA and SCL held high to disable IIC */
      if (rst) begin
	 SDA_out <= 1'b1;
	 SCL_out <= 1'b1;
	 switch_reset <= 1'b0;
	 switch_config <= 1'b1;
	 write_en <= 1'b1;
	 error_out <= 1'b0;
      end
      else if (curr_state == IDLE || curr_state == RESET) begin
	 SDA_out <= 1'b1;
	 SCL_out <= 1'b1;
      end
      // start sequence for IIC transmission
      else if (curr_state == START) begin
	 SDA_out <= 1'b0;
	 SCL_out <= 1'b1;
      end
   end // always @ (posedge clk, posedge rst)



   /* pull IIC_RST low for one clock to reset the IIC switch */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 IIC_RST_out <= 1'b0;
      end
      else begin
	 IIC_RST_out <= 1'b1;
	 if (~switch_reset) switch_reset <= 1'b1;
      end
   end

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state <= RESET;
      end
      else begin
	 curr_state <= next_state;
      end
   end

   /* assert whenever ready for the next transmission */
   assign transition = (cycle_count == TRANSITION_CYCLE);

   
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state = curr_state;

      case (curr_state)
	// reset the IIC switch
	RESET: begin
	   if (switch_reset) begin
	      next_state = INIT;
	   end
	   else begin
	      next_state = RESET;
	   end
	end

	INIT: begin
	   if (transition) begin
	      if (switch_config) next_state = START;
	      else next_state 
	   end
	   else begin
	      next_state = INIT;
	   end
	end

	START: begin
	   if (transition) begin
	      next_state = SETUP;
	   end
	   else begin
	      next_state = CLK_FALL;
	   end
	end

	
	
	default: begin
	   next_state = IDLE;
	end
      endcase
   end

endmodule
