

module addr_interpreter(input logic clk, rst,
			input logic [31:0]  addr,
			input logic [31:0]  data_i,
			input logic 	    ren, wen,
			output logic 	    ack,
			output logic [31:0] data_o,

			/* BLOCKRAM INTERFACE */
			input logic [31:0]  blc_data,
			output logic [16:0] blk_addr,

			/* SDRAM INTERFACE */
			input logic [31:0]  sd_data_o,
			input logic 	    sd_valid,
			input logic 	    sd_waitrequest,
			output logic [24:0] sd_addr,
			output logic [31:0] sd_data_i,
			output logic 	    sd_rd,
			output logic 	    sd_wr,

			/* SCRATCH PAD BLOCKRAM INTERFACE */
			input logic [31:0]  sc_data_o,
			output logic [7:0]  sc_addr,
			output logic [31:0] sc_data_i,
			output logic 	    sc_wen//,

			/* HW REGISTER INTERFACE */
			);

   /* PARAMETERS - state declatations */
   localparam IDLE  = 5'b00001;
   localparam READ  = 5'b00010;
   localparam LATCH = 5'b00100;
   localparam WRITE = 5'b01000;
   localparam WAIT  = 5'b10000;
   
   /* PARAMETERS - constants */
   localparam BIOS_TAG_1 = 32'h1FC0_0000;   // start addresses for BIOS
   localparam BIOS_TAG_2 = 32'h9FC0_0000;
   localparam BIOS_TAG_3 = 32'hBFC0_0000;
   localparam BIOS_SIZE  = 20'h___8_0000;

   localparam MAIN_TAG_1  = 32'h0000_0000;  // KUSEG
   localparam MAIN_TAG_2  = 32'h8000_0000;  // KSEG0
   localparam MAIN_TAG_3  = 32'hA000_0000;  // KSEG1
   localparam MAIN_SIZE   = 29'h0020_0000;  // 2 megabytes
   localparam MAIN_OFFSET = 24'h000000;

   localparam PPORT_TAG_1 = 32'h1F00_0000;  // parallel port start addresses
   localparam PPORT_TAG_2 = 32'h9F00_0000;
   localparam PPORT_TAG_3 = 32'hBF00_0000;
   localparam PPORT_SIZE  = 24'h__01_0000;

   localparam SCPAD_TAG_1 = 32'h1F80_0000;  // scratch pad start addresses
   localparam SCPAD_TAG_2 = 32'h9F80_0000;
   localparam SCPAD_SIZE  = 23'h__00_0400;

   localparam HWREG_TAG_1 = 32'h1F80_1000;  // mem map I/O start addresse
   localparam HWREG_TAG_2 = 32'h9F80_1000;
   localparam HWREG_TAG_3 = 32'hBF80_1000;
   localparam HWREG_END   = 16'h_____3000;

   /* INTERNAL LINES */
   reg [3:0]    curr_state,  next_state;
   reg 		curr_ack,    next_ack;
   reg [24:0] 	curr_addr,   next_addr;
   reg [31:0] 	curr_data_i, next_data_i;
   
   reg 		sd_wen_out, sd_ren_out, sc_wen_out;
   reg [31:0] 	data_out;

   wire 	in_BIOS, in_MAIN, in_PPORT, in_SCPAD, in_HWREG;

   assign in_BIOS  = ((addr >= BIOS_TAG_1  && addr < BIOS_TAG_1+BIOS_SIZE) ||
		      (addr >= BIOS_TAG_2  && addr < BIOS_TAG_2+BIOS_SIZE) ||
		      (addr >= BIOS_TAG_3  && addr < BIOS_TAG_3+BIOS_SIZE));
   assign in_MAIN  = ((addr >= MAIN_TAG_1  && addr < MAIN_TAG_1+MAIN_SIZE) ||
		      (addr >= MAIN_TAG_2  && addr < MAIN_TAG_2+MAIN_SIZE) ||
		      (addr >= MAIN_TAG_3  && addr < MAIN_TAG_3+MAIN_SIZE));
   assign in_PPORT = ((addr >= PPORT_TAG_1 && addr < PPORT_TAG_1+PPORT_SIZE) ||
		      (addr >= PPORT_TAG_2 && addr < PPORT_TAG_1+PPORT_SIZE) ||
		      (addr >= PPORT_TAG_3 && addr < PPORT_TAG_1+PPORT_SIZE));
   assign in_SCPAD = ((addr >= SCPAD_TAG_1 && addr < SCPAD_TAG_1+SCPAD_SIZE) ||
		      (addr >= SCPAD_TAG_2 && addr < SCPAD_TAG_1+SCPAD_SIZE) ||
		      (addr >= SCPAD_TAG_3 && addr < SCPAD_TAG_1+SCPAD_SIZE));
   assign in_HWREG = ((addr >= HWREG_TAG_1 && addr < HWREG_TAG_1+HWREG_SIZE) ||
		      (addr >= HWREG_TAG_2 && addr < HWREG_TAG_1+HWREG_SIZE) ||
		      (addr >= HWREG_TAG_3 && addr < HWREG_TAG_1+HWREG_SIZE));


   assign data_o = data_out;
   assign ack    = curr_ack;

   assign sc_data_i = data_i;
   assign sd_data_i = data_i;

   assign sc_addr = addr[9:2];
   assign sd_addr = in_MAIN ? {5'd0, addr[20:2]} :
		    in_SRAM ? {25'd0} :
		    25'd0;
   
   assign sc_wen = sc_wen_out;
   assign sd_wr  = sd_wen_out;
   assign sd_rd  = sd_ren_out;


   /* READ - latch value from memory */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 data_out <= 32'd0;
      end
      else begin
	 if (curr_state == LATCH && in_BIOS) begin
	    data_out <= blk_data;
	 end
	 else if (curr_state == LATCH && in_MAIN) begin
	    data_out <= sd_data_o;
	 end
	 else if (curr_state == LATCH && in_SCPAD) begin
	    data_out <= sc_data_o;
	 end
	 else begin
	    data_out <= 32'd0;
	 end
      end
   end

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state  = IDLE;
	 curr_ack    = 1'd0;
      end
      else begin
	 curr_state  = next_state;
	 curr_ack    = next_ack;
      end 
   end

   /* FSM */
   always_comb begin
      /* Defaults */
      next_state  = curr_state;
      next_ack    = curr_ack;

      sd_wen_out = 1'b0;
      sd_ren_out = 1'b0;
      sc_wen_out = 1'b0;

      case (curr_state)
	/* wait for memory request */
	IDLE: begin
	   if (ren) begin
	      next_state = READ;
	   end
	   else if (wen) begin
	      next_state = WRITE;
	   end
	   else begin
	      next_state = IDLE;
	   end
	end	 

	/* READ STATE */
	READ: begin
	   if (in_MAIN) begin
	      if (sd_waitrequest) begin
		 next_state = READ;
	      end
	      else if (sd_valid) begin
		 next_state = LATCH;
		 sd_ren_out = 1'b1;
	      end
	      else begin
		 next_state = READ;
	      end
	   end
	   else begin
	      next_state = LATCH;
	   end
	end
	LATCH: begin
	   next_state = WAIT;
	   next_ack = 1'b1;
	end

	/* WRITE STATE */
	WRITE: begin
	   if (in_MAIN) begin
	      if (sd_waitrequest) begin
		 next_state = WRITE;
	      end
	      else begin
		 next_state = WAIT;
		 next_ack = 1'b1;
		 sd_wen_out = 1'b1;
	      end
	   end
	   else if (in_SCPAD) begin
	      next_state = WAIT;
	      next_ack = 1'b1;
	      sc_wen_out = 1'b1;
	   end
	   else begin
	      /* error */
	      next_state = IDLE;
	   end
	end

	/* WAIT for ren-wen to fall */
	WAIT: begin
	   if (~ren && ~wen) begin
	      next_ack = 1'b0;
	      next_state = IDLE;
	   end
	   else begin
	      next_state = WAIT;
	   end
	end
      endcase // case (curr_state)
   end

endmodule // addr_interpreter

	
	   
	
