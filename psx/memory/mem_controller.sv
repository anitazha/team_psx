



module mem_controller(input logic  clk, rst,
		      
		      /* CPU DATA */
		      input logic [31:0]  DAT_ADDR,
		      input logic [31:0]  DAT_DATA_I,
		      input logic 	  DAT_REN, 
		      input logic 	  DAT_WEN,
		      output logic 	  DAT_ACK,
		      output logic [31:0] DAT_DATA_O,

		      /* CPU INSTRCTION */
		      input logic [31:0]  INS_ADDR,
		      input logic 	  INS_REN,
		      output logic 	  INS_ACK,
		      output logic [31:0] INS_DATA_O);

   wire [19:0]	  DAT_addr, INS_addr;
   wire [31:0] 	  DAT_dout, INS_dout;
   wire [31:0] 	  DAT_din;
   wire 	  DAT_wea;

   wire [31:0] 	  zero;

   assign zero = 32'd0;
   
   /* CPU MEMORY CONTROLLERS */
   cpu_mem_controller DATA_CTRL(.ADDR(DAT_ADDR),
				.DATA_I(DAT_DATA_I),
				.REN(DAT_REN),
				.WEN(DAT_WEN),
				.ACK(DAT_ACK),
				.DATA_O(DAT_O),
				.dout_o(DAT_dout),
				.addr_o(DAT_addr),
				.wea_o(DAT_wea),
				.din_o(DAT_din),
				.*);
   
   cpu_mem_controller INST_CTRL(.ADDR(INS_ADDR),
				.DATA_I(zero),
				.REN(INS_REN),
				.WEN(zero[0]),
				.ACK(INS_ACK),
				.DATA_O(INS_DATA_O),
				.dout_o(INS_dout),
				.addr_o(INS_addr),
				.wea_o(zero[0]),
				.din_o(zero),
				.*);
   
   
   /* BLOCK RAM INSTANTIATIONS */
   blk_mem_RAM_4MB    MAINMEM(.clka  (clk),
			      .wea   (DAT_wea),
			      .addra (DAT_addr),
			      .dina  (DAT_din),
			      .douta (DAT_dout),
			      .clkb  (clk),
			      .web   (zero[0]),
			      .addrb (INS_addr),
			      .dinb  (zero),
			      .doutb (INS_dout));
   
endmodule // mem_controller
