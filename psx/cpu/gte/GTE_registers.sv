`define 32'h0180001 RTPS
`define 32'h0280030 RTPT
`define 32'h0400012 MVMVA
`define 32'h0680029 DPCL
`define 32'h0780010 DPCS
`define 32'h0F8002A DPCT
`define 32'h0980011 INTPL
`define 32'h0A00428 SQR
`define 32'h0C8041E NCS
`define 32'h0D80420 NCT
`define 32'h0E80413 NCDS
`define 32'h0F80416 NCDT
`define 32'h108041B NCCS
`define 32'h118043F NCCT
`define 32'h1280414 CDP
`define 32'h138041C CC
`define 32'h1400006 NCLIP
`define 32'h158002D AVSZ3
`define 32'h168002E AVSZ4
`define 32'h170000C OP
`define 32'h190003D GPF
`define 32'h1A0003E GPL


/* Cop2C registers */
//rarb_t R11R12;
//rarb_t R13R21;
//rarb_t R22R23;
//rarb_t R31R32;
//rarb_t R33;
//tr_t   TRX;
//tr_t   TRY;
//tr_t   TRZ;
//rarb_t L11L12;
//rarb_t L13L21;
//rarb_t L22L23;
//rarb_t L31L32;
//rarb_t L33;
//bk_t   RBK;
//bk_t   GBK;
//bk_t   BBK;
//rarb_t LR1LR2;
//rarb_t LR3LLG1;
//rarb_t LG2LG3;
//rarb_t LB1LB2;
//rarb_t LB3;
//fc_t   RFC;
//fc_t   GFC;
//fc_t   BFC;
//of_t   OFC;
//of_t   OFY;
//h_t    H;
//dq_t   DQA;
//dq_t   DQB;
//rarb_t ZF3;
//rarb_t DZF4;
//flag_t FLAGS;

/* Cop2C register indices */
`define IDX_R11R12 0  // rotation matrix
`define IDX_R13R21 1  // rotation matrix
`define IDX_R22R23 2  // rotation matrix
`define IDX_R31R32 3  // rotation matrix
`define IDX_R33    4  // rotation matrix
`define IDX_TRX    5  // translation vector (x)
`define IDX_TRY    6  // translation vector (y)
`define IDX_TRZ    7  // translation vector (z)
`define IDX_L11L12 8  // light source direction vector x 3
`define IDX_L13L21 9  // light source direction vector x 3
`define IDX_L22L23 10 // light source direction vector x 3
`define IDX_L31L32 11 // light source direction vector x 3
`define IDX_L33    12 // light source direction vector x 3
`define IDX_RBK    13 // peripheral color (bg color) (r)
`define IDX_GBK    14 // peripheral color (bg color) (g)
`define IDX_BBK    15 // peripheral color (bg color) (b)
`define IDX_LR1LR2 16 // light source color x 3
`define IDX_LR3LG1 17 // light source color x 3
`define IDX_LG2LG3 18 // light source color x 3
`define IDX_LB1LB2 19 // light source color x 3
`define IDX_LB3    20 // light source color x 3
`define IDX_RFC    21 // far color (r)
`define IDX_GFC    22 // far color (g)
`define IDX_BFC    23 // far color (b)
`define IDX_OFX    24 // screen offset (x)
`define IDX_OFY    25 // screen offset (y)
`define IDX_H      26 // screen position
`define IDX_DQA    27 // depth parameter A (coefficient)
`define IDX_DQB    28 // depth paramter B (offset)
`define IDX_ZSF3   29 // z-averaging scale factor
`define IDX_ZSF4   30 // z-averaging scale factor
`define IDX_FLAG   31 // flag

/* Cop2D register indices */
`define IDX_VXY0   0  // vector #0 (x/y)
`define IDX_VZ0    1  // vector #0 (z)
`define IDX_VXY1   2  // vector #1 (x/y)
`define IDX_VZ1    3  // vector #1 (z)
`define IDX_VXY2   4  // vector #2 (x/y)
`define IDX_VZ2    5  // vector #2 (z)
`define IDX_RGB    6  // color data + GTE instruction
`define IDX_OTZ    7  // z-component average value
`define IDX_IR0    8  // intermediate value #0
`define IDX_IR1    9  // intermediate value #1
`define IDX_IR2    10 // intermediate value #2
`define IDX_IR3    11 // intermediate value #3
`define IDX_SXY0   12 // calculation result record (xy)
`define IDX_SXY1   13 // calculation result record (xy)
`define IDX_SXY2   14 // calculation result record (xy)
`define IDX_SXYP   15 // calculation result setting register
`define IDX_SZ0    16 // calculation result record (z)
`define IDX_SZ1    17 // calculation result record (z)
`define IDX_SZ2    18 // calculation result record (z)
`define IDX_SZ3    19 // calculation result record (z)
`define IDX_RGB0   20 // calculation result record (color data)
`define IDX_RGB1   21 // calculation result record (color data)
`define IDX_RGB2   22 // calculation result record (color data)
`define IDX_RES1   23 // reserved by system (access prohibited)
`define IDX_MAC0   24 // sum of products #0
`define IDX_MAC1   25 // sum of products #1
`define IDX_MAC2   26 // sum of products #2
`define IDX_MAC3   27 // sum of products #3
`define IDX_IRGB   28 // color data input register
`define IDX_ORGB   29 // color data output register
`define IDX_LZCS   30 // leading zero/one count source data
`define IDX_LZCR   31 // leading zero/one count processing result


`define LO_REG_MASK 32'h0000FFFF // ie. masks R11 of R11R12
`define HI_REG_MASK 32'hFFFF0000 // ie. masks R12 of R11R12


typedef struct packed {
    bit        ra_sign;
    bit [2:0]  ra_integ;
    bit [11:0] ra_frac;
    bit        rb_sign;
    bit [2:0]  rb_integ;
    bit [11:0] rb_frac;
} rarb_t;

typedef struct packed {
    bit        sign;
    bit [30:0] integ;
} tr_t;

typedef struct packed {
    bit        sign;
    bit [26:0] integ;
    bit [3:0]  frac;
} fc_t;

typedef struct packed {
    bit        sign;
    bit [14:0] integ;
    bit [15:0] frac;
} of_t;

typedef struct packed {
    bit        sign;
    bit [18:0] integ;
    bit [11:0] frac;
} bk_t;

typedef struct packed {
    bit [15:0] zero;
    bit [15:0] integ;
} h_t;

typedef struct packed {
    bit [15:0] zero;
    bit        sign;
    bit [6:0]  integ;
    bit [7:0]  frac;
} dq_t;

typedef struct packed {
    bit        log_sum;
    bit        calc1_ovf;
    bit        calc2_ovf;
    bit        calc3_ovf;
    bit        calc1_udf;
    bit        calc2_udf;
    bit        calc3_udf;
    bit        a1_oor;
    bit        a2_oor;
    bit        a3_oor;
    bit        b1_oor;
    bit        b2_oor;
    bit        b3_oor;
    bit        c_oor;
    bit        div_ovf;
    bit        calc4_ovf;
    bit        calc4_udf;
    bit        d1_oor;
    bit        d2_oor;
    bit        e_oor;
    bit [11:0] zero;
} flag_t;

