//`define sim

`ifdef sim
module top;
   logic         CLOCK_50;
   logic [3:0] 	 KEY;
   wire [15:0] 	 SRAM_DQ;
   logic 		 VGA_HS, VGA_VS;
   logic 		 VGA_BLANK_N, VGA_SYNC_N, VGA_CLK;
   logic [7:0] 	 VGA_R, VGA_G, VGA_B;
   logic [17:0]  LEDR;
   logic 		 SRAM_CE_N, SRAM_OE_N, SRAM_WE_N, SRAM_LB_N, SRAM_UB_N;
   logic [19:0]  SRAM_ADDR;
`else
module top(
		   input logic 	       CLOCK_50,
		   input logic [3:0]   KEY,
		   input logic [17:0]  SW,
		   inout wire [15:0]   SRAM_DQ,
		   output logic        VGA_HS, VGA_VS,
		   output logic        VGA_BLANK_N, VGA_SYNC_N, VGA_CLK,
		   output logic [7:0]  VGA_R, VGA_G, VGA_B,
		   output logic [17:0]  LEDR,
		   output logic        SRAM_CE_N, SRAM_OE_N, SRAM_WE_N, SRAM_LB_N, SRAM_UB_N,
		   output logic [19:0] SRAM_ADDR);
`endif // !`ifdef sim
   
   /* Parameters */
   parameter color_order   = 192'hee5544_77dd99_ef4523_aa3399_22dd88_4f5f2f_1dabbd_badfed;
   
   
   /* Internal Lines */
   logic [9:0] 				   dis_w, dis_h, dis_x, dis_y;
   logic 					   clk_100MHz, clk_33MHz, clk_50MHz;
   logic 					   rst;
   logic [9:0] 				   w_x, w_y, w_x_n, w_y_n;
   logic 					   locked, c0, c1;
   
   logic 					   VGA_re;
   logic [18:0] 			   VGA_addr;
   logic [23:0] 			   VGA_data;
   logic 					   GPU_re, GPU_we;
   logic [18:0] 			   GPU_addr;
   wire [15:0] 				   GPU_data_in, GPU_data_out;
   wire [15:0] 				   sram_dq_out, sram_dq_in;
   logic [15:0] 			   GPU_data_v;
   logic 					   color_mode;
   logic 					   blk;
   logic [14:0] 			   b_addr;
   logic [15:0] 			   b_data, b_data_n;
   logic [26:0] 			   count;
   logic [7:0][23:0] 		   color, color_n;
	logic vram_ctrl, GPU_en;
   
   assign rst = ~KEY[0];
   
   assign GPU_data_in = GPU_data_v;
   
   assign SRAM_DQ = (~SRAM_WE_N) ? sram_dq_out : 16'bz;
   assign sram_dq_in = SRAM_DQ;
   
   /* VRAM Controller */
   vram_control vc(.x_tl(dis_x),
				   .y_tl(dis_y),
				   .dis_w(dis_w),
					.VGA_ctrl(vram_ctrl),
				   .*);

   /* Display Controller */
   display_out dc(.clk_50MHz(clk_50MHz),
				  .enable(1'b1),
				  .vram_out(VGA_data),
				  .x_tl(dis_x),
				  .y_tl(dis_y),
				  .dis_w(dis_w),
				  .dis_h(dis_h),
				  .vram_xy(VGA_addr),
				  .vram_re(VGA_re),
				  .*);

   /* PLL */
`ifdef sim
   initial begin
	  clk_33MHz = 0;
	  forever #6 clk_33MHz = ~clk_33MHz;
   end

   initial begin
	  clk_83MHz = 0;
	  forever #2 clk_83MHz = ~clk_83MHz;
   end

   initial begin
	  CLOCK_50 = 0;
	  #2 CLOCK_50 = 1;
	  forever #4 CLOCK_50 = ~CLOCK_50;
   end

   initial begin
	  KEY[0] = 1'b0;
	  #2;
	  
	  KEY[0] = 1'b1;
   end
`else
   pll_psx pl(.areset(rst),
			  .inclk0(CLOCK_50),
			  .c0(c0),
			  .c1(c1),
			  .locked(locked));

   assign clk_50MHz = CLOCK_50 & locked;
   assign clk_33MHz = c0 & locked;
   assign clk_100MHz = c1 & locked;
   
`endif // !`ifdef sim
   
   assign LEDR[15:0] = GPU_data_out;
   
   /* GPU impersonater */
   always_ff @(posedge clk_33MHz, posedge rst) begin
      if (rst) begin
		 w_x <= 10'd3;
		 w_y <= 10'd3;
		 count <= 27'd0;
		 color <= color_order;
      end
      else begin
		 w_x <= w_x_n;
		 w_y <= w_y_n;
		 count <= count + 27'd1;
		 color <= color_n;
	  end
   end
   
   //blocky bb(.address(b_addr), .clock(clk_33MHz), .q(b_data_n));
   
	assign GPU_addr = (GPU_we) ? {w_y[8:0], w_x} : {1'b0, SW[17:0]};
	assign GPU_re = ~KEY[2] & ~GPU_we;
	
   always_comb begin
      /* Defaults */
      dis_x = 10'd3;
      dis_y = 10'd3;
      dis_w = 10'd640;
      dis_h = 10'd480;
	  
      color_mode = 1'b0;

      GPU_we = 1'b0;

      GPU_data_v = 16'd0;
      
      w_x_n = w_x;
      w_y_n = w_y;

      color_n = color;

	  /*
	  if ((w_x < (10'd243)) &
		  (w_y < (10'd123))) begin
		
		if (w_x == (10'd242)) begin
	    w_x_n = dis_x;
	    w_y_n = w_y + 10'd1;
	 end
	 else begin
	    w_x_n = w_x + 10'd1;
	 end
	 
	 GPU_we = 1'b1;
	 GPU_data_v = b_data;
end */
      if (count[26] & GPU_en &
		  (w_x < (dis_x + dis_w)) & 
		  (w_y < (dis_y + dis_h))) begin
		 
		 if (w_x == (dis_x + dis_w - 10'd1)) begin
			w_x_n = dis_x;
			w_y_n = w_y + 10'd1;
		 end
		 else begin
			w_x_n = w_x + 10'd1;
		 end
		 
		 GPU_we = 1'b1;
		 
		 if (w_x < 10'd160) begin
			GPU_data_v = {color[0][23:19], color[0][15:11], color[0][7:3]};
		 end
		 else if (w_x < 10'd320) begin
			GPU_data_v = {color[1][23:19], color[1][15:11], color[1][7:3]};
		 end
		 else if (w_x < 10'd480) begin
			GPU_data_v = {color[2][23:19], color[2][15:11], color[2][7:3]};
		 end
		 else begin
			GPU_data_v = {color[3][23:19], color[3][15:11], color[3][7:3]};
		 end
      end // if (count[26] &...
      else if (count == 27'h7FF_FFFF) begin
		 color_n[0] = color[1];
		 color_n[1] = color[2];
		 color_n[2] = color[3];
		 color_n[3] = color[4];
		 color_n[4] = color[5];
		 color_n[5] = color[6];
		 color_n[6] = color[7];
		 color_n[7] = color[0];
      end // if (count[26])
      else if (!count[26]) begin
		 w_x_n = dis_x;
		 w_y_n = dis_y;
      end 
   end // always_comb


endmodule // top

