/*
 * Redistributions of any form whatsoever must retain and/or include the
 * following acknowledgment, notices and disclaimer:
 *
 * This product includes software developed by Carnegie Mellon University. 
 *
 * Copyright (c) 2004 by Babak Falsafi and James Hoe,
 * Computer Architecture Lab at Carnegie Mellon (CALCM), 
 * Carnegie Mellon University.
 *
 * This source file was written and maintained by Jared Smolens 
 * as part of the Two-Way In-Order Superscalar project for Carnegie Mellon's 
 * Introduction to Computer Architecture course, 18-447. The source file
 * is in part derived from code originally written by Herman Schmit and 
 * Diana Marculescu.
 *
 * You may not use the name "Carnegie Mellon University" or derivations 
 * thereof to endorse or promote products derived from this software.
 *
 * If you modify the software you must place a notice on or within any 
 * modified version provided or made available to any third party stating 
 * that you have modified the software.  The notice shall include at least 
 * your name, address, phone number, email address and the date and purpose 
 * of the modification.
 *
 * THE SOFTWARE IS PROVIDED "AS-IS" WITHOUT ANY WARRANTY OF ANY KIND, EITHER 
 * EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO ANYWARRANTY 
 * THAT THE SOFTWARE WILL CONFORM TO SPECIFICATIONS OR BE ERROR-FREE AND ANY 
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, 
 * TITLE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY 
 * BE LIABLE FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO DIRECT, INDIRECT, 
 * SPECIAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF, RESULTING FROM, OR IN 
 * ANY WAY CONNECTED WITH THIS SOFTWARE (WHETHER OR NOT BASED UPON WARRANTY, 
 * CONTRACT, TORT OR OTHERWISE).
 *
 */

//
//  mips_mem: A dual-ported virtual word-addressed memory with 5 segments.
//            Performing any memory operation to a memory address while
//            that memory address is being written produces an undefined
//            result.
//
// To compile assembly files for the MIPS memory, use a command such as:
//
//    spim447 -notrap -vasm addiu.s mem
//
//  where -notrap is an option to not include the trap handling code 
//  (requires control flow support, among other instruction classes),
//  addiu.s is the assembly input file and mem is the memory image filename
//  prefix.  This is the default name used in this memory.
//
// The number on each interface signal indiactes the port associated with
// each signal.  Within each port, the signals are as follows:
//
// addr         (input)  - The address of the memory access
// data_in      (input)  - The data for memory writes
// data_out     (output) - The data from memory reads
// we           (input)  - Write enables for each byte within the word:
//                         we[3] - Write [31:24] of addressed word
//                         we[2] - Write [23:16] of addressed word
//                         we[1] - Write [15:8] of addressed word
//                         we[0] - Write [7:0] of addressed word
// excpt        (output) - Access caused an exception
// allow_kernel (input)  - Allow access to kernel segments
// kernel       (output) - Access touched a kernel segment
//
// In addition, there is also the following signal:
//
// reset        (input)  - System reset
// clk          (input)  - System clock for write
//

