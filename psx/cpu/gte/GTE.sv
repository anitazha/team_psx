`include "GTE_registers.sv"

module GTE(
    input         clk, rst,
    input  [4:0]  rd_reg1, rd_reg2, w_reg,
    input  [31:0] w_data,
    input         we,
    output [31:0] rd_data1, rd_data2);

    /* actual register arrays */
    reg [31:0][31:0] cop2c;
    reg [31:0][31:0] cop2d;

    /* Cop2C registers */
    wire [15:0] R_R12, R_R11, R_R21, R_R13, R_R22, R_R23, R_R31, R_R32, R_R33;
    wire [31:0] R_TRX, R_TRY, R_TRZ;
    wire [15:0] R_L12, R_L11, R_L21, R_L13, R_L23, R_L22, R_L32, R_L31, R_L33;
    wire [31:0] R_RBK, R_GBK, R_BBK;
    wire [15:0] R_LR2, R_LR1, R_LG1, R_LR3, R_LG3, R_LG2, R_LB2, R_LB1, R_LB3;
    wire [31:0] R_RFC, R_GFC, R_BFC, R_OFX, R_OFY;
    wire [15:0] R_H, R_DQA;
    wire [31:0] R_DQB;
    wire [15:0] R_ZSF3, R_ZSF4;
    wire [31:0] R_FLAG;
    
    /* Cop2D registers */
    wire [15:0] R_VY0, R_VX0, R_VZ0, R_VY1, R_VX1, R_VZ1, R_VY2, R_VX2, R_VZ2;
    wire [7:0]  R_CD, R_B, R_G, R_R;
    wire [15:0] R_OTZ, R_IR0S, R_IR0, R_IR1S, R_IR1, R_IR2S, R_IR2, R_IR3S, R_IR3;
    wire [15:0] R_SY0, R_SX0, R_SY1, R_SX1, R_SY2, R_SX2;
    wire [15:0] R_SYP, R_SXP, R_SZ0, R_SZ1, R_SZ2, R_SZ3;
    wire [7:0]  R_CD0, R_B0, R_G0, R_R0, R_CD1, R_B1, R_G1, R_R1;
    wire [7:0]  R_CD2, R_B2, R_G2, R_R2;
    wire [31:0] R_MAC0, R_MAC1, R_MAC2, R_MAC3;
    wire [4:0]  R_IB, R_IG, R_IR, R_OB, R_OG, R_OR;
    wire [31:0] R_LZCS;
    wire [5:0]  R_LZCR;

    // START A STALL

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            for (i=1; i<32; i=i+1) begin
                cop2c[i] <= 32'b0;
                cop2d[i] <= 32'b0;
            end
        end
    end

    /* Cop2C Registers */
    //assign R_R12  = cop2c[IDX_R11R12][31:16];
    //assign R_R11  = cop2c[IDX_R11R12][15:0];
    //assign R_R21  = cop2c[IDX_R13R21][31:16];
    //assign R_R13  = cop2c[IDX_R13R21][15:0];
    //assign R_R22  = cop2c[IDX_R22R23][15:0];
    //assign R_R23  = cop2c[IDX_R22R23][31:16];
    //assign R_R31  = cop2c[IDX_R31R32][15:0];
    //assign R_R32  = cop2c[IDX_R31R32][31:16];
    //assign R_R33  = cop2c[IDX_R33][15:0];
    //assign R_TRX  = cop2c[IDX_TRX];
    //assign R_TRY  = cop2c[IDX_TRY];
    //assign R_TRZ  = cop2c[IDX_TRZ];
    //assign R_L12  = cop2c[IDX_L11L12][31:16];
    //assign R_L11  = cop2c[IDX_L11L12][15:0];
    //assign R_L21  = cop2c[IDX_L13L21][31:16];
    //assign R_L13  = cop2c[IDX_L13L21][15:0];
    //assign R_L23  = cop2c[IDX_L22L23][31:16];
    //assign R_L22  = cop2c[IDX_L22L23][15:0];
    //assign R_L32  = cop2c[IDX_L31L32][31:16];
    //assign R_L31  = cop2c[IDX_L31L32][15:0];
    //assign R_L33  = cop2c[IDX_L33][15:0];
    //assign R_RBK  = cop2c[IDX_RBK];
    //assign R_GBK  = cop2c[IDX_GBK];
    //assign R_BBK  = cop2c[IDX_BBK];
    //assign R_LR2  = cop2c[IDX_LR1LR2][31:16];
    //assign R_LR1  = cop2c[IDX_LR1LR2][15:0];
    //assign R_LG1  = cop2c[IDX_LR3LG1][31:16];
    //assign R_LR3  = cop2c[IDX_LR3LG1][15:0];
    //assign R_LG3  = cop2c[IDX_LG2LG3][31:16];
    //assign R_LG2  = cop2c[IDX_LG2LG3][15:0];
    //assign R_LB2  = cop2c[IDX_LB1LB2][31:16];
    //assign R_LB1  = cop2c[IDX_LB1LB2][15:0];
    //assign R_LB3  = cop2c[IDX_LB3][15:0];
    //assign R_RFC  = cop2c[IDX_RFC];
    //assign R_GFC  = cop2c[IDX_GFC];
    //assign R_BFC  = cop2c[IDX_BFC];
    //assign R_OFX  = cop2c[IDX_OFX];
    //assign R_OFY  = cop2c[IDX_OFY];
    //assign R_H    = cop2c[IDX_H][15:0];
    //assign R_DQA  = cop2c[IDX_DQA][15:0];
    //assign R_DQB  = cop2c[IDX_DQB];
    //assign R_ZSF3 = cop2c[IDX_ZSF3][15:0];
    //assign R_ZSF4 = cop2c[IDX_ZSF4][15:0];
    //assign R_FLAG = cop2c[IDX_FLAG];

    /* Cop2D Registers */
    //assign R_VY0  = cop2d[IDX_VXY0][31:16];
    //assign R_VX0  = cop2d[IDX_VXY0][15:0];
    //assign R_VZ0  = cop2d[IDX_VZ0][15:0];
    //assign R_VY1  = cop2d[IDX_VXY1][31:16];
    //assign R_VX1  = cop2d[IDX_VXY1][15:0];
    //assign R_VZ1  = cop2d[IDX_VZ1][15:0];
    //assign R_VY2  = cop2d[IDX_VXY2][31:16];
    //assign R_VX2  = cop2d[IDX_VXY2][15:0];
    //assign R_VZ2  = cop2d[IDX_VZ2][15:0];
    //assign R_CD   = cop2d[IDX_RGB][31:24];
    //assign R_B    = cop2d[IDX_RGB][23:16];
    //assign R_G    = cop2d[IDX_RGB][15:8];
    //assign R_R    = cop2d[IDX_RGB][7:0];
    //assign R_OTZ  = cop2d[IDX_OTZ][15:0];
    //assign R_IR0S = cop2d[IDX_IR0][31:16];
    //assign R_IR0  = cop2d[IDX_IR0][15:0];
    //assign R_IR1S = cop2d[IDX_IR1][31:16];
    //assign R_IR1  = cop2d[IDX_IR1][15:0];
    //assign R_IR2S = cop2d[IDX_IR2][31:16];
    //assign R_IR2  = cop2d[IDX_IR2][15:0];
    //assign R_IR3S = cop2d[IDX_IR3][31:16];
    //assign R_IR3  = cop2d[IDX_IR3][15:0];
    //assign R_SY0  = cop2d[IDX_SXY0][31:16];
    //assign R_SX0  = cop2d[IDX_SXY0][15:0];
    //assign R_SY1  = cop2d[IDX_SXY1][31:16];
    //assign R_SX1  = cop2d[IDX_SXY1][15:0];
    //assign R_SY2  = cop2d[IDX_SXY2][31:16];
    //assign R_SX2  = cop2d[IDX_SXY2][15:0];
    //assign R_SYP  = cop2d[IDX_SXYP][31:16];
    //assign R_SXP  = cop2d[IDX_SXYP][15:0];
    //assign R_SZ0  = cop2d[IDX_SZ0][15:0];
    //assign R_SZ1  = cop2d[IDX_SZ1][15:0];
    //assign R_SZ2  = cop2d[IDX_SZ2][15:0];
    //assign R_SZ3  = cop2d[IDX_SZ3][15:0];
    //assign R_CD0  = cop2d[IDX_RGB0][31:24];
    //assign R_B0   = cop2d[IDX_RGB0][23:16];
    //assign R_G0   = cop2d[IDX_RGB0][15:8];
    //assign R_R0   = cop2d[IDX_RGB0][7:0];
    //assign R_CD1  = cop2d[IDX_RGB1][31:24];
    //assign R_B1   = cop2d[IDX_RGB1][23:16];
    //assign R_G1   = cop2d[IDX_RGB1][15:8];
    //assign R_R1   = cop2d[IDX_RGB1][7:0];
    //assign R_CD2  = cop2d[IDX_RGB2][31:24];
    //assign R_B2   = cop2d[IDX_RGB2][23:16];
    //assign R_G2   = cop2d[IDX_RGB2][15:8];
    //assign R_R2   = cop2d[IDX_RGB2][7:0];
    ////cop2d[IDX_RES1][15:0];
    //assign R_MAC0 = cop2d[IDX_MAC0];
    //assign R_MAC1 = cop2d[IDX_MAC1]
    //assign R_MAC2 = cop2d[IDX_MAC2]
    //assign R_MAC3 = cop2d[IDX_MAC3]
    //assign R_IB   = cop2d[IDX_IRGB][14:10];
    //assign R_IG   = cop2d[IDX_IRGB][9:5];
    //assign R_IR   = cop2d[IDX_IRGB][4:0];
    //assign R_OB   = cop2d[IDX_ORGB][14:10];
    //assign R_OG   = cop2d[IDX_ORGB][9:5];
    //assign R_OR   = cop2d[IDX_ORGB][4:0];
    //assign R_LZCS = cop2d[IDX_LZCS];
    //assign R_LZCR = cop2d[IDX_LZCR][5:0];


    // RTPS 14 cycles
    reg [43:0] ssx, ssy, ssz;
    reg [43:0] sx, sy, p;
    ssx    = R_TRX + (R_R11*R_VX0) + (R_R12*R_VY0) + (R_R13*R_VZ0); // set FLAG 1
    ssy    = R_TRY + (R_R21*R_VX0) + (R_R22*R_VY0) + (R_R23*R_VZ0); // set FLAG 2
    ssz    = R_TRZ + (R_R31*R_VX0) + (R_R32*R_VY0) + (R_R33*R_VZ0); // set FLAG 3
    R_IR1  = ssx // round/truncate; set flag
    R_IR2  = ssy // round/truncate; set flag
    R_IR3  = ssz // round/truncate; set flag
    R_SZ3  = ssz // round/truncate; one inst
    R_SZ2  = R_SZ3; // one inst
    R_SZ1  = R_SZ2; // one inst
    R_SZ0  = R_SZ1; // one inst
    sx     = R_OFX + (R_IR1*(R_H/sz)); // find SZ set FLAG 4
    sy     = R_OFY + (R_IR2*(R_H/sz)); // find SZ set FLAG 4
    p      = R_DQB + (R_DQA*(R_H/sz));
    R_IR0  = p // round;
    R_SX2  = sx // round/truncate; one inst
    R_SX1  = R_SX2; // one inst
    R_SX0  = R_SX1; // one inst
    R_SY2  = sy // round/truncate; one inst
    R_SY1  = R_SY2; // one inst
    R_SY0  = R_SY1; // one inst
    R_MAC0 = p;
    R_MAC1 = ssx;
    R_MAC2 = ssy;
    R_MAC3 = ssz;

    // RTPT 22 cycles
    // needs to be repeated 3 times; n = 0, 1, 2 each time
    ssx[n] = R_TRX + (R_R11*R_VX[n]) + (R_R12*R_VY[n]) + (R_R13*R_VZ[n]); // FLAG 1
    ssy[n] = R_TRY + (R_R21*R_VX[n]) + (R_R22*R_VY[n]) + (R_R23*R_VZ[n]); // FLAG 2
    ssz[n] = R_TRZ + (R_R31*R_VX[n]) + (R_R32*R_VY[n]) + (R_R33*R_VZ[n]); // FLAG 3
    R_SZ0  = R_SZ3;
    R_SZ1  = ssz[0]; // round
    R_SZ2  = ssz[1]; // round
    R_SZ3  = ssz[2]; // round
    sx[n]  = R_OFX + (R_IR1*(R_H/R_SZ[n]); // set flag 4
    sy[n]  = R_OFY + (R_IR2*(R_H/R_SZ[n]); // set flag 4
    p      = R_DQB + (R_DQA*(R_H/R_SZ2)); // set flag 4
    R_IR0  = p // round ed
    sx[n] = sx[n] //rounded
    sy[n] = sy[n] // rounded
    // end repeat
    R_IR1 = ssx[2] //round
    R_IR2 = ssy[2] //round
    R_IR3 = ssz[2] //round
    R_MAC0 = p;
    R_MAC1 = ssx[2];
    R_MAC2 = ssy[2];
    R_MAC3 = ssz[2];

    // NCDS 19
    ll1 = (R_L11*R_VX0) + (R_L12*R_VY0) + (R_L13*R_VZ0); // FLAG 1
    ll2 = (R_L21*R_VX0) + (R_L22*R_VY0) + (R_L23*R_VZ0); // FLAG 2
    ll3 = (R_L31*R_VX0) + (R_L32*R_VY0) + (R_L33*R_VZ0); // FLAG 3
    l1 = ll1 //round
    l2 = ll2 //round
    l3 = ll3 //round
    rrlt = R_RBK + (R_LR1*l1) + (R_LR2*l2) + (R_LR3*l3)
    gglt = R_GBK + (R_LG1*l1) + (R_LG2*l2) + (R_LG3*l3)
    bblt = R_BBK + (R_LB1*l1) + (R_LB2*l2) + (R_LB3*l3)
    rlt = rrlt //round
    glt = gglt //round
    blt = bblt //round
    rr0 = (R_R*rlt) + R_IR0*lim(R_RFC - R_R*rlt)
    gg0 = (R_G*glt) + R_IR0*lim(R_GFC - R_G*glt)
    bb0 = (R_B*blt) + R_IR0*lim(R_BFC - R_B*blt)
    IR1 = limA1U(RR0);
    IR2 = limA2U(GG0);
    IR3 = limA3U(BB0);
    CD0 <- CD1 <- CD2 <- CODE
    R_R0 <- R1 <- R2 <- limB1(RR0);
    R_G0 <- G1 <- G2 <- limB2(GG0);
    R_B0 <- B1 <- B2 <- limB3(BB0);
    R_MAC1 = RR0;
    R_MAC2 = GG0;
    R_MAC3 = BB0;
 
    // NCDT 44
    n=0,1,2 {
        LL1n = L11*VXn + L12*Vyn + L13*VZn;// <1>
        LL2n = L21*VXn + L22*Vyn + L23*VZn;// <2>
        LL3n = L31*VXn + L32*Vyn + L33*VZn;// <3>
        L1n = limA1U(LL1n);
        L2n = limA2U(LL2n);
        L3n = limA3U(LL3n);
        RRLTn = RBK + LR1*L1n + LR2*L2n + LR3*L3n;// <1>
        GGLTn = GBK + LG1*L1n + LG2*L2n + LG3*L3n;// <2>
        BBLTn = BBK + LB1*L1n + LB2*L2n + LB3*L3n;// <3>
        RLTn = limA1U(RRLTn);
        GLTn = limA2U(GGLTn);
        BLTn = limA3U(BBLTn);
        RRn = R*RLTn + IR0*limA1S(RFC - R*RLTn);// <1>
        GGn = G*GLTn + IR0*limA2S(GFC - G*GLTn);// <2>
        BBn = B*BLTn + IR0*limA3S(BFC - B*BLTn);// <3>
        CDn = CODE
        Rn = limB1(RRn); Gn = limB2(GGn);
        Bn = limB3(BBn);
    }
    
    R_IR1 = limA1U(RR2);
    R_IR2 = limA2U(GG2);
    R_IR3 = limA3U(BB2);
    R_MAC1 = RR2;
    R_MAC2 = GG2;
    R_MAC3 = BB2;

    // NCCS 17
    LL1 = L11*VX0 + L12*VY0 + L13*VZ0; <1>
    LL2 = L21*VX0 + L22*VY0 + L23*VZ0; <2>
    LL3 = L31*VX0 + L32*VY0 + L33*VZ0; <3>
    L1 = limA(LL1);
    L2 = limA(LL2);
    L3 = limA(LL3);
    RRLT = RBK + LR1*L1 +LR2*L2 + LR3*L3; <1>
    GGLT = GBK + LG1*L1 +LG2*L2 + LG3*L3; <2>
    BBLT = BBK + LB1*L1 +LB2*L2 + LB3*L3; <3>
    RLT = limA1U(RRLT);
    GLT = limA2U(GGLT);
    BLT = limA3U(BBLT);
    RR0 = R*RLT; <1>
    GG0 = G*GLT; <2>
    BB0 = B*BLT; <3>
    IR1 = limA1U(RR0);
    IR2 = limA2U(GG0);
    IR3 = limA3U(BB0);
    CD0 <- CD1 <- CD2 <- CODE
    R0 <- R1 <- R2 <- limB1(RR0);
    G0 <- G1 <- G2 <- limB2(GG0);
    B0 <- B1 <- B2 <- limB3(BB0);
    MAC1 = RR0;
    MAC2 = GG0;
    MAC3 = BB0;

    // NCCT 39
    n=0,1,2 {
        LL1n = L11*VXn + L12*VYn + L13*VZn; <1>
        LL2n = L21*VXn + L22*VYn + L23*VZn; <2>
        LL3n = L31*VXn + L32*VYn + L33*VZn; <3>
        L1n = limA1U(LL1n);
        L2n = limA2U(LL2n);
        L3n = limA3U(LL3n);
        RRLTn = RBK + LR1*L1n + LR2*L2n + LR3*L3n; <1>
        GGLTn = GBK + LG1*L1n + LG2*L2n + LG3*L3n; <2>
        BBLTn = BBK + LB1*L1n + LB2*L2n + LB3*L3n; <3>
        RLTn = limA1U(RRLTn);
        GLTn = limA2U(GGLTn);
        BLTn = limA3U(BBLTn);
        RRn = R*RLTn; <1>
        GGn = G*GLTn; <2>
        BBn = B*BLTn; <3>
        CDn = CODE
        Rn = limB1(RRn);
        Gn = limB2(GGn);
        Bn = limB3(BBn);
    }
    IR1 = limA1U(RR2); IR2 = limA2U(GG2);
    IR3 = limA3U(BB2);
    MAC1 = RR2; MAC2 = GG2;
    MAC3 = BB2;

    // CDP  13
    RRLT = RBK + LR1*IR1 + LR2*IR2 + LR3*IR3; <1>
    GGLT = GBK + LG1*IR1 + LG2*IR2 + LG3*IR3; <2>
    BBLT = BBK + LB1*IR1 + LB2*IR2 + LB3*IR3; <3>
    RLT = limA1U(RRLT);
    GLT = limA2U(GGLT);
    BLT = limA3U(BBLT);
    RR0 = R*RLT + IR0*limA1S(RFC - R*RLT); <1>
    GG0 = G*GLT + IR0*limA2S(GFC - G*GLT); <2>
    BB0 = B*BLT + IR0*limA3S(BFC - B*BLT); <3>
    IR1 = limA1U(RR0);
    IR2 = limA2U(GG0);
    IR3 = limA3U(BB0);
    CD0 <- CD1 <- CD2 <- CODE
    R0 <- R1 <- R2 <- limB1(RR0);
    G0 <- G1 <- G2 <- limB2(GG0);
    B0 <- B1 <- B2 <- limB3(BB0);
    MAC1 = RR0;
    MAC2 = GG0;
    MAC3 = BB0;

    // CC   11
    RRLT = RBK + LR1*IR1 + LR2*IR2 + LR3*IR3; <1>
    GGLT = GBK + LG1*IR1 + LG2*IR2 + LG3*IR3; <2>
    BBLT = BBK + LB1*IR1 + LB2*IR2 + LB3*IR3; <3>
    RLT = limA1U(RRLT);
    GLT = limA2U(GGLT);
    BLT = limA3U(BBLT);
    RR0 = R*RLT; <1>
    GG0 = G*GLT; <2>
    BB0 = B*BLT; <3>
    IR1 = limA1U(RR0);
    IR2 = limA2U(GG0);
    IR3 = limA3U(BB0);
    CD0 <- CD1 <- CD2 <- CODE
    R0 <- R1 <- R2 <- limB1(RR0);
    G0 <- G1 <- G2 <- limB2(GG0);
    B0 <- B1 <- B2 <- limB3(BB0);
    MAC1 = RR0;
    MAC2 = GG0;
    MAC3 = BB0;

    // NCS  14
    LL1 = L11*VX0 + L12*VY0 + L13*VZ0; <1>
    LL2 = L21*VX0 + L22*VY0 + L23*VZ0; <2>
    LL3 = L31*VX0 + L32*VY0 + L33*VZ0; <3>
    L1 = limA1U(LL1);
    L2 = limA2U(LL2);
    L3 = limA3U(LL3);
    RR0 = RBK + LR1*L1 + LR2*L2 + LR3*L3; <1>
    GG0 = GBK + LG1*L1 + LG2*L2 + LG3*L3; <2>
    BB0 = BBK + LB1*L1 + LB2*L2 + LB3*L3; <3>
    IR1 = limA1U(RR0);
    IR2 = limA2U(GG0);
    IR3 = limA3U(BB0);
    CD0 <- CD1 <- CD2 <- CODE
    R0 <- R1 <- R2 <- limB1(RR0);
    G0 <- G1 <- G2 <- limB2(GG0);
    B0 <- B1 <- B2 <- limB3(BB0);
    MAC1 = RR0;
    MAC2 = GG0;
    MAC3 = BB0;

    // NCT  30
    n=0,1,2 {
        LL1n = L11*VXn + L12*VYn + L13*VZn; <1>
        LL2n = L21*VXn + L22*VYn + L23*VZn; <2>
        LL3n = L31*VXn + L32*VYn + L33*VZn; <3>
        L1n = limA1U(LL1n);
        L2n = limA2U(LL2n);
        L3n = limA3U(LL3n);
        RRn = RBK + LR1*L1n + LR2*L2n + LR3*L3n; <1>
        GGn = GBK + LG1*L1n + LG2*L2n + LG3*L3n; <2>
        BBn = BBK + LB1*L1n + LB2*L2n + LB3*L3n; <3>
        CDn = CODE
        Rn = limB1(RRn);
        Gn = limB2(GGn);
        Bn = limB3(BBn);
    }
    IR1 = limA1U(RR2);
    IR2 = limA2U(GG2);
    IR3 = limA3U(BB2);
    MAC1 = RR2;
    MAC2 = GG2;
    MAC3 = BB2;

    // MVMVA 8

    // DCPL  8
    RR0 = R*IR1 + IR0*limA1S(RFC - R*IR1); <1>
    GG0 = G*IR2 + IR0*limA2S(GFC - G*IR2); <2>
    BB0 = B*IR3 + IR0*limA3S(BFC - B*IR3); <3>
    IR1 = limA1S(RR0);
    IR2 = limA2S(GG0);
    IR3 = limA3S(BB0);
    CD0 <- CD1 <- CD2 <- CODE
    R0 <- R1 <- R2 <- limB1(RR0);
    G0 <- G1 <- G2 <- limB2(GG0);
    B0 <- B1 <- B2 <- limB3(BB0);
    MAC1 = RR0;
    MAC2 = GG0;
    MAC3 = BB0;

    // INTPL 8
    IPL1 = 1.0*IR1 + IR0*limA1S(RFC-1.0*IR1); <1>
    IPL2 = 1.0*IR2 + IR0*limA2S(GFC-1.0*IR2); <2>
    IPL3 = 1.0*IR3 + IR0*limA3S(BFC-1.0*IR3); <3>
    IR1 = limA1S(IPL1);
    IR2 = limA2S(IPL2);
    IR3 = limA3S(IPL3);
    CD0 <- CD1 = CD2 = CODE
    R0 <- R1 <- R2 <- limB1(IPL1);
    G0 <- G1 <- G2 <- limB2(IPL2);
    B0 <- B1 <- B2 <- limB3(IPL3);
    MAC1 = IPL1;
    MAC2 = IPL2;
    MAC3 = IPL3;

    // DPCS  8
    reg [2:0][43:0] rr, gg, bb;

    RR0 = R*1.0 + IR0*limA1S(RFC-R*1.0); <1>
    GG0 = G*1.0 + IR0*limA2S(GFC-G*1.0); <2>
    BB0 = B*1.0 + IR0*limA3S(BFC-B*1.0); <3>
    IR1 = limA1S(RR0);
    IR2 = limA2S(GG0);
    IR3 = limA3S(BB0);
    CD0 <- CD1 <- CD2 <- CODE
    R0 <- R1 <- R2 <- limB1(RR0);
    G0 <- G1 <- G2 <- limB2(GG0);
    B0 <- B1 <- B2 <- limB3(BB0);
    MAC1 = RR0;
    MAC2 = GG0;
    MAC3 = BB0;

    // DPCT  17
    n=0,1,2 {
        rr[n]   <= R_R[n]*1.0 + R_IR0*limA1S(R_RFC-R_R*1.0); <1>
        gg[n]   <= R_G[n]*1.0 + R_IR0*limA2S(R_GFC-R_G*1.0); <2>
        bb[n]   <= R_B[n]*1.0 + R_IR0*limA3S(R_BFC-R_B*1.0); <3>
        R_IR1   <= limA1S(rr[2]); R_IR2   <= limA2S(gg[2]); R_IR3   <= limA3S(bb[2]);
        R_CD[n] <= R_CD; R_R[n]  <= limB1(rr[n]); R_G[n]  <= limB2(gg[n]); R_B[n]  <= limB3(bb[n]);
    }
    R_MAC1 <= rr2;
    R_MAC2 <= gg2; R_MAC3 <= bb2;

    // SQR   5
    L1 = IR1*IR1; //<1>
    L2 = IR2*IR2; //<2>
    L3 = IR3*IR3; //<3>
    IR1 = limA1U(L1);
    IR2 = limA2U(L2);
    IR3 = limA3U(L3);
    MAC1 = L1;
    MAC2 = L2;
    MAC3 = L3;

        // AVSZ3 5
        reg [3:0][52:0] ootz;
        if (/* instruction == AVSF3 */) begin
            if (count == 'd0) ootz[0] <= R_ZSF3*R_SZ1;
            else if (count == 'd1) ootz[1] <= R_ZSF3*R_SZ2;
            else if (count == 'd2) ootz[2] <= R_ZSF3*R_SZ3;
            else if (count == 'd3) ootz[3] <= ootz[0] + ootz[1] + ootz[2]; // <4>
            else if (count == 'd4) begin
                R_OTZ <= limC({ootz[3][52], ootz[3][51:21]});
                R_MAC0 <= {ootz[3][52], ootz[3][51:21]}; // 53 bits -> 31 bits
            end
        end

        // AVSZ4 6
        reg [4:0][43:0] ootz;
        if (/* instruction == AVSZ4*/) begin
            if (count == 'd0) ootz[0] <= R_ZSF4*R_SZ0;
            else if (count == 'd1) ootz[1] <= R_ZSF4*R_SZ1;
            else if (count == 'd2) ootz[2] <= R_ZSF4*R_SZ2;
            else if (count == 'd3) ootz[3] <= R_ZSF4*R_SZ3;
            else if (count == 'd4) ootz[4] <= ootz[0] + ootz[1] + ootz[2] + ootz[3]; // <4>
            else if (count == 'd5) begin
                R_OTZ <= limC({ootz[4][43], ootz[4][42:12]});
                R_MAC0 <= {ootz[43], ootz[4][42:12]}; // 43 bits -> 31 bits
            end
        end

        // NCLIP 8
        reg [6:0][43:0] opz;
        if (/* instruction == CLIP */) begin
            if (count == 'd0) opz[0] <= R_SX0*R_SY1;
            else if (count == 'd1) opz[1] <= R_SX1*R_SY2;
            else if (count == 'd2) opz[2] <= R_SX2*R_SY0;
            else if (count == 'd3) opz[3] <= R_SX0*R_SY2;
            else if (count == 'd4) opz[4] <= R_SX1*R_SY0;
            else if (count == 'd5) opz[5] <= R_SX2*R_SY1;
            else if (count == 'd6) opz[6] <= opz[0] + opz[1] + opz[2] - opz[3] - opz[4] - opz[5]; // <4>
            else if (count == 'd7) R_MAC0 <= {opz[6][31:0]}; // 43 bits -> 31 bits
        end

    // OP    6
    // GPF   5
    // GPL   5
    
    function [15:0] limC; // <18>
        input [31:0] val;
        begin
            if (val[31]) limC = 16'h0;
            else limC = ((val[30:0] > 'h7FFF) ? 16'h7FFF : {1'b0, val[14:0]});
        end
    endfunction
    
    function [15:0] limA1U; // <24>
        input [31:0] val;
        begin
            if (val[31]) limA1U = 16'h0;
            else limA1U = ((val[30:0] > 'h7FFF) ? 16'h7FFF : {1'b0, val[14:0]});
        end
    endfunction

    function [15:0] limA2U; // <23>
        input [31:0] val;
        begin
            if (val[31]) limA2U = 16'h0;
            else limA2U = ((val[30:0] > 'h7FFF) ? 16'h7FFF : {1'b0, val[14:0]});
        end
    endfunction
    
    function [15:0] limA3U; // <22>
        input [31:0] val;
        begin
            if (val[31]) limA3U = 16'h0;
            else limA3U = ((val[30:0] > 'h7FFF) ? 16'h7FFF : {1'b0, val[14:0]});
        end
    endfunction

endmodule: GTE
