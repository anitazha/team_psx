module gpu(
	              input wire 	 clk, rst,
	              input wire 	 to_gp0, to_gp1,
	              input wire 	 main_bus_re,
	              input wire 	 gpu_en,
	              input wire [31:0]  main_bus,
	              input wire [15:0]  vram_bus_in,
	              output wire [15:0] vram_bus_out,
	              output reg [18:0]  vram_addr,
	              output wire [31:0] gpu_stat, gpu_read,
	              output reg 	 main_bus_rdy,
	              output wire 	 fifo_full,
	              output reg 	 vram_re, vram_we,
	              output wire [9:0]  display_x, display_y, display_w, display_h,
		      output wire 	 display_color_mode, display_enable);


   /* Just set static values */
   always_comb begin
      vram_bus_out = 16'd0;
      gpu_stat = 32'h14802000;
      gpu_read = 32'd2;
      main_bus_rdy = 1'b1;
      fifo_full = 1'b0;
      vram_re = 1'b0;
      vram_we = 1'b0;
      display_x = 10'd1;
      display_y = 10'd1;
      display_w = 10'd320;
      display_h = 10'd240;
      display_color_mode = 1'b0;
      display_enable = 1'b1;
   end // always_comb
endmodule // gpu

      
