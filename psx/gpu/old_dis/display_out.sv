
module display_out(
				   input logic 	       clk_50MHz, rst,
				   input logic 	       enable,
				   input logic [23:0]  vram_out,
				   input logic [9:0]   x_tl, y_tl, 
				   input logic [9:0]   dis_w, dis_h, 
				   output logic [18:0] vram_xy,
				   output logic        vram_re,
				   output logic        blk, vram_ctrl,
				   output logic [7:0]  VGA_R, VGA_G, VGA_B,
				   output logic        VGA_HS, VGA_VS,
				   output logic        VGA_CLK, VGA_BLANK_N, VGA_SYNC_N);
   
   /* Parameters */
   localparam SCREEN_W      = 32'd640;
   localparam SCREEN_H      = 32'd480;
   
   /* Interal Lines */
   logic [9:0] 						   x, y;
   logic [9:0] 						   future_x, future_y;
   
   logic 							   hs, vs, col_porch;

   logic [31:0] 					   mult_x, mult_y;
   logic [31:0] 					   mult_x_next, mult_y_next;
   
   logic [9:0] 						   int_x, int_y;
   logic [9:0] 						   int_x_next, int_y_next;

   logic [9:0] 						   x_tl_hold, y_tl_hold, dis_w_hold, dis_h_hold;
   
   logic 							   flag, flag_ld;
   logic 							   x_porch;
   logic 							   v_blk, h_blk;
   logic [23:0] 					   stored_color, storing_color, storing_color_next;
   logic [9:0] 						   stored_row_addr, stored_row_addr_next;
   logic [9:0] 						   stored_addr, stored_addr_next, storing_addr, storing_addr_next;
   logic 							   storing, storing_next;
   logic [9:0] 						   row_addr;
   
   
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
			   .address(row_addr),
			   .q(stored_color),
			   .data(storing_color),
			   .wren(storing));

   assign row_addr = (storing) ? storing_addr : stored_row_addr;
   
   /* Assign VGA lines */
   assign VGA_CLK = ~clk_50MHz;
   assign VGA_BLANK_N = ~blk;
   assign VGA_SYNC_N = 1'b0;
   
   assign VGA_HS = hs;
   assign VGA_VS = vs;
   
   assign VGA_R = ((enable) ? ((y[0]) ? 
							   vram_out[7:0] : stored_color[7:0]): 8'd0);
   assign VGA_G = ((enable) ? ((y[0]) ? 
							   vram_out[15:8] : stored_color[15:8]) : 8'd0);
   assign VGA_B = ((enable) ? ((y[0]) ? 
							   vram_out[23:16] : stored_color[23:16]) : 8'd0);   

   /* GPU param hold registers */
   always_ff @(posedge clk_50MHz, posedge rst) begin
      if (rst) begin
		 dis_w_hold <= 10'd0;
		 dis_h_hold <= 10'd0;
		 x_tl_hold <= 10'd0;
		 y_tl_hold <= 10'd0;
      end
      else begin
		 dis_w_hold <= dis_w;
		 dis_h_hold <= dis_h;
		 x_tl_hold <= x_tl;
		 y_tl_hold <= y_tl;
      end // else: !if(rst)
   end // always_ff @
   
   /* Retrieving and Pixel buffer logic */
   always_comb begin
      /* Defaults */
      vram_xy = 18'd0;
      vram_re = 1'b0;

      stored_addr_next = 10'd0;
	  stored_row_addr_next = stored_addr;
      storing_addr_next = 10'd0;
      storing_color_next = 24'd0;
      storing_next = 1'b0;

      future_x = 10'd0;
      future_y = 10'd0;

      /* Determine future pipelined x and y */
	  if (x == 11'd639) begin
		 future_x = 10'd0;
      end
      else begin
		 future_x = x + 10'd1;
      end
	  
	  if (y == 10'd520) begin
		 future_y = 10'd0;
	  end
	  else begin
		 future_y = y;
	  end
      
      /* Calculate and translate x and y */
      mult_x_next = ({22'd0, dis_w_hold} * {22'd0, future_x});
      mult_y_next = ({22'd0, dis_h_hold} * {22'd0, future_y + ~flag});
      
      int_x_next = ((mult_x / SCREEN_W) + 
					{22'd0, x_tl_hold});
      int_y_next = ((mult_y / SCREEN_H) + 
					{22'd0, y_tl_hold});
	  
      /* If its time to get more pixels, start doing so */
      if (~blk & y[0]) begin
		 vram_re = 1'b1;
		 vram_xy = {int_y[8:0], int_x[9:0]};
		 storing_addr_next = x;
		 storing_color_next = vram_out;
		 storing_next = 1'b1;
      end
	  else begin
		 if (x == 10'd639) begin
			stored_addr_next = 10'd0;
		 end
		 else begin
			stored_addr_next = x + 10'd1;
		 end
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
   end // always_ff @

   /* Storing (row hold write) registers */
   always_ff @(posedge clk_50MHz, posedge rst) begin
      if (rst) begin
		 stored_row_addr <= 10'd0;
		 stored_addr <= 10'd0;
		 storing_addr <= 10'd0;
		 storing_color <= 24'd0;
		 storing <= 1'b0;
      end
      else begin
		 stored_row_addr <= stored_row_addr_next;
		 stored_addr <= stored_addr_next;
		 storing_addr <= storing_addr_next;
		 storing_color <= storing_color_next;
		 storing <= storing_next;
      end
   end // always_ff @

   /* Interpolated xy hold register */
   always_ff @(posedge clk_50MHz, posedge rst) begin
      if (rst) begin
		 mult_x <= 10'd0;
		 mult_y <= 10'd0;
		 int_x <= 32'd0;
		 int_y <= 32'd0;
      end
      else begin
		 mult_x <= mult_x_next;
		 mult_y <= mult_y_next;
		 int_x <= int_x_next;
		 int_y <= int_y_next;
      end
   end

endmodule // display_out
