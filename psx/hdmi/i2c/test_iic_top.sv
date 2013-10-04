module test_top(
		input wire 	  RESET, SYSCLK_P, SYSCLK_N, B1, B2, B3, B4,
		inout wire 	  IIC_SDA,
		inout wire 	  IIC_SCL,
		output bit 	  IIC_RST,
		output bit [7:0]  GPIO_LED_LS);
   
   reg 				  clk, rst;
   reg 				  done;
   reg 				  slow_clk;
   reg [31:0] 			  counter;
   reg [7:0] 			  error, error_1, error_2, error_3;
   reg 				  tip_o;
   reg 				  skip;

   assign skip = B4;
   
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 counter <= 0;
      end
      else begin
	 counter <= counter + 1;
      end
   end

   assign slow_clk = counter[9];
   
   iic_config iic(.SDA(IIC_SDA), 
                  .SCL(IIC_SCL), 
                  .clk(slow_clk),
                  .*);
   
   IBUFDS #(.DIFF_TERM("TRUE"),
   	    .IBUF_LOW_PWR("TRUE"),
   	    .IOSTANDARD("DEFAULT"))
   clk_ibufds (.O(clk),
   	       .I(SYSCLK_P),
   	       .IB(SYSCLK_N));
   
   assign rst = RESET;

   assign GPIO_LED_LS = B1 ? error_1 : (B2 ? error_2 : (B3 ? error_3 : error));
   
   //assign GPIO_LED_LS[7] = IIC_SDA;
   //assign GPIO_LED_LS[6] = IIC_SCL;
   //assign GPIO_LED_LS[5:0] = error[5:0];
   //assign GPIO_LED_LS[4] = error;
   //assign GPIO_LED_LS[3] = RESET;
   //assign GPIO_LED_LS[2] = tip_o;
   //assign GPIO_LED_LS[1] = slow_clk;
   //assign GPIO_LED_LS[0] = IIC_RST;
   
   /*
   wire [127:0] 		  ila_data;
   wire [63:0] 			  ila_trig;

   assign ila_data[0]     = clk;
   assign ila_data[1]     = IIC_SDA;
   assign ila_data[2]     = IIC_SCL;
   assign ila_data[3]     = IIC_RST;
   assign ila_data[9:4]   = 0;
   assign ila_data[10]    = TIP_o;
   assign ila_data[11]    = ACK_o;
   assign ila_data[12]    = RESET;
   assign ila_data[13]    = done;
   assign ila_data[14]    = ACK_1;
   assign ila_data[15]    = ACK_2;
   assign ila_data[22:16] = 0;
   assign ila_data[23:20] = state;
   assign ila_data[37:30] = GPIO_LED_LS;
   assign ila_data[49:38] = 0;
   assign ila_data[50]    = SYSCLK_P;
   assign ila_data[51]    = SYSCLK_N;
   assign ila_data[127:52]= 0;
   assign ila_trig        = ila_data[63:0];
   
   
   wire [35:0] 			  control;
   assign control[3] = 1'b0;
   
   hdmi_icon icon(.CONTROL0(control));
   
   chipscope_ila ila(.CONTROL(control),
      		     .CLK(slow_clk),
      		     .DATA(ila_data),
      		     .TRIG0(ila_trig));
   
   
   initial begin
      clk <= 1'b0;
      forever #5 clk = ~clk;
   end
   
   initial begin
      rst <= 1'b0;
      #1;
      rst <= 1'b1;
      #3;
      rst <= 1'b0;
      repeat (7000000) begin
	 @(posedge clk);
      end
      $finish;
   end // initial begin */
 
endmodule // test_top
