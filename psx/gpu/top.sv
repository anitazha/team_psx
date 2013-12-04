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
	   output logic [17:0] LEDR,
	   output logic        SRAM_CE_N, SRAM_OE_N, SRAM_WE_N, SRAM_LB_N, SRAM_UB_N,
	   output logic [19:0] SRAM_ADDR);
`endif // !`ifdef sim
   
   /* Parameters */
   parameter color_order   = 192'hee5544_77dd99_ef4523_aa3399_22dd88_4f5f2f_1dabbd_badfed;
   
   
   /* Internal Lines */
   logic [9:0] 		       dis_w, dis_h, dis_x, dis_y;
   logic 		       clk_100MHz, clk_33MHz, clk_50MHz;
   logic 		       rst;
   logic [9:0] 		       w_x, w_y, w_x_n, w_y_n;
   logic 		       locked, c0, c1;
   
   logic 		       VGA_re;
   logic [8:0] 		       VGA_y;
   logic [9:0] 		       VGA_x;
   logic [23:0] 	       VGA_data;
   logic 		       GPU_re, GPU_we;
   logic [18:0] 	       GPU_addr;
   wire [15:0] 		       GPU_data_in, GPU_data_out;
   wire [15:0] 		       sram_dq_out, sram_dq_in;
   logic [15:0] 	       GPU_data_v;
   logic 		       color_mode;
   logic 		       blk;
   logic [14:0] 	       b_addr;
   logic [15:0] 	       b_data, b_data_n;
   logic [26:0] 	       count;
   logic [7:0][23:0] 	       color, color_n;
   logic 		       GPU_en;
   logic 		       enable;
   
   logic [31:0] 	       main_bus;
   logic 		       main_bus_rdy, main_bus_re, to_gp0, to_gp1;
   logic 		       fifo_full;
   logic [31:0] 	       gpu_read, gpu_stat;
   
   logic [19:0] 	       inst_addr, inst_addr_n;
   logic [19:0] 	       inst_count, inst_count_n;
   
   logic [11:0] 	       inst_type, inst_type_n;
   enum 		       logic [1:0] {FETCH, LOAD} inst_state, inst_state_n;
   
   assign rst = ~KEY[0];
   
   assign SRAM_DQ = (~SRAM_WE_N) ? sram_dq_out : 16'bz;
   assign sram_dq_in = SRAM_DQ;
   
   /* VRAM Controller */
   vram_control vc(.x_tl(dis_x),
		   .dis_w(dis_w),
		   .*);

   /* Display Controller */
   display_out dc(.clk_50MHz(clk_50MHz),
		  .enable(enable),
		  .clk_33MHz(clk_33MHz),
		  .vram_we(VGA_we),
		  .vram_data(VGA_data),
		  .y_tl(dis_y),
		  .dis_h(dis_h),
		  .vram_y(VGA_y),
		  .vram_re(VGA_re),
		  .*);
   
   /* GPU */
   gpu gp(.clk(clk_33MHz),
	  .rst(rst),
	  .vram_bus_in(GPU_data_out),
	  .vram_bus_out(GPU_data_in),
	  .vram_addr(GPU_addr),
	  .gpu_en(GPU_en),
	  .vram_re(GPU_re),
	  .vram_we(GPU_we),
	  .display_x(dis_x),
	  .display_y(dis_y),
	  .display_w(dis_w),
	  .display_h(dis_h),
	  .display_color_mode(color_mode),
	  .display_enable(enable),
	  .*);
   
   /* Instruction feed */

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
   
   //assign LEDR[15:0] = GPU_data_out;

   /* Instruction ROM */
   inst_rom ir(.clock(clk_33MHz), .q(main_bus), .address(inst_addr));
   
   /* Instruction getting register */
   always_ff @(posedge clk_33MHz, posedge rst) begin
      if (rst) begin
	 inst_addr <= 10'd0;
	 inst_type <= 12'h1E8;
	 inst_state <= FETCH;
	 inst_count <= 20'd3000;
      end
      else begin
	 inst_addr <= inst_addr_n;
	 inst_type <= inst_type_n;
	 inst_state <= inst_state_n;
      end
   end
   
   /* Instruction logic */
   always_comb begin
      /* Defaults */
      inst_addr_n = inst_addr;
      inst_type_n = inst_type;
      inst_state_n = inst_state;
      inst_count_n = inst_count;

      
      to_gp0 = 1'b0;
      to_gp1 = 1'b0;
      
      case (inst_state)
	FETCH: begin
	   if (inst_count != 20'd0) begin
	      inst_addr_n = inst_addr + 10'd1;
	      inst_type_n = inst_type >> 1;
	      inst_count_n = inst_count - 20'd1;
	      if (~fifo_full) begin
		 inst_state_n = LOAD;
	      end
	   end
	end
	LOAD: begin
	   inst_state_n = FETCH;
	   
	   if (inst_type[0]) begin
	      to_gp1 = 1'b1;
	   end
	   else begin
	      to_gp0 = 1'b1;
	   end
	end
      endcase
   end

endmodule // top

