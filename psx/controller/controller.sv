
module controller_io(input logic        clk, rst, start,
		     input logic 	DATA, //ACK,
		     output logic 	COMMAND, ATT, 
		     output logic 	c_clk,
		     output logic 	SLCT, STRT, UP, RGHT, DOWN, LEFT,
		     output logic 	L1, L2, R1, R2, TRI, SQU, XXX, CIR,
		     output logic [7:0] RJOY_X, RJOY_Y, LJOY_X, LJOY_Y,
		     output logic 	RJOY, LJOY);

   /* PARAMETERS */
   
   /* states */
   parameter [2:0] IDLE     = 3'b000;
   parameter [2:0] CLK_FALL = 3'b001;
   parameter [2:0] LOAD_TX  = 3'b010;
   parameter [2:0] CLK_RISE = 3'b011;
   parameter [2:0] LOAD_RX  = 3'b100;
   parameter [2:0] ACK_FALL = 3'b101;
   parameter [2:0] ACK_RISE = 3'b110;
   parameter [2:0] ERROR    = 3'b111;
     
   
   /* controller signatures */
   localparam ID_DIGITAL = 8'h41;  // digital
   localparam ID_ANALOGR = 8'h73;  // analog red LED
   localparam ID_ANALOGG = 8'h53;  // analog green LED

   /* controller type encoding */
   localparam TYPE_XX = 4'b0001;  // no type
   localparam TYPE_DI = 4'b0010;  // digital
   localparam TYPE_AR = 4'b0100;  // analog reg
   localparam TYPE_AG = 4'b1000;  // analog green
   
   /* byte sequences */
   localparam START_COMM   = 8'h01;  // signal start of transfer
   localparam DATA_REQUEST = 8'h42;  // PSX -> Controller; request data
   localparam DATA_READY   = 8'h5A;  // Controller -> PSX; data coming
   localparam NO_DATA      = 8'hFF;
   
   /* internal lines */
   reg [3:0] 	  c_type, load_c_type;
   
   reg 		  rst_count;
   reg [8:0] 	  count;
   reg 		  ATT_out, next_ATT;
   reg 		  COMMAND_out, next_COMMAND;

   reg 		  STRT_out, SLCT_out;
   reg 		  UP_out, DOWN_out, LEFT_out, RGHT_out;
   reg 		  L1_out, L2_out, R1_out, R2_out;
   reg 		  RJOY_out, LJOY_out;
   reg [7:0] 	  RJOY_X_out, RJOY_Y_out, LJOY_X_out, LJOY_Y_out;
   reg 		  TRI_out, SQU_out, XXX_out, CIR_out;
   
   reg 		  load_STRT, load_SLCT;
   reg 		  load_UP, load_DOWN, load_LEFT, load_RGHT;
   reg 		  load_L1, load_L2, load_R1, load_R2;
   reg 		  load_RJOY, load_LJOY;
   reg [7:0] 	  load_RJOY_X, load_RJOY_Y, load_LJOY_X, load_LJOY_Y;
   reg 		  load_TRI, load_SQU, load_XXX, load_CIR;
   
   reg 		  c_clk_out, next_c_clk;
   reg [4:0] 	  byte_no, next_byte_no;
   reg [2:0] 	  curr_state, next_state;
   reg [3:0] 	  curr_index, next_index;
   reg [7:0] 	  rx_data;
   reg [7:0] 	  tx_data, next_tx_data;

   wire 	  last_byte;

   /* DEBUG LINES */
   reg 		  ACK;

   assign STRT = STRT_out;
   assign SLCT = SLCT_out;
   assign DOWN = DOWN_out;
   assign LEFT = LEFT_out;
   assign RGHT = RGHT_out;
   assign UP = UP_out;
   assign L1 = L1_out;
   assign L2 = L2_out;
   assign R1 = R1_out;
   assign R2 = R2_out;
   assign RJOY = RJOY_out;
   assign LJOY = LJOY_out;
   assign RJOY_X = RJOY_X_out;
   assign RJOY_Y = RJOY_Y_out;
   assign LJOY_X = LJOY_X_out;
   assign LJOY_Y = LJOY_Y_out;
   assign TRI = TRI_out;
   assign SQU = SQU_out;
   assign XXX = XXX_out;
   assign CIR = CIR_out;
   
   assign c_clk   = c_clk_out;
   assign ATT     = ATT_out;
   assign COMMAND = COMMAND_out;
   
   /* determine if we are on the last byte of the transmission */
   assign last_byte = (c_type == TYPE_DI && byte_no == 5'd5) ||
		      (c_type == TYPE_AR && byte_no == 5'd9) ||
		      (c_type == TYPE_AG && byte_no == 5'd9);   
      
   /* controller clock synchronization */
   always @ (posedge clk, posedge rst_count, posedge rst) begin
      if (rst || rst_count) begin
	 count <= 'd0;
      end
      else begin
	 count <= count + 1;
      end
   end

   /* DEBUG LOGIC */
   /**/always @ (posedge clk, posedge rst) begin
      /**/if (rst) begin
	 /**/ACK <= 1'b1;
	 /**/end
      /**/else if (curr_state == ACK_FALL) begin
	 /**/ACK <= 1'b0;
	 /**/end
      /**/else if (curr_state == ACK_RISE) begin
	 /**/ACK <= 1'b1;
	 /**/end
      /**/else begin
	 /**/ACK <= 1'b1;
	 /**/end
      /**/end
   
   
   /* sample DATA line */
   always @ (posedge c_clk, /**/ negedge ACK /**/) begin
      /**/if (c_clk && ACK) begin
	 rx_data[curr_index] <= DATA;
      /**/end
      /**/else if (~ACK) begin
	 /**/if (byte_no == 'd2) begin
	    /**/rx_data <= ID_ANALOGR;
	 /**/end
	 /**/if (byte_no == 'd3) begin
	    /**/rx_data <= DATA_READY;
	 /**/end
      /**/end
   end
   
   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state  <= IDLE;
	 c_clk_out   <= 1'b1;
	 ATT_out     <= 1'b1;
	 COMMAND_out <= 1'b0;
	 tx_data     <= 8'h00;
	 curr_index  <= 4'd0;
	 byte_no     <= 5'd1;
	 c_type      <= 4'd0;

	 /* button values */
	 STRT_out    <= 1'b1;
	 SLCT_out    <= 1'b1;
	 UP_out      <= 1'b1;
	 DOWN_out    <= 1'b1;
	 LEFT_out    <= 1'b1;
	 RGHT_out   <= 1'b1;
	 L1_out      <= 1'b1;
	 L2_out      <= 1'b1;
	 R1_out      <= 1'b1;
	 R2_out      <= 1'b1;
	 RJOY_out    <= 1'b1;
	 LJOY_out    <= 1'b1;
	 RJOY_X_out  <= 8'h80;
	 RJOY_Y_out  <= 8'h80;	 
	 LJOY_X_out  <= 8'h80;
	 LJOY_Y_out  <= 8'h80;
	 TRI_out     <= 1'b1;
	 SQU_out     <= 1'b1;
	 XXX_out     <= 1'b1;
	 CIR_out     <= 1'b1;
	 
      end
      
      else begin
	 curr_state  <= next_state;
	 c_clk_out   <= next_c_clk;
	 ATT_out     <= next_ATT;
	 COMMAND_out <= next_COMMAND;
	 tx_data     <= next_tx_data;
	 curr_index  <= next_index;
	 byte_no     <= next_byte_no;
	 c_type      <= load_c_type;
	 
	 /* button values */
	 STRT_out    <= load_STRT;
	 SLCT_out    <= load_SLCT;
	 UP_out      <= load_UP;
	 DOWN_out    <= load_DOWN;
	 LEFT_out    <= load_LEFT;
	 RGHT_out    <= load_RGHT;
	 L1_out      <= load_L1;
	 L2_out      <= load_L2;
	 R1_out      <= load_R1;
	 R2_out      <= load_R2;
	 RJOY_out    <= load_RJOY;
	 LJOY_out    <= load_LJOY;
	 RJOY_X_out  <= load_RJOY_X;
	 RJOY_Y_out  <= load_RJOY_Y;	 
	 LJOY_X_out  <= load_LJOY_X;
	 LJOY_Y_out  <= load_LJOY_Y;
	 TRI_out     <= load_TRI;
	 SQU_out     <= load_SQU;
	 XXX_out     <= load_XXX;
	 CIR_out     <= load_CIR;
      end
   end
   
   
   /* FSM */
   always_comb begin
      /* DEFAULTS */
      next_state   = curr_state;
      next_c_clk   = c_clk_out;
      next_tx_data = tx_data;
      next_ATT     = ATT_out;
      next_index   = curr_index;
      next_COMMAND = COMMAND_out;
      next_byte_no = byte_no;

      load_STRT   = STRT_out;
      load_SLCT   = SLCT_out;
      load_UP     = UP_out;
      load_DOWN   = DOWN_out;
      load_LEFT   = LEFT_out;
      load_RGHT   = RGHT_out;
      load_L1     = L1_out;
      load_L2     = L2_out;
      load_R1     = R1_out;
      load_R2     = R2_out;
      load_RJOY   = RJOY_out;
      load_LJOY   = LJOY_out;
      load_RJOY_X = RJOY_X_out;
      load_RJOY_Y = RJOY_Y_out;	 
      load_LJOY_X = LJOY_X_out;
      load_LJOY_Y = LJOY_Y_out;
      load_TRI    = TRI_out;
      load_SQU    = SQU_out;
      load_XXX    = XXX_out;
      load_CIR    = CIR_out;
      load_c_type = c_type;
      
      rst_count    = 1'b0;
 
      case (curr_state)
	/* wait for system to start communication */
	IDLE: begin
	   if (start) begin
	      next_state   = CLK_FALL;
	      next_tx_data = START_COMM;
	      next_ATT     = 1'b0;
	      next_index   = 4'd0;
	   end
	   else begin
	      next_state = IDLE;
	   end
	end

	/* controller clock fall */
	CLK_FALL: begin
	   next_state = LOAD_TX;
	   next_c_clk = 1'b0;
	   rst_count  = 1'b1;
	end

	/* put value on the DATA line */
	LOAD_TX: begin
	   next_COMMAND = tx_data[curr_index];

	   if (count >= 'd200) begin
	      next_state = CLK_RISE;
	   end
	end

	/* controller clock rise - sample rx data here */
	CLK_RISE: begin
	   next_state = LOAD_RX;
	   next_c_clk = 1'b1;
	end

	/* read value from DATA line */
	LOAD_RX: begin

	   /* wait for clock to be ready */
	   if (count >= 'd400) begin
	      /* if byte transmission not complete, send next bit */
	      if (curr_index != 4'd7) begin
		 next_index = curr_index + 'd1;
		 next_state = CLK_FALL;
	      end
	      /* if complete */
	      else begin
		 /* move to idle if finished sending last byte */
		 if (last_byte) begin
		    next_state = IDLE;
		    next_index = 4'd0;
		    next_ATT   = 1'b1;

		    case (c_type)
		      TYPE_DI: begin
			load_L2  = rx_data[0];
			load_R2  = rx_data[1];
			load_L1  = rx_data[2];
			load_R1  = rx_data[3];
			load_TRI = rx_data[4];
			load_CIR = rx_data[5];
			load_XXX = rx_data[6];
			load_SQU = rx_data[7];
		      end
		      TYPE_AR: begin
			 load_LJOY_Y = rx_data;
		      end
		      TYPE_AG: begin
			 load_LJOY_Y = rx_data;
		      end
		    endcase // case (c_type)
		 end
		 /* wait for ACK otherwise */
		 else begin
		    next_state = ACK_FALL;
		 end
	      end
	   end

	   else begin
	      next_state = LOAD_RX;
	   end
	end

	/* wait for controller to send ACK */
	ACK_FALL: begin
	   if (~ACK) begin
	      next_state = ACK_RISE;
	   end
	   else begin
	      next_state = ACK_FALL;
	   end
	end

	ACK_RISE: begin
	   if (ACK) begin
	      case (byte_no)
		1: begin
		   next_tx_data = DATA_REQUEST;
		   next_state = CLK_FALL;   
		end
		2: begin
		   next_tx_data = NO_DATA;
		   
		   if (rx_data == ID_DIGITAL) begin
		      load_c_type = TYPE_DI;
		      next_state = CLK_FALL;
		   end
		   else if (rx_data == ID_ANALOGR) begin
		      load_c_type = TYPE_AR;
		      next_state = CLK_FALL;
		   end
		   else if (rx_data == ID_ANALOGG) begin
		      load_c_type = TYPE_AG;
		      next_state = CLK_FALL;
		   end
		   else begin
		      next_state = ERROR;
		   end
		end
		3: begin
		   if (rx_data != DATA_READY) begin
		      next_state = ERROR;
		   end
		   else begin
		      next_tx_data = NO_DATA;
		      next_state = CLK_FALL;
		   end
		end
		4: begin
		   next_tx_data = NO_DATA;
		   
		   case (c_type)
		     TYPE_DI: begin
			next_state = CLK_FALL;
			
			load_SLCT = rx_data[0];
			load_STRT = rx_data[3];
			load_UP   = rx_data[4];
			load_RGHT = rx_data[5];
			load_DOWN = rx_data[6];
			load_LEFT = rx_data[7];
		     end
		     TYPE_AR: begin
			next_state = CLK_FALL;
			
			load_SLCT = rx_data[0];
			load_RJOY = rx_data[1];
			load_LJOY = rx_data[2];
			load_STRT = rx_data[3];
			load_UP   = rx_data[4];
			load_RGHT = rx_data[5];
			load_DOWN = rx_data[6];
			load_LEFT = rx_data[7];
		     end
		     TYPE_AG: begin
			next_state = CLK_FALL;
			
			load_STRT = rx_data[3];
			load_UP   = rx_data[4];
			load_RGHT = rx_data[5];
			load_DOWN = rx_data[6];
			load_LEFT = rx_data[7];
		     end
		     default: begin
			next_state = ERROR;
		     end
		   endcase // case (c_type)
		end // case: 4
		5: begin
		   next_tx_data = NO_DATA;
		   
		   case (c_type)
		     TYPE_AR: begin
			next_state = CLK_FALL;
			
			load_L2  = rx_data[0];
			load_R2  = rx_data[1];
			load_L1  = rx_data[2];
			load_R1  = rx_data[3];
			load_TRI = rx_data[4];
			load_CIR = rx_data[5];
			load_XXX = rx_data[6];
			load_SQU = rx_data[7];
		     end
		     TYPE_AG: begin
			next_state = CLK_FALL;
			
			load_L2  = rx_data[0];
			load_L1  = rx_data[1];
			load_SQU = rx_data[2];
			load_TRI = rx_data[3];
			load_R1  = rx_data[4];
			load_CIR = rx_data[5];
			load_XXX = rx_data[6];
			load_R2  = rx_data[7];
		     end
		     default: begin
			next_state = ERROR;
		     end
		   endcase // case (c_type)
		end
		6: begin
		   next_tx_data = NO_DATA;
		   next_state = CLK_FALL;
		   
		   load_RJOY_X = rx_data;
		end
		7: begin
		   next_tx_data = NO_DATA;
		   next_state = CLK_FALL;
		   
		   load_RJOY_Y = rx_data;
		end
		8: begin
		   next_tx_data = NO_DATA;
		   next_state = CLK_FALL;
		   
		   load_LJOY_X = rx_data;
		end
	      endcase // case (byte_no)
		
	      next_index = 4'd0;
	      next_byte_no = byte_no + 'd1;
	   end
	   else begin
	      next_state = ACK_RISE;
	   end
	end // case: ACK_RISE

	/* error in controller protocol */
	ERROR: begin
	   next_state = ERROR;
	   next_ATT = 1'b1;
	end
      endcase // case (curr_state)
   end // always_comb

endmodule // controller_io
