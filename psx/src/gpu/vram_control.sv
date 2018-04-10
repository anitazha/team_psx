`include "screen_settings.vh"

module vram_control(
		    input logic 	clk, rst,
		    input logic 	GPU_we, GPU_re,
		    input logic 	VGA_re,
		    input logic [18:0] 	GPU_addr,
		    input logic [8:0] 	VGA_y,
		    input logic [9:0] 	x_tl, dis_w,
		    input logic [15:0] 	GPU_data_in,
		    input logic [15:0] 	sram_dq_in,
		    output logic [15:0] sram_dq_out,
		    output logic [15:0] GPU_data_out,
		    output logic [23:0] VGA_data,
		    output logic 	VGA_we,
		    output logic [9:0] 	VGA_x,
		    output logic 	GPU_en,
		    output logic [19:0] SRAM_ADDR,
		    output logic 	SRAM_CE_N, SRAM_OE_N,
		    output logic 	SRAM_LB_N, SRAM_UB_N,
		    output logic 	SRAM_WE_N);
     
   /* Internal Lines */
   enum	logic {GPU_SERVICE, VGA_SERVICE} vram_state, vram_state_next;
   
   logic [9:0] 				VGA_x_next;
   logic [18:0] 			VGA_addr;
   logic [19:0] VGA_mult_x, VGA_mult_x_next;
	logic [9:0] VGA_int_x, VGA_int_x_next;
	logic [8:0] VGA_y_hold, VGA_y_hold_next;
	
   /* Enable and set SRAM up correctly */
   assign SRAM_CE_N = 1'b0;
   assign SRAM_UB_N = 1'b0;
   assign SRAM_LB_N = 1'b0;
   
   /* Handle VGA+GPU data out */
   assign GPU_data_out = (GPU_re) ? sram_dq_in : 16'd0;
   assign VGA_data = (VGA_re | VGA_we) ? {sram_dq_in[14:10], 3'b0, sram_dq_in[9:5], 3'b0, sram_dq_in[4:0], 3'b0} : 24'd0;
	
   always_ff @(posedge clk, posedge rst) begin
      if (rst) begin
	 vram_state <= GPU_SERVICE;
	 VGA_x <= 10'd0;
	 VGA_mult_x <= 20'd0;
	 VGA_int_x <= 10'd0;
	 VGA_y_hold <= 9'd0;
      end
      else begin
	 vram_state <= vram_state_next;
	 VGA_x <= VGA_x_next;
	 VGA_mult_x <= VGA_mult_x_next;
	 VGA_int_x <= VGA_int_x_next;
	 VGA_y_hold <= VGA_y_hold_next;
      end
   end
   
   /* Logic to determine loads and stores */
   always_comb begin
      /* Defaults */
      SRAM_ADDR = 19'd0;
      SRAM_WE_N = 1'b1;
      SRAM_OE_N = 1'b1;
      sram_dq_out = 16'd0;

      GPU_en = 1'b1;
      VGA_we = 1'b0;

      VGA_x_next = VGA_x;
      VGA_addr = 19'd0;
		VGA_mult_x_next = VGA_mult_x;
		VGA_int_x_next = VGA_int_x;
		VGA_y_hold_next = VGA_y_hold;

      vram_state_next = vram_state;
      
      case (vram_state)
	GPU_SERVICE: begin
	   /* Load a row from VRAM into the row hold if y changes */
	   if (VGA_re) begin
	      VGA_x_next = 10'b0;
	      vram_state_next = VGA_SERVICE;
			VGA_y_hold_next = VGA_y;
	   end
		
	   if (GPU_re) begin
	      SRAM_ADDR = {1'b0, GPU_addr};
	      SRAM_OE_N = 1'b0;
	   end
	   else if (GPU_we) begin
	      SRAM_ADDR = {1'b0, GPU_addr};
	      SRAM_WE_N = 1'b0;
	      sram_dq_out = GPU_data_in;
	   end
	end // case: GPU_SERVICE
	VGA_SERVICE: begin
	   GPU_en = 1'b0;
	   if (VGA_x == `SCREEN_W) begin
	      vram_state_next = GPU_SERVICE;
	   end
	   else begin
	      VGA_x_next = VGA_x + 10'd1;
	      VGA_we = 1'b1;

	      VGA_addr[18:10] = VGA_y_hold;
	      VGA_addr[9:0] = VGA_int_x;
			VGA_mult_x_next = ({10'd0, VGA_x} * {10'd0, dis_w});
			VGA_int_x_next = (VGA_mult_x / `SCREEN_W) + x_tl;
	      
	      SRAM_ADDR = {1'b0, VGA_addr};
	      SRAM_OE_N = 1'b0;
	   end
	end // case: VGA_SERVICE
      endcase   
   end // always_comb
   
endmodule // vram_control

	      
