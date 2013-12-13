

module joy_controller(input logic clk, rst,
		      input logic 	  wen,
		      input logic 	  ren,
		      input logic [3:0]   ben,
		      input logic [31:0]  data_i,
		      input logic [31:0]  addr,
		      
		      
		      /* Controller Interface */
		      input logic 	  joy_ack,
		      input logic 	  joy_data,
		      output logic 	  joy_clk,
		      output logic 	  joy_cmd,
		      output logic 	  joy_att,

		      /* Register Outputs */
		      output logic 	  rx_fifo_not_empty,
		      output logic [31:0] JOY_RX_DATA,
		      output logic [31:0] JOY_STAT,
		      output logic [31:0] JOY_MODE_CTRL,
		      output logic [31:0] JOY_BAUD);

   /* Parameters */
   localparam RX_DATA_ADDR   = 32'h1F80_1040;
   localparam STAT_ADDR      = 32'h1F80_1044;
   localparam MODE_CTRL_ADDR = 32'h1F80_1048;
   localparam BAUD_ADDR      = 32'h1F80_104C;

   localparam IDLE         = 9'b000000001;
   localparam START_DELAY0 = 9'b000000010;
   localparam START_DELAY1 = 9'b000000100;
   localparam START_DELAY2 = 9'b000001000;
   localparam LOAD_BIT     = 9'b000010000;
   localparam READ_BIT     = 9'b000100000;
   localparam CLK_FALL     = 9'b001000000;
   localparam CLK_RISE     = 9'b010000000;
   localparam TX_END       = 9'b100000000;
   

   localparam MUL1a = 2'b00;
   localparam MUL1b = 2'b01;
   localparam MUL16 = 2'b10;
   localparam MUL64 = 2'b11;
   
   /* Internal Lines */
   reg [20:0]	  baudrate_timer;
   reg [31:0] 	  joy_tx_data;
   
   reg [63:0] 	  joy_rx_data_out;
   reg [10:0] 	  joy_stat_out;
   reg [15:0] 	  joy_mode_out;
   reg [15:0] 	  joy_ctrl_out;
   reg [15:0] 	  joy_baud_out;

   reg 		  joy_clk_out;

   reg 		  joy_ctrl_ack;
   reg 		  start_tx;
   reg 		  shift_rx_fifo;
   reg [7:0] 	  temp_rx_byte;
   
   reg [4:0] 	  rx_byte_cnt, next_rx_byte_cnt;
   reg 		  tx_flag_1, next_tx_flag_1;
   reg 		  tx_flag_2, next_tx_flag_2;
   
   reg [8:0] 	  curr_state, next_state;
   reg 		  curr_clk_en, next_clk_en;
   reg 		  curr_cmd, next_cmd;
   reg [2:0] 	  curr_bit_cnt, next_bit_cnt;
   
   wire [1:0] 	  baud_reload_factor;
   wire 	  TXEN;
   wire 	  irq_flag_0;
   wire 	  irq_flag_1;
   wire 	  irq_flag_2;
   wire [1:0] 	  rx_irq_m;
   
   assign irq_flag_0 = joy_ctrl_out[10] & (joy_stat_out[0] | joy_stat_out[2]);
   assign irq_flag_1 = joy_ctrl_out[11] &
		       ((rx_irq_m == 2'b00) & (rx_byte_cnt == 4'd1)) |
		       ((rx_irq_m == 2'b01) & (rx_byte_cnt == 4'd2)) |
		       ((rx_irq_m == 2'b10) & (rx_byte_cnt == 4'd4)) |
		       ((rx_irq_m == 2'b11) & (rx_byte_cnt == 4'd8));
   assign irq_flag_2 = joy_ctrl_out[12] & joy_stat_out[7];	       
   assign rx_irq_m = joy_ctrl_out[9:8];
   
   assign baud_reload_factor = joy_mode_out[1:0];
   assign TXEN = joy_ctrl_out[0];
   
   assign joy_clk = curr_clk_en ? joy_clk_out : 1'b1;
   assign joy_cmd = curr_cmd;
   assign joy_att = joy_ctrl_out[1];
   
   assign JOY_RX_DATA = joy_rx_data_out[31:0];
   assign JOY_STAT = {baudrate_timer, joy_stat_out};
   assign JOY_MODE_CTRL = {joy_ctrl_out, joy_mode_out};
   assign JOY_BAUD = {16'b0, joy_baud_out};

   /*##################################################
    #  JOY_STAT - individual bit combinational logic  #
    ##################################################*/

   /* BIT 0 - TX Ready Flag 1 (1 = Ready/Started) */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_stat_out[0] <= 1'b0;
      end
      else begin
	 if (tx_flag_1) begin
	    joy_stat_out[0] <= 1'b1;
	 end
	 else begin
	    joy_stat_out[0] <= 1'b0;
	 end
      end
   end

   /* BIT 1 - RX FIFO Not Empty (0 = Empty, 1 = Not Empty) */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_stat_out[1] <= 1'b0;
      end
      else begin
	 if (rx_byte_cnt) begin
	    joy_stat_out[1] <= 1'b1;
	 end
	 else begin
	    joy_stat_out[1] <= 1'b0;
	 end
      end
   end

   /* BIT 2 - TX Ready Flag 2 (1 = Ready/Finished) */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_stat_out[2] <= 1'b0;
      end
      else begin
	 if (tx_flag_2) begin
	    joy_stat_out[2] <= 1'b1;
	 end
	 else begin
	    joy_stat_out[2] <= 1'b0;
	 end
      end
   end

   /* BIT 3 - RX Parity Error (0 = No, 1 = Error; Wrong parity if enabled) */
   always @ (posedge clk, posedge rst) begin
      joy_stat_out[3] <= 1'b0;
   end

   /* BIT 4-6 - Unknown (zero) */
   always @ (posedge clk, posedge rst) begin
      joy_stat_out[6:4] <= 3'b000;
   end

   /* BIT 7 - /ACK Input Level (0 = High, 1 = Low) */
   always @ (posedge clk, posedge rst) begin
      joy_stat_out[7] <= ~joy_ack;
   end

   /* BIT 8 - Unknown (zero) */
   always @ (posedge clk, posedge rst) begin
      joy_stat_out[8] <= 1'b0;
   end

   /* BIT 9 - Interrupt Request (0 = None, 1 = IRQ) (sticky) */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_stat_out[9] <= 1'b0;
      end
      else begin
	 /* clear interrupt if write 1 to JOY_CTRL.4 */
	 if (joy_ctrl_ack) begin
	    joy_stat_out[9] <= 1'b0;
	 end
	 else begin
	    if (irq_flag_0 | irq_flag_1 | irq_flag_2) begin
	       joy_stat_out[9] <= 1'b1;
	    end
	 end
      end
   end

   /* BIT 10 - Unknown (zero) */
   always @ (posedge clk, posedge rst) begin
      joy_stat_out[10] <= 1'b0;
   end

   /*##################################################
    #  END                                            #
    ##################################################*/   

   /* JOY_RX_DATA */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_rx_data_out <= 64'b0;
	 shift_rx_fifo = 1'b0;
      end
      else begin
	 /* remove first byte from fifo */
	 if (shift_rx_fifo) begin
	    shift_rx_fifo <= 1'b0;
	    joy_rx_data_out <= {8'b0, joy_rx_data_out[63:8]};
	 end
	 /* shift the fifo */
	 else if (ren && addr == RX_DATA_ADDR) begin
	    shift_rx_fifo <= 1'b1;
	 end
	 else if (curr_state == TX_END) begin
	    /* put rx byte into fifo */
	    if (joy_ctrl_out[1] | joy_ctrl_out[2]) begin
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 0] <= temp_rx_byte[0];
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 1] <= temp_rx_byte[1];
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 2] <= temp_rx_byte[2];
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 3] <= temp_rx_byte[3];
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 4] <= temp_rx_byte[4];
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 5] <= temp_rx_byte[5];
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 6] <= temp_rx_byte[6];
	       joy_rx_data_out[({rx_byte_cnt, 3'b0}) + 7] <= temp_rx_byte[7];
	    end
	 end
      end
   end
	 
   /* JOY_TX_DATA */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_tx_data <= 32'b0;
	 start_tx <= 1'b0;
      end
      else begin
	 if (start_tx) start_tx <= 1'b0;
	 
	 /* capture writes to register */
	 if (wen && addr == RX_DATA_ADDR) begin
	    if (ben[0]) joy_tx_data[ 7: 0] <= data_i[ 7: 0];
	    if (ben[1]) joy_tx_data[15: 8] <= data_i[15: 8];
	    if (ben[2]) joy_tx_data[23:16] <= data_i[23:16];
	    if (ben[3]) joy_tx_data[31:24] <= data_i[31:24];
	 
	    if (ben[0]) begin
	       start_tx <= 1'b1;
	    end
	 end
      end
   end
   
   /* JOY_MODE - Mode Register */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_mode_out <= 16'b0;
      end
      else begin
	 /* bits (15-9, 7 & 6) always zero */
	 joy_mode_out[ 7:6] = 2'b0;
	 joy_mode_out[15:9] = 7'b0;

	 /* capture writes to register */
	 if (wen && addr == MODE_CTRL_ADDR) begin
	    if (ben[0]) joy_mode_out[5:0] <= data_i[5:0];
	    if (ben[1]) joy_mode_out[8] <= data_i[8];
	 end
      end
   end

   /* JOY_CTRL - Control Register */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_ctrl_out <= 16'b0;
	 joy_ctrl_ack <= 1'b0;
      end
      else begin
	 if (joy_ctrl_ack) joy_ctrl_ack <= 1'b0;
	 
	 /* bits (15, 14, 7) always zero */
	 joy_ctrl_out[15:14] <= 2'b0;
	 joy_ctrl_out[7] <= 1'b0;

	 /* capture writes to register */
	 if (wen && addr == MODE_CTRL_ADDR) begin
	    if (ben[2]) joy_ctrl_out[ 6:0] <= data_i[22:16];
	    if (ben[3]) joy_ctrl_out[13:8] <= data_i[29:24];

	    /* JOY_CTRL.4 - Acknowledge */
	    if (data_i[20] & ben[2]) begin
	       joy_ctrl_ack <= 1'b1;
	    end
	 end
      end
   end

   /* JOY_BAUD - Baudrate Reload Value Register */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_baud_out <= 16'h0088;
      end
      else begin
	 if (wen && addr == BAUD_ADDR) begin
	    if (ben[3]) joy_baud_out[15:8] <= data_i[31:24];
	    if (ben[2]) joy_baud_out[ 7:0] <= data_i[23:16];
	 end
      end
   end
   
   /* Baudrate Timer */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 baudrate_timer <= 21'b0;
      end
      else begin
	 /* reload baudrate timer when writing to JOY_BAUD */
	 if ((wen && addr == BAUD_ADDR) || baudrate_timer == 21'b0) begin
	    case (baud_reload_factor)
	      /* baudrate_timer = (reload_value x 1)/2 */
	      MUL1a, MUL1b: begin
		 baudrate_timer <= {6'b0, joy_baud_out[15:1]};
	      end
	      /* baudrate_timer = (reload_value x 16)/2 */ 
	      MUL16: begin
		 baudrate_timer <= {2'b0, joy_baud_out[15:0], 3'b0};
	      end
	      /* baudrate_timer = (reload_value x 64)/2 */
	      MUL64: begin
		 baudrate_timer <= {joy_baud_out[15:0], 5'b0};
	      end
	    endcase // case (baud_reload_factor)
	 end
	 /* decrement timer */
	 else begin
	    baudrate_timer <= baudrate_timer - 21'b1;
	 end
      end
   end	 

   /* ~250kHz Clock to Controller */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 joy_clk_out <= 1'b0;
      end
      else begin
	 if (baudrate_timer == 21'b0) begin
	    joy_clk_out <= ~joy_clk_out;
	 end
      end
   end


   /* latch value from data line */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 temp_rx_byte <= 8'b0;
      end
      else begin
	 /* reset buffer on IDLE */
	 if (curr_state == IDLE) begin
	    temp_rx_byte <= 8'b0;
	 end
	 /* load in bits from data line */
	 else if (curr_state == READ_BIT) begin
	    /* write to rx fifo only if JOY_CTRL.1 or JOY_CTRL.2 */
	    if (joy_ctrl_out[1] | joy_ctrl_out[2]) begin
	       temp_rx_byte[curr_bit_cnt] <= joy_data;
	    end
	 end
      end
   end

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state   <= IDLE;
	 curr_clk_en  <= 1'b0;
	 curr_cmd     <= 1'b1;
	 curr_bit_cnt <= 3'b000;

	 rx_byte_cnt <= 4'd0;
	 
	 tx_flag_1 <= 1'b0;
	 tx_flag_2 <= 1'b0;
      end
      else begin
	 curr_state   <= next_state;
	 curr_clk_en  <= next_clk_en;
	 curr_cmd     <= next_cmd;
	 curr_bit_cnt <= next_bit_cnt;
	 
	 rx_byte_cnt <= next_rx_byte_cnt;
	 
	 tx_flag_1 <= next_tx_flag_1;
	 tx_flag_2 <= next_tx_flag_2;
      end
   end

   /* FSM */
   always_comb begin
      /* Defaults */
      next_state   = curr_state;
      next_clk_en  = curr_clk_en;
      next_bit_cnt = curr_bit_cnt;
      next_cmd     = curr_cmd;

      next_rx_byte_cnt = rx_byte_cnt;
      
      next_tx_flag_1 = tx_flag_1;
      next_tx_flag_2 = tx_flag_2;
      
      case (curr_state)
	/* wait for transfer to be initiated */
	IDLE: begin
	   if (start_tx) begin
	      next_state = START_DELAY0;
	      next_tx_flag_1 = 1'b1;
	   end
	   else begin
	      next_state = IDLE;
	   end
	end

	/* wait to sync with controller clock */
	START_DELAY0: begin
	   if (TXEN & joy_stat_out[2]) begin
	      next_state = START_DELAY1;
	      next_tx_flag_2 = 1'b0;
	   end
	   else begin
	      next_state = START_DELAY0;
	   end
	end
	START_DELAY1: begin
	   if (~joy_clk_out) begin
	      next_state = START_DELAY2;
	   end
	   else begin
	      next_state = START_DELAY1;
	   end
	end
	START_DELAY2: begin
	   if (joy_clk_out) begin
	      next_state = LOAD_BIT;
	      next_clk_en = 1'b1;
	      next_bit_cnt = 3'b0;
	   end
	   else begin
	      next_state = START_DELAY2;
	   end
	end

	/* put data on the line on falling edge */
	LOAD_BIT: begin
	   if (~joy_clk_out) begin
	      next_cmd = joy_tx_data[curr_bit_cnt];
	      next_state = CLK_RISE;
	   end
	   else begin
	      next_state = LOAD_BIT;
	   end
	end

	/* read bit from data line and store */
	READ_BIT: begin
	   /* initial bits */
	   if (curr_bit_cnt != 3'b111) begin
	      next_state = CLK_FALL;
	   end
	   /* last bit */
	   else begin
	      next_state = TX_END;
	      next_clk_en = 1'b0;
	   end
	end
	
	/* wait for clock to rise */
	CLK_RISE: begin
	   if (joy_clk_out) begin
	      next_state = READ_BIT;
	   end
	   else begin
	      next_state = CLK_RISE;
	   end
	end

	/* wait for clock to fall */
	CLK_FALL: begin
	   if (~joy_clk_out) begin
	      next_bit_cnt = curr_bit_cnt + 3'b1;
	      next_state = LOAD_BIT;
	   end
	   else begin
	      next_state = CLK_FALL;
	   end
	end

	/* end of byte transfer */
	TX_END: begin
	   /* stall if reading */
	   if (ren | shift_rx_fifo) begin
	      next_state = TX_END;
	   end
	   else begin
	      next_tx_flag_2 = 1'b1;
	      next_rx_byte_cnt = rx_byte_cnt + 4'd1;
	      next_state = IDLE;
	   end
	end
	
      endcase // case (curr_state)

   end  
   
endmodule // joy_controller
