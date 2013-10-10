`include "gpu.vh"


module gpu(
	   input wire 	     clk, rst,
	   input wire 	     to_gp0, to_gp1;
	   inout wire [31:0] main_bus,
	   inout wire [15:0] vram_bus,
	   output reg 	     dma_fifo_rdy,
	   output reg [19:0] vram_addr);

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
   localparam GP0_B_R1_TX_OQ_BL     'h6C; // Textured, rect variable, opaque, blended
   localparam GP0_B_R1_TX_OQ_RW     'h6D; // Textured, rect variable, opaque, raw
   localparam GP0_B_R1_TX_ST_BL     'h6E; // Textured, rect variable, semi-trans, blended
   localparam GP0_B_R1_TX_ST_RW     'h6F; // Textured, rect variable, semi-trans, raw
   localparam GP0_B_R8_TX_OQ_BL     'h74; // Textured, rect variable, opaque, blended
   localparam GP0_B_R8_TX_OQ_RW     'h75; // Textured, rect variable, opaque, raw
   localparam GP0_B_R8_TX_ST_BL     'h76; // Textured, rect variable, semi-trans, blended
   localparam GP0_B_R8_TX_ST_RW     'h77; // Textured, rect variable, semi-trans, raw
   localparam GP0_B_R16_TX_OQ_BL    'h7C; // Textured, rect variable, opaque, blended
   localparam GP0_B_R16_TX_OQ_RW    'h7D; // Textured, rect variable, opaque, raw
   localparam GP0_B_R16_TX_ST_BL    'h7E; // Textured, rect variable, semi-trans, blended
   localparam GP0_B_R16_TX_ST_RW    'h7F; // Textured, rect variable, semi-trans, raw

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
   end

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
   
   /* #####################################################
      #                                                   #               
      #                 "FETCH" STAGE                     #
      #                                                   #
      ##################################################### */
   
   /* Command FIFO */
   fifo_16x32(.data_in(main_bus),
	      .we(to_gp0 & (main_bus != GP0_NB_NOP)),
	      .re(),
	      .full(),
	      .empty(),
	      .data_out(),
	      .*);
   
   /* Process Non-buffer commands immediately */
   always_comb begin
      /* Defaults */
      GPU_read_reg_ld = 1'b0;
      GPU_read_reg_new = 32'b0;

      GPU_status_clr = 1'b0;
      GPU_status_new.irq = GPU_status.irq;
      GPU_status_new.display_en = GPU_status.display_en;
      GPU_status_new.DMA_direction = GPU_status.DMA_direction;
      GPU_status_new.horizontal_res_1 = GPU_status.horizontal_res_1;
      GPU_status_new.vertical_res = GPU_status.vertical_res;
      GPU_status_new.video_mode = GPU_status.video_mode;
      GPU_status_new.depth = GPU_status.depth;
      GPU_status_new.interlace_en = GPU_status.interlace_en;
      GPU_status_new.horizontal_res_2 = GPU_status.horizontal_res_2;
      GPU_status_new.reverse = GPU_status.reverse;
      
      display_start_x_new = display_start_x;
      display_start_y_new = display_start_y;
      
      /* Process all GP1 commands (only non-buffered GP0 command is a nop... */
      if (to_gp1) begin
	 case (data_in[31:24])
	   GP1_NB_RST: begin
	      GPU_status_clr = 1'b1;
	   end
	   GP1_NB_RST_CMDBUF: begin
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

   /* Decode Logic */
   always_comb begin
      /* Defaults */

   end
   
