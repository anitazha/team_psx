/* 18545 Fall 2013
 * Team PSX
 * 11-25-2013
 *
 * @MODULES:
 * dma_channel
 * dma_controller
 * dma_interrupts
 * 
 * @DESCRIPTION:
 * Contains modules for a configurable DMA controller that can work with all 
 * of the DMA channel modes in the PSX and handle DMA specicfic interrupts for
 * the system. 
 *
 * @AUTHOR:
 * Arnob Mallick
 * amallick
 *
 */



/* @MODULE: dma_channel
 * @DESCRIPTION:
 * Configurable module for a single DMA channel.
 */
module dma_channel(input  logic        sys_clk, rst,
		   input  logic        dma_start,
		   output logic        dma_done,
		   output logic        dma_req,
		   output logic        dma_irq,
		   
		   /* dma registers */
		   input  logic [31:0] dma_madr,
		   input  logic [31:0] dma_bcr,
		   input  logic [31:0] dma_chcr,
		   output logic        madr_incr,
		   output logic        madr_decr,
		   output logic        madr_new,
		   output logic [31:0] madr_addr,
		   output logic        bcr_decr,
		   output logic [ 1:0] chcr_clr,
		   
		   /* dma channel signals */
		   input  logic        chan_rdy,
		   input  logic        chan_fifo_full,
		   input  logic [31:0] chan_data_in,
		   output logic [31:0] chan_data_out, 
		   output logic        chan_ren,
		   output logic        chan_wen,
		   
		   /* memory signals */
		   input  logic [31:0] data_to_dma,
		   input  logic        dma_ack,
		   output logic        dma_ren,
		   output logic        dma_wen,
		   output logic [31:0] dma_addr,
		   output logic [31:0] data_to_mem);

   /* Parameters */
   // - operating modes 
   localparam SYNC_MODE0 = 2'b00;
   localparam SYNC_MODE1 = 2'b01;
   localparam SYNC_MODE2 = 2'b10;
   // - states
   localparam SLEEP      = 12'b0000_0000_0000;
   localparam IDLE       = 12'b0000_0000_0001;
   localparam START      = 12'b0000_0000_0010;
   localparam MODE0_INIT = 12'b0000_0000_0100;
   localparam MODE1_INIT = 12'b0000_0000_1000;
   localparam MODE2_INIT = 12'b0000_0001_0000;
   localparam MODE2_MADR = 12'b0000_0010_0000;
   localparam READ_ACK   = 12'b0000_0100_0000;
   localparam WRITE_PREP = 12'b0000_1000_0000;
   localparam WRITE_ACK  = 12'b0001_0000_0000;
   localparam WRITE_DONE = 12'b0010_0000_0000;
   localparam CHANNEL_RE = 12'b0100_0000_0000;
   localparam CHANNEL_WR = 12'b1000_0000_0000;
   // - constants
   localparam END_CODE = 32'h00FFFFFF;
   
   /* Internal Lines */
   reg [11:0]  curr_state, next_state;
   reg 	       curr_wen, next_wen;
   reg 	       curr_ren, next_ren;
   reg [31:0]  curr_data, next_data;
   reg [31:0]  curr_addr, next_addr;

   reg [31:0]  curr_mode0_addr, next_mode0_addr;
   reg [31:0]  curr_mode2_pntr, next_mode2_pntr;
   reg [15:0]  curr_mode0_cnt, next_mode0_cnt;
   reg [ 7:0]  curr_mode2_cnt, next_mode2_cnt;
   
   reg 	       tip, next_tip;
   reg 	       first_tx, next_first_tx;
   
   reg 	       dma_done_o;
   reg 	       dma_irq_o;
   
   reg [31:0]  madr_addr_o;
   reg 	       madr_incr_o;
   reg 	       madr_decr_o;
   reg 	       madr_new_o;
   reg 	       bcr_decr_o;
   reg [ 1:0]  chcr_clr_o;

   reg [31:0]  chan_data_o;
   reg 	       chan_ren_o;
   reg 	       chan_wen_o;
   reg [31:0]  chan_data_latch;
   
   wire [ 1:0] sync_mode;
   wire [15:0] blk_size;
   wire [15:0] num_blocks;
   wire        tx_direction;
   wire        mem_direction;
   
   wire        req_o;

   assign dma_irq = dma_irq_o;
   
   assign sync_mode = dma_chcr[10:9];
   assign blk_size = dma_bcr[15:0];
   assign num_blocks = dma_bcr[31:16];
   assign tx_direction = dma_chcr[0];
   assign mem_direction = dma_chcr[1];
   
   assign req_o = ((sync_mode == SYNC_MODE0) & dma_chcr[24] & dma_chcr[28]) |
		  ((sync_mode == SYNC_MODE1) & dma_chcr[24]) |
		  ((sync_mode == SYNC_MODE2) & dma_chcr[24]);
   assign dma_req = tip;

   assign data_to_mem = curr_data;
   assign dma_ren = curr_ren;
   assign dma_wen = curr_wen;
   assign dma_addr = curr_addr;
   assign dma_done = dma_done_o;

   assign madr_addr = madr_addr_o;
   assign madr_incr = madr_incr_o;
   assign madr_decr = madr_decr_o;
   assign madr_new = madr_new_o;
   assign bcr_decr = bcr_decr_o;
   assign chcr_clr = chcr_clr_o;
   
   assign chan_data_out = chan_data_o;
   assign chan_ren = chan_ren_o;
   assign chan_wen = chan_wen_o;
   
   /* latch data from channel */
   always_ff @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 chan_data_latch = 32'b0;
      end
      else begin
	 if (curr_state == CHANNEL_RE && chan_rdy) begin
	    chan_data_latch = chan_data_in;
	 end
      end
   end
   
   /* FSM next state logic */
   always_ff @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 curr_state = IDLE;
	 curr_wen = 1'b0;
	 curr_ren = 1'b0;
	 curr_data = 32'b0;
	 curr_addr = 32'b0;
	 
	 tip = 1'b0;
	 first_tx = 1'b0;

	 curr_mode0_addr = 32'b0;
	 curr_mode2_pntr = 32'b0;
	 curr_mode0_cnt = 16'b0;
	 curr_mode2_cnt = 8'b0;
      end
      else begin
	 curr_state = next_state;
	 curr_wen   = next_wen;
	 curr_ren   = next_ren;
	 curr_data  = next_data;
	 curr_addr  = next_addr;
	 
	 tip = next_tip;
	 first_tx = next_first_tx;
	 
	 curr_mode0_addr = next_mode0_addr;
	 curr_mode2_pntr = next_mode2_pntr;
	 curr_mode0_cnt = next_mode0_cnt;
	 curr_mode2_cnt = next_mode2_cnt;
      end
   end

   /* FSM */
   always_comb begin
      /* Defaults */
      next_state = curr_state;
      next_wen   = curr_wen;
      next_ren   = curr_ren;
      next_data  = curr_data;
      next_addr  = curr_addr;
      
      next_tip = tip;
      next_first_tx = first_tx;
      
      next_mode0_addr = curr_mode0_addr;
      next_mode2_pntr = curr_mode2_pntr;
      next_mode0_cnt = curr_mode0_cnt;
      next_mode2_cnt = curr_mode2_cnt;
      
      dma_done_o  = 1'b0;
      dma_irq_o   = 1'b0;
      
      madr_incr_o = 1'b0;
      madr_decr_o = 1'b0;
      madr_new_o  = 1'b0;
      bcr_decr_o  = 1'b0;
      madr_addr_o = 32'b0;
      chcr_clr_o  = 2'b00;

      chan_data_o = 32'b0;
      chan_ren_o = 1'b0;
      chan_wen_o = 1'b0;

      case (curr_state)
	/* sleep */
	SLEEP: begin
	   dma_irq_o = 1'b1;
	   next_state = IDLE;
	end	
	/* wait for permission to start */
	IDLE: begin
	   if (tip) begin
	      if (dma_start) begin
		 next_state = START;
	      end
	   end
	   else begin
	      if (((sync_mode == SYNC_MODE0) & dma_chcr[24] & dma_chcr[28]) |
		  ((sync_mode == SYNC_MODE1) & dma_chcr[24]) |
		  ((sync_mode == SYNC_MODE2) & dma_chcr[24])) begin
		 chcr_clr_o[1] = 1'b1;
		 next_tip = 1'b1;
		 next_first_tx = 1'b1;
		 next_state = IDLE;
	      end
	      else begin
		 next_state = IDLE;
	      end
	   end
	end

	/* branch to different states for different modes */
	START: begin
	   case (sync_mode)
	     /* MODE 0 - for OTC and CDROM */
	     SYNC_MODE0: begin
		/* don't do anything if transfer already completed */
		if (curr_mode0_cnt == 16'b1 && curr_data == 32'h00FFFFFF) begin
		   next_state = SLEEP;
		   dma_done_o = 1'b1;
		   next_tip = 1'b0;
		   chcr_clr_o[0] = 1'b1;
		   dma_irq_o = 1'b1;
		end
		else begin
		   /* check to see if a transfer is already in progress */
		   if (first_tx) begin
		      next_first_tx = 1'b0;
		      next_mode0_addr = dma_madr;
		      next_mode0_cnt = blk_size;
		      next_state = MODE0_INIT;
		   end
		   else begin
		      /* advance to next address and decrement counter */
		      if (mem_direction) begin
			 next_mode0_addr = curr_mode0_addr - 32'h4;
			 next_mode0_cnt = curr_mode0_cnt - 16'b1;
			 next_state = MODE0_INIT;
		      end
		      else begin
			 next_mode0_addr = curr_mode0_addr + 32'h4;
			 next_mode0_cnt = curr_mode0_cnt - 16'b1;
			 next_state = MODE0_INIT;
		      end
		   end
		end
	     end
	     /* MODE 1 - for MDEC, SPU, and CDROM */
	     SYNC_MODE1: begin
		/* don't do anything if transfer already completed */
		if (dma_bcr[31:16] == 16'b0) begin
		   next_state = SLEEP;
		   dma_done_o = 1'b1;
		   next_tip = 1'b0;
		   chcr_clr_o[0] = 1'b1;
		   dma_irq_o = 1'b1;
		end
		else begin
		   if (tx_direction) begin
		      next_wen = 1'b0;
		      next_ren = 1'b1;
		      next_state = READ_ACK;
		   end
		   else begin
		      next_state = CHANNEL_RE;
		   end
		end
	     end
	     /* MODE 2 - for GPU commands */ 
	     SYNC_MODE2: begin
		/* don't do anything if transfer already completed */
		if (dma_madr == END_CODE) begin
		   next_state = SLEEP;
		   dma_done_o = 1'b1;
		   next_tip = 1'b0;
		   chcr_clr_o[0] = 1'b1;
		   dma_irq_o = 1'b1;
		end
		else begin
		   next_addr = dma_madr;
		   /* from CPU */
		   if (tx_direction) begin
		      next_wen = 1'b0;
		      next_ren = 1'b1;
		      next_state = READ_ACK;
		   end
		   /* to CPU - (should never be here) */
		   else begin
		      next_state = SYNC_MODE2;
		   end
		end
	     end
	   endcase
	end

	/* SYNC MODE 0 */
	MODE0_INIT: begin
	   /* if the transfer is complete write the end-code */
	   if (curr_mode0_cnt == 16'b1) begin
	      next_data = END_CODE;
	      next_addr = curr_mode0_addr;
	      next_wen = 1'b1;
	      next_ren = 1'b0;
	      next_state = WRITE_ACK;
	   end
	   /* otherwise prepare the next write */
	   else begin
	      if (mem_direction) begin
		 next_data = curr_mode0_addr - 32'h4;
		 next_addr = curr_mode0_addr;
		 next_wen = 1'b1;
		 next_ren = 1'b0;
		 next_state = WRITE_ACK;
	      end
	      else begin
		 next_data = curr_mode0_addr + 32'h4;
		 next_addr = curr_mode0_addr;
		 next_wen = 1'b1;
		 next_ren = 1'b0;
		 next_state = WRITE_ACK;
	      end
	   end
	end

	/* SYNC MODE 1 */
	MODE1_INIT: begin
	   if (mem_direction) begin
	      madr_incr_o = 1'b1;
	      bcr_decr_o = 1'b1;
	      next_state = CHANNEL_WR;
	   end
	   else begin
	      madr_incr_o = 1'b1;
	      bcr_decr_o = 1'b1;
	      next_state = CHANNEL_WR;
	   end
	end

	/* SYNC MODE 2 */
	MODE2_INIT: begin
	   /* first word in packet */
	   if (curr_mode2_cnt == 8'h00) begin
	      next_mode2_pntr = {8'h00, data_to_dma[23:0]};
	      next_mode2_cnt = data_to_dma[31:24];
	      next_state = MODE2_MADR;
	   end
	   /* last word in packet */
	   else if (curr_mode2_cnt == 8'h01) begin
	      next_mode2_cnt = 8'h0;           // reset the count
	      madr_addr_o = curr_mode2_pntr;   // linked_list -> next
	      madr_new_o = 1'b1;
	      next_state = CHANNEL_WR;
	   end
	   /* intermediate data */
	   else begin
	      next_mode2_cnt = curr_mode2_cnt - 8'h01;
	      if (mem_direction) begin
		 madr_decr_o = 1'b1;
		 next_state = CHANNEL_WR;
	      end
	      else begin
		 madr_incr_o = 1'b1;
		 next_state = CHANNEL_WR;
	      end
	   end
	end
	MODE2_MADR: begin
	   /* this address contains a packet */
	   if (curr_mode2_cnt > 8'h00) begin
	      if (mem_direction) begin
		 madr_decr_o = 1'b1;
		 next_state = IDLE;
		 dma_done_o = 1'b1;
	      end
	      else begin
		 madr_incr_o = 1'b1;
		 next_state = IDLE;
		 dma_done_o = 1'b1;
	      end
	   end
	   /* this address is just an empty pointer */
	   else begin
	      madr_addr_o = data_to_dma;
	      madr_new_o = 1'b1;
	      next_state = IDLE;
	      dma_done_o = 1'b1;
	   end 
	end
	
	/* read from memory */
	READ_ACK: begin
	   if (dma_ack) begin
	      next_wen = 1'b0;
	      next_ren = 1'b0;
	      case (sync_mode)
		SYNC_MODE0: begin
		   /* (should never be here) */
		end
		SYNC_MODE1: begin
		   next_state = MODE1_INIT;
		end
		SYNC_MODE2: begin
		   next_state = MODE2_INIT;
		end
	      endcase // case (sync_mode)
	   end
	   else begin
	      next_state = READ_ACK;
	   end
	end
	
	/* write to memory */
	WRITE_PREP: begin
	   next_data = chan_data_latch;
	   next_addr = dma_madr;
	   next_wen = 1'b1;
	   next_ren = 1'b0;
	   next_state = WRITE_ACK;
	   if (mem_direction) begin
	      madr_incr_o = 1'b1;
	      bcr_decr_o = 1'b1;
	   end
	   else begin
	      madr_incr_o = 1'b1;
	      bcr_decr_o = 1'b1;
	   end
	end
	WRITE_ACK: begin
	   if (dma_ack) begin
	      next_wen = 1'b0;
	      next_ren = 1'b0;
	      next_state = WRITE_DONE;
	   end
	   else begin
	      next_state = WRITE_ACK;
	   end
	end
	WRITE_DONE: begin
	   if (~dma_ack) begin
	      next_state = IDLE;
	      dma_done_o = 1'b1;
	   end
	   else begin
	      next_state = WRITE_DONE;
	   end
	end

	/* read from DMA channel */
	CHANNEL_RE: begin
	   if (chan_rdy) begin
	      chan_ren_o = 1'b1;
	      next_state = WRITE_PREP;
	   end
	   else begin
	      next_state = CHANNEL_RE;
	   end
	end

	/* write to DMA channel */
	CHANNEL_WR: begin
	   if (~chan_fifo_full) begin
	      chan_data_o = data_to_dma;
	      chan_wen_o = 1'b1;
	      dma_done_o = 1'b1;
	      next_state = IDLE;
	   end
	   else begin
	      next_state = CHANNEL_WR;
	   end
	end
	
      endcase // case (curr_state)
   end

endmodule // dma_channel



/* @MODULE: dma_controller
 * @DESCRIPTION:
 * Whole DMA controller that includes all of the DMA channels. This modules
 * handles determining which channel has top priority and enables channels 
 * accordingly. 
 */
module dma_controller(input  logic sys_clk, rst,
		      input  logic [95:0] DMA0_CTRL,
		      input  logic [95:0] DMA1_CTRL,
		      input  logic [95:0] DMA2_CTRL,
		      input  logic [95:0] DMA3_CTRL,
		      input  logic [95:0] DMA4_CTRL,
		      input  logic [95:0] DMA5_CTRL,
		      input  logic [95:0] DMA6_CTRL,
		      input  logic [31:0] DMA_DPCR, 
		      output logic [ 6:0] DMA_MADR_incr,
		      output logic [ 6:0] DMA_MADR_decr,
		      output logic [ 6:0] DMA_MADR_new,
		      output logic [31:0] DMA0_MADR,
		      output logic [31:0] DMA1_MADR,
		      output logic [31:0] DMA2_MADR,
		      output logic [31:0] DMA3_MADR,
		      output logic [31:0] DMA4_MADR,
		      output logic [31:0] DMA5_MADR,
		      output logic [31:0] DMA6_MADR,
		      output logic [ 6:0] DMA_BCR_decr,
		      output logic [13:0] DMA_CHCR_clr,
		      output logic [ 6:0] DMA_IRQ,
		      
		      /* memory read-write signals */
		      input  logic 	  dma_en,
		      output logic [31:0] dma_addr,
		      output logic [31:0] data_to_mem,
		      input  logic [31:0] data_to_dma,
		      input  logic 	  dma_ack,
		      output logic 	  dma_ren,
		      output logic 	  dma_wen,
		      output logic 	  dma_done,
		      output logic 	  dma_req,

		      /* channel signals */
		      input  logic [33:0] dma0_i,
		      input  logic [33:0] dma1_i,
		      input  logic [33:0] dma2_i,
		      input  logic [33:0] dma3_i,
		      input  logic [33:0] dma4_i,
		      input  logic [33:0] dma5_i,
		      input  logic [33:0] dma6_i,
		      output logic [33:0] dma0_o,
		      output logic [33:0] dma1_o,
		      output logic [33:0] dma2_o,
		      output logic [33:0] dma3_o,
		      output logic [33:0] dma4_o,
		      output logic [33:0] dma5_o,
		      output logic [33:0] dma6_o
		      );

   /* States */
   localparam IDLE   = 3'b001;
   localparam ASSIGN = 3'b010;
   localparam WAIT   = 3'b100;
   
   /* Internal Lines */
   wire        dma0_req, dma1_req, dma2_req, dma3_req,
 	       dma4_req, dma5_req, dma6_req;
   wire        dma0_done, dma1_done, dma2_done, dma3_done,
	       dma4_done, dma5_done, dma6_done;
   wire [ 6:0] t_priority;
   wire        channel_ack;
   wire        dma0_ren, dma1_ren, dma2_ren, dma3_ren,
	       dma4_ren, dma5_ren, dma6_ren;
   wire        dma0_wen, dma1_wen, dma2_wen, dma3_wen,
	       dma4_wen, dma5_wen, dma6_wen;
   wire [31:0] dma0_to_mem, dma1_to_mem, dma2_to_mem, dma3_to_mem,
	       dma4_to_mem, dma5_to_mem, dma6_to_mem;
   wire [31:0] dma0_addr, dma1_addr, dma2_addr, dma3_addr,
	       dma4_addr, dma5_addr, dma6_addr;

   reg [2:0]   curr_state, next_state;
   
   reg 	       dma0_start, dma1_start, dma2_start, dma3_start,
	       dma4_start, dma5_start, dma6_start;
   reg 	       dma_done_o;
   reg [31:0]  data_to_mem_o;
   reg [31:0]  dma_addr_o;
   reg 	       dma_wen_o;
   reg 	       dma_ren_o;
   

   /* find out which dma channel has top priority */
   assign t_priority[0] = (((DMA_DPCR[ 2: 0] <= DMA_DPCR[ 6: 4])|~dma1_req) &
			   ((DMA_DPCR[ 2: 0] <= DMA_DPCR[10: 8])|~dma2_req) &
			   ((DMA_DPCR[ 2: 0] <= DMA_DPCR[14:12])|~dma3_req) &
			   ((DMA_DPCR[ 2: 0] <= DMA_DPCR[18:16])|~dma4_req) &
			   ((DMA_DPCR[ 2: 0] <= DMA_DPCR[22:20])|~dma5_req) &
			   ((DMA_DPCR[ 2: 0] <= DMA_DPCR[26:24])|~dma6_req) & 
			   DMA_DPCR[3] & dma0_req);
   assign t_priority[1] = (((DMA_DPCR[ 6: 4] <  DMA_DPCR[ 2: 0])|~dma0_req) &
			   ((DMA_DPCR[ 6: 4] <= DMA_DPCR[10: 8])|~dma2_req) &
			   ((DMA_DPCR[ 6: 4] <= DMA_DPCR[14:12])|~dma3_req) &
			   ((DMA_DPCR[ 6: 4] <= DMA_DPCR[18:16])|~dma4_req) &
			   ((DMA_DPCR[ 6: 4] <= DMA_DPCR[22:20])|~dma5_req) &
			   ((DMA_DPCR[ 6: 4] <= DMA_DPCR[26:24])|~dma6_req) & 
			   DMA_DPCR[7] & dma1_req);
   assign t_priority[2] = (((DMA_DPCR[10: 8] <  DMA_DPCR[ 2: 0])|~dma0_req) &
			   ((DMA_DPCR[10: 8] <  DMA_DPCR[ 6: 4])|~dma1_req) &
			   ((DMA_DPCR[10: 8] <= DMA_DPCR[14:12])|~dma3_req) &
			   ((DMA_DPCR[10: 8] <= DMA_DPCR[18:16])|~dma4_req) &
			   ((DMA_DPCR[10: 8] <= DMA_DPCR[22:20])|~dma5_req) &
			   ((DMA_DPCR[10: 8] <= DMA_DPCR[26:24])|~dma6_req) & 
			   DMA_DPCR[11] & dma2_req);
   assign t_priority[3] = (((DMA_DPCR[14:12] <  DMA_DPCR[ 2: 0])|~dma0_req) &
			   ((DMA_DPCR[14:12] <  DMA_DPCR[ 6: 4])|~dma1_req) &
			   ((DMA_DPCR[14:12] <  DMA_DPCR[10: 8])|~dma2_req) &
			   ((DMA_DPCR[14:12] <= DMA_DPCR[18:16])|~dma4_req) &
			   ((DMA_DPCR[14:12] <= DMA_DPCR[22:20])|~dma5_req) &
			   ((DMA_DPCR[14:12] <= DMA_DPCR[26:24])|~dma6_req) & 
			   DMA_DPCR[15] & dma3_req);
   assign t_priority[4] = (((DMA_DPCR[18:16] <  DMA_DPCR[ 2: 0])|~dma0_req) &
			   ((DMA_DPCR[18:16] <  DMA_DPCR[ 6: 4])|~dma1_req) &
			   ((DMA_DPCR[18:16] <  DMA_DPCR[10: 8])|~dma2_req) &
			   ((DMA_DPCR[18:16] <  DMA_DPCR[14:12])|~dma3_req) &
			   ((DMA_DPCR[18:16] <= DMA_DPCR[22:20])|~dma5_req) &
			   ((DMA_DPCR[18:16] <= DMA_DPCR[26:24])|~dma6_req) & 
			   DMA_DPCR[19] & dma4_req);
   assign t_priority[5] = (((DMA_DPCR[22:20] <  DMA_DPCR[ 2: 0])|~dma0_req) &
			   ((DMA_DPCR[22:20] <  DMA_DPCR[ 6: 4])|~dma1_req) &
			   ((DMA_DPCR[22:20] <  DMA_DPCR[10: 8])|~dma2_req) &
			   ((DMA_DPCR[22:20] <  DMA_DPCR[14:12])|~dma3_req) &
			   ((DMA_DPCR[22:20] <  DMA_DPCR[18:16])|~dma4_req) &
			   ((DMA_DPCR[22:20] <= DMA_DPCR[26:24])|~dma6_req) &
			   DMA_DPCR[23] & dma5_req);
   assign t_priority[6] = (((DMA_DPCR[26:24] <  DMA_DPCR[ 2: 0])|~dma0_req) &
			   ((DMA_DPCR[26:24] <  DMA_DPCR[ 6: 4])|~dma1_req) &
			   ((DMA_DPCR[26:24] <  DMA_DPCR[10: 8])|~dma2_req) &
			   ((DMA_DPCR[26:24] <  DMA_DPCR[14:12])|~dma3_req) &
			   ((DMA_DPCR[26:24] <  DMA_DPCR[18:16])|~dma4_req) &
			   ((DMA_DPCR[26:24] <  DMA_DPCR[22:20])|~dma5_req) & 
			   DMA_DPCR[27] & dma6_req);
   
   assign dma_req = dma0_req | dma1_req | dma2_req | dma3_req |
		    dma4_req | dma5_req | dma6_req;
   assign channel_ack = dma0_done | dma1_done | dma2_done | dma3_done |
			dma4_done | dma5_done | dma6_done;
   assign dma_done = dma_done_o;
   assign data_to_mem = data_to_mem_o;
   assign dma_addr = dma_addr_o;
   assign dma_wen = dma_wen_o;
   assign dma_ren = dma_ren_o;
   
   /* Forward dma channel to memory interface */
   always_ff @ (negedge sys_clk) begin
      case (t_priority)
	7'b0000001: begin
	   dma_ren_o = dma0_ren;
	   dma_wen_o = dma0_wen;
	   dma_addr_o = dma0_addr;
	   data_to_mem_o = dma0_to_mem;
	end
	7'b0000010: begin
	   dma_ren_o = dma1_ren;
	   dma_wen_o = dma1_wen;
	   dma_addr_o = dma1_addr;
	   data_to_mem_o = dma1_to_mem;
	end
	7'b0000100: begin
	   dma_ren_o = dma2_ren;
	   dma_wen_o = dma2_wen;
	   dma_addr_o = dma2_addr;
	   data_to_mem_o = dma2_to_mem;
	end
	7'b0001000: begin
	   dma_ren_o = dma3_ren;
	   dma_wen_o = dma3_wen;
	   dma_addr_o = dma3_addr;
	   data_to_mem_o = dma3_to_mem;
	end
	7'b0010000: begin
	   dma_ren_o = dma4_ren;
	   dma_wen_o = dma4_wen;
	   dma_addr_o = dma4_addr;
	   data_to_mem_o = dma4_to_mem;
	end
	7'b0100000: begin
	   dma_ren_o = dma5_ren;
	   dma_wen_o = dma5_wen;
	   dma_addr_o = dma5_addr;
	   data_to_mem_o = dma5_to_mem;
	end
	7'b1000000: begin
	   dma_ren_o = dma6_ren;
	   dma_wen_o = dma6_wen;
	   dma_addr_o = dma6_addr;
	   data_to_mem_o = dma6_to_mem;
	end
	default: begin
	   dma_ren_o = 1'b0;
	   dma_wen_o = 1'b0;
	   dma_addr_o = 32'b0;
	   data_to_mem_o = 32'b0;
	end
      endcase
   end
   
   /* Individual DMA channel modules */
   dma_channel dma0
     (.sys_clk        (sys_clk),
      .rst            (rst),
      .dma_start      (dma0_start),
      .dma_done       (dma0_done),
      .dma_req        (dma0_req),
      .dma_irq        (DMA_IRQ[0]),
      .dma_madr       (DMA0_CTRL[31: 0]),
      .dma_bcr        (DMA0_CTRL[63:32]),
      .dma_chcr       (DMA0_CTRL[95:64]),
      .madr_incr      (DMA_MADR_incr[0]),
      .madr_decr      (DMA_MADR_decr[0]),
      .madr_addr      (DMA0_MADR),
      .madr_new       (DMA_MADR_new[0]),
      .bcr_decr       (DMA_BCR_decr[0]),
      .chcr_clr       (DMA_CHCR_clr[1:0]),
      .chan_rdy       (dma0_i[33]),
      .chan_fifo_full (dma0_i[32]),
      .chan_data_in   (dma0_i[31:0]),
      .chan_data_out  (dma0_o[31:0]),
      .chan_ren       (dma0_o[32]),
      .chan_wen       (dma0_o[33]),
      .data_to_dma    (data_to_dma),
      .dma_ack        (dma_ack),
      .dma_ren        (dma0_ren),
      .dma_wen        (dma0_wen),
      .dma_addr       (dma0_addr),
      .data_to_mem    (dma0_to_mem));   
   dma_channel dma1
     (.sys_clk        (sys_clk),
      .rst            (rst),
      .dma_start      (dma1_start),
      .dma_done       (dma1_done),
      .dma_req        (dma1_req),
      .dma_irq        (DMA_IRQ[1]),
      .dma_madr       (DMA1_CTRL[31: 0]),
      .dma_bcr        (DMA1_CTRL[63:32]),
      .dma_chcr       (DMA1_CTRL[95:64]),
      .madr_incr      (DMA_MADR_incr[1]),
      .madr_decr      (DMA_MADR_decr[1]),
      .madr_addr      (DMA1_MADR),
      .madr_new       (DMA_MADR_new[1]),
      .bcr_decr       (DMA_BCR_decr[1]),
      .chcr_clr       (DMA_CHCR_clr[3:2]),
      .chan_rdy       (dma1_i[33]),
      .chan_fifo_full (dma1_i[32]),
      .chan_data_in   (dma1_i[31:0]),
      .chan_data_out  (dma1_o[31:0]),
      .chan_ren       (dma1_o[32]),
      .chan_wen       (dma1_o[33]),
      .data_to_dma    (data_to_dma),
      .dma_ack        (dma_ack),
      .dma_ren        (dma1_ren),
      .dma_wen        (dma1_wen),
      .dma_addr       (dma1_addr),
      .data_to_mem    (dma1_to_mem));
   dma_channel dma2
     (.sys_clk        (sys_clk),
      .rst            (rst),
      .dma_start      (dma2_start),
      .dma_done       (dma2_done),
      .dma_req        (dma2_req),
      .dma_irq        (DMA_IRQ[2]),
      .dma_madr       (DMA2_CTRL[31: 0]),
      .dma_bcr        (DMA2_CTRL[63:32]),
      .dma_chcr       (DMA2_CTRL[95:64]),
      .madr_incr      (DMA_MADR_incr[2]),
      .madr_decr      (DMA_MADR_decr[2]),
      .madr_addr      (DMA2_MADR),
      .madr_new       (DMA_MADR_new[2]),
      .bcr_decr       (DMA_BCR_decr[2]),
      .chcr_clr       (DMA_CHCR_clr[5:4]),
      .chan_rdy       (dma2_i[33]),
      .chan_fifo_full (dma2_i[32]),
      .chan_data_in   (dma2_i[31:0]),
      .chan_data_out  (dma2_o[31:0]),
      .chan_ren       (dma2_o[32]),
      .chan_wen       (dma2_o[33]),
      .data_to_dma    (data_to_dma),
      .dma_ack        (dma_ack),
      .dma_ren        (dma2_ren),
      .dma_wen        (dma2_wen),
      .dma_addr       (dma2_addr),
      .data_to_mem    (dma2_to_mem));
   dma_channel dma3
     (.sys_clk        (sys_clk),
      .rst            (rst),
      .dma_start      (dma3_start),
      .dma_done       (dma3_done),
      .dma_req        (dma3_req),
      .dma_irq        (DMA_IRQ[3]),
      .dma_madr       (DMA3_CTRL[31: 0]),
      .dma_bcr        (DMA3_CTRL[63:32]),
      .dma_chcr       (DMA3_CTRL[95:64]),
      .madr_incr      (DMA_MADR_incr[3]),
      .madr_decr      (DMA_MADR_decr[3]),
      .madr_addr      (DMA3_MADR),
      .madr_new       (DMA_MADR_new[3]),
      .bcr_decr       (DMA_BCR_decr[3]),
      .chcr_clr       (DMA_CHCR_clr[7:6]),
      .chan_rdy       (dma3_i[33]),
      .chan_fifo_full (dma3_i[32]),
      .chan_data_in   (dma3_i[31:0]),
      .chan_data_out  (dma3_o[31:0]),
      .chan_ren       (dma3_o[32]),
      .chan_wen       (dma3_o[33]),
      .data_to_dma    (data_to_dma),
      .dma_ack        (dma_ack),
      .dma_ren        (dma3_ren),
      .dma_wen        (dma3_wen),
      .dma_addr       (dma3_addr),
      .data_to_mem    (dma3_to_mem));
   dma_channel dma4
     (.sys_clk        (sys_clk),
      .rst            (rst),
      .dma_start      (dma4_start),
      .dma_done       (dma4_done),
      .dma_req        (dma4_req),
      .dma_irq        (DMA_IRQ[4]),
      .dma_madr       (DMA4_CTRL[31: 0]),
      .dma_bcr        (DMA4_CTRL[63:32]),
      .dma_chcr       (DMA4_CTRL[95:64]),
      .madr_incr      (DMA_MADR_incr[4]),
      .madr_decr      (DMA_MADR_decr[4]),
      .madr_addr      (DMA4_MADR),
      .madr_new       (DMA_MADR_new[4]),
      .bcr_decr       (DMA_BCR_decr[4]),
      .chcr_clr       (DMA_CHCR_clr[9:8]),
      .chan_rdy       (dma4_i[33]),
      .chan_fifo_full (dma4_i[32]),
      .chan_data_in   (dma4_i[31:0]),
      .chan_data_out  (dma4_o[31:0]),
      .chan_ren       (dma4_o[32]),
      .chan_wen       (dma4_o[33]),
      .data_to_dma    (data_to_dma),
      .dma_ack        (dma_ack),
      .dma_ren        (dma4_ren),
      .dma_wen        (dma4_wen),
      .dma_addr       (dma4_addr),
      .data_to_mem    (dma4_to_mem));
   dma_channel dma5
     (.sys_clk        (sys_clk),
      .rst            (rst),
      .dma_start      (dma5_start),
      .dma_done       (dma5_done),
      .dma_req        (dma5_req),
      .dma_irq        (DMA_IRQ[5]),
      .dma_madr       (DMA5_CTRL[31: 0]),
      .dma_bcr        (DMA5_CTRL[63:32]),
      .dma_chcr       (DMA5_CTRL[95:64]),
      .madr_incr      (DMA_MADR_incr[5]),
      .madr_decr      (DMA_MADR_decr[5]),
      .madr_addr      (DMA5_MADR),
      .madr_new       (DMA_MADR_new[5]),
      .bcr_decr       (DMA_BCR_decr[5]),
      .chcr_clr       (DMA_CHCR_clr[11:10]),
      .chan_rdy       (dma5_i[33]),
      .chan_fifo_full (dma5_i[32]),
      .chan_data_in   (dma5_i[31:0]),
      .chan_data_out  (dma5_o[31:0]),
      .chan_ren       (dma5_o[32]),
      .chan_wen       (dma5_o[33]),
      .data_to_dma    (data_to_dma),
      .dma_ack        (dma_ack),
      .dma_ren        (dma5_ren),
      .dma_wen        (dma5_wen),
      .dma_addr       (dma5_addr),
      .data_to_mem    (dma5_to_mem));
   dma_channel dma6
     (.sys_clk        (sys_clk),
      .rst            (rst),
      .dma_start      (dma6_start),
      .dma_done       (dma6_done),
      .dma_req        (dma6_req),
      .dma_irq        (DMA_IRQ[6]),
      .dma_madr       (DMA6_CTRL[31: 0]),
      .dma_bcr        (DMA6_CTRL[63:32]),
      .dma_chcr       (DMA6_CTRL[95:64]),
      .madr_incr      (DMA_MADR_incr[6]),
      .madr_decr      (DMA_MADR_decr[6]),
      .madr_addr      (DMA6_MADR),
      .madr_new       (DMA_MADR_new[6]),
      .bcr_decr       (DMA_BCR_decr[6]),
      .chcr_clr       (DMA_CHCR_clr[13:12]),
      .chan_rdy       (dma6_i[33]),
      .chan_fifo_full (dma6_i[32]),
      .chan_data_in   (dma6_i[31:0]),
      .chan_data_out  (dma6_o[31:0]),
      .chan_ren       (dma6_o[32]),
      .chan_wen       (dma6_o[33]),
      .data_to_dma    (data_to_dma),
      .dma_ack        (dma_ack),
      .dma_ren        (dma6_ren),
      .dma_wen        (dma6_wen),
      .dma_addr       (dma6_addr),
      .data_to_mem    (dma6_to_mem));
		    

   /* FSM next state logic */
   always_ff @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 curr_state = IDLE;
      end
      else begin
	 curr_state = next_state;
      end
   end

   /* FSM */
   always_comb begin
      /* Defaults */
      next_state = curr_state;

      dma0_start = 1'b0;
      dma1_start = 1'b0;
      dma2_start = 1'b0;
      dma3_start = 1'b0;
      dma4_start = 1'b0;
      dma5_start = 1'b0;
      dma6_start = 1'b0;

      dma_done_o = 1'b0;

      case (curr_state)
	/* wait for memory controller to hand over control to dma */
	IDLE: begin
	   if (dma_en) begin
	      next_state = ASSIGN;
	   end
	   else begin
	      next_state = IDLE;
	   end
	end

	/* hand over contorl to the highest priority dma channel */
	ASSIGN: begin
	   dma0_start = t_priority[0];
	   dma1_start = t_priority[1];
	   dma2_start = t_priority[2];
	   dma3_start = t_priority[3];
	   dma4_start = t_priority[4];
	   dma5_start = t_priority[5];
	   dma6_start = t_priority[6];
	   next_state = WAIT;
	end

	/* wait for channel to indicate completed transfer */
	WAIT: begin
	   if (channel_ack) begin
	      dma_done_o = 1'b1;
	      next_state = IDLE;
	   end
	   else begin
	      next_state = WAIT;
	   end
	end   
	
      endcase // case (curr_state)
   end
   
endmodule // dma_controller



/* @MODULE: dma_interrupts
 * @DESCRIPTION:
 * DMA Interrupt request (DICR) register controller. 
 */
module dma_interrupts(input  logic sys_clk, rst,
		      input  logic [ 6:0] irqs,
		      input  logic 	  wen,
		      input  logic [ 3:0] ben,

		      input  logic [31:0] DICR_i,
		      output logic [31:0] DICR_o);

   /* Internal Lines */
   logic [31:0] DICR, next_DICR;

   assign DICR_o = DICR;
   
   /* DICR register logic */
   always_ff @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 DICR[31:0] <= 'b0;
      end
      else begin
	 DICR[31:0] <= next_DICR[31:0];
      end
   end

   always_comb begin
      /* defaults */
      next_DICR[30:0] = DICR[30:0];
      next_DICR[31]   = DICR[15] | ((DICR[22] & DICR[30]) | 
				    (DICR[21] & DICR[29]) |
				    (DICR[20] & DICR[28]) | 
				    (DICR[19] & DICR[27]) |
				    (DICR[18] & DICR[26]) | 
				    (DICR[17] & DICR[25]) |
				    (DICR[16] & DICR[24]));

      if (wen) begin
	 next_DICR[ 5: 0] = DICR_i[5:0];
	 next_DICR[23:15] = DICR_i[23:15];

	 if (DICR_i[24]) begin
	    next_DICR[24] = 1'b0;
	 end
	 if (DICR_i[25]) begin
	    next_DICR[25] = 1'b0;
	 end
	 if (DICR_i[26]) begin
	    next_DICR[26] = 1'b0;
	 end
	 if (DICR_i[27]) begin
	    next_DICR[27] = 1'b0;
	 end
	 if (DICR_i[28]) begin
	    next_DICR[28] = 1'b0;
	 end
	 if (DICR_i[29]) begin
	    next_DICR[29] = 1'b0;
	 end
	 if (DICR_i[30]) begin
	    next_DICR[30] = 1'b0;
	 end
      end
      else if (DICR[23]) begin
	 if (DICR[16] & irqs[0]) begin
	    next_DICR[24] = 1'b1;
	 end
	 if (DICR[17] & irqs[1]) begin
	    next_DICR[25] = 1'b1;
	 end
	 if (DICR[18] & irqs[2]) begin
	    next_DICR[26] = 1'b1;
	 end
	 if (DICR[19] & irqs[3]) begin
	    next_DICR[27] = 1'b1;
	 end
	 if (DICR[20] & irqs[4]) begin
	    next_DICR[28] = 1'b1;
	 end
	 if (DICR[21] & irqs[5]) begin
	    next_DICR[29] = 1'b1;
	 end
	 if (DICR[22] & irqs[6]) begin
	    next_DICR[30] = 1'b1;
	 end
      end
   end

endmodule // dma_interrupts


/* @COMMENTING COMPLETE; EOF */
