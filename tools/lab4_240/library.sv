`include "constants.sv"
/*
 * File: library.v
 * Created: 11/13/1997
 * Modules contained: Memory_16bit, mux4to1, demux, tridrive, register, SevenSegmentControl
 * 
 * Changelog:
 * 17 November 2009: Minor modification to memory to facilitate synthesis (mcbender)
 * 4 November 2009: Modified spacing, parameterized remaining modules (mcbender)
 * 23 October 2009: Moved register file to regfile.v, renamed modules.v to library.v
 * 12 October 2009: Fixed a few minor typos, a few naming changes (mcbender)
 * 08 October 2009: Fixed minor errors, removed a few unneeded modules (mcbender)
 * 07 October 2009: Parameterized a few modules, added demux, modified reg file (mcbender)
 * 03 October 2009: Cleaned up module style, removed many old unused modules (mcbender)
 * 11/26/06: Removed old Altera-specific code that Xilinx tool had trouble with (P. Milder)
 * 4/16/2001: Reverted to base code. (verBurg)
 * 13 Oct 2010: Updated always to always_comb and always_ff.Renamed to.sv(abeera) 
 * 17 Oct 2010: Updated to use enums instead of define's (iclanton)
 * 9  Nov 2010: Slightly modified variable names. Changed array declaration per SV
 *              Modified mux to use enum(abeera)
 * 17 April 2013: Added mux8to1 to support regfile modifications (wnace)
 * 19 April 2013: Reworked the memory system to support multiple memory modules, memory mapped I/O, etc (wnace)
 * 25 April 2013: Changed always_ff to always when memory initialized
 *                Added a full sized memory module for simulation
 *                Replaced always_comb with assign for inout data (mromanko)
 *                
 */
 
// Comment this line when simulating, uncomment when synthesizing.
//`define synthesis

/*
 * module: memory256x16
 *
 * A memory "chip" consisting of 256 words of 16-bit memory.  It is
 * combinational read and synchronous write.
 *
 */
module memory256x16
  (input  logic          clock, enable,
   input  wr_cond_code_t we_L,
   input  rd_cond_code_t re_L,
   inout  [15:0]   data,
   input  logic  [7:0]   address);
   
  logic [15:0] mem [8'hFF];
  
  assign data = (enable & (re_L == MEM_RD)) ? mem[address] : 16'bz;
    
  always_ff @(posedge clock)
    if (enable & (we_L == MEM_WR))
      mem[address] <= data;
      
endmodule : memory256x16

/*
 * module: memory
 *
 *  This is a full sized memory for the p18240 and initialized with
 *  a memory.hex file.
 *
 */
module memory
  (input  logic          clock, enable,
   input  wr_cond_code_t we_L,
   input  rd_cond_code_t re_L,
   inout  [15:0]   data,
   input  logic  [15:0]   address);
   
  logic [15:0] mem [16'hffff];
  
  assign data = (enable & (re_L == MEM_RD)) ? mem[address] : 16'bz;
    
  always @(posedge clock)
    if (enable & (we_L == MEM_WR))
      mem[address] <= data;
      
  initial $readmemh("memory.hex", mem);

endmodule : memory

/*
 * module: memory256x16_program
 *
 * This is a customization of the memory256x16 memory.  The only difference is that 
 * it is initialized with contents of the memory.hex file.
 *
 */
module memory256x16_program
  (input  logic          clock, enable,
   input  wr_cond_code_t we_L,
   input  rd_cond_code_t re_L,
   inout   [15:0]   data,
   input  logic  [7:0]   address);

  logic [15:0] mem [8'hFF];

  assign data = (enable & (re_L == MEM_RD)) ? mem[address] : 16'bz;

  always @(posedge clock)
    if (enable & (we_L == MEM_WR))
      mem[address] <= data;
      
  initial $readmemh("memory.hex", mem);

endmodule : memory256x16_program
 
 
/* 
 * module: memory_16bit 
 *
 * This is our data memory, with combinational read and synchronous write.
 * Each memory word is 16 bits, and there is a 16 bit address space.
 * Note: This is a simulation model only. Memories are not synthesizable.
 */
 
 `include "constants.sv"
 
module memory_16bit (
   inout  [15:0]   data,
   input logic [15:0]   address,
   input wr_cond_code_t we_L,
   input rd_cond_code_t re_L,
   input logic          clock); 

`ifdef synthesis
   logic pmem_en, dmem_en, smem_en;
   
   // Memory Map: Program memory from $0000 to $00FF
   memory256x16_program pmem(.clock(clock), .enable(pmem_en), .we_L(we_L), .re_L(re_L), .data(data), .address(address[7:0]));
   //             Data memory from $0100 to $01FF
   memory256x16         dmem(.clock(clock), .enable(dmem_en), .we_L(we_L), .re_L(re_L), .data(data), .address(address[7:0]));
   //             Stack memory from $FF00 to $FFFF
   memory256x16         smem(.clock(clock), .enable(smem_en), .we_L(we_L), .re_L(re_L), .data(data), .address(address[7:0]));
   
   // Address decoders to enable individual memory modules
   assign pmem_en = (address[15:8] == 8'h00);
   assign dmem_en = (address[15:8] == 8'h01);
   assign smem_en = (address[15:8] == 8'hFF);
   
`else
  // full sized memory for simulation, initialized with memory.hex
  memory  mem(.clock(clock), .enable(1'b1), .we_L(we_L), .re_L(re_L), .data(data), .address(address));
`endif

endmodule : memory_16bit

/* 
 * module: tridrive
 *
 * A parameterized, non-inverting tristate driver with active low enable.
 */
module tridrive #(parameter WIDTH = 16) (
   input  [WIDTH-1:0] data,
   output [WIDTH-1:0] bus,
   input  en_L);

   assign bus = (~en_L)? data: 'bz;
endmodule

/* 
 * module: mux4to1 
 *
 * A 4-to-1 Mux of parameterized width, used as the ALU input selection muxes.
 *
 */
module mux4to1 #(parameter WIDTH = 16) (
   input [WIDTH-1:0]      inA,
   input [WIDTH-1:0]      inB,
   input [WIDTH-1:0]      inC,
   input [WIDTH-1:0]      inD,
   output logic [WIDTH-1:0] out,
   input alu_mux_t sel);
   
   always_comb
     case(sel)
       MUX_REG: out = inA;
       MUX_SP: out = inB;
       MUX_PC: out = inC;
       MUX_MDR: out = inD;
       default: out = 'bx;
     endcase
endmodule

/* 
 * module: mux8to1 
 *
 * A pretty standard 8-to-1, parameterized MUX.  Based upon the select 
 * line, the proper input word becomes valid on the output.
 */
module mux8to1 #(parameter WIDTH = 16) (
   input  logic [WIDTH-1:0] inA, inB, inC, inD, inE, inF, inG, inH,
   output logic [WIDTH-1:0] out,
   input  logic [2:0] sel);
   
   always_comb
     case(sel)
       'b000: out = inA;
       'b001: out = inB;
       'b010: out = inC;
       'b011: out = inD;
       'b100: out = inE;
       'b101: out = inF;
       'b110: out = inG;
       'b111: out = inH;
       default: out = 'bx;
     endcase
     
endmodule : mux8to1

/*
 * module: demux
 *  
 * A basic parameterized demultiplexer.
 * IN_WIDTH is the number of inputs and OUT_WIDTH is the number of outputs;
 * OUT_WIDTH should always be chosen to be a power of two and IN_WIDTH should
 * be equal to log_2(OUT_WIDTH).
 * DEFAULT is the value which will be sent to all of the non-selected outputs,
 * and should be either 1 or 0 only.
*/
module demux #(parameter OUT_WIDTH = 8, IN_WIDTH = 3, DEFAULT = 0)(
   input                      in,
   input [IN_WIDTH-1:0]       sel,
   output logic [OUT_WIDTH-1:0] out);

   always_comb begin
      out = (DEFAULT==0)?'b0:(~('b0));
      out[sel] = in;
   end

