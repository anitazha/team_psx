
module vram_to_vga(
		   input logic 	       clk, rst.
		   input logic 	       enable,
		   input logic 	       color_mode,
		   input logic [16:0]  vram_out,
		   input logic [9:0]   x_tl, y_tl, x_br, y_br,
		   input logic [9:0]   x, y, 
		   output logic [18:0] vram_addr,
		   output logic [7:0]  r, g, b);

   /* Parameters */
   localparam COL_MAX     = 'd640;
   localparam ROW_MAX     = 'd480;
   
