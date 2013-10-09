
module gpu(
	   input wire 	     clk, rst,
	   input wire 	     to_gp0, to_gp1;
	   inout wire [31:0] main_bus,
	   inout wire [15:0] vram_bus,
	   output reg 	     dma_fifo_full,
	   output reg [19:0] vram_addr);

   /* Parameters */
   /* GPU CMDs BUF */
   localparam GP0_B_CLRC            'h01; // Clear texture cache
   localparam GP0_B_FRECT           'h02; // Fill rect in VRAM
   localparam GP0_B_NOP             'h03; // nop
   localparam GP0_B_INTREQ          'h1F; // Interupt request
   
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

   localparam GP0_B_P3_TX_OQ_SH     'h34; // Textured, shaded, 3-sided poly, opaque
   localparam GP0_B_P3_TX_ST_SH     'h36; // Textured, shaded, 3-sided poly, semi-trans
   localparam GP0_B_P4_TX_OQ_SH     'h3C; // Textured, shaded, 4-sided poly, opaque
   localparam GP0_B_P4_TX_ST_SH     'h3E; // Textured, shaded, 4-sided poly, semi-trans

   localparam GP0_B_LN_MC_OQ        'h40; // Monochrome, line, opaque
   localparam GP0_B_LN_MC_ST        'h42; // Monochrome, line, semi-trans
   localparam GP0_B_PL_MC_OQ        'h48; // Monochrome, polyline, opaque
   localparam GP0_B_PL_MC_ST        'h4A; // Monochrome, polyline, semi-trans

   localparam GP0_B_LN_MC_OQ_SH     'h50; // Shaded, line, opaque
   localparam GP0_B_LN_MC_ST_SH     'h52; // Shaded, line, semi-trans
   localparam GP0_B_PL_MC_OQ_SH     'h58; // Shaded, polyline, opaque
   localparam GP0_B_PL_MC_ST_SH     'h5A; // Shaded, polyline, semi-trans
   
   
   
   
   /* Internal Lines */


   /* #####################################################
      #                                                   #               
      #                 "FETCH" STAGE                     #
      #                                                   #
      ##################################################### */
   
   /* Command FIFO */
   fifo_16x32(.data_in(main_bus),
	      .we(),
	      .re(),
	      .full(),
	      .empty(),
	      .data_out(),
	      .*);



   
   /* #####################################################
      #                                                   #
      #               DECODE/PARSE STAGE                  #
      #                                                   #
      ##################################################### */

   /* Decode Logic */
   always_comb begin
      /* Defaults */

   end
   
