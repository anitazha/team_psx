`default_nettype none
`include "gpu.vh"


module gpu(
	   input wire 	      clk, rst,
	   input wire 	      to_gp0, to_gp1, 
	   input wire 	      main_bus_re,
	   input wire 	      gpu_en,
	   input wire [31:0]  main_bus,
	   input wire [15:0]  vram_bus_in,
	   output wire [15:0] vram_bus_out,
	   output reg [18:0]  vram_addr,
	   output wire [31:0] gpu_stat, gpu_read,
	   output reg 	      main_bus_rdy,
	   output wire 	      fifo_full,
	   output reg 	      vram_re, vram_we,
	   output wire [9:0]  display_x, display_y, display_w, display_h,
	   output wire 	      display_color_mode, display_enable);

   /* Parameters */
   /* GPU CMDs Buffered */
   localparam GP0_B_NOP             = 'h03; // nop
   localparam GP0_B_INTREQ          = 'h1F; // Interrupt request
   
   localparam GP0_B_P3_MC_OQ        = 'h20; // Monochrome, 3-sided poly, opaque
   localparam GP0_B_P3_MC_ST        = 'h22; // Monochrome, 3-sided poly, semi-trans
   localparam GP0_B_P4_MC_OQ        = 'h28; // Monochrome, 4-sided poly, opaque
   localparam GP0_B_P4_MC_ST        = 'h2A; // Monochrome, 4-sided poly, semi-trans
   
   localparam GP0_B_P3_TX_OQ_BL     = 'h24; // Textured, 3-sided poly, opaque, blended
   localparam GP0_B_P3_TX_OQ_RW     = 'h25; // Textured, 3-sided poly, opaque, raw
   localparam GP0_B_P3_TX_ST_BL     = 'h26; // Textured, 3-sided poly, semi-trans, blended
   localparam GP0_B_P3_TX_ST_RW     = 'h27; // Textured, 3-sided poly, semi-trans, raw
   localparam GP0_B_P4_TX_OQ_BL     = 'h2C; // Textured, 4-sided poly, opaque, blended
   localparam GP0_B_P4_TX_OQ_RW     = 'h2D; // Textured, 4-sided poly, opaque, raw
   localparam GP0_B_P4_TX_ST_BL     = 'h2E; // Textured, 4-sided poly, semi-trans, blended
   localparam GP0_B_P4_TX_ST_RW     = 'h2F; // Textured, 4-sided poly, semi-trans, raw

   localparam GP0_B_P3_MC_OQ_SH     = 'h30; // Shaded, 3-sided poly, opaque
   localparam GP0_B_P3_MC_ST_SH     = 'h32; // Shaded, 3-sided poly, semi-trans
   localparam GP0_B_P4_MC_OQ_SH     = 'h38; // Shaded, 4-sided poly, opaque
   localparam GP0_B_P4_MC_ST_SH     = 'h3A; // Shaded, 4-sided poly, semi-trans

   localparam GP0_B_P3_TX_OQ_BL_SH  = 'h34; // Textured, shaded, 3-sided poly, opaque, blended
   localparam GP0_B_P3_TX_ST_BL_SH  = 'h36; // Textured, shaded, 3-sided poly, semi-trans, blended
   localparam GP0_B_P4_TX_OQ_BL_SH  = 'h3C; // Textured, shaded, 4-sided poly, opaque, blended
   localparam GP0_B_P4_TX_ST_BL_SH  = 'h3E; // Textured, shaded, 4-sided poly, semi-trans, blended

   localparam GP0_B_LN_MC_OQ        = 'h40; // Monochrome, line, opaque
   localparam GP0_B_LN_MC_ST        = 'h42; // Monochrome, line, semi-trans
   localparam GP0_B_PL_MC_OQ        = 'h48; // Monochrome, polyline, opaque
   localparam GP0_B_PL_MC_ST        = 'h4A; // Monochrome, polyline, semi-trans

   localparam GP0_B_LN_MC_OQ_SH     = 'h50; // Shaded, line, opaque
   localparam GP0_B_LN_MC_ST_SH     = 'h52; // Shaded, line, semi-trans
   localparam GP0_B_PL_MC_OQ_SH     = 'h58; // Shaded, polyline, opaque
   localparam GP0_B_PL_MC_ST_SH     = 'h5A; // Shaded, polyline, semi-trans
   
   localparam GP0_B_RV_MC_OQ        = 'h60; // Monochrome, rect variable, opaque
   localparam GP0_B_RV_MC_ST        = 'h62; // Monochrome, rect variable, semi-trans
   localparam GP0_B_R1_MC_OQ        = 'h68; // Monochrome, rect 1x1, opaque
   localparam GP0_B_R1_MC_ST        = 'h6A; // Monochrome, rect 1x1, semi-trans
   localparam GP0_B_R8_MC_OQ        = 'h70; // Monochrome, rect 8x8, opaque
   localparam GP0_B_R8_MC_ST        = 'h72; // Monochrome, rect 8x8, semi-trans
   localparam GP0_B_R16_MC_OQ       = 'h78; // Monochrome, rect 16x16, opaque
   localparam GP0_B_R16_MC_ST       = 'h7A; // Monochrome, rect 16x16, semi-trans

   localparam GP0_B_RV_TX_OQ_BL     = 'h64; // Textured, rect variable, opaque, blended
   localparam GP0_B_RV_TX_OQ_RW     = 'h65; // Textured, rect variable, opaque, raw
   localparam GP0_B_RV_TX_ST_BL     = 'h66; // Textured, rect variable, semi-trans, blended
   localparam GP0_B_RV_TX_ST_RW     = 'h67; // Textured, rect variable, semi-trans, raw
   localparam GP0_B_R1_TX_OQ_BL     = 'h6C; // Textured, rect 1x1, opaque, blended
   localparam GP0_B_R1_TX_OQ_RW     = 'h6D; // Textured, rect 1x1, opaque, raw
   localparam GP0_B_R1_TX_ST_BL     = 'h6E; // Textured, rect 1x1, semi-trans, blended
   localparam GP0_B_R1_TX_ST_RW     = 'h6F; // Textured, rect 1x1, semi-trans, raw
   localparam GP0_B_R8_TX_OQ_BL     = 'h74; // Textured, rect 8x8, opaque, blended
   localparam GP0_B_R8_TX_OQ_RW     = 'h75; // Textured, rect 8x8, opaque, raw
   localparam GP0_B_R8_TX_ST_BL     = 'h76; // Textured, rect 8x8, semi-trans, blended
   localparam GP0_B_R8_TX_ST_RW     = 'h77; // Textured, rect 8x8, semi-trans, raw
   localparam GP0_B_R16_TX_OQ_BL    = 'h7C; // Textured, rect 16x16, opaque, blended
   localparam GP0_B_R16_TX_OQ_RW    = 'h7D; // Textured, rect 16x16, opaque, raw
   localparam GP0_B_R16_TX_ST_BL    = 'h7E; // Textured, rect 16x16, semi-trans, blended
   localparam GP0_B_R16_TX_ST_RW    = 'h7F; // Textured, rect 16x16, semi-trans, raw

   localparam GP0_B_DRWMODE         = 'hE1; // Set various drawing params
   localparam GP0_B_TEXTWND         = 'hE2; // Set texture window
   localparam GP0_B_DRWWND_TL       = 'hE3; // Set top-left of drawing window
   localparam GP0_B_DRWWND_BR       = 'hE4; // Set bottom-right of drawing window
   localparam GP0_B_DRWWND_OS       = 'hE5; // Set drawing window offset
   localparam GP0_B_MSK             = 'hE6; // Set how mask bit is handled

   localparam GP0_B_CLRC            = 'h01; // Clear texture cache
   localparam GP0_B_FILRECT         = 'h02; // Fill rect in VRAM
   localparam GP0_B_CPYRECT_V2V     = 'h80; // Copy rect VRAM->VRAM
   localparam GP0_B_CPYRECT_C2V     = 'hA0; // Copy rect CPU->VRAM
   localparam GP0_B_CPYRECT_V2C     = 'hC0; // Copy rect VRAM->CPU
   
   /* GPU CMDs Not-Buffered */
   localparam GP0_NB_NOP            = 'h00; // nop; not put in fifo

   localparam GP1_NB_RST            = 'h00; // Reset GPU
   localparam GP1_NB_RST_CMDBUF     = 'h01; // Reset CMD fifo
   localparam GP1_NB_ACKINT         = 'h02; // Acknowledge interrupt
   localparam GP1_NB_DIS            = 'h03; // Enalbe display
   localparam GP1_NB_DMADIR         = 'h04; // Set DMA direction
   localparam GP1_NB_DIS_TL         = 'h05; // Set top-left of the display area
   localparam GP1_NB_DIS_HZ         = 'h06; // Set display area horizontal length
   localparam GP1_NB_DIS_VR         = 'h07; // Set display area verital length
   localparam GP1_NB_DIS_MODE       = 'h08; // Set display mode
   localparam GP1_NB_TEXT           = 'h09; // Enable textures
   localparam GP1_NB_GETINFO        = 'h10; // Get GPU info

   /* Some important constants */
   localparam GPU_STATUS_RST        = 'h14802000; // Reset status of GPU
   localparam POLYLINE_TERM         = 'h55555555;
   
   /* Internal Lines */
   /* Status reg lines */
   GPU_status_t GPU_status, GPU_status_new;
   logic 		      GPU_status_clr;
   
   logic [31:0] 	      GPU_read_reg, GPU_read_reg_new_NB, GPU_read_reg_new_V2C;
   logic 		      GPU_read_reg_ld_NB, GPU_read_reg_ld_V2C;

   logic [1:0] 		      xy_flip_reg, xy_flip_reg_new;

   logic [11:0] 	      x_tl, y_tl, x_br, y_br, x_off, y_off;
   logic [11:0] 	      x_tl_new, y_tl_new, x_br_new, y_br_new, x_off_new, y_off_new;

   logic [7:0] 		      text_mask_x, text_mask_y, text_mask_x_new, text_mask_y_new;
   logic [7:0] 		      text_off_x, text_off_y, text_off_x_new, text_off_y_new;

   logic [9:0] 		      dis_x_tl, dis_y_tl, dis_x_tl_new, dis_y_tl_new;
   logic [9:0] 		      dis_w, dis_h, dis_w_new, dis_h_new;
   
   /* FETCH STAGE */
   /* FIFO lines */
   logic [31:0] 	     cmd_fifo_cmd;
   logic 		     cmd_fifo_full, cmd_fifo_empty, cmd_fifo_clr, cmd_fifo_re;

   logic 		     set_gpu_irq;

   logic 		     gp1_text_en, gp0_text_en;

   /* PARSE STAGE */
   /* Command reg */
   CMD_t cmd, new_cmd;

   DECODE_t decode_state, decode_state_next;

   XYGEN_t xy_gen_state, xy_gen_state_next;

   CLUT_t clut_state, clut_state_next;

   TXPG_t txpg_state, txpg_state_next;

   FILL_t fill_state, fill_state_next;
   V2V_t v2v_state, v2v_state_next;
   V2C_t v2c_state, v2c_state_next;
   C2V_t c2v_state, c2v_state_next;
   
   logic 		     on_fourth, on_fourth_new;
   logic [7:0] 		     cmd_hold, cmd_hold_new;
   logic 		     decode_fifo_re;
   logic 		     xy_gen_on;
   logic 		     clut_on;
   logic 		     txpg_on;
   logic 		     fill_on;
   logic 		     v2v_on;
   logic 		     v2c_on;
   logic 		     c2v_on;   
   
   logic [1:0] 		     side0, side1, side2;

   logic [11:0] 	     min_x01, min_y01, min_x02, min_y02;
   logic [11:0] 	     max_x01, max_y01, max_x02, max_y02;

   logic [11:0] 	     xy_gen_min_x, xy_gen_max_x, xy_gen_min_y, xy_gen_max_y;
   logic [11:0] 	     xy_gen_y, xy_gen_y_new;
   logic [11:0] 	     xy_gen_x, xy_gen_x_new;
   logic [11:0] 	     xy_gen_i;

   logic [255:0][15:0] 	     clut;
   logic 		     clut_rdy, clut_rdy_next;
   logic [8:0] 		     clut_count, clut_count_next;
   logic [18:0] 	     clut_vram_addr;
   logic 		     clut_vram_re;
   logic 		     clut_ld;

   logic 		     txpg_rdy, txpg_rdy_next;
   logic [8:0] 		     txpg_count_x, txpg_count_x_next;
   logic [8:0] 		     txpg_count_y, txpg_count_y_next;
   logic [3:0] 		     txpg_base_x, txpg_base_x_next;
   logic 		     txpg_base_y, txpg_base_y_next;
   logic [18:0] 	     txpg_vram_addr;
   logic 		     txpg_vram_re;
   logic 		     txpg_ld;
   logic [3:0][15:0] 	     txpg_val;

   logic 		     fill_rdy, fill_rdy_next;
   logic [11:0] 	     fill_x, fill_y, fill_x_next, fill_y_next;
   logic [15:0] 	     fill_hold, fill_hold_next;
   logic [18:0] 	     fill_vram_addr;
   logic [15:0] 	     fill_vram_data;
   logic 		     fill_vram_we;

   logic                     v2v_rdy, v2v_rdy_next;
   logic [11:0] 	     v2v_x0, v2v_y0, v2v_x0_next, v2v_y0_next;
   logic [11:0] 	     v2v_x1, v2v_y1, v2v_x1_next, v2v_y1_next;
   logic [15:0] 	     v2v_hold, v2v_hold_next;
   logic [18:0] 	     v2v_vram_addr;
   logic [15:0] 	     v2v_vram_data;
   logic                     v2v_vram_we, v2v_vram_re;

   logic                     c2v_rdy, c2v_rdy_next;
   logic [11:0] 	     c2v_x, c2v_y, c2v_x_next, c2v_y_next;
   logic [15:0] 	     c2v_hold, c2v_hold_next;
   logic 		     c2v_low_read, c2v_low_read_next;
   logic [18:0] 	     c2v_vram_addr;
   logic [15:0] 	     c2v_vram_data;
   logic                     c2v_vram_we, c2v_vram_re;
   logic 		     c2v_fifo_re;

   logic                     v2c_rdy, v2c_rdy_next;
   logic [11:0] 	     v2c_x, v2c_y, v2c_x_next, v2c_y_next;
   logic [15:0] 	     v2c_hold, v2c_hold_next;
   logic [18:0] 	     v2c_vram_addr;
   logic                     v2c_vram_re;
   logic 		     main_bus_re_hold, main_bus_re_hold_new;
   
   logic [63:0] 	     u_trans_x, u_trans_y, u_trans_c;
   logic [63:0] 	     v_trans_x, v_trans_y, v_trans_c;
   logic [63:0] 	     r_trans_x, r_trans_y, r_trans_c;
   logic [63:0] 	     g_trans_x, g_trans_y, g_trans_c;
   logic [63:0] 	     b_trans_x, b_trans_y, b_trans_c;
   

   /* Stall */
   logic 		     pipeline_stall;
   

   /* DRAW STAGE */
   drawing_stage_t draw_stage, next_draw_stage;
   
   logic [`GPU_PIPELINE_WIDTH-1:0]       in_triangle;
   logic [1:0][`GPU_PIPELINE_WIDTH-1:0]  in_line;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	 in_rect;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	 in_rect_line;
   
   genvar 				 triangles, lines, rects;

   
   /* COLOR STAGE */
   color_stage_t color_stage, next_color_stage;
   
   logic [63:0] 			 f_u, f_v;
   logic [7:0] 				 m_u, m_v;

   /* Texture unit lines */
