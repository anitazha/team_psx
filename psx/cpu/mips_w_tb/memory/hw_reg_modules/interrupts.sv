
module psx_interrupts(input logic sys_clk, rst,
		      input logic 	  wen,
		      input logic [1:0]   ben,
		      input logic 	  irq_vblank,
		      input logic 	  irq_gpu,
		      input logic 	  irq_cdrom,
		      input logic 	  irq_dma,
		      input logic 	  irq_timer0,
		      input logic 	  irq_timer1,
		      input logic 	  irq_timer2,
		      input logic 	  irq_ctlmem,
		      input logic 	  irq_sio,
		      input logic 	  irq_spu,
		      input logic 	  irq_ctrl,
		      input logic 	  addr,
		      input logic [15:0]  data_i,
		      output logic [31:0] stat_o,
		      output logic [31:0] mask_o);

   
   /* Internal Lines */
   reg        stat_vblank, set_vblank, wait_vblank;
   reg 	      stat_gpu,    set_gpu   , wait_gpu;
   reg 	      stat_cdrom,  set_cdrom , wait_cdrom;
   reg 	      stat_dma,    set_dma   , wait_dma;
   reg 	      stat_timer0, set_timer0, wait_timer0;
   reg 	      stat_timer1, set_timer1, wait_timer1;
   reg 	      stat_timer2, set_timer2, wait_timer2;
   reg 	      stat_ctlmem, set_ctlmem, wait_ctlmem;
   reg 	      stat_sio,    set_sio   , wait_sio;
   reg 	      stat_spu,    set_spu   , wait_spu;
   reg 	      stat_ctrl,   set_ctrl  , wait_ctrl;
   reg [10:0] mask_out;

   wire       in_stat, in_mask;

   assign stat_o = {16'b0, 5'b0,
		    stat_ctrl,   stat_spu,    stat_sio,    stat_ctlmem,
		    stat_timer2, stat_timer1, stat_timer0, stat_dma,
		    stat_cdrom,  stat_gpu,    stat_vblank};   
   assign mask_o = {16'b0, 5'b0, mask_out};
   assign in_stat = ~addr;
   assign in_mask = addr;

   /* VBLANK */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_vblank <= 1'b0;
	 set_vblank <= 1'b0;
	 wait_vblank <= 1'b0;
      end
      else begin
	 if (wait_vblank) begin
	    if (irq_vblank) begin
	       wait_vblank <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_vblank <= stat_vblank & data_i[0];
	       if (~data_i[0]) wait_vblank <= 1'b1;
	    end
	    else begin
	       if (irq_vblank && set_vblank && ~stat_vblank) begin
		  set_vblank <= 1'b0;
	       end
	       else if (~irq_vblank && ~set_vblank && mask_out[0]) begin
		  stat_vblank <= 1'b1;
		  set_vblank <= 1'b1;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_vblank)

   /* GPU */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_gpu <= 1'b0;
	 set_gpu <= 1'b0;
	 wait_gpu <= 1'b0;
      end
      else begin
	 if (wait_gpu) begin
	    if (irq_gpu) begin
	       wait_gpu <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_gpu <= stat_gpu & data_i[1];
	       if (~data_i[1]) wait_gpu <= 1'b1;
	    end
	    else begin
	       if (irq_gpu && set_gpu && ~stat_gpu) begin
		  set_gpu <= 1'b0;
	       end
	       else if (~irq_gpu && ~set_gpu && mask_out[1]) begin
		  stat_gpu <= 1'b1;
		  set_gpu <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_gpu)

   /* CDROM */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_cdrom <= 1'b0;
	 set_cdrom <= 1'b0;
	 wait_cdrom <= 1'b0;
      end
      else begin
	 if (wait_cdrom) begin
	    if (irq_cdrom) begin
	       wait_cdrom <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_cdrom <= stat_cdrom & data_i[2];
	       if (~data_i[2]) wait_cdrom <= 1'b1;
	    end
	    else begin
	       if (irq_cdrom && set_cdrom && ~stat_cdrom) begin
		  set_cdrom <= 1'b0;
	       end
	       else if (~irq_cdrom && ~set_cdrom && mask_out[2]) begin
		  stat_cdrom <= 1'b1;
		  set_cdrom <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_cdrom)

   /* DMA */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_dma <= 1'b0;
	 set_dma <= 1'b0;
	 wait_dma <= 1'b0;
      end
      else begin
	 if (wait_dma) begin
	    if (irq_dma) begin
	       wait_dma <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_dma <= stat_dma & data_i[3];
	       if (~data_i[3]) wait_dma <= 1'b1;
	    end
	    else begin
	       if (irq_dma && set_dma && ~stat_dma) begin
		  set_dma <= 1'b0;
	       end
	       else if (~irq_dma && ~set_dma && mask_out[3]) begin
		  stat_dma <= 1'b1;
		  set_dma <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_dma)

   /* TIMER 0 */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_timer0 <= 1'b0;
	 set_timer0 <= 1'b0;
	 wait_timer0 <= 1'b0;
      end
      else begin
	 if (wait_timer0) begin
	    if (irq_timer0) begin
	       wait_timer0 <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_timer0 <= stat_timer0 & data_i[4];
	       if (~data_i[4]) wait_timer0 <= 1'b1;
	    end
	    else begin
	       if (irq_timer0 && set_timer0 && ~stat_timer0) begin
		  set_timer0 <= 1'b0;
	       end
	       else if (~irq_timer0 && ~set_timer0 && mask_out[4]) begin
		  stat_timer0 <= 1'b1;
		  set_timer0 <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_timer0)

   /* TIMER 1 */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_timer1 <= 1'b0;
	 set_timer1 <= 1'b0;
	 wait_timer1 <= 1'b0;
      end
      else begin
	 if (wait_timer1) begin
	    if (irq_timer1) begin
	       wait_timer1 <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_timer1 <= stat_timer1 & data_i[5];
	       if (~data_i[5]) wait_timer1 <= ~stat_timer1 & ~data_i[5];
	    end
	    else begin
	       if (irq_timer1 && set_timer1 && ~stat_timer1) begin
		  set_timer1 <= 1'b0;
	       end
	       else if (~irq_timer1 && ~set_timer1 && mask_out[5]) begin
		  stat_timer1 <= 1'b1;
		  set_timer1 <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_timer1)

   /* TIMER 2 */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_timer2 <= 1'b0;
	 set_timer2 <= 1'b0;
	 wait_timer2 <= 1'b0;
      end
      else begin
	 if (wait_timer2) begin
	    if (irq_timer2) begin
	       wait_timer2 <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_timer2 <= stat_timer2 & data_i[6];
	       if (~data_i[6]) wait_timer2 <= 1'b1;
	    end
	    else begin
	       if (irq_timer2 && set_timer2 && ~stat_timer2) begin
		  set_timer2 <= 1'b0;
	       end
	       else if (~irq_timer2 && ~set_timer2 && mask_out[6]) begin
		  stat_timer2 <= 1'b1;
		  set_timer2 <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_timer2)

   /* CONTROLLER & MEMORY CARD */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_ctlmem <= 1'b0;
	 set_ctlmem <= 1'b0;
	 wait_ctlmem <= 1'b0;
      end
      else begin
	 if (wait_ctlmem) begin
	    if (irq_ctlmem) begin
	       wait_ctlmem <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[0]) begin
	       stat_ctlmem <= stat_ctlmem & data_i[7];
	       if (~data_i[7]) wait_ctlmem <= 1'b1;
	    end
	    else begin
	       if (irq_ctlmem && set_ctlmem && ~stat_ctlmem) begin
		  set_ctlmem <= 1'b0;
	       end
	       else if (~irq_ctlmem && ~set_ctlmem && mask_out[7]) begin
		  stat_ctlmem <= 1'b1;
		  set_ctlmem <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_ctlmem)

   /* SIO */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_sio <= 1'b0;
	 set_sio <= 1'b0;
	 wait_sio <= 1'b0;
      end
      else begin
	 if (wait_sio) begin
	    if (irq_sio) begin
	       wait_sio <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[1]) begin
	       stat_sio <= stat_sio & data_i[8];
	       if (~data_i[8]) wait_sio <= 1'b1;
	    end
	    else begin
	       if (irq_sio && set_sio && ~stat_sio) begin
		  set_sio <= 1'b0;
	       end
	       else if (~irq_sio && ~set_sio && mask_out[8]) begin
		  stat_sio <= 1'b1;
		  set_sio <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_sio)

   /* SPU */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_spu <= 1'b0;
	 set_spu <= 1'b0;
	 wait_spu <= 1'b0;
      end
      else begin
	 if (wait_spu) begin
	    if (irq_spu) begin
	       wait_spu <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[1]) begin
	       stat_spu <= stat_spu & data_i[9];
	       if (~data_i[9]) wait_spu <= 1'b1;
	    end
	    else begin
	       if (irq_spu && set_spu && ~stat_spu) begin
		  set_spu <= 1'b0;
	       end
	       else if (~irq_spu && ~set_spu && mask_out[9]) begin
		  stat_spu <= 1'b1;
		  set_spu <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_spu)

   /* CONTROLLER */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 stat_ctrl <= 1'b0;
	 set_ctrl <= 1'b0;
	 wait_ctrl <= 1'b0;
      end
      else begin 
	 if (wait_ctrl) begin
	    if (irq_ctrl) begin
	       wait_ctrl <= 1'b0;
	    end
	 end
	 else begin 
	    if (wen && in_stat && ben[1]) begin
	       stat_ctrl <= stat_ctrl & data_i[10];
	       if (~data_i[10]) wait_ctrl <= 1'b1;
	    end
	    else begin
	       if (irq_ctrl && set_ctrl && ~stat_ctrl) begin
		  set_ctrl <= 1'b0;
	       end
	       else if (~irq_ctrl && ~set_ctrl && mask_out[10]) begin
		  stat_ctrl <= 1'b1;
		  set_ctrl <= 1'b0;
	       end
	    end
	 end
      end
   end // always @ (negedge irq_ctrl)


   /* Interrupt Mask */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 mask_out <= 10'b0;
      end
      else begin
	 if (wen && in_mask) begin
	    if (ben[0]) begin
	       mask_out[7:0] <= data_i[7:0];
	    end
	    if (ben[1]) begin
	       mask_out[10:8] <= data_i[10:8];
	    end
	 end
      end
   end

endmodule // psx_interrupts
