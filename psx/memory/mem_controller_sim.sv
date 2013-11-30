/*****************************************************************
 * FOR SIMULATION INCLUDE THE FOLLOWING IN THE MODULE ABOVE THIS *
 * 
 * assign dram_dq = dram_oe ? dram_dq_in : 32'bz;
 * assign dram_dq_out = dram_dq;
 *  
 *  / SDRAM MODEL /
 *  qsys_sdram_mem_model sim_mem
 *    (.reset_reset_n (rst),
 *     .clk_clk       (clk),
 *     .zs_dq         (dram_dq),
 *     .zs_addr       (dram_addr),
 *     .zs_ba         (dram_bank),
 *     .zs_cas_n      (dram_cas_n),
 *     .zs_cke        (dram_cke),
 *     .zs_cs_n       (dram_cs_n),
 *     .zs_dqm        (dram_dqm),
 *     .zs_ras_n      (dram_ras_n),
 *     .zs_we_n       (dram_we_n));
 *
 *  / PSX MEMORY CONTROLLER /
 *  mem_controller m_controller
 *    (.clk (clk),
 *     .rst (rst),
 *     // sdram chip interface
 *     .dram_addr   (dram_addr),
 *     .dram_bank   (dram_bank),
 *     .dram_cas_n  (dram_cas_n),
 *     .dram_cke    (dram_cke),
 *     .dram_clk    (dram_clk),
 *     .dram_cs_n   (dram_cs_n),
 *     .dram_dqm    (dram_dqm),
 *     .dram_ras_n  (dram_ras_n),
 *     .dram_we_n   (dram_we_n),
 *     .dram_dq_in  (dram_dq_in),
 *     .dram_dq_out (dram_dq_out),
 *     .dram_oe_out (dram_oe),
 *     // cpu data
 *     .data_addr   (data_addr),
 *     .data_data_i (data_data_i),
 *     .data_ren    (data_ren),
 *     .data_wen    (data_wen),
 *     .data_ack    (data_ack),
 *     .data_data_o (data_data_o),
 *     // cpu instructions
 *     .inst_addr   (inst_addr),
 *     .inst_ren    (inst_ren),
 *     .inst_ack    (inst_ack),
 *     .inst_data_o (inst_data_o),
 *     // gpu signals
 *     .to_gp0        (to_gp0),
 *     .to_gp1        (to_gp1),
 *     .gpu_ren       (gpu_ren),
 *     .gpu_rdy       (gpu_rdy),
 *     .gpu_fifo_full (gpu_fifo_full),
 *     .gpu_stat      (gpu_stat),
 *     .gpu_read      (gpu_read),
 *     .gp0           (gp0),
 *     .gp1           (gp1),
 *     // hw register connections
 *     .hblank   (hblank),
 *     .vblank   (vblank),
 *     .dotclock (dotclock),
 *     // interrupts
 *     .interrupts (interrupts));
 * 
 * ************************************************************/