endmodule

/* 
 * module: register
 *
 * A positive-edge clocked parameterized register with (active low) load enable
 * and asynchronous reset. The parameter is the bit-width of the register.
 */
module register #(parameter WIDTH = 16) (
   output logic [WIDTH-1:0] out,
   input [WIDTH-1:0]      in,
   input                  load_L,
   input                  clock,
   input                  reset_L);

   always_ff @ (posedge clock, negedge reset_L) begin
      if(~reset_L)
         out <= 'h0000;
      else if (~load_L)
         out <= in;
   end

endmodule

module HEXtoSevenSegment
  (input  logic [3:0] bcd,
   output logic [6:0] segment);
  
  always_comb
    unique case (bcd)
      4'h0: segment = 7'b1000000;
      4'h1: segment = 7'b1111001;
      4'h2: segment = 7'b0100100;
      4'h3: segment = 7'b0110000;
      4'h4: segment = 7'b0011001;
      4'h5: segment = 7'b0010010;
      4'h6: segment = 7'b0000010;
      4'h7: segment = 7'b1111000;
      4'h8: segment = 7'b0000000;
      4'h9: segment = 7'b0011000;
      4'hA: segment = 7'b0001000;
      4'hB: segment = 7'b0000011;
      4'hC: segment = 7'b1000110;
      4'hD: segment = 7'b0100001;
      4'hE: segment = 7'b0000110;
      4'hF: segment = 7'b0001110;
    endcase

endmodule: HEXtoSevenSegment

module SevenSegmentDigit
  (input  logic [3:0] hex,
   output logic [6:0] segment,
   input  logic       blank);

  logic [6:0] decoded;

  HEXtoSevenSegment h2ss(hex, decoded);

  assign segment = (blank) ? 7'b1111111 : decoded;

endmodule: SevenSegmentDigit

module SevenSegmentControl
  (output logic [6:0] HEX7, HEX6, HEX5, HEX4, 
   output logic [6:0] HEX3, HEX2, HEX1, HEX0,
   input  logic [3:0] in7, in6, in5, in4,
   input  logic [3:0] in3, in2, in1, in0,
   input  logic [7:0] turn_on);

  SevenSegmentDigit ssd0(.hex(in0), .segment(HEX0), .blank(~turn_on[0]));
  SevenSegmentDigit ssd1(.hex(in1), .segment(HEX1), .blank(~turn_on[1]));
  SevenSegmentDigit ssd2(.hex(in2), .segment(HEX2), .blank(~turn_on[2]));
  SevenSegmentDigit ssd3(.hex(in3), .segment(HEX3), .blank(~turn_on[3]));
  SevenSegmentDigit ssd4(.hex(in4), .segment(HEX4), .blank(~turn_on[4]));
  SevenSegmentDigit ssd5(.hex(in5), .segment(HEX5), .blank(~turn_on[5]));
  SevenSegmentDigit ssd6(.hex(in6), .segment(HEX6), .blank(~turn_on[6]));
  SevenSegmentDigit ssd7(.hex(in7), .segment(HEX7), .blank(~turn_on[7]));


endmodule: SevenSegmentControl
