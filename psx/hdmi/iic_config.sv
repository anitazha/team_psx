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

   /* register addresses */
   localparam  REG_ADDR00 = 8'h41;  /* power-up & power-down */
   localparam  REG_ADDR01 = 8'h98;  /* required registers */
   localparam  REG_ADDR02 = 8'h9A;
   localparam  REG_ADDR03 = 8'h9C;
   localparam  REG_ADDR04 = 8'h9D;
   localparam  REG_ADDR05 = 8'hA2;
   localparam  REG_ADDR06 = 8'hA3;
   localparam  REG_ADDR07 = 8'hE0;
   localparam  REG_ADDR08 = 8'hF9;
   localparam  REG_ADDR09 = 8'h15;  /* video input format */
   localparam  REG_ADDR10 = 8'h16;  /* video output format */
   localparam  REG_ADDR11 = 8'h17;
   localparam  REG_ADDR12 = 8'h18;  /* CSC - color space converter */
   localparam  REG_ADDR13 = 8'hAF;  /* HDMI-DVI mode */
   localparam  REG_ADDR14 = 8'h40;  /* GC enable */
   localparam  REG_ADDR15 = 8'h4C;  /* GC Color Depth */
   localparam  REG_ADDR16 = 8'h01;  /* N Value */
   localparam  REG_ADDR17 = 8'h02;
   localparam  REG_ADDR18 = 8'h03;
   localparam  REG_ADDR19 = 8'h0A;  /* Audio Select */
   localparam  REG_ADDR20 = 8'h0B;  /* SPDIF Enable */
   localparam  REG_ADDR21 = 8'h0C;  /* I2S Enable */

   /* value that needs to be put in the above registers */
   localparam  DATA00 = 8'h10;      /* power-up */
   localparam  DATA01 = 8'h03;      /* values for required registers */
   localparam  DATA02 = 8'hE0;
   localparam  DATA03 = 8'h30;
   localparam  DATA04 = 8'h61;
   localparam  DATA05 = 8'hA4;
   localparam  DATA06 = 8'hA4;
   localparam  DATA07 = 8'hD0;
   localparam  DATA08 = 8'h00;
   localparam  DATA09 = 8'h00;      /* 4:4:4 */
   localparam  DATA10 = 8'h20;      /* 4:4:4, 12-bit */
   localparam  DATA11 = 8'h00;      /* 4:3 aspect ratio */
   localparam  DATA12 = 8'h46;
   localparam  DATA13 = 8'h06;
   localparam  DATA14 = 8'h80;
   localparam  DATA15 = 8'h00;
   localparam  DATA16 = 8'h00;
   localparam  DATA17 = 8'h18;
   localparam  DATA18 = 8'h00;
   localparam  DATA19 = 8'h10;
   localparam  DATA20 = 8'h8E;
   localparam  DATA21 = 8'h00;

   localparam  STOP_BIT = 1'b0;
   localparam  SDA_BUFFER_MSB = 27;
   
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
