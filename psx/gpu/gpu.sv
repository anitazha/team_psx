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
   localparam GP1_NB_TEXT_ANC       'h20; // Ancient texture disable

   /* Some important constants */
   localparam GPU_STATUS_RST        'h

   
   /* Internal Lines */
   GPU_status_t GPU_status, GPU_status_new;
   

   /* #####################################################
      #                                                   #
      #                STATUS REGISTERS                   #
      #                                                   #
      ##################################################### */
   
   /* GPU Status register */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 GPU_status <= GPU_STATUS_RST;
      end
      else begin
	 GPU_status <= GPU_status_new;
      end
   end

   /* GPU New Status logic */
   always_comb begin
      GPU_status_new.text_x = ;
      GPU_status_new.text_y = ;

      GPU_status_new.semi_trans_mode;

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

      if (to_gp1) begin
	 case (data_in)
	   GP1_
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
   
