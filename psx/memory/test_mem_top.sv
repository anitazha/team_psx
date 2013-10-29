

module test_mem_top(input wire RESET, SYSCLK_P, SYSCLK_N,
		    //input logic 	BN, BW, BC, BE, BS,
		    input logic [7:0] 	GPIO_DIP,
		    output logic [7:0] 	GPIO_LED_LS,

		    /* DDR3 Interface */
		    inout logic [63:0] 	ddr3_dq,
		    inout logic [7:0] 	ddr3_dqs_n,
		    inout logic [7:0] 	ddr3_dqs_p,
		    output logic [13:0] ddr3_addr,
		    output logic [2:0] 	ddr3_ba,
		    output logic 	ddr3_ras_n,
		    output logic 	ddr3_cas_n,
		    output logic 	ddr3_we_n,
		    output logic 	ddr3_reset_n,
		    output logic 	ddr3_ck_p,
		    output logic 	ddr3_ck_n,
		    output logic 	ddr3_cke,
		    output logic 	ddr3_cs_n,
		    output logic [7:0] 	ddr3_dm,
		    output logic 	ddr3_odt);

   wire		clk, rst;
   wire 	done;
   wire [511:0] rd_data;
   wire [63:0] 	wr_data;
   wire [7:0] 	rd_data_byte[0:7];

   reg [7:0] 	GPIO_LED_LS_o;

   
   /* Clock Generation */
   IBUFDS #(.DIFF_TERM("TRUE"),
	    .IBUF_LOW_PWR("TRUE"),
	    .IOSTANDARD("DEFAULT"))
   clk_ibufds (.O(clk),
	       .I(SYSCLK_P),
	       .IB(SYSCLK_N));
   
   
   /* memory module */
   mem_test DDR3(.*);
   
   assign rst = RESET;

   assign rd_data_byte[0] = rd_data[7:0];
   assign rd_data_byte[1] = rd_data[71:64];
   assign rd_data_byte[2] = rd_data[135:128];
   assign rd_data_byte[3] = rd_data[199:192];
   assign rd_data_byte[4] = rd_data[263:256];
   assign rd_data_byte[5] = rd_data[327:320];
   assign rd_data_byte[6] = rd_data[391:384];
   assign rd_data_byte[7] = rd_data[455:448];
   
   assign GPIO_LED_LS = GPIO_LED_LS_o;
   
   always @ (posedge clk) begin
      if (GPIO_DIP == 8'b0000_0001) begin
	 GPIO_LED_LS_o <= rd_data_byte[0];
      end
      else if (GPIO_DIP == 8'b0000_0010) begin
	 GPIO_LED_LS_o <= rd_data_byte[1];
      end
      else if (GPIO_DIP == 8'b0000_0100) begin
	 GPIO_LED_LS_o <= rd_data_byte[2];
      end
      else if (GPIO_DIP == 8'b0000_1000) begin
	 GPIO_LED_LS_o <= rd_data_byte[3];
      end
      else if (GPIO_DIP == 8'b0001_0000) begin
	 GPIO_LED_LS_o <= rd_data_byte[4];
      end
      else if (GPIO_DIP == 8'b0010_0000) begin
	 GPIO_LED_LS_o <= rd_data_byte[5];
      end
      else if (GPIO_DIP == 8'b0100_0000) begin
	 GPIO_LED_LS_o <= rd_data_byte[6];
      end
      else if (GPIO_DIP == 8'b1000_0000) begin
	 GPIO_LED_LS_o <= rd_data_byte[7];
      end
      
      else begin
	 GPIO_LED_LS_o <= {done, rst, 3'b0, ddr3_ba};
      end 
   end // always @ (posedge clk)
   
endmodule // test_mem_top

   
		    
