
module VC707_side(
				  input logic        clk, rst,
				  input logic [31:0] data_in,
				  input logic       data_rdy,
				  inout [5:0]  com_channel,
				  output logic      rdy_for_data,
				  output logic      com_clk, com_req);
   
   /* Parameters */
   parameter COMCLK       = 6;

   /* Command types */
   localparam CMD_LED     = 32'h1;
   localparam CMD_CNTRL1  = 32'h2;
   localparam CMD_CNTRL2  = 32'h4;
   localparam CMD_DISPLAY = 32'h8;
   
   /* Interal Lines */
   logic [31:0] 			   data_in_hold;
   logic 					   data_in_v, data_got;

   logic					   clk_COM;
   logic [COMCLK:0] 		   clk_counter;

   logic 					   fifo_we, fifo_re, fifo_full, fifo_empty;
   logic [31:0] 			   fifo_in, fifo_out;
   logic [35:0] 			   fifo_out_extend;
   logic [31:0] 			   fifo_type_in, fifo_type_out;
   
   enum logic [1:0] {WAIT, TOFIFO, INFIFO}   buf_fifo_state, buf_fifo_state_next;
   
   enum logic [2:0] {NOSEND, SENDREQ, SENDCMD, SENDDATA, GETDATA} com_state, com_state_next;

   logic [5:0] com_channel_temp;
   logic [5:0] com_count, com_count_next;

   assign com_channel = com_channel_temp;
   
   /* Data hold register */
   always_ff @(posedge clk, posedge rst) begin
	  if (rst) begin
		 data_in_hold <= 32'b0;
		 data_in_v <= 1'b0;
		 rdy_for_data <= 1'b1;
	  end
	  else begin
		 if (data_rdy) begin
			data_in_hold <= data_in;
			data_in_v <= 1'b1;
			rdy_for_data <= 1'b0;
		 end
		 else if (data_got) begin
			data_in_v <= 1'b0;
		 end
		 else if (~data_in_v & ~data_got) begin
			rdy_for_data <= 1'b1;
		 end
	  end // else: !if(rst)
   end // always_ff @ (posedge clk, posedge rst)

   /* Clock divider */
   always_ff @(posedge clk, posedge rst) begin
	  if (rst) begin
		 clk_COM <= 1'b0;
		 clk_counter <= 'b0;
	  end
	  else begin
		 clk_counter <= clk_counter + 'd1;
		 clk_COM <= clk_counter[COMCLK];
	  end // else: !if(rst)
   end // always_ff @ (posedge clk, posedge rst)

   assign com_clk = clk_COM;

   /* FSM between buffer and FIFO */
   always_ff @(posedge clk_COM, posedge rst) begin
	  if (rst) begin
		 buf_fifo_state <= WAIT;
	  end
	  else begin
		 buf_fifo_state <= buf_fifo_state_next;
	  end
   end

   /* Next state + output logic */
   always_comb begin
	  /* Defaults */
	  fifo_we = 1'b0;
	  fifo_in = 32'b0;
	  fifo_type_in = 1'b0;
	  data_got = 1'b0;
	  buf_fifo_state_next = buf_fifo_state;

	  /* Case on state */
	  case (buf_fifo_state)
		WAIT: begin
		   if (data_in_v & ~fifo_full) begin
			  buf_fifo_state_next = TOFIFO;
		   end
		end
		TOFIFO: begin
		   fifo_we = 1'b1;
		   fifo_in = data_in_hold;
		   fifo_type_in = 32'h1;
		   buf_fifo_state_next = INFIFO;
		end
		INFIFO: begin
		   data_got = 1'b1;
		   if (~data_in_v) begin
			  buf_fifo_state_next = WAIT;
		   end
		end
	  endcase // case (buf_fifo_state)
   end // always_comb begin
		   
   /* FIFO */
   fifo_16x32 com_f(.clk(clk_COM),
					.rst(rst),
					.we(fifo_we),
					.re(fifo_re),
					.full(fifo_full),
					.empty(fifo_empty),
					.clr(),
					.data_in(fifo_in),
					.data_out(fifo_out));

   /* Type FIFO */
   fifo_16x32 com_type_f(.clk(clk_COM),
						 .rst(rst),
						 .we(fifo_we),
						 .re(fifo_re),
						 .full(),
						 .empty(),
						 .clr(),
						 .data_in(fifo_type_in),
						 .data_out(fifo_type_out));

   assign fifo_out_extend = {4'b0, fifo_out};
   
   /* Sending FSM */
   always_ff @(posedge clk_COM, posedge rst) begin
	  if (rst) begin
		 com_state <= NOSEND;
		 com_count <= 6'b0;
	  end
	  else begin
		 com_state <= com_state_next;
		 com_count <= com_count_next;
	  end
   end

   /* Next state + output logic */
   always_comb begin
	  /* Defaults */
	  com_state_next = com_state;
	  com_count_next = com_count;

	  fifo_re = 1'b0;
	  com_req = 1'b0;
	  com_channel_temp = 6'bz;
	  
	  case (com_state)
		NOSEND: begin
		   if (~fifo_empty) begin
			  com_state_next = SENDREQ;
		   end
		end
		SENDREQ: begin
		   com_req = 1'b1;
		   com_state_next = SENDCMD;
		end
		SENDCMD: begin
		   com_channel_temp = fifo_type_out[5:0];
		   com_count_next = 6'b0;
		   
		   case (fifo_type_out)
			 CMD_LED: begin
				com_state_next = SENDDATA;
			 end
		   endcase
		end
		SENDDATA: begin
		   com_channel_temp[5] = fifo_out_extend[(com_count + 6'd5)];
		   com_channel_temp[4] = fifo_out_extend[(com_count + 6'd4)];
		   com_channel_temp[3] = fifo_out_extend[(com_count + 6'd3)];
		   com_channel_temp[2] = fifo_out_extend[(com_count + 6'd2)];
		   com_channel_temp[1] = fifo_out_extend[(com_count + 6'd1)];
		   com_channel_temp[0] = fifo_out_extend[com_count];
		   
		   com_count_next = com_count + 6'd6;

		   if (com_count_next == 6'd36) begin
			  com_state_next = NOSEND;
			  fifo_re = 1'b1;
		   end
		end // case: SENDDATA
		GETDATA: begin

		   com_count_next = com_count + 6'd6;
		   
		   if (com_count_next == 6'd36) begin
			  com_state_next = NOSEND;
		   end
		end
	  endcase
   end // always_comb begin

endmodule // VC707_side
