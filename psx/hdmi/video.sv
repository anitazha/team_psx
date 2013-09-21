// NOTE: we're doing this in RGB with separate syncs @ 165 MHx (max).
//       apparently in this mode we don't need input style or channel alignment

//Input ID=5: An input format of RGB 4:4:4 DDR or YCbCr 4:4:4 DDR can be selected by setting the input ID (R0x15 [3:0]) to 0x5. The data bit
//width (12, 10, or 8 bits) must be set with R0x16 [5:4]. The three input pin assignment styles are shown in the table. The Input Style can be set in
//R0x16[3:2]. The 1st and the 2nd edge may be the rising or falling edge. The Data Input Edge is defined in R0x16 [1]. 0b1 = 1st edge rising edge; 0b0
//= 1st edge falling edge. Pixel 0 is the first pixel of the 4:4:4 word and should be where DE starts.

// Do 1920x1080 for the demo because I know what it looks like..
// hblank - 280   hsync - 
// vblank - 45    vsync - 
//

// rdy -- when we're ready for the next pixel, en -- when the pixel is ready
module video(
    input  logic [23:0] data,
    input  logic        en, rst, clk,
    output logic [35:0] HDMI_DATA,
    output logic        rdy, HDMI_VSYNC, HDMI_HSYNC, HDMI_EN, HDMI_CLK);

    logic pixclk;
    logic [35:0] pixel, hdmi_data;
    logic hs_cnt_en, hb_cnt_en, vs_cnt_en, vb_cnt_en, hp_cnt_en, vp_cnt_en;
    logic hs_cnt_clr, hb_cnt_clr, vs_cnt_clr, vb_cnt_clr, hp_cnt_clr, vp_cnt_clr;
    logic [$clog2(480):0] vp_sum;
    logic [$clog2(720):0] hp_sum;
    logic [$clog2(20):0]  hs_sum;
    logic [$clog2(138):0] hb_sum;
    logic [$clog2(20):0]  vs_sum;
    logic [$clog2(45):0]  vb_sum;

    assign hdmi_data = {{data[23:16], 4'b0}, {data[15:8], 4'b0}, {data[7:0], 4'b0}};

    // hblank/hsync counters
    counter #(20) hsync_count (.en(hs_cnt_en), .clr(hs_cnt_clr), .rst(rst),
                             .clk(clk), .sum(hs_sum));
    counter #(138) hblank_count (.en(hb_cnt_en), .clr(hb_cnt_clr), .rst(rst),
                             .clk(clk), .sum(hb_sum));

    // vblank/vsync counters
    counter #(20) vsync_count (.en(vs_cnt_en), .clr(vs_cnt_clr), .rst(rst),
                             .clk(clk), .sum(vs_sum));
    counter #(45) vblank_count (.en(vb_cnt_en), .clr(vb_cnt_clr), .rst(rst),
                             .clk(clk), .sum(vb_sum));

    // height/width counters
    counter #(720) h_pixel_count (.en(hp_cnt_en), .clr(hp_cnt_clr), .rst(rst),
                             .clk(clk), .sum(hp_sum));
    counter #(480) v_pixel_count (.en(vp_cnt_en), .clr(vp_cnt_clr), .rst(rst),
                             .clk(clk), .sum(vp_sum));

    video_fsm fsm (.*);
    register #(36) pixel_reg (.in(hdmi_data), .en(en), .rst(rst), .clk(clk), .out(pixel));

    pixel_clock pclk (.clk(clk), .pixclk(pixclk), .rst(rst));

    // data and clock don't matter as long as FSM outputs correct enables
    assign HDMI_DATA = pixel;
    assign HDMI_CLK = pixclk;

endmodule: video

