// instruction codes
`define INST_RTPS  6'h01
`define INST_RTPT  6'h30 
`define INST_MVMVA 6'h12 
`define INST_DCPL  6'h29 
`define INST_DPCS  6'h10 
`define INST_DPCT  6'h2A 
`define INST_INTPL 6'h11 
`define INST_SQR   6'h28 
`define INST_NCS   6'h1E 
`define INST_NCT   6'h20 
`define INST_NCDS  6'h13 
`define INST_NCDT  6'h16 
`define INST_NCCS  6'h1B 
`define INST_NCCT  6'h3F 
`define INST_CDP   6'h14 
`define INST_CC    6'h1C 
`define INST_NCLIP 6'h06 
`define INST_AVSZ3 6'h2D 
`define INST_AVSZ4 6'h2E 
`define INST_OP    6'h0C 
`define INST_GPF   6'h3D 
`define INST_GPL   6'h3E

// control register indices
`define IDX_R11R12  0
`define IDX_R13R21  1
`define IDX_R22R23  2
`define IDX_R31R32  3
`define IDX_R33     4
`define IDX_TRX     5
`define IDX_TRY     6
`define IDX_TRZ     7
`define IDX_L11L12  8
`define IDX_L13L21  9
`define IDX_L22L23  10
`define IDX_L31L32  11
`define IDX_L33     12
`define IDX_RBK     13
`define IDX_GBK     14
`define IDX_BBK     15
`define IDX_LR1LR2  16
`define IDX_LR3LG1  17
`define IDX_LG2LG3  18
`define IDX_LB1LB2  19
`define IDX_LB3     20
`define IDX_RFC     21
`define IDX_GFC     22
`define IDX_BFC     23
`define IDX_OFX     24
`define IDX_OFY     25
`define IDX_H       26
`define IDX_DQA     27
`define IDX_DQB     28
`define IDX_ZSF3    29
`define IDX_ZSF4    30
`define IDX_FLAG    31

// data register indices
`define IDX_VXY0    0
`define IDX_VZ0     1
`define IDX_VXY1    2
`define IDX_VZ1     3
`define IDX_VXY2    4
`define IDX_VZ2     5
`define IDX_RGB     6
`define IDX_OTZ     7
`define IDX_IR0     8
`define IDX_IR1     9
`define IDX_IR2     10
`define IDX_IR3     11
`define IDX_SXY0    12
`define IDX_SXY1    13
`define IDX_SXY2    14
`define IDX_SXYP    15
`define IDX_SZ0     16
`define IDX_SZ1     17
`define IDX_SZ2     18
`define IDX_SZ3     19
`define IDX_RGB0    20
`define IDX_RGB1    21
`define IDX_RGB2    22
`define IDX_MAC0    24
`define IDX_MAC1    25
`define IDX_MAC2    26
`define IDX_MAC3    27
`define IDX_IRGB    28
`define IDX_ORGB    29
`define IDX_LZCS    30
`define IDX_LZCR    31
                    
/* Cop2C register descriptions */
typedef struct packed {
    logic [3:1][15:0] r1;   // rotation matrix
    logic [3:1][15:0] r2;   // rotation matrix
    logic [3:1][15:0] r3;   // rotation matrix
    logic      [31:0] trx;  // translation vector (x)
    logic      [31:0] try;  // translation vector (y)
    logic      [31:0] trz;  // translation vector (z)
    logic [3:1][15:0] l1;   // light source direction vector x3
    logic [3:1][15:0] l2;   // light source direction vector x3
    logic [3:1][15:0] l3;   // light source direction vector x3
    logic      [31:0] rbk;  // peripheral color (bg color) (r)
    logic      [31:0] gbk;  // peripheral color (bg color) (g)
    logic      [31:0] bbk;  // peripheral color (bg color) (b)
    logic [3:1][15:0] lr;   // light source color x3
    logic [3:1][15:0] lg;   // light source color x3
    logic [3:1][15:0] lb;   // light source color x3
    logic      [31:0] rfc;  // far color (r)
    logic      [31:0] gfc;  // far color (g)
    logic      [31:0] bfc;  // far color (b)
    logic      [31:0] ofx;  // screen offset (x)
    logic      [31:0] ofy;  // screen offset (y)
    logic      [15:0] h;    // screen position
    logic      [15:0] dqa;  // depth parameter A (coefficient)
    logic      [31:0] dqb;  // depth paramter B (offset)
    logic      [15:0] zsf3; // z-averaging scale factor
    logic      [15:0] zsf4; // z-averaging scale factor
    logic      [31:0] flag; // flag
} cop2c_t;

typedef struct packed {
    logic [7:0] cd;
    logic [7:0] r;
    logic [7:0] g;
    logic [7:0] b;
} rgb_t;

typedef struct packed {
    logic [4:0] r;
    logic [4:0] g;
    logic [4:0] b;
} xrgb_t;

/* Cop2D Registers descriptions */
typedef struct packed {
    logic [2:0][15:0] vx;   // vector #0-2 (x)
    logic [2:0][15:0] vy;   // vector #0-2 (y)
    logic [2:0][15:0] vz;   // vector #0-2 (z)
    rgb_t             RGB;  // color data + GTE instruction
    logic      [15:0] otz;  // z-component average value
    logic [3:0][31:0] ir;   // intermediate value #0-3 -- upper 16 is the sign
    logic [2:0][15:0] sx;   // calculation result record (x)
    logic      [15:0] sxp;  // calculation result setting register 
    logic [2:0][15:0] sy;   // calculation result record (y)
    logic      [15:0] syp;  // calculation result setting register 
    logic [3:0][15:0] sz;   // calculation result record (z)
    rgb_t [2:0]       rgb;  // calculation result record (color data)
    logic [3:0][31:0] mac;  // sum of products #0-3
    xrgb_t            irgb; // color data input register 
    xrgb_t            orgb; // color data output register 
    logic      [31:0] lzcs; // leading zero/one count source data
    logic      [31:0] lzcr; // leading zero/one count processing result -- "SPECIAL"
} cop2d_t;
    
function [16:0] bound16; // 16 bit result; MSB indicates set flag
    input [31:0] val, lower_bound, upper_bound;
   
    if ($signed(val) < $signed(lower_bound))
        bound16 = {1'b1, lower_bound[15:0]};
    else if ($signed(val) > $signed(upper_bound))
        bound16 = {1'b1, upper_bound[15:0]};
    else
        bound16 = {1'b0, val[15:0]};
endfunction

function [8:0] bound8;   // 8 bit result; MSB indicates set flag
    input [31:0] val, lower_bound, upper_bound;
   
    if ($signed(val) < $signed(lower_bound))
        bound8 = {1'b1, lower_bound[7:0]};
    else if ($signed(val) > $signed(upper_bound))
        bound8 = {1'b1, upper_bound[7:0]};
    else
        bound8 = {1'b0, val[7:0]};
endfunction

function [34:0] mult16;
    input [15:0] a, b;
    logic [16:0] a_pos, b_pos;
    logic [34:0] tmp;
    begin
        a_pos = (a[15]) ? (-a) : a;
        b_pos = (b[15]) ? (-b) : b;
        tmp = (a_pos*b_pos);
        mult16 = (a[15]==b[15]) ? tmp : (-tmp);
    end
endfunction

