
module blockram(input logic clk,
		input logic [16:0]  address,
		output logic [31:0] data);


   reg [31:0] bios[0:131071];

   initial $readmemh("SCPH7001.BIN", bios);

   always @(posedge clk) begin
      data <= bios[address];
   end

endmodule // blockram


   
