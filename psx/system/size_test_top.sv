module size_test_top(input wire RESET, SYSCLK_P, SYSCLK_N);

   bit clk, rst;

   /* gpu lines */
   reg to_gp0, to_gp1;
   reg vran_rdy;
   reg [31:0] main_bus;
   reg [15:0] vram_bus;
   reg [19:0] vram_addr;
   reg [31:0] gpu_stat, gpu_read;
   reg 	      vram_re, vram_we;
   
   /* clock generation */
   IBUFDS #(.DIFF_TERM("TRUE"),
	    .IBUF_LOW_PWR("TRUE"),
	    .IOSTANDARD("DEFAULT"))
   clk_ibufds(.O(clk),
	      .I(SYSCLK_P),
	      .IB(SYSCLK_N));

   assign rst = RESET;

   
   gpu gpu1(.*);

endmodule // size_test_top
