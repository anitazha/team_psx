
module tb;

   logic        clk, rst;
   logic 	to_gp0, to_gp1;

   logic 	main_bus_re;
   logic 	gpu_en;

   logic [31:0] main_bus;
   logic [15:0] vram_bus_in;
   logic [15:0] vram_bus_out;
   logic [18:0] vram_addr;
   logic [31:0] gpu_stat, gpu_read;

   logic 	main_bus_rdy;
   logic 	fifo_full;
   logic 	vram_re, vram_we;
   logic [9:0] 	display_x, display_y, display_w, display_h;
   logic 	display_color_mode, display_enable;

   logic [15:0] vram[0:511][0:1023];

   integer 	i, j;
   integer 	k;
   
   /* GPU module */
   gpu gp(.*);

   /* VRAM */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 for (i = 0; i < 512; i = i + 1) begin
	    for (j = 0; j < 1024; j = j +1) begin
	       vram[i][j] <= 16'd0;
	    end
	 end
      end
      else begin
	 if (vram_we) begin
	    vram[vram_addr[18:10]][vram_addr[9:0]] <= vram_bus_out;
	 end
      end // else: !if(rst)
   end // always @ (posedge clk, posedge rst)

   assign vram_bus_in = vram[vram_addr[18:10]][vram_addr[9:0]];

   /* Clock generator */
   initial begin
      clk = 1'b0;
      forever #5 clk = ~clk;
   end

   /* Reseter */
   initial begin
      rst = 1'b1;
      #17;
      rst = 1'b0;
   end

   /* Debug */
   always @(posedge vram_we, negedge vram_we) begin
	  $stop;
   end
   
   /* Fake display reads */
   initial begin
      gpu_en = 1'b1;
      forever begin		 
		 repeat (10000) begin
			@(posedge clk);
		 end
		 gpu_en = 1'b0;
		 repeat (7000) begin
			@(posedge clk);
		 end
		 gpu_en = 1'b1;
      end
   end // initial begin

   /* Instruction inserter */
   enum logic [1:0] {FETCH, LOAD} inst_state, inst_state_n;
   logic [9:0] inst_addr, inst_addr_n;
   logic [11:0] inst_type, inst_type_n;
   logic [9:0] 	inst_count, inst_count_n;
   
   logic [31:0] inst_cache[0:1023];
   
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 inst_addr <= 10'd0;
	 inst_type <= 12'h178;
	 inst_state <= FETCH;
	 inst_count <= 10'd1000;
      end
      else begin
	 inst_addr <= inst_addr_n;
	 inst_type <= inst_type_n;
	 inst_state <= inst_state_n;
	 inst_count <= inst_count_n;
      end
   end // always @ (posedge clk, posedge rst)

   /* Instruction logic */
   always_comb begin
      inst_addr_n = inst_addr;
      inst_type_n = inst_type;
      inst_state_n = inst_state;
      inst_count_n = inst_count;
      
      to_gp0 = 1'b0;
      to_gp1 = 1'b0;
      main_bus = inst_cache[inst_addr];

      case (inst_state)
	FETCH: begin
	   if (inst_count != 10'd0) begin
	      if (~fifo_full) begin
		 inst_state_n = LOAD;
	      end
	   end
	end
	LOAD: begin
	   inst_state_n = FETCH;
	   inst_count_n = inst_count - 10'd1;

	   inst_type_n = inst_type >> 1;
	   inst_addr_n = inst_addr + 10'd1;
	   if (inst_type[0]) begin
	      to_gp1 = 1'b1;
	   end
	   else begin
	      to_gp0 = 1'b1;
	   end
	end // case: LOAD
      endcase // case (inst_state)
   end // always_comb

   /* Instruction cache */
   initial begin
      for (k = 0; k < 1024; k = k + 1) begin
	 inst_cache[k] = 32'd0;
      end
      $readmemh("prgm.sim", inst_cache);
   end

   /* Periodically, write back the vram to hex */
   string filename;
   integer t;
   
   initial begin
      t = 0;
      forever begin
	 #5000000;
	 t  = t + 1;
	 $sformat(filename, "vram_%0d.hex", (t*5000000));
	 $writememh(filename, vram);
      end
   end
   
   
endmodule // tb
