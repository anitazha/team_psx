/* 18545 Fall 2013
 * Team PSX
 * 09-19-2013
 *
 * @MODULES:
 * iic_config
 * 
 * @DESCRIPTION:
 * Write to configuration registers on ADV7511 chip
 * Set up for HDMI video+audio
 *
 * @AUTHOR:
 * Arnob Mallick
 * amallick
 *
 */

typedef enum reg [2:0] {IDLE, 
			INIT, 
			RESET,
			START, 
			CLK_FALL,
                        SETUP, 
			CLK_RISE, 
			WAIT} iic_fsm_t;



/* @MODULE: iic_config
 * @DESCRIPTION:
 * Serially program ADV7511 registers for HDMI output
 */
module iic_config (input  logic clk,
		   input  logic rst,
		   output logic SDA,
		   output logic SCL,
		   output logic IIC_RST,
		   output logic done);

   /* Parameters */
   parameter   CLK_RATE_MHZ = 200;
   parameter   SCK_PERIOD_US = 30;
   parameter   TRANSITION_CYCLE = (CLK_RATE_MHZ * SCK_PERIOD_US) / 2;
   parameter   TRANSITION_CYCLE_MSB = 11;

   /* IIC Switch configuration addr & data */
   localparam  SWITCH_ADDR = 7'h74;
   localparam  SWITCH_DATA = 8'b00100000;  /* enable channel 5 - HDMI */

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
   reg 	                        SDA_out;
   reg 	                        SCL_out;
   reg 				IIC_RST_out;				
   reg 	                        done_out;
   reg [TRANSITION_CYCLE_MSB:0] cycle_count;
   reg [5:0] 			write_count;
   reg [31:0] 			bit_count;
   reg 				switch_config;
   reg 				switch_reset;
   reg [SDA_BUFFER_MSB:0] 	SDA_BUFFER;
   iic_fsm_t                    curr_state, next_state;
   wire 			next_reg;
   
   /* push MSB of serial data & set output lines for different states */   
   always @ (posedge clk, posedge rst) begin
      if (rst || curr_state == RESET || curr_state == WAIT) begin
	 SDA_out <= 1'b1;
	 SCL_out <= 1'b1;
      end
      else if (curr_state == INIT && next_reg) begin
	 SDA_out <= 1'b0;
      end
      else if (curr_state == SETUP) begin
	 SDA_out <= SDA_BUFFER[SDA_BUFFER_MSB];
      end
      else if (curr_state == CLK_RISE && 
	       cycle_count == TRANSITION_CYCLE/2 &&
	       bit_count == SDA_BUFFER_MSB) begin
	 SDA_out <= 1'b1;
      end
      // generate SCL signal (clock)
      else if (curr_state == CLK_FALL) begin
	 SCL_out <= 1'b0;
      end
      else if (curr_state == CLK_RISE) begin
	 SCL_out <= 1'b1;
      end
   end // always @ (posedge clk)

   assign SDA     = SDA_out;
   assign SCL     = SCL_out;
   assign IIC_RST = IIC_RST_out;
   assign done    = done_out;

   always @ (posedge clk, posedge rst) begin
      // reset-end condition
      if (rst) begin
	 SDA_BUFFER <= {SWITCH_ADDR, WRITE, ACK, 
			SWITCH_DATA, ACK, STOP_BIT, 9'd0};
	 cycle_count <= 0;
      end
      // setup SDA dor SCK rise
      else if (curr_state == SETUP && cycle_count == TRANSITION_CYCLE) begin
	 SDA_BUFFER <= {SDA_BUFFER[SDA_BUFFER_MSB-1:0], 1'b0};
	 cycle_count <= 0;
      end
      // reset count at end of state
      else if (cycle_count == TRANSITION_CYCLE) begin
	cycle_count <= 0;
      end
      // reset SDA buffer
      else if (curr_state == WAIT) begin
	 case (write_count)
	   0:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_00, ACK,
			    DATA_00, ACK, STOP_BIT};
	   1:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_01, ACK,
			    DATA_01, ACK, STOP_BIT};
	   2:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_02, ACK,
			    DATA_02, ACK, STOP_BIT};
	   3:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_03, ACK,
			    DATA_03, ACK, STOP_BIT};
	   4:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_04, ACK,
			    DATA_04, ACK, STOP_BIT};
	   5:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_05, ACK,
			    DATA_05, ACK, STOP_BIT};
	   6:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_06, ACK,
			    DATA_06, ACK, STOP_BIT};
	   7:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_07, ACK,
			    DATA_07, ACK, STOP_BIT};
	   8:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_08, ACK,
			    DATA_08, ACK, STOP_BIT};
	   9:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_09, ACK,
			    DATA_09, ACK, STOP_BIT};
	   10:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_10, ACK,
			    DATA_10, ACK, STOP_BIT};
	   11:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_11, ACK,
			     DATA_11, ACK, STOP_BIT};
	   12:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_12, ACK,
			     DATA_12, ACK, STOP_BIT};
	   13:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_13, ACK,
			     DATA_13, ACK, STOP_BIT};
	   14:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_14, ACK,
			     DATA_14, ACK, STOP_BIT};
	   15:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_15, ACK,
			     DATA_15, ACK, STOP_BIT};
	   16:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_16, ACK,
			     DATA_16, ACK, STOP_BIT};
	   17:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_17, ACK,
			     DATA_17, ACK, STOP_BIT};
	   18:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_18, ACK,
			     DATA_18, ACK, STOP_BIT};
	   19:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_19, ACK,
			     DATA_19, ACK, STOP_BIT};
	   20:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_20, ACK,
			     DATA_20, ACK, STOP_BIT};
	   21:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_21, ACK,
			     DATA_21, ACK, STOP_BIT};
	   22:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_22, ACK,
			     DATA_22, ACK, STOP_BIT};
	   23:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_23, ACK,
			     DATA_23, ACK, STOP_BIT};
	   24:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_24, ACK,
			     DATA_24, ACK, STOP_BIT};
	   25:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_25, ACK,
			     DATA_25, ACK, STOP_BIT};
	   26:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_26, ACK,
			     DATA_26, ACK, STOP_BIT};
	   27:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_27, ACK,
			     DATA_27, ACK, STOP_BIT};
	   28:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_28, ACK,
			     DATA_28, ACK, STOP_BIT};
	   29:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_29, ACK,
			     DATA_29, ACK, STOP_BIT};
	   30:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_30, ACK,
			     DATA_30, ACK, STOP_BIT};
	   31:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_31, ACK,
			     DATA_31, ACK, STOP_BIT};
	   32:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_32, ACK,
			     DATA_32, ACK, STOP_BIT};
	   33:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_33, ACK,
			     DATA_33, ACK, STOP_BIT};
	   34:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_34, ACK,
			     DATA_34, ACK, STOP_BIT};
	   35:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_35, ACK,
			     DATA_35, ACK, STOP_BIT};
	   36:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_36, ACK,
			     DATA_36, ACK, STOP_BIT};
	   37:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_37, ACK,
			     DATA_37, ACK, STOP_BIT};
	   38:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_38, ACK,
			     DATA_38, ACK, STOP_BIT};
	   39:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_39, ACK,
			     DATA_39, ACK, STOP_BIT};
	   40:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_40, ACK,
			     DATA_40, ACK, STOP_BIT};
	   41:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_41, ACK,
			     DATA_41, ACK, STOP_BIT};
	   42:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_42, ACK,
			     DATA_42, ACK, STOP_BIT};
	   43:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_43, ACK,
			     DATA_43, ACK, STOP_BIT};
	   44:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_44, ACK,
			     DATA_44, ACK, STOP_BIT};
	   45:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_45, ACK,
			     DATA_45, ACK, STOP_BIT};
	   46:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_46, ACK,
			     DATA_46, ACK, STOP_BIT};
	   47:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_47, ACK,
			     DATA_47, ACK, STOP_BIT};
	   48:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_48, ACK,
			     DATA_48, ACK, STOP_BIT};
	   49:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_49, ACK,
			     DATA_49, ACK, STOP_BIT};
	   50:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_50, ACK,
			     DATA_50, ACK, STOP_BIT};
	   51:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_51, ACK,
			     DATA_51, ACK, STOP_BIT};
	   52:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_52, ACK,
			     DATA_52, ACK, STOP_BIT};
	   53:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_53, ACK,
			     DATA_53, ACK, STOP_BIT};
	   54:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_54, ACK,
			     DATA_54, ACK, STOP_BIT};
	   55:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_55, ACK,
			     DATA_55, ACK, STOP_BIT};
	   56:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_56, ACK,
			     DATA_56, ACK, STOP_BIT};
	   57:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_57, ACK,
			     DATA_57, ACK, STOP_BIT};
	   58:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_58, ACK,
			     DATA_58, ACK, STOP_BIT};
	   59:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_59, ACK,
			     DATA_59, ACK, STOP_BIT};
	   60:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_60, ACK,
			     DATA_60, ACK, STOP_BIT};
	   61:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_61, ACK,
			     DATA_61, ACK, STOP_BIT};
	   62:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, ADDR_62, ACK,
			     DATA_62, ACK, STOP_BIT};
	   default: SDA_BUFFER <= 28'dx;
	 endcase // case (write_count)

	 cycle_count <= cycle_count + 1;
      end // if (curr_state == WAIT)
      else
	cycle_count <= cycle_count + 1;
   end // always @ (posedge clk)

   /* increment write counter - keeps track of how many registers set */
   always @ (posedge clk, posedge rst) begin
      if (rst)
	write_count <= 0;
      else if (curr_state == WAIT && cycle_count == TRANSITION_CYCLE)
	write_count <= write_count + 1;
   end

   /* assert done signal when registers have been set */
   always @ (posedge clk, posedge rst) begin
      if (rst)
	done_out <= 1'b0;
      else if (curr_state == IDLE)
	done_out <= 1'b1;
   end

   always @ (posedge clk, posedge rst) begin
      if (rst || curr_state == WAIT)
	bit_count <= 0;
      else if ((curr_state == CLK_RISE) && (cycle_count == TRANSITION_CYCLE))
	bit_count <= bit_count + 1;
   end

   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 switch_config <= 1'b1;
      end
      else if (curr_state == WAIT) begin
	 switch_config <= 1'b0;
      end
   end

   /* pull IIC_RST low for one clock to reset the IIC switch */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 switch_reset <= 1'b0;
	 IIC_RST_out <= 1'b0;
      end
      else begin
	 IIC_RST_out <= 1'b1;
	 if (~switch_reset) switch_reset <= 1'b1;
      end
   end

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst)
	curr_state <= RESET;
      else 
	curr_state <= next_state;
   end
   
   /* transition asserted whenever ready for next transition */
   assign next_reg = (cycle_count == TRANSITION_CYCLE);

   always_comb begin
      /* Defaults */
      next_state = curr_state;
      
      case (curr_state)
	// completion state - remain IDLE after configuration complete
	IDLE: begin
	   next_state = IDLE;
	end
	RESET: begin
	   if (switch_reset) begin
	      next_state = INIT;
	   end
	   else begin
	      next_state = RESET;
	   end
	end
	INIT: begin
	   if (next_reg) begin
	      next_state = START;
	   end
	   else begin
	      next_state = INIT;
	   end
	end
	START: begin
	   if (next_reg) begin
	     next_state = SETUP;
	   end	   
	   else begin
	     next_state = CLK_FALL;
	   end
	end
	CLK_FALL: begin
	   if (next_reg) begin
	     next_state = SETUP;
	   end
	   else begin
	     next_state = CLK_FALL;
	   end
	end
	SETUP: begin
	   if (next_reg)  begin
	      next_state = CLK_RISE;
	   end
	   else begin 
	      next_state = SETUP;
	   end
	end
	CLK_RISE: begin
	   if ((next_reg && bit_count == SDA_BUFFER_MSB) ||
	       (next_reg && switch_config && bit_count == SDA_BUFFER_SW)) 
	   begin
	      next_state = WAIT;
	   end
	   else if (next_reg) begin
	      next_state = CLK_FALL;
	   end
	   else begin
	      next_state = CLK_RISE;
	   end
	end
	WAIT: begin
	   if (next_reg && write_count != 6'd62) begin
	      next_state = INIT;
	   end
	   else if (next_reg) begin
	      next_state = IDLE;
	   end
	   else begin
	      next_state = WAIT;
	   end
	end
	default:
	  next_state = IDLE;
      endcase // case (curr_state)
   end // always_comb begin

endmodule // iic_config


/* @COMMENTING COMPLETE; EOF */
