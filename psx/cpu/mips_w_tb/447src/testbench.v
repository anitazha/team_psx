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
    wire        clk, inst_excpt, mem_excpt, halted;
    wire [29:0] pc, mem_addr;
    wire [31:0] inst, mem_data_in, mem_data_out;
    wire [3:0]  mem_write_en;
    reg 	    rst_b;

    reg [10:0] psx_int;
    wire inst_read, mem_data_read;
    reg  inst_ready, mem_data_ready;

    // The clock
    clock CLK(clk);
    
    //always @(posedge clk) begin
        //if ({pc, 2'b0} == 32'hbfc06ecc)
        //    $stop;
        //if ({pc, 2'b0} == 32'hbfc01a84)
        //    $stop;
        //else if (inst == 32'h8FBF0014)
        //    $stop;
        //else if ({mem_addr, 2'b0} == 32'h801FFEE4)
        //    $stop;
    //end

    // The MIPS core
    Processor core (.clock(clk), .reset(~rst_b),
            // interrupts; IP is for diagnostics
            .Interrupts(5'h0), .NMI(1'b0), .IP(),
            .PSX_Interrupts(psx_int),
            // data access
            .DataMem_Ready(mem_data_ready), .DataMem_Read(mem_data_read),
            .DataMem_In(mem_data_out), .DataMem_Write(mem_write_en),
            .DataMem_Address(mem_addr), .DataMem_Out(mem_data_in),
            // instruction access
            .InstMem_In(inst), .InstMem_Address(pc),
            .InstMem_Ready(inst_ready), .InstMem_Read(inst_read),
            .halted(halted));
    
    wire dram_ras_n, dram_we_n, dram_oe;
    wire [31:0] dram_dq_in;
    wire [12:0] dram_addr;
    wire [1:0]  dram_bank;
    wire dram_cas_n, dram_cke, dram_cs_n;
    wire [3:0] dram_dqm;
    wire [31:0]  dram_dq = dram_oe ? dram_dq_in : 32'bz;
    wire [31:0] dram_dq_out = dram_dq;

    // SDRAM MODEL 
    qsys_sdram_mem_model sim_mem(
            .reset_reset_n (~rst_b),
            .clk_clk       (clk),
            .zs_addr       (dram_addr),
            .zs_ba         (dram_bank),
            .zs_cas_n      (dram_cas_n),
            .zs_cke        (dram_cke),
            .zs_dq         (dram_dq),
            .zs_cs_n       (dram_cs_n),
            .zs_dqm        (dram_dqm),
            .zs_ras_n      (dram_ras_n),
            .zs_we_n       (dram_we_n));

    // Memory
    mem_controller memory(
            .clk(clk), .rst(~rst_b),

            /* SDRAM CHIP INTERFACE */
            .dram_addr      (dram_addr),
            .dram_bank      (dram_bank),
            .dram_cas_n     (dram_cas_n),
            .dram_cke       (dram_cke),
            .dram_clk       (),
            .dram_cs_n      (dram_cs_n),
            .dram_dqm       (dram_dqm),
            //inout  wire  [31:0] dram_dq,
            .dram_ras_n     (dram_ras_n),
            .dram_we_n      (dram_we_n),
            .dram_dq_in     (dram_dq_in),
            .dram_dq_out    (dram_dq_out),
            .dram_oe_out    (dram_oe),

            /* CPU DATA */
    	    .data_addr      ({mem_addr, 2'b0}),
    	    .data_data_i    (mem_data_in),
    	    .data_ren       (mem_data_read), 
    	    .data_wen       (mem_write_en),
    	    .data_ack       (mem_data_ready),
    	    .data_data_o    (mem_data_out),

    	    /* CPU INSTRCTION */
    	    .inst_addr      ({pc, 2'b0}),
    	    .inst_ren       (inst_read),
    	    .inst_ack       (inst_ready),
    	    .inst_data_o    (inst),

            /* GPU SIGNALS */
            .to_gp0         (),
            .to_gp1         (),
            .gpu_ren        (),
            .gpu_rdy        (),
            .gpu_fifo_full  (),
            .gpu_stat       (), 
            .gpu_read       (),
            .gp0            (),
            .gp1            (),

            /* HW REGISTER CONNECTIONS */
            .hblank         (),
            .vblank         (),
            .dotclock       (),

            /* INTERRUPTS */
            .interrupts     (psx_int)
            );

    // Memory
    //mips_mem Memory(
    //        // Port 1 (instructions)
    //        .addr1(pc), .data_in1(), .data_out1(inst), .we1(4'b0),
    //        .excpt1(inst_excpt), .allow_kernel1(1'b1), .kernel1(),
    //        // Port 2 (data)
    //        .addr2(mem_addr), .data_in2(mem_data_in),
    //        .data_out2(mem_data_out), .we2(mem_write_en),
    //        .excpt2(mem_excpt), .allow_kernel2(1'b1), .kernel2(),
    //        .rst_b(rst_b), .clk(clk));

    //always_ff@(posedge clk) begin
    //    if (inst_read)
    //        inst_ready <= 1'b1;
    //    else
    //        inst_ready <= 1'b0;
    //    if (mem_write_en || mem_data_read)
    //        mem_data_ready <= 1'b1;
    //    else
    //        mem_data_ready <= 1'b0;
    //end

    //always @(halted) begin
    //    #0;
    //    if(halted === 1'b1)
    //        $finish;
    //end

    initial begin
        rst_b = 0;
        #75;
        rst_b <= 1;
        $stop;
        wait(pc == 'b0)
        $stop;
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
