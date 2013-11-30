/** @brief N-bit Up/Down counter with support for synchronous loads and clears.
 *  Clears take priority over loads. Loads take priority over counting.
 */
module counter 
    #(parameter WIDTH=8) (
    input  logic [WIDTH-1:0] D,
    input  logic             ld, up, en, clr, clk, rst,
    output logic [WIDTH-1:0] Q);

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            Q <= 'h0;
        else if (clr)
            Q <= 'h0;
        else if (ld)
            Q <= D;
        else if (en)
            Q <= up ? (Q + 1'd1) : (Q - 1'd1);
    end
endmodule: counter

/** @brief N-bit Up counter with synchronous clears.
 *  Clears take priority over counting.
 */
module up_counter 
    #(parameter WIDTH=8) (
    input  logic             en, clr, clk, rst,
    output logic [WIDTH-1:0] Q);

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            Q <= 'h0;
        else if (clr)
            Q <= 'h0;
        else if (en)
            Q <= (Q + 1'd1);
    end
endmodule: up_counter

/** @brief N-bit Register with synchronous clears.
 *  Clears take priority over loads.
 */
module register 
    #(parameter WIDTH=8) (
    input  logic [WIDTH-1:0] D,
    input  logic             en, clr, clk, rst,
    output logic [WIDTH-1:0] Q);

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            Q <= 'd0;
        else if (clr)
            Q <= 'd0;
        else if (en)
            Q <= D;
    end
endmodule: register
