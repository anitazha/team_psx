

module memory_test
	(input  logic        CLOCK_50,
	 input  logic [3:0]  KEY,
	 input  logic [17:0] SW,
	 output logic [17:0] LEDR,
	 output logic [8:0]  LEDG,
	 
	 /* SDRAM CHIP INTERFACE */
	 output logic [12:0] DRAM_ADDR,
	 output logic [1:0]  DRAM_BA,
	 output logic        DRAM_CAS_N, DRAM_RAS_N, DRAM_CLK,
	 output logic        DRAM_CKE, DRAM_CS_N, DRAM_WE_N,
	 output logic [3:0]  DRAM_DQM,
	 inout  wire  [31:0] DRAM_DQ);

   /* state definitions */
   localparam DW_INIT = 5'b00001;
   localparam DW_WAIT = 5'b00010;
   localparam DR_INIT = 5'b00100;
   localparam DR_WAIT = 5'b01000;
   localparam DDONE   = 5'b10000;
   localparam IR_INIT = 3'b001;
   localparam IR_WAIT = 3'b010;
   localparam IDONE   = 3'b100;
   
   wire      clk, clk_33, clk_100, clk_133_0, clk_133_3, clk_50, rst;
   wire      dll_locked;
   wire      reset_controller_out;
   
   reg [4:0] curr_statd, next_statd;
   reg [2:0] curr_stati, next_stati;
   reg 	     curr_d_ren, next_d_ren;
   reg 	     curr_d_wen, next_d_wen;
   reg 	     curr_i_ren, next_i_ren;
   
   reg [31:0] data_addr, data_data_i, data_data_o;
   reg [31:0] inst_addr, inst_data_o;
   reg        data_ren, data_wen, data_ack;
   reg        inst_ren, inst_ack;
   
   reg [31:0] data_output, inst_output;
   
   wire [12:0] dram_addr;
   wire [1:0]  dram_bank;
   wire        dram_cas_n, dram_cke, dram_cs_n; 
   wire	       dram_ras_n, dram_we_n, dram_clk;
   wire [3:0]  dram_dqm;
   wire [31:0] dram_dq;
   
   wire [6:0]  mem_controller_state;
   wire [6:0]  addr_interpreter_state;
   
   assign data_ren = curr_d_ren;
   assign data_wen = curr_d_wen;
   assign inst_ren = curr_i_ren;
   
   assign data_addr = {15'd0, SW[16:2], 2'b00};
   assign inst_addr = 32'hBFC0_0000;
   assign data_data_i = {SW[15:0], SW[15:0]};
   
   assign clk = CLOCK_50;
   assign rst = SW[17];
   
   assign DRAM_CLK   = dram_clk;
   assign DRAM_ADDR  = dram_addr;
   assign DRAM_BA    = dram_bank;
   assign DRAM_CAS_N = dram_cas_n;
   assign DRAM_CKE   = dram_cke;
   assign DRAM_CS_N  = dram_cs_n;
   assign DRAM_DQ    = dram_dq;
   assign DRAM_DQM   = dram_dqm;
   assign DRAM_RAS_N = dram_ras_n;
   assign DRAM_WE_N  = dram_we_n;
   
   assign LEDG[7:0]  =  ((SW[1:0] == 2'b01) ? {1'b0, mem_controller_state} :
			((SW[1:0] == 2'b10) ? {curr_statd, curr_stati} :
			((SW[1:0] == 2'b11) ? {1'b0, addr_interpreter_state} :
			 {data_ren, 
			  data_wen, 
			  inst_ren, 
			  1'b0, 
			  data_ack, 
			  inst_ack, 
			  2'b00})));
   
   assign LEDR[15:0] = ((~KEY[3:0] == 4'b0001) ? data_output[15:0]  :
			((~KEY[3:0] == 4'b0010) ? data_output[31:16] :
			 ((~KEY[3:0] == 4'b0100) ? inst_output[15:0]  :
			  ((~KEY[3:0] == 4'b1000) ? inst_output[31:16] : 
			   ((~KEY[3:0] == 4'b1111) ? DRAM_DQ[31:16]     : 
			    DRAM_DQ[15:0])))));
   
   /* memory module */
   mem_controller mem_c(.clk       (CLOCK_50),
			.clk_133_0 (clk_133_0),
			.clk_133_3 (clk_133_3),
			.rst       (rst),
			.*);

   /* PLL clock generator */
   pll_50_100_133 pll(.areset (reset_controller_out),
		      .inclk0 (CLOCK_50),
		      .c0     (clk_33),
		      .c1     (clk_100),
		      .c2     (clk_133_0),
		      .c3     (clk_133_3),
		      .c4     (clk_50),
		      .locked (dll_locked));
   
   /* reset signal synchronizer for sdram controller */
   altera_reset_controller #(.NUM_RESET_INPUTS        (1),
			     .OUTPUT_RESET_SYNC_EDGES ("deassert"),
			     .SYNC_DEPTH              (2))
   rst_controller(.reset_in0  (rst),
		  .clk        (clk),
		  .reset_out  (reset_controller_out),
		  .reset_in1  (1'b0), // the rest are not used
		  .reset_in2  (1'b0), .reset_in3  (1'b0), .reset_in4  (1'b0),
		  .reset_in5  (1'b0), .reset_in6  (1'b0), .reset_in7  (1'b0),
		  .reset_in8  (1'b0), .reset_in9  (1'b0), .reset_in10 (1'b0),
		  .reset_in11 (1'b0), .reset_in12 (1'b0), .reset_in13 (1'b0),
		  .reset_in14 (1'b0), .reset_in15 (1'b0));
   
   /* Latch value from reads */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 data_output <= 32'd0;
	 inst_output <= 32'd0;
      end
      else begin
	 if (curr_statd == DDONE) begin
	    data_output <= data_data_o;
	 end
	 if (curr_stati == IDONE) begin
	    inst_output <= inst_data_o;
	 end
      end
   end
   
   /* DATA FSM next state logic */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 curr_statd <= DW_INIT;
	 curr_d_ren <= 1'b0;
	 curr_d_wen <= 1'b0;
      end
      else begin
	 curr_statd <= next_statd;
	 curr_d_ren <= next_d_ren;
	 curr_d_wen <= next_d_wen;
      end
   end
   
   /* DATA FSM */
   always_comb begin
      /* Defaults */
      next_statd = curr_statd;
      next_d_ren = curr_d_ren;
      next_d_wen = curr_d_wen;
      
      case (curr_statd)
	DW_INIT: begin
	   next_d_wen = 1'b1;
	   next_statd = DW_WAIT;
	end
	
	DW_WAIT: begin
	   if (data_ack) begin
	      next_d_wen = 1'b0;
	      next_statd = DR_INIT;
	   end
	   else begin
	      next_statd = DW_WAIT;
	   end
	end
	
	DR_INIT: begin
	   if (~data_ack) begin
	      next_d_ren = 1'b1;
	      next_statd = DR_WAIT;
	   end
	   else begin
	      next_statd = DR_INIT;
	   end
	end
	
	DR_WAIT: begin
	   if (data_ack) begin
	      next_d_ren = 1'b0;
	      next_statd = DDONE;
	   end
	   else begin
	      next_statd = DR_WAIT;
	   end
	end
	
	DDONE: begin
	   next_statd = DDONE;
	end
      endcase // case (curr_state)
   end
   
   /* INSTRUCTION FSM next state logic */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 curr_stati <= IR_INIT;
	 curr_i_ren <= 1'b0;
      end
      else begin
	 curr_stati <= next_stati;
	 curr_i_ren <= next_i_ren;
      end
   end
   
   /* INSTRUCTION FSM */
   always_comb begin
      /* Defaults */
      next_stati = curr_stati;
      next_i_ren = curr_i_ren;
      
      case (curr_stati)
	IR_INIT: begin
	   next_i_ren = 1'b1;
	   next_stati = IR_WAIT;
	end
	
	IR_WAIT: begin
	   if (inst_ack) begin
	      next_i_ren = 1'b0;
	      next_stati = IDONE;
	   end
	   else begin
	      next_stati = IR_WAIT;
	   end
	end
	
	IDONE: begin
	   next_stati = IDONE;
	end
      endcase // case (curr_state)
   end
   
endmodule // test_mem_top

   
		    
