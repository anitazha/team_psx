
module display_out(
				   input logic 	       clk_50MHz, rst,
				   input logic 	       enable,
				   input logic [23:0]  vram_out,
				   input logic [9:0]   x_tl, y_tl, 
				   input logic [9:0]   dis_w, dis_h, 
				   output logic [18:0] vram_xy,
				   output logic        vram_re,
				   output logic blk, vram_ctrl,
				   output logic [7:0]  VGA_R, VGA_G, VGA_B,
				   output logic        VGA_HS, VGA_VS,
				   output logic        VGA_CLK, VGA_BLANK_N, VGA_SYNC_N);
   
   /* Parameters */
   localparam SCREEN_W      = 32'd640;
   localparam SCREEN_H      = 32'd480;
   
   /* Interal Lines */
   logic [9:0] 						   x, y;
   logic 							   hs, vs, col_porch;
   
   logic [31:0] 					   int_x, int_y;
	
	logic flag, flag_ld;
	logic x_porch;
	logic v_blk, h_blk;
	logic [23:0] stored_color;
	
	/* Prevent GPU from initiating reads/writes before we take VRAM */
	assign vram_ctrl = vram_re | x_porch; 
   
   /* VGA module; from Prof Bill Nace */
   vga v(.HS(hs),
		 .VS(vs),
		 .CLOCK_50(clk_50MHz),
		 .reset(rst),
		 .v_blank(v_blk),
		 .h_blank(h_blk),
		 .col_porch(x_porch),
		 .row(y),
		 .col(x));
		 
		 assign blk = v_blk | h_blk;
		 
   /* Row Store memory */
	row_hold rh(.clock(clk_50MHz),
	.address(x),
	.q(stored_color),
	.data(vram_out),
	.wren(vram_re));
   
   /* Assign VGA lines */
   assign VGA_CLK = ~clk_50MHz;
   assign VGA_BLANK_N = ~blk;
   assign VGA_SYNC_N = 1'b0;
   
   assign VGA_HS = hs;
   assign VGA_VS = vs;

   assign VGA_R = (enable) ? (((flag & y[0]) | (~flag & ~y[0])) ? vram_out[7:0] : stored_color[7:0]): 8'd0;
   assign VGA_G = (enable) ? (((flag & y[0]) | (~flag & ~y[0])) ? vram_out[15:8] : stored_color[15:8]) : 8'd0;
   assign VGA_B = (enable) ? (((flag & y[0]) | (~flag & ~y[0])) ? vram_out[23:16] : stored_color[23:16]) : 8'd0;   

   /* Retrieving and Pixel buffer logic */
   always_comb begin
      /* Defaults */
      vram_xy = 18'd0;
      vram_re = 1'b0;
	  
      /* Calculate and translate x and y */
      int_x = (({22'd0, dis_w} * {22'd0, x}) / SCREEN_W) + {22'd0, x_tl};
      int_y = (({22'd0, dis_h} * {22'd0, y}) / SCREEN_H) + {22'd0, y_tl};
      
      /* If its time to get more pixels, start doing so */
      if (~blk & (flag & y[0]) | (~flag & ~y[0])) begin
		 vram_re = 1'b1;
		 vram_xy = {int_y[8:0], int_x[9:0]};
      end
   end // always_comb
	
	/* Interlace flag register */
	always_ff @(posedge clk_50MHz, posedge rst) begin
	if (rst) begin
	flag <= 1'b1;
	flag_ld <= 1'b1;
	end
	else begin
	if (v_blk & flag_ld) begin
	flag <= ~flag;
	flag_ld <= 1'b0;
	end
	else if (~v_blk) begin
	flag_ld <= 1'b1;
	end
	end
	end

endmodule // display_out
