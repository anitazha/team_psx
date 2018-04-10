
module dma_sim();

   /* INPUTS */
   reg        clk, rst;
   reg [31:0] data_addr, data_data_i, data_data_o;
   reg [ 3:0] data_wen;
   reg 	      data_ren, data_ack;
   
   reg [31:0] inst_addr, inst_data_o;
   reg 	      inst_ren, inst_ack;

   reg 	      to_gp0, to_gp1, gpu_ren, gpu_rdy, gpu_fifo_full;
   reg [31:0] gpu_stat, gpu_read, gp0, gp1;

   reg 	      hblank, vblank, dotclock;
   reg [10:0] interrupts;

   reg [31:0] counter;
   
   wire [12:0] dram_addr;
   wire [31:0] dram_dq, dram_dq_in, dram_dq_out;
   wire [ 1:0] dram_bank;
   wire [ 3:0] dram_dqm;
   wire        dram_cas_n;
   wire        dram_cke;
   wire        dram_clk;
   wire        dram_cs_n;
   wire        dram_ras_n;
   wire        dram_we_n;
   wire        dram_oe;

   assign hblank = counter[3];
   assign vblank = counter[5];
   assign dotclock = counter[0];
   
   assign dram_dq = dram_oe ? dram_dq_in : 32'bz;
   assign dram_dq_out = dram_dq;
   
   /* SDRAM MODEL */
   qsys_sdram_mem_model sim_mem
     (.reset_reset_n (rst),
      .clk_clk       (clk),
      .zs_dq         (dram_dq),
      .zs_addr       (dram_addr),
      .zs_ba         (dram_bank),
      .zs_cas_n      (dram_cas_n),
      .zs_cke        (dram_cke),
      .zs_cs_n       (dram_cs_n),
      .zs_dqm        (dram_dqm),
      .zs_ras_n      (dram_ras_n),
      .zs_we_n       (dram_we_n));

   /* PSX MEMORY CONTROLLER */
   mem_controller m_controller
     (.clk (clk),
      .rst (rst),
      // sdram chip interface
      .dram_addr   (dram_addr),
      .dram_bank   (dram_bank),
      .dram_cas_n  (dram_cas_n),
      .dram_cke    (dram_cke),
      .dram_clk    (dram_clk),
      .dram_cs_n   (dram_cs_n),
      .dram_dqm    (dram_dqm),
      .dram_ras_n  (dram_ras_n),
      .dram_we_n   (dram_we_n),
      .dram_dq_in  (dram_dq_in),
      .dram_dq_out (dram_dq_out),
      .dram_oe_out (dram_oe),
      // cpu data
      .data_addr   (data_addr),
      .data_data_i (data_data_i),
      .data_ren    (data_ren),
      .data_wen    (data_wen),
      .data_ack    (data_ack),
      .data_data_o (data_data_o),
      // cpu instructions
      .inst_addr   (inst_addr),
      .inst_ren    (inst_ren),
      .inst_ack    (inst_ack),
      .inst_data_o (inst_data_o),
      // gpu signals
      .to_gp0        (to_gp0),
      .to_gp1        (to_gp1),
      .gpu_ren       (gpu_ren),
      .gpu_rdy       (gpu_rdy),
      .gpu_fifo_full (gpu_fifo_full),
      .gpu_stat      (gpu_stat),
      .gpu_read      (gpu_read),
      .gp0           (gp0),
      .gp1           (gp1),
      // hw register connections
      .hblank   (hblank),
      .vblank   (vblank),
      .dotclock (dotclock),
      // interrupts
      .interrupts (interrupts));

   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 counter <= 32'b0;
      end
      else begin
	 counter <= counter + 32'b1;
      end
   end

   /* simulation clock */
   initial begin
      clk <= 1'b1;
      forever #5 clk = ~clk;
   end

   initial begin
      rst <= 1'b0;
      data_addr <= 32'b0;
      data_data_i <= 32'b0;
      data_wen <= 4'b0;
      data_ren <= 1'b0;
      inst_addr <= 32'b0;
      inst_ren <= 1'b0;
      gpu_rdy <= 1'b1;
      gpu_fifo_full <= 1'b0;
      gpu_stat <= 32'hDEADBEEF;
      gpu_read <= 32'hDEAFBABE;

      // reset
      rst <= 1'b0;
      #1;
      rst <= 1'b1;
      #3;
      rst <= 1'b0;
      #1;

