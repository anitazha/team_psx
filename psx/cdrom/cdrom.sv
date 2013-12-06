`default_nettype none
`include "cdrom.vh"
  
module cdrom(
	     input logic 	 clk, rst,
	     input logic [7:0] 	 CD_addr0_in, CD_addr1_in, CD_addr2_in, CD_addr3_in,
	     input logic 	 to_addr0, to_addr1, to_addr2, to_addr3,
	     input logic 	 addr0_re, addr1_re, addr2_re_8, addr2_re_16, addr3_re,
	     input logic 	 RASPI_ACK,
	     input logic [7:0] 	 RASPI_DATA,
	     output logic [15:0] CD_addr0_out, CD_addr1_out, CD_addr2_out, CD_addr3_out,
	     output logic 	 RASPI_CLK, RASPI_EN,
	     output logic [3:0]  RASPI_CMD);

   /* Parameters */
   localparam CD_CMD_NOP       = 8'h00;
   localparam CD_CMD_GETSTAT   = 8'h01;
   localparam CD_CMD_NOP       = 8'h02;
   localparam CD_CMD_NOP       = 8'h03;

   /* Reset values */
   localparam STATUS_RST          = 8'd18;

   /* Interal Lines */
   STATUS_t CD_status_reg, CD_status_reg_next;

   /* FIFO lines */
   logic 			 resp_fifo_clr, resp_fifo_re, resp_fifo_we;
   logic 			 resp_fifo_full, resp_fifo_empty;
   logic [7:0] 			 resp_fifo_in;
   logic [15:0] 		 resp_fifo_out;

   logic                         data_fifo_clr, data_fifo_re_8, data_fifo_re_16, data_fifo_we;
   logic                         data_fifo_full, data_fifo_empty;
   logic [7:0] 			 data_fifo_in;
   logic [15:0] 		 data_fifo_out;
   
   logic                         param_fifo_clr, param_fifo_re, param_fifo_we;
   logic                         param_fifo_full, param_fifo_empty;
   logic [7:0] 			 param_fifo_in;
   logic [15:0] 		 param_fifo_out;
   
   /* Decode Lines */
   DECODE_STATE_t decode_state, decode_state_next;
   
   /* Recv/Send FSM lines */
   REVC_STATE_t recv_state, recv_state_next;
   SEND_STATE_t send_state, send_state_next;

   logic [3:0] 			 RASPI_CMD_R, RASPI_CMD_S;
   logic 			 RASPI_EN_R, RASPI_EN_S;
 
   /* Status register */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 CD_status_reg <= STATUS_RST;
      end
      else begin
	 CD_status_reg <= CD_status_reg_next;
      end
   end

   /* Some status logic */
   assign CD_addr0_out = CD_status_reg;
   assign CD_status_reg_next.xa_fifo_empty = 1'b0;
   assign CD_status_reg_next.param_fifo_empty = param_fifo_empty;
   assign CD_status_reg_next.param_fifo_full = ~param_fifo_full;
   assign CD_status_reg_next.resp_fifo_empty = ~resp_fifo_empty;
   assign CD_status_reg_next.data_fifo_empty = ~data_fifo_empty;
   
   always_comb begin
      CD_status_reg_next.port = CD_status_reg.port;

      if (to_addr0) begin
	 CD_status_reg_next.port = CD_addr0_in[1:0];
      end
   end

   /* Data, Param and Response FIFOs */
   fifo8x16 dat_fifo(.we(data_fifo_we),
		     .re_8(data_fifo_re_8),
		     .re_16(data_fifo_re_16),
		     .clr(data_fifo_clr),
		     .data_in(data_fifo_in),
		     .data_out(data_fifo_out),
		     .full(data_fifo_full),
		     .empty(data_fifo_empty),
		     .clk(clk),
		     .rst(rst)),
     par_fifo(.we(param_fifo_we),
	      .re_8(param_fifo_re),
	      .clr(param_fifo_clr),
	      .data_in(param_fifo_in),
	      .data_out(param_fifo_out),
	      .full(param_fifo_full),
	      .empty(param_fifo_empty),
	      .clk(clk),
	      .rst(rst)),
     resp_fifo(.we(resp_fifo_we),
	       .re_8(resp_fifo_re),
	       .clr(resp_fifo_clr),
	       .data_in(resp_fifo_in),
	       .data_out(resp_fifo_out),
	       .full(resp_fifo_full),
	       .empty(resp_fifo_empty),
	       .clk(clk),
	       .rst(rst));

   assign param_fifo_we = to_addr2 & (CD_status_reg.port == 2'd0);
   assign param_fifo_re = decode_param_fifo_re;
   assign param_fifo_clr = decode_param_fifo_clr | (cmd_reg == CD_CMD_RESET);
   assign param_fifo_data_in = CD_addr2_in;
   
   assign resp_fifo_we = decode_resp_fifo_we;
   assign resp_fifo_re = addr1_re;
   assign resp_fifo_clr = (cmd_reg == CD_CMD_RESET);
   assign resp_fifo_data_in = decode_resp_fifo_in;

   assign data_fifo_we = recv_data_fifo_we;
   assign data_fifo_re_8 = addr2_re_8;
   assign data_fifo_re_16 = addr2_re_16;
   assign data_fifo_clr = (cmd_reg == CD_CMD_RESET);
   assign data_fifo_data_in = recv_data_fifo_in;

   /* CMD register */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 cmd_reg <= 8'd0;
	 cmd_ld <= 1'b0;
      end
      else begin
	 if (to_addr1 & (CD_status_reg.port == 2'd0)) begin
	    cmd_reg <= CD_addr1;
	    cmd_ld <= 1'b1;
	 end
	 else if (cmd_clr) begin
	    cmd_ld <= 1'b0;
	 end
      end // else: !if(rst)
   end // always_ff @
   

   /* Decode FSM */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 decode_state <= WAIT_D;
	 param_count = 2'd0;
      end
      else begin
	 decode_state <= decode_state_next;
	 param_count <= (send_go) ? recv_param_count_next : decode_param_count_next;
      end
   end

   /* Decode FSM logic */
   always_comb begin
      /* Defaults */
      decode_state_next = decode_state;

      send_go = 1'b0;
      recv_go = 1'b0;
      recv_stop = 1'b0;

      cmd_clr = 1'b0;

      decode_param_count_next = param_count;

      CD_status_reg_next.busy = CD_status_reg.busy;
      
      case (decode_state)
	WAIT_D: begin
	   if (cmd_ld) begin
	      CD_status_reg_next.busy = 1'b1;
	      
	   end
	end
	SEND_D: begin
	   send_go = 1'b1;
	   CD_status_reg_next.busy = 1'b1;

	   if ((send_state == DONE_S) &
	       (cmd_reg == CD_CMD_READN) &
	       (cmd_reg == CD_CMD_READS)) begin
	      send_go = 1'b0;
	      cmd_clr = 1'b1;
	      decode_state_next = WAIT_D;
	   end
	   if (send_state == DONE_S) begin
	      send_go = 1'b0;
	      cmd_clr = 1'b1;
	      decode_state_next = WAIT_DATA_D;
	   end
	end
	WAIT_DATA_D: begin
	   recv_go = 1'b1;
	   CD_status_reg_next.busy = 1'b0;

	   if (recv_state == WAIT_CANCEL_R) begin
	      recv_go = 1'b0;
	      decode_state_next = WAIT_D;
	   end
	   else if ((cmd_reg == CD_CMD_PAUSE) |
		    (cmd_reg == CD_CMD_STOP) |
		    (cmd_reg == CD_CMD_STANDBY) |
		    (cmd_reg == CD_CMD_RESET)) begin
	      recv_go = 1'b0;
	      recv_stop = 1'b1;
	   end		 
	end
      endcase // case (decode_state)
   end // always_comb
   
   /* Receive/Send FSMs */
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 send_state <= WAIT_S;
	 recv_state <= WAIT_R;
      end
      else begin
	 send_state <= send_state_next;
	 recv_state <= recv_state_next;
      end
   end
   
   /* Send FSM logic */
   always_comb begin
      /* Defaults */
      send_state_next = send_state;
      RASPI_EN_S = 1'b0;
      RASPI_CMD_S = 4'd0;

      recv_param_count_next = param_count;

      case (send_state)
	WAIT_S: begin
	   if (send_go) begin
	      send_state_next = SET_CMDL_S;
	   end
	end
	SET_CMDL_S: begin
	   RASPI_CMD = send_cmd[3:0];
	   send_state_next = SET_ENL_S;
	end
	SET_ENL_S: begin
	   RASPI_CMD = send_cmd[3:0];
	   RASPI_EN = 1'b1;
	   send_state_next = WAIT_ACKL_S;
	end
	WAIT_ACKL_S: begin
	   RASPI_CMD = send_cmd[3:0];
	   RASPI_EN = 1'b1;

	   if (RASPI_ACK) begin
	      send_state_next = WAIT_NACKL_S;
	   end
	end
	WAIT_NACK_S: begin
	   RASPI_CMD = send_cmd[3:0];
	   RASPI_EN = 1'b0;

	   if (~RASPI_ACK) begin
	      send_state_next = SET_CMDH_S;
	   end
	end
	SET_CMDH_S: begin
	   RASPI_CMD = send_cmd[7:4];
	   send_state_next = SET_ENH_S;
	end
	SET_ENL_S: begin
	   RASPI_CMD = send_cmd[7:4];
	   RASPI_EN = 1'b1;

	   send_state_next = WAIT_ACKL_S;
	end
	WAIT_ACKL_S: begin
	   RASPI_CMD = send_cmd[7:4];
	   RASPI_EN = 1'b1;

	   if (RASPI_ACK) begin
	      send_state_next = WAIT_NACKL_S;
	   end
	end // case: WAIT_ACKL
	WAIT_NACK_S: begin
	   RASPI_CMD = send_cmd[3:0];
	   RASPI_EN = 1'b0;

	   if (~RASPI_ACK & (send_params == 2'd0)) begin
	      send_state_next = DONE_S;
	   end
	   else if (~RASPI_ACK) begin
	      recv_param_count_next = param_count - 2'd1;
	      send_state_next = SET_CMDL_S;
	   end
	end // case: WAIT_NACK
	DONE_S: begin
	   if (~send_go) begin
	      send_state_next = WAIT_S;
	   end
	end
      endcase
   end // always_comb

   /* Receive FSM logic */
   always_comb begin
      /* Defaults */
      recv_state_next = recv_state;
      RASPI_EN_R = 1'b0;
      RASPI_CMD_R = 4'd0;

      recv_data_fifo_we = 1'b0;
      recv_data_fifo_in = 8'd0;
      
      case (recv_state)
	WAIT_R: begin
	   if (recv_go) begin
	      recv_state_next = WAIT_DATA_R;
	   end
	end
	WAIT_DATA_R: begin
	   if (RASPI_ACK & recv_stop) begin
	      recv_state_next = WAIT_CANCEL_R;
	   end
	   else if (RASPI_ACK) begin
	      recv_state_next = GET_DATA_R;
	   end
	end
	GET_DATA_R: begin
	   recv_data_fifo_we = 1'b1;
	   recv_data_fifo_in = RASPI_DATA;
	   recv_state_next = WAIT_NACK_R;
	end
	WAIT_NACK_R: begin
	   RASPI_EN_R = 1'b1;
	   
	   if (~RASPI_ACK & ~data_fifo_full) begin
	      recv_state_next = WAIT_DATA_R;
	   end
	end
	WAIT_CANCEL_R: begin
	   RASPI_CMD_R = CANCEL_CODE;

	   if (~RASPI_ACK) begin
	      recv_state_next = WAIT;
	   end
	end
      endcase // case (recv_state)
   end // always_comb

endmodule // cdrom

	
