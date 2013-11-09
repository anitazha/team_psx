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

// Top module for the MIPS processor core
// NOT synthesizable Verilog!
module testbench;
    reg [31:0]  i;
    reg [29:0]  addr;
    
    wire        clk, inst_excpt, mem_excpt, halted;
    wire [29:0] pc, mem_addr;
    wire [31:0] inst, mem_data_in, mem_data_out;
    wire [3:0]  mem_write_en;
    reg 	    rst_b;

    wire inst_read, data_read;
    reg  inst_ready, data_ready;

    // The clock
    clock CLK(clk);
    
    // The MIPS core
    //mips_core core(.clk(clk), .inst_addr(pc), .inst(inst),
    // 	  .inst_excpt(inst_excpt), .mem_addr(mem_addr),
    // 	  .mem_data_in(mem_data_in), .mem_data_out(mem_data_out),
    // 	  .mem_write_en(mem_write_en), .mem_excpt(mem_excpt),
    // 	  .halted(halted), .rst_b(rst_b));
    
    // The MIPS core
    Processor core (.clock(clk), .reset(~rst_b),
            // interrupts; IP is for diagnostics
            .Interrupts(5'h0), .NMI(1'b0), .IP(),
            // data access
            .DataMem_Ready(data_ready), .DataMem_Read(data_read),
            .DataMem_In(mem_data_out), .DataMem_Write(mem_write_en),
            .DataMem_Address(mem_addr), .DataMem_Out(mem_data_in),
            // instruction access
            .InstMem_In(inst), .InstMem_Address(pc),
            .InstMem_Ready(inst_ready), .InstMem_Read(inst_read),
            .halted(halted));
    
    // Memory
    mips_mem Memory(
            // Port 1 (instructions)
            .addr1(pc), .data_in1(), .data_out1(inst), .we1(4'b0),
            .excpt1(inst_excpt), .allow_kernel1(1'b1), .kernel1(),
            // Port 2 (data)
            .addr2(mem_addr), .data_in2(mem_data_in),
            .data_out2(mem_data_out), .we2(mem_write_en),
            .excpt2(mem_excpt), .allow_kernel2(1'b1), .kernel2(),
            .rst_b(rst_b), .clk(clk));

    initial begin
        rst_b = 0;
        #75;
        rst_b <= 1;
    end

    always @(halted) begin
        #0;
        if(halted === 1'b1)
            $finish;
    end

    // Fake the handshake needed for OpenCores MIPS
    always @(posedge clk) begin
        //$display("Current instruction: %x PC: %x", inst, pc);
        if (inst_read)
            inst_ready <= 1'b1;
        else
            inst_ready <= 1'b0;
    end

    always @(posedge clk) begin
        if (data_read | mem_write_en)
            data_ready <= 1'b1;
        else
            data_ready <= 1'b0;
    end
endmodule

// Clock module for the MIPS core.  You may increase the clock period
// if your design requires it.
module clock(clockSignal);
    parameter start = 0, halfPeriod = 50;
    output      clockSignal;
    reg         clockSignal;

    initial
        clockSignal = start;

    always
        #halfPeriod clockSignal = ~clockSignal;

endmodule