/***********************
 * TIMER CONFIGURATION *
 ***********************/
      #5;
      data_addr   <= 32'h1F80_1100;
      data_data_i <= 32'h0000_0100;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1108;
      data_data_i <= 32'h0000_0080;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1104;
      data_data_i <= 32'b0000_0000_0000_0000_0000_0011_0111_1001;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1110;
      data_data_i <= 32'h0000_FF00;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1118;
      data_data_i <= 32'h0000_0006;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1114;
      data_data_i <= 32'b0000_0000_0000_0000_0000_0011_0111_1001;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1120;
      data_data_i <= 32'h0000_0100;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1128;
      data_data_i <= 32'h0000_0004;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      #5;
      data_addr   <= 32'h1F80_1124;
      data_data_i <= 32'b0000_0000_0000_0000_0000_0011_0011_1001;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      
/*********************************
 * TEST SDRAM SIMULATION MODEL   *
 *********************************/

      #5;
      data_addr   <= 32'h0000_0000;
      data_data_i <= 32'h0123_4567;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h0000_0004;
      data_data_i <= 32'h7654_3210;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr <= 32'h0000_0000;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;

      #5;
      data_addr <= 32'h0000_0004;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;
      
/************************************
 * TEST BLOCKRAM SIMULATION MODEL   *
 ************************************/

      #5;
      data_addr   <= 32'h1F80_0000;
      data_data_i <= 32'h0123_4567;
      #5;
      data_wen <= 4'b1001;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h1F80_0004;
      data_data_i <= 32'h7654_3210;
      #5;
      data_wen <= 4'b1001;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr <= 32'h1F80_0000;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;

      #5;
      data_addr <= 32'h1F80_0004;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;
      
/*********************************
 * DMA CONFIGURATION AND TESTING *
 *********************************/

      #5;
      data_addr   <= 32'h1F80_10F0;
      data_data_i <= 32'h0FED_CBA9;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h1F80_10E0;
      data_data_i <= 32'h0012_1A04;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      
      #5;
      data_addr   <= 32'h1F80_10E4;
      data_data_i <= 32'h0000_0400;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h1F80_10E8;
      data_data_i <= 32'b0001_0001_0000_0000_0000_0000_0000_0010;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      
      repeat (2400) begin
	 @ (posedge clk);
      end
      
      #5;
      data_addr <= 32'h0012_1A04;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;

      #5;
      data_addr <= 32'h0012_1A00;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;

      #5;
      data_addr <= 32'h0012_19FC;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;

      repeat (11060) begin
	 @ (posedge clk);
      end

      /* PUT DATA IN ORDERED TABLE */     
      #5;
      data_addr   <= 32'h0012_19FC;
      data_data_i <= 32'h0012_1A08;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h0012_1A08;
      data_data_i <= 32'h0512_0A08;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h0012_1A0C;
      data_data_i <= 32'h2800_0000;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h0012_1A10;
      data_data_i <= 32'h0000_0000;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h0012_1A14;
      data_data_i <= 32'h0000_0280;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h0012_1A18;
      data_data_i <= 32'h01E0_0000;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h0012_1A1C;
      data_data_i <= 32'h01E0_0280;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      
      repeat (200) begin
	 @ (posedge clk);
      end

      #5;
      data_addr   <= 32'h1F80_10A0;
      data_data_i <= 32'h0012_1A04;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      
      #5;
      data_addr   <= 32'h1F80_10A4;
      data_data_i <= 32'h0000_0400;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr   <= 32'h1F80_10A8;
      data_data_i <= 32'b0000_0001_0000_0000_0000_0100_0000_0001;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;
      
      repeat (400) begin
	 @ (posedge clk);
      end

      #5;
      data_addr   <= 32'h1F80_1810;
      data_data_i <= 32'hA5A5_A5A5;
      #5;
      data_wen <= 4'b1111;
      while (~data_ack) #5;
      data_wen <= 4'b0;
      while (data_ack) #5;

      #5;
      data_addr <= 32'h1F80_1810;
      #5;
      data_ren <= 1'b1;
      while (~data_ack) #5;
      data_ren <= 1'b0;
      while (data_ack) #5;

      repeat (200) begin
	 @ (posedge clk);
      end
      
      $finish;
   end // initial begin

endmodule // dma_sim
