
module vram(
	    input bit 	       clk_53_2MHz, rst,
	    input bit [8:0]    line,
	    input bit [11:0]   col,
	    input bit [3:0]    mode,
	    input bit 	       we, re,
	    inout logic [23:0] data);

   /* Parameters */
   localparam VRAM_SIZE 4096*512;
   
   /* Internal Lines */
   bit [3:0] 		       vram_mem[VRAM_SIZE];
   bit [20:0] 		       vram_addr;
   integer 		       i;
   
   
   /* VRMA Memory */
   always_ff @(posedge clk_53_2MHz, posedge rst) begin
      if (rst) begin
	 for (i = 0; i < VRAM_SIZE; i++) begin
	    vram_mem[i] <= 4'b0;
	 end
      end
      else begin
	 /* Write the data if write enable */
	 if (we) begin
	    vram_mem[vram_addr] <= data[3:0];
	    if (mode > 4'd1) begin
	       vram_mem[vram_addr + 'd1] <= data[7:4];
	       if (mode > 4'd2) begin
		  vram_mem[vram_addr + 'd2] <= data[11:8];
		  vram_mem[vram_addr + 'd3] <= data[15:12];
		  if (mode > 4'd4) begin
		     vram_mem[vram_addr + 'd4] <= data[19:16];
		     vram_mem[vram_addr + 'd5] <= data[23:20];
		  end
	       end
	    end // if (mode > 4'd1)
	 end
      end // else: !if(rst)
   end // always_ff @

   /* VRAM Address Logic */
   always_comb begin
      /* Defaults */
      vram_addr = 21'h0;

      /* 24-bit addressing, not the same transform */
      if (mode[3]) begin
	 vram_addr = {line, (col * 6)};
      end
      else begin
	 vram_addr = {line, (col << mode)};
      end
   end // always_comb

   /* Output logic */
   always_comb begin
      /* Defaults */
      data = 24'dz;

      /* Get the data if read enable */
      if (re) begin
	 data[3:0] = vram_mem[vram_addr];
	 data[7:4] = vram_mem[vram_addr + 'd1];
	 data[11:8] = vram_mem[vram_addr + 'd2];
	 data[15:12] = vram_mem[vram_addr + 'd3];
	 data[19:16] = vram_mem[vram_addr + 'd4];
	 data[23:20] = vram_mem[vram_addr + 'd5];
      end
   end // always_comb

endmodule // vram
