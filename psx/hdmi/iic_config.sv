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

typedef enum reg [2:0] {IDLE, INIT, START, CLK_FALL,
                        SETUP, CLK_RISE, WAIT} iic_fsm_t;



/* @MODULE: iic_config
 * @DESCRIPTION:
 * Serially program ADV7511 registers for HDMI output
 */
module iic_config (input  logic clk,
		   input  logic rst,
		   output logic SDA,
		   output logic SCL,
		   output logic done);

   /* Parameters */
   parameter   CLK_RATE_MHZ = 200;
   parameter   SCK_PERIOD_US = 30;
   parameter   TRANSITION_CYCLE = (CLK_RATE_MHZ * SCK_PERIOD_US) / 2;
   parameter   TRANSITION_CYCLE_MSB = 11;

   localparam  START_BIT = 1'b1;
   localparam  SLAVE_ADDR = 7'b1110110;
   localparam  ACK = 1'b1;
   localparam  WRITE = 1'b0;
   localparam  STOP_BIT = 1'b0;
   localparam  SDA_BUFFER_MSB = 27;

   /* register addresses */
   localparam  REG_ADDR_00 = 8'h0A;  /* audio type select */
   localparam  REG_ADDR_01 = 8'h0B;  /* SPDIF config */
   localparam  REG_ADDR_02 = 8'h14;  /* audio sample word length */
   localparam  REG_ADDR_03 = 8'h15;  /* input video format */
   localparam  REG_ADDR_04 = 8'h16;  /* color depth, video input edge, RGB */
   localparam  REG_ADDR_05 = 8'h17;  /* vsync hsync polarity */
   localparam  REG_ADDR_06 = 8'h3C;  /* VIC to send to Rx */
   localparam  REG_ADDR_07 = 8'h41;  /* power-up power-down */
   localparam  REG_ADDR_08 = 8'h55;  /* video output format */
   localparam  REG_ADDR_09 = 8'h73;  /* audio channel count */
   localparam  REG_ADDR_10 = 8'h9D;  /* input pixel clock divide */
   
   /* value that needs to be put in the above registers */
   localparam  DATA_00 = 8'h10;      /* SPDIF, MCLK */
   localparam  DATA_01 = 8'hC7;
   localparam  DATA_02 = 8'h02;      /* 16-bit */
   localparam  DATA_03 = 8'h00;      /* 24-bit RGB 4:4:4 */
   localparam  DATA_04 = 8'h32;      /* color depth 8-bit, rising edge */
   localparam  DATA_05 = 8'h60;      /* low polarity */
   localparam  DATA_06 = 8'h02;
   localparam  DATA_07 = 8'h10;      /* keep board powered on */
   localparam  DATA_08 = 8'h00;      /* RGB output */
   localparam  DATA_09 = 8'h01;      /* 2-channel audio */
   localparam  DATA_10 = 8'h60;      /* clock not divided */
   
   /* other required registers (not for config) */
   localparam  REG_ADDR_00 = 8'h3B;
   localparam  REG_ADDR_01 = 8'h44;
   localparam  REG_ADDR_02 = 8'h48;
   localparam  REG_ADDR_03 = 8'h94;
   localparam  REG_ADDR_04 = 8'h98;
   localparam  REG_ADDR_05 = 8'h99;
   localparam  REG_ADDR_06 = 8'h9A;
   localparam  REG_ADDR_07 = 8'h9B;
   localparam  REG_ADDR_08 = 8'h9C;
   localparam  REG_ADDR_09 = 8'h9F;
   localparam  REG_ADDR_10 = 8'hA1;
   localparam  REG_ADDR_11 = 8'hA2;
   localparam  REG_ADDR_12 = 8'hA3;
   localparam  REG_ADDR_13 = 8'hA4;
   localparam  REG_ADDR_14 = 8'hA5;
   localparam  REG_ADDR_15 = 8'hA6;
   localparam  REG_ADDR_16 = 8'hA7;
   localparam  REG_ADDR_17 = 8'hA8;
   localparam  REG_ADDR_18 = 8'hA9;
   localparam  REG_ADDR_19 = 8'hAA;
   localparam  REG_ADDR_20 = 8'hAB;
   
   localparam  DATA_00 = 8'hE0;
   localparam  DATA_01 = 8'h00;
   localparam  DATA_02 = 8'h00;
   localparam  DATA_03 = 8'hC0;
   localparam  DATA_04 = 8'h03;
   localparam  DATA_05 = 8'h02;
   localparam  DATA_06 = 8'hE0;
   localparam  DATA_07 = 8'h1E;
   localparam  DATA_08 = 8'h30;
   localparam  DATA_09 = 8'h00;
   localparam  DATA_10 = 8'h00;
   localparam  DATA_11 = 8'hA4;
   
   
   /* internal lines */
   reg 	                        SDA_out;
   reg 	                        SCL_out;
   reg 	                        done_out;
   reg [TRANSITION_CYCLE_MSB:0] cycle_count;
   reg [4:0] 			write_count;
   reg [31:0] 			bit_count;
   reg [SDA_BUFFER_MSB:0] 	SDA_BUFFER;
   iic_fsm_t                    curr_state, next_state;
   wire 			next_reg;
   
   /* push MSB of serial data & set output lines for different states */   
   always @ (posedge clk, posedge rst) begin
      if (rst || curr_state == IDLE) begin
	 SDA_out <= 1'b1;
	 SCL_out <= 1'b1;
      end
      else if (curr_state == INIT && next_reg) begin
	 SDA_out <= 1'b0;
      end
      else if (curr_state == SETUP) begin
	 SDA_out <= SDA_BUFFER[SDA_BUFFER_MSB];
      end
      else if (curr_state == CLK_RISE && cycle_count == TRANSITION_CYCLE/2 &&
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

   assign SDA = SDA_out;
   assign SCL = SCL_out;
   assign done = done_out;

   always @ (posedge clk, posedge rst) begin
      // reset-end condition
      if (rst) begin
	 SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR00,
			ACK, DATA00, ACK, STOP_BIT};
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
	   0:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR01, ACK,
			    DATA01, ACK, STOP_BIT};
	   1:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR02, ACK,
			    DATA02, ACK, STOP_BIT};
	   2:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR03, ACK,
			    DATA03, ACK, STOP_BIT};
	   3:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR04, ACK,
			    DATA04, ACK, STOP_BIT};
	   4:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR05, ACK,
			    DATA05, ACK, STOP_BIT};
	   5:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR06, ACK,
			    DATA06, ACK, STOP_BIT};
	   6:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR07, ACK,
			    DATA07, ACK, STOP_BIT};
	   7:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR08, ACK,
			    DATA08, ACK, STOP_BIT};
	   8:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR09, ACK,
			    DATA09, ACK, STOP_BIT};
	   9:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR10, ACK,
			    DATA10, ACK, STOP_BIT};
	   10:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR11, ACK,
			     DATA11, ACK, STOP_BIT};
	   11:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR12, ACK,
			     DATA12, ACK, STOP_BIT};
	   12:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR13, ACK,
			     DATA13, ACK, STOP_BIT};
	   13:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR14, ACK,
			     DATA14, ACK, STOP_BIT};
	   14:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR15, ACK,
			     DATA15, ACK, STOP_BIT};
	   15:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR16, ACK,
			     DATA16, ACK, STOP_BIT};
	   16:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR17, ACK,
			     DATA17, ACK, STOP_BIT};
	   17:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR18, ACK,
			     DATA18, ACK, STOP_BIT};
	   18:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR19, ACK,
			     DATA19, ACK, STOP_BIT};
	   19:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR20, ACK,
			     DATA20, ACK, STOP_BIT};
	   20:SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR21, ACK,
			     DATA21, ACK, STOP_BIT};
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

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst)
	curr_state <= INIT;
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
	INIT: begin
	   if (next_reg)
	     next_state = START;
	   else
	     next_state = INIT;
	end
	START: begin
	   if (next_reg)
	     next_state = SETUP;
	   else
	     next_state = CLK_FALL;
	end
	CLK_FALL: begin
	   if (next_reg)
	     next_state = SETUP;
	   else
	     next_state = CLK_FALL;
	end
	SETUP: begin
	   if (next_reg) 
	     next_state = CLK_RISE;
	   else 
	     next_state = SETUP;
	end
	CLK_RISE: begin
	   if (next_reg && bit_count == SDA_BUFFER_MSB)
	     next_state = WAIT;
	   else if (next_reg)
	     next_state = CLK_FALL;
	   else
	     next_state = CLK_RISE;
	end
	WAIT: begin
	   if (next_reg && write_count != 5'd21)
	     next_state = INIT;
	   else if (next_reg)
	     next_state = IDLE;
	   else
	     next_state = WAIT;
	end
	default:
	  next_state = IDLE;
      endcase // case (curr_state)
   end // always_comb begin

endmodule // iic_config


/* @COMMENTING COMPLETE; EOF */
