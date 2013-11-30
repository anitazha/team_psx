`include "mdec.vh"

module mdec(
	    input logic 	clk, rst,
	    input logic 	mdec1_rst, mdec1_in_en, mdec1_out_en,
	    input logic 	mdec0_we, mdec0_re, mdec1_we,
	    input logic [31:0] 	mdec0_in,
	    output logic [31:0] mdec0_out, mdec1_out,
	    output logic 	mdec0_full, mdec0_empty);

   /* Parameters */
   localparam MDEC0_DEC     = 3'd1;
   localparam MDEC0_SETQTBL = 3'd2;
   localparam MDEC0_SETSTBL = 3'd3;

   localparam MDEC1_RSTVAL  = 32'h9E00FFFF;
   
   /* Internal Lines */
   MDEC_status_t MDEC_status, MDEC_status_new;
   
   logic 			processing;
   
   /* FIFO lines */
   logic 			in_fifo_full, in_fifo_empty;
   logic 			in_fifo_re, in_fifo_clr;
   logic [31:0] 		in_fifo_out;

   logic 			out_fifo_full, out_fifo_empty;
   logic 			out_fifo_we, out_fifo_clr;
   logic [31:0] 		out_fifo_in;
   
   /* Status Register and MDEC1 command */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 MDEC_status <= MDEC1_RSTVAL;
      end
      else begin
	 if (mdec1_rst) begin
	    MDEC_status <= MDEC1_RSTVAL;
	 end
	 else begin
	    MDEC_status <= MDEC_status_new;
	 end
      end
   end

   assign mdec1_out = MDEC_status;
   assign MDEC_status_new.reserved = 4'b0;
   assign MDEC_status_new.busy = mdec0_ld | ~out_fifo_empty | processing;
   assign MDEC_status_new.in_req = (mdec1_we) ? mdec1_in_en : MDEC_status.in_req;
   assign MDEC_status_new.out_req = (mdec1_we) ? mdec1_out_en : MDEC_status.out_req;
   
   /* Input and output fifos */
   fifo_16x32 out_fifo(.clk(clk),
		       .rst(rst),
		       .data_in(out_fifo_in),
		       .full(out_fifo_full),
		       .empty(out_fifo_empty),
		       .re(mdec0_re),
		       .we(out_fifo_we),
		       .clr(out_fifo_clr),
		       .data_out(mdec0_out));
   fifo_16x32 in_fifo(.clk(clk),
		      .rst(rst),
		      .data_in(mdec0_in),
		      .full(in_fifo_full),
		      .empty(in_fifo_empty),
		      .re(in_fifo_re),
		      .we(mdec0_we),
		      .clr(in_fifo_clr),
		      .data_out(in_fifo_out));

   assign mdec0_full = in_fifo_full;
   assign MDEC_status_new.in_fifo_full = in_fifo_full;
   assign mdec0_empty = out_fifo_empty;
   assign MDEC_status_new.out_fifo_empy = out_fifo_empty;

   /* Decode FSM */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 decode_state <= WAIT_DE;
      end
      else begin
	 decode_state <= decode_state_next;
      end
   end

   /* Decode next state and output logic */
   always_comb begin
      /* Defaults */
      decode_state_next = decode_state;

      MDEC_status_new.depth = MDEC_status.depth;
      MDEC_status_new.sign = MDEC_status.sign;
      MDEC_status_new.mask = MDEC_status.mask;

      /* Fire up the correct FSM for the command */
      case (in_fifo_out)
