module top(
	   input logic 	       CLOCK_50,
	   input logic [3:0]   KEY,
	   inout logic [15:0]  SRAM_DQ,
	   output logic [7:0]  VGA_R, VGA_G, VGA_B,
	   output logic        VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N,
	   output logic        VGA_CLK,
	   output logic        SRAM_CE_N, SRAM_OE_N, SRAM_UB_N, SRAM_LB_N, SRAM_WE_N,
	   output logic [19:0] SRAM_ADDR);

   /* Internal Lines */
   enum 		       logic [1:0] {WRITE, READY, OUTPUT} state, next_state;
   logic 		       reset, HS, VS, blank;
   logic [9:0] 		       row, col;
   logic [9:0] 		       x_w, y_w, next_x_w, next_y_w;
   logic [15:0] 	       data[640][480]; 	       
   
   /* SRAM Interface */
   assign SRAM_CE_N = 1'b0;
   assign SRAM_UB_N = 1'b0;
   assign SRAM_LB_N = 1'b0;

   assign VGA_SYNC_N = 1'b0;
   assign VGA_CLK = ~CLOCK_50;
   assign VGA_BLANK_N = ~blank;

   assign SRAM_DQ = (~SRAM_WE_N) ? data[y_w][x_w] : 'bz;
   
   assign reset = ~KEY[0];
   
   vga v(.*);

   /* Control FSM */
   always_ff @(posedge CLOCK_50, posedge reset) begin
      if (reset) begin
	 state <= WRITING;
	 x_w <= 10'd0;
	 y_w <= 10'd0;
      end
      else begin
	 state <= next_state;
	 x_w <= next_x_w;
	 y_w <= next_y_w;
      end
   end // always_ff @

   /* Logic for Control FSM */
   always_comb begin
      /* Defaults */
      next_state = state;
      next_x_w = x_w;
      next_y_w = y_w;

      VGA_R = 8'd0;
      VGA_G = 8'd0;
      VGA_B = 8'd0;

      SRAM_OE_N = 1'b1;
      SRAM_WE_N = 1'b1;
      SRAM_ADDR = {y_w, x_w};
      
      case (state)
	WRITING: begin
	   if (y_w == 'd639) begin
	      next_state = READY;
	   end
	   if (x_w == 'd479) begin
	      next_x_w = 10'd0;
	      next_y_w = y_w + 10'd1;
	   end
	   else begin
	      next_x_w = x_w + 10'd1;
	   end

	   SRAM_WE_N = 1'b0;
	   SRAM_ADDR = {y_w, x_w};
	end
	READY: begin
	   if (~KEY[1]) begin
	      next_state = OUTPUT;
	   end
	end
	OUTPUT: begin
	   SRAM_OE_N = 1'b0;

	   SRAM_ADDR = {row, col};
	   
	   VGA_R = {SRAM_DQ[14:10], 3'b0};
	   VGA_G = {SRAM_DQ[9:5], 3'b0};
	   VGA_B = {SRAM_DQ[4:0], 3'b0};
	end
      endcase // case (state)
   end // always_comb

   /* Data mem */
   initial begin
      data = $readmemh("data.dat");
   end

endmodule // top
