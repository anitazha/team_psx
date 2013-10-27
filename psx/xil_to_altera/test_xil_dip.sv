module test_xil_dip(input logic clk, rst
		    input logic [7:0] 	GPIO_DIP,
		    input logic 	rdy_for_data,
		    output logic 	data_rdy,
		    output logic [31:0] data_in);

   /* states */
   localparam WAIT = 2'b01;
   localparam TIP  = 2'b10;
   

   reg [1:0] 				curr_state, next_state;
   reg 					data_rdy_o;
   reg [7:0] 				data_in_o;

   assign data_rdy = data_rdy_o;
   assign data_in = data_in_o;
   
   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state = WAIT;
      end
      else begin
	 curr_state = next_state;
      end
   end
     
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state = curr_state;

      data_rdy_o = 1'b0;
      data_in_o = 8'd0;
      
      case (curr_state)
	WAIT: begin
	   if (rdy_for_data) begin
	      data_rdy_o = 1'b1;
	      data_in_o = GPIO_DIP;
	      next_state = WAIT;
	   end
	   else begin
	      next_state = TIP;
	   end
	end

	TIP: begin
	   if (~rdy_for_data) begin
	      next_state = WAIT;
	   end
	   else begin
	      next_state = TIP;
	   end
	end
      endcase // case (curr_state)
   end // always_comb

endmodule // test_xil_dip
