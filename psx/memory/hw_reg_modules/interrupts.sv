
module psx_interrupts(input logic sys_clk, rst,
                      input logic         wen,
                      input logic [1:0]   ben,
                      input logic         irq_vblank,
                      input logic         irq_gpu,
                      input logic         irq_cdrom,
                      input logic         irq_dma,
                      input logic         irq_timer0,
                      input logic         irq_timer1,
                      input logic         irq_timer2,
                      input logic         irq_ctlmem,
                      input logic         irq_sio,
                      input logic         irq_spu,
                      input logic         irq_ctrl,
                      input logic         addr,
                      input logic [15:0]  data_i,
                      output logic [31:0] stat_o,
                      output logic [31:0] mask_o);

   
   /* Internal Lines */
   reg        stat_vblank, wait_vblank, next_wait_vblank, next_stat_vblank;
   reg        stat_gpu, wait_gpu, next_wait_gpu, next_stat_gpu;
   reg        stat_cdrom, wait_cdrom, next_wait_cdrom, next_stat_cdrom;
   reg        stat_dma, wait_dma, next_wait_dma, next_stat_dma;
   reg        stat_timer0, wait_timer0, next_wait_timer0, next_stat_timer0;
   reg        stat_timer1, wait_timer1, next_wait_timer1, next_stat_timer1;
   reg        stat_timer2, wait_timer2, next_wait_timer2, next_stat_timer2;
   reg        stat_ctlmem, wait_ctlmem, next_wait_ctlmem, next_stat_ctlmem;
   reg        stat_sio, wait_sio, next_wait_sio, next_stat_sio;
   reg        stat_spu, wait_spu, next_wait_spu, next_stat_spu;
   reg        stat_ctrl, wait_ctrl,next_wait_ctrl, next_stat_ctrl;
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
         wait_vblank <= 1'b0;
      end
      else begin
         stat_vblank <= next_stat_vblank;
         wait_vblank <= next_wait_vblank;
      end
   end
   always_comb begin
      next_stat_vblank = stat_vblank;
      next_wait_vblank = wait_vblank;

      if (wait_vblank && ~irq_vblank) begin
         next_wait_vblank = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_vblank = stat_vblank & data_i[0];
         end
         else begin
            if (irq_vblank) begin
               next_stat_vblank = 1'b1;
               next_wait_vblank = 1'b1;
            end
         end
      end
   end

   /* GPU */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_gpu <= 1'b0;
         wait_gpu <= 1'b0;
      end
      else begin
         stat_gpu <= next_stat_gpu;
         wait_gpu <= next_wait_gpu;
      end
   end
   always_comb begin
      next_stat_gpu = stat_gpu;
      next_wait_gpu = wait_gpu;

      if (wait_gpu && ~irq_gpu) begin
         next_wait_gpu = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_gpu = stat_gpu & data_i[1];
         end
         else begin
            if (irq_gpu) begin
               next_stat_gpu = 1'b1;
               next_wait_gpu = 1'b1;
            end
         end
      end
   end
   
   /* CDROM */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_cdrom <= 1'b0;
         wait_cdrom <= 1'b0;
      end
      else begin
         stat_cdrom <= next_stat_cdrom;
         wait_cdrom <= next_wait_cdrom;
      end
   end
   always_comb begin
      next_stat_cdrom = stat_cdrom;
      next_wait_cdrom = wait_cdrom;

      if (wait_cdrom && ~irq_cdrom) begin
         next_wait_cdrom = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_cdrom = stat_cdrom & data_i[2];
         end
         else begin
            if (irq_cdrom) begin
               next_stat_cdrom = 1'b1;
               next_wait_cdrom = 1'b1;
            end
         end
      end
   end
   
   /* DMA */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_dma <= 1'b0;
         wait_dma <= 1'b0;
      end
      else begin
         stat_dma <= next_stat_dma;
         wait_dma <= next_wait_dma;
      end
   end
   always_comb begin
      next_stat_dma = stat_dma;
      next_wait_dma = wait_dma;

      if (wait_dma && ~irq_dma) begin
         next_wait_dma = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_dma = stat_dma & data_i[3];
         end
         else begin
            if (irq_dma) begin
               next_stat_dma = 1'b1;
               next_wait_dma = 1'b1;
            end
         end
      end
   end

   /* TIMER 0 */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_timer0 <= 1'b0;
         wait_timer0 <= 1'b0;
      end
      else begin
         stat_timer0 <= next_stat_timer0;
         wait_timer0 <= next_wait_timer0;
      end
   end
   always_comb begin
      next_stat_timer0 = stat_timer0;
      next_wait_timer0 = wait_timer0;

      if (wait_timer0 && ~irq_timer0) begin
         next_wait_timer0 = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_timer0 = stat_timer0 & data_i[4];
         end
         else begin
            if (irq_timer0) begin
               next_stat_timer0 = 1'b1;
               next_wait_timer0 = 1'b1;
            end
         end
      end
   end
   
   /* TIMER 1 */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_timer1 <= 1'b0;
         wait_timer1 <= 1'b0;
      end
      else begin
         stat_timer1 <= next_stat_timer1;
         wait_timer1 <= next_wait_timer1;
      end
   end
   always_comb begin
      next_stat_timer1 = stat_timer1;
      next_wait_timer1 = wait_timer1;

      if (wait_timer1 && ~irq_timer1) begin
         next_wait_timer1 = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_timer1 = stat_timer1 & data_i[5];
         end
         else begin
            if (irq_timer1) begin
               next_stat_timer1 = 1'b1;
               next_wait_timer1 = 1'b1;
            end
         end
      end
   end
   
   /* TIMER 2 */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_timer2 <= 1'b0;
         wait_timer2 <= 1'b0;
      end
      else begin
         stat_timer2 <= next_stat_timer2;
         wait_timer2 <= next_wait_timer2;
      end
   end
   always_comb begin
      next_stat_timer2 = stat_timer2;
      next_wait_timer2 = wait_timer2;

      if (wait_timer2 && ~irq_timer2) begin
         next_wait_timer2 = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_timer2 = stat_timer2 & data_i[6];
         end
         else begin
            if (irq_timer2) begin
               next_stat_timer2 = 1'b1;
               next_wait_timer2 = 1'b1;
            end
         end
      end
   end
   
   /* CONTROLLER & MEMORY CARDS */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_ctlmem <= 1'b0;
         wait_ctlmem <= 1'b0;
      end
      else begin
         stat_ctlmem <= next_stat_ctlmem;
         wait_ctlmem <= next_wait_ctlmem;
      end
   end
   always_comb begin
      next_stat_ctlmem = stat_ctlmem;
      next_wait_ctlmem = wait_ctlmem;

      if (wait_ctlmem && ~irq_ctlmem) begin
         next_wait_ctlmem = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[0]) begin
            next_stat_ctlmem = stat_ctlmem & data_i[7];
         end
         else begin
            if (irq_ctlmem) begin
               next_stat_ctlmem = 1'b1;
               next_wait_ctlmem = 1'b1;
            end
         end
      end
   end
   
   /* SIO */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_sio <= 1'b0;
         wait_sio <= 1'b0;
      end
      else begin
         stat_sio <= next_stat_sio;
         wait_sio <= next_wait_sio;
      end
   end
   always_comb begin
      next_stat_sio = stat_sio;
      next_wait_sio = wait_sio;

      if (wait_sio && ~irq_sio) begin
         next_wait_sio = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[1]) begin
            next_stat_sio = stat_sio & data_i[8];
         end
         else begin
            if (irq_sio) begin
               next_stat_sio = 1'b1;
               next_wait_sio = 1'b1;
            end
         end
      end
   end

   /* SPU */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_spu <= 1'b0;
         wait_spu <= 1'b0;
      end
      else begin
         stat_spu <= next_stat_spu;
         wait_spu <= next_wait_spu;
      end
   end
   always_comb begin
      next_stat_spu = stat_spu;
      next_wait_spu = wait_spu;

      if (wait_spu && ~irq_spu) begin
         next_wait_spu = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[1]) begin
            next_stat_spu = stat_spu & data_i[9];
         end
         else begin
            if (irq_spu) begin
               next_stat_spu = 1'b1;
               next_wait_spu = 1'b1;
            end
         end
      end
   end
   
   /* CONTROLLER - LIGHTPEN */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         stat_ctrl <= 1'b0;
         wait_ctrl <= 1'b0;
      end
      else begin
         stat_ctrl <= next_stat_ctrl;
         wait_ctrl <= next_wait_ctrl;
      end
   end
   always_comb begin
      next_stat_ctrl = stat_ctrl;
      next_wait_ctrl = wait_ctrl;

      if (wait_ctrl && ~irq_ctrl) begin
         next_wait_ctrl = 1'b0;
      end
      else begin
         if (wen && in_stat && ben[1]) begin
            next_stat_ctrl = stat_ctrl & data_i[10];
         end
         else begin
            if (irq_ctrl) begin
               next_stat_ctrl = 1'b1;
               next_wait_ctrl = 1'b1;
            end
         end
      end
   end
   
   /* Interrupt Mask */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         mask_out <= 10'b0;
      end
      else begin
         if (wen && in_mask) begin
            if (ben[0]) mask_out[7:0] <= data_i[7:0];
            if (ben[1]) mask_out[10:8] <= data_i[10:8];
         end
      end
   end

endmodule // psx_interrupts
