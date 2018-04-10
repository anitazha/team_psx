
module test_controller(input logic        SYSCLK_P, SYSCLK_N,
		       input logic 	  RESET,
		       input logic 	  BC, BN, BE, BW, BS,
		       input logic 	  C_DATA, C_ACK,
		       output logic 	  C_COMMAND, C_ATT, C_CLK_OUT,
		       output logic [7:0] GPIO_LED_LS);

   reg       clk, rst, start, err;
   reg       DATA, ACK, COMMAND, ATT;
   reg       c_clk;
   reg       SLCT, STRT, UP, DOWN, RGHT, LEFT;
   reg       L1, L2, R1, R2, TRI, SQU, XXX, CIR;
   reg [7:0] RJOY_X, RJOY_Y, LJOY_X, LJOY_Y;
   reg 	     RJOY, LJOY;

   reg [7:0] LED;

   reg [15:0] counter;

   assign DATA = C_DATA;
   assign ACK  = C_ACK;
   assign C_COMMAND = COMMAND;
   assign C_ATT     = ATT;
   assign C_CLK_OUT = c_clk;
   
   wire [7:0] out1, out2, out3, out4, out5, out6;
   assign out1 = {SLCT, STRT, LJOY, RJOY, SQU, TRI, CIR, XXX};
   assign out2 = {L1, L2, R1, R2, UP, DOWN, LEFT, ,RGHT};
   assign out3 = LJOY_X;
   assign out4 = LJOY_Y;
   assign out5 = RJOY_X;
   assign out6 = RJOY_Y;

   IBUFDS #(.DIFF_TERM("TRUE"),
	    .IBUF_LOW_PWR("TRUE"),
	    .IOSTANDARD("DEFAULT"))
   clk_ibufds (.O(clk),
	       .I(SYSCLK_P),
	       .IB(SYSCLK_N));
   assign rst = RESET;
   
   
   /* LED output */
   assign LED = err ? 8'hAA : 
		(BN ? out2 : 
		 (BW ? out3 : 
		  (BS ? out4 : 
		   (BE ? out5 : 
		    (BC ? out6 : 
		     out1)))));
   
   assign GPIO_LED_LS = LED;

   controller_io C1(.*);

   
   /* counter for delay */
   always @ (posedge clk, posedge rst) begin
      if (rst || curr_state == INIT) begin
	 count <= 'd0;
      end
      else begin
	 count <= count + 'd1;
      end
   end // always @ (posedge clk, posedge rst)

   
   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state <= INIT;
	 start <= 1'b0;
      end
      else begin
	 curr_state <= next_state;
	 start <= next_start;
      end
   end
   
      
   /* controller FSM */
   always_comb begin
      /* DEFAULTS */
      next_state = curr_state;
      next_start = 1'b0;

      case (curr_state)
	INIT: begin
	   next_state = COUNT;
	end
	
	COUNT: begin
	   if (count > 512) begin
	      next_state = START_TX;
	      next_start = 1'b1;
	   end
	   else begin
	      next_state = COUNT;
	   end
	end

	START_TX: begin
	   next_state = WAIT;
	   next_start = 1'b0;
	end

	WAIT: begin
	   if (ATT) begin
	      next_state = INIT;
	   end
	   else begin
	      next_state = WAIT;
	   end
	end
      endcase // case (curr_state)
   end // always_comb
	   
   
   /*
   initial begin
      clk  <= 1'b0;
      forever #5 clk = ~clk;
   end

   initial begin
      start <= 1'b0;
      ACK <= 1'b1;
      DATA <= 1'b1;
      
      rst <= 1'b0;
      #1;
      rst <= 1'b1;
      #3;
      rst <= 1'b0;

      #5;
      start <= 1'b1;
      #10;
      start <= 1'b0;

      repeat (100000) begin
	 @(posedge clk);
      end
      $finish;
   end // initial begin
   */
    
endmodule // test_controller
