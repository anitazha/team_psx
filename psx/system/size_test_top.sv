module size_test_top(input wire RESET, SYSCLK_P, SYSCLK_N,

   output logic clk, rst,

   /* gpu lines */
   input reg to_gp0, to_gp1,
   input reg vram_rdy,
   input reg [31:0] main_bus,
   inout wire [15:0] vram_bus,
   output reg [19:0] vram_addr,
   output reg [31:0] gpu_stat, gpu_read,
   output reg 	      vram_re, vram_we,
   input reg clock,
   input reg reset,
   input reg [4:0] Interrupts,            // 5 general-purpose hardware interrupts
   input reg NMI,                         // Non-maskable interrupt
   input reg [31:0] DataMem_In,
   input reg DataMem_Ready,
   output reg DataMem_Read,
   output reg [3:0]  DataMem_Write,        // 4-bit Write, one for each byte in word.
   output reg [29:0] DataMem_Address,      // Addresses are words, not bytes.
   output reg [31:0] DataMem_Out,
   input reg [31:0] InstMem_In,
   output reg [29:0] InstMem_Address,      // Addresses are words, not bytes.
   input reg InstMem_Ready,
   output reg InstMem_Read,
   output reg [7:0] IP,                     // Pending interrupts (diagnostic)
   
   input reg [24:0] inst,
   input reg        rdy,
   output reg          avail);
   
	cop2c_t        c2c_in;
   cop2d_t        c2d_in;
   cop2c_t        c2c;
   cop2d_t        c2d;
	
	assign c2c_in = main_bus;
	assign c2d_in = main_bus;
	 
   /* clock generation */
//   IBUFDS #(.DIFF_TERM("TRUE"),
//	    .IBUF_LOW_PWR("TRUE"),
//	    .IOSTANDARD("DEFAULT"))
//   clk_ibufds(.O(clk),
//	      .I(SYSCLK_P),
//	      .IB(SYSCLK_N));

   assign rst = RESET;

   
   gpu gpu1(.*);

   Processor cpu(.*);

   GTE gte(.*);

endmodule // size_test_top
