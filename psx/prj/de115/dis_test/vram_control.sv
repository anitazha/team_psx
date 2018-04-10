
module vram_control(
		    input logic 	clk_100MHz, rst,
		    input logic 	color_mode,
		    input logic 	GPU_we, GPU_re,
		    input logic 	VGA_re, VGA_ctrl,
		    input logic [9:0] 	x_tl, y_tl, dis_w,
		    input logic [18:0] 	GPU_addr,
		    input logic [18:0] 	VGA_addr,
		    input wire [15:0] 	GPU_data_in,
		    input wire [15:0] 	sram_dq_in,
		    output logic [15:0] sram_dq_out,
		    output logic [15:0] GPU_data_out,
		    output logic [23:0] VGA_data,
		    output logic 	GPU_en,
		    output logic [19:0] SRAM_ADDR,
		    output logic 	SRAM_CE_N, SRAM_OE_N,
		    output logic 	SRAM_LB_N, SRAM_UB_N,
		    output logic 	SRAM_WE_N);
   
   /* Internal Lines */
   logic [2:0] 				counter;
   
   logic [31:0] 			VGA_data_hold;
   logic 				GPU_data_ld, VGA_data_low_ld, VGA_data_high_ld;
   logic [18:0] 			VGA_addr_t;
   logic [1:0] 				count_24, count_24_next;
   
   logic [1:0][9:0] 			hold_x, hold_x_new;
   logic 				GPU_en_next;
   
   /* Enable and set SRAM up correctly */
   assign SRAM_CE_N = 1'b0;
   assign SRAM_UB_N = 1'b0;
   assign SRAM_LB_N = 1'b0;
   
   /* Handle VGA data out */
   assign VGA_data = ((color_mode) ? 
		      ((VGA_addr[0]) ? VGA_data_hold[31:8] : VGA_data_hold[23:0]) : 
		      {VGA_data_hold[14:10], 3'b0, VGA_data_hold[9:5], 3'b0, 
		       VGA_data_hold[4:0], 3'b0});
   
   /* Counter reg */
   always_ff @(posedge clk_100MHz, posedge rst) begin
      if (rst) begin
	 counter <= 3'd0;
      end
      else begin
	 if (counter == 3'd5) begin
	    counter <= 3'd0;
	 end
	 else begin
	    counter <= counter + 3'd1;
	 end
      end
   end
   
   /* Hold X register */
   always_ff @(posedge clk_100MHz, posedge rst) begin
      if (rst) begin
	 hold_x <= 20'hFFFF;
      end
      else begin
	 hold_x <= hold_x_new;
      end
   end
   
   /* GPU+VGA output latch */
   always_ff @(posedge clk_100MHz, posedge rst) begin
      if (rst) begin
	 GPU_data_out <= 16'd0;
	 VGA_data_hold <= 32'd0;
      end
      else begin
	 if (GPU_data_ld) begin
	    GPU_data_out <= sram_dq_in;
	 end
	 if (VGA_data_low_ld) begin
	    VGA_data_hold[15:0] <= sram_dq_in;
	 end
	 if (VGA_data_high_ld) begin
	    VGA_data_hold[31:16] <= sram_dq_in;
	 end
      end // else: !if(rst)
   end // always_ff @
   
   /* GPU enable register */
   always_ff @(posedge clk_100MHz, posedge rst) begin
      if (rst) begin
	 GPU_en <= 1'b1;
      end
      else begin
	 GPU_en <= GPU_en_next;
      end
   end
   
   /* 24-bit read control register */
   always_ff @(posedge clk_100MHz, posedge rst) begin
      if (rst) begin
	 count_24 <= 2'd0;
      end
      else begin
	 count_24 <= count_24_next;
      end
   end
   
   /* Count logic to determine loads and stores */
   always_comb begin
      /* Defaults */
      SRAM_ADDR = 19'd0;
      SRAM_WE_N = 1'b1;
      SRAM_OE_N = 1'b1;
      sram_dq_out = 16'd0;
      
      hold_x_new[0] = hold_x[1];
      hold_x_new[1] = VGA_addr[9:0];
      
      count_24_next = 2'd0;
      VGA_addr_t = VGA_addr;
      
      GPU_data_ld = 1'b0;
      VGA_data_low_ld = 1'b0;
      VGA_data_high_ld = 1'b0;
      
      GPU_en_next = GPU_en;
      
      if ((VGA_ctrl & counter == 0)) begin
	 GPU_en_next = 1'b0;
      end
      else if (~VGA_ctrl) begin
	 GPU_en_next = 1'b1;
      end
      
      if (VGA_re) begin
	 if (~color_mode) begin
	    VGA_data_low_ld = 1'b1;
	    SRAM_ADDR = {1'b0, VGA_addr};
	    SRAM_OE_N = 1'b0;
	 end
	 else begin
	    count_24_next = count_24 + 2'd1;
	    case (count_24)
	      2'd0, 2'd1: begin
		 VGA_data_low_ld = 1'b1;
		 VGA_addr_t[9:0] = VGA_addr[9:0] + (VGA_addr[9:0] >> 'd1);
		 SRAM_OE_N = 1'b0;
		 SRAM_ADDR = {1'b0, VGA_addr_t};
	      end
	      2'd2, 2'd3: begin
		 VGA_data_high_ld = 1'b1;
		 VGA_addr_t[9:0] = VGA_addr[9:0] + (VGA_addr[9:0] >> 'd1) + 10'd1;
		 SRAM_OE_N = 1'b0;
		 SRAM_ADDR = {1'b0, VGA_addr_t};
	      end
	    endcase
	 end
      end
      else begin
	 case (counter)
	   3'd0, 3'd1: begin
	      if (GPU_re) begin
		 GPU_data_ld = 1'b1;
		 SRAM_ADDR = {1'b0, GPU_addr};
		 SRAM_OE_N = 1'b0;
	      end
	      else if (GPU_we) begin
		 SRAM_ADDR = {1'b0, GPU_addr};
		 SRAM_WE_N = 1'b0;
		 sram_dq_out = GPU_data_in;
	      end
	   end
	   3'd4, 3'd5: begin
	      if (GPU_re) begin
		 GPU_data_ld = 1'b1;
		 SRAM_ADDR = {1'b0, GPU_addr};
		 SRAM_OE_N = 1'b0;
	      end
	      else if (GPU_we) begin
		 SRAM_ADDR = {1'b0, GPU_addr};
		 SRAM_WE_N = 1'b0;
		 sram_dq_out = GPU_data_in;
	      end
	   end
	   default: begin
	   end
	 endcase // case (counter)
      end
   end // always_comb
   
endmodule // vram_control

	      
