


module cpu_mem_controller(input logic clk, rst,
			  input logic [31:0]  ADDR,
			  input logic [31:0]  DATA_I,
			  input logic 	      REN, WEN,
			  output logic 	      ACK,
			  output logic [31:0] DATA_O,

			  /* BLOCK RAM INTERFACE */
			  input logic [31:0]  dout_o,
			  output logic [19:0] addr_o,
			  output logic 	      wea_o,
			  output logic [31:0] din_o);


   /* PARAMETERS */

   /* state declarations */
   parameter IDLE    = 4'b0001;
   parameter READ_0  = 4'b0010;
   parameter READ_1  = 4'b0011;
   parameter WRITE_0 = 4'b0100;
   parameter WRITE_1 = 4'b0101;
   parameter WAIT    = 4'b0110;
   parameter SCRATCH_READ  = 4'b0111;
   parameter SCRATCH_WRITE = 4'b1000;
   parameter HW_REG_READ   = 4'b1001;
   parameter HW_REG_WRITE  = 4'b1010;
   parameter PARPORT_RW    = 4'b1011;

   /* constants */
   localparam BIOS_TAG_1 = 32'h1FC00000;
   localparam BIOS_TAG_2 = 32'h9FC0000;
   localparam BIOS_TAG_3 = 32'hBFC0000;
   
   localparam MAINMEM_TAG_1  = 3'b000;       // KUSEG
   localparam MAINMEM_TAG_2  = 3'b100;       // KSEG0
   localparam MAINMEM_TAG_3  = 3'b101;       // KSEG1
   localparam MAINMEM_END    = 29'h00200000; // 2Mb
   localparam MAINMEM_OFFSET = 20'h40000;
   
   localparam PARPORT_START  = 32'h1F000000;
   localparam PARPORT_END    = 32'h1F010000;

   localparam SCRATCH_START  = 32'h1F800000;
   localparam SCRATCH_END    = 32'h1F800400;
   
   localparam HW_REG_START  = 32'h1F801000;
   localparam HW_REG_END    = 32'h1F803000;

   /* HARDWARE REGISTERS */
   reg [31:0] HW_REG [0:2047];

   /* SCRATCH PAD REGISTERS */
   reg [31:0] SCRATCH_PAD [0:255];

   /* PARALLEL PORT */
   reg [31:0] PARPORT_UNUSED;
   
   /* INTERNAL LINES */
   reg [3:0]  curr_state, next_state;
   reg 	      curr_ack,   next_ack;
   reg [19:0] curr_addr,  next_addr;
   reg [31:0] curr_din,   next_din;
   reg 	      curr_wea,   next_wea;
   reg [7:0]  curr_SCRATCH_index, next_SCRATCH_index;
   reg [11:0] curr_HW_REG_index, next_HW_REG_index;

   reg [31:0] DATA_OUT;

   wire [19:0] BIOS_ADDR, MAIN_ADDR, PHYS_ADDR;
   wire [7:0]  SCRATCH_ADDR;
   wire [10:0] HW_REG_ADDR;
   
   wire        in_BIOS;
   wire        in_MAINMEM;
   wire        in_PARPORT;
   wire        in_SCRATCH;
   wire        in_HW_REG;

   assign in_BIOS = (ADDR[31:19] == BIOS_TAG_1[31:19] ||
		     ADDR[31:19] == BIOS_TAG_2[31:19] ||
		     ADDR[31:19] == BIOS_TAG_3[31:19]  ) ? 1 : 0;
   
   assign in_MAINMEM = ((ADDR[31:29] == MAINMEM_TAG_1 ||
			 ADDR[31:29] == MAINMEM_TAG_2 ||
			 ADDR[31:29] == MAINMEM_TAG_3) &&
			ADDR[28:0] < MAINMEM_END);

   assign BIOS_ADDR = {3'b000, ADDR[18:2]};   
   assign MAIN_ADDR = {1'b0, ADDR[20:2]} + 20'h40000;
   assign PHYS_ADDR = (in_BIOS ? BIOS_ADDR : (in_MAINMEM ? MAIN_ADDR : 'd0));
   assign HW_REG_ADDR = ADDR[13:2] - 12'h400;
   assign SCRATCH_ADDR = ADDR[9:2];
   
   assign in_PARPORT = (ADDR >= PARPORT_START) && (ADDR < PARPORT_END);
   assign in_SCRATCH = (ADDR >= SCRATCH_START) && (ADDR < SCRATCH_END);
   assign in_HW_REG  = (ADDR >= HW_REG_START) && (ADDR < HW_REG_END);

   assign PARPORT_UNUSED = 'd0;
   
   assign DATA_O = DATA_OUT;
   assign ACK    = curr_ack;

   assign addr_o = curr_addr;
   assign wea_o  = curr_wea;
   assign din_o  = curr_din;
   
   
   /* READ - latch value from memory */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 DATA_OUT <= 'd0;
      end
      else begin
	 if (curr_state == READ_1) begin
	    DATA_OUT <= dout_o;
	 end
	 else if (curr_state == SCRATCH_READ) begin
	    DATA_OUT <= SCRATCH_PAD[curr_SCRATCH_index];
	 end
	 else if (curr_state == SCRATCH_WRITE) begin
	    SCRATCH_PAD[curr_SCRATCH_index] <= DATA_I;
	 end
	 else if (curr_state == HW_REG_READ) begin
	    DATA_OUT <= HW_REG[curr_HW_REG_index];
	 end
	 else if (curr_state == HW_REG_WRITE) begin
	    HW_REG[curr_HW_REG_index] <= DATA_I;
	 end
	 else if (curr_state == PARPORT_RW) begin
	    DATA_OUT <= PARPORT_UNUSED;
	 end
      end // else: !if(rst)
   end

   
   /* CPU FSM next state logic */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state = IDLE;
	 curr_ack   = 'd0;
	 curr_addr  = 'd0;
	 curr_din   = 'd0;
	 curr_wea   = 'd0;
	 curr_SCRATCH_index = 'd0;
	 curr_HW_REG_index  = 'd0;
      end
      else begin
	 if (clk) begin
	    curr_state = next_state;
	    curr_ack   = next_ack;
	    curr_addr  = next_addr;
	    curr_din   = next_din;
	    curr_wea   = next_wea;
	    curr_SCRATCH_index = next_SCRATCH_index;
	    curr_HW_REG_index  = next_HW_REG_index;
	 end
      end
   end

   /* CPU FSM */
   always_comb begin
      /* DEFAULTS */
      next_state = curr_state;
      next_ack   = curr_ack;
      next_addr  = curr_addr;
      next_din   = curr_din;
      next_wea   = curr_wea;
      next_SCRATCH_index = curr_SCRATCH_index;
      next_HW_REG_index  = curr_HW_REG_index;
      
      case (curr_state)
	IDLE: begin
	   /* address in BIOS or MAIN MEMORY region */
	   if (in_BIOS || in_MAINMEM) begin
	      if (REN) begin
		 next_state = READ_0;
		 next_addr = PHYS_ADDR;
	      end
	      else if (WEN) begin
		 next_state = WRITE_0;
		 next_wea  = 1'd1;
		 next_addr = PHYS_ADDR;
		 next_din  = DATA_I;
	      end
	      else begin
		 next_state = IDLE;
	      end
	   end
	   /* address in SCRATCH PAD region */
	   else if (in_SCRATCH) begin
	      if (REN) begin
		 next_state = SCRATCH_READ;
		 next_SCRATCH_index = SCRATCH_ADDR;
	      end
	      else if (WEN) begin
		 next_state = SCRATCH_WRITE;
		 next_SCRATCH_index = SCRATCH_ADDR;
	      end
	   end
	   /* address in HARDWARE REGISTER region */
	   else if (in_HW_REG) begin
	      if (REN) begin
		 next_state = HW_REG_READ;
		 next_HW_REG_index = HW_REG_ADDR;
	      end
	      else if (WEN) begin
		 next_state = HW_REG_WRITE;
		 next_HW_REG_index = HW_REG_ADDR;
	      end
	   end
	   /* address in PARALLEL PORT region */
	   else if (in_PARPORT) begin
	      if (REN || WEN) begin
		 next_state = PARPORT_RW;
	      end
	   end
	   
	   else begin
	      next_state = IDLE;
	   end
	end // case: IDLE

	/* READ STATES */
	READ_0: begin
	   next_state = READ_1;
	end
	READ_1: begin
	   /* sample the data */
	   next_state = WAIT;
	   next_ack = 1'd1;
	end
	SCRATCH_READ: begin
	   next_state = WAIT;
	   next_ack = 1'd1;
	end
	HW_REG_READ: begin
	   next_state = WAIT;
	   next_ack = 1'd1;
	end

	/* WRITE STATES */
	WRITE_0: begin
	   next_state = WRITE_1;
	   next_wea = 1'd0;
	end
	WRITE_1: begin
	   /* second set of bytes written */
	   next_state = WAIT;
	   next_ack = 1'd1;
	end
	SCRATCH_WRITE: begin
	   next_state = WAIT;
	   next_ack = 1'd1;
	end
	HW_REG_WRITE: begin
	   next_state = WAIT;
	   next_ack = 1'd1;
	end

	/* just send back zero for parallel port */
	PARPORT_RW: begin
	   next_state = WAIT;
	   next_ack = 1'd1;
	end

	/* wait for CPU to acknowledge data */
	WAIT: begin
	   if (~REN && ~WEN) begin
	      next_ack = 1'd0;
	      next_state = IDLE;
	   end
	   else begin
	      next_state = WAIT;
	   end
	end
      endcase
   end
   
endmodule // mem_controller
