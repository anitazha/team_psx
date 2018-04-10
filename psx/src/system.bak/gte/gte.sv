`default_nettype none

module gte_fsm(
    input  logic inst_rdy, avail, stall, clk, rst,
    output logic clr_inst, ld_inst, out_avail, en_cyc);

    enum {WAIT, BUSY} curr_state, next_state;

    always_ff @(posedge clk, posedge rst) begin
        if (rst)
            curr_state <= WAIT;
        else
            curr_state <= next_state;
    end

    always_comb begin
        /* Defaults */
		  next_state = curr_state;
        en_cyc   = 1'b0;
        ld_inst  = 1'b0;
        clr_inst = 1'b0;
        out_avail = 1'b0;

        case (curr_state)
            WAIT: begin
                out_avail = 'b1;
                if (inst_rdy & ~stall) begin
                    ld_inst = 'b1;
                    next_state = BUSY;
                end
                else begin
                    clr_inst = 'b1;
                end
            end
            BUSY: begin
                en_cyc = 'b1;
                if (avail) begin
                    clr_inst = 'b1;
                    next_state = WAIT;
                end
            end
        endcase
    end
endmodule: gte_fsm

module gte(
    input         clk, rst,
    input         cfc2,       // mov from cop2d
    input         ctc2,       // mov to cop2d
    input         mfc2,       // mov from cop2c
    input         mtc2,       // mov to cop2c
    input         lwc2,       // load from mem to cop2d
    input         swc2,       // load from cop2d to mem
    input         gte_sf,     // Shift fraction
    input  [1:0]  gte_mx,     // Matrix multiplication vector
    input  [1:0]  gte_vx,     // Matrix something vector
    input  [1:0]  gte_tx,     // something matrix
    input         gte_lm,     // limiter select
    input  [5:0]  gte_cmd,    // GTE command code
    input  [31:0] reg_in,     // data to move to external reg
    input         reg_in_rdy, // data to move out is ready
    input  [4:0]  rd,         // destination register
    input         inst_rdy,   // instruction is ready
    input         halted,     // used for printing the registers
    input         stall,
    output [31:0] reg_out,    // register data out
    output        out_avail   // indicates instruction in progress
    );

    always_ff @(posedge clk) begin
        if (inst_rdy)
            $stop;
    end

    // instruction register signals
    logic        [5:0] curr_inst;
    logic              ld_inst, clr_inst;

    // cycles register/counter signals
    logic        [5:0] num_cyc, curr_cyc, inst_cnt;
    logic              en_cyc;

    // control and data registers and status -- for writeback
    logic [31:0][31:0] cop2c, nxt_cop2c;
    logic [31:0][31:0] cop2d, nxt_cop2d;
    logic              mtc2_en, ctc2_en;
    cop2c_t            c2c; // for calculation & writeback
    cop2d_t            c2d; // for calculation & writeback

    // matrix mulitplication signals
    logic  [3:1][15:0] mx_vec1, mx_vec2, mx_vec3;
    logic  [3:1][15:0] v_vec;
    logic  [3:1][15:0] cv_vec;

    // intermediate signals
    logic  [3:1][53:0] ipl,  nxt_ipl;
    logic  [3:1][53:0] mt,   nxt_mt;
    logic       [53:0] opx,  nxt_opx;
    logic       [53:0] opy,  nxt_opy;
    logic       [53:0] opz,  nxt_opz;
    logic       [53:0] ipx,  nxt_ipx;
    logic       [53:0] ipy,  nxt_ipy;
    logic       [53:0] ipz,  nxt_ipz;
    logic       [53:0] l1,   nxt_l1;
    logic       [53:0] l2,   nxt_l2;
    logic       [53:0] l3,   nxt_l3;
    logic  [2:0][53:0] ll1,  nxt_ll1;
    logic  [2:0][53:0] ll2,  nxt_ll2;
    logic  [2:0][53:0] ll3,  nxt_ll3;
    logic  [2:0][53:0] rrlt, nxt_rrlt;
    logic  [2:0][53:0] gglt, nxt_gglt;
    logic  [2:0][53:0] bblt, nxt_bblt;
    logic       [53:0] p,    nxt_p;
    logic  [2:0][53:0] sx,   nxt_sx;
    logic  [2:0][53:0] sy,   nxt_sy;
    logic  [2:0][53:0] sz,   nxt_sz;
    logic  [2:0][53:0] ssx,  nxt_ssx;
    logic  [2:0][53:0] ssy,  nxt_ssy;
    logic  [2:0][53:0] ssz,  nxt_ssz;
    logic       [53:0] ootz, nxt_ootz;
    logic  [2:0][53:0] rr,   nxt_rr;
    logic  [2:0][53:0] gg,   nxt_gg;
    logic  [2:0][53:0] bb,   nxt_bb;
    logic       [20:0] div,  nxt_div;
    logic        [1:0] n,    nxt_n;

    // instruction decode flags
    logic        [1:0] mx, v, cv;
    logic              sf, lm;

    // divider signals
    logic       [15:0] div_num, div_den, div_quo;

    // internal
    logic              avail;

    // module instantiations
    up_counter #(6) cyc_reg (.Q(curr_cyc), .en(en_cyc), .clr(clr_inst), .*);
    gte_decode   cyc_decode (.rdy(ld_inst), .inst(gte_cmd), .inst_cnt(inst_cnt));
    gte_fsm      GTEfsm (.*);

    // 3 cycle pipelined divider
    lpm_div alt_divider(
	        .clock      (clk),
	        .numer      (div_num),
	        .denom      (div_den),
	        .quotient   (div_quo),
	        .remain     ()
            );

    // latch instruction specific input
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            mx   <= 'd0;
            v    <= 'd0;
            cv   <= 'd0;
            lm   <= 'd0;
            sf   <= 'd0;
            curr_inst <= 'd0;
            num_cyc <= 'd0;
        end
        else if (clr_inst) begin
            mx   <= 'd0;
            v    <= 'd0;
            cv   <= 'd0;
            lm   <= 'd0;
            sf   <= 'd0;
            curr_inst <= 'd0;
            num_cyc <= 'd0;
        end
        else if (ld_inst) begin
            mx   <= gte_mx;
            v    <= gte_vx;
            cv   <= gte_tx;
            lm   <= gte_lm;
            sf   <= gte_sf;
            curr_inst <= gte_cmd;
            num_cyc <= inst_cnt;
        end
    end

    // on the last cycle of the instruction GTE is "available"
    assign avail = (((curr_cyc==num_cyc) | (num_cyc=='b0)) & (lwc2 ? reg_in_rdy : 1'd1));

    // external register read logic
    assign reg_out = (mfc2 | swc2) ? cop2d[rd] : ((cfc2) ? cop2c[rd] : 32'h0);

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            cop2c <= 'd0;
            cop2d <= 'd0;
        end
        else if (ctc2_en) begin
            // writeback cop2c registers
				cop2c <= nxt_cop2c;
        end
        else if (mtc2_en) begin
				// writeback cop2d registers
				cop2d <= nxt_cop2d;
        end
        else begin
            // writeback cop2c registers
            cop2c[`IDX_R11R12][31:16] <= c2c.r1[2];
            cop2c[`IDX_R11R12][15:0]  <= c2c.r1[1];
            cop2c[`IDX_R13R21][31:16] <= c2c.r2[1];
            cop2c[`IDX_R13R21][15:0]  <= c2c.r1[3];
            cop2c[`IDX_R22R23][15:0]  <= c2c.r2[2];
            cop2c[`IDX_R22R23][31:16] <= c2c.r2[3];
            cop2c[`IDX_R31R32][15:0]  <= c2c.r3[1];
            cop2c[`IDX_R31R32][31:16] <= c2c.r3[2];
            cop2c[`IDX_R33][15:0]     <= c2c.r3[3];
            cop2c[`IDX_TRX]           <= c2c.trx;
            cop2c[`IDX_TRY]           <= c2c.try;
            cop2c[`IDX_TRZ]           <= c2c.trz;
            cop2c[`IDX_L11L12][31:16] <= c2c.l1[2];
            cop2c[`IDX_L11L12][15:0]  <= c2c.l1[1];
            cop2c[`IDX_L13L21][31:16] <= c2c.l2[1];
            cop2c[`IDX_L13L21][15:0]  <= c2c.l1[3];
            cop2c[`IDX_L22L23][31:16] <= c2c.l2[3];
            cop2c[`IDX_L22L23][15:0]  <= c2c.l2[2];
            cop2c[`IDX_L31L32][31:16] <= c2c.l3[2];
            cop2c[`IDX_L31L32][15:0]  <= c2c.l3[1];
            cop2c[`IDX_L33][15:0]     <= c2c.l3[3];
            cop2c[`IDX_RBK]           <= c2c.rbk;
            cop2c[`IDX_GBK]           <= c2c.gbk;
            cop2c[`IDX_BBK]           <= c2c.bbk;
            cop2c[`IDX_LR1LR2][31:16] <= c2c.lr[2];
            cop2c[`IDX_LR1LR2][15:0]  <= c2c.lr[1];
            cop2c[`IDX_LR3LG1][31:16] <= c2c.lg[1];
            cop2c[`IDX_LR3LG1][15:0]  <= c2c.lr[3];
            cop2c[`IDX_LG2LG3][31:16] <= c2c.lg[3];
            cop2c[`IDX_LG2LG3][15:0]  <= c2c.lg[2];
            cop2c[`IDX_LB1LB2][31:16] <= c2c.lb[2];
            cop2c[`IDX_LB1LB2][15:0]  <= c2c.lb[1];
            cop2c[`IDX_LB3][15:0]     <= c2c.lb[3];
            cop2c[`IDX_RFC]           <= c2c.rfc;
            cop2c[`IDX_GFC]           <= c2c.gfc;
            cop2c[`IDX_BFC]           <= c2c.bfc;
            cop2c[`IDX_OFX]           <= c2c.ofx;
            cop2c[`IDX_OFY]           <= c2c.ofy;
            cop2c[`IDX_H][15:0]       <= c2c.h;
            cop2c[`IDX_DQA][15:0]     <= c2c.dqa;
            cop2c[`IDX_DQB]           <= c2c.dqb;
            cop2c[`IDX_ZSF3][15:0]    <= c2c.zsf3;
            cop2c[`IDX_ZSF4][15:0]    <= c2c.zsf4;
            cop2c[`IDX_FLAG]          <= c2c.flag;
            // writeback cop2d registers
            cop2d[`IDX_VXY0][31:16]   <= c2d.vy[0];
            cop2d[`IDX_VXY0][15:0]    <= c2d.vx[0];
            cop2d[`IDX_VZ0][15:0]     <= c2d.vz[0];
            cop2d[`IDX_VXY1][31:16]   <= c2d.vy[1];
            cop2d[`IDX_VXY1][15:0]    <= c2d.vx[1];
            cop2d[`IDX_VZ1][15:0]     <= c2d.vz[1];
            cop2d[`IDX_VXY2][31:16]   <= c2d.vy[2];
            cop2d[`IDX_VXY2][15:0]    <= c2d.vx[2];
            cop2d[`IDX_VZ2][15:0]     <= c2d.vz[2];
            cop2d[`IDX_RGB][31:24]    <= c2d.RGB.cd;
            cop2d[`IDX_RGB][23:16]    <= c2d.RGB.b;
            cop2d[`IDX_RGB][15:8]     <= c2d.RGB.g;
            cop2d[`IDX_RGB][7:0]      <= c2d.RGB.r;
            cop2d[`IDX_OTZ][15:0]     <= c2d.otz;
            cop2d[`IDX_IR0]           <= c2d.ir[0];
            cop2d[`IDX_IR1]           <= c2d.ir[1];
            cop2d[`IDX_IR2]           <= c2d.ir[2];
            cop2d[`IDX_IR3]           <= c2d.ir[3];
            cop2d[`IDX_SXY0][31:16]   <= c2d.sy[0];
            cop2d[`IDX_SXY0][15:0]    <= c2d.sx[0];
            cop2d[`IDX_SXY1][31:16]   <= c2d.sy[1];
            cop2d[`IDX_SXY1][15:0]    <= c2d.sx[1];
            cop2d[`IDX_SXY2][31:16]   <= c2d.sy[2];
            cop2d[`IDX_SXY2][15:0]    <= c2d.sx[2];
            cop2d[`IDX_SXYP][31:16]   <= c2d.syp;
            cop2d[`IDX_SXYP][15:0]    <= c2d.sxp;
            cop2d[`IDX_SZ0][15:0]     <= c2d.sz[0];
            cop2d[`IDX_SZ1][15:0]     <= c2d.sz[1];
            cop2d[`IDX_SZ2][15:0]     <= c2d.sz[2];
            cop2d[`IDX_SZ3][15:0]     <= c2d.sz[3];
            cop2d[`IDX_RGB0][31:24]   <= c2d.rgb[0].cd;
            cop2d[`IDX_RGB0][23:16]   <= c2d.rgb[0].b;
            cop2d[`IDX_RGB0][15:8]    <= c2d.rgb[0].g;
            cop2d[`IDX_RGB0][7:0]     <= c2d.rgb[0].r;
            cop2d[`IDX_RGB1][31:24]   <= c2d.rgb[1].cd;
            cop2d[`IDX_RGB1][23:16]   <= c2d.rgb[1].b;
            cop2d[`IDX_RGB1][15:8]    <= c2d.rgb[1].g;
            cop2d[`IDX_RGB1][7:0]     <= c2d.rgb[1].r;
            cop2d[`IDX_RGB2][31:24]   <= c2d.rgb[2].cd;
            cop2d[`IDX_RGB2][23:16]   <= c2d.rgb[2].b;
            cop2d[`IDX_RGB2][15:8]    <= c2d.rgb[2].g;
            cop2d[`IDX_RGB2][7:0]     <= c2d.rgb[2].r;
            cop2d[`IDX_MAC0]          <= c2d.mac[0];
            cop2d[`IDX_MAC1]          <= c2d.mac[1];
            cop2d[`IDX_MAC2]          <= c2d.mac[2];
            cop2d[`IDX_MAC3]          <= c2d.mac[3];
            cop2d[`IDX_IRGB][14:10]   <= c2d.irgb.b;
            cop2d[`IDX_IRGB][9:5]     <= c2d.irgb.g;
            cop2d[`IDX_IRGB][4:0]     <= c2d.irgb.r;
            cop2d[`IDX_ORGB][14:10]   <= c2d.orgb.b;
            cop2d[`IDX_ORGB][9:5]     <= c2d.orgb.g;
            cop2d[`IDX_ORGB][4:0]     <= c2d.orgb.r;
            cop2d[`IDX_LZCS]          <= c2d.lzcs;
            cop2d[`IDX_LZCR]          <= c2d.lzcr;
        end
    end

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            ipl   <= 'd0;
            mt    <= 'd0;
            opx   <= 'd0;
            opy   <= 'd0;
            opz   <= 'd0;
            ipx   <= 'd0;
            ipy   <= 'd0;
            ipz   <= 'd0;
            l1    <= 'd0;
            l2    <= 'd0;
            l3    <= 'd0;
            ll1   <= 'd0;
            ll2   <= 'd0;
            ll3   <= 'd0;
            rrlt  <= 'd0;
            gglt  <= 'd0;
            bblt  <= 'd0;
            p     <= 'd0; 
            sx    <= 'd0; 
            sy    <= 'd0;
            sz    <= 'd0;
            ssx   <= 'd0;
            ssy   <= 'd0;
            ssz   <= 'd0;
            opz   <= 'd0;
            ootz  <= 'd0;
            rr    <= 'd0;
            gg    <= 'd0;
            bb    <= 'd0;
            div   <= 'd0;
            n     <= 'd0;
        end
        else if (avail) begin
            ipl   <= 'd0;
            mt    <= 'd0;
            opx   <= 'd0;
            opy   <= 'd0;
            opz   <= 'd0;
            ipx   <= 'd0;
            ipy   <= 'd0;
            ipz   <= 'd0;
            l1    <= 'd0;
            l2    <= 'd0;
            l3    <= 'd0;
            ll1   <= 'd0;
            ll2   <= 'd0;
            ll3   <= 'd0;
            rrlt  <= 'd0;
            gglt  <= 'd0;
            bblt  <= 'd0;
            p     <= 'd0; 
            sx    <= 'd0; 
            sy    <= 'd0;
            sz    <= 'd0;
            ssx   <= 'd0;
            ssy   <= 'd0;
            ssz   <= 'd0;
            opz   <= 'd0;
            ootz  <= 'd0;
            rr    <= 'd0;
            gg    <= 'd0;
            bb    <= 'd0;
            div   <= 'd0;
            n     <= 'd0;
        end
        else begin
            // intermediates
            ipl   <= nxt_ipl;
            mt    <= nxt_mt;
            opx   <= nxt_opx;
            opy   <= nxt_opy;
            opz   <= nxt_opz;
            ipx   <= nxt_ipx;
            ipy   <= nxt_ipy;
            ipz   <= nxt_ipz;
            l1    <= nxt_l1;
            l2    <= nxt_l2;
            l3    <= nxt_l3;
            ll1   <= nxt_ll1;
            ll2   <= nxt_ll2;
            ll3   <= nxt_ll3;
            rrlt  <= nxt_rrlt;
            gglt  <= nxt_gglt;
            bblt  <= nxt_bblt;
            p     <= nxt_p; 
            sx    <= nxt_sx; 
            sy    <= nxt_sy;
            sz    <= nxt_sz;
            ssx   <= nxt_ssx;
            ssy   <= nxt_ssy;
            ssz   <= nxt_ssz;
            opz   <= nxt_opz;
            ootz  <= nxt_ootz;
            rr    <= nxt_rr;
            gg    <= nxt_gg;
            bb    <= nxt_bb;
            div   <= nxt_div;
            n     <= nxt_n;
        end
    end

    always_comb begin
        // defaults
        div_den       = 'd1;
        div_num       = 'd0;
        mx_vec1       = 'd0;
        mx_vec2       = 'd0;
        mx_vec3       = 'd0;
        v_vec         = 'd0;
        cv_vec        = 'd0;
        nxt_ipl       = ipl;
        nxt_mt        = mt;
        nxt_opx       = opx;
        nxt_opy       = opy;
        nxt_opz       = opz;
        nxt_ipx       = ipx;
        nxt_ipy       = ipy;
        nxt_ipz       = ipz;
        nxt_l1        = l1;
        nxt_l2        = l2;
        nxt_l3        = l3;
        nxt_ll1       = ll1;
        nxt_ll2       = ll2;
        nxt_ll3       = ll3;
        nxt_rrlt      = rrlt;
        nxt_gglt      = gglt;
        nxt_bblt      = bblt;
        nxt_p         = p; 
        nxt_sx        = sx; 
        nxt_sy        = sy; 
        nxt_sz        = sz; 
        nxt_ssx       = ssx; 
        nxt_ssy       = ssy; 
        nxt_ssz       = ssz; 
        nxt_opz       = opz;
        nxt_ootz      = ootz;
        nxt_rr        = rr;
        nxt_gg        = gg;
        nxt_bb        = bb;
        nxt_div       = div;
        nxt_n         = n;
        mtc2_en       = 1'h0;
        ctc2_en       = 1'h0;
        nxt_cop2c     = cop2c;
        nxt_cop2d     = cop2d;
        c2c.r1[2]     = cop2c[`IDX_R11R12][31:16];
        c2c.r1[1]     = cop2c[`IDX_R11R12][15:0];
        c2c.r2[1]     = cop2c[`IDX_R13R21][31:16];
        c2c.r1[3]     = cop2c[`IDX_R13R21][15:0];
        c2c.r2[2]     = cop2c[`IDX_R22R23][15:0];
        c2c.r2[3]     = cop2c[`IDX_R22R23][31:16];
        c2c.r3[1]     = cop2c[`IDX_R31R32][15:0];
        c2c.r3[2]     = cop2c[`IDX_R31R32][31:16];
        c2c.r3[3]     = cop2c[`IDX_R33][15:0];
        c2c.trx       = cop2c[`IDX_TRX];
        c2c.try       = cop2c[`IDX_TRY];
        c2c.trz       = cop2c[`IDX_TRZ];
        c2c.l1[2]     = cop2c[`IDX_L11L12][31:16];
        c2c.l1[1]     = cop2c[`IDX_L11L12][15:0];
        c2c.l2[1]     = cop2c[`IDX_L13L21][31:16];
        c2c.l1[3]     = cop2c[`IDX_L13L21][15:0];
        c2c.l2[3]     = cop2c[`IDX_L22L23][31:16];
        c2c.l2[2]     = cop2c[`IDX_L22L23][15:0];
        c2c.l3[2]     = cop2c[`IDX_L31L32][31:16];
        c2c.l3[1]     = cop2c[`IDX_L31L32][15:0];
        c2c.l3[3]     = cop2c[`IDX_L33][15:0];
        c2c.rbk       = cop2c[`IDX_RBK];
        c2c.gbk       = cop2c[`IDX_GBK];
        c2c.bbk       = cop2c[`IDX_BBK];
        c2c.lr[2]     = cop2c[`IDX_LR1LR2][31:16];
        c2c.lr[1]     = cop2c[`IDX_LR1LR2][15:0];
        c2c.lg[1]     = cop2c[`IDX_LR3LG1][31:16];
        c2c.lr[3]     = cop2c[`IDX_LR3LG1][15:0];
        c2c.lg[3]     = cop2c[`IDX_LG2LG3][31:16];
        c2c.lg[2]     = cop2c[`IDX_LG2LG3][15:0];
        c2c.lb[2]     = cop2c[`IDX_LB1LB2][31:16];
        c2c.lb[1]     = cop2c[`IDX_LB1LB2][15:0];
        c2c.lb[3]     = cop2c[`IDX_LB3][15:0];
        c2c.rfc       = cop2c[`IDX_RFC];
        c2c.gfc       = cop2c[`IDX_GFC];
        c2c.bfc       = cop2c[`IDX_BFC];
        c2c.ofx       = cop2c[`IDX_OFX];
        c2c.ofy       = cop2c[`IDX_OFY];
        c2c.h         = cop2c[`IDX_H][15:0];
        c2c.dqa       = cop2c[`IDX_DQA][15:0];
        c2c.dqb       = cop2c[`IDX_DQB];
        c2c.zsf3      = cop2c[`IDX_ZSF3][15:0];
        c2c.zsf4      = cop2c[`IDX_ZSF4][15:0];
        c2c.flag      = cop2c[`IDX_FLAG];
        c2d.vy[0]     = cop2d[`IDX_VXY0][31:16];
        c2d.vx[0]     = cop2d[`IDX_VXY0][15:0];
        c2d.vz[0]     = cop2d[`IDX_VZ0][15:0];
        c2d.vy[1]     = cop2d[`IDX_VXY1][31:16];
        c2d.vx[1]     = cop2d[`IDX_VXY1][15:0];
        c2d.vz[1]     = cop2d[`IDX_VZ1][15:0];
        c2d.vy[2]     = cop2d[`IDX_VXY2][31:16];
        c2d.vx[2]     = cop2d[`IDX_VXY2][15:0];
        c2d.vz[2]     = cop2d[`IDX_VZ2][15:0];
        c2d.RGB.cd    = cop2d[`IDX_RGB][31:24];
        c2d.RGB.b     = cop2d[`IDX_RGB][23:16];
        c2d.RGB.g     = cop2d[`IDX_RGB][15:8];
        c2d.RGB.r     = cop2d[`IDX_RGB][7:0];
        c2d.otz       = cop2d[`IDX_OTZ][15:0];
        c2d.ir[0]     = cop2d[`IDX_IR0];
        c2d.ir[1]     = cop2d[`IDX_IR1];
        c2d.ir[2]     = cop2d[`IDX_IR2];
        c2d.ir[3]     = cop2d[`IDX_IR3];
        c2d.sy[0]     = cop2d[`IDX_SXY0][31:16];
        c2d.sx[0]     = cop2d[`IDX_SXY0][15:0];
        c2d.sy[1]     = cop2d[`IDX_SXY1][31:16];
        c2d.sx[1]     = cop2d[`IDX_SXY1][15:0];
        c2d.sy[2]     = cop2d[`IDX_SXY2][31:16];
        c2d.sx[2]     = cop2d[`IDX_SXY2][15:0];
        c2d.syp       = cop2d[`IDX_SXYP][31:16];
        c2d.sxp       = cop2d[`IDX_SXYP][15:0];
        c2d.sz[0]     = cop2d[`IDX_SZ0][15:0];
        c2d.sz[1]     = cop2d[`IDX_SZ1][15:0];
        c2d.sz[2]     = cop2d[`IDX_SZ2][15:0];
        c2d.sz[3]     = cop2d[`IDX_SZ3][15:0];
        c2d.rgb[0].cd = cop2d[`IDX_RGB0][31:24];
        c2d.rgb[0].b  = cop2d[`IDX_RGB0][23:16];
        c2d.rgb[0].g  = cop2d[`IDX_RGB0][15:8];
        c2d.rgb[0].r  = cop2d[`IDX_RGB0][7:0];
        c2d.rgb[1].cd = cop2d[`IDX_RGB1][31:24];
        c2d.rgb[1].b  = cop2d[`IDX_RGB1][23:16];
        c2d.rgb[1].g  = cop2d[`IDX_RGB1][15:8];
        c2d.rgb[1].r  = cop2d[`IDX_RGB1][7:0];
        c2d.rgb[2].cd = cop2d[`IDX_RGB2][31:24];
        c2d.rgb[2].b  = cop2d[`IDX_RGB2][23:16];
        c2d.rgb[2].g  = cop2d[`IDX_RGB2][15:8];
        c2d.rgb[2].r  = cop2d[`IDX_RGB2][7:0];
        c2d.mac[0]    = cop2d[`IDX_MAC0];
        c2d.mac[1]    = cop2d[`IDX_MAC1];
        c2d.mac[2]    = cop2d[`IDX_MAC2];
        c2d.mac[3]    = cop2d[`IDX_MAC3];
        c2d.irgb.b    = cop2d[`IDX_IRGB][14:10];
        c2d.irgb.g    = cop2d[`IDX_IRGB][9:5];
        c2d.irgb.r    = cop2d[`IDX_IRGB][4:0];
        c2d.orgb.b    = cop2d[`IDX_ORGB][14:10];
        c2d.orgb.g    = cop2d[`IDX_ORGB][9:5];
        c2d.orgb.r    = cop2d[`IDX_ORGB][4:0];
        c2d.lzcs      = cop2d[`IDX_LZCS];
        c2d.lzcr      = cop2d[`IDX_LZCR];
        
        // setup for matrix multiply
        if (mx == 0) begin
            mx_vec1 = c2c.r1;
            mx_vec2 = c2c.r2;
            mx_vec3 = c2c.r3;
        end
        else if (mx == 1) begin
            mx_vec1 = c2c.l1;
            mx_vec2 = c2c.l2;
            mx_vec3 = c2c.l3;
        end
        else if (mx == 2) begin
            mx_vec1 = c2c.lr;
            mx_vec2 = c2c.lg;
            mx_vec3 = c2c.lb;
        end

        // setup for vector multiply
        if (v == 0) begin
            v_vec[1] = c2d.vx[0];
            v_vec[2] = c2d.vy[0];
            v_vec[3] = c2d.vz[0];
        end
        else if (v == 1) begin
            v_vec[1] = c2d.vx[1];
            v_vec[2] = c2d.vy[1];
            v_vec[3] = c2d.vz[1];
        end
        else if (v == 2) begin
            v_vec[1] = c2d.vx[2];
            v_vec[2] = c2d.vy[2];
            v_vec[3] = c2d.vz[2];
        end

        // setup for some other vector
        if (cv == 0) begin
            cv_vec[1] = c2c.trx;
            cv_vec[2] = c2c.try;
            cv_vec[3] = c2c.trz;
        end
        else if (cv == 1) begin
            cv_vec[1] = c2c.rbk;
            cv_vec[2] = c2c.gbk;
            cv_vec[3] = c2c.bbk;
        end
        else if (cv == 2) begin
            cv_vec[1] = c2c.rfc;
            cv_vec[2] = c2c.gfc;
            cv_vec[3] = c2c.bfc;
        end

        // Register write logic
        if (reg_in_rdy) begin
            if (mtc2 | lwc2) begin
                mtc2_en = 1'h1;
                nxt_cop2d[rd] = reg_in;
            end
            else if (ctc2) begin
                ctc2_en = 1'h1;
                nxt_cop2c[rd] = reg_in;
            end
        end

        // General GTE command execution
        case(curr_inst)
            `INST_RTPS: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_ssx[0] = mult16(c2c.r1[1], c2d.vx[0]) + c2c.trx;
                        nxt_ssy[0] = mult16(c2c.r2[1], c2d.vx[0]) + c2c.try;
                        nxt_ssz[0] = mult16(c2c.r3[1], c2d.vx[0]) + c2c.trz;
                    end
                    6'd1: begin
                        nxt_ssx[0] = mult16(c2c.r1[2], c2d.vy[0]) + ssx[0];
                        nxt_ssy[0] = mult16(c2c.r2[2], c2d.vy[0]) + ssy[0];
                        nxt_ssz[0] = mult16(c2c.r3[2], c2d.vy[0]) + ssz[0];
                    end
                    6'd2: begin
                        nxt_ssx[0] = mult16(c2c.r1[3], c2d.vz[0]) + ssx[0];
                        nxt_ssy[0] = mult16(c2c.r2[3], c2d.vz[0]) + ssy[0];
                        nxt_ssz[0] = mult16(c2c.r3[3], c2d.vz[0]) + ssz[0];
                    end
                    6'd3: begin
                        c2c.flag[1] = (|ssx[0][53:44]);
                        c2c.flag[2] = (|ssy[0][53:44]);
                        c2c.flag[3] = (|ssz[0][53:44]);
                    end
                    6'd4: begin
                        c2d.ir[1] = limA1S(ssx[0][43:12]);
                        c2d.ir[2] = limA2S(ssy[0][43:12]);
                        c2d.ir[3] = limA3S(ssz[0][43:12]);
                    end
                    6'd5: begin
                        c2d.sz[0] = c2d.sz[1];
                        c2d.sz[1] = c2d.sz[2];
                        c2d.sz[2] = c2d.sz[3];
                        c2d.sz[3] = limC(ssz[0][43:12]);
                        div_num = c2c.h;
                        div_den = c2d.sz[3];
                    end
                    // 6'd6: NOP NOP NOP
                    // 6'd7: NOP NOP NOP
                    6'd8: begin
                        nxt_div = div_quo;
                    end
                    6'd9: begin
                        nxt_div = (div > 'h1FFFF) ? 'h1FFFF : div;
                        c2c.flag[17] = (div > 'h1FFFF);
                    end
                    6'd10: begin
                        nxt_sx[0] = c2c.ofx + mult16(c2d.ir[1], div);
                        nxt_sy[0] = c2c.ofy + mult16(c2d.ir[2], div);
                        c2c.flag[4] = (sx[0][53:43] != 'd0);
                    end
                    6'd11: begin
                        nxt_p = c2c.dqb + mult16(c2c.dqa, div);
                        c2c.flag[4] = (sy[0][53:43] != 'd0);
                    end
                    6'd12: begin
                        c2d.ir[0] = limE(p[43:12]);
                        c2c.flag[4] = (p[53:43] != 'd0);
                    end
                    6'd13: begin
                        c2d.sx[0] = c2d.sx[1];
                        c2d.sx[1] = c2d.sx[2];
                        c2d.sx[2] = limD1(sx[0][47:16]);
                    end
                    6'd14: begin
                        c2d.sy[0] = c2d.sy[1];
                        c2d.sy[1] = c2d.sy[2];
                        c2d.sy[2] = limD2(sy[0][47:16]);
                    end
                    6'd15: begin
                        c2d.mac[0] = p[31:0];
                        c2d.mac[1] = ssx[0][43:12];
                        c2d.mac[2] = ssy[0][43:12];
                        c2d.mac[3] = ssz[0][43:12];
                    end
                endcase
            end
            `INST_RTPT: begin
                if (curr_cyc < 'd30) begin
                    case(curr_cyc %'d10)
                        /***** Loop over the following 3 times ******/
                        ('d0): begin
                            nxt_ssx[n]   = mult16(c2c.r1[1], c2d.vx[n]) + c2c.trx;
                            nxt_ssy[n]   = mult16(c2c.r2[1], c2d.vx[n]) + c2c.try;
                            nxt_ssz[n]   = mult16(c2c.r3[1], c2d.vx[n]) + c2c.trz;
                        end
                        ('d1): begin
                            nxt_ssx[n]   = mult16(c2c.r1[2], c2d.vy[n]) + ssx[n];
                            nxt_ssy[n]   = mult16(c2c.r2[2], c2d.vy[n]) + ssy[n];
                            nxt_ssz[n]   = mult16(c2c.r3[2], c2d.vy[n]) + ssz[n];
                        end
                        ('d2): begin
                            nxt_ssx[n]   = mult16(c2c.r1[3], c2d.vz[n]) + ssx[n];
                            nxt_ssy[n]   = mult16(c2c.r2[3], c2d.vz[n]) + ssy[n];
                            nxt_ssz[n]   = mult16(c2c.r3[3], c2d.vz[n]) + ssz[n];
                        end
                        ('d3): begin
                            c2c.flag[1]  = (|ssx[n][53:44]);
                            c2c.flag[2]  = (|ssy[n][53:44]);
                            c2c.flag[3]  = (|ssz[n][53:44]);
                            div_num      = c2c.h;
                            div_den      = c2d.sz[n];
                        end
                        //('d4): NOPNOPNOPNOP
                        //('d5): NOPNOPNOPNOP
                        ('d6): begin
                            nxt_div      = div_quo;
                        end
                        ('d7): begin
                            nxt_div      = (div > 'h1FFFF) ? 'h1FFFF : div;
                            c2c.flag[17] = (div > 'h1FFFF);
                        end
                        ('d8): begin
                            nxt_sx[n]    = c2c.ofx + mult16(c2d.ir[1], div);
                            nxt_sy[n]    = c2c.ofy + mult16(c2d.ir[2], div);
                            nxt_p        = c2c.dqb + mult16(c2c.dqa, div);
                        end
                        ('d9): begin
                            nxt_sx[n]    = limD1(sx[n][47:16]);
                            nxt_sy[n]    = limD2(sy[n][47:16]);
                            c2c.flag[4]  = (p[53:43] != 'd0);
                            nxt_n        = ((n < 'd2) ? (n + 'd1) : 'd0);
                        end
                        /************ End loop block ****************/
                    endcase
                end
                else if (curr_cyc == 'd30) begin
                    c2d.sz[0]    = c2d.sz[3];
                    c2d.sz[1]    = limC(ssz[0][43:12]);
                    c2d.sz[2]    = limC(ssz[1][43:12]);
                    c2d.sz[3]    = limC(ssz[2][43:12]);
                    c2d.ir[0]    = limE(p[43:12]);
                    c2d.ir[1]    = limA1S(ssx[2][47:16]);
                    c2d.ir[2]    = limA2S(ssy[2][47:16]);
                    c2d.ir[3]    = limA3S(ssz[2][47:16]);
                    c2d.mac[0]   = p[31:0];
                    c2d.mac[1]   = ssx[2][43:12];
                    c2d.mac[2]   = ssy[2][43:12];
                    c2d.mac[3]   = ssz[2][43:12];
                end
            end
            `INST_NCDS: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_ll1[0] = mult16(c2c.l1[1], c2d.vx[0]);
                        nxt_ll2[0] = mult16(c2c.l2[1], c2d.vx[0]);
                        nxt_ll3[0] = mult16(c2c.l3[1], c2d.vx[0]);
                    end
                    6'd1: begin
                        nxt_ll1[0] = mult16(c2c.l1[2], c2d.vy[0]) + ll1[0];
                        nxt_ll2[0] = mult16(c2c.l2[2], c2d.vy[0]) + ll2[0];
                        nxt_ll3[0] = mult16(c2c.l3[2], c2d.vy[0]) + ll3[0];
                    end
                    6'd2: begin
                        nxt_ll1[0] = mult16(c2c.l1[3], c2d.vz[0]) + ll1[0];
                        nxt_ll2[0] = mult16(c2c.l2[3], c2d.vz[0]) + ll2[0];
                        nxt_ll3[0] = mult16(c2c.l3[3], c2d.vz[0]) + ll3[0];
                    end
                    6'd3: begin
                        c2c.flag[1] = (ll1[0][53:44] != 'd0);
                        c2c.flag[2] = (ll2[0][53:44] != 'd0);
                        c2c.flag[3] = (ll3[0][53:44] != 'd0);
                    end
                    6'd4: begin
                        nxt_rrlt[0] = mult16(c2c.lr[1], limA1U(ll1[0][43:12])) + c2c.rbk;
                        nxt_gglt[0] = mult16(c2c.lg[1], limA1U(ll1[0][43:12])) + c2c.gbk;
                        nxt_bblt[0] = mult16(c2c.lb[1], limA1U(ll1[0][43:12])) + c2c.bbk;
                    end
                    6'd5: begin
                        nxt_rrlt[0] = mult16(c2c.lr[2], limA2U(ll2[0][43:12])) + rrlt[0];
                        nxt_gglt[0] = mult16(c2c.lg[2], limA2U(ll2[0][43:12])) + gglt[0];
                        nxt_bblt[0] = mult16(c2c.lb[2], limA2U(ll2[0][43:12])) + bblt[0];
                    end
                    6'd6: begin
                        nxt_rrlt[0] = mult16(c2c.lr[3], limA3U(ll3[0][43:12])) + rrlt[0];
                        nxt_gglt[0] = mult16(c2c.lg[3], limA3U(ll3[0][43:12])) + gglt[0];
                        nxt_bblt[0] = mult16(c2c.lb[3], limA3U(ll3[0][43:12])) + bblt[0];
                    end
                    6'd7: begin
                        c2c.flag[1] = (rrlt[0][53:44] != 'd0);
                        c2c.flag[2] = (gglt[0][53:44] != 'd0);
                        c2c.flag[3] = (bblt[0][53:44] != 'd0);
                    end
                    6'd8: begin
                        nxt_rr[0]   = c2d.RGB.r*limA1U(rrlt[0][43:12]);
                        nxt_gg[0]   = c2d.RGB.g*limA1U(gglt[0][43:12]);
                        nxt_bb[0]   = c2d.RGB.b*limA1U(bblt[0][43:12]);
                    end
                    6'd9: begin
                        nxt_rr[0]   = mult16(c2d.RGB.r, rr[0]);
                        nxt_gg[0]   = mult16(c2d.RGB.g, gg[0]);
                        nxt_bb[0]   = mult16(c2d.RGB.b, bb[0]);
                    end
                    6'd10: begin
                        nxt_rr[0]   = mult16(c2d.ir[0], limA1S(c2c.rfc-rr[0])) + rr[0];
                        nxt_gg[0]   = mult16(c2d.ir[0], limA2S(c2c.gfc-gg[0])) + gg[0];
                        nxt_bb[0]   = mult16(c2d.ir[0], limA3S(c2c.bfc-bb[0])) + bb[0];
                    end
                    //6'd11: NOP NOP NOP NOP NOP
                    6'd12: begin
                        c2c.flag[1]   = (rr[0][53:44] != 'd0);
                        c2c.flag[2]   = (gg[0][53:44] != 'd0);
                        c2c.flag[3]   = (bb[0][53:44] != 'd0);
                    end
                    6'd13: begin
                        c2d.ir[1]     = limA1U(rr[0][43:12]);
                        c2d.ir[2]     = limA2U(gg[0][43:12]);
                        c2d.ir[3]     = limA3U(bb[0][43:12]);
                    end
                    6'd14: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd15: begin
                        c2d.rgb[0].r  = c2d.rgb[1].r;
                        c2d.rgb[1].r  = c2d.rgb[2].r;
                        c2d.rgb[2].r  = limB1(rr[0][47:16]);
                    end
                    6'd16: begin
                        c2d.rgb[0].g  = c2d.rgb[1].r;
                        c2d.rgb[1].g  = c2d.rgb[2].r;
                        c2d.rgb[2].g  = limB1(rr[0][47:16]);
                    end
                    6'd17: begin
                        c2d.rgb[0].b  = c2d.rgb[1].r;
                        c2d.rgb[1].b  = c2d.rgb[2].r;
                        c2d.rgb[2].b  = limB1(rr[0][47:16]);
                    end
                    6'd18: begin
                        c2d.mac[1]    = rr[0][43:12];
                        c2d.mac[2]    = gg[0][43:12];
                        c2d.mac[3]    = bb[0][43:12];
                    end
                endcase
            end
            `INST_NCDT: begin
                if (curr_cyc < 'd42) begin
                    case(curr_cyc % 'd14)
                        /***** Loop over the following 3 times ******/
                        ('d0): begin
                            nxt_ll1[n] = mult16(c2c.l1[1], c2d.vx[n]);
                            nxt_ll2[n] = mult16(c2c.l2[1], c2d.vx[n]);
                        end
                        ('d1): begin
                            nxt_ll3[n] = mult16(c2c.l3[1], c2d.vx[n]);
                            nxt_ll1[n] = mult16(c2c.l1[2], c2d.vy[n]) + ll1[n];
                        end
                        ('d2): begin
                            nxt_ll2[n] = mult16(c2c.l2[2], c2d.vy[n]) + ll2[n];
                            nxt_ll3[n] = mult16(c2c.l3[2], c2d.vy[n]) + ll3[n];
                        end
                        ('d3): begin
                            nxt_ll1[n] = mult16(c2c.l1[3], c2d.vz[n]) + ll1[n];
                            nxt_ll2[n] = mult16(c2c.l2[3], c2d.vz[n]) + ll2[n];
                        end
                        ('d4): begin
                            nxt_ll3[n] = mult16(c2c.l3[3], c2d.vz[n]) + ll3[n];
                            nxt_rrlt[n] = mult16(c2c.lr[1], limA1U(ll1[n][43:12])) + c2c.rbk;
                        end
                        ('d5): begin
                            nxt_gglt[n] = mult16(c2c.lg[1], limA1U(ll1[n][43:12])) + c2c.gbk;
                            nxt_bblt[n] = mult16(c2c.lb[1], limA1U(ll1[n][43:12])) + c2c.bbk;
                        end
                        ('d6): begin
                            nxt_rrlt[n] = mult16(c2c.lr[2], limA2U(ll2[n][43:12])) + rrlt[n];
                            nxt_gglt[n] = mult16(c2c.lg[2], limA2U(ll2[n][43:12])) + gglt[n];
                        end
                        ('d7): begin
                            nxt_bblt[n] = mult16(c2c.lb[2], limA2U(ll2[n][43:12])) + bblt[n];
                            nxt_rrlt[n] = mult16(c2c.lr[3], limA3U(ll3[n][43:12])) + rrlt[n];
                        end
                        ('d8): begin
                            nxt_gglt[n] = mult16(c2c.lg[3], limA3U(ll3[n][43:12])) + gglt[n];
                            nxt_bblt[n] = mult16(c2c.lb[3], limA3U(ll3[n][43:12])) + bblt[n];
                        end
                        ('d9): begin
                            nxt_rr[n] = mult16(c2d.RGB.r, limA1U(rrlt[n][43:12]));
                            nxt_gg[n] = mult16(c2d.RGB.g, limA1U(gglt[n][43:12]));
                        end
                        ('d10): begin
                            nxt_bb[n] = mult16(c2d.RGB.b, limA1U(bblt[n][43:12]));
                            nxt_rr[n] = mult16(c2d.ir[0], limA1S(c2c.rfc-rr[n])) + rr[n];
                        end
                        ('d11): begin
                            nxt_gg[n] = mult16(c2d.ir[0], limA2S(c2c.gfc-gg[n])) + gg[n];
                            nxt_bb[n] = mult16(c2d.ir[0], limA3S(c2c.bfc-bb[n])) + bb[n];
                        end
                        ('d12): begin
                            c2c.flag[1] = (rr[n][53:43] != 0);
                            c2c.flag[2] = (gg[n][53:43] != 0);
                            c2c.flag[3] = (bb[n][53:43] != 0);
                        end
                        ('d13): begin
                            c2d.rgb[n].cd = c2d.RGB.cd;
                            c2d.rgb[n].r = limB1(rr[n][47:16]);
                            c2d.rgb[n].g = limB2(gg[n][47:16]);
                            c2d.rgb[n].b = limB3(bb[n][47:16]);
                            nxt_n        = ((n < 'd2) ? (n + 'd1) : 'd0);
                        end
                    endcase
                end
                else begin
                    case(curr_cyc)
                        /************ End loop block ****************/
                        6'd42: begin
                            c2d.ir[1]  = limA1U(rr[2][43:12]);
                            c2d.ir[2]  = limA2U(gg[2][43:12]);
                            c2d.ir[3]  = limA3U(bb[2][43:12]);
                        end
                        6'd43: begin
                            c2d.mac[1] = rr[2][43:12];
                            c2d.mac[2] = gg[2][43:12];
                            c2d.mac[3] = bb[2][43:12];
                        end
                    endcase
                end
            end
            `INST_NCCS: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_ll1[0] = mult16(c2c.l1[1], c2d.vx[0]);
                        nxt_ll2[0] = mult16(c2c.l2[1], c2d.vx[0]);
                    end
                    6'd1: begin
                        nxt_ll3[0] = mult16(c2c.l3[1], c2d.vx[0]);
                        nxt_ll1[0] = mult16(c2c.l1[2], c2d.vy[0]) + ll1[0];
                    end
                    6'd2: begin
                        nxt_ll2[0] = mult16(c2c.l2[2], c2d.vy[0]) + ll2[0];
                        nxt_ll3[0] = mult16(c2c.l3[2], c2d.vy[0]) + ll3[0];
                    end
                    6'd3: begin
                        nxt_ll1[0] = mult16(c2c.l1[3], c2d.vz[0]) + ll1[0];
                        nxt_ll2[0] = mult16(c2c.l2[3], c2d.vz[0]) + ll2[0];
                    end
                    6'd4: begin
                        nxt_ll3[0] = mult16(c2c.l3[3], c2d.vz[0]) + ll3[0];
                        nxt_rrlt[0] = mult16(c2c.lr[1], limA1U(ll1[0][43:12])) + c2c.rbk;
                    end
                    6'd5: begin
                        nxt_gglt[0] = mult16(c2c.lg[1], limA2U(ll1[0][43:12])) + c2c.gbk;
                        nxt_bblt[0] = mult16(c2c.lb[1], limA3U(ll1[0][43:12])) + c2c.bbk;
                    end
                    6'd6: begin
                        nxt_rrlt[0] = mult16(c2c.lr[2], limA1U(ll2[0][43:12])) + rrlt[0];
                        nxt_gglt[0] = mult16(c2c.lg[2], limA2U(ll2[0][43:12])) + gglt[0];
                    end
                    6'd7: begin
                        nxt_bblt[0] = mult16(c2c.lb[2], limA3U(ll2[0][43:12])) + bblt[0];
                        nxt_rrlt[0] = mult16(c2c.lr[3], limA1U(ll3[0][43:12])) + rrlt[0];
                    end
                    6'd8: begin
                        nxt_gglt[0] = mult16(c2c.lg[3], limA2U(ll3[0][43:12])) + gglt[0];
                        nxt_bblt[0] = mult16(c2c.lb[3], limA3U(ll3[0][43:12])) + bblt[0];
                    end
                    6'd9: begin
                        nxt_rr[0]  = mult16(c2d.RGB.r, limA1U(rrlt[0][43:12]));
                        nxt_gg[0]  = mult16(c2d.RGB.g, limA2U(gglt[0][43:12]));
                        nxt_bb[0]  = mult16(c2d.RGB.b, limA3U(bblt[0][43:12]));
                    end
                    6'd10: begin
                        c2c.flag[1] = (rr[0][53:44] != 'd0);
                        c2c.flag[2] = (gg[0][53:44] != 'd0);
                        c2c.flag[3] = (bb[0][53:44] != 'd0);
                    end
                    6'd11: begin
                        c2d.ir[1]  = limA1U(rr[0][43:12]);
                        c2d.ir[2]  = limA2U(gg[0][43:12]);
                        c2d.ir[3]  = limA3U(bb[0][43:12]);
                    end
                    6'd12: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd13: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(rr[0][47:16]);
                    end
                    6'd14: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(gg[0][47:16]);
                    end
                    6'd15: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(bb[0][47:16]);
                    end
                    6'd16: begin
                        c2d.mac[1] = rr[0][43:12];
                        c2d.mac[2] = gg[0][43:12];
                        c2d.mac[3] = bb[0][43:12];
                    end
                endcase
            end
            `INST_NCCT: begin
                case(curr_cyc % 'd13)
                    /***** Loop over the following 3 times ******/
                    ('d0): begin
                        nxt_ll1[n] = mult16(c2c.l1[1], c2d.vx[n]);
                        nxt_ll3[n] = mult16(c2c.l3[1], c2d.vx[n]);
                    end
                    ('d1): begin
                        nxt_ll2[n] = mult16(c2c.l2[1], c2d.vx[n]);
                        nxt_ll1[n] = mult16(c2c.l1[2], c2d.vy[n]) + ll1[n];
                    end
                    ('d2): begin
                        nxt_ll2[n] = mult16(c2c.l2[2], c2d.vy[n]) + ll2[n];
                        nxt_ll3[n] = mult16(c2c.l3[2], c2d.vy[n]) + ll3[n];
                    end
                    ('d3): begin
                        nxt_rrlt[n] = mult16(c2c.lr[1], limA1U(ll1[n][43:12])) + c2c.rbk;
                        nxt_gglt[n] = mult16(c2c.lg[1], limA2U(ll1[n][43:12])) + c2c.gbk;
                    end
                    ('d4): begin
                        nxt_bblt[n] = mult16(c2c.lb[1], limA3U(ll1[n][43:12])) + c2c.bbk;
                        nxt_rrlt[n] = mult16(c2c.lr[2], limA1U(ll2[n][43:12])) + rrlt[n];
                    end
                    ('d5): begin
                        nxt_gglt[n] = mult16(c2c.lg[2], limA2U(ll2[n][43:12])) + gglt[n];
                        nxt_bblt[n] = mult16(c2c.lb[2], limA3U(ll2[n][43:12])) + bblt[n];
                    end
                    ('d6): begin
                        nxt_rrlt[n] = mult16(c2c.lr[3], limA1U(ll3[n][43:12])) + rrlt[n];
                        nxt_gglt[n] = mult16(c2c.lg[3], limA2U(ll3[n][43:12])) + gglt[n];
                    end
                    ('d7): begin
                        nxt_bblt[n] = mult16(c2c.lb[3], limA3U(ll3[n][43:12])) + bblt[n];
                        nxt_rr[0]  = mult16(c2d.RGB.r, limA1U(rrlt[n][43:12]));
                    end
                    ('d8): begin
                        nxt_gg[0]  = mult16(c2d.RGB.g, limA2U(gglt[n][43:12]));
                        nxt_bb[0]  = mult16(c2d.RGB.b, limA3U(bblt[n][43:12]));
                    end
                    ('d9): begin
                        c2c.flag[1] = (rr[n][53:44] != 'd0);
                        c2c.flag[2] = (gg[n][53:44] != 'd0);
                        c2c.flag[3] = (bb[n][53:44] != 'd0);
                    end
                    ('d10): begin
                        c2d.rgb[n].cd = c2d.RGB.cd;
                        c2d.rgb[n].r = limB1(rr[n][47:16]);
                        c2d.rgb[n].g = limB2(gg[n][47:16]);
                        c2d.rgb[n].b = limB3(bb[n][47:16]);
                    end
                    ('d11): begin
                        c2d.ir[1]  = limA1U(rr[2][43:12]);
                        c2d.ir[2]  = limA2U(gg[2][43:12]);
                        c2d.ir[3]  = limA3U(bb[2][43:12]);
                    end
                    ('d12): begin
                        c2d.mac[1] = rr[2][43:12];
                        c2d.mac[2] = gg[2][43:12];
                        c2d.mac[3] = bb[2][43:12];
                        nxt_n      = ((n < 'd2) ? (n + 'd1) : 'd0);
                    end
                    /************ End loop block ****************/
                endcase
            end
            `INST_CDP: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_rrlt[0] = mult16(c2c.lr[1], c2d.ir[1]) + c2c.rbk;
                        nxt_gglt[0] = mult16(c2c.lg[1], c2d.ir[1]) + c2c.gbk;
                        nxt_bblt[0] = mult16(c2c.lb[1], c2d.ir[1]) + c2c.bbk;
                    end
                    6'd1: begin
                        nxt_rrlt[0] = mult16(c2c.lr[2], c2d.ir[2]) + rrlt[0];
                        nxt_gglt[0] = mult16(c2c.lg[2], c2d.ir[2]) + rrlt[0];
                        nxt_bblt[0] = mult16(c2c.lb[2], c2d.ir[2]) + rrlt[0];
                    end
                    6'd2: begin
                        nxt_rrlt[0] = mult16(c2c.lr[3], c2d.ir[3]) + rrlt[0];
                        nxt_gglt[0] = mult16(c2c.lg[3], c2d.ir[3]) + rrlt[0];
                        nxt_bblt[0] = mult16(c2c.lb[3], c2d.ir[3]) + rrlt[0];
                    end
                    6'd3: begin
                        nxt_rr[0]  = mult16(c2d.RGB.r, limA1U(rrlt[0][43:12]));
                        nxt_gg[0]  = mult16(c2d.RGB.g, limA2U(gglt[0][43:12]));
                    end
                    6'd4: begin
                        nxt_bb[0]  = mult16(c2d.RGB.b, limA3U(bblt[0][43:12]));
                        nxt_rr[0]  = mult16(c2d.ir[0], limA1S(c2c.rfc-rr[0])) + rr[0];
                    end
                    6'd5: begin
                        nxt_gg[0]  = mult16(c2d.ir[0], limA2S(c2c.gfc-gg[0])) + gg[0];
                        nxt_bb[0]  = mult16(c2d.ir[0], limA3S(c2c.bfc-bb[0])) + bb[0];
                    end
                    6'd6: begin
                        c2c.flag[1] = (rr[0][53:44] != 'd0);
                        c2c.flag[2] = (gg[0][53:44] != 'd0);
                        c2c.flag[3] = (bb[0][53:44] != 'd0);
                    end
                    6'd7: begin
                        c2d.ir[1]  = limA1U(rr[0][43:12]);
                        c2d.ir[2]  = limA2U(gg[0][43:12]);
                        c2d.ir[3]  = limA3U(bb[0][43:12]);
                    end
                    6'd8: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd9: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(rr[0][47:16]);
                    end
                    6'd10: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(gg[0][47:16]);
                    end
                    6'd11: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(bb[0][47:16]);
                    end
                    6'd12: begin
                        c2d.mac[1] = rr[0][43:12];
                        c2d.mac[2] = gg[0][43:12];
                        c2d.mac[3] = bb[0][43:12];
                    end
                endcase
            end
            `INST_CC: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_rrlt[0] = mult16(c2c.lr[1], c2d.ir[1]) + c2c.rbk;
                        nxt_gglt[0] = mult16(c2c.lg[1], c2d.ir[1]) + c2c.gbk;
                        nxt_bblt[0] = mult16(c2c.lb[1], c2d.ir[1]) + c2c.bbk;
                    end
                    6'd1: begin
                        nxt_rrlt[0] = mult16(c2c.lr[2], c2d.ir[2]) + rrlt[0];
                        nxt_gglt[0] = mult16(c2c.lg[2], c2d.ir[2]) + rrlt[0];
                        nxt_bblt[0] = mult16(c2c.lb[2], c2d.ir[2]) + rrlt[0];
                    end
                    6'd2: begin
                        nxt_rrlt[0] = mult16(c2c.lr[3], c2d.ir[3]) + rrlt[0];
                        nxt_gglt[0] = mult16(c2c.lg[3], c2d.ir[3]) + rrlt[0];
                        nxt_bblt[0] = mult16(c2c.lb[3], c2d.ir[3]) + rrlt[0];
                    end
                    6'd3: begin
                        nxt_rr[0]   = c2d.RGB.r*limA1U(rrlt[0][43:12]);
                        nxt_gg[0]   = c2d.RGB.g*limA1U(gglt[0][43:12]);
                        nxt_bb[0]   = c2d.RGB.b*limA1U(bblt[0][43:12]);
                    end
                    6'd4: begin
                        c2c.flag[1] = (rr[0][53:44] != 'd0);
                        c2c.flag[2] = (gg[0][53:44] != 'd0);
                        c2c.flag[3] = (bb[0][53:44] != 'd0);
                    end
                    6'd5: begin
                        c2d.ir[1]  = limA1U(rr[0][43:12]);
                        c2d.ir[2]  = limA2U(gg[0][43:12]);
                        c2d.ir[3]  = limA3U(bb[0][43:12]);
                    end
                    6'd6: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd7: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(rr[0][47:16]);
                    end
                    6'd8: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(gg[0][47:16]);
                    end
                    6'd9: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(bb[0][47:16]);
                    end
                    6'd10: begin
                        c2d.mac[1] = rr[0][43:12];
                        c2d.mac[2] = gg[0][43:12];
                        c2d.mac[3] = bb[0][43:12];
                    end
                endcase
            end
            `INST_NCS: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_ll1[0] = mult16(c2c.l1[1], c2d.vx[0]);
                        nxt_ll2[0] = mult16(c2c.l2[1], c2d.vx[0]);
                    end
                    6'd1: begin
                        nxt_ll3[0] = mult16(c2c.l3[1], c2d.vx[0]);
                        nxt_ll1[0] = mult16(c2c.l1[2], c2d.vy[0]) + ll1[0];
                    end
                    6'd2: begin
                        nxt_ll2[0] = mult16(c2c.l2[2], c2d.vy[0]) + ll2[0];
                        nxt_ll3[0] = mult16(c2c.l3[2], c2d.vy[0]) + ll3[0];
                    end
                    6'd3: begin
                        nxt_ll1[0] = mult16(c2c.l1[3], c2d.vz[0]) + ll1[0];
                        nxt_ll2[0] = mult16(c2c.l2[3], c2d.vz[0]) + ll2[0];
                        nxt_ll3[0] = mult16(c2c.l3[3], c2d.vz[0]) + ll3[0];
                    end
                    6'd4: begin
                        nxt_rr[0] = mult16(c2c.lr[1], limA1U(ll1[0][43:12])) + c2c.rbk;
                        nxt_gg[0] = mult16(c2c.lg[1], limA1U(ll1[0][43:12])) + c2c.gbk;
                        nxt_bb[0] = mult16(c2c.lb[1], limA1U(ll1[0][43:12])) + c2c.bbk;
                    end
                    6'd5: begin
                        nxt_rr[0] = mult16(c2c.lr[2], limA2U(ll2[0][43:12])) + rr[0];
                        nxt_gg[0] = mult16(c2c.lg[2], limA2U(ll2[0][43:12])) + gg[0];
                        nxt_bb[0] = mult16(c2c.lb[2], limA2U(ll2[0][43:12])) + bb[0];
                    end
                    6'd6: begin
                        nxt_rr[0] = mult16(c2c.lr[3], limA2U(ll3[0][43:12])) + rr[0];
                        nxt_gg[0] = mult16(c2c.lg[3], limA2U(ll3[0][43:12])) + gg[0];
                        nxt_bb[0] = mult16(c2c.lb[3], limA2U(ll3[0][43:12])) + bb[0];
                    end
                    6'd7: begin
                        c2c.flag[1] = (rr[0][53:44] != 'd0);
                        c2c.flag[2] = (gg[0][53:44] != 'd0);
                        c2c.flag[3] = (bb[0][53:44] != 'd0);
                    end
                    6'd8: begin
                        c2d.ir[1]  = limA1U(rr[0][43:12]);
                        c2d.ir[2]  = limA2U(gg[0][43:12]);
                        c2d.ir[3]  = limA3U(bb[0][43:12]);
                    end
                    6'd9: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd10: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(rr[0][47:16]);
                    end
                    6'd11: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(gg[0][47:16]);
                    end
                    6'd12: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(bb[0][47:16]);
                    end
                    6'd13: begin
                        c2d.mac[1] = rr[0][43:12];
                        c2d.mac[2] = gg[0][43:12];
                        c2d.mac[3] = bb[0][43:12];
                    end
                endcase
            end
            `INST_NCT: begin
                case(curr_cyc % 'd10)
                    /***** Loop over the following 3 times ******/
                    ('d0): begin
                        nxt_ll1[n] = mult16(c2c.l1[1], c2d.vx[n]);
                        nxt_ll2[n] = mult16(c2c.l2[1], c2d.vx[n]);
                    end
                    ('d1): begin
                        nxt_ll3[n] = mult16(c2c.l3[1], c2d.vx[n]);
                        nxt_ll1[n] = mult16(c2c.l1[2], c2d.vy[n]) + ll1[n];
                    end
                    ('d2): begin
                        nxt_ll2[n] = mult16(c2c.l2[2], c2d.vy[n]) + ll2[n];
                        nxt_ll3[n] = mult16(c2c.l3[2], c2d.vy[n]) + ll3[n];
                    end
                    ('d3): begin
                        nxt_ll1[n] = mult16(c2c.l1[3], c2d.vz[n]) + ll1[n];
                        nxt_ll2[n] = mult16(c2c.l2[3], c2d.vz[n]) + ll2[n];
                        nxt_ll3[n] = mult16(c2c.l3[3], c2d.vz[n]) + ll3[n];
                    end
                    ('d4): begin
                        nxt_rr[n] = mult16(c2c.lr[1], limA1U(ll1[n][43:12])) + c2c.rbk;
                        nxt_gg[n] = mult16(c2c.lg[1], limA1U(ll1[n][43:12])) + c2c.gbk;
                        nxt_bb[n] = mult16(c2c.lb[1], limA1U(ll1[n][43:12])) + c2c.bbk;
                    end
                    ('d5): begin
                        nxt_rr[n] = mult16(c2c.lr[2], limA1U(ll2[n][43:12])) + rr[n];
                        nxt_gg[n] = mult16(c2c.lg[2], limA1U(ll2[n][43:12])) + gg[n];
                        nxt_bb[n] = mult16(c2c.lb[2], limA1U(ll2[n][43:12])) + bb[n];
                    end
                    ('d6): begin
                        nxt_rr[n] = mult16(c2c.lr[3], limA1U(ll3[n][43:12])) + rr[n];
                        nxt_gg[n] = mult16(c2c.lg[3], limA1U(ll3[n][43:12])) + gg[n];
                        nxt_bb[n] = mult16(c2c.lb[3], limA1U(ll3[n][43:12])) + bb[n];
                    end
                    ('d7): begin
                        c2c.flag[1] = (rr[0][53:44] != 'd0);
                        c2c.flag[2] = (gg[0][53:44] != 'd0);
                        c2c.flag[3] = (bb[0][53:44] != 'd0);
                    end
                    ('d8): begin
                        c2d.rgb[n].cd = c2d.RGB.cd;
                        c2d.rgb[n].r = limB1(rr[n][47:16]);
                        c2d.rgb[n].g = limB2(gg[n][47:16]);
                        c2d.rgb[n].b = limB3(bb[n][47:16]);
                    end
                    ('d9): begin
                        c2d.ir[1]  = limA1U(rr[2][43:12]);
                        c2d.ir[2]  = limA2U(gg[2][43:12]);
                        c2d.ir[3]  = limA3U(bb[2][43:12]);
                        c2d.mac[1] = rr[2][43:12];
                        c2d.mac[2] = gg[2][43:12];
                        c2d.mac[3] = bb[2][43:12];
                        nxt_n      = ((n < 'd2) ? (n + 'd1) : 'd0);
                    end
                    /************ End loop block ****************/
                endcase
            end
            `INST_MVMVA: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_mt[1] = mult16(mx_vec1[1], v_vec[1]) + cv_vec[1];
                        nxt_mt[2] = mult16(mx_vec2[1], v_vec[1]) + cv_vec[1];
                    end
                    6'd1: begin
                        nxt_mt[3] = mult16(mx_vec3[1], v_vec[1]) + cv_vec[1];
                        nxt_mt[1] = mult16(mx_vec1[2], v_vec[2]) + mt[1];
                    end
                    6'd2: begin
                        nxt_mt[2] = mult16(mx_vec2[2], v_vec[2]) + mt[2];
                        nxt_mt[3] = mult16(mx_vec3[2], v_vec[2]) + mt[3];
                    end
                    6'd3: begin
                        nxt_mt[1] = mult16(mx_vec1[3], v_vec[3]) + mt[1];
                        nxt_mt[2] = mult16(mx_vec2[3], v_vec[3]) + mt[2];
                    end
                    6'd4: begin
                        nxt_mt[3] = mult16(mx_vec3[3], v_vec[3]) + mt[3];
                    end
                    //6'd5:
                    // I SHOULD SET FLAG 1/2/3 HERE BUT IMMA LAZY BUM
                    6'd6: begin
                        c2d.mac[1] = mt[1][43:12];
                        c2d.mac[2] = mt[2][43:12];
                        c2d.mac[3] = mt[3][43:12];
                    end
                    6'd7: begin
                        c2d.ir[1] = limA1C(((sf) ? mt[1][43:12] : mt[1][31:0]), lm);
                        c2d.ir[2] = limA2C(((sf) ? mt[2][43:12] : mt[2][31:0]), lm);
                        c2d.ir[3] = limA3C(((sf) ? mt[3][43:12] : mt[3][31:0]), lm);
                    end
                endcase
            end
            `INST_DCPL: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_rr[0] = mult16(c2d.RGB.r, c2d.ir[1]);
                        nxt_gg[0] = mult16(c2d.RGB.g, c2d.ir[2]);
                        nxt_bb[0] = mult16(c2d.RGB.b, c2d.ir[3]);
                    end
                    6'd1: begin
                        nxt_rr[0] = mult16(limA1S(c2c.rfc-rr[0]), c2d.ir[0]) + rr[0];
                        nxt_gg[0] = mult16(limA2S(c2c.gfc-gg[0]), c2d.ir[0]) + gg[0];
                        nxt_bb[0] = mult16(limA3S(c2c.bfc-bb[0]), c2d.ir[0]) + bb[0];
                    end
                    6'd2: begin
                        c2c.flag[1] = (rr[0][53:44] != 0);
                        c2c.flag[2] = (gg[0][53:44] != 0);
                        c2c.flag[3] = (bb[0][53:44] != 0);
                        c2d.ir[1]   = limA1S(rr[0][43:12]);
                        c2d.ir[2]   = limA2S(gg[0][43:12]);
                        c2d.ir[3]   = limA3S(bb[0][43:12]);
                    end
                    6'd3: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd4: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(rr[0][47:16]);
                    end
                    6'd5: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(gg[0][47:16]);
                    end
                    6'd6: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(bb[0][47:16]);
                    end
                    6'd7: begin
                        c2d.mac[1] = rr[0][43:12];
                        c2d.mac[2] = gg[0][43:12];
                        c2d.mac[3] = bb[0][43:12];
                    end
                endcase
            end
            `INST_INTPL: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_ipl[1] = mult16(limA1S(c2c.rfc-c2d.ir[1]), c2d.ir[0]) + c2d.ir[1];
                        nxt_ipl[2] = mult16(limA2S(c2c.gfc-c2d.ir[2]), c2d.ir[0]) + c2d.ir[2];
                        nxt_ipl[3] = mult16(limA3S(c2c.bfc-c2d.ir[3]), c2d.ir[0]) + c2d.ir[3];
                    end
                    6'd1: begin
                        c2c.flag[1] = (ipl[1][53:44] != 0);
                        c2c.flag[2] = (ipl[2][53:44] != 0);
                        c2c.flag[3] = (ipl[3][53:44] != 0);
                    end
                    6'd2: begin
                        c2d.ir[1] = limA1S(ipl[1]);
                        c2d.ir[2] = limA2S(ipl[2]);
                        c2d.ir[3] = limA3S(ipl[3]);
                    end
                    6'd3: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd4: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(ipl[1][47:16]);
                    end
                    6'd5: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(ipl[2][47:16]);
                    end
                    6'd6: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(ipl[3][47:16]);
                    end
                    6'd7: begin
                        c2d.mac[1] = ipl[1][43:12];
                        c2d.mac[2] = ipl[2][43:12];
                        c2d.mac[3] = ipl[3][43:12];
                    end
                endcase
            end
            `INST_DPCS: begin
                case(curr_cyc)
                    6'd0: begin
                        nxt_rr[0] = mult16(c2d.ir[0], limA1S(c2c.rfc-c2d.RGB.r)) + c2d.RGB.r;
                        nxt_gg[0] = mult16(c2d.ir[0], limA2S(c2c.gfc-c2d.RGB.g)) + c2d.RGB.g;
                        nxt_bb[0] = mult16(c2d.ir[0], limA2S(c2c.gfc-c2d.RGB.b)) + c2d.RGB.b;
                    end
                    6'd1: begin
                        c2c.flag[1] = (nxt_rr[0][53:44] != 'd0);
                        c2c.flag[2] = (nxt_gg[0][53:44] != 'd0);
                        c2c.flag[3] = (nxt_bb[0][53:44] != 'd0);
                    end
                    6'd2: begin
                        c2d.ir[1] = limA1S(rr[0][43:12]);
                        c2d.ir[2] = limA2S(gg[0][43:12]);
                        c2d.ir[3] = limA3S(bb[0][43:12]);
                    end
                    6'd3: begin
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd4: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(rr[0][47:16]);
                    end
                    6'd5: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(gg[0][47:16]);
                    end
                    6'd6: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(bb[0][47:16]);
                    end
                    6'd7: begin
                        c2d.mac[1] = rr[0][43:12];
                        c2d.mac[2] = gg[0][43:12];
                        c2d.mac[3] = bb[0][43:12];
                    end
                endcase
            end
            `INST_DPCT: begin
                if (curr_cyc < 'd14) begin
                    case(curr_cyc % 'd5)
                        /***** Loop over the following 3 times ******/
                        ('d0): begin
                            nxt_rr[n] = mult16(c2d.ir[0], limA1S(c2c.rfc-c2d.RGB.r)) + c2d.rgb[n].r;
                            nxt_gg[n] = mult16(c2d.ir[0], limA2S(c2c.gfc-c2d.RGB.g)) + c2d.rgb[n].g;
                            nxt_bb[n] = mult16(c2d.ir[0], limA2S(c2c.gfc-c2d.RGB.b)) + c2d.rgb[n].b;
                        end
                        ('d1): begin
                            c2c.flag[1] = (rr[n][53:44] != 'd0);
                            c2c.flag[2] = (gg[n][53:44] != 'd0);
                            c2c.flag[3] = (bb[n][53:44] != 'd0);
                        end
                        ('d2): begin
                            c2d.rgb[n].cd = c2d.RGB.cd;
                            c2d.rgb[n].r  = limB1(rr[n][47:16]);
                        end
                        ('d3): begin
                            c2d.rgb[n].g  = limB2(gg[n][47:16]);
                        end
                        ('d4): begin
                            c2d.rgb[n].b  = limB3(bb[n][47:16]);
                            nxt_n         = ((n < 'd2) ? (n + 'd1) : 'd0);
                        end
                        /************ End loop block ****************/
                    endcase
                end
                else begin
                    case(curr_cyc)
                        6'd15: begin
                            c2d.ir[1] = limA1S(rr[2][48:17]);
                            c2d.ir[2] = limA2S(gg[2][48:17]);
                            c2d.ir[3] = limA3S(bb[2][48:17]);
                        end
                        6'd16: begin
                            c2d.mac[1] = rr[2];
                            c2d.mac[2] = gg[2];
                            c2d.mac[3] = bb[2];
                        end
                    endcase
                end
            end
            `INST_SQR: begin
                case(curr_cyc)
                    6'd0: begin
                        if (sf) begin
                            nxt_l1 = mult16((c2d.ir[1] << 12), (c2d.ir[1] << 12));
                            nxt_l2 = mult16((c2d.ir[2] << 12), (c2d.ir[2] << 12));
                            nxt_l3 = mult16((c2d.ir[3] << 12), (c2d.ir[3] << 12));
                        end
                    end
                    6'd1: begin
                        if (~sf) begin
                            nxt_l1 = mult16(c2d.ir[1], c2d.ir[1]);
                            nxt_l2 = mult16(c2d.ir[2], c2d.ir[2]);
                            nxt_l3 = mult16(c2d.ir[3], c2d.ir[3]);
                        end
                    end
                    6'd2: begin
                        c2c.flag[1] = (l1[53:44] != 'd0);
                        c2c.flag[2] = (l2[53:44] != 'd0);
                        c2c.flag[3] = (l3[53:44] != 'd0);
                    end
                    6'd3: begin
                        c2d.ir[1] = limA1U(l1[31:0]);
                        c2d.ir[2] = limA2U(l2[31:0]);
                        c2d.ir[3] = limA3U(l3[31:0]);
                    end
                    6'd4: begin
                        c2d.mac[1] = l1;
                        c2d.mac[2] = l2;
                        c2d.mac[3] = l3;
                    end
                endcase
            end
            `INST_AVSZ3: begin
                case(curr_cyc)
                    6'd0: nxt_ootz = mult16(c2c.zsf3, c2d.sz[1]);
                    6'd1: nxt_ootz = mult16(c2c.zsf3, c2d.sz[2]) + ootz;
                    6'd2: nxt_ootz = mult16(c2c.zsf3, c2d.sz[3]) + ootz;
                    6'd3: c2c.flag[4] = (ootz[53:32] != 'd0);
                    6'd4: begin
                        c2d.otz <= limC(ootz[43:12]);
                        c2d.mac[0] <= ootz[43:12];
                    end
                endcase
            end
            `INST_AVSZ4: begin
                case(curr_cyc)
                    6'd0: nxt_ootz = mult16(c2c.zsf4, c2d.sz[0]);
                    6'd1: nxt_ootz = mult16(c2c.zsf4, c2d.sz[1]) + ootz;
                    6'd2: nxt_ootz = mult16(c2c.zsf4, c2d.sz[2]) + ootz;
                    6'd3: nxt_ootz = mult16(c2c.zsf4, c2d.sz[3]) + ootz;
                    6'd4: begin
                        c2c.flag[4] = (ootz[53:32] != 'd0);
                    end
                    6'd5: begin
                        c2d.otz    = limC(ootz[43:12]);
                        c2d.mac[0] = ootz[43:12];
                    end
                endcase
            end
            `INST_NCLIP: begin
                case(curr_cyc)
                    6'd0: nxt_opz = mult16(c2d.sx[0], c2d.sy[1]);
                    6'd1: nxt_opz = mult16(c2d.sx[1], c2d.sy[2]) + opz;
                    6'd2: nxt_opz = mult16(c2d.sx[2], c2d.sy[0]) + opz;
                    6'd3: nxt_opz = mult16(c2d.sx[0], c2d.sy[2]) + opz;
                    6'd4: nxt_opz = mult16(c2d.sx[1], c2d.sy[0]) + opz;
                    6'd5: nxt_opz = mult16(c2d.sx[2], c2d.sy[1]) + opz;
                    6'd6: c2c.flag[4] = (opz[43:32] != 'd0);
                    6'd7: c2d.mac[0] = opz[31:0];
                endcase
            end
            `INST_OP: begin
                case(curr_cyc)
                    6'd0: begin
                        if (sf) begin
                            nxt_opx = mult16(c2c.r2[2], c2d.ir[3]<<12);
                            nxt_opy = mult16(c2c.r3[3], c2d.ir[1]<<12);
                            nxt_opz = mult16(c2c.r1[1], c2d.ir[2]<<12);
                        end
                        else begin
                            nxt_opx = mult16(c2c.r2[2], c2d.ir[3]);
                            nxt_opy = mult16(c2c.r3[3], c2d.ir[1]);
                            nxt_opz = mult16(c2c.r1[1], c2d.ir[2]);
                        end
                    end
                    6'd1: begin
                        if (sf) begin
                            nxt_opx = opx - mult16(c2c.r3[3], c2d.ir[2]<<12);
                            nxt_opy = opy - mult16(c2c.r1[1], c2d.ir[3]<<12);
                            nxt_opz = opz - mult16(c2c.r2[2], c2d.ir[1]<<12);
                        end
                        else begin
                            nxt_opx = opx - mult16(c2c.r3[3], c2d.ir[2]);
                            nxt_opy = opy - mult16(c2c.r1[1], c2d.ir[3]);
                            nxt_opz = opz - mult16(c2c.r2[2], c2d.ir[1]);
                        end
                    end
                    6'd2: begin
                        c2c.flag[1] = (opx[53:44] != 'd0);
                        c2c.flag[2] = (opy[53:44] != 'd0);
                        c2c.flag[3] = (opz[53:44] != 'd0);
                    end
                    6'd3: begin
                        if (sf) begin
                            c2d.ir[1] = limA1S(opx[43:12]);
                            c2d.ir[2] = limA2S(opy[43:12]);
                            c2d.ir[3] = limA3S(opz[43:12]);
                        end
                        else begin
                            c2d.ir[1] = limA1S(opx[31:0]);
                            c2d.ir[2] = limA2S(opy[31:0]);
                            c2d.ir[3] = limA3S(opz[31:0]);
                        end
                    end
                    6'd4: begin
                        if (sf) begin
                            c2d.mac[1] = opx[43:12];
                            c2d.mac[2] = opy[43:12];
                            c2d.mac[3] = opz[43:12];
                        end
                    end
                    6'd5: begin
                        if (~sf) begin
                            c2d.mac[1] = opx[31:0];
                            c2d.mac[2] = opy[31:0];
                            c2d.mac[3] = opz[31:0];
                        end
                    end
                endcase
            end
            `INST_GPF: begin
                case(curr_cyc)
                    6'd0: begin
                        if (sf) begin
                            nxt_ipx = mult16(c2d.ir[0], c2d.ir[1]<<12);
                            nxt_ipy = mult16(c2d.ir[0], c2d.ir[2]<<12);
                            nxt_ipz = mult16(c2d.ir[0], c2d.ir[3]<<12);
                        end
                        else begin
                            nxt_ipx = mult16(c2d.ir[0], c2d.ir[1]);
                            nxt_ipy = mult16(c2d.ir[0], c2d.ir[2]);
                            nxt_ipz = mult16(c2d.ir[0], c2d.ir[3]);
                        end
                    end
                    6'd1: begin
                        c2c.flag[1] = (ipx[53:44] != 'd0);
                        c2c.flag[2] = (ipy[53:44] != 'd0);
                        c2c.flag[3] = (ipz[53:44] != 'd0);
                        if (sf) begin
                            c2d.ir[1] = limA1S(ipx[31:0]);
                            c2d.ir[2] = limA2S(ipy[31:0]);
                            c2d.ir[3] = limA3S(ipz[31:0]);
                        end
                        else begin
                            c2d.ir[1] = limA1S(ipx[43:12]);
                            c2d.ir[2] = limA2S(ipy[43:12]);
                            c2d.ir[3] = limA3S(ipz[43:12]);
                        end
                    end
                    6'd2: begin
                        if (sf) begin
                            c2d.mac[1] = ipx[43:12];
                            c2d.mac[2] = ipy[43:12];
                            c2d.mac[3] = ipz[43:12];
                        end
                        else begin
                            c2d.mac[1] = ipx[31:0];
                            c2d.mac[2] = ipy[31:0];
                            c2d.mac[3] = ipz[31:0];
                        end
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd3: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(ipx);
                    end
                    6'd4: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(ipy);
                    end
                    6'd5: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(ipz);
                    end
                endcase
            end
            `INST_GPL: begin
                case(curr_cyc)
                    6'd0: begin
                        if (sf) begin
                            nxt_ipx = mult16(c2d.ir[0], c2d.ir[1]<<12) + c2d.mac[1];
                            nxt_ipy = mult16(c2d.ir[0], c2d.ir[2]<<12) + c2d.mac[2];
                            nxt_ipz = mult16(c2d.ir[0], c2d.ir[3]<<12) + c2d.mac[3];
                        end
                        else begin
                            nxt_ipx = mult16(c2d.ir[0], c2d.ir[1]) + c2d.mac[1];
                            nxt_ipy = mult16(c2d.ir[0], c2d.ir[2]) + c2d.mac[2];
                            nxt_ipz = mult16(c2d.ir[0], c2d.ir[3]) + c2d.mac[3];
                        end
                    end
                    6'd1: begin
                        c2c.flag[1] = (ipx[53:44] != 'd0);
                        c2c.flag[2] = (ipy[53:44] != 'd0);
                        c2c.flag[3] = (ipz[53:44] != 'd0);
                        if (sf) begin
                            c2d.ir[1] = limA1S(ipx[31:0]);
                            c2d.ir[2] = limA2S(ipy[31:0]);
                            c2d.ir[3] = limA3S(ipz[31:0]);
                        end
                        else begin
                            c2d.ir[1] = limA1S(ipx[43:12]);
                            c2d.ir[2] = limA2S(ipy[43:12]);
                            c2d.ir[3] = limA3S(ipz[43:12]);
                        end
                    end
                    6'd2: begin
                        if (sf) begin
                            c2d.mac[1] = ipx[43:12];
                            c2d.mac[2] = ipy[43:12];
                            c2d.mac[3] = ipz[43:12];
                        end
                        else begin
                            c2d.mac[1] = ipx[31:0];
                            c2d.mac[2] = ipy[31:0];
                            c2d.mac[3] = ipz[31:0];
                        end
                        c2d.rgb[0].cd = c2d.rgb[1].cd;
                        c2d.rgb[1].cd = c2d.rgb[2].cd;
                        c2d.rgb[2].cd = c2d.RGB.cd;
                    end
                    6'd3: begin
                        c2d.rgb[0].r = c2d.rgb[1].r;
                        c2d.rgb[1].r = c2d.rgb[2].r;
                        c2d.rgb[2].r = limB1(ipx);
                    end
                    6'd4: begin
                        c2d.rgb[0].g = c2d.rgb[1].g;
                        c2d.rgb[1].g = c2d.rgb[2].g;
                        c2d.rgb[2].g = limB2(ipy);
                    end
                    6'd5: begin
                        c2d.rgb[0].b = c2d.rgb[1].b;
                        c2d.rgb[1].b = c2d.rgb[2].b;
                        c2d.rgb[2].b = limB3(ipz);
                    end
                endcase
            end
        endcase
    end

    // limiter functions
    function [15:0] limA1S;
        input [31:0] val;
        begin
            {c2c.flag[24], limA1S} = bound16(val, {{16{1'b1}}, 16'h8000}, 32'h7FFF);
        end
    endfunction
    
    function [15:0] limA2S;
        input [31:0] val;
        begin
            {c2c.flag[23], limA2S} = bound16(val, {{16{1'b1}}, 16'h8000}, 32'h7FFF);
        end
    endfunction
    
    function [15:0] limA3S;
        input [31:0] val;
        begin
            {c2c.flag[22], limA3S} = bound16(val, {{16{1'b1}}, 16'h8000}, 32'h7FFF);
        end
    endfunction
    
    function [15:0] limA1U;
        input [31:0] val;
        begin
            {c2c.flag[24], limA1U} = bound16(val, 32'h0, 32'h7FFF);
        end
    endfunction
    
    function [15:0] limA2U;
        input [31:0] val;
        begin
            {c2c.flag[23], limA2U} = bound16(val, 32'h0, 32'h7FFF);
        end
    endfunction
    
    function [15:0] limA3U;
        input [31:0] val;
        begin
            {c2c.flag[22], limA3U} = bound16(val, 32'h0, 32'h7FFF);
        end
    endfunction

    function [15:0] limA1C;
        input [31:0] val;
        input        sel;
        logic [31:0] lower_bound;
        
        begin
				lower_bound = sel ? 32'h0 : {{16{1'b1}}, 16'h8000};
            {c2c.flag[24], limA1C} = bound16(val, lower_bound, 32'h7FFF);
        end
    endfunction

    function [15:0] limA2C;
        input [31:0] val;
        input        sel;
        logic [31:0] lower_bound;
        
        begin
				lower_bound = sel ? 32'h0 : {{16{1'b1}}, 16'h8000};
            {c2c.flag[23], limA2C} = bound16(val, lower_bound, 32'h7FFF);
        end
    endfunction

    function [15:0] limA3C;
        input [31:0] val;
        input        sel;
        logic [31:0] lower_bound;
        
        begin
				lower_bound = sel ? 32'h0 : {{16{1'b1}}, 16'h8000};
            {c2c.flag[22], limA3C} = bound16(val, lower_bound, 32'h7FFF);
        end
    endfunction

    function [7:0] limB1;
        input [31:0] val;
        begin
            {c2c.flag[21], limB1} = bound8(val, 32'h0, 32'hFF);
        end
    endfunction

    function [7:0] limB2;
        input [31:0] val;
        begin
            {c2c.flag[20], limB2} = bound8(val, 32'h0, 32'hFF);
        end
    endfunction

    function [7:0] limB3;
        input [31:0] val;
        begin
            {c2c.flag[19], limB3} = bound8(val, 32'h0, 32'hFF);
        end
    endfunction

    function [15:0] limC;
        input [31:0] val;
        begin
            {c2c.flag[18], limC} = bound16(val, 32'h0, 32'hFFFF);
        end
    endfunction

    function [15:0] limD1;
        input [31:0] val;
        begin
            {c2c.flag[14], limD1} = bound16(val, {{21{1'b1}}, 11'h400}, 32'h3FF);
        end
    endfunction

    function [15:0] limD2;
        input [31:0] val;
        begin
            {c2c.flag[13], limD2} = bound16(val, {{21{1'b1}}, 11'h400}, 32'h3FF);
        end
    endfunction

    function [15:0] limE;
        input [31:0] val;
        begin
            {c2c.flag[12], limE} = bound16(val, 32'h0, 32'hFFF);
        end
    endfunction
	 
`ifdef SIM
	// synthesis translate_off
	integer fd, i;
	always @(halted) begin
		if ((~rst) && halted) begin
            // Output COP2C
			fd = $fopen("regdumpcop2d.txt");

			$display("\n--- COP2D Register file dump ---");
			$display("=== Simulation Cycle %d ===", $time);
			
			$fdisplay(fd, "--- COP2D Register file dump ---");
			$fdisplay(fd, "=== Simulation Cycle %d ===", $time);

			for(i = 0; i < 32; i = i+1) begin
				$display("R%d\t= 0x%8x\t( %0d )", i, cop2d[i], cop2d[i]);
				$fdisplay(fd, "R%d\t= 0x%8h\t( %0d )", i, cop2d[i], cop2d[i]); 
			end
			
			$display("--- End register file dump ---");
			$fdisplay(fd, "--- End register file dump ---");
			
			$fclose(fd);

            // Output COP2C
			fd = $fopen("regdumpcop2c.txt");

			$display("\n--- COP2C Register file dump ---");
			$display("=== Simulation Cycle %d ===", $time);
			
			$fdisplay(fd, "--- COP2C Register file dump ---");
			$fdisplay(fd, "=== Simulation Cycle %d ===", $time);

			for(i = 0; i < 32; i = i+1) begin
				$display("R%d\t= 0x%8x\t( %0d )", i, cop2c[i], cop2c[i]);
				$fdisplay(fd, "R%d\t= 0x%8h\t( %0d )", i, cop2c[i], cop2c[i]); 
			end
			
			$display("--- End register file dump ---");
			$fdisplay(fd, "--- End register file dump ---");
			
			$fclose(fd);
		end
	end
`endif
	// synthesis translate_on
endmodule: gte

module gte_decode(
    input  logic [5:0] inst,
    input  logic       rdy,
    output logic [5:0] inst_cnt);

    always_comb begin
        if (~rdy)
            inst_cnt = 'd0;
        else begin
            case (inst)
                `INST_RTPS:  inst_cnt = 'd16;
                `INST_RTPT:  inst_cnt = 'd31;
                `INST_MVMVA: inst_cnt = 'd8;
                `INST_DCPL:  inst_cnt = 'd8;
                `INST_DPCS:  inst_cnt = 'd8;
                `INST_DPCT:  inst_cnt = 'd17;
                `INST_INTPL: inst_cnt = 'd8;
                `INST_SQR:   inst_cnt = 'd5;
                `INST_NCS:   inst_cnt = 'd14;
                `INST_NCT:   inst_cnt = 'd30;
                `INST_NCDS:  inst_cnt = 'd19;
                `INST_NCDT:  inst_cnt = 'd44;
                `INST_NCCS:  inst_cnt = 'd17;
                `INST_NCCT:  inst_cnt = 'd39;
                `INST_CDP:   inst_cnt = 'd13;
                `INST_CC:    inst_cnt = 'd11;
                `INST_NCLIP: inst_cnt = 'd8;
                `INST_AVSZ3: inst_cnt = 'd5;
                `INST_AVSZ4: inst_cnt = 'd6;
                `INST_OP:    inst_cnt = 'd6;
                `INST_GPF:   inst_cnt = 'd5;
                `INST_GPL:   inst_cnt = 'd5;
                default:     inst_cnt = 'd0;
            endcase
        end
    end
endmodule: gte_decode