module video_fsm(
    input  logic [$clog2(480):0] vp_sum,
    input  logic [$clog2(720):0] hp_sum,
    input  logic [$clog2(20):0]  hs_sum,
    input  logic [$clog2(138):0] hb_sum,
    input  logic [$clog2(20):0]  vs_sum,
    input  logic [$clog2(45):0]  vb_sum,
    input  logic en, rst, clk,
    output logic rdy, hs_cnt_en, hb_cnt_en, vs_cnt_en, vb_cnt_en, hp_cnt_en, vp_cnt_en,
    output logic hs_cnt_clr, hb_cnt_clr, vs_cnt_clr, vb_cnt_clr, hp_cnt_clr, vp_cnt_clr,
    output logic HDMI_VSYNC, HDMI_HSYNC, HDMI_EN);

    enum logic [4:0] {
        init,
        send_frame,
        send_syncs,
        send_hblank,
        wait_syncs,
        finish_vblank,
        finish_hblank,
        send_hsync,
        send_data
    } curr_state, next_state;

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            curr_state <= init;
        else
            curr_state <= next_state;
    end

    always_comb begin
        next_state = curr_state;
        hs_cnt_en = 'b0; hb_cnt_en = 'b0;
        vs_cnt_en = 'b0; vb_cnt_en = 'b0;
        hp_cnt_en = 'b0; vp_cnt_en = 'b0;
        hs_cnt_clr = 'b0; hb_cnt_clr = 'b0;
        vs_cnt_clr = 'b0; vb_cnt_clr = 'b0;
        hp_cnt_clr = 'b0; vp_cnt_clr = 'b0;
        HDMI_VSYNC = 'b0; HDMI_HSYNC = 'b0; HDMI_EN = 'b0;
        rdy = 'b0;

        case (curr_state)
            init:
                if (en) next_state = send_frame;
            send_frame: begin
                hb_cnt_en = 'b1;
                vb_cnt_en = 'b1;
                hp_cnt_clr = 'b1;
                vp_cnt_clr = 'b1;
                // if we have sufficient blanking, send hsync
                if (hb_sum == 'd10)
                    next_state = send_syncs;
            end
            send_syncs: begin
                hb_cnt_en = 'b1;
                vb_cnt_en = 'b1;
                hs_cnt_en = 'b1;
                vs_cnt_en = 'b1;
                HDMI_VSYNC = 'b1;
                HDMI_HSYNC = 'b1;
                if (hs_sum == 'd20) next_state = wait_syncs;
            end
            wait_syncs: begin
                hb_cnt_en = 'b1;
                vb_cnt_en = 'b1;
                hs_cnt_clr = 'b1;
                vs_cnt_clr = 'b1;
                if (vb_sum == 'd45) next_state = finish_vblank;
            end
            finish_vblank: begin
                hb_cnt_en = 'b1;
                vb_cnt_clr = 'b1;
                if (hb_sum == 'd138) next_state = finish_hblank;
            end
            finish_hblank: begin
                hb_cnt_clr = 'b1;

                next_state = send_data;
            end
            send_hblank: begin
                hb_cnt_en = 'b1;
                hs_cnt_clr = 'b1;
                hp_cnt_clr = 'b1;
                if (hb_sum == 'd138) begin
                    vp_cnt_en = 'b1;
                    next_state = send_data;
                end
                else if (hb_sum == 'd10) next_state = send_hsync;
            end
            send_hsync: begin
                hb_cnt_en = 'b1;
                hs_cnt_en = 'b1;
                HDMI_HSYNC = 'b1;
                if (hs_sum == 'd20) next_state = send_hblank;
            end
            send_data: begin
                rdy = 1'b1;
                HDMI_EN = en;
                hp_cnt_en = en;
                if (hp_sum == 'd720) next_state = send_hblank;
                else if (vp_sum == 'd480) next_state = send_frame;
            end
        endcase
    end
endmodule: video_fsm

module counter(
    input  logic                    en, clr, rst, clk,
    output logic [$clog2(WIDTH):0]  sum);

    /* Parameters */
    parameter WIDTH = 'd32;

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            sum <= 'd0;
        else if (clr)
            sum <= 'd0;
        else if (en)
            sum <= sum + 'd1;
    end

endmodule: counter

module pixel_clock(
    input  logic clk, rst,
    output logic pixclk);

    logic count;

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            count <= 1'b0;
            pixclk <= 1'b0;
        end
        else begin
            count <= count + 1'b1;
            if (count == 1'b1)
                pixclk <= ~pixclk;
        end
    end

endmodule: pixel_clock

module register 
    #(parameter WIDTH = 'd32) (
    input  logic [WIDTH-1:0] in,
    input  logic             en, rst, clk,
    output logic [WIDTH-1:0] out);

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            out <= 'd0;
        else if (en)
            out <= in;
    end

endmodule: register
