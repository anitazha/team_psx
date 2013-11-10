
module blockram(input logic clk,
		input logic [16:0]  address,
		output logic [31:0] data);

   /* INTERNAL LINES */
   wire [31:0] data_256;
   wire [31:0] data_16_0, data_16_1, data_16_2, data_16_3,
	       data_16_4, data_16_5, data_16_6, data_16_7,
	       data_16_8, data_16_9;
	  
   reg [31:0]  data_o;
   
   assign data = data_o;   
     
   /* select the right data line depending on address */
   always @* begin
		if (address[16] == 1'b0) begin
			data_o <= data_256;
		end
		else begin
			if (address[15:12] == 4'b0000) begin
			 data_o <= data_16_0;
			end
			else if (address[15:12] == 4'b0001) begin
			 data_o <= data_16_1;
			end
			else if (address[15:12] == 4'b0010) begin
			 data_o <= data_16_2;
			end
			else if (address[15:12] == 4'b1001) begin
			 data_o <= data_16_3;
			end
			else if (address[15:12] == 4'b1010) begin
			 data_o <= data_16_4;
			end
			else if (address[15:12] == 4'b1011) begin
			 data_o <= data_16_5;
			end
			else if (address[15:12] == 4'b1100) begin
			 data_o <= data_16_6;
			end
			else if (address[15:12] == 4'b1101) begin
			 data_o <= data_16_7;
			end
			else if (address[15:12] == 4'b1110) begin
			 data_o <= data_16_8;
			end
			else if (address[15:12] == 4'b1111) begin
			 data_o <= data_16_9;
			end
			/* all omitted addresses are 0 */
			else begin
			 data_o <= 32'd0;
			end
		end
   end

   
   /* BLOCKRAM IP INSTANTIATION */
   blockram_256k b256(.clock   (clk),            // 0x00000 - 0x0FFFF
							 .address (address[15:0]),
							 .q       (data_256));
   blockram_16k_0 br0(.clock   (clk),            // 0x10000 - 0x10FFF
							 .address (address[11:0]),
							 .q       (data_16_0));
   blockram_16k_1 br1(.clock   (clk),            // 0x11000 - 0x11FFF
							 .address (address[11:0]),
							 .q       (data_16_1));
   blockram_16k_2 br2(.clock   (clk),            // 0x12000 - 0x12FFF
							 .address (address[11:0]),    /* All addresses in this */
							 .q       (data_16_2));       /* range are zero.       */
   blockram_16k_3 br3(.clock   (clk),            // 0x19000 - 0x19FFF
							 .address (address[11:0]),
							 .q       (data_16_3));
   blockram_16k_4 br4(.clock   (clk),            // 0x1A000 - 0x1AFFF
							 .address (address[11:0]),
							 .q       (data_16_4));
   blockram_16k_5 br5(.clock   (clk),            // 0x1B000 - 0x1BFFF
							 .address (address[11:0]),
							 .q       (data_16_5));
   blockram_16k_6 br6(.clock   (clk),            // 0x1C000 - 0x1CFFF
							 .address (address[11:0]),
							 .q       (data_16_6));
   blockram_16k_7 br7(.clock   (clk),            // 0x1D000 - 0x1DFFF
							 .address (address[11:0]),
							 .q       (data_16_7));
   blockram_16k_8 br8(.clock   (clk),            // 0x1E000 - 0x1EFFF
							 .address (address[11:0]),
							 .q       (data_16_8));
   blockram_16k_9 br9(.clock   (clk),            // 0x1F000 - 0x1FFFF
							 .address (address[11:0]),
							 .q       (data_16_9));

endmodule // altera_blockram