module mem_controller(input  logic  clk, rst,
                      
                      /* SDRAM CHIP INTERFACE */
                      output logic [12:0] dram_addr,
                      output logic [ 1:0] dram_bank,
                      output logic 	  dram_cas_n,
                      output logic 	  dram_cke,
                      output logic 	  dram_clk,
                      output logic 	  dram_cs_n,
                      output logic [ 3:0] dram_dqm,
                      //inout  wire  [31:0] dram_dq,
                      output logic 	  dram_ras_n,
                      output logic 	  dram_we_n,
                      output logic [31:0] dram_dq_in,
                      input  logic [31:0] dram_dq_out,
                      output logic 	  dram_oe_out,
                      
                      /* CPU DATA */
                      input  logic [31:0] data_addr,
                      input  logic [31:0] data_data_i,
                      input  logic 	  data_ren,
                      input  logic [ 3:0] data_wen,
                      output logic 	  data_ack,
                      output logic [31:0] data_data_o,
                      
                      /* CPU INSTRCTION */
                      input  logic [31:0] inst_addr,
                      input  logic 	  inst_ren,
                      output logic 	  inst_ack,
                      output logic [31:0] inst_data_o,
                      
                      /* GPU SIGNALS */
                      output logic 	  to_gp0, to_gp1,
		      output logic 	  gpu_ren,
                      input  logic 	  gpu_rdy,
                      input  logic 	  gpu_fifo_full,
                      input  logic [31:0] gpu_stat, gpu_read,
                      output logic [31:0] gp0, gp1, 
                       
                      /* HW REGISTER CONNECTIONS */
                      input  logic 	  hblank, vblank,
                      input  logic 	  dotclock,

                      /* INTERRUPTS */
                      output logic [10:0] interrupts
                      );

   /* PARAMETERS - state declarations */ 
   localparam IDLE           = 8'h01;
   localparam DMA            = 8'h02;
   localparam READ_DATA_INIT = 8'h04;
   localparam READ_INST_INIT = 8'h08;
   localparam READ_DATA      = 8'h10;
   localparam READ_INST      = 8'h20;
   localparam WRITE_INIT     = 8'h40;
   localparam WRITE_DATA     = 8'h80;   
   
   /* INTERNAL LINES */
   // - memory module interconnects 
   wire        rst_controller_out;
   wire        altpll_0_c0_clk;
   wire        pll_locked;
   
   wire [16:0] blk_addr;
   wire [31:0] blk_data;
   
   wire [31:0] sd_data_o, sd_data_i;
   wire [24:0] sd_addr;
   wire        sd_wen, sd_ren, sd_valid, sd_waitrequest;
   
   wire [31:0] sc_data_o, sc_data_i;
   wire [7:0]  sc_addr;
   wire        sc_wen;

   wire [31:0] hw_data_o, hw_data_i;
   wire        hw_ack;
   wire [31:0] hw_addr;
   wire        hw_wen, hw_ren;

   // - DMA lines
   wire [95:0] DMA0_CTRL, DMA1_CTRL, DMA2_CTRL, DMA3_CTRL;
   wire [95:0] DMA4_CTRL, DMA5_CTRL, DMA6_CTRL;
   wire        dma_to_gp0, cpu_to_gp0;
   wire [31:0] dma_gp0, cpu_gp0;
   wire        dma_gpu_ren, cpu_gpu_ren;
   wire [ 6:0] DMA_MADR_incr, DMA_MADR_decr, DMA_MADR_new, DMA_BCR_decr;
   wire [31:0] DMA_DPCR;
   wire [31:0] DMA0_MADR, DMA1_MADR, DMA2_MADR, DMA3_MADR,
	       DMA4_MADR, DMA5_MADR, DMA6_MADR;
   wire [ 6:0] DMA_IRQ;
   
   wire [31:0] dma_addr, interp_addr;
   wire [31:0] data_to_mem, interp_data_i;
   wire        dma_ren, interp_ren;
   wire        dma_wen, interp_wen;
   wire        dma_done;
   wire        dma_req;
   
   // - operations flags
   wire        data_active, inst_active;
   wire [ 3:0] data_ben;
   wire        data_wen_or;

   reg 	       service_DMA;
   
   // - state variables 
   reg [7:0]   curr_state, next_state;
   reg [31:0]  curr_addr, next_addr;
   reg [31:0]  curr_data_i, next_data_i;
   reg         curr_ren, next_ren;
   reg         curr_wen, next_wen;
   reg         curr_d_ack, next_d_ack;
   reg         curr_i_ack, next_i_ack;
   reg 	       curr_dma_skip, next_dma_skip;
   
   // - output registers 
   reg [31:0]  data_o;
   reg [31:0]  data_latch, inst_latch;
   reg         ack_o;

   /* GPU reg outputs */
   assign to_gp0  = service_DMA ? dma_to_gp0  : cpu_to_gp0;
   assign gp0     = service_DMA ? dma_gp0     : cpu_gp0;
   assign gpu_ren = service_DMA ? dma_gpu_ren : cpu_gpu_ren;

   assign interp_addr   = service_DMA ? dma_addr : curr_addr;
   assign interp_ren    = service_DMA ? dma_ren  : curr_ren;
   assign interp_wen    = service_DMA ? dma_wen  : curr_wen;
   assign interp_data_i = service_DMA ? data_to_mem : curr_data_i;
   
   assign data_active = data_ren | data_wen_or;
   assign inst_active = inst_ren;
   assign data_ben = service_DMA ? 4'b1111 : data_wen;
   assign data_wen_or = data_wen[0] | data_wen[1] | data_wen[2] | data_wen[3];
   
   assign data_ack = curr_d_ack;
   assign inst_ack = curr_i_ack;
   assign data_data_o = data_latch;
   assign inst_data_o = inst_latch;

   assign dram_clk = altpll_0_c0_clk;
   
   assign mem_controller_state = curr_state;
   
   /* BLOCKRAM CONTROLLER */
   blockram BIOS
     (.clk     (clk),
      .address (blk_addr),
      .data    (blk_data));
   
   /* SCRATCHPAD BLOCKRAM CONTROLLER */
   blockram_1k SCPAD
     (.clock   (clk),
      .address (sc_addr),
      .data    (sc_data_i),
      .wren    (sc_wen),
      .byteena (data_ben),
      .q       (sc_data_o));
   
   /* HW REGISTER CONTROLLER */
   io_controller io
     (.clk           (clk),
      .rst           (rst),
      .addr          (hw_addr),
      .data_i        (hw_data_i),
      .wen           (hw_wen),
      .ren           (hw_ren),
      .ben           (data_ben),
      .ack           (hw_ack),
      .data_o        (hw_data_o),
      /* GPU SIGNALS */
      .to_gp0        (cpu_to_gp0),
      .to_gp1        (to_gp1),
      .gp0           (cpu_gp0),
      .gp1           (gp1),
      .gpu_ren       (cpu_gpu_ren),
      .gpu_rdy       (gpu_rdy),
      .gpu_fifo_full (gpu_fifo_full),
      .gpu_stat      (gpu_stat),
      .gpu_read      (gpu_read),
      /* DMA SIGNALS */
      .DMA_DPCR_o    (DMA_DPCR),
      .DMA0_CTRL     (DMA0_CTRL),
      .DMA1_CTRL     (DMA1_CTRL),
      .DMA2_CTRL     (DMA2_CTRL),
      .DMA3_CTRL     (DMA3_CTRL),
      .DMA4_CTRL     (DMA4_CTRL),
      .DMA5_CTRL     (DMA5_CTRL),
      .DMA6_CTRL     (DMA6_CTRL),
      .DMA_MADR_incr (DMA_MADR_incr),
      .DMA_MADR_decr (DMA_MADR_decr),
      .DMA_MADR_new  (DMA_MADR_new),
      .DMA_BCR_decr  (DMA_BCR_decr),
      .DMA0_MADR     (DMA0_MADR),
      .DMA1_MADR     (DMA1_MADR),
      .DMA2_MADR     (DMA2_MADR),
      .DMA3_MADR     (DMA3_MADR),
      .DMA4_MADR     (DMA4_MADR),
      .DMA5_MADR     (DMA5_MADR),
      .DMA6_MADR     (DMA6_MADR),
      .DMA_IRQ       (DMA_IRQ),
      /* TIMER SIGNALS */
      .hblank        (hblank),
      .vblank        (vblank),
      .dotclock      (dotclock),
      .interrupts    (interrupts));

   /* DMA CONTROLLER */
   dma_controller dma_c
     (.sys_clk       (clk),
      .rst           (rst),
      .DMA0_CTRL     (DMA0_CTRL),
      .DMA1_CTRL     (DMA1_CTRL),
      .DMA2_CTRL     (DMA2_CTRL),
      .DMA3_CTRL     (DMA3_CTRL),
      .DMA4_CTRL     (DMA4_CTRL),
      .DMA5_CTRL     (DMA5_CTRL),
      .DMA6_CTRL     (DMA6_CTRL),
      .DMA_DPCR      (DMA_DPCR),
      .DMA_MADR_incr (DMA_MADR_incr),
      .DMA_MADR_decr (DMA_MADR_decr),
      .DMA_MADR_new  (DMA_MADR_new),
      .DMA_BCR_decr  (DMA_BCR_decr),
      .DMA0_MADR     (DMA0_MADR),
      .DMA1_MADR     (DMA1_MADR),
      .DMA2_MADR     (DMA2_MADR),
      .DMA3_MADR     (DMA3_MADR),
      .DMA4_MADR     (DMA4_MADR),
      .DMA5_MADR     (DMA5_MADR),
      .DMA6_MADR     (DMA6_MADR),
      .DMA_IRQ       (DMA_IRQ),
      /* memory read-write signals */
      .dma_en        (service_DMA),
      .dma_addr      (dma_addr),
      .data_to_mem   (data_to_mem),
      .data_to_dma   (data_o),
      .dma_ack       (ack_o),
      .dma_ren       (dma_ren),
      .dma_wen       (dma_wen),
      .dma_done      (dma_done),
      .dma_req       (dma_req),
      /* MDECin */
      .dma0_i        (34'b0),
      .dma0_o        (34'b0),
      /* MDECout */
      .dma1_i        (34'b0),
      .dma1_o        (34'b0),
      /* GPU */
      .dma2_i        ({gpu_rdy, gpu_fifo_full, gpu_read}),
      .dma2_o        ({dma_to_gp0, dma_gpu_ren, dma_gp0}),
      /* CDROM */
      .dma3_i        (34'b0),
      .dma3_o        (34'b0),
      /* SPU */
      .dma4_i        (34'b0),
      .dma4_o        (34'b0),
      /* PIO */
      .dma5_i        (34'b0),
      .dma5_o        (34'b0),
      /* OTC */
      .dma6_i        (34'b0),
      .dma6_o        (34'b0));
   
     
   /* SDRAM CONTROLLER */
   qsys_sdram_a2_sdram_0 sdram
     (.clk            (clk),
      .reset_n        (~rst),
      /* sdram controller lines */
      .az_addr        (sd_addr),
      .az_be_n        (~data_ben),
      .az_cs          (1'b1),
      .az_data        (sd_data_i),
      .az_rd_n        (~sd_ren),
      .az_wr_n        (~sd_wen),
      .za_data        (sd_data_o),
      .za_valid       (sd_valid),
      .za_waitrequest (sd_waitrequest),
      /* sdram chip interface */
      .zs_addr        (dram_addr),
      .zs_ba          (dram_bank),
      .zs_cas_n       (dram_cas_n),
      .zs_cke         (dram_cke),
      .zs_cs_n        (dram_cs_n),
      .zs_dqm         (dram_dqm),
      .zs_ras_n       (dram_ras_n),
      .zs_we_n        (dram_we_n),
      /* bidirectional dq lines */
      .sd_dq_out      (dram_dq_out),
      .sd_dq_in       (dram_dq_in),
      .sd_oe_out      (dram_oe_out));

   assign pll_locked = 1'b1;
   /* SDRAM PLL & ASYNC RESET CONTROLLER *//*
   qsys_sdram_a2_altpll_0 altpll
     (.clk       (clk),
      .reset     (rst_controller_out),
      .read      (),
      .write     (),
      .address   (),
      .readdata  (),
      .writedata (),
      .c0        (altpll_0_c0_clk),
      .areset    (),
      .locked    (pll_locked),
      .phasedone ());
   altera_reset_controller
     #(.NUM_RESET_INPUTS        (1),
       .OUTPUT_RESET_SYNC_EDGES ("deassert"),
       .SYNC_DEPTH              (2)
       )
   rst_controller
     (.reset_in0  (rst),                 // reset_in0.reset
      .clk        (altpll_0_c0_clk),     //       clk.clk
      .reset_out  (rst_controller_out),  // reset_out.reset
      .reset_in1  (1'b0),                // (terminated)
      .reset_in2  (1'b0),                // (terminated)
      .reset_in3  (1'b0),                // (terminated)
      .reset_in4  (1'b0),                // (terminated)
      .reset_in5  (1'b0),                // (terminated)
      .reset_in6  (1'b0),                // (terminated)
      .reset_in7  (1'b0),                // (terminated)
      .reset_in8  (1'b0),                // (terminated)
      .reset_in9  (1'b0),                // (terminated)
      .reset_in10 (1'b0),                // (terminated)
      .reset_in11 (1'b0),                // (terminated)
      .reset_in12 (1'b0),                // (terminated)
      .reset_in13 (1'b0),                // (terminated)
      .reset_in14 (1'b0),                // (terminated)
      .reset_in15 (1'b0)                 // (terminated)
      );*/

   
   /* PSX MEMORY CONTROLLERS */
   addr_interpreter addr_interp
     (.clk            (clk),
      .rst            (rst),
      .addr           (interp_addr),
      .data_i         (interp_data_i),
      .ren            (interp_ren),
      .wen            (interp_wen),
      .ack            (ack_o),
      .data_o         (data_o),
      /* BIOS (BLOCK RAM) */
      .blk_addr       (blk_addr),
      .blk_data       (blk_data),
      /* SDRAM */
      .sd_data_o      (sd_data_o),
      .sd_valid       (sd_valid),
      .sd_waitrequest (sd_waitrequest),
      .sd_addr        (sd_addr),
      .sd_data_i      (sd_data_i),
      .sd_wen         (sd_wen),
      .sd_ren         (sd_ren),
      /* Scratch Pad (BLOCK RAM) */
      .sc_data_o      (sc_data_o),
      .sc_addr        (sc_addr),
      .sc_data_i      (sc_data_i),
      .sc_wen         (sc_wen),
      /* Hardware Registers */
      .hw_data_o      (hw_data_o),
      .hw_ack         (hw_ack),
      .hw_data_i      (hw_data_i),
      .hw_addr        (hw_addr),
      .hw_wen         (hw_wen),
      .hw_ren         (hw_ren),
      .*);
   
   /* latch the data to the right channel */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         data_latch <= 32'd0;
         inst_latch <= 32'd0;
      end
      else begin
         if (curr_state == READ_DATA) begin
            data_latch <= data_o;
         end
         else if (curr_state == READ_INST) begin
            inst_latch <= data_o;
         end
      end
   end                                            
   
   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         curr_state    = IDLE;
         curr_addr     = 32'd0;
         curr_data_i   = 32'd0;
         curr_wen      = 1'b0;
         curr_ren      = 1'b0;
         curr_d_ack    = 1'b0;
         curr_i_ack    = 1'b0;
	 curr_dma_skip = 1'b0;
      end
      else begin
         curr_state    = next_state;
         curr_addr     = next_addr;
         curr_data_i   = next_data_i;
         curr_wen      = next_wen;
         curr_ren      = next_ren;
         curr_d_ack    = next_d_ack;
         curr_i_ack    = next_i_ack;
	 curr_dma_skip = next_dma_skip;
      end
   end
   
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state    = curr_state;
      next_addr     = curr_addr;
      next_data_i   = curr_data_i;
      next_wen      = curr_wen;
      next_ren      = curr_ren;
      next_d_ack    = curr_d_ack;
      next_i_ack    = curr_i_ack;
      next_dma_skip = curr_dma_skip;

      service_DMA = 1'b0;
      
      case (curr_state)
        /* wait for memory request */
        IDLE: begin
           /* memory access from data bus */
	   if (pll_locked) begin
	      if (dma_req && ~curr_dma_skip) begin
		 next_dma_skip = 1'b1;
		 service_DMA = 1'b1;
		 next_state = DMA;
	      end	      
	      else if (data_active) begin
		 if (data_ren) begin
                    next_state = READ_DATA_INIT;
                    next_addr = data_addr;
                    next_ren = data_ren;
                    next_wen = 1'b0;
		 end
		 else if (data_wen_or) begin
                    next_state = WRITE_INIT;
                    next_addr = data_addr;
                    next_data_i = data_data_i;
                    next_wen = data_wen_or;
                    next_ren = data_ren;
		 end
		 else begin
                    next_state = IDLE;
		 end
              end
              /* memory access from instruction bus */
              else if (inst_active) begin
		 if (inst_ren) begin
                    next_state = READ_INST_INIT;
                    next_addr = inst_addr;
                    next_ren = inst_ren;
                    next_wen = 1'b0;
		 end
		 else begin
                    next_state = IDLE;
		 end
              end
	      else if (dma_req && curr_dma_skip) begin
		 next_dma_skip = 1'b0;
		 next_state = IDLE;
	      end
	   end
           /* --- */
           else begin
              next_state = IDLE;
           end
        end // case: IDLE

	/* transfer control to DMA */
	DMA: begin
	   service_DMA = 1'b1;
	   if (dma_done) begin
	      next_state = IDLE;
	   end
	   else begin
	      next_state = DMA;
	   end
	end
        
        /* read states */
        READ_DATA_INIT: begin
           if (ack_o) begin
              next_state = READ_DATA;
              //next_d_ack = ack_o;
           end
           else begin
              next_state = READ_DATA_INIT;
           end
        end
        READ_INST_INIT: begin
           if (ack_o) begin
              next_state = READ_INST;
              //next_i_ack = ack_o;
           end 
           else begin
              next_state = READ_INST_INIT;
           end
        end 
        READ_DATA: begin
           next_ren = data_ren;
           next_wen = data_wen_or;
	   next_d_ack = ack_o;
           if (~data_active && ~ack_o) begin
              next_state = IDLE;
	      if (curr_dma_skip) begin
		 next_dma_skip = 1'b0;
	      end
           end
           else begin
              next_state = READ_DATA;
           end
        end
        READ_INST: begin
           next_ren = inst_ren;
           next_wen = 1'b0;
           next_i_ack = ack_o;
           if (~inst_active && ~ack_o) begin
              next_state = IDLE;
	      if (curr_dma_skip) begin
		 next_dma_skip = 1'b0;
	      end
           end
           else begin
              next_state = READ_INST;
           end
        end
        
        /* write states */
        WRITE_INIT: begin
           if (ack_o && data_active) begin
              next_state = WRITE_DATA;
           end
           else begin
              next_state = WRITE_INIT;
           end
        end
        WRITE_DATA: begin
           next_wen = data_wen_or;
           next_ren = data_ren;
           next_d_ack = ack_o;
           if (~data_active && ~ack_o) begin
              next_state = IDLE;
              next_d_ack = ack_o;
	      if (curr_dma_skip) begin
		 next_dma_skip = 1'b0;
	      end
           end
           else begin
              next_state = WRITE_DATA;
           end
        end
        
        /* default case */
        default: begin
        end
        
      endcase // case (curr_state)
   end
   
endmodule // mem_controller
