/*       -----------------------------------
 * |     |     .     Active Area      .     .
 * |     |     .                      .     .
 * -------     .                      .     .
 *  HSYNC     HBP                    HFP    End
 */

`define HTOTAL    'd2592 // width, in pixels (w/ porch and sync)
`define VTOTAL    'd1242 // height, in lines (w/ porch and sync)
`define HSYNC_LEN 'd208  // hsync length in pixels
`define VSYNC_LEN 'd3    // vsync length in lines
`define HBP       'd544  // end of horizontal back porch (sync starts @ 0)
`define HFP       'd2464 // start of horizontal front porch
`define VBP       'd41   // end of vertical back porch (sync starts @ 0)
`define VFP       'd1241 // start of vertical front porch
`define HSYNC_ON  'd0    // asserted sync pulse -- used with SYNC_OFF
`define HSYNC_OFF 'd1    // deasserted sync pulse
`define VSYNC_ON  'd1    // asserted sync pulse -- used with SYNC_OFF
`define VSYNC_OFF 'd0    // deasserted sync pulse

module video(
    input  logic [23:0] data,
    input  logic        en, rst, clk,
    output logic [35:0] HDMI_DATA,
    output logic        rdy, HDMI_VSYNC, HDMI_HSYNC, HDMI_EN, HDMI_CLK);

    logic [$clog2(`HTOTAL):0] h_sum;
    logic [$clog2(`VTOTAL):0] v_sum;
    logic [35:0]              in_pixel, out_pixel;
    logic                     clk_pix;
    logic                     saw_rdy, saw_pix, pixel_rdy; 
    logic                     v_cnt_en, v_cnt_clr, h_cnt_en, h_cnt_clr;
    logic                     vsync, hsync, hdmi_en;

    assign in_pix = {{data[23:16], 4'b0}, {data[15:8], 4'b0}, {data[7:0], 4'b0}};
    
    assign HDMI_HSYNC = (h_sum < `HSYNC_LEN) ? `HSYNC_ON : `HSYNC_OFF;
    assign HDMI_VSYNC = (v_sum < `VSYNC_LEN) ? `VSYNC_ON : `VSYNC_OFF;
    assign HDMI_DATA  = out_pixel;
    assign HDMI_CLK   = clk_pix;
    assign HDMI_EN    = hdmi_en;

    // dimension counters
    counter #(`HTOTAL) h_count (.en(h_cnt_en), .clr(h_cnt_clr), .rst(rst),
                               .clk(clk_pix), .sum(h_sum));
    counter #(`VTOTAL) v_count (.en(v_cnt_en), .clr(v_cnt_clr), .rst(rst),
                               .clk(clk_pix), .sum(v_sum));

    // buffer input data until FSM is ready for the next data
    register #(36) pixel_reg (.in(in_pixel), .out(out_pixel), .clr(1'b0), .*);

    video_fsm fsm (.*);
    pixel_clock pixel_clk (.clk_pix(clk_pix), .*);

    /* whether FSM is ready for more data -- on system clock in order
     * synchronize FSM with the outside world */
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            rdy <= 1'b1;
            pixel_rdy <= 1'b0;
        end
        else if (en) begin      // used to deassert the external ready
            pixel_rdy <= 1'b1;
            rdy <= 1'b0;
        end
        else if (saw_pix) begin // set when pixel is written out
            pixel_rdy <= 1'b0;
        end
        else if (!pixel_rdy && !saw_pix) begin
            rdy <= 1'b1;
        end
    end

endmodule: video

module video_fsm(
    input  logic [$clog2(`HTOTAL):0] h_sum,
    input  logic [$clog2(`VTOTAL):0] v_sum,
    input  logic                     pixel_rdy, clk_pix, rst,
    output logic                     saw_pix,
    output logic                     h_cnt_en, h_cnt_clr,
    output logic                     v_cnt_en, v_cnt_clr,
    output logic                     hsync, vsync, hdmi_en);

    enum logic [1:0] {
        INIT,
        SEND_DATA
    } curr_state, next_state;

    always_ff @(posedge clk_pix, posedge rst) begin
        if (rst) begin
            curr_state <= INIT;
        end
        else begin
            curr_state <= next_state;
        end
    end

    always_comb begin
        /* Defaults */
        saw_pix = 'b0;
        hdmi_en = 'b0;
        h_cnt_en = 'b0;
        v_cnt_en = 'b0;
        h_cnt_clr = 'b0;
        v_cnt_clr = 'b0;
        next_state = curr_state;

        case (curr_state)
            INIT: begin
                h_cnt_clr = 'b1;
                v_cnt_clr = 'b1;
                if (pixel_rdy) begin
                    next_state = SEND_DATA;
                end
            end
            SEND_DATA: begin
                /* horizontal and vertical counters */
                if (h_sum < (`HTOTAL - 'd1)) begin
                    h_cnt_en = 'b1;
                end
                else begin
                    h_cnt_clr = 'b1;
                    if (v_sum < (`VTOTAL - 'd1)) begin
                        v_cnt_en = 'b1;
                    end
                    else begin
                        v_cnt_clr = 'b1;
                    end
                end
                /* if we're within active video, send */
                if ((v_sum >= `VBP) && (v_sum < `VFP)) begin
                    if ((h_sum >= `HBP) && (h_sum < `HFP)) begin
                        hdmi_en = 'b1;
                    end
                end

                if (pixel_rdy) begin
                    saw_pix = 'b1;
                end
            end
        endcase
    end

endmodule: video_fsm

module counter 
    #(parameter WIDTH = 'd32) (
    input  logic                    en, clr, rst, clk,
    output logic [$clog2(WIDTH):0]  sum);

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            sum <= 'd0;
        else if (clr)
            sum <= 'd0;
        else if (en)
            sum <= sum + 'd1;
    end

endmodule: counter

module register 
    #(parameter WIDTH = 'd32) (
    input  logic [WIDTH-1:0] in,
    input  logic             en, clr, rst, clk,
    output logic [WIDTH-1:0] out);

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            out <= 'd0;
        else if (clr)
            out <= 'd0;
        else if (en)
            out <= in;
    end

endmodule: register

module pixel_clock(
    input  logic clk, rst,
    output logic clk_pix);

    logic [1:0] count;

    // system is 200MHz -- pixel clock is 25MHz
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            count <= 1'b0;
            clk_pix <= 1'b0;
        end
        else begin
            count <= count + 1'b1;
            if (count == 2'd3) begin
                clk_pix <= ~clk_pix;
                count <= 2'd0;
            end
        end
    end

endmodule: pixel_clock
