module video(
    input  logic [23:0] data,
    input  logic        en, rst, clk,
    output logic [35:0] HDMI_DATA,
    output logic        rdy, HDMI_VSYNC, HDMI_HSYNC, HDMI_EN, HDMI_CLK);

    
    logic clk_pix, pix_clr;

    // used to synchronize pixel clock signal with external ready signal
    logic saw_rdy, saw_pix, pixel_rdy, pix_rdy; 
    logic [35:0] pixel, pix_data;
    logic hb_cnt_en, vb_cnt_en, hp_cnt_en, vp_cnt_en;
    logic hb_cnt_clr, vb_cnt_clr, hp_cnt_clr, vp_cnt_clr;
    logic [$clog2(480):0] vp_sum;
    logic [$clog2(640):0] hp_sum;
    logic [$clog2(160):0] hb_sum;
    logic [$clog2(45):0]  vb_sum;

    assign HDMI_DATA = pixel;
    assign HDMI_CLK = clk_pix;
    assign pix_data = {{data[23:16], 4'b0}, {data[15:8], 4'b0}, {data[7:0], 4'b0}};

    // hblank/hsync counters
    counter #(160) hblank_count (.en(hb_cnt_en), .clr(hb_cnt_clr), .rst(rst),
                                .clk(clk_pix), .sum(hb_sum));

    // vblank/vsync counters
    counter #(45) vblank_count (.en(vb_cnt_en), .clr(vb_cnt_clr), .rst(rst),
                                .clk(clk_pix), .sum(vb_sum));

    // height/width counters
    counter #(640) h_pixel_count (.en(hp_cnt_en), .clr(hp_cnt_clr), .rst(rst),
                             .clk(clk_pix), .sum(hp_sum));
    counter #(480) v_pixel_count (.en(vp_cnt_en), .clr(vp_cnt_clr), .rst(rst),
                             .clk(clk_pix), .sum(vp_sum));

    // buffered input signals -- pixel and ready
    register #(36) pixel_reg (.in(pix_data), .en(en), .rst(rst),
                              .clr(1'b0), .clk(clk), .out(pixel));
    register #(1) pixel_rdy_reg (.in(en), .en(en), .rst(rst),
                                 .clr(rdy), .clk(clk), .out(pix_rdy));

    video_fsm fsm (.*);
    pixel_clock pclk (.clk(clk), .clk_pix(clk_pix), .rst(rst));

    /* whether FSM is ready for more data -- on system clock in order
     * synchronize FSM with the outside world */
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            rdy <= 1'b1;
            saw_rdy <= 1'b0;
            pixel_rdy <= 1'b0;
        end
        /* Ghetto clock synchronization -- saw_data tells us we asserted
         * the ready once for the current system clock, saw_pix tells us
         * the FSM processed the current pixel. we want it such that we
         * don't assert the ready again until the fsm moves to new state */
        else if (!saw_rdy & saw_pix) begin
            rdy <= 1'b1;
            saw_rdy <= 1'b1;
        end
        else if (~saw_pix) begin
            saw_rdy <= 1'b0;
        end
        else begin
            rdy <= 1'b0;
        end
        
        if (en) begin
            pixel_rdy <= 1'b1;
        end
        else if (~saw_pix) begin
            pixel_rdy <= pix_rdy;
        end
    end

endmodule: video

module video_fsm(
    input  logic [$clog2(480):0] vp_sum,
    input  logic [$clog2(640):0] hp_sum,
    input  logic [$clog2(160):0] hb_sum,
    input  logic [$clog2(45):0]  vb_sum,
    input  logic pixel_rdy, rst, clk_pix,
    output logic saw_pix,
    output logic hb_cnt_en, vb_cnt_en, hp_cnt_en, vp_cnt_en,
    output logic hb_cnt_clr, vb_cnt_clr, hp_cnt_clr, vp_cnt_clr,
    output logic HDMI_VSYNC, HDMI_HSYNC, HDMI_EN);

    enum logic [4:0] {
        INIT,
        SEND_BLANK,
        SEND_DATA,
        WAIT_DATA
    } curr_vstate, next_vstate, curr_hstate, next_hstate;

    always_ff @(posedge clk_pix, posedge rst) begin
        if (rst) begin
            curr_hstate <= INIT;
            curr_vstate <= INIT;
        end
        else begin
            curr_hstate <= next_hstate;
            curr_vstate <= next_vstate;
        end
    end

    // handles horizontal syncs and pixels
    always_comb begin
        /* Defaults */
        next_hstate = curr_hstate;
        saw_pix = 'b0;
        hb_cnt_en = 'b0;
        hb_cnt_clr = 'b0;
        hp_cnt_en = 'b0;
        hp_cnt_clr = 'b0;
        HDMI_HSYNC = 'b1; HDMI_EN = 'b0;
        
        case (curr_hstate)
            INIT: begin
                hb_cnt_clr = 'b1;
                hp_cnt_clr = 'b1;
                if (pixel_rdy) next_hstate = SEND_BLANK;
            end
            SEND_BLANK: begin
                hb_cnt_en = 'b1;
                hp_cnt_clr = 'b1;
                if ((hb_sum > 'd16) && (hb_sum < 'd103)) HDMI_HSYNC = 'b0;
                else if (hb_sum == 'd160) next_hstate = SEND_DATA;
            end
            SEND_DATA: begin
                hb_cnt_clr = 'b1;
                hp_cnt_en = pixel_rdy;
                saw_pix = pixel_rdy;
                HDMI_EN = pixel_rdy;
                if (hp_sum == 'd640) next_hstate = SEND_BLANK;
                else if (pixel_rdy) next_hstate = WAIT_DATA;
            end
            WAIT_DATA: begin
                if (pixel_rdy) next_hstate = SEND_DATA;
            end
        endcase
    end

    // handles vertical syncs and pixels
    always_comb begin
        /* Defaults */
        next_vstate = curr_vstate;
        vb_cnt_en = 'b0;
        vb_cnt_clr = 'b0;
        vp_cnt_en = 'b0;
        vp_cnt_clr = 'b0;
        HDMI_VSYNC = 'b1;

        case (curr_vstate)
            INIT: begin
                vb_cnt_clr = 'b1;
                vp_cnt_clr = 'b1;
                if (pixel_rdy) next_vstate = SEND_BLANK;
            end
            SEND_BLANK: begin
                vp_cnt_clr = 'b1;
                if (hb_sum == 'd160) vb_cnt_en = 'b1;
                if ((vb_sum > 'd10) && (vb_sum < 'd13)) HDMI_VSYNC = 'b0;
                else if (vb_sum == 'd45) next_vstate = SEND_DATA;
            end
            SEND_DATA: begin // in vertical, used to hold vblank/vsync
                vb_cnt_clr = 'b1;
                if (hp_sum == 'd640) vp_cnt_en = 'b1;
                if (vp_sum == 'd480) next_vstate = SEND_BLANK;
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
    output logic clk_pix);

    logic [1:0] count;

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            count <= 1'b0;
            clk_pix <= 1'b0;
        end
        else begin
            count <= count + 1'b1;
            if (count == 2'd2) begin
                clk_pix <= ~clk_pix;
                count <= 2'd0;
            end
        end
    end

endmodule: pixel_clock

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
