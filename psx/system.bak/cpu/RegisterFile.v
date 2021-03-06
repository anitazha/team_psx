`timescale 1ns / 1ps
/*
 * File         : RegisterFile.v
 * Project      : University of Utah, XUM Project MIPS32 core
 * Creator(s)   : Grant Ayers (ayers@cs.utah.edu)
 *
 * Modification History:
 *   Rev   Date         Initials  Description of Change
 *   1.0   7-Jun-2011   GEA       Initial design.
 *
 * Standards/Formatting:
 *   Verilog 2001, 4 soft tab, wide column.
 *
 * Description:
 *   A Register File for a MIPS processor. Contains 32 general-purpose
 *   32-bit wide registers and two read ports. Register 0 always reads
 *   as zero.
 */
module RegisterFile(
    input  clock,
    input  reset,
    input  halted,
    input  [4:0]  ReadReg1, ReadReg2, WriteReg,
    input  [31:0] WriteData,
    input  RegWrite,
    output [31:0] ReadData1, ReadData2
    );

    // Register file of 32 32-bit registers. Register 0 is hardwired to 0s
    reg [31:0] registers [0:31];

    // Initialize all to zero
    integer i;
    initial begin
        for (i=0; i<32; i=i+1) begin
            registers[i] <= 0;
        end
    end

    // Sequential (clocked) write.
    // 'WriteReg' is the register index to write. 'RegWrite' is the command.
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            for (i=0; i<32; i=i+1) begin
                registers[i] <= 0;
            end
        end
        else begin
            if (WriteReg != 0)
                registers[WriteReg] <= (RegWrite) ? WriteData : registers[WriteReg];
        end
    end

    // Combinatorial Read. Register 0 is all 0s.
    assign ReadData1 = (ReadReg1 == 0) ? 32'h00000000 : registers[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 32'h00000000 : registers[ReadReg2];

	// synthesis translate_off
	integer fd;
	always @(halted) begin
		if ((~reset) && halted) begin
			fd = $fopen("regdump.txt");

			$display("--- 18-447 Register file dump ---");
			$display("=== Simulation Cycle %d ===", $time);
			
			$fdisplay(fd, "--- 18-447 Register file dump ---");
			$fdisplay(fd, "=== Simulation Cycle %d ===", $time);

			for(i = 0; i < 32; i = i+1) begin
				$display("R%d\t= 0x%8x\t( %0d )", i, registers[i], registers[i]);
				$fdisplay(fd, "R%d\t= 0x%8h\t( %0d )", i, registers[i], registers[i]); 
			end
			
			$display("--- End register file dump ---");
			$fdisplay(fd, "--- End register file dump ---");
			
			$fclose(fd);
		end
	end
	// synthesis translate_on
endmodule

