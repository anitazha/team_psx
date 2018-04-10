module gte_tb;

    logic        clk, rst;
    logic        cfc2, ctc2, mfc2, mtc2, lwc2, swc2;
    logic        gte_sf;
    logic [ 1:0] gte_mx, gte_vx, gte_tx;
    logic        gte_lm;
    logic [ 5:0] gte_cmd;
    logic [31:0] reg_in, reg_out;
    logic        reg_in_rdy;
    logic [ 4:0] rd;
    logic        inst_rdy, halted, stalled, out_avail;

    gte gte_mod(.*);

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1'b1;
        ctc2 = 1'b0;
        cfc2 = 1'b0;
        mtc2 = 1'b0;
        mfc2 = 1'b0;
        stall = 1'b0;
        halted = 1'b0;
        @(posedge clk) rst <= 1'b0;
    end

endmodule: gte_tb