module mips_mem(addr1,data_in1,data_out1,we1,excpt1,allow_kernel1,kernel1,
		addr2,data_in2,data_out2,we2,excpt2,allow_kernel2,kernel2,
		rst_b,clk);

   // Boundaries and lengths of each segment
   // Note that '_top' addresses off by one; the actual top is one less
   //      than the values below.
   // '_w' values are word addresses
   parameter
	    // Data segment
	    data_start   = 32'h10000000,
	    data_words   = 'h40000, /* 1 M */
    	    data_length  = data_words * 4,
    	    data_top = data_start + data_length,
    	    data_start_w = data_start >> 2,
    	    data_top_w = data_start_w + data_words,

	    // Text segment
	    text_start   = 32'h00400000,
	    text_words   = 'h10000, /* 256 K */
    	    text_length  = text_words * 4,
	    text_top = text_start + text_length,
    	    text_start_w = text_start >> 2,
    	    text_top_w = text_start_w + text_words,

	    // Stack segment (grows down)
	    stack_top    = 32'h80000000,
	    stack_words  = 'h10000, /* 256 K */
    	    stack_length = stack_words * 4,
    	    stack_start = stack_top - stack_length,
	    stack_start_w = stack_start >> 2,
	    stack_top_w = stack_start_w + stack_words,

	    // Kernel data segment
	    kdata_start  = 32'h90000000,
	    kdata_words  = 'h40000, /* 1 M */
    	    kdata_length = kdata_words * 4,
	    kdata_top = kdata_start + kdata_length,
	    kdata_start_w = kdata_start >> 2,
	    kdata_top_w = kdata_start_w + kdata_words,

	    // Kernel text segment
	    ktext_start  = 32'h80000000,
	    ktext_words  = 'h4000,  /* 64 K */
	    ktext_length = ktext_words * 4,
	    ktext_top = ktext_start + ktext_length,
	    ktext_start_w = ktext_start >> 2,
	    ktext_top_w = ktext_start_w + ktext_words;


   input         rst_b;
   input         clk;

   // Inputs and ouptuts: Port 1
   input [29:0]  addr1;         // Memory address
   input [31:0]  data_in1;      // Memory write data
   output [31:0] data_out1;     // Memory read data
   reg [31:0] 	 data_out1;
   input [0:3] 	 we1;           // Write enable (active high; 1 bit per byte)
   output 	 excpt1;        // Exception occurred (active high)
   reg 		 excpt1;
   input 	 allow_kernel1; // Is kernel access allowed? (active high)
   output 	 kernel1;       // Current access is to kernel (active high)
   reg 		 kernel1; 		 

   // Inputs and outputs: Port 2
   input [29:0]  addr2;         // Memory address
   input [31:0]  data_in2;      // Memory write data
   output [31:0] data_out2;     // Memory read data
   reg [31:0] 	 data_out2;
   input [0:3]	 we2;           // Write enable (active high; 1 bit per byte)
   output 	 excpt2;        // Exception occurred (active high)
   reg 		 excpt2;
   input 	 allow_kernel2; // Is kernel access allowed? (active high)
   output 	 kernel2;       // Current access is to kernel (active high)
   reg 		 kernel2;

   // Memory segments
   reg [31:0] 	 data_seg[0:data_words];
   reg [31:0] 	 text_seg[0:text_words];
   reg [31:0] 	 stack_seg[0:stack_words];
   reg [31:0] 	 kdata_seg[0:kdata_words];
   reg [31:0] 	 ktext_seg[0:ktext_words];

   // Write events
   // These events occur after the memory has been written in order 
   // to update the read ports, if they happen to be looking at the
   // same location in memory.
   event 	 port_write1, port_write2;

   // Verilog implementation stuff
   integer 	 i;
   wire [31:0] write_mask1 = {we1[3], we1[3], we1[3], we1[3],
			      we1[3], we1[3], we1[3], we1[3],
			      we1[2], we1[2], we1[2], we1[2],
			      we1[2], we1[2], we1[2], we1[2],
			      we1[1], we1[1], we1[1], we1[1],
			      we1[1], we1[1], we1[1], we1[1],
			      we1[0], we1[0], we1[0], we1[0],
			      we1[0], we1[0], we1[0], we1[0]};
   wire [31:0] write_mask2 = {we2[3], we2[3], we2[3], we2[3],
			      we2[3], we2[3], we2[3], we2[3],
			      we2[2], we2[2], we2[2], we2[2],
			      we2[2], we2[2], we2[2], we2[2],
			      we2[1], we2[1], we2[1], we2[1],
			      we2[1], we2[1], we2[1], we2[1],
			      we2[0], we2[0], we2[0], we2[0],
			      we2[0], we2[0], we2[0], we2[0]};

   initial
     begin
	// Initialize Port 1
	data_out1 = 32'hxxxxxxxx;
	excpt1 = 1'b0;
	kernel1 = 1'b0;

	// Initialize Port 2
	data_out2 = 32'hxxxxxxxx;
	excpt2 = 1'b0;
	kernel2 = 1'b0;
     end

   always@(rst_b)
     if(rst_b == 1'b0)
       begin
	  // Initialize Port 1
	  data_out1 = 32'hxxxxxxxx;
	  excpt1 = 1'b0;
	  kernel1 = 1'b0;
	  
	  // Initialize Port 2
	  data_out2 = 32'hxxxxxxxx;
	  excpt2 = 1'b0;
	  kernel2 = 1'b0;
	  
	  // Initialize memory (prevents x-pessimism problem)
	  for(i = 0; i < text_words; i = i + 1)
	  text_seg[i] = 32'hdeadbeef;
	  for(i = 0; i < data_words; i = i + 1)
	  data_seg[i] = 32'hdeadbeef;
	  for(i = 0; i < stack_words; i = i + 1)
	  stack_seg[i] = 32'hdeadbeef;
	  for(i = 0; i < ktext_words; i = i + 1)
	  ktext_seg[i] = 32'hdeadbeef;
	  for(i = 0; i < kdata_words; i = i + 1)
	  kdata_seg[i] = 32'hdeadbeef;
	  
	  // Grab initial memory values
	  $readmemh("mem.text.dat", text_seg);
	  $readmemh("mem.data.dat", data_seg);
	  $readmemh("mem.stack.dat", stack_seg);
	  $readmemh("mem.ktext.dat", ktext_seg);
	  $readmemh("mem.kdata.dat", kdata_seg);
       end

   // Handle Port 1 Read
   always @(rst_b or addr1 or data_in1 or write_mask1 or 
	    port_write1 or port_write2)
     begin
	if((write_mask1 != 32'b0) && (rst_b == 1'b1))
	  // We need to write to memory
	  begin
	     data_out1 <= 32'hxxxxxxxx;

	     // Figure out which segment
	     if((addr1 >= text_start_w) && (addr1 < text_top_w))
	       begin
		  excpt1 <= 1'b0;
		  kernel1 <= 1'b0;
	       end
	     else if((addr1 >= data_start_w) && (addr1 < data_top_w))
	       begin
		  excpt1 <= 1'b0;
		  kernel1 <= 1'b0;
	       end
	     else if((addr1 >= stack_start_w) && (addr1 < stack_top_w))
	       begin
		  excpt1 <= 1'b0;
		  kernel1 <= 1'b0;
	       end
	     else if((addr1 >= ktext_start_w) && (addr1 < ktext_top_w))
	       begin
		  kernel1 <= 1'b1;
		  if(allow_kernel1 == 1'b1)
		    begin
		       excpt1 <= 1'b0;
		    end
		  else
		    begin
		       excpt1 <= 1'b1;
		    end
	       end
	     else if((addr1 >= kdata_start_w) && (addr1 < kdata_top_w))
	       begin
		  kernel1 <= 1'b1;
		  if(allow_kernel1 == 1'b1)
		    begin
		       excpt1 <= 1'b0;
		    end
		  else
		    begin
		       excpt1 <= 1'b1;
		    end
	       end
	     else
	       begin
		  // Not in any segment; raise an exception
		  kernel1 <= 1'b0;
		  excpt1 <= 1'b1;
	       end // else:
	  end

	else
	  // We need to read from memory
	  begin

	     // Figure out which segment
	     if((addr1 >= text_start_w) && (addr1 < text_top_w))
	       begin
		  excpt1 <= 1'b0;
		  kernel1 <= 1'b0;
		  data_out1 <= text_seg[addr1 - text_start_w];
	       end
	     else if((addr1 >= data_start_w) && (addr1 < data_top_w))
	       begin
		  excpt1 <= 1'b0;
		  kernel1 <= 1'b0;
		  data_out1 <= data_seg[addr1 - data_start_w];
	       end
	     else if((addr1 >= stack_start_w) && (addr1 < stack_top_w))
	       begin
		  excpt1 <= 1'b0;
		  kernel1 <= 1'b0;
		  data_out1 <= stack_seg[addr1 - stack_start_w];
	       end
	     else if((addr1 >= ktext_start_w) && (addr1 < ktext_top_w))
	       begin
		  kernel1 <= 1'b1;
		  if(allow_kernel1 == 1'b1)
		    begin
		       excpt1 <= 1'b0;
		       data_out1 <= ktext_seg[addr1 - ktext_start_w];
		    end
		  else
		    begin
		       excpt1 <= 1'b1;
		       data_out1 <= 32'hxxxxxxxx;
		    end
	       end
	     else if((addr1 >= kdata_start_w) && (addr1 < kdata_top_w))
	       begin
		  kernel1 <= 1'b1;
		  if(allow_kernel1 == 1'b1)
		    begin
		       excpt1 <= 1'b0;
		       data_out1 <= kdata_seg[addr1 - kdata_start_w];
		    end
		  else
		    begin
		       excpt1 <= 1'b1;
		       data_out1 <= 32'hxxxxxxxx;
		    end
	       end
	     else
	       begin
		  // Not in any segment; raise an exception
		  kernel1 <= 1'b0;
		  excpt1 <= 1'b1;
	       end
	  end
     end

   // Handle Port 1 Write
   always @(posedge clk)
     begin
	if((write_mask1 != 32'b0) && (rst_b == 1'b1))
	  // We need to write to memory
	  begin
	     data_out1 <= 32'hxxxxxxxx;

	     // Figure out which segment
	     if((addr1 >= text_start_w) && (addr1 < text_top_w))
	       begin
		  text_seg[addr1 - text_start_w]
		    <= ( write_mask1 & data_in1) |
		       (~write_mask1 & text_seg[addr1 - text_start_w]);
	       end
	     else if((addr1 >= data_start_w) && (addr1 < data_top_w))
	       begin
		  data_seg[addr1 - data_start_w]
		    <= ( write_mask1 & data_in1) |
		       (~write_mask1 & data_seg[addr1 - data_start_w]);
	       end
	     else if((addr1 >= stack_start_w) && (addr1 < stack_top_w))
	       begin
		  stack_seg[addr1 - stack_start_w]
		    <= ( write_mask1 & data_in1) |
		       (~write_mask1 & stack_seg[addr1 - stack_start_w]);
	       end
	     else if((addr1 >= ktext_start_w) && (addr1 < ktext_top_w))
	       begin
		  if(allow_kernel1 == 1'b1)
		    begin
		       ktext_seg[addr1 - ktext_start_w]
			 <= ( write_mask1 & data_in1) |
			    (~write_mask1 & ktext_seg[addr1 - ktext_start_w]);
		    end
	       end
	     else if((addr1 >= kdata_start_w) && (addr1 < kdata_top_w))
	       begin
		  if(allow_kernel1 == 1'b1)
		    begin
		       kdata_seg[addr1 - kdata_start_w]
			 <= ( write_mask1 & data_in1) |
			    (~write_mask1 & kdata_seg[addr1 - kdata_start_w]);
		    end
	       end

	     #0 ->port_write1;  
	     // invoke the port_write1 event to make sure that 
	     // the read ports are updated.

	  end // if ((write_mask1 != 32'b0) && (reset == 1'b0))
     end // always @ (posedge clk)

   // Handle Port 2 Read
   always @(rst_b or addr2 or data_in2 or write_mask2 or 
	    port_write1 or port_write2)
     begin
	if((write_mask2 != 32'b0) && (rst_b == 1'b1))
	  // We need to write to memory
	  begin
	     data_out2 <= 32'hxxxxxxxx;

	     // Figure out which segment
	     if((addr2 >= text_start_w) && (addr2 < text_top_w))
	       begin
		  excpt2 <= 1'b0;
		  kernel2 <= 1'b0;
	       end
	     else if((addr2 >= data_start_w) && (addr2 < data_top_w))
	       begin
		  excpt2 <= 1'b0;
		  kernel2 <= 1'b0;
	       end
	     else if((addr2 >= stack_start_w) && (addr2 < stack_top_w))
	       begin
		  excpt2 <= 1'b0;
		  kernel2 <= 1'b0;
	       end
	     else if((addr2 >= ktext_start_w) && (addr2 < ktext_top_w))
	       begin
		  kernel2 <= 1'b1;
		  if(allow_kernel2 == 1'b1)
		    begin
		       excpt2 <= 1'b0;
		    end
		  else
		    begin
		       excpt2 <= 1'b1;
		    end
	       end
	     else if((addr2 >= kdata_start_w) && (addr2 < kdata_top_w))
	       begin
		  kernel2 <= 1'b1;
		  if(allow_kernel2 == 1'b1)
		    begin
		       excpt2 <= 1'b0;
		    end
		  else
		    begin
		       excpt2 <= 1'b1;
		    end
	       end
	     else
	       begin
		  // Not in any segment; raise an exception
		  kernel2 <= 1'b0;
		  excpt2 <= 1'b1;
	       end // else: !if((addr2 >= kdata_start_w) && (addr2 < kdata_top_w))
	  end

	else
	  // We need to read from memory
	  begin

	     // Figure out which segment
	     if((addr2 >= text_start_w) && (addr2 < text_top_w))
	       begin
		  excpt2 <= 1'b0;
		  kernel2 <= 1'b0;
		  data_out2 <= text_seg[addr2 - text_start_w];
	       end
	     else if((addr2 >= data_start_w) && (addr2 < data_top_w))
	       begin
		  excpt2 <= 1'b0;
		  kernel2 <= 1'b0;
		  data_out2 <= data_seg[addr2 - data_start_w];
	       end
	     else if((addr2 >= stack_start_w) && (addr2 < stack_top_w))
	       begin
		  excpt2 <= 1'b0;
		  kernel2 <= 1'b0;
		  data_out2 <= stack_seg[addr2 - stack_start_w];
	       end
	     else if((addr2 >= ktext_start_w) && (addr2 < ktext_top_w))
	       begin
		  kernel2 <= 1'b1;
		  if(allow_kernel2 == 1'b1)
		    begin
		       excpt2 <= 1'b0;
		       data_out2 <= ktext_seg[addr2 - ktext_start_w];
		    end
		  else
		    begin
		       excpt2 <= 1'b1;
		       data_out2 <= 32'hxxxxxxxx;
		    end
	       end
	     else if((addr2 >= kdata_start_w) && (addr2 < kdata_top_w))
	       begin
		  kernel2 <= 1'b1;
		  if(allow_kernel2 == 1'b1)
		    begin
		       excpt2 <= 1'b0;
		       data_out2 <= kdata_seg[addr2 - kdata_start_w];
		    end
		  else
		    begin
		       excpt2 <= 1'b1;
		       data_out2 <= 32'hxxxxxxxx;
		    end
	       end
	     else
	       begin
		  // Not in any segment; raise an exception
		  kernel2 <= 1'b0;
		  excpt2 <= 1'b1;
	       end
	  end
     end

   // Handle Port 2 Write
   always @(posedge clk)
     begin
	if((write_mask2 != 32'b0) && (rst_b == 1'b1))
	  // We need to write to memory
	  begin
	     data_out2 <= 32'hxxxxxxxx;

	     // Figure out which segment
	     if((addr2 >= text_start_w) && (addr2 < text_top_w))
	       begin
		  text_seg[addr2 - text_start_w]
		    <= ( write_mask2 & data_in2) |
		       (~write_mask2 & text_seg[addr2 - text_start_w]);
	       end
	     else if((addr2 >= data_start_w) && (addr2 < data_top_w))
	       begin
		  data_seg[addr2 - data_start_w]
		    <= ( write_mask2 & data_in2) |
		       (~write_mask2 & data_seg[addr2 - data_start_w]);
	       end
	     else if((addr2 >= stack_start_w) && (addr2 < stack_top_w))
	       begin
		  stack_seg[addr2 - stack_start_w]
		    <= ( write_mask2 & data_in2) |
		       (~write_mask2 & stack_seg[addr2 - stack_start_w]);
	       end
	     else if((addr2 >= ktext_start_w) && (addr2 < ktext_top_w))
	       begin
		  if(allow_kernel2 == 1'b1)
		    begin
		       ktext_seg[addr2 - ktext_start_w]
			 <= ( write_mask2 & data_in2) |
			    (~write_mask2 & ktext_seg[addr2 - ktext_start_w]);
		    end
	       end
	     else if((addr2 >= kdata_start_w) && (addr2 < kdata_top_w))
	       begin
		  if(allow_kernel2 == 1'b1)
		    begin
		       kdata_seg[addr2 - kdata_start_w]
			 <= ( write_mask2 & data_in2) |
			    (~write_mask2 & kdata_seg[addr2 - kdata_start_w]);
		    end
	       end
	     
	     #0 ->port_write2;  
	     // invoke the port_write2 event to make sure that 
	     // the read ports are updated.

	  end // if ((write_mask2 != 32'b0) && (reset == 1'b0))
     end // always @ (posedge clk)

endmodule
