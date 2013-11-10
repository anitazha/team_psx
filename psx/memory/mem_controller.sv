



module mem_controller(input logic  clk, clk_133_0, rst,

		      /* SDRAM CHIP INTERFACE */
		      output logic [12:0] zs_addr,
		      output logic [1:0]  zs_ba,
		      output logic 	  zs_cas_n,
		      output logic 	  zs_cke,
		      output logic 	  zs_cs_n,
		      output logic [3:0]  zs_dqm,
		      inout logic [31:0]  zs_dq,
		      output logic 	  zs_ras_n,
		      output logic 	  zs_we_n,
		      
		      /* CPU DATA */
		      input logic [31:0]  data_addr,
		      input logic [31:0]  data_data_i,
		      input logic 	  data_ren, 
		      input logic 	  data_wen,
		      output logic 	  data_ack,
		      output logic [31:0] data_data_o,

		      /* CPU INSTRCTION */
		      input logic [31:0]  inst_addr,
		      input logic 	  inst_ren,
		      output logic 	  inst_ack,
		      output logic [31:0] inst_data_o//,

		      /* GPU SIGNALS *
		      output logic 	  to_gp0, to_gp1,
		      input logic 	  gpu_rdy,
		      input logic 	  gpu_fifo_full,
		      input logic [31:0]  gpu_stat, gpu_read,
		      output logic [31:0] gp0, gp1,

		      * HW REGISTER CONNECTIONS */
		      );

   /* PARAMETERS - state declarations */ 
   localparam IDLE       = 6'b000001;
   localparam READ_INIT  = 6'b000010;
   localparam READ_DATA  = 6'b000100;
   localparam READ_INST  = 6'b001000;
   localparam WRITE_INIT = 6'b010000;
   localparam WRITE_DATA = 6'b100000;

   
   /* INTERNAL LINES */
   // - memory module interconnects 
   wire        reset_controller_out;
   wire [16:0] blk_addr;
   wire [31:0] blk_data;
   wire [31:0] sd_data_o, sd_data_i;
   wire [24:0] sd_addr;
   wire        sd_valid, sd_waitrequest, sd_rd, sd_wr;
   wire [31:0] sc_data_o, sc_data_i;
   wire [9:0]  sc_addr;
   wire        sc_wen;
   
   // - operations flags
   wire        data_active, inst_active;
   wire        mem_read, mem_write;
   
   // - state variables 
   reg [5:0]   curr_state, next_state;
   reg [31:0]  curr_addr, next_addr;
   reg [31:0]  curr_data_i, next_data_i;
   reg 	       curr_ren, next_ren;
   reg 	       curr_wen, next_wen;
   reg 	       curr_d_ack, next_d_ack;
   reg 	       curr_i_ack, next_i_ack;
   
   // - output registers 
   reg [31:0]  data_o;
   reg 	       ack_o;

   
   assign data_active = data_ren | data_wen;
   assign inst_active = inst_ren;
   assign mem_read  = data_ren | inst_ren;
   assign mem_write = data_wen;
   
   assign data_ack = curr_d_ack;
   assign inst_ack = curr_i_ack;
   assign data_data_o = data_o;
   assign inst_data_o = data_o;
   
   /* BLOCKRAM CONTROLLER */
   blockram BIOS(.clk     (clk),
		 .address (blk_addr),
		 .data    (blk_data));

   /* SCRATCHPAD BLOCKRAM CONTROLLER */
   blockram_1k SCPAD(.clk     (clk),
		     .address (sc_addr),
		     .data    (sc_data_i),
		     .wren    (sc_wen),
		     .q       (sc_data_o));
   
   /* HW REGISTER CONTROLLER */
   
   
   /* SDRAM CONTROLLER */
   sdram_controller sdram(.clk            (clk_133_0),
			  .reset_n        (~reset_controller_out),
			  // inputs
			  .az_addr        (sd_addr),
			  .az_be_n        (4'b0000),
			  .az_cs          (1'b1),
			  .az_data        (sd_data_i),
			  .az_rd_n        (~sd_rd),
			  .az_wr_n        (~sd_wr),
			  // outputs (internal)
			  .za_data        (sd_data_o),
			  .za_valid       (sd_valid),
			  .za_waitrequest (sd_waitrequest),
			  // outputs to sdram chip
			  .zs_addr        (zs_addr), 		
			  .zs_ba          (zs_ba),
			  .zs_cas_n       (zs_cas_n),
			  .zs_cke         (zs_cke),
			  .zs_cs_n        (zs_cs_n),
			  .zs_dq          (zs_dq),
			  .zs_dqm         (zs_dqm),
			  .zs_ras_n       (zs_ras_n),
			  .zs_we_n        (zs_we_n));

   /* reset signal synchronizer for sdram controller */
   altera_reset_controller #(.NUM_RESET_INPUTS        (1),
			     .OUTPUT_RESET_SYNC_EDGES ("deassert"),
			     .SYNC_DEPTH              (2))
   rst_controller(.reset_in0  (rst),
		  .clk        (clk_133_0),
		  .reset_out  (reset_controller_out),
		  .reset_in1  (1'b0), // the rest are not used 
		  .reset_in2  (1'b0), .reset_in3  (1'b0), .reset_in4  (1'b0),
		  .reset_in5  (1'b0), .reset_in6  (1'b0), .reset_in7  (1'b0),
		  .reset_in8  (1'b0), .reset_in9  (1'b0), .reset_in10 (1'b0),
		  .reset_in11 (1'b0), .reset_in12 (1'b0), .reset_in13 (1'b0),
		  .reset_in14 (1'b0), .reset_in15 (1'b0));
   
   /* PSX MEMORY CONTROLLERS */
   addr_interpreter addr_interp(.clk            (clk),
				.rst            (rst),
				.addr           (curr_addr),
				.data_i         (curr_data_o),
				.ren            (curr_wen),
				.wen            (curr_ren),
				.ack            (ack_o),
				.data_o         (data_o),
				.blk_addr       (blk_addr),
				.blk_data       (blk_data),
				.sd_data_o      (sd_data_o),
				.sd_valid       (sd_valid),
				.sd_waitrequest (sd_waitrequest),
				.sd_addr        (sd_addr),
				.sd_data_i      (sd_data_i),
				.sd_rd          (sd_rd),
				.sd_wr          (sd_wr),
				.sc_data_o      (sc_data_o),
				.sc_addr        (sc_addr),
				.sc_data_i      (sc_data_i),
				.sc_wen         (sc_wen));


   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state  = IDLE;
	 curr_addr   = 32'd0;
	 curr_data_i = 32'd0;
	 curr_wen    = 1'b0;
	 curr_ren    = 1'b0;
	 curr_d_ack  = 1'b0;
	 curr_i_ack  = 1'b0;
	 
      end
      else begin
	 curr_state  = next_state;
	 curr_addr   = next_addr;
	 curr_data_i = next_data_i;
	 curr_wen    = next_wen;
	 curr_ren    = next_ren;
	 curr_d_ack  = next_d_ack;
	 curr_i_ack  = next_i_ack;
	 
      end
   end
   
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state  = curr_state;
      next_addr   = curr_addr;
      next_data_i = curr_data_i;
      next_wen    = curr_wen;
      next_ren    = curr_ren;
      next_d_ack  = curr_d_ack;
      next_i_ack  = curr_i_ack;
      
      case (curr_state)
	/* wait for memory request */
	IDLE: begin
	   /* read commands */
	   if (mem_read) begin
	      if (data_active) begin
		 next_state = READ_INIT;
		 next_addr = data_addr;
		 next_data_i = data_data_i;
		 next_wen = data_wen;
		 next_ren = data_ren;
	      end
	      else if (inst_active) begin
		 next_state = READ_INIT;
		 next_addr = inst_addr;
		 next_data_i = 32'd0;
		 next_wen = 1'b0;
		 next_ren = inst_ren;
	      end
	      else begin
		 next_state = IDLE;
	      end
	   end
	   /* write commands */
	   else if (mem_write) begin
	      if (data_active) begin
		 next_state = WRITE_INIT;
		 next_addr = data_addr;
		 next_data_i = data_data_i;
		 next_wen = data_wen;
		 next_ren = data_ren;
	      end
	      else if (inst_active) begin
		 // can't be instruction because these are writes
		 next_state = IDLE;
	      end
	      else begin
		 next_state = IDLE;
	      end
	   end
	   /* --- */
	   else begin
	      next_state = IDLE;
	   end
	end // case: IDLE

	/* read states */
	READ_INIT: begin
	   if (ack_o) begin
	      if (data_active) begin
		 next_state = READ_DATA;
		 next_d_ack = ack_o;
	      end
	      else if (inst_active) begin
		 next_state = READ_INST;
		 next_i_ack = ack_o;
	      end 
	   end
	   else begin
	      next_state = READ_0;
	   end
	end 
	READ_DATA: begin
	   if (~data_active && ~ack_o) begin
	      next_state = IDLE;
	      next_d_ack = ack_o;
	      next_ren   = data_ren;
	   end
	   else begin
	      next_state = READ_DATA;
	   end
	end
	READ_INST: begin
	   if (~inst_active && ~ack_o) begin
	      next_state = IDLE;
	      next_i_ack = ack_o;
	      next_ren   = inst_ren;
	   end
	   else begin
	      next_state = READ_INST;
	   end
	end

	/* write states */
	WRITE_INIT: begin
	   if (ack_o && data_active) begin
	      next_state = WRITE_DATA;
	      next_d_ack = ack_o;
	   end
	   else begin
	      next_state = WRITE_INIT;
	   end
	end
	WRITE_DATA: begin
	   if (~data_active && ~ack_o) begin
	      next_state = IDLE;
	      next_d_ack = ack_o;
	      next_wen   = data_wen;
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
