

module test_mem_top
	(input  logic        CLOCK_50,
	 input  logic [3:0]  KEY,
	 input  logic [17:0] SW,
	 output logic [17:0] LEDR,
	 output logic [8:0]  LEDG,
	 output logic [35:0] GPIO,
	 
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
   
   wire      clk, rst;
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
   wire [31:0] dram_dq_out, dram_dq_in;
   wire        dram_oe_out;

   reg [31:0]  dram_reg_in, dram_reg_out;
   
   wire [6:0]  mem_controller_state;
   wire [6:0]  addr_interpreter_state;
   
   assign data_ren = curr_d_ren;
   assign data_wen = curr_d_wen;
   assign inst_ren = curr_i_ren;
   
   assign data_addr = {15'd0, SW[16:2], 2'b00};
   assign inst_addr = 32'hBFC0_0000;
   assign data_data_i = 32'h12345678;
   
   assign clk = CLOCK_50;
   assign rst = ~KEY[0];
   
   assign DRAM_CLK   = dram_clk;
   assign DRAM_ADDR  = dram_addr;
   assign DRAM_BA    = dram_bank;
   assign DRAM_CAS_N = dram_cas_n;
   assign DRAM_CKE   = dram_cke;
   assign DRAM_CS_N  = dram_cs_n;
   assign DRAM_DQ    = dram_oe_out ? dram_dq_in : {32{1'bz}};
   assign DRAM_DQM   = dram_dqm;
   assign DRAM_RAS_N = dram_ras_n;
   assign DRAM_WE_N  = dram_we_n;
   assign dram_dq_out = DRAM_DQ;

   assign GPIO[31:0] = KEY[1] ? dram_reg_out : dram_reg_in;
   assign GPIO[32]   = dram_oe_out;

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
   
   assign LEDR[15:0] = ((SW[17:16] == 2'b00) ? data_output[15:0]  :
			((SW[17:16] == 2'b01) ? data_output[31:16] :
			 ((SW[17:16] == 2'b10) ? inst_output[15:0]  :
			  ((SW[17:16] == 2'b11) ? inst_output[31:16] : 
			   SW[15:0]))));
   
   /* memory module */
   mem_controller mem_c(.clk (clk),
			.rst (rst),
			.*);

   /* Latch values from DRAM_DQ in/out for SignalTap */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 dram_reg_in <= 32'b0;
	 dram_reg_out <= 32'b0;
      end
      else begin
	 dram_reg_in <=  dram_dq_in;
	 dram_reg_out <= DRAM_DQ;
      end
   end

   
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

   
		    
