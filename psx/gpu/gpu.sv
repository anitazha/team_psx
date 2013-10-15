`default_nettype none
`include "gpu.vh"


module gpu(
	   input wire 	      clk, rst,
	   input wire 	      to_gp0, to_gp1,
	   input wire 	      vram_rdy;
	   input wire [31:0]  main_bus,
	   inout wire [15:0]  vram_bus,
	   output reg [19:0]  vram_addr,
	   output wire [31:0] gpu_stat, gpu_read,
	   output reg 	      vram_re, vram_we);

   /* Parameters */
   /* GPU CMDs Buffered */
   localparam GP0_B_NOP             'h03; // nop
   localparam GP0_B_INTREQ          'h1F; // Interrupt request
   
   localparam GP0_B_P3_MC_OQ        'h20; // Monochrome, 3-sided poly, opaque
   localparam GP0_B_P3_MC_ST        'h22; // Monochrome, 3-sided poly, semi-trans
   localparam GP0_B_P4_MC_OQ        'h28; // Monochrome, 4-sided poly, opaque
   localparam GP0_B_P4_MC_ST        'h2A; // Monochrome, 4-sided poly, semi-trans
   
   localparam GP0_B_P3_TX_OQ_BL     'h24; // Textured, 3-sided poly, opaque, blended
   localparam GP0_B_P3_TX_OQ_RW     'h25; // Textured, 3-sided poly, opaque, raw
   localparam GP0_B_P3_TX_ST_BL     'h26; // Textured, 3-sided poly, semi-trans, blended
   localparam GP0_B_P3_TX_ST_RW     'h27; // Textured, 3-sided poly, semi-trans, raw
   localparam GP0_B_P4_TX_OQ_BL     'h2C; // Textured, 4-sided poly, opaque, blended
   localparam GP0_B_P4_TX_OQ_RW     'h2D; // Textured, 4-sided poly, opaque, raw
   localparam GP0_B_P4_TX_ST_BL     'h2E; // Textured, 4-sided poly, semi-trans, blended
   localparam GP0_B_P4_TX_ST_RW     'h2F; // Textured, 4-sided poly, semi-trans, raw

   localparam GP0_B_P3_MC_OQ_SH     'h30; // Shaded, 3-sided poly, opaque
   localparam GP0_B_P3_MC_ST_SH     'h32; // Shaded, 3-sided poly, semi-trans
   localparam GP0_B_P4_MC_OQ_SH     'h38; // Shaded, 4-sided poly, opaque
   localparam GP0_B_P4_MC_ST_SH     'h3A; // Shaded, 4-sided poly, semi-trans

   localparam GP0_B_P3_TX_OQ_BL_SH  'h34; // Textured, shaded, 3-sided poly, opaque, blended
   localparam GP0_B_P3_TX_ST_BL_SH  'h36; // Textured, shaded, 3-sided poly, semi-trans, blended
   localparam GP0_B_P4_TX_OQ_BL_SH  'h3C; // Textured, shaded, 4-sided poly, opaque, blended
   localparam GP0_B_P4_TX_ST_BL_SH  'h3E; // Textured, shaded, 4-sided poly, semi-trans, blended

   localparam GP0_B_LN_MC_OQ        'h40; // Monochrome, line, opaque
   localparam GP0_B_LN_MC_ST        'h42; // Monochrome, line, semi-trans
   localparam GP0_B_PL_MC_OQ        'h48; // Monochrome, polyline, opaque
   localparam GP0_B_PL_MC_ST        'h4A; // Monochrome, polyline, semi-trans

   localparam GP0_B_LN_MC_OQ_SH     'h50; // Shaded, line, opaque
   localparam GP0_B_LN_MC_ST_SH     'h52; // Shaded, line, semi-trans
   localparam GP0_B_PL_MC_OQ_SH     'h58; // Shaded, polyline, opaque
   localparam GP0_B_PL_MC_ST_SH     'h5A; // Shaded, polyline, semi-trans
   
   localparam GP0_B_RV_MC_OQ        'h60; // Monochrome, rect variable, opaque
   localparam GP0_B_RV_MC_ST        'h62; // Monochrome, rect variable, semi-trans
   localparam GP0_B_R1_MC_OQ        'h68; // Monochrome, rect 1x1, opaque
   localparam GP0_B_R1_MC_ST        'h6A; // Monochrome, rect 1x1, semi-trans
   localparam GP0_B_R8_MC_OQ        'h70; // Monochrome, rect 8x8, opaque
   localparam GP0_B_R8_MC_ST        'h72; // Monochrome, rect 8x8, semi-trans
   localparam GP0_B_R16_MC_OQ       'h78; // Monochrome, rect 16x16, opaque
   localparam GP0_B_R16_MC_ST       'h7A; // Monochrome, rect 16x16, semi-trans

   localparam GP0_B_RV_TX_OQ_BL     'h64; // Textured, rect variable, opaque, blended
   localparam GP0_B_RV_TX_OQ_RW     'h65; // Textured, rect variable, opaque, raw
   localparam GP0_B_RV_TX_ST_BL     'h66; // Textured, rect variable, semi-trans, blended
   localparam GP0_B_RV_TX_ST_RW     'h67; // Textured, rect variable, semi-trans, raw
   localparam GP0_B_R1_TX_OQ_BL     'h6C; // Textured, rect 1x1, opaque, blended
   localparam GP0_B_R1_TX_OQ_RW     'h6D; // Textured, rect 1x1, opaque, raw
   localparam GP0_B_R1_TX_ST_BL     'h6E; // Textured, rect 1x1, semi-trans, blended
   localparam GP0_B_R1_TX_ST_RW     'h6F; // Textured, rect 1x1, semi-trans, raw
   localparam GP0_B_R8_TX_OQ_BL     'h74; // Textured, rect 8x8, opaque, blended
   localparam GP0_B_R8_TX_OQ_RW     'h75; // Textured, rect 8x8, opaque, raw
   localparam GP0_B_R8_TX_ST_BL     'h76; // Textured, rect 8x8, semi-trans, blended
   localparam GP0_B_R8_TX_ST_RW     'h77; // Textured, rect 8x8, semi-trans, raw
   localparam GP0_B_R16_TX_OQ_BL    'h7C; // Textured, rect 16x16, opaque, blended
   localparam GP0_B_R16_TX_OQ_RW    'h7D; // Textured, rect 16x16, opaque, raw
   localparam GP0_B_R16_TX_ST_BL    'h7E; // Textured, rect 16x16, semi-trans, blended
   localparam GP0_B_R16_TX_ST_RW    'h7F; // Textured, rect 16x16, semi-trans, raw

   localparam GP0_B_DRWMODE         'hE1; // Set various drawing params
   localparam GP0_B_TEXTWND         'hE2; // Set texture window
   localparam GP0_B_DRWWND_TL       'hE3; // Set top-left of drawing window
   localparam GP0_B_DRWWND_BR       'hE4; // Set bottom-right of drawing window
   localparam GP0_B_DRWWND_OS       'hE5; // Set drawing window offset
   localparam GP0_B_MSK             'hE6; // Set how mask bit is handled

   localparam GP0_B_CLRC            'h01; // Clear texture cache
   localparam GP0_B_FILRECT         'h02; // Fill rect in VRAM
   localparam GP0_B_CPYRECT_V2V     'h80; // Copy rect VRAM->VRAM
   localparam GP0_B_CPYRECT_C2V     'hA0; // Copy rect CPU->VRAM
   localparam GP0_B_CPYRECT_V2C     'hC0; // Copy rect VRAM->CPU
   
   /* GPU CMDs Not-Buffered */
   localparam GP0_NB_NOP            'h00; // nop; not put in fifo

   localparam GP1_NB_RST            'h00; // Reset GPU
   localparam GP1_NB_RST_CMDBUF     'h01; // Reset CMD fifo
   localparam GP1_NB_ACKINT         'h02; // Acknowledge interrupt
   localparam GP1_NB_DIS            'h03; // Enalbe display
   localparam GP1_NB_DMADIR         'h04; // Set DMA direction
   localparam GP1_NB_DIS_TL         'h05; // Set top-left of the display area
   localparam GP1_NB_DIS_HZ         'h06; // Set display area horizontal length
   localparam GP1_NB_DIS_VR         'h07; // Set display area verital length
   localparam GP1_NB_DIS_MODE       'h08; // Set display mode
   localparam GP1_NB_TEXT           'h09; // Enable textures
   localparam GP1_NB_GETINFO        'h10; // Get GPU info

   /* Some important constants */
   localparam GPU_STATUS_RST        'h14802000; // Reset status of GPU

   
   /* Internal Lines */
   /* Status reg lines */
   GPU_status_t GPU_status, GPU_status_new;
   reg 			     GPU_status_clr;
   
   reg [31:0] 		     GPU_read_reg, GPU_read_reg_new;
   reg 			     GPU_read_reg_ld;

   reg [9:0] 		     display_start_x, display_start_x_new;
   reg [8:0] 		     display_start_y, display_start_y_new;

   reg [1:0] 		     xy_flip_reg, xy_flip_reg_new;

   reg [9:0] 		     x_tl, y_tl, x_br, y_br, x_off, y_off;
   reg [9:0] 		     x_lt_new, y_tl_new, x_br_new, y_br_new, x_off_new, y_off_new;

   /* FETCH STAGE */
   /* FIFO lines */
   wire [31:0] 		     cmd_fifo_cmd;
   wire 		     cmd_fifo_full, cmd_fifo_empty, cmd_fifo_clr, cmd_fifo_re;


   /* PARSE STAGE */
   /* Command reg */
   CMD_t cmd, new_cmd;

   logic [7:0] 		     cmd_hold, cmd_hold_new;
   
   logic [1:0] 		     side0, side1, side2;

   /* Stall */
   logic 		     pipeline_stall;
   

   /* DRAW STAGE */
   drawing_stage_t draw_stage, next_draw_stage;
   
   logic [`GPU_PIPELINE_WIDTH-1:0]       in_triangle;
   logic [1:0][`GPU_PIPELINE_WIDTH-1:0]  in_line;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	 in_rect;
   genvar 				 triangles, lines, rects;

   /* COLOR STAGE */
   logic 				 text_mem_stall; // Stall if Texture Cache miss
   logic 				 clut_mem_stall; // Stall if CLUT cache miss

   /* Texture unit lines */
   logic [`GPU_PIPELINE_WIDTH-1:0][7:0]  text_unit_r, text_unit_g, text_unit_b;
   logic 				 text_mem_wb;

   logic 				 clut_mem_wb;
   







   
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

   /* Some GPU Status bits which simply depend on state */
   always_comb begin
      /* Defaults */
      GPU_status_new.dma_fifo_state = GPU_status.dma_fifo_state;
      

   /* GPU Read register (0x1F801810) */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 GPU_read_reg <= 32'b0;
      end
      else begin
	 if (GPU_read_reg_ld) begin
	    GPU_read_reg <= GPU_read_reg_new;
	 end
      end
   end

   assign gpu_read = GPU_read_reg

   /* Display start registers */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 display_start_x <= 10'b0;
	 display_start_y <= 9'b0;
      end
      else begin
	 display_start_x <= display_start_x_new;
	 display_start_y <= display_start_y_new;
      end
   end
   
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
   end
   






   
   /* #####################################################
      #                                                   #               
      #                 "FETCH" STAGE                     #
      #                                                   #
      ##################################################### */
   
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
   
   /* Process Non-buffer commands immediately */
   always_comb begin
      /* Defaults */
      cmd_fifo_clr = 1'b0;
      
      GPU_read_reg_ld = 1'b0;
      GPU_read_reg_new = 32'b0;

      GPU_status_clr = 1'b0;
      GPU_status_new.irq = set_gpu_irq | GPU_status.irq;
      GPU_status_new.display_en = GPU_status.display_en;
      GPU_status_new.DMA_direction = GPU_status.DMA_direction;
      GPU_status_new.horizontal_res_1 = GPU_status.horizontal_res_1;
      GPU_status_new.vertical_res = GPU_status.vertical_res;
      GPU_status_new.video_mode = GPU_status.video_mode;
      GPU_status_new.depth = GPU_status.depth;
      GPU_status_new.interlace_en = GPU_status.interlace_en;
      GPU_status_new.horizontal_res_2 = GPU_status.horizontal_res_2;
      GPU_status_new.reverse = GPU_status.reverse;
      GPU_status_new.text_en = GPU_status.text_en;
      
      display_start_x_new = display_start_x;
      display_start_y_new = display_start_y;
      
      /* Process all GP1 commands (only non-buffered GP0 command is a nop... */
      if (to_gp1) begin
	 case (data_in[31:24])
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
	      GPU_status_new.display_en = data_in[0];
	   end
	   GP1_NB_DMADIR: begin
	      /* DMA direction */
	      GPU_status_new.DMA_direction = data_in[1:0];
	   end
	   GP1_NB_DIS_TL: begin
	      /* Display area VRAM */
	      display_start_x_new = data_in[9:0];
	      display_start_y_new = data_in[18:10];
	   end
	   GP1_NB_DIS_HZ: begin
	      /* Display width (hsync) */
	   end
	   GP1_NB_DIS_VR: begin
	      /* Display height (vsync) */
	   end
	   GP1_NB_DIS_MODE: begin
	      /* Display mode */
	      GPU_status_new.horizontal_res_1 = data_in[1:0];
	      GPU_status_new.vertical_res = data_in[2];
	      GPU_status_new.video_mode = data_in[3];
	      GPU_status_new.depth = data_in[4];
	      GPU_status_new.interlace_en = data_in[5];
	      GPU_status_new.horizontal_res_2 = data_in[6];
	      GPU_status_new.reverse = data_in[7];
	   end
	   GP1_NB_TEXT: begin
	      /* Texture enable/disable */
	      GPU_status_new.text_en = data_in[0];
	   end
	   GP1_NB_GETINFO: begin
	   case (data_in[3:0])
	     'h02: begin
		/* Texture window setting */
		GPU_read_reg_ld = 1'b1;
		
	     end
	     'h03: begin
		/* Draw area top-left */
		GPU_read_reg_ld = 1'b1;
		
	     end
	     'h04: begin
		/* Draw area bottom-right */
		GPU_read_reg_ld = 1'b1;
		
	     end
	     'h05: begin
		/* Draw area offset */
		GPU_read_reg_ld = 1'b1;
		
	     end
	     'h07: begin
		/* GPU Version */
		GPU_read_reg_ld = 1'b1;
		GPU_read_reg_new = 32'h2;
	     end
	     'h08: begin
		/* 0s (?) */
		GPU_read_reg_ld = 1'b1;
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
   assign pipeline_stall = text_mem_stall | clut_mem_stall;

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

   /* Command (and thus next decode state) logic */
   always_comb begin
      /* Defaults */
      decode_state_next = decode_state;
      new_cmd = cmd;
      cmd_hold_new = cmd_hold;
      
      cmd_fifo_re = 1'b0;

      set_gpu_iqr = 1'b0;

      clr_text_cache = 1'b0;
      clr_clut_cache = 1'b0;

      GPU_status_new.text_x = GPU_status.text_x;
      GPU_status_new.text_y = GPU_status.text_y;
      GPU_status_new.semi_trans_mode = GPU_status.semi_trans_mode;
      GPU_status_new.text_mode = GPU_status.text_mode;
      GPU_status_new.dither_mode = GPU_status.dither_mode;
      GPU_status_new.draw_to_display = GPU_status.draw_to_display;
      GPU_status_new.text_en = GPU_status.text_en;
      GPU_status_new.mask_en = GPU_status.mask_en;
      GPU_status_new.set_mask = GPU_status.set_mask;
      
      xy_flip_reg_new[0] = xy_flip_reg[0];
      xy_flip_reg_new[1] = xy_flip_reg[1];

      x_tl_new = x_lt;
      y_tl_new = y_lt;
      x_br_new = x_br;
      y_br_new = y_br;
      x_off_new = x_off;
      y_off_new = y_off;

      /* Process commands (or handle whats going on if in the middle of one) */
      case (decode_state)
	WAIT: begin
	   if (~cmd_fifo_empty) begin
	      cmd_hold_new = cmd_fifo_cmd[31:24];
	      
	      /* Pick either move to getting next arg  or
	         handle function immediately depending on type.
	         Also, set as many of the command params as possible */
	      case (cmd_fifo_cmd[31:24])
		GP0_B_NOP: begin
		   /* nop */
		   cmd_fifo_re = 1'b1;
		end
		GP0_B_INTREQ: begin
		   /* Interrupt request */
		   cmd_fifo_re = 1'b1;
		   set_gpu_irq = 1'b1;
		end
		GP0_B_P3_MC_OQ, GP0_B_P4_MC_OQ: begin
		   /* Monochrome, opaque */
		   decode_state_next = GET_XY0;
		   
		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = NONE;
		   new_cmd.texture = MONO;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_MC_ST
		GP0_B_P3_TX_OQ_BL, GP0_P4_TX_OQ_BL: begin
		   /* Textured, opaque, blended */
		   decode_state_next = GET_XY0;

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
		   new_cmd.shape = TRI;
		   new_cmd.transparency = SEMI;
		   new_cmd.shade = SHADE;
		   new_cmd.texture = TEXT;
		   new_cmd.texture_mode = BLENDED;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end // case: GP0_B_P3_MC_ST_SH
		GP0_B_LN_MC_OQ, GP0_B_PL_MC_OQ: begin
		   /* Monochrome, line, opaque */
		   decode_state_next = GET_XY0;

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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

		   cmd_fifo_re = 1'b1;
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
		   cmd_fifo_re = 1'b1;
		   GPU_status_new.text_x = cmd_fifo_cmd[3:0];
		   GPU_status_new.text_y = cmd_fifo_cmd[4];
		   GPU_status_new.semi_trans_mode = cmd_fifo_cmd[6:5];
		   GPU_status_new.text_mode = cmd_fifo_cmd[8:7];
		   GPU_status_new.dither_mode = cmd_fifo_cmd[9];
		   GPU_status_new.draw_to_display = cmd_fifo_cmd[10];
		   GPU_status_new.text_en = cmd_fifo_cmd[11];
		   xy_flip_reg_new[0] = cmd_fifo_cmd[12];
		   xy_flip_reg_new[1] = cmd_fifo_cmd[13];
		end // case: GP0_B_DRWMODE
		GP0_B_TEXTWND: begin
		   /* Set texture window */
		   cmd_fifo_re = 1'b1;
		end
		GP0_B_DRWWND_TL: begin
		   /* Set top-left of drawing window */
		   cmd_fifo_re = 1'b1;
		   x_tl_new = cmd_fifo_cmd[9:0];
		   y_tl_new = cmd_fifo_cmd[19:10];
		end
		GP0_B_DRWWND_BR: begin
		   /* Set bottom-right of drawing window */
		   cmd_fifo_re = 1'b1;
		   x_br_new = cmd_fifo_cmd[9:0];
		   y_br_new = cmd_fifo_cmd[19:10];
		end
		GP0_B_DRWWND_OS: begin
		   /* Set drawing window offset */
		   cmd_fifo_re = 1'b1;
		   x_off_new = cmd_fifo_cmd[10:0];
		   y_off_new = cmd_fifo_cmd[21:11];
		end
		GP0_B_MSK: begin
		   /* Set mask handle */
		   cmd_fifo_re = 1'b1;
		   GPU_status_new.mask_en = cmd_fifo_cmd[1];
		   GPU_status_new.set_mask = cmd_fifo_cmd[0];
		end
		GP0_B_CLRC: begin
		   /* Clear texture and clut caches */
		   cmd_fifo_re = 1'b1;
		   clr_text_cache = 1'b1;
		   clr_clut_cache = 1'b1;
		end
		GP0_B_FILRECT: begin
		   /* Fill VRAM rect */
		   decode_state_next = GET_XY0;

		   cmd_fifo_re = 1'b1;
		   new_cmd.b0 = cmd_fifo_cmd[23:16];
		   new_cmd.g0 = cmd_fifo_cmd[15:8];
		   new_cmd.r0 = cmd_fifo_cmd[7:0];
		end
		GP0_B_CPYRECT_V2V, GP0_B_CPYRECT_C2V, GP0_B_CPYRECT_V2C: begin
		   /* Copy rect */
		   decode_state_next = GET_XY0;

		   cmd_fifo_re = 1'b1;
		end
	      endcase // case (cmd_fifo_cmd[31:24]) 
	   end // if (~cmd_fifo_empty)
	end // case: WAIT
	GET_XY0: begin
	   new_cmd.x0 = cmd_fifo_cmd[10:0] + {1'b0, x_off};
	   new_cmd.y0 = cmd_fifo_cmd[26:16] + {1'b0, y_off};
	   
	   /* Now the command is in the hold register */
	   case (cmd_hold) begin
	      GP0_B_P3_MC_OQ, GP0_B_P4_MC_OQ, GP0_B_P3_MC_ST, GP0_B_P4_MC_ST: begin
		 /* Now to get the next coord */
		 decode_stage_next = GET_XY1;
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
	     GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_OQ_BL_SH,
	       GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_OQ_BL_SH, GP0_B_P3_TX_OQ_BL_SH, 
	       GP0_B_P3_TX_OQ_BL_SH: begin
		  /* New get text coords and stuff */
		  decode_state_next = GET_TX0;
	       end
	     
	   endcase // case (cmd_hold)
	end // case: GET_XY0
	     
	   
      endcase // case (decode_state)
   end
   
   
   
   /* X, Y generator */
   always_comb begin
      /* Defaults */
      new_drawing_stage.x = 'd0;
      new_drawing_stage.y = 'd0;

      /* Use the block to determine x, y values */
      if (next_drawing_stage.valid) begin
      end
   end
   
   /* CMD register - for storing all info for the current cmd */
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
   line_finder lf_s0(.x0(cmd.x1), .y0(cmd.y1),
		     .x1(cmd.x2), .y1(cmd.y2),
		     .x(cmd.x0), .y(cmd.y0),
		     .result(side0)),
     lf_s1(.x0(cmd.x0), .y0(cmd.y0),
	   .x1(cmd.x2), .y1(cmd.y2),
	   .x(cmd.x1), .y(cmd.y1),
	   .result(side1)),
     lf_s2(.x0(cmd.x0), .y0(cmd.y0),
	   .x1(cmd.x1), .y1(cmd.y1),
	   .x(cmd.x2), .y(cmd.y2),
	   .result(side2));
     








   
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
      for (triangles = 0; triangles < `GPU_PIPELINE_WIDTH; triangles = triangles + 1) begin
	 triangle_fill draw_tri_fill(.x0(cmd.x0), .y0(cmd.y0),
				     .x1(cmd.x1), .y1(cmd.y1),
				     .x2(cmd.x2), .y2(cmd.y2),
				     .x(draw_stage.x), .y(draw_state.y),
				     .side0(side0), .side1(side1), .side2(side2),
				     .in(in_triangle[triangles]));
      end
   endgenerate

   /* Line Modules */
   generate
      for (lines = 0; lines < `GPU_PIPELINE_WIDTH; lines = lines + 1) begin
	 line_finder draw_line_fill(.x0(cmd.x0), .y0(cmd.y0), .x1(cmd.x1), .y1(cmd.y1),
				    .x(drawin_stage.x), .y(drawing_state.y),
				    .result({in_line[1][lines], in_line[0][lines]}));
      end
   endgenerate

   /* Rectangle check */
   generate
      for (rects = 0; rects < `GPU_PIPELINE_WIDTH; rects = rects + 1) begin
	 always_comb begin
	    /* Defaults */
	    in_rect[rects] = 1'b0;

	    if ((x[rects] > cmd.x0) & (x[rects] < cmd.x1) &
		(y[rects] > cmd.y0) & (y[rects] < cmd.y1)) begin
	       in_rect[rects] = 1'b1;
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
	   next_color_stage.in_shape = in_line[0];
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

   /* Texture unit */
   /* ??? */
   
   /* Texture cache */
   texture_cache text_cache(.data_in(vram_bus),
			    .
			    .data_out(texture_data),
			    .clear(clear_text_cache),
			    .*);

   /* CLUT cache */
   
   /* Fill color logic */
   always_comb begin
      /* Defaults */
      next_shader_stage.r = {`GPU_PIPELINE_WIDTH{cmd.r0}};
      next_shader_stage.g = {`GPU_PIPELINE_WIDTH{cmd.g0}};
      next_shader_stage.b = {`GPU_PIPELINE_WIDTH{cmd.b0}};

      /* If its textured, use results from texture unit */
      if (cmd.texture == TEXT) begin
	 next_shader_stage.r = text_unit_r;
	 next_shader_stage.g = text_unit_g;
	 next_shader_stage.b = text_unit_b;
      end
   end // always_comb

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


   
endmodule // gpu