//   logic [255:0][255:0][15:0] 		 txpg;
   
   genvar 				 text_i;
     

   /* SHADER STAGE */
   shader_stage_t shader_stage, next_shader_stage;

   logic [`GPU_PIPELINE_WIDTH-1:0][63:0] int_r, int_g, int_b;
   logic [`GPU_PIPELINE_WIDTH-1:0][63:0] f_r, f_g, f_b;

   genvar 				 color_i;
   

   /* WRITEBACK STAGE */
   wb_stage_t wb_stage, next_wb_stage;

   WB_t wb_state, wb_state_next;
   
   logic 				 wb_stall;

   logic [18:0] 			 wb_vram_addr;
   logic [15:0] 			 wb_vram_data;
   logic 				 wb_vram_re, wb_vram_we;
   logic [7:0] 				 wb_count, wb_count_next;
   logic [15:0] 			 wb_hold, wb_hold_next;
   logic [7:0] 				 wb_r, wb_g, wb_b;
   



   
   /* #####################################################
      #                                                   #
      #                STATUS REGISTERS                   #
      #                                                   #
      ##################################################### */
   
   /* GPU Status register (0x1F801814) */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 GPU_status <= GPU_STATUS_RST;
      end
      else begin
	 if (GPU_status_clr) begin
	    GPU_status <= GPU_STATUS_RST;
	 end
	 else begin
	    GPU_status <= GPU_status_new;
	 end
      end
   end // always_ff @

   assign gpu_stat = GPU_status;

   /* Other flags */
   assign GPU_status_new.text_en = ((gp1_text_en == gp0_text_en) ? GPU_status.text_en :
				    (gp1_text_en != GPU_status.text_en) ? gp1_text_en : gp0_text_en);
   assign GPU_status_new.reserved = 1'b1;
   assign GPU_status_new.interlaced_parity = 1'b0;
   assign GPU_status_new.dma_rdy = 1'b1;
   always_comb begin
      /* Defaults */
      GPU_status_new.dma_fifo_state = 1'b0;
      
      case (GPU_status.dma_direction)
	2'd1: begin
	   GPU_status_new.dma_fifo_state = cmd_fifo_full;
	end
	2'd2: begin
	   GPU_status_new.dma_fifo_state = GPU_status_new.dma_rdy;
	end
	2'd3: begin
	   GPU_status_new.dma_fifo_state = GPU_status_new.VRAM2CPU_rdy;
	end
      endcase // case (GPU_status.dma_direction)
   end // always_comb
   
   /* GPU Read register (0x1F801810) */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 GPU_read_reg <= 32'b0;
      end
      else begin
	 if (GPU_read_reg_ld_NB) begin
	    GPU_read_reg <= GPU_read_reg_new_NB;
	 end
	 else if (GPU_read_reg_ld_V2C) begin
	    GPU_read_reg <= GPU_read_reg_new_V2C;
	 end
      end
   end

   assign gpu_read = GPU_read_reg;
   
   /* XY flip register (bit0 is x flip, bit1 is y flip*/
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 xy_flip_reg <= 2'b0;
      end
      else begin
	 xy_flip_reg <= xy_flip_reg_new;
      end
   end

   /* Draw area registers */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 x_tl <= 'd0;
	 y_tl <= 'd0;
	 x_br <= 'd0;
	 y_br <= 'd0;
	 x_off <= 'd0;
	 y_off <= 'd0;
      end
      else begin
	 x_tl <= x_tl_new;
	 y_tl <= y_tl_new;
	 x_br <= x_br_new;
	 y_br <= y_br_new;
	 x_off <= x_off_new;
	 y_off <= y_off_new;
      end // else: !if(rst)
   end // always_ff @

   /* Texture window register */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 text_mask_x <= 8'd0;
	 text_mask_y <= 8'd0;
	 text_off_x <= 8'd0;
	 text_off_y <= 8'd0;
      end
      else begin
	 text_mask_x <= text_mask_x_new;
	 text_mask_y <= text_mask_y_new;
	 text_off_x <= text_off_x_new;
	 text_off_y <= text_off_y_new;
      end // else: !if(rst)
   end // always_ff @
   
   /* Display area register */
   always_ff @(posedge clk, posedge rst) begin
     if (rst) begin
	dis_x_tl <= 10'd0;
	dis_y_tl <= 10'd0;
	dis_w <= 10'd0;
	dis_h <= 10'd0;
     end
     else begin
	dis_x_tl <= dis_x_tl_new;
	dis_y_tl <= dis_y_tl_new;
	dis_w <= dis_w_new;
	dis_h <= dis_h_new;
     end // else: !if(rst)
   end // always_ff @

   /* Hook up the display parameters */
   assign display_x = dis_x_tl;
   assign display_y = dis_y_tl;
   assign display_w = dis_w;
   assign display_h = dis_h;
   assign display_color_mode = GPU_status.depth;
   assign display_enable = ~GPU_status.display_en;
  
	





   
   /* #####################################################
      #                                                   #               
      #                 "FETCH" STAGE                     #
      #                                                   #
      ##################################################### */

   /* VRAM/Main memory access signal logic */
   assign vram_addr = (clut_vram_addr | txpg_vram_addr | wb_vram_addr |
		       fill_vram_addr | v2v_vram_addr | v2c_vram_addr |
		       c2v_vram_addr);
   assign vram_bus_out = (wb_vram_data | v2v_vram_data | 
			  c2v_vram_data | fill_vram_data);
   assign vram_we = (wb_vram_we | v2v_vram_we | c2v_vram_we | fill_vram_we);
   assign vram_re = (wb_vram_re | v2v_vram_re | c2v_vram_re | v2c_vram_re | 
		     clut_vram_re | txpg_vram_re);
   
   /* Command FIFO */
   fifo_16x32 cmd_fifo(.data_in(main_bus),
		       .we(to_gp0 & (main_bus != GP0_NB_NOP)),
		       .re(cmd_fifo_re),
		       .clr(cmd_fifo_clr),
		       .full(cmd_fifo_full),
		       .empty(cmd_fifo_empty),
		       .data_out(cmd_fifo_cmd),
		       .*);

   assign GPU_status_new.cmd_rdy = ~cmd_fifo_full;
   assign cmd_fifo_re = decode_fifo_re | c2v_fifo_re;
   assign fifo_full = cmd_fifo_full;
   
   /* Process Non-buffer commands immediately */
   always_comb begin
      /* Defaults */
      cmd_fifo_clr = 1'b0;
      
      GPU_read_reg_ld_NB = 1'b0;
      GPU_read_reg_new_NB = 32'b0;

      GPU_status_clr = 1'b0;
      GPU_status_new.irq = set_gpu_irq | GPU_status.irq;
      GPU_status_new.display_en = GPU_status.display_en;
      GPU_status_new.dma_direction = GPU_status.dma_direction;
      GPU_status_new.horizontal_res_1 = GPU_status.horizontal_res_1;
      GPU_status_new.vertical_res = GPU_status.vertical_res;
      GPU_status_new.video_mode = GPU_status.video_mode;
      GPU_status_new.depth = GPU_status.depth;
      GPU_status_new.interlaced = GPU_status.interlaced;
      GPU_status_new.horizontal_res_2 = GPU_status.horizontal_res_2;
      GPU_status_new.reverse = GPU_status.reverse;
      gp1_text_en = GPU_status.text_en;
      
      dis_x_tl_new = dis_x_tl;
      dis_y_tl_new = dis_y_tl;
      dis_w_new = dis_w;
      dis_h_new = dis_h;
      
      /* Process all GP1 commands (only non-buffered GP0 command is a nop... */
      if (to_gp1) begin
	 case (main_bus[31:24])
	   GP1_NB_RST: begin
	      GPU_status_clr = 1'b1;
	      cmd_fifo_clr = 1'b1;
	   end
	   GP1_NB_RST_CMDBUF: begin
	      cmd_fifo_clr = 1'b1;
	   end
	   GP1_NB_ACKINT: begin
	      /* Acknowledge interrupt */
	      GPU_status_new.irq = 1'b0;
	   end
	   GP1_NB_DIS: begin
	      /* Display enable/disable */
	      GPU_status_new.display_en = main_bus[0];
	   end
	   GP1_NB_DMADIR: begin
	      /* DMA direction */
	      GPU_status_new.dma_direction = main_bus[1:0];
	   end
	   GP1_NB_DIS_TL: begin
	      /* Display area VRAM */
	      dis_x_tl_new = main_bus[9:0];
	      dis_y_tl_new = main_bus[18:10];
	   end
	   GP1_NB_DIS_HZ: begin
	      /* Display width (hsync) */
	      dis_w_new = ((((main_bus[23:12] - main_bus[11:0]) >> 'd3) + 12'd2) & 12'h3F8);
	   end
	   GP1_NB_DIS_VR: begin
	      /* Display height (vsync) */
	      dis_h_new = (main_bus[19:10] - main_bus[9:0]);
	   end
	   GP1_NB_DIS_MODE: begin
	      /* Display mode */
	      GPU_status_new.horizontal_res_1 = main_bus[1:0];
	      GPU_status_new.vertical_res = main_bus[2];
	      GPU_status_new.video_mode = main_bus[3];
	      GPU_status_new.depth = main_bus[4];
	      GPU_status_new.interlaced = main_bus[5];
	      GPU_status_new.horizontal_res_2 = main_bus[6];
	      GPU_status_new.reverse = main_bus[7];
	   end
	   GP1_NB_TEXT: begin
	      /* Texture enable/disable */
	      gp1_text_en = main_bus[0];
	   end
	   GP1_NB_GETINFO: begin
	   case (main_bus[3:0])
	     'h02: begin
		/* Texture window setting */
		GPU_read_reg_ld_NB = 1'b1;
		GPU_read_reg_new_NB = {12'b0, text_off_y[4:0], text_off_x[4:0], 
				       text_mask_y[4:0], text_mask_x[4:0]};
	     end
	     'h03: begin
		/* Draw area top-left */
		GPU_read_reg_ld_NB = 1'b1;
		GPU_read_reg_new_NB = {12'b0, y_tl[9:0], x_tl[9:0]}; 
	     end
	     'h04: begin
		/* Draw area bottom-right */
		GPU_read_reg_ld_NB = 1'b1;
		GPU_read_reg_new_NB = {12'b0, y_br[9:0], x_br[9:0]};
	     end
	     'h05: begin
		/* Draw area offset */
		GPU_read_reg_ld_NB = 1'b1;
		GPU_read_reg_new_NB = {10'b0, y_off[10:0], x_off[10:0]};
	     end
	     'h07: begin
		/* GPU Version */
		GPU_read_reg_ld_NB = 1'b1;
		GPU_read_reg_new_NB = 32'h2;
	     end
	     'h08: begin
		/* 0s (?) */
		GPU_read_reg_ld_NB = 1'b1;
	     end
	   endcase // case (data_in[3:0])
	   end // case: GP1_NB_GETINFO
	 endcase // case (data_in[31:24])
      end // if (to_gp1)
   end









   
   /* #####################################################
      #                                                   #
      #               DECODE/PARSE STAGE                  #
      #                                                   #
      ##################################################### */

   /* Pipeline stall logic */
   assign pipeline_stall = wb_stall;

   /* New CMD module, an FSM for filling the cmd register and starting drawing,
      mem transfers, and doing other GP0 cmds */

   /* Decoder state storage */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 decode_state <= WAIT;
      end
      else begin
	 decode_state <= decode_state_next;
      end
   end

   /* Command Storage register */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 cmd_hold <= 8'b0;
      end
      else begin
	 cmd_hold <= cmd_hold_new;
      end
   end

   /* OnFourth Register - Determines if we're on the fourth vertex of a P4 */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 on_fourth <= 1'b0;
      end
      else begin
	 on_fourth <= on_fourth_new;
      end
   end

   /* Command (and thus next decode state) logic */
   always_comb begin
      /* Defaults */
      decode_state_next = decode_state;
      new_cmd = cmd;
      cmd_hold_new = cmd_hold;
      on_fourth_new = on_fourth;
      
      decode_fifo_re = 1'b0;

      set_gpu_irq = 1'b0;

      GPU_status_new.text_x = GPU_status.text_x;
      GPU_status_new.text_y = GPU_status.text_y;
      GPU_status_new.semi_trans_mode = GPU_status.semi_trans_mode;
      GPU_status_new.text_mode = GPU_status.text_mode;
      GPU_status_new.dither_mode = GPU_status.dither_mode;
      GPU_status_new.draw_to_display = GPU_status.draw_to_display;
      GPU_status_new.mask_en = GPU_status.mask_en;
      GPU_status_new.set_mask = GPU_status.set_mask;
      
      gp0_text_en = GPU_status.text_en;
      
      xy_flip_reg_new[0] = xy_flip_reg[0];
      xy_flip_reg_new[1] = xy_flip_reg[1];

      x_tl_new = x_tl;
      y_tl_new = y_tl;
      x_br_new = x_br;
      y_br_new = y_br;
      x_off_new = x_off;
      y_off_new = y_off;

      text_mask_x_new = text_mask_x;
      text_mask_y_new = text_mask_y;
      text_off_x_new = text_off_x;
      text_off_y_new = text_off_y;

      xy_gen_on = 1'b0;

      clut_on = 1'b0;
      txpg_on = 1'b0;

      fill_on = 1'b0;
      v2v_on = 1'b0;
      v2c_on = 1'b0;
      c2v_on = 1'b0;
      
      /* Process commands (or handle whats going on if in the middle of one) */
      case (decode_state)
	WAIT: begin
	   if (~cmd_fifo_empty) begin
	      cmd_hold_new = cmd_fifo_cmd[31:24];
	      on_fourth_new = 1'b0;
	      
	      /* Pick either move to getting next arg  or
	         handle function immediately depending on type.
	         Also, set as many of the command params as possible */
	      case (cmd_fifo_cmd[31:24])
		GP0_B_NOP: begin
		   /* nop */
		   decode_fifo_re = 1'b1;
		end
		GP0_B_INTREQ: begin
		   /* Interrupt request */
		   decode_fifo_re = 1'b1;
		   set_gpu_irq = 1'b1;
		end
		GP0_B_P3_MC_OQ, GP0_B_P4_MC_OQ: begin
		   /* Monochrome, opaque */
		   decode_state_next = GET_XY0;
		   
		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = NONE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end
		GP0_B_P3_MC_ST, GP0_B_P4_MC_ST: begin
		   /* Monochrome, semi-trans */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_MC_ST
		GP0_B_P3_TX_OQ_BL, GP0_B_P4_TX_OQ_BL: begin
		   /* Textured, opaque, blended */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = BLEND;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_TX_OQ_BL
		GP0_B_P3_TX_OQ_RW, GP0_B_P4_TX_OQ_RW: begin
		   /* Textured, opaque, raw */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = RAW;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_TX_OQ_RW
		GP0_B_P3_TX_ST_BL, GP0_B_P4_TX_ST_BL: begin
		   /* Textured, semi-trans, blended */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = BLEND;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_TX_ST_BL
		GP0_B_P3_TX_ST_RW, GP0_B_P4_TX_ST_RW: begin
		   /* Textured, semi-trans, raw */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = RAW;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_TX_OQ_RW
		GP0_B_P3_MC_OQ_SH, GP0_B_P4_MC_OQ_SH: begin
		   /* Shaded, opaque */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = SHADE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_MC_OQ_SH
		GP0_B_P3_MC_ST_SH, GP0_B_P4_MC_ST_SH: begin
		   /* Shaded, semi-trans */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = SHADE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_MC_ST_SH
		GP0_B_P3_TX_OQ_BL_SH, GP0_B_P4_TX_OQ_BL_SH: begin
		   /* Textured, shaded, opaque, blended */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = SHADE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = BLEND;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_MC_OQ_SH
		GP0_B_P3_TX_ST_BL_SH, GP0_B_P4_TX_ST_BL_SH: begin
		   /* Textured, shaded, semi-trans, blended */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = SHADE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = BLEND;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_MC_ST_SH
		GP0_B_LN_MC_OQ, GP0_B_PL_MC_OQ: begin
		   /* Monochrome, line, opaque */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = LINE;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = NONE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_LN_MC_OQ, GP0_B_PL_MC_OQ
		GP0_B_LN_MC_ST, GP0_B_PL_MC_ST: begin
		   /* Monochrome, line, semi-trans */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = LINE;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_LN_MC_ST, GP0_B_PL_MC_ST
		GP0_B_LN_MC_OQ_SH, GP0_B_PL_MC_OQ_SH: begin
		   /* Shaded, line, opaque */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = LINE;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = SHADE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_LN_MC_OQ, GP0_B_PL_MC_OQ
		GP0_B_LN_MC_ST_SH, GP0_B_PL_MC_ST_SH: begin
		   /* Shaded, line, semi-trans */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = LINE;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = SHADE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_LN_MC_ST, GP0_B_PL_MC_ST
		GP0_B_RV_MC_OQ, GP0_B_R1_MC_OQ, GP0_B_R8_MC_OQ, GP0_B_R16_MC_OQ: begin
		   /* Monochrome, rect, opaque */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = RECT;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = NONE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_RV_MC_OQ, GP0_B_R1_MC_OQ, GP0_B_R8_MC_OQ, GP0_B_R16_MC_OQ
		GP0_B_RV_MC_ST, GP0_B_R1_MC_ST, GP0_B_R8_MC_ST, GP0_B_R16_MC_ST: begin
		   /* Monochrome, rect, semi-trans */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = RECT;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_RV_MC_OQ, GP0_B_R1_MC_OQ, GP0_B_R8_MC_OQ, GP0_B_R16_MC_OQ
		GP0_B_RV_TX_OQ_BL, GP0_B_R1_TX_OQ_BL, GP0_B_R8_TX_OQ_BL, GP0_B_R16_TX_OQ_BL: begin
		   /* Textured, rect, opaque, blended */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = RECT;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = BLEND;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_RV_MC_OQ, GP0_B_R1_MC_OQ, GP0_B_R8_MC_OQ, GP0_B_R16_MC_OQ
		GP0_B_RV_TX_ST_BL, GP0_B_R1_TX_ST_BL, GP0_B_R8_TX_ST_BL, GP0_B_R16_TX_ST_BL: begin
		   /* Textured, rect, semi-trans, blended */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = RECT;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = BLEND;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_RV_MC_OQ, GP0_B_R1_MC_OQ, GP0_B_R8_MC_OQ, GP0_B_R16_MC_OQ
		GP0_B_RV_TX_OQ_RW, GP0_B_R1_TX_OQ_RW, GP0_B_R8_TX_OQ_RW, GP0_B_R16_TX_OQ_RW: begin
		   /* Textured, rect, opaque, raw */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = RECT;
		   new_cmd.transparency = OPAQ;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = RAW;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_RV_MC_OQ, GP0_B_R1_MC_OQ, GP0_B_R8_MC_OQ, GP0_B_R16_MC_OQ
		GP0_B_RV_TX_ST_RW, GP0_B_R1_TX_ST_RW, GP0_B_R8_TX_ST_RW, GP0_B_R16_TX_ST_RW: begin
		   /* Textured, rect, semi-trans, raw */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.shape = RECT;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = RAW;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_RV_TX_ST_BL, GP0_B_R1_TX_ST_BL, GP0_B_R8_TX_ST_BL,
		GP0_B_DRWMODE: begin
		   /* Set various drawing params */
		   decode_fifo_re = 1'b1;
		   GPU_status_new.text_x = cmd_fifo_cmd[3:0];
		   GPU_status_new.text_y = cmd_fifo_cmd[4];
		   GPU_status_new.semi_trans_mode = cmd_fifo_cmd[6:5];
		   GPU_status_new.text_mode = cmd_fifo_cmd[8:7];
		   GPU_status_new.dither_mode = cmd_fifo_cmd[9];
		   GPU_status_new.draw_to_display = cmd_fifo_cmd[10];
		   gp0_text_en = cmd_fifo_cmd[11];
		   xy_flip_reg_new[0] = cmd_fifo_cmd[12];
		   xy_flip_reg_new[1] = cmd_fifo_cmd[13];
		end // case: GP0_B_DRWMODE
		GP0_B_TEXTWND: begin
		   /* Set texture window */
		   decode_fifo_re = 1'b1;
		   text_mask_x_new = cmd_fifo_cmd[4:0];
		   text_mask_y_new = cmd_fifo_cmd[9:5];
		   text_off_x_new = cmd_fifo_cmd[14:10];
		   text_off_y_new = cmd_fifo_cmd[19:15];
		end
		GP0_B_DRWWND_TL: begin
		   /* Set top-left of drawing window */
		   decode_fifo_re = 1'b1;
		   x_tl_new = {2'b01, cmd_fifo_cmd[9:0]};
		   y_tl_new = {2'b01, cmd_fifo_cmd[19:10]};
		end
		GP0_B_DRWWND_BR: begin
		   /* Set bottom-right of drawing window */
		   decode_fifo_re = 1'b1;
		   x_br_new = {2'b01, cmd_fifo_cmd[9:0]};
		   y_br_new = {2'b01, cmd_fifo_cmd[19:10]};
		end
		GP0_B_DRWWND_OS: begin
		   /* Set drawing window offset */
		   decode_fifo_re = 1'b1;
		   x_off_new = {cmd_fifo_cmd[10], cmd_fifo_cmd[10:0]};
		   y_off_new = {cmd_fifo_cmd[21], cmd_fifo_cmd[21:11]};
		end
		GP0_B_MSK: begin
		   /* Set mask handle */
		   decode_fifo_re = 1'b1;
		   GPU_status_new.mask_en = cmd_fifo_cmd[1];
		   GPU_status_new.set_mask = cmd_fifo_cmd[0];
		end
		GP0_B_CLRC: begin
		   /* Clear texture and clut caches (not point, just nop) */
		   decode_fifo_re = 1'b1;
		end
		GP0_B_FILRECT: begin
		   /* Fill VRAM rect */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		   new_cmd.mem_src = CLR;
		   new_cmd.mem_dest = VRM;
		end
		GP0_B_CPYRECT_V2V: begin
		   /* Copy rect VRAM to VRAM */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.mem_src = VRAM;
		   new_cmd.mem_dest = VRM;
		end
		GP0_B_CPYRECT_V2C: begin
		   /* Copy rect VRAM to CPU */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.mem_src = VRAM;
		   new_cmd.mem_dest = GPUREAD;
		end // case: GP0_B_CPYRECT_V2C
		GP0_B_CPYRECT_C2V: begin
		   /* Copy rect CPU to VRAM */
		   decode_state_next = GET_XY0;

		   decode_fifo_re = 1'b1;
		   new_cmd.mem_src = FIFO;
		   new_cmd.mem_dest = VRM;
		end
	      endcase // case (cmd_fifo_cmd[31:24]) 
	   end // if (~cmd_fifo_empty)
	end // case: WAIT
	GET_XY0: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.x0 = {cmd_fifo_cmd[10], cmd_fifo_cmd[10:0]} + x_off + x_tl;
	      new_cmd.y0 = {cmd_fifo_cmd[26], cmd_fifo_cmd[26:16]} + y_off + y_tl;
	      decode_fifo_re = 1'b1;
	      
	      /* Now the command is in the hold register */
	      case (cmd_hold)
		GP0_B_P3_MC_OQ, GP0_B_P4_MC_OQ, GP0_B_P3_MC_ST, GP0_B_P4_MC_ST: begin
		   /* Now to get the next coord */
		   decode_state_next = GET_XY1;
		end
		GP0_B_P3_TX_OQ_BL, GP0_B_P3_TX_OQ_RW, GP0_B_P3_TX_ST_BL, GP0_B_P3_TX_ST_RW,
		  GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW, GP0_B_P4_TX_ST_BL, GP0_B_P4_TX_ST_RW: begin
		     /* Now get the text coords and stuff */
		     decode_state_next = GET_TX0;
		  end
		GP0_B_P3_MC_OQ_SH, GP0_B_P3_MC_ST_SH, GP0_B_P4_MC_OQ_SH, GP0_B_P4_MC_ST_SH: begin
		   /* Also get the text coords and stuff */
		   decode_state_next = GET_CL1;
		end
		GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_ST_BL_SH, GP0_B_P4_TX_OQ_BL_SH, 
		  GP0_B_P4_TX_ST_BL_SH: begin
		     /* New get text coords and stuff */
		     decode_state_next = GET_TX0;
		  end
		GP0_B_LN_MC_OQ, GP0_B_LN_MC_ST, GP0_B_PL_MC_OQ, GP0_B_PL_MC_ST: begin
		   /* These lines are just coords, get next one */
		   decode_state_next = GET_XY1;
		end
		GP0_B_LN_MC_OQ_SH, GP0_B_LN_MC_ST_SH, GP0_B_PL_MC_OQ_SH, GP0_B_PL_MC_ST_SH: begin
		   /* These lines have colors */
		   decode_state_next = GET_CL1;
		end
		GP0_B_RV_MC_OQ, GP0_B_RV_MC_ST: begin
		   /* These rectangles need size; use XY1 for size */
		   decode_state_next = GET_XY1;
		end
		GP0_B_R1_MC_OQ, GP0_B_R1_MC_ST: begin
		   /* These rectangles need nothing else, so start working! */
		   decode_state_next = DRAWING;
		   
		   new_cmd.x1 = new_cmd.x0 + 12'd1;
		   new_cmd.y1 = new_cmd.y0 + 12'd1;
		end
		GP0_B_R8_MC_OQ, GP0_B_R8_MC_ST: begin
		   /* These rectangles need nothing else, so start working! */
		   decode_state_next = DRAWING;
		   
		   new_cmd.x1 = new_cmd.x0 + 12'd8;
		   new_cmd.y1 = new_cmd.y0 + 12'd8;
		end
		GP0_B_R16_MC_OQ, GP0_B_R16_MC_ST: begin
		   /* These rectangles need nothing else, so start working! */
		   decode_state_next = DRAWING;
		   
		   new_cmd.x1 = new_cmd.x0 + 12'd16;
		   new_cmd.y1 = new_cmd.y0 + 12'd16;
		end
		GP0_B_RV_TX_OQ_BL, GP0_B_RV_TX_OQ_RW, GP0_B_RV_TX_ST_BL, GP0_B_RV_TX_ST_RW,
		  GP0_B_R1_TX_OQ_BL, GP0_B_R1_TX_OQ_RW, GP0_B_R1_TX_ST_BL, GP0_B_R1_TX_ST_RW,
		  GP0_B_R8_TX_OQ_BL, GP0_B_R8_TX_OQ_RW, GP0_B_R8_TX_ST_BL, GP0_B_R8_TX_ST_RW,
		  GP0_B_R16_TX_OQ_BL, GP0_B_R16_TX_OQ_RW, GP0_B_R16_TX_ST_BL,
		  GP0_B_R16_TX_ST_RW: begin
		     /* These rectangles need to get the texture now */
		     decode_state_next = GET_TX0;
		  end
		GP0_B_FILRECT: begin
		   /* Memory commands need size or another coord, put no offset and mask */
		   decode_state_next = GET_XY1;
		   new_cmd.x0 = {2'b01, cmd_fifo_cmd[9:4], 4'b0};
		   new_cmd.y0 = {3'b010, cmd_fifo_cmd[24:16]};
		end
		GP0_B_CPYRECT_V2V, GP0_B_CPYRECT_C2V, GP0_B_CPYRECT_V2C: begin
		   /* Memory copy commands need size or another coord, put no drawing offset! */
		   decode_state_next = GET_XY1;
		   new_cmd.x0 = {2'b01, cmd_fifo_cmd[9:0]};
		   new_cmd.y0 = {3'b010, cmd_fifo_cmd[24:16]};
		end
		
	      endcase // case (cmd_hold)
	   end // case: GET_XY0
	end // case: GET_XY0
	GET_XY1: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.x1 = {cmd_fifo_cmd[10], cmd_fifo_cmd[10:0]} + x_off + x_tl;
              new_cmd.y1 = {cmd_fifo_cmd[26], cmd_fifo_cmd[26:16]} + y_off + y_tl;
	      decode_fifo_re = 1'b1;
	      
	      /* Now the command is in the hold register */
	      case (cmd_hold)
		GP0_B_P3_MC_OQ, GP0_B_P4_MC_OQ, GP0_B_P3_MC_ST, GP0_B_P4_MC_ST: begin
		   /* Now to get the next coord */
		   decode_state_next = GET_XY2;
		end
		GP0_B_P3_TX_OQ_BL, GP0_B_P3_TX_OQ_RW, GP0_B_P3_TX_ST_BL, GP0_B_P3_TX_ST_RW,
		  GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW, GP0_B_P4_TX_ST_BL, GP0_B_P4_TX_ST_RW: begin
		     /* Now get the text coords and stuff */
		     decode_state_next = GET_TX1;
		  end
		GP0_B_P3_MC_OQ_SH, GP0_B_P3_MC_ST_SH, GP0_B_P4_MC_OQ_SH, GP0_B_P4_MC_ST_SH: begin
                   /* Also get the text coords and stuff */
		   decode_state_next = GET_CL2;
		end
		GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_ST_BL_SH, GP0_B_P4_TX_OQ_BL_SH,
		  GP0_B_P4_TX_ST_BL_SH: begin
                     /* New get text coords and stuff */
                     decode_state_next = GET_TX0;
		  end
		GP0_B_LN_MC_OQ, GP0_B_LN_MC_ST: begin
		   /* These lines are just 2 coords, so start drawing! */
		   decode_state_next = DRAWING;
		end
		GP0_B_PL_MC_OQ, GP0_B_PL_MC_ST: begin
		   /* These lines are might be more than 2 lines and FSM will reenter here */
		   if (cmd_fifo_cmd == POLYLINE_TERM) begin
		      decode_state_next = WAIT;
		   end
		   else begin
		      decode_state_next = DRAWING;
		   end
		end
		GP0_B_LN_MC_OQ_SH, GP0_B_LN_MC_ST_SH, GP0_B_PL_MC_OQ_SH, GP0_B_PL_MC_ST_SH: begin
                   /* These lines are also 2 lines and all colors have been gotten! */
                   decode_state_next = DRAWING;
		end
		GP0_B_RV_MC_OQ, GP0_B_RV_MC_ST: begin
		   /* These rectanges need size; compute size and start drawing */
		   decode_state_next = DRAWING;
		   new_cmd.x1 = cmd.x0 + {1'b0, cmd_fifo_cmd[10:0]};
		   new_cmd.y1 = cmd.y0 + {1'b0, cmd_fifo_cmd[26:16]};
		end
		GP0_B_RV_TX_OQ_BL, GP0_B_RV_TX_OQ_RW,
		  GP0_B_RV_TX_ST_BL, GP0_B_RV_TX_ST_RW: begin
                     /* These rectangles need size; use XY1 for size and get texture */
                     decode_state_next = GO_TXPG;
		     new_cmd.x1 = cmd.x0 + {1'b0, cmd_fifo_cmd[10:0]};
		     new_cmd.y1 = cmd.y0 + {1'b0, cmd_fifo_cmd[26:16]};
		  end
		GP0_B_FILRECT: begin
		   /* The seoncd param is a size, not a coord! */
		   decode_state_next = GO_MEM;
		   new_cmd.x1 = cmd.x0 + (({2'b0, cmd_fifo_cmd[9:0]} + 12'hF) & 12'hFF0) - 12'd1;
		   new_cmd.y1 = cmd.y0 + {3'b0, cmd_fifo_cmd[24:16]} - 12'd1;
		end
		GP0_B_CPYRECT_V2C: begin
		   /* Wait on mem transfer */
		   decode_state_next = GO_MEM;
		   new_cmd.x1 = cmd.x0 + {2'b0, cmd_fifo_cmd[9:0]} - 12'd1;
		   new_cmd.y1 = cmd.y0 + {3'b0, cmd_fifo_cmd[24:16]} - 12'd1;
		end
		GP0_B_CPYRECT_V2V: begin
		   /* Need 1 more coord, but put this coord into x2,y2 so xy-gen works */
		   decode_state_next = GET_XY2;
		   new_cmd.x1 = {2'b01, cmd_fifo_cmd[9:0]};
		   new_cmd.y1 = {3'b010, cmd_fifo_cmd[24:16]};
		end
		GP0_B_CPYRECT_C2V: begin
		   /* Memory copy commands now take take */
		   decode_state_next = GO_MEM;
		   new_cmd.x1 = cmd.x0 + {2'b0, cmd_fifo_cmd[9:0]} - 12'd1;
		   new_cmd.y1 = cmd.y0 + {3'b0, cmd_fifo_cmd[24:16]} - 12'd1;
		end
	      endcase
	   end // case: GET_XY1
	end // case: GET_XY1
	GET_XY2: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.x2 = {cmd_fifo_cmd[10], cmd_fifo_cmd[10:0]} + x_off + x_tl;
	      new_cmd.y2 = {cmd_fifo_cmd[26], cmd_fifo_cmd[26:16]} + y_off + y_tl;
	      decode_fifo_re = 1'b1;

	      /* Now the command is in the hold register */
	      case (cmd_hold)
		GP0_B_P3_MC_OQ, GP0_B_P4_MC_OQ, GP0_B_P3_MC_ST, GP0_B_P4_MC_ST: begin
		   /* Dne, get ot drawing! */
		   decode_state_next = DRAWING;
		end
		GP0_B_P3_TX_OQ_BL, GP0_B_P3_TX_OQ_RW, GP0_B_P3_TX_ST_BL, GP0_B_P3_TX_ST_RW,
		  GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW, GP0_B_P4_TX_ST_BL, GP0_B_P4_TX_ST_RW: begin
		     /* Now get the text coords and stuff */
		     decode_state_next = GET_TX2;
		  end
		GP0_B_P3_MC_OQ_SH, GP0_B_P3_MC_ST_SH, GP0_B_P4_MC_OQ_SH, GP0_B_P4_MC_ST_SH: begin
		   /* Done, get to drawing! */
		   decode_state_next = DRAWING;
		end
		GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_ST_BL_SH, GP0_B_P4_TX_OQ_BL_SH,
                  GP0_B_P4_TX_ST_BL_SH: begin
                     /* New get text coords and stuff */
                     decode_state_next = GET_TX2;
                  end
                GP0_B_CPYRECT_V2V: begin
                   /* Done, remember, we put the other coord in x2, y2 */
                   decode_state_next = GO_MEM;
		   new_cmd.x2 = cmd.x0 + {2'b0, cmd_fifo_cmd[9:0]} - 12'd1;
		   new_cmd.y2 = cmd.y0 + {3'b0, cmd_fifo_cmd[24:16]} - 12'd1;
                end
              endcase
	   end // if (~cmd_fifo_empty)
	end // case: GET_XY2
	GET_TX0: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.u0 = cmd_fifo_cmd[7:0];
	      new_cmd.v0 = cmd_fifo_cmd[15:8];
	      new_cmd.clut_x = cmd_fifo_cmd[21:16] << 'd4;
	      new_cmd.clut_y = cmd_fifo_cmd[30:22];
	      decode_fifo_re = 1'b1;

	      /* Now go get the CLUT, or go draw if on fourth */
	      decode_state_next = GO_CLUT;
	   end
	end // case: GET_TX0
	GO_CLUT: begin
	   clut_on = 1'b1;
	   decode_state_next = GET_CLUT;
	end
	GET_CLUT: begin
	   /* Wait on the CLUT to be retrieved */
	   if (clut_rdy) begin
	      /* Now on to the command */
	      case (cmd_hold)
		GP0_B_P3_TX_OQ_BL, GP0_B_P3_TX_OQ_RW, GP0_B_P3_TX_ST_BL, GP0_B_P3_TX_ST_RW,
		GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW, GP0_B_P4_TX_ST_BL, GP0_B_P4_TX_ST_RW: begin
		   /* Now get the next x-y coords and stuff */
		   decode_state_next = GET_XY1;
		end
		GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_ST_BL_SH, GP0_B_P4_TX_OQ_BL_SH,
		  GP0_B_P4_TX_ST_BL_SH: begin
		     /* New get next colors and stuff */
		     decode_state_next = GET_CL1;
		  end
		GP0_B_RV_TX_OQ_BL, GP0_B_RV_TX_OQ_RW, GP0_B_RV_TX_ST_BL, GP0_B_RV_TX_ST_RW: begin
		   /* Variable size needs to get height width */
		   decode_state_next = GET_XY1;
		end
		GP0_B_R1_TX_OQ_BL, GP0_B_R1_TX_OQ_RW, GP0_B_R1_TX_ST_BL, GP0_B_R1_TX_ST_RW,
		  GP0_B_R8_TX_OQ_BL, GP0_B_R8_TX_OQ_RW, GP0_B_R8_TX_ST_BL, GP0_B_R8_TX_ST_RW,
		  GP0_B_R16_TX_OQ_BL, GP0_B_R16_TX_OQ_RW, GP0_B_R16_TX_ST_BL,
		  GP0_B_R16_TX_ST_RW: begin
		     /* These rectangles need to get textpage now */
		     decode_state_next = GO_TXPG;
		  end
	      endcase // case (cmd_hold)
	   end // if (~cmd_fifo_cmd)
	end // case: GET_TX0
	GET_TX1: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.u1 = cmd_fifo_cmd[7:0];
	      new_cmd.v1 = cmd_fifo_cmd[15:8];
	      new_cmd.text_x = cmd_fifo_cmd[19:16];
	      new_cmd.text_y = cmd_fifo_cmd[20];
	      new_cmd.semi_trans_mode = cmd_fifo_cmd[22:21];
	      new_cmd.text_mode = cmd_fifo_cmd[24:23];
	      new_cmd.text_en = cmd_fifo_cmd[25];
	      decode_fifo_re = 1'b1;

	      /* Now get the textpage */
	      decode_state_next = GO_TXPG;
	   end // if (~cmd_fifo_empty)
	end // case: GET_TX1
	GO_TXPG: begin
	   txpg_on = 1'b1;
	   decode_state_next = GET_TXPG;
	end
	GET_TXPG: begin
	   /* Wait until the textpage is retrieved */
	   if (txpg_rdy) begin
	      /* Now on to the command */
	      case (cmd_hold)
		GP0_B_P3_TX_OQ_BL, GP0_B_P3_TX_OQ_RW, GP0_B_P3_TX_ST_BL, GP0_B_P3_TX_ST_RW,
		GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW, GP0_B_P4_TX_ST_BL, GP0_B_P4_TX_ST_RW: begin
		   /* Now get the next x-y coords and stuff */
		   decode_state_next = GET_XY2;
		end
		GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_ST_BL_SH, GP0_B_P4_TX_OQ_BL_SH,
		  GP0_B_P4_TX_ST_BL_SH: begin
		     /* New get next colors and stuff */
		     decode_state_next = GET_CL2;
		  end
		GP0_B_RV_TX_OQ_BL, GP0_B_RV_TX_OQ_RW, GP0_B_RV_TX_ST_BL, GP0_B_RV_TX_ST_RW,
		  GP0_B_RV_TX_OQ_BL, GP0_B_RV_TX_OQ_RW, GP0_B_RV_TX_ST_BL, GP0_B_RV_TX_ST_RW,
		  GP0_B_RV_TX_OQ_BL, GP0_B_RV_TX_OQ_RW, GP0_B_RV_TX_ST_BL, GP0_B_RV_TX_ST_RW,
		  GP0_B_RV_TX_OQ_BL, GP0_B_RV_TX_OQ_RW, GP0_B_RV_TX_ST_BL, GP0_B_RV_TX_ST_RW: begin
		     /* Start drawing now that the textpage is loaded */
		     decode_state_next = DRAWING;
		  end
	      endcase // case (cmd_hold)
	   end // if (~cmd_fifo_empty)
	end // case: GET_TX1
	GET_TX2: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.u2 = cmd_fifo_cmd[7:0];
	      new_cmd.v2 = cmd_fifo_cmd[15:8];
	      decode_fifo_re = 1'b1;
	      
	      /* Now on to the command */
	      case (cmd_hold)
		GP0_B_P3_TX_OQ_BL, GP0_B_P3_TX_OQ_RW, GP0_B_P3_TX_ST_BL, GP0_B_P3_TX_ST_RW,
		GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW, GP0_B_P4_TX_ST_BL, GP0_B_P4_TX_ST_RW: begin
		   /* Now get to drawing! (finally...) */
		   decode_state_next = DRAWING;
		end
		GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_ST_BL_SH, GP0_B_P4_TX_OQ_BL_SH,
		  GP0_B_P4_TX_ST_BL_SH: begin
		     /* New get to drawing (really finally!) */
		     decode_state_next = DRAWING;
		  end
	      endcase // case (cmd_hold)
	   end // if (~cmd_fifo_empty)
	end // case: GET_TX2
	GET_CL1: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.b1 = cmd_fifo_cmd[23:16];
	      new_cmd.g1 = cmd_fifo_cmd[15:8];
	      new_cmd.r1 = cmd_fifo_cmd[7:0];
	      decode_fifo_re = 1'b1;
	      
	      /* If polyline, check for termination code; otherwise, get next vertex */
	      if (((cmd_hold == GP0_B_PL_MC_OQ_SH) | (cmd_hold == GP0_B_PL_MC_ST_SH)) &
		  (cmd_fifo_cmd == POLYLINE_TERM)) begin
		 decode_state_next = WAIT;
	      end
	      else begin
		 decode_state_next = GET_XY1;
	      end
	   end
	end
	GET_CL2: begin
	   if (~cmd_fifo_empty) begin
	      new_cmd.b2 = cmd_fifo_cmd[23:16];
	      new_cmd.g2 = cmd_fifo_cmd[15:8];
	      new_cmd.r2 = cmd_fifo_cmd[7:0];
	      decode_fifo_re = 1'b1;
	      
	      /* All commands get the next coord after getting the 3rd color */
	      decode_state_next = GET_XY2;
	   end	  
	end // case: GET_CL2
	DRAWING: begin
	   /* Go render pipeline, go! */
	   xy_gen_on = 1'b1;
	   
	   /* The drawing stage; pretty much just let the render pipeline do its thing.
	      Once its done, decide where to go next */
	   if (~wb_stage.valid & (xy_gen_state == COMPLETE) & ~pipeline_stall) begin
	      case (cmd_hold)
		GP0_B_P4_MC_OQ, GP0_B_P4_MC_ST, GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW,
		GP0_B_P4_TX_ST_BL, GP0_B_P4_TX_ST_RW: begin
		   /* There polys have next x-y coord; unless we've already finished them */
		   if (on_fourth) begin
		      decode_state_next = WAIT;
		   end
		   else begin
		      decode_state_next = GET_XY2;
		      on_fourth_new = 1'b1;
		      
		      new_cmd.x0 = cmd.x2;
		      new_cmd.y0 = cmd.y2;
		      new_cmd.u0 = cmd.u2;
		      new_cmd.v0 = cmd.v2;
		   end
		end // case: GP0_B_P4_MC_OQ, GP0_B_P4_MC_ST, GP0_B_P4_TX_OQ_BL, GP0_B_P4_TX_OQ_RW,...
		GP0_B_P4_MC_OQ_SH, GP0_B_P4_MC_ST_SH, GP0_B_P4_TX_OQ_BL_SH, 
		  GP0_B_P4_TX_ST_BL_SH: begin
		     /* Just like above, but these re-enter at getting 3rd color */
		     if (on_fourth) begin
			decode_state_next = WAIT;
		     end
		     else begin
			decode_state_next = GET_CL2;
			on_fourth_new = 1'b1;

			new_cmd.x0 = cmd.x2;
			new_cmd.y0 = cmd.y2;
			new_cmd.u0 = cmd.u2;
			new_cmd.v0 = cmd.v2;

			new_cmd.r0 = cmd.r2;
			new_cmd.g0 = cmd.g2;
			new_cmd.b0 = cmd.b2;
		     end
		  end // case: GP0_B_P4_MC_OQ_SH, GP0_B_P4_MC_ST_SH, GP0_B_P4_TX_OQ_BL_SH,...
		GP0_B_PL_MC_OQ, GP0_B_PL_MC_ST: begin
		   /* Reenter at x-y coord (This state will check the term code */
		   decode_state_next = GET_XY1;

		   /* Also, shift the vertex into x0, y0 */
		   new_cmd.x0 = cmd.x1;
		   new_cmd.y0 = cmd.y1;
		end
		GP0_B_PL_MC_OQ_SH, GP0_B_PL_MC_ST_SH: begin
		   /* Same as above, but reenter at color, also shift color */
		   decode_state_next = GET_CL1;

		   new_cmd.x0 = cmd.x1;
		   new_cmd.y0 = cmd.y1;

		   new_cmd.r0 = cmd.r1;
		   new_cmd.g0 = cmd.g1;
		   new_cmd.b0 = cmd.b1;
		end // case: GP0_B_PL_MC_OQ_SH, GP0_B_PL_ST_SH
		default: begin
		   /* All others are done! */
		   decode_state_next = WAIT;
		end
	      endcase // case (cmd_hold)
	   end // if (~wb_stage.valid && xy_gen_state == COMPLETE)
	end // case: DRAWING
	GO_MEM: begin
	   /* Determine the waiting and activation conditions */
	   case (cmd_hold)
	     GP0_B_FILRECT: begin
		fill_on = 1'b1;
	     end
	     GP0_B_CPYRECT_V2V: begin
		v2v_on = 1'b1;
	     end
	     GP0_B_CPYRECT_V2C: begin
		v2c_on = 1'b1;
	     end
	     GP0_B_CPYRECT_C2V: begin
		c2v_on = 1'b1;
	     end
	   endcase // case (cmd_hold)
	   decode_state_next = WAIT_MEM;
	end // case: WAITMEM
	WAIT_MEM: begin
	   /* Wait for FSM to finish */
	   case (cmd_hold)
	     GP0_B_FILRECT: begin
		if (fill_rdy) begin
		   decode_state_next = WAIT;
		end
	     end
	     GP0_B_CPYRECT_V2V: begin
		if (v2v_rdy) begin
		   decode_state_next = WAIT;
		end
	     end
	     GP0_B_CPYRECT_V2C: begin
		if (v2c_rdy) begin
		   decode_state_next = WAIT;
		end
	     end
	     GP0_B_CPYRECT_C2V: begin
		if (c2v_rdy) begin
		   decode_state_next = WAIT;
		end
	     end
	   endcase // case (cmd_hold)
	end // case: WAIT_MEM
      endcase // case (decode_state)
   end // always_comb

   


   
   /* ###################################################### */   





   
   /* X, Y generator */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 xy_gen_state <= SIT_AROUND;
	 xy_gen_x <= 'd0;
	 xy_gen_y <= 12'd0;
      end
      else begin
	 if (~pipeline_stall) begin
	    xy_gen_state <= xy_gen_state_next;
	    xy_gen_x <= xy_gen_x_new;
	    xy_gen_y <= xy_gen_y_new;
	 end
      end
   end // always_ff @

   /* Determine mins and maxs for given x-y coords */
   assign min_x01 = (cmd.x0 > cmd.x1) ? cmd.x1 : cmd.x0;
   assign min_y01 = (cmd.y0 > cmd.y1) ? cmd.y1 : cmd.y0;
   assign min_x02 = (cmd.x2 > min_x01) ? min_x01 : cmd.x2;
   assign min_y02 = (cmd.y2 > min_y01) ? min_y01 : cmd.y2;

   assign max_x01 = (cmd.x0 < cmd.x1) ? cmd.x1 : cmd.x0;
   assign max_y01 = (cmd.y0 < cmd.y1) ? cmd.y1 : cmd.y0;
   assign max_x02 = (cmd.x2 < max_x01) ? max_x01 : cmd.x2;
   assign max_y02 = (cmd.y2 < max_y01) ? max_y01 : cmd.y2;
   

   /* X, Y generator state and output logic */
   always_comb begin
      /* Defaults */
      next_draw_stage.x = 'd0;
      next_draw_stage.y = 'd0;
      next_draw_stage.valid = 1'b0;
      
      xy_gen_state_next = xy_gen_state;
      xy_gen_x_new = xy_gen_x;
      xy_gen_y_new = xy_gen_y;

      xy_gen_min_x = 12'b0;
      xy_gen_min_y = 12'b0;
      xy_gen_max_x = 12'b0;
      xy_gen_max_y = 12'b0;
      
      
      /* Find the mins and maxes to use, ie if its a polygon, check between the three, 
         else use the two. At this point also clip to drawing area */
      if (cmd.shape == TRI) begin
	 xy_gen_min_x = (x_tl > min_x02) ? x_tl : min_x02;
	 xy_gen_min_y = (y_tl > min_y02) ? y_tl : min_y02;
	 xy_gen_max_x = (x_br < max_x02) ? x_br : max_x02;
	 xy_gen_max_y = (y_br < max_y02) ? y_br : max_y02;
      end
      else begin
	 xy_gen_min_x = (x_tl > min_x01) ? x_tl : min_x01;
	 xy_gen_min_y = (y_tl > min_y01) ? y_tl : min_y01;
	 xy_gen_max_x = (x_br < max_x01) ? x_br : max_x01;
	 xy_gen_max_y = (y_br < max_y01) ? y_br : max_y01;
      end
      
      /* Decode FSM has told up to go! */
      case (xy_gen_state)
	SIT_AROUND: begin
	   if (xy_gen_on) begin
	      xy_gen_x_new = xy_gen_min_x;
	      xy_gen_y_new = xy_gen_min_y;
	      xy_gen_state_next = CHURN_BUTTER;
	   end
	end
	CHURN_BUTTER: begin
	   /* If the shape is too big, give up */
	   if ((xy_gen_max_x > (xy_gen_min_x + 12'd1023)) |
	       (xy_gen_max_y > (xy_gen_min_y + 12'd512))) begin
	      xy_gen_x_new = 'd0;
	      xy_gen_y_new = 'd0;
	      xy_gen_state_next = COMPLETE;
	   end
	   else if ((xy_gen_y == xy_gen_max_y) &
		    ((xy_gen_x + `GPU_PIPELINE_WIDTH) >= xy_gen_max_x)) begin
	      /* Generated all x, y */
	      next_draw_stage.valid = 1'b1;
	      xy_gen_x_new = 'd0;
	      xy_gen_y_new = 'd0;
	      xy_gen_state_next = COMPLETE;
	   end
	   else begin
	      next_draw_stage.valid = 1'b1;
	      
	      /* Generate a column, then move on to next column */
	      if (xy_gen_y < xy_gen_max_y) begin
		 xy_gen_y_new = xy_gen_y + 12'b1;
	      end
	      else begin
		 xy_gen_y_new = xy_gen_min_y;
		 xy_gen_x_new = xy_gen_x + `GPU_PIPELINE_WIDTH;
	      end
	   end // else: !if((xy_gen_y == xy_gen_max_y) &...
	end // case: CHURN_BUTTER
	COMPLETE: begin
	   if (~xy_gen_on) begin
	      xy_gen_state_next = SIT_AROUND;
	   end
	end
      endcase // case (xy_gen_state)
      
      /* Set all the draw_stage x-y coords */
      for (xy_gen_i = 0; xy_gen_i < `GPU_PIPELINE_WIDTH; xy_gen_i = xy_gen_i + 1) begin
	 next_draw_stage.x[xy_gen_i] = xy_gen_x + xy_gen_i;
	 next_draw_stage.y[xy_gen_i] = xy_gen_y;
      end
   end // always_comb



   /* ################################################################## */


   /* CLUT getting FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 clut_state <= WAIT_CLUT;
	 clut_count <= 9'b0;
	 clut_rdy <= 1'b1;
      end
      else begin
	 clut_state <= clut_state_next;
	 clut_count <= clut_count_next;
	 clut_rdy <= clut_rdy_next;
      end
   end

   /* CLUT getting next state + output logic */
   always_comb begin
      /* Defaults */
      clut_state_next = clut_state;
      clut_count_next = clut_count;
      clut_rdy_next = clut_rdy;
      clut_vram_addr = 'd0;
      clut_vram_re = 1'b0;
      clut_ld = 1'b0;
      
      case (clut_state)
	WAIT_CLUT: begin
	   if (clut_on) begin
	      clut_rdy_next = 1'b0;
	      clut_count_next = 9'd0;
	      clut_state_next = GETMEM_CLUT;
	   end
	end
	GETMEM_CLUT: begin
	   if (clut_count > 9'd255) begin
	      clut_rdy_next = 1'b1;
	      clut_state_next = WAIT_CLUT;
	   end
	   else if (gpu_en) begin
	      clut_vram_addr = {cmd.clut_y, (cmd.clut_x + clut_count)};
	      clut_vram_re = 1'b1;
	      clut_ld = 1'b1;
	      clut_count_next = clut_count + 9'd1;
	   end
	end	
      endcase
   end // always_comb
   
   /* CLUT */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 clut <= 'd0;
      end
      else begin
	 if (clut_ld) begin
	    clut[clut_count] <= vram_bus_in;
	 end
      end
   end

   /* Textpage getting FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 txpg_state <= WAIT_TXPG;
	 txpg_count_x <= 9'd0;
	 txpg_count_y <= 9'd0;
	 txpg_base_x <= 4'b0;
	 txpg_base_y <= 1'b0;
	 txpg_rdy <= 1'b1;
      end
      else begin
	 txpg_state <= txpg_state_next;
	 txpg_count_x <= txpg_count_x_next;
	 txpg_count_y <= txpg_count_y_next;
	 txpg_base_x <= txpg_base_x_next;
	 txpg_base_y <= txpg_base_y_next;
	 txpg_rdy <= txpg_rdy_next;
      end // else: !if(rst)
   end // always_ff @

   /* Textpage getting next state + output logic */
   always_comb begin
      /* Defaults */
      txpg_state_next = txpg_state;
      txpg_count_x_next = txpg_count_x;
      txpg_count_y_next = txpg_count_y;
      txpg_base_x_next = txpg_base_x;
      txpg_base_y_next = txpg_base_y;
      txpg_rdy_next = txpg_rdy;
      
      txpg_ld = 1'b0;
      txpg_val = 'd0;
      
      txpg_vram_addr = 'd0;
      txpg_vram_re = 1'b0;
      
      case (txpg_state)
	WAIT_TXPG: begin
	   if (txpg_on) begin
	      txpg_rdy_next = 1'b0;
	      txpg_count_x_next = 9'd0;
	      txpg_count_y_next = 9'd0;
	      txpg_state_next = GETMEM_TXPG;

	      /* Get Textpage bases from cmd or status depending on command */
	      if (cmd.shape == RECT) begin
		 txpg_base_x_next = GPU_status.text_x;
		 txpg_base_y_next = GPU_status.text_y;
	      end
	      else begin
		 txpg_base_x_next = cmd.text_x;
		 txpg_base_y_next = cmd.text_y;
	      end
	   end
	end
	GETMEM_TXPG: begin
	   if (txpg_count_y > 9'd255) begin
	      txpg_rdy_next = 1'b1;
	      txpg_state_next = WAIT_TXPG;
	   end
	   else if (gpu_en) begin
	      txpg_vram_addr = {((cmd.text_y << 8) + txpg_count_y), 
				((cmd.text_x << 6) + txpg_count_x)};
	      txpg_vram_re = 1'b1;

	      /* Set counters to next values */
	      if (txpg_count_x == 9'd255) begin
		 txpg_count_x_next = 9'd0;
		 txpg_count_y_next = txpg_count_y + 9'd1;
	      end
	      else begin
		 txpg_count_x_next = txpg_count_x + 9'd1;
	      end
	      
	      txpg_ld = 1'b1;

	      /* Check color mode and generate the values accordingly */
	      case (GPU_status.text_mode)
		2'd0: begin
		   txpg_val[0] = clut[vram_bus_in[3:0]];
		   txpg_val[1] = clut[vram_bus_in[7:4]];
		   txpg_val[2] = clut[vram_bus_in[11:8]];
		   txpg_val[3] = clut[vram_bus_in[15:12]];
		end
		2'd1: begin
		   txpg_val[0] = clut[vram_bus_in[7:0]];
		   txpg_val[1] = clut[vram_bus_in[15:8]];
		end
		default: begin
		   txpg_val[0] = vram_bus_in;
		end
	      endcase 
	   end // if (vram_rdy)
	end // case: READINGMEM_TXPG
      endcase // case (txpg_state)
   end // always_comb
      
   

   /* ######################################################## */
	 


   /* FILL FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 fill_state <= WAIT_FILL;
	 fill_x <= 12'd0;
	 fill_y <= 12'd0;
	 fill_rdy <= 1'b1;
      end
      else begin
	 fill_state <= fill_state_next;
	 fill_x <= fill_x_next;
	 fill_y <= fill_y_next;
	 fill_rdy <= fill_rdy_next;
      end // else: !if(rst)
   end // always_ff @

   /* FILL FSM next state + output logic */
   always_comb begin
      /* Defaults */
      fill_state_next = fill_state;
      fill_x_next = fill_x;
      fill_y_next = fill_y;
      fill_rdy_next = fill_rdy;

      fill_vram_data = 16'd0;
      fill_vram_addr = 'd0;
      fill_vram_we = 1'b0;

      case (fill_state)
	WAIT_FILL: begin
	   if (fill_on) begin
	      fill_rdy_next = 1'b0;
	      fill_x_next = cmd.x0;
	      fill_y_next = cmd.y0;
	      fill_state_next = TOMEM_FILL;
	   end
	end
	TOMEM_FILL: begin
	   if (fill_y > cmd.y1) begin
	      fill_rdy_next = 1'b1;
	      fill_state_next = WAIT_FILL;
	   end
	   else if (gpu_en) begin
	      fill_vram_we = 1'b1;
	      fill_vram_data = {1'b0, cmd.r0[7:3], cmd.g0[7:3], cmd.b0[7:3]};
	      fill_vram_addr = {fill_y[8:0], fill_x[9:0]};
	      
	      if (fill_x == cmd.x1) begin
		 fill_x_next = cmd.x0;
		 fill_y_next = fill_y + 12'd1;
	      end
	      else begin
		 fill_x_next = fill_x_next + 12'd1;
	      end
	   end // if (vram_rdy)
	end // case: WRITINGMEM_FILL
      endcase // case (fill_state)
   end // always_comb
   

   /* V2V FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 v2v_state <= WAIT_V2V;
	 v2v_x0 <= 12'd0;
	 v2v_y0 <= 12'd0;
	 v2v_x1 <= 12'd0;
	 v2v_y1 <= 12'd0;
	 v2v_rdy <= 1'b1;
	 v2v_hold <= 16'd0;
      end
      else begin
	 v2v_state <= v2v_state_next;
	 v2v_x0 <= v2v_x0_next;
	 v2v_y0 <= v2v_y0_next;
	 v2v_x1 <= v2v_x1_next;
	 v2v_y1 <= v2v_y1_next;
	 v2v_rdy <= v2v_rdy_next;
	 v2v_hold <= v2v_hold_next;
      end // else: !if(rst)
   end // always_ff @

   /* V2V FSM next state + output logic */
   always_comb begin
      /* Defaults */
      v2v_state_next = v2v_state;
      v2v_x0_next = v2v_x0;
      v2v_y0_next = v2v_y0;
      v2v_x1_next = v2v_x1;
      v2v_y1_next = v2v_y1;
      v2v_rdy_next = v2v_rdy;
      v2v_hold_next = v2v_hold;

      v2v_vram_addr = 19'd0;
      v2v_vram_data = 16'd0;
      v2v_vram_re = 1'b0;
      v2v_vram_we = 1'b0;

      case (v2v_state)
	WAIT_V2V: begin
	   if (v2v_on) begin
	      v2v_rdy_next = 1'b0;
	      v2v_x0_next = cmd.x0;
	      v2v_y0_next = cmd.y0;
	      v2v_x1_next = cmd.x1;
	      v2v_y1_next = cmd.y1;
	      v2v_state_next = GETMEM1_V2V;
	   end
	end
	GETMEM1_V2V: begin
	   if (v2v_y0 > cmd.y2) begin
	      v2v_rdy_next = 1'b1;
	      v2v_state_next = WAIT_V2V;
	   end
	   else if (gpu_en) begin
	      v2v_vram_addr = {v2v_y0[8:0], v2v_x0[9:0]};
	      v2v_vram_re = 1'b1;
	      v2v_state_next = GETMEM2_V2V;
	      v2v_hold_next = vram_bus_in;
	      /* Handle the mask bit */
	      v2v_hold_next[15] |= GPU_status.set_mask;
	   end
	end
	GETMEM2_V2V: begin
	   if (gpu_en) begin
	      v2v_vram_addr = {v2v_y1[8:0], v2v_x1[9:0]};
	      v2v_vram_re = 1'b1;
	      
	      /* If masked, use this as the new writeback value */
	      if (vram_bus_in[15]) begin
		 v2v_hold_next = vram_bus_in;
	      end
	      v2v_state_next = TOMEM_V2V;
	   end
	end
	TOMEM_V2V: begin
	   if (gpu_en) begin
	      v2v_vram_addr = {v2v_y1[8:0], v2v_x1[9:0]};
	      v2v_vram_data = v2v_hold;
	      v2v_vram_we = 1'b1;

	      /* Calculate next coords */
	      if (v2v_x0 == cmd.x2) begin
		 v2v_x0_next = cmd.x0;
		 v2v_x1_next = cmd.x1;
		 v2v_y0_next = v2v_y0 + 12'd1;
		 v2v_y1_next = v2v_y1 + 12'd1;
	      end
	      else begin
		 v2v_x0_next = v2v_x0 + 12'd1;
		 v2v_x1_next = v2v_x1 + 12'd1;
	      end
	      v2v_state_next = GETMEM1_V2V;
	   end
	end	
      endcase // case (v2v_state)
   end // always_comb


   /* C2V FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
         c2v_state <= WAIT_C2V;
         c2v_x <= 12'd0;
         c2v_y <= 12'd0;
         c2v_rdy <= 1'b1;
         c2v_hold <= 16'd0;
	 c2v_low_read <= 1'b1;
      end
      else begin
         c2v_state <= c2v_state_next;
         c2v_x <= c2v_x_next;
         c2v_y <= c2v_y_next;
         c2v_rdy <= c2v_rdy_next;
         c2v_hold <= c2v_hold_next;
	 c2v_low_read <= c2v_low_read_next;
      end // else: !if(rst)
   end // always_ff @//       

   /* C2V FSM next state + output logic */
   always_comb begin
      /* Defaults */
      c2v_state_next = c2v_state;
      c2v_x_next = c2v_x;
      c2v_y_next = c2v_y;
      c2v_rdy_next = c2v_rdy;
      c2v_hold_next = c2v_hold;
      c2v_low_read_next = c2v_low_read;
      
      c2v_vram_addr = 19'd0;
      c2v_vram_data = 16'd0;
      c2v_vram_we = 1'b0;
      c2v_vram_re = 1'b0;

      c2v_fifo_re = 1'b0;

      case (c2v_state)
	WAIT_C2V: begin
	   if (c2v_on) begin
	      c2v_rdy_next = 1'b0;
	      c2v_x_next = cmd.x0;
	      c2v_y_next = cmd.y0;
	      c2v_low_read_next = 1'b1;
	      c2v_state_next = GETMEM_C2V;
	   end
	end
	GETMEM_C2V: begin
	   if (c2v_y > cmd.y1) begin
	      c2v_rdy_next = 1'b1;
	      c2v_state_next = WAIT_C2V;
	   end
	   else if (gpu_en) begin
	      c2v_vram_addr = {c2v_y[8:0], c2v_x[9:0]};
	      c2v_vram_re = 1'b1;
	      c2v_state_next = TOMEM_C2V;
	      c2v_hold_next = vram_bus_in;
	   end
	end
	TOMEM_C2V: begin
	   if (~cmd_fifo_empty & gpu_en) begin
	      c2v_vram_addr = {c2v_y[8:0], c2v_x[9:0]};
	      c2v_vram_we = 1'b1;
	      
	      if (GPU_status.mask_en & c2v_hold[15]) begin
		 c2v_vram_data = c2v_hold;
	      end
	      else begin
		 if (c2v_low_read) begin
		    c2v_vram_data = cmd_fifo_cmd[15:0];
		    c2v_low_read_next = 1'b0;
		 end
		 else begin
		    c2v_vram_data = cmd_fifo_cmd[31:16];
		    c2v_fifo_re = 1'b1;
		    c2v_low_read_next = 1'b1;
		 end
		 c2v_vram_data[15] |= GPU_status.mask_en;
	      end
	      
	      if (c2v_x == cmd.x1) begin
		 c2v_x_next = cmd.x0;
		 c2v_y_next = c2v_y + 12'd1;
	      end
	      else begin
		 c2v_x_next = c2v_x + 12'd1;
	      end // else: !if(v2v_x0 == cmd.x2)
	      
	      c2v_state_next = GETMEM_C2V;
	   end // if (~cmd_fifo_empty)
	end // case: TOMEM1_C2V
      endcase // case (c2v_state)
   end // always_comb

   /* V2C FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 v2c_state <= WAIT_V2C;
	 v2c_x <= 12'd0;
	 v2c_y <= 12'd0;
	 v2c_rdy <= 1'b1;
	 main_bus_re_hold <= 1'b0;
      end // if (rst)
      else begin
	 v2c_state <= v2c_state_next;
	 v2c_x <= v2c_x_next;
	 v2c_y <= v2c_y_next;
	 v2c_rdy <= v2c_rdy_next;
	 main_bus_re_hold <= main_bus_re_hold_new;
      end // else: !if(rst)
   end // always_ff @

   /* V2C FSM next state + output logic */
   always_comb begin
      /* Defaults */
      v2c_state_next = v2c_state;
      v2c_x_next = v2c_x;
      v2c_y_next = v2c_y;
      v2c_rdy_next = v2c_rdy;

      v2c_vram_addr = 19'd0;
      v2c_vram_re = 1'b0;

      GPU_read_reg_ld_V2C = 1'b0;
      GPU_read_reg_new_V2C = GPU_read_reg;

      main_bus_rdy = 1'b0;
      main_bus_re_hold_new = main_bus_re_hold;
      GPU_status_new.VRAM2CPU_rdy = 1'b0;
      
      case (v2c_state)
	WAIT_V2C: begin
	   if (v2c_on) begin
	      v2c_rdy_next = 1'b0;
	      v2c_x_next = cmd.x0;
	      v2c_y_next = cmd.y0;
	      v2c_state_next = GETMEM1_V2C;
	   end
	end
	GETMEM1_V2C: begin
	   if (v2c_y > cmd.y1) begin
	      v2c_rdy_next = 1'b1;
	      v2c_state_next = WAIT_V2C;
	   end
	   else if (main_bus_re_hold & gpu_en) begin
	      v2c_vram_addr = {v2c_y[8:0], v2c_x[9:0]};
	      v2c_vram_re = 1'b1;

	      GPU_read_reg_ld_V2C = 1'b1;
	      GPU_read_reg_new_V2C[15:0] = vram_bus_in;

	      main_bus_re_hold_new = 1'b0;
	      if (v2c_x == cmd.x1) begin
		 v2c_x_next = cmd.x0;
		 v2c_y_next = v2c_y + 12'd1;
	      end
	      else begin
		 v2c_x_next = v2c_x + 12'd1;
	      end

	      v2c_state_next = GETMEM2_V2C;
	   end // if (main_bus_re_hold & gpu_en)
	   else if (main_bus_re) begin
	      main_bus_re_hold_new = 1'b1;
	   end
	   else if ((v2c_y > cmd.y0) | (v2c_x > cmd.x0)) begin
	      main_bus_rdy = 1'b1;
	      GPU_status_new.VRAM2CPU_rdy = 1'b1;
	   end
	end // case: GETMEM1_V2C
	GETMEM2_V2C: begin
	   if (gpu_en) begin
	      v2c_vram_addr = {v2c_y[8:0], v2c_x[9:0]};
	      v2c_vram_re = 1'b1;
	      GPU_read_reg_ld_V2C = 1'b1;
	      GPU_read_reg_new_V2C[31:16] = vram_bus_in;
	      
	      if (v2c_x == cmd.x1) begin
		 v2c_x_next = cmd.x0;
		 v2c_y_next = v2c_y + 12'd1;
	      end
	      else begin
		 v2c_x_next = v2c_x + 12'd1;
	      end

	      v2c_state_next = GETMEM1_V2C;
	   end
	end // case: READINGMEM2_V2C
      endcase // case (v2c_state)
   end // always_comb

   
	      

   /* ######################################################### */


   
   /* Global CMD register - for storing all info for the current cmd */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 cmd <= 'd0;
      end
      else begin
	 cmd <= new_cmd;
      end
   end
   
   /* Draw stage pipeline barrier */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 draw_stage <= 'd0;
      end
      else begin
	 if (~pipeline_stall) begin
	    draw_stage <= next_draw_stage;
	 end
      end
   end

   /* Side finder for triangles */
   line_finder lf_s0(.x0({4'b0, cmd.x1}), .y0({4'b0, cmd.y1}),
		     .x1({4'b0, cmd.x2}), .y1({4'b0, cmd.y2}),
		     .x({4'b0, cmd.x0}), .y({4'b0, cmd.y0}),
		     .result(side0)),
     lf_s1(.x0({4'b0, cmd.x0}), .y0({4'b0, cmd.y0}),
	   .x1({4'b0, cmd.x2}), .y1({4'b0, cmd.y2}),
	   .x({4'b0, cmd.x1}), .y({4'b0, cmd.y1}),
	   .result(side1)),
     lf_s2(.x0({4'b0, cmd.x0}), .y0({4'b0, cmd.y0}),
	   .x1({4'b0, cmd.x1}), .y1({4'b0, cmd.y1}),
	   .x({4'b0, cmd.x2}), .y({4'b0, cmd.y2}),
	   .result(side2));

   /* Interpolators for texture; note that *_trans_* is a fixed point number 64-bits wide:
      [ 48 bits of integer | 16 bits fraction ] */
   interp in_u(.x0(cmd.x0), .y0(cmd.y0), .x1(cmd.x1), .y1(cmd.y1), .x2(cmd.x2), .y2(cmd.y2),
	       .s0({4'b0, cmd.u0}), .s1({4'b0, cmd.u1}), .s2({4'b0, cmd.u2}),
	       .cx(u_trans_x), .cy(u_trans_y), .cs(u_trans_c)),
     in_v(.x0(cmd.x0), .y0(cmd.y0), .x1(cmd.x1), .y1(cmd.y1), .x2(cmd.x2), .y2(cmd.y2),
	  .s0({4'b0, cmd.v0}), .s1({4'b0, cmd.v1}), .s2({4'b0, cmd.v2}),
	  .cx(v_trans_x), .cy(v_trans_y), .cs(v_trans_c));

   /* Interpolators for shading */
   interp in_r(.x0(cmd.x0), .y0(cmd.y0), .x1(cmd.x1), .y1(cmd.y1), .x2(cmd.x2), .y2(cmd.y2),
	       .s0({4'b0, cmd.r0}), .s1({4'b0, cmd.r1}), .s2({4'b0, cmd.r2}),
	       .cx(r_trans_x), .cy(r_trans_y), .cs(r_trans_c)),
     in_g(.x0(cmd.x0), .y0(cmd.y0), .x1(cmd.x1), .y1(cmd.y1), .x2(cmd.x2), .y2(cmd.y2),
	  .s0({4'b0, cmd.g0}), .s1({4'b0, cmd.g1}), .s2({4'b0, cmd.g2}),
	  .cx(g_trans_x), .cy(g_trans_y), .cs(g_trans_c)),
     in_b(.x0(cmd.x0), .y0(cmd.y0), .x1(cmd.x1), .y1(cmd.y1), .x2(cmd.x2), .y2(cmd.y2),
	  .s0({4'b0, cmd.b0}), .s1({4'b0, cmd.b1}), .s2({4'b0, cmd.b2}),
	  .cx(b_trans_x), .cy(b_trans_y), .cs(b_trans_c));
   







   
   /* #####################################################
      #                                                   #
      #                   DRAW STAGE                      #
      #                                                   #
      ##################################################### */

   
   /* Pass Values */
   assign next_color_stage.valid = draw_stage.valid;
   assign next_color_stage.x = draw_stage.x;
   assign next_color_stage.y = draw_stage.y;

   /* Triangle Modules */
   generate
      for (triangles = 0; triangles < `GPU_PIPELINE_WIDTH; triangles = triangles + 1) begin: tri_f
	 triangle_fill draw_tri_fill(.x0({4'b0, cmd.x0}), .y0({4'b0, cmd.y0}),
				     .x1({4'b0, cmd.x1}), .y1({4'b0, cmd.y1}),
				     .x2({4'b0, cmd.x2}), .y2({4'b0, cmd.y2}),
				     .x({4'b0, draw_stage.x[triangles]}), 
				     .y({4'b0, draw_stage.y[triangles]}),
				     .side0(side0), .side1(side1), .side2(side2),
				     .in(in_triangle[triangles]));
      end
   endgenerate

   /* Line Modules */
   generate
      for (lines = 0; lines < `GPU_PIPELINE_WIDTH; lines = lines + 1) begin: line_f
	 line_finder draw_line_fill(.x0({4'b0, cmd.x0}), .y0({4'b0, cmd.y0}), 
				    .x1({4'b0, cmd.x1}), .y1({4'b0, cmd.y1}),
				    .x({4'b0, draw_stage.x[lines]}), 
				    .y({4'b0, draw_stage.y[lines]}),
				    .result({in_line[1][lines], in_line[0][lines]}));
      end
   endgenerate

   /* Rectangle check (and box for lines) */
   generate
      for (rects = 0; rects < `GPU_PIPELINE_WIDTH; rects = rects + 1) begin: rect_f
	 always_comb begin
	    /* Defaults */
	    in_rect[rects] = 1'b0;
	    in_rect_line[rects] = 1'b0;

	    if ((draw_stage.x[rects] >= cmd.x0) & (draw_stage.x[rects] < cmd.x1) &
		(draw_stage.y[rects] >= cmd.y0) & (draw_stage.y[rects] < cmd.y1)) begin
	       in_rect[rects] = 1'b1;
	    end

	    if ((draw_stage.x[rects] >= min_x01) & (draw_stage.x[rects] <= max_x01) &
		(draw_stage.y[rects] >= min_y01) & (draw_stage.y[rects] <= max_y01)) begin
	       in_rect_line[rects] = 1'b1;
	    end
	 end
      end // for (rects = 0; rects < `GPU_PIPELINE_WIDTH; rects = rects + 1)
   endgenerate
   
   /* Final Fill Logic */
   always_comb begin
      /* Defaults */
      next_color_stage.in_shape = 'd0;

      case (cmd.shape)
	RECT: begin
	   next_color_stage.in_shape = in_rect;
	end
	TRI: begin
	   next_color_stage.in_shape = in_triangle;
	end
	LINE: begin
	   next_color_stage.in_shape = ~in_line[0] & in_rect_line;
	end
      endcase
   end // always_comb
	 
      
   /* Color stage pipeline barrier */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 color_stage <= 'd0;
      end
      else begin
	 if (~pipeline_stall) begin
	    color_stage <= next_color_stage;
	 end
      end
   end











   
   /* #####################################################
      #                                                   #
      #                   COLOR STAGE                     #
      #                                                   #
      ##################################################### */

   /* Pass Values */
   assign next_shader_stage.valid = color_stage.valid;
   assign next_shader_stage.x = color_stage.x;
   assign next_shader_stage.y = color_stage.y;
   assign next_shader_stage.in_shape = color_stage.in_shape;

   /* Texture Page cache */
   // always_ff @(posedge clk, posedge rst) begin
   //    if (rst) begin
   // 	 txpg = 'd0;
   //    end
   //    else begin
   // 	 if (txpg_ld) begin

   // 	    /* Select based on color mode */
   // 	    case (GPU_status.text_mode)
   // 	      2'd0: begin
   // 		 txpg[(txpg_count_x << 'd2) | 9'h0][txpg_count_y] <= txpg_val[0];
   // 		 txpg[(txpg_count_x << 'd2) | 9'h1][txpg_count_y] <= txpg_val[1];
   // 		 txpg[(txpg_count_x << 'd2) | 9'h2][txpg_count_y] <= txpg_val[2];
   // 		 txpg[(txpg_count_x << 'd2) | 9'h3][txpg_count_y] <= txpg_val[3];
   // 	      end
   // 	      2'd1: begin
   // 		 txpg[(txpg_count_x << 'd1) | 9'h0][txpg_count_y] <= txpg_val[0];
   // 		 txpg[(txpg_count_x << 'd1) | 9'h1][txpg_count_y] <= txpg_val[1];
   // 	      end
   // 	      default: begin
   // 		 txpg[txpg_count_x][txpg_count_y] <= txpg_val[0];
   // 	      end
   // 	    endcase // case (GPU_status.text_mode)
   // 	 end
   //    end
   // end
   
   /* Fill color logic */
   generate
      for (text_i = 0; text_i < `GPU_PIPELINE_WIDTH; text_i = text_i + 1) begin: color_stage_gen
	 always_comb begin
	    /* Defaults */
	    next_shader_stage.r[text_i] = 8'd128;
	    next_shader_stage.g[text_i] = 8'd128;
	    next_shader_stage.b[text_i] = 8'd128;

      /* If its textured, use results from texture unit */
//      if (cmd.texture == TEXT) begin
//	 for (text_i = 0; text_i < `GPU_PIPELINE_WIDTH; text_i = text_i + 1) begin
//	    if (cmd.shape == TRI) begin
//	       /* f_* are in the for [18  | 6] */
//	       f_u = (u_trans_x * color_stage.x[text_i] + 
//		      u_trans_y * color_stage.y[text_i] + u_trans_c);
//	       f_v = (v_trans_x * color_stage.x[text_i] + 
//		      v_trans_y * color_stage.y[text_i] + v_trans_c);
//	    end
//	    else begin
//	       f_u = color_stage.x[text_i] - cmd.x0;
//	       f_v = color_stage.y[text_i] - cmd.y0;
//	    end // else: !if(cmd.shape == POLY)
//
//	    m_u = ((f_u[13:6] & (~(text_mask_x << 'd3))) | ((text_off_x & text_mask_x) << 'd3));
//	    m_v = ((f_u[13:6] & (~(text_mask_y << 'd3))) | ((text_off_y & text_mask_y) << 'd3));
//	    
//	    next_shader_stage.r[text_i] = txpg[m_u][m_v];
//	    next_shader_stage.g[text_i] = txpg[m_u][m_v];
//	    next_shader_stage.b[text_i] = txpg[m_u][m_v];
//	 end
//     end
	 end // always_comb
      end // block: color_stage_gen
   endgenerate
   
   /* Shader stage pipeline barrier */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 shader_stage <= 'd0;
      end
      else begin
	 if (~pipeline_stall) begin
	    shader_stage <= next_shader_stage;
	 end
      end
   end












   
   /* #####################################################
      #                                                   #
      #                   SHADER STAGE                    #
      #                                                   #
      ##################################################### */

   /* Pass Values */
   assign next_wb_stage.valid = shader_stage.valid;
   assign next_wb_stage.x = shader_stage.x;
   assign next_wb_stage.y = shader_stage.y;
   assign next_wb_stage.in_shape = shader_stage.in_shape;


   /* Preform shading if requests by the cmd */
   generate
      for (color_i = 0; color_i < `GPU_PIPELINE_WIDTH; color_i = color_i + 1) begin: shader_stage_gen
	 always_comb begin
	    /* Defaults */
	    next_wb_stage.r[color_i] = shader_stage.r[color_i];
	    next_wb_stage.g[color_i] = shader_stage.g[color_i];
	    next_wb_stage.b[color_i] = shader_stage.b[color_i];
	    
	    int_r[color_i] = 64'd0;
	    int_g[color_i] = 64'd0;
	    int_b[color_i] = 64'd0;

	    f_r[color_i] = 64'd0;
	    f_g[color_i] = 64'd0;
	    f_b[color_i] = 64'd0;

	    /* Determine is we need to shader */
	    if (cmd.shade == SHADE) begin
	       /* Gouraud */
	       /* First get the color: int_* = [48 | 16]  */
	       int_r[color_i] = (r_trans_x * shader_stage.x[color_i] + 
				 r_trans_y * shader_stage.y[color_i] + r_trans_c);
	       int_g[color_i] = (g_trans_x * shader_stage.x[color_i] +
				 g_trans_y * shader_stage.y[color_i] + g_trans_c);
	       int_b[color_i] = (b_trans_x * shader_stage.x[color_i] +
				 b_trans_y * shader_stage.y[color_i] + b_trans_c);
	       
	       f_r[color_i] = (int_r[color_i] * shader_stage.r[color_i]) >> 'd7;
	       f_g[color_i] = (int_g[color_i] * shader_stage.g[color_i]) >> 'd7;
	       f_b[color_i] = (int_b[color_i] * shader_stage.b[color_i]) >> 'd7;

	       /* Saturate and round color (note that due to shift, 56 is the new sign bit) */
	       next_wb_stage.r[color_i] = ((f_r[color_i][56]) ? 8'b0 : 
					   (((f_r[color_i][63:16] + 
					      f_r[color_i][15]) > 48'd255) ? 8'd255 : 
					    (f_r[color_i][23:16] + f_r[color_i][15])));
	       next_wb_stage.g[color_i] = ((f_g[color_i][56]) ? 8'b0 :
					   (((f_g[color_i][63:16] + 
					      f_g[color_i][15]) > 48'd255) ? 8'd255 : 
					    (f_g[color_i][23:16] + f_g[color_i][15])));
	       next_wb_stage.b[color_i] = ((f_b[color_i][56]) ? 8'b0 :
					   (((f_b[color_i][63:16] + 
					      f_b[color_i][15]) > 48'd255) ? 8'd255 : 
					    (f_b[color_i][23:16] + f_b[color_i][15])));
	       
	    end
	    else begin
	       /* Flat */
	       f_r[color_i] = (cmd.r0 * shader_stage.r[color_i]) >> 'd7;
	       f_g[color_i] = (cmd.g0 * shader_stage.g[color_i]) >> 'd7;
	       f_b[color_i] = (cmd.b0 * shader_stage.b[color_i]) >> 'd7;
	       
	       next_wb_stage.r[color_i] = (f_r[color_i] > 24'd255) ? 8'd255 : f_r[color_i][7:0];
	       next_wb_stage.g[color_i] = (f_g[color_i] > 24'd255) ? 8'd255 : f_g[color_i][7:0];
	       next_wb_stage.b[color_i] = (f_b[color_i] > 24'd255) ? 8'd255 : f_b[color_i][7:0];
	    end
	 end // always_comb
      end // block: shader_stage_gen
   endgenerate
   
   
   /* Writeback stage pipeline barrier */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 wb_stage <= 'd0;
      end
      else begin
	 if (~pipeline_stall) begin
	    wb_stage <= next_wb_stage;
	 end
      end
   end










   
   /* #####################################################
      #                                                   #
      #                  WRITEBACK STAGE                  #
      #                                                   #
      ##################################################### */



   /* WB FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 wb_state <= WAIT_WB;
	 wb_count <= 8'd0;
	 wb_hold <= 16'd0;
      end
      else begin
	 wb_state <= wb_state_next;
	 wb_count <= wb_count_next;
	 wb_hold <= wb_hold_next;
      end
   end

   /* WB FSM next state + output logic */
   always_comb begin
      /* Defaults */
      wb_state_next = wb_state;
      wb_count_next = wb_count;
      wb_hold_next = wb_hold;
      
      wb_stall = 1'b0;

      wb_vram_addr = 'd0;
      wb_vram_data = 16'd0;
      wb_vram_re = 1'b0;
      wb_vram_we = 1'b0;

      wb_r = 8'd0;
      wb_g = 8'd0;
      wb_b = 8'd0;
      
      case (wb_state)
	WAIT_WB: begin
	   if (wb_stage.valid) begin
	      wb_stall = 1'b1;
	      wb_count_next = 8'd0;
	      wb_state_next = GETMEM_WB;
	   end
	end
	GETMEM_WB: begin
	   if (wb_count >= `GPU_PIPELINE_WIDTH) begin
	      wb_state_next = WAIT_WB;
	   end
	   else begin
	      wb_stall = 1'b1;
	      
	      if (~wb_stage.in_shape[wb_count]) begin
		 /* This pixel isnt in the shape, just move on to the next one */
		 wb_count_next = wb_count_next + 8'd1;
	      end
	      else if (gpu_en) begin
		 wb_vram_addr = {wb_stage.y[wb_count][8:0], wb_stage.x[wb_count][9:0]};
		 wb_vram_re = 1'b1;
		 
		 if (~vram_bus_in[15] | ~GPU_status.mask_en) begin
		    if (GPU_status.set_mask) begin
		       wb_hold_next[15] = 1'b1;
		    end
		    
		    if (cmd.shade == TRI) begin
		       if (cmd.transparency == SEMI) begin
			  case (cmd.semi_trans_mode)
			    2'd0: begin
			       wb_r = ((vram_bus_in[4:0] >> 'd1) + 
				       (wb_stage.r[wb_count][7:3] >> 'd1));
			       wb_g = ((vram_bus_in[9:5] >> 'd1) + 
				       (wb_stage.g[wb_count][7:3] >> 'd1));
			       wb_b = ((vram_bus_in[14:10] >> 'd1) + 
				       (wb_stage.b[wb_count][7:3] >> 'd1));
			    end
			    2'd1: begin
			       wb_r = ((vram_bus_in[4:0]) +
				       (wb_stage.r[wb_count][7:3]));
			       wb_b = ((vram_bus_in[9:5]) +
				       (wb_stage.g[wb_count][7:3]));
			       wb_g = ((vram_bus_in[14:10]) +
				       (wb_stage.b[wb_count][7:3]));
			    end
			    2'd2: begin
			       wb_r = ((vram_bus_in[4:0]) -
				       (wb_stage.r[wb_count][7:3]));
			       wb_b = ((vram_bus_in[9:5]) -
				       (wb_stage.g[wb_count][7:3]));
			       wb_g = ((vram_bus_in[14:10]) -
				       (wb_stage.b[wb_count][7:3]));
			    end
			    2'd3: begin
			       wb_r = ((vram_bus_in[4:0]) +
				       (wb_stage.r[wb_count][7:3] >> 'd2));
			       wb_g = ((vram_bus_in[9:5]) +
				       (wb_stage.g[wb_count][7:3] >> 'd2));
			       wb_b = ((vram_bus_in[14:10]) +
				       (wb_stage.b[wb_count][7:3] >> 'd2));
			    end
			  endcase // case (cmd.semi_trans_mode)
		       end // if (cmd.transparency == SEMI)
		       else begin
			  wb_r = wb_stage.r[wb_count][7:3];
			  wb_g = wb_stage.g[wb_count][7:3];
			  wb_b = wb_stage.b[wb_count][7:3];
		       end
		    end // if (cmd.shade == POLY)
		    else begin
		       if (cmd.transparency == SEMI) begin
			  case (GPU_status.semi_trans_mode)
			    2'd0: begin
			       wb_r = ((vram_bus_in[4:0] >> 'd1) +
				       (wb_stage.r[wb_count][7:3] >> 'd1));
			       wb_g = ((vram_bus_in[9:5] >> 'd1) +
				       (wb_stage.g[wb_count][7:3] >> 'd1));
			       wb_b = ((vram_bus_in[14:10] >> 'd1) +
				       (wb_stage.b[wb_count][7:3] >> 'd1));
			    end // case: 2'b0
			    2'd1: begin
			       wb_r = ((vram_bus_in[4:0]) +
				       (wb_stage.r[wb_count][7:3]));
			       wb_g = ((vram_bus_in[9:5]) +
				       (wb_stage.g[wb_count][7:3]));
			       wb_b = ((vram_bus_in[14:10]) +
				       (wb_stage.b[wb_count][7:3]));
			    end // case: 2'b1
			    2'd2: begin
			       wb_r = ((vram_bus_in[4:0]) -
				       (wb_stage.r[wb_count][7:3]));
			       wb_g = ((vram_bus_in[9:5]) -
				       (wb_stage.g[wb_count][7:3]));
			       wb_b = ((vram_bus_in[14:10]) -
				       (wb_stage.b[wb_count][7:3]));
			    end // case: 2'd2
			    2'd3: begin
			       wb_r = ((vram_bus_in[4:0]) +
				       (wb_stage.r[wb_count][7:3] >> 'd2));
			       wb_g = ((vram_bus_in[9:5]) +
				       (wb_stage.g[wb_count][7:3] >> 'd2));
			       wb_b = ((vram_bus_in[14:10]) +
				       (wb_stage.b[wb_count][7:3] >> 'd2));
			    end // case: 2'b0
			  endcase
		       end // if (cmd.transparency == SEMI)
		       else begin
			  wb_r = wb_stage.r[wb_count][7:3];
			  wb_g = wb_stage.g[wb_count][7:3];
			  wb_b = wb_stage.b[wb_count][7:3];
		       end // else: !if(cmd.transparency == SEMI)
		    end // else: !if(cmd.shade == POLY)
		    
		    /* Now set the hold register (saturating if needed) */
		    wb_hold_next[4:0] = (wb_r[7]) ? 5'd0 : ((wb_r > 8'd31) ? 5'd31 : wb_r[4:0]);
		    wb_hold_next[9:5] = (wb_g[7]) ? 5'd0 : ((wb_g > 8'd31) ? 5'd31 : wb_g[4:0]);
		    wb_hold_next[14:10] = (wb_b[7]) ? 5'd0 : ((wb_b > 8'd31) ? 5'd31 : wb_b[4:0]);
		 end // if (~vram_bus[15])
		 else begin
		    wb_hold_next = vram_bus_in;
		 end // else: !if(~vram_bus[15])
		 
		 wb_state_next = TOMEM_WB;
	      end
	   end // if (vram_rdy)
	end // case: READINGMEM_WB
	TOMEM_WB: begin
	   wb_stall = 1'b1;

	   if (gpu_en) begin
	      /* Be sure the address is in VRAM and in the drawing area, otherwise
	       just ignore this one and move on */
	      if ((wb_stage.x[wb_count] >= x_tl) &
		  (wb_stage.x[wb_count] <= x_br) &
		  (wb_stage.y[wb_count] >= y_tl) &
		  (wb_stage.y[wb_count] <= y_br)) begin
		 wb_vram_we = 1'b1;
		 wb_vram_data = wb_hold;
		 wb_vram_addr = {wb_stage.y[wb_count][8:0], wb_stage.x[wb_count][9:0]};
	      end
	      wb_count_next = wb_count + 8'd1;
	      wb_state_next = GETMEM_WB;
	   end // if (gpu_en)
	end
      endcase // case (wb_state)
   end // always_comb
	    
		 
	
	 
	 
   
endmodule // gpu
