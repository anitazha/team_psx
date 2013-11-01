

module test_mem_top(input wire RESET, SYSCLK_P, SYSCLK_N,
		    input logic 	BN, BW, BC, BE,
		    //input logic [7:0] 	GPIO_DIP,
		    output logic [7:0] 	GPIO_LED_LS);

   /* state definitions */
   localparam W_INIT = 5'b00001;
   localparam W_WAIT = 5'b00010;
   localparam R_INIT = 5'b00100;
   localparam R_WAIT = 5'b01000;
   localparam DONE   = 5'b10000;
   
   wire		clk, rst;

   reg [31:0] 	CPU_ADDR, CPU_ADDR_ROM, CPU_DATA_I, CPU_DATA_O, CPU_DATA_O_R;
   reg [31:0] 	CPU_DATA;
   reg 		CPU_REN, CPU_WEN;
   reg 		CPU_ACK, CPU_ACK_R;

   reg [4:0] 	curr_state, next_state;
   reg 		curr_REN, next_REN;
   reg 		curr_WEN, next_WEN;
   
   reg [7:0] 	GPIO_LED_LS_o;

   
   /* Clock Generation */
   IBUFDS #(.DIFF_TERM("TRUE"),
	    .IBUF_LOW_PWR("TRUE"),
	    .IOSTANDARD("DEFAULT"))
   clk_ibufds (.O(clk),
	       .I(SYSCLK_P),
	       .IB(SYSCLK_N));
   
   
   /* memory module */
   mem_controller mem_c(.clk(clk),
			.rst(rst),
			.DAT_ADDR(CPU_ADDR),
			.DAT_DATA_I(CPU_DATA_I),
			.DAT_REN(CPU_REN),
			.DAT_WEN(CPU_WEN),
			.DAT_ACK(CPU_ACK),
			.DAT_DATA_O(CPU_DATA_O),
			
			.INS_ADDR(CPU_ADDR_ROM),
			.INS_REN(CPU_REN),
			.INS_ACK(CPU_ACK_R),
			.INS_DATA_O(CPU_DATA_O_R),
			.*);
   
   assign rst = RESET;
   assign CPU_DATA = BN ? CPU_DATA_O: CPU_DATA_O_R;
   
   assign GPIO_LED_LS =  (BE ? CPU_DATA[15:8] : 
			  (BC ? CPU_DATA[23:16] :
			   (BW ? CPU_DATA[31:24] : 
			    (BN ? CPU_DATA[7:0] : CPU_DATA[7:0] ))));
			 
   assign CPU_ADDR     = 32'h00000100;
   assign CPU_ADDR_ROM = 32'hBFC00000;
   assign CPU_DATA_I   = 32'h12345678;
   assign CPU_REN = curr_REN;
   assign CPU_WEN = curr_WEN;
   
   /* FSM next state logic */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state <= W_INIT;
	 curr_REN <= 1'b0;
	 curr_WEN <= 1'b0;
      end
      else begin
	 curr_state <= next_state;
	 curr_REN <= next_REN;
	 curr_WEN <= next_WEN;
      end
   end
   
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state = curr_state;
      next_REN = curr_REN;
      next_WEN = curr_WEN;

      case (curr_state)
	W_INIT: begin
	   next_WEN = 1'b1;
	   next_state = W_WAIT;
	end

	W_WAIT: begin
	   if (CPU_ACK) begin
	      next_WEN = 1'b0;
	      next_state = R_INIT;
	   end
	   else begin
	      next_state = W_WAIT;
	   end
	end

	R_INIT: begin
	   if (~CPU_ACK) begin
	      next_REN = 1'b1;
	      next_state = R_WAIT;
	   end
	   else begin
	      next_state = R_INIT;
	   end
	end

	R_WAIT: begin
	   if (CPU_ACK) begin
	      next_REN = 1'b0;
	      next_state = DONE;
	   end
	   else begin
	      next_state = R_WAIT;
	   end
	end

	DONE: begin
	   next_state = DONE;
	end
      endcase // case (curr_state)
   end
	   
   
endmodule // test_mem_top

   
		    
