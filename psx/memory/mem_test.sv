

module mem_test 
  #(parameter DQ_WIDTH = 64,
    parameter DQS_WIDTH = 8,
    parameter ROW_WIDTH = 14,
    parameter BANK_WIDTH = 3,
    parameter CK_WIDTH = 1,
    parameter CKE_WIDTH = 1,
    parameter CS_WIDTH = 1,
    parameter nCS_PER_RANK = 1,
    parameter nCK_PER_CLK = 4,
    parameter DM_WIDTH = 8,
    parameter ODT_WIDTH = 1,
    parameter ADDR_WIDTH = 28,
    parameter ECC_TEST = "OFF",
    parameter DATA_WIDTH = 64,
    parameter PAYLOAD_WIDTH = (ECC_TEST == "OFF") ? DATA_WIDTH : DQ_WIDTH)
   
   (input logic clk, rst,
    output logic [63:0] 		     wr_data, 
    output logic [511:0] 		     rd_data,
    output logic 			     done,
    
    /* DDR3 Interface */
    inout logic [DQ_WIDTH-1:0] 		     ddr3_dq,
    inout logic [DQS_WIDTH-1:0] 	     ddr3_dqs_n,
    inout logic [DQS_WIDTH-1:0] 	     ddr3_dqs_p,
    output logic [ROW_WIDTH-1:0] 	     ddr3_addr,
    output logic [BANK_WIDTH-1:0] 	     ddr3_ba,
    output logic 			     ddr3_ras_n,
    output logic 			     ddr3_cas_n,
    output logic 			     ddr3_we_n,
    output logic 			     ddr3_reset_n,
    output logic [CK_WIDTH-1:0] 	     ddr3_ck_p,
    output logic [CK_WIDTH-1:0] 	     ddr3_ck_n,
    output logic [CKE_WIDTH-1:0] 	     ddr3_cke,
    output logic [CS_WIDTH*nCS_PER_RANK-1:0] ddr3_cs_n,
    output logic [DM_WIDTH-1:0] 	     ddr3_dm,
    output logic [ODT_WIDTH-1:0] 	     ddr3_odt);

   /* PARAMETERS */
   
   /* state definitions */
   localparam RESET          = 8'd0;
   localparam REF_STROBE     = 8'd1;
   localparam REF_STROBE_ACK = 8'd2;
   localparam ZQ_STROBE      = 8'd3;
   localparam ZQ_STROBE_ACK  = 8'd4;
   localparam CALIB_COMPLETE = 8'd5;
   localparam WRITE_INIT     = 8'd6;
   localparam WRITE_ACK      = 8'd7;
   localparam WRITE_DONE     = 8'd8;
   localparam READ_INIT      = 8'd9;
   localparam READ_ACK       = 8'd10;
   localparam READ_RDY       = 8'd11;
   localparam READ_LATCH     = 8'd12;
   localparam READ_DONE      = 8'd13;
   
   /* localparams */
   localparam CMD_READ  = 3'b001;
   localparam CMD_WRITE = 3'b000;
   localparam CMD_NONE  = 3'b111;
   
   /* INTERNAL LINES */
   reg [7:0] 				     curr_state, next_state;
   reg [ADDR_WIDTH-1:0] 		     curr_addr, next_addr;
   reg [(nCK_PER_CLK*2*PAYLOAD_WIDTH)-1:0]   curr_wr_data, next_wr_data;
   reg [2:0] 				     curr_cmd, next_cmd;
   reg 					     curr_app_en, next_app_en;
   reg 					     curr_ref_req, next_ref_req;
   reg 					     curr_zq_req, next_zq_req;   
   reg 					     curr_wren, next_wren;
   
   reg [DATA_WIDTH-1:0] 		     wr_data_o;
   reg [(nCK_PER_CLK*2*PAYLOAD_WIDTH)-1:0]   rd_data_o;

   reg 					     done_o;

   /* INTERNAL DDR3 LINES */
   reg 					     sys_clk_i, clk_ref_i;
   reg [ADDR_WIDTH-1:0] 		     app_addr;
   reg [2:0] 				     app_cmd;
   reg 					     app_en;
   reg [(nCK_PER_CLK*2*PAYLOAD_WIDTH)-1:0]   app_wdf_data;
   reg 					     app_wdf_end;
   reg [(nCK_PER_CLK*2*PAYLOAD_WIDTH)/8-1:0] app_wdf_mask;
   reg 					     app_wdf_wren;
   reg [(nCK_PER_CLK*2*PAYLOAD_WIDTH)-1:0]   app_rd_data;
   reg                                       app_rd_data_end;
   reg                                       app_rd_data_valid;
   reg 					     app_rdy;
   reg                                       app_wdf_rdy;
   reg 					     app_sr_req;
   reg                                       app_sr_active;
   reg 					     app_ref_req;
   reg                                       app_ref_ack;
   reg 					     app_zq_req;
   reg                                       app_zq_ack;
   reg                                       ui_clk;
   reg                                       ui_clk_sync_rst;
   reg 					     init_calib_complete;
   reg 					     sys_rst;

   /* only performing 32-bit reads and writes - mask the rest */
   assign app_wdf_mask = 64'hFFFF_FFFF_0000_0000;
   /* only sending one data each time (no burst writes) */
   assign app_wdf_end = 1'b1;
   /* reserved - should be tied to 0 */
   assign app_sr_req = 1'b0;
   assign app_sz = 1'b0;
   /* main reset tied to sys_rst for DDR3 controller*/
   assign sys_rst = rst;
   /* don't care about priority */
   assign app_hi_pri = 1'b0;
   /* DDR3 interface clocks */
   assign sys_clk_i = clk;
   assign clk_ref_i = clk;
   
   
   assign app_addr = 28'hAAA_AAAA;
   assign app_wdf_data = {64'h1111_1111_1111_1111, 
			  64'h2222_2222_2222_2222, 
			  64'h3333_3333_3333_3333,
			  64'h4444_4444_4444_4444,
			  64'h5555_5555_5555_5555,
			  64'h6666_6666_6666_6666,
			  64'h7777_7777_7777_7777,
			  64'h8888_8888_8888_8888};

   assign rd_data = rd_data_o;
   assign done = done_o;
   
   
   mig_7series_v1_7 DDR3(/* INOUTS */
			 .ddr3_dq      (ddr3_dq),
			 .ddr3_dqs_n   (ddr3_dqs_n),
			 .ddr3_dqs_p   (ddr3_dqs_p),
			 
			 /* OUTPUTS */
			 .ddr3_addr    (ddr3_addr),
			 .ddr3_ba      (ddr3_ba),
			 .ddr3_ras_n   (ddr3_ras_n),
			 .ddr3_cas_n   (ddr3_cas_n),
			 .ddr3_we_n    (ddr3_we_n),
			 .ddr3_reset_n (ddr3_reset_n),
			 .ddr3_ck_p    (ddr3_ck_p),
			 .ddr3_ck_n    (ddr3_ck_n),
			 .ddr3_cke     (ddr3_cke),
			 .ddr3_cs_n    (ddr3_cs_n),
			 .ddr3_dm      (ddr3_dm),
			 .ddr3_odt     (ddr3_odt),
      
			 /* INPUTS */
			 .sys_clk_i    (sys_clk_i),
			 .clk_ref_i    (clk_ref_i),
			 .app_addr     (app_addr),
			 .app_cmd      (app_cmd),
			 .app_en       (app_en),
			 .app_wdf_data (app_wdf_data),
			 .app_wdf_end  (app_wdf_end),
			 .app_wdf_mask (app_wdf_mask),
			 .app_wdf_wren (app_wdf_wren),
			 .app_rd_data  (app_rd_data),
			 .app_rd_data_end (app_rd_data_end),
			 .app_rd_data_valid (app_rd_data_valid),
			 .app_rdy      (app_rdy),
			 .app_wdf_rdy  (app_wdf_rdy),
			 .app_sr_req   (app_sr_req),
			 .app_sr_active (app_sr_active),
			 .app_ref_req  (app_ref_req),
			 .app_ref_ack  (app_ref_ack),
			 .app_zq_ack   (app_zq_ack),
			 .ui_clk       (ui_clk),
			 .ui_clk_sync_rst (ui_clk_sync_rst),
			 .init_calib_complete (init_calib_complete),
			 .sys_rst      (sys_rst));


   /* latch read value from DDR3 controller */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 rd_data_o <= 'd0;
      end
      else begin
	 if (curr_state == READ_LATCH) begin
	    rd_data_o <= app_rd_data;
	 end
      end
   end
   
   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state   <= RESET;
	 curr_addr    <= 'd0;
	 curr_wr_data <= 'd0;
	 curr_cmd     <= CMD_READ;
	 curr_app_en  <= 1'b0;
	 curr_ref_req <= 1'b0;
	 curr_zq_req  <= 1'b0;
	 curr_wren    <= 1'b0;
      end

      else begin
	 curr_state   <= next_state;
	 curr_addr    <= next_addr;
	 curr_wr_data <= next_wr_data;
	 curr_cmd     <= next_cmd;
	 curr_app_en  <= next_app_en;
	 curr_ref_req <= next_ref_req;
	 curr_zq_req  <= next_zq_req;
	 curr_wren    <= next_wren;
      end
   end
   
   
   /* FSM */
   always_comb begin
      /* DEFAULTS */
      next_state   = curr_state;
      next_addr    = curr_addr;
      next_wr_data = curr_wr_data;
      next_cmd     = curr_cmd;
      next_app_en  = curr_app_en;
      next_ref_req = curr_ref_req;
      next_zq_req  = curr_zq_req;
      next_wren    = curr_wren;
      
      done_o = 1'b0;
      
      case (curr_state)
	/* wait for calibration to complete */
	RESET: begin
	   /* do something */
	   next_state = REF_STROBE;
	end

	/* strobe the DDR3 refresh signal */
	REF_STROBE: begin
	   next_ref_req = 1'b1;
	   next_state = REF_STROBE_ACK;
	end

	/* deassert strobe and wait for ACK */
	REF_STROBE_ACK: begin
	   next_ref_req = 1'b0;
	   if (app_ref_ack) begin
	      next_state = ZQ_STROBE;
	   end
	   else begin
	      next_state = REF_STROBE_ACK;
	   end
	end

	/* send ZQ calibration command */
	ZQ_STROBE: begin
	   next_zq_req = 1'b1;
	   next_state = ZQ_STROBE_ACK;
	end

	/* deassert ZQ strobe and wait for ACK */
	ZQ_STROBE_ACK: begin
	   next_zq_req = 1'b0;
	   if (app_zq_ack) begin
	      next_state = CALIB_COMPLETE;
	   end
	   else begin
	      next_state = ZQ_STROBE_ACK;
	   end
	end

	/* wait for calibration to be complete */
	CALIB_COMPLETE: begin
	   if (init_calib_complete) begin
	      next_state = WRITE_INIT;
	   end
	   else begin
	      next_state = CALIB_COMPLETE;
	   end
	end
	
	WRITE_INIT: begin
	   if (app_wdf_rdy) begin
	      next_app_en = 1'b1;
	      next_cmd = CMD_WRITE;
	      // set address
	      // set data
	      next_wren = 1'b1;
	      next_state = WRITE_ACK;
	   end
	   else begin
	      next_state = WRITE_INIT;
	   end
	end

	WRITE_ACK: begin
	   if (app_rdy) begin
	      next_app_en = 1'b0;
	      next_wren = 1'b0;
	      next_state = WRITE_DONE;
	   end
	   else begin
	      next_state = WRITE_ACK;
	   end
	end

	WRITE_DONE: begin
	   next_state = READ_INIT;
	end

	READ_INIT: begin
	   next_app_en = 1'b1;
	   next_cmd = CMD_READ;
	   // set address
	   next_state = READ_ACK;
	end

	READ_ACK: begin
	   if (app_rdy) begin
	      next_state = READ_RDY;
	      next_app_en = 1'b0;
	   end
	   else begin
	      next_state = READ_ACK;
	   end
	end

	READ_RDY: begin
	   if (app_rd_data_valid) begin
	      next_state = READ_LATCH;
	   end
	   else begin
	      next_state = READ_RDY;
	   end
	end

	READ_LATCH: begin
	   if (~app_rd_data_valid) begin
	      next_state = READ_DONE;
	   end
	   else begin
	      next_state = READ_LATCH;
	   end
	end

	READ_DONE: begin
	   next_state = READ_DONE;
	   done_o = 1'b1;
	end
	
      endcase // case (curr_state)
   end // always_comb
   
endmodule // mem_test

