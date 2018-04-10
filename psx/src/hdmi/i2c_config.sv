typedef enum reg [5:0] {  STB_CYC, 
			  CORE,

			  /* switch configuration states */
			  SWITCH_RESET,
			  SWITCH_INIT_W1,
			  SWITCH_WAIT_W1,
			  SWITCH_TIP_W1,
			  SWITCH_ACK_W1,
			  SWITCH_INIT_W2,
			  SWITCH_WAIT_W2,
			  SWITCH_TIP_W2,
			  SWITCH_ACK_W2,
			  CHECK_INIT,
			  CHECK_WAIT,
			  CHECK_TIP,
			  CHECK_ACK,
			  CHECK_READ_1,
			  CHECK_READ_2,

			  CHECK_HPD_SI_1,
			  CHECK_HPD_SW_1,
			  CHECK_HPD_ST_1,
			  CHECK_HPD_SA_1,
			  CHECK_HPD_AI,
			  CHECK_HPD_AW,
			  CHECK_HPD_AT,
			  CHECK_HPD_AA,
			  CHECK_HPD_SI_2,
			  CHECK_HPD_SW_2,
			  CHECK_HPD_ST_2,
			  CHECK_HPD_SA_2,
			  CHECK_HPD_READ_1,
			  CHECK_HPD_READ_2,
			  
			  /* ADV7511 configuration states */
			  SLAVE_INIT,
			  SLAVE_WAIT,
			  SLAVE_TIP,
			  SLAVE_ACK,
			  ADDR_INIT,
			  ADDR_WAIT,
			  ADDR_TIP,
			  ADDR_ACK,
			  DATA_INIT,
			  DATA_WAIT,
			  DATA_TIP,
			  DATA_ACK,
			  CHECK_HDMI_SI_1,
			  CHECK_HDMI_SW_1,
			  CHECK_HDMI_ST_1,
			  CHECK_HDMI_SA_1,
			  CHECK_HDMI_AI,
			  CHECK_HDMI_AW,
			  CHECK_HDMI_AT,
			  CHECK_HDMI_AA,
			  CHECK_HDMI_SI_2,
			  CHECK_HDMI_SW_2,
			  CHECK_HDMI_ST_2,
			  CHECK_HDMI_SA_2,
			  CHECK_HDMI_READ_1,
			  CHECK_HDMI_READ_2,

			  SWITCH_VERIFY,
			  HDMI_VERIFY,
			  HPD_VERIFY,
			  ERROR,
			  IDLE } iic_fsm_t;



module i2c_config(input logic  clk,
		  input logic  rst,
		/*input logic  skip,*/
		  inout logic  SDA,
		  inout logic  SCL,
		  output logic IIC_RST,
		  output logic done,
		  output logic error         /*,
		  output logic [7:0] error_1,
		  output logic [7:0] error_2,
		  output logic [7:0] error_3 */);

   localparam  PRER_LO  = 8'h8F;
   localparam  PRER_HI  = 8'h01;
   localparam  CTRL_REG = 8'h80;
   localparam  WRITE    = 1'b0;
   localparam  READ     = 1'b1;

   /* IIC Switch configuration addr & data */
   localparam  SWITCH_ADDR = 7'h74;
   localparam  SWITCH_DATA = 8'h20;

   /* address of ADV7511 on IIC bus */
   localparam  HDMI_ADDR   = 7'h39;
   localparam  HDMI_HPDA   = 8'h96;

   /* number of registers being written */
   localparam  REG_COUNT = 205;

/**************************************************************************
  TESTING REGISTER WRITES 
 **************************************************************************/
   reg [7:0]  ADDR[0:205];
   assign ADDR[0] = 8'h01;
   assign ADDR[1] = 8'h02;
   assign ADDR[2] = 8'h03;
   assign ADDR[3] = 8'h07;
   assign ADDR[4] = 8'h08;
   assign ADDR[5] = 8'h09;
   assign ADDR[6] = 8'h0A;
   assign ADDR[7] = 8'h0B;
   assign ADDR[8] = 8'h0C;
   assign ADDR[9] = 8'h0D;
   assign ADDR[10] = 8'h0E;
   assign ADDR[11] = 8'h0F;
   assign ADDR[12] = 8'h10;
   assign ADDR[13] = 8'h11;
   assign ADDR[14] = 8'h12;
   assign ADDR[15] = 8'h13;
   assign ADDR[16] = 8'h14;
   assign ADDR[17] = 8'h15;
   assign ADDR[18] = 8'h16;
   assign ADDR[19] = 8'h17;
   assign ADDR[20] = 8'h18;
   assign ADDR[21] = 8'h19;
   assign ADDR[22] = 8'h1A;
   assign ADDR[23] = 8'h1B;
   assign ADDR[24] = 8'h1C;
   assign ADDR[25] = 8'h1D;
   assign ADDR[26] = 8'h1E;
   assign ADDR[27] = 8'h1F;
   assign ADDR[28] = 8'h20;
   assign ADDR[29] = 8'h21;
   assign ADDR[30] = 8'h22;
   assign ADDR[31] = 8'h23;
   assign ADDR[32] = 8'h24;
   assign ADDR[33] = 8'h25;
   assign ADDR[34] = 8'h26;
   assign ADDR[35] = 8'h27;
   assign ADDR[36] = 8'h28;
   assign ADDR[37] = 8'h29;
   assign ADDR[38] = 8'h2A;
   assign ADDR[39] = 8'h2B;
   assign ADDR[40] = 8'h2C;
   assign ADDR[41] = 8'h2D;
   assign ADDR[42] = 8'h2E;
   assign ADDR[43] = 8'h2F;
   assign ADDR[44] = 8'h30;
   assign ADDR[45] = 8'h31;
   assign ADDR[46] = 8'h32;
   assign ADDR[47] = 8'h33;
   assign ADDR[48] = 8'h34;
   assign ADDR[49] = 8'h35;
   assign ADDR[50] = 8'h36;
   assign ADDR[51] = 8'h37;
   assign ADDR[52] = 8'h38;
   assign ADDR[53] = 8'h39;
   assign ADDR[54] = 8'h3A;
   assign ADDR[55] = 8'h3B;
   assign ADDR[56] = 8'h3C;
   assign ADDR[57] = 8'h40;
   assign ADDR[58] = 8'h41;
   assign ADDR[59] = 8'h43;
   assign ADDR[60] = 8'h44;
   assign ADDR[61] = 8'h45;
   assign ADDR[62] = 8'h46;
   assign ADDR[63] = 8'h47;
   assign ADDR[64] = 8'h48;
   assign ADDR[65] = 8'h49;
   assign ADDR[66] = 8'h4A;
   assign ADDR[67] = 8'h4B;
   assign ADDR[68] = 8'h4D;
   assign ADDR[69] = 8'h4E;
   assign ADDR[70] = 8'h4F;
   assign ADDR[71] = 8'h50;
   assign ADDR[72] = 8'h51;
   assign ADDR[73] = 8'h52;
   assign ADDR[74] = 8'h53;
   assign ADDR[75] = 8'h54;
   assign ADDR[76] = 8'h55;
   assign ADDR[77] = 8'h56;
   assign ADDR[78] = 8'h57;
   assign ADDR[79] = 8'h58;
   assign ADDR[80] = 8'h59;
   assign ADDR[81] = 8'h5A;
   assign ADDR[82] = 8'h5B;
   assign ADDR[83] = 8'h5C;
   assign ADDR[84] = 8'h5D;
   assign ADDR[85] = 8'h5E;
   assign ADDR[86] = 8'h5F;
   assign ADDR[87] = 8'h60;
   assign ADDR[88] = 8'h61;
   assign ADDR[89] = 8'h62;
   assign ADDR[90] = 8'h63;
   assign ADDR[91] = 8'h64;
   assign ADDR[92] = 8'h65;
   assign ADDR[93] = 8'h66;
   assign ADDR[94] = 8'h67;
   assign ADDR[95] = 8'h68;
   assign ADDR[96] = 8'h69;
   assign ADDR[97] = 8'h6A;
   assign ADDR[98] = 8'h6B;
   assign ADDR[99] = 8'h6C;
   assign ADDR[100] = 8'h6D;
   assign ADDR[101] = 8'h6E;
   assign ADDR[102] = 8'h6F;
   assign ADDR[103] = 8'h70;
   assign ADDR[104] = 8'h71;
   assign ADDR[105] = 8'h72;
   assign ADDR[106] = 8'h73;
   assign ADDR[107] = 8'h74;
   assign ADDR[108] = 8'h75;
   assign ADDR[109] = 8'h76;
   assign ADDR[110] = 8'h77;
   assign ADDR[111] = 8'h78;
   assign ADDR[112] = 8'h79;
   assign ADDR[113] = 8'h7A;
   assign ADDR[114] = 8'h7B;
   assign ADDR[115] = 8'h7C;
   assign ADDR[116] = 8'h92;
   assign ADDR[117] = 8'h93;
   assign ADDR[118] = 8'h94;
   assign ADDR[119] = 8'h95;
   assign ADDR[120] = 8'h96;
   assign ADDR[121] = 8'h97;
   assign ADDR[122] = 8'h98;
   assign ADDR[123] = 8'h99;
   assign ADDR[124] = 8'h9A;
   assign ADDR[125] = 8'h9B;
   assign ADDR[126] = 8'h9C;
   assign ADDR[127] = 8'h9D;
   assign ADDR[128] = 8'h9F;
   assign ADDR[129] = 8'hA1;
   assign ADDR[130] = 8'hA2;
   assign ADDR[131] = 8'hA3;
   assign ADDR[132] = 8'hA4;
   assign ADDR[133] = 8'hA5;
   assign ADDR[134] = 8'hA6;
   assign ADDR[135] = 8'hA7;
   assign ADDR[136] = 8'hA8;
   assign ADDR[137] = 8'hA9;
   assign ADDR[138] = 8'hAA;
   assign ADDR[139] = 8'hAB;
   assign ADDR[140] = 8'hAF;
   assign ADDR[141] = 8'hB9;
   assign ADDR[142] = 8'hBA;
   assign ADDR[143] = 8'hBB;
   assign ADDR[144] = 8'hC4;
   assign ADDR[145] = 8'hC5;
   assign ADDR[146] = 8'hC7;
   assign ADDR[147] = 8'hC9;
   assign ADDR[148] = 8'hCD;
   assign ADDR[149] = 8'hCE;
   assign ADDR[150] = 8'hCF;
   assign ADDR[151] = 8'hD0;
   assign ADDR[152] = 8'hD1;
   assign ADDR[153] = 8'hD2;
   assign ADDR[154] = 8'hD3;
   assign ADDR[155] = 8'hD4;
   assign ADDR[156] = 8'hD5;
   assign ADDR[157] = 8'hD6;
   assign ADDR[158] = 8'hD7;
   assign ADDR[159] = 8'hD8;
   assign ADDR[160] = 8'hD9;
   assign ADDR[161] = 8'hDA;
   assign ADDR[162] = 8'hDB;
   assign ADDR[163] = 8'hDC;
   assign ADDR[164] = 8'hDD;
   assign ADDR[165] = 8'hDE;
   assign ADDR[166] = 8'hDF;
   assign ADDR[167] = 8'hE0;
   assign ADDR[168] = 8'hE1;
   assign ADDR[169] = 8'hE2;
   assign ADDR[170] = 8'hE3;
   assign ADDR[171] = 8'hE4;
   assign ADDR[172] = 8'hF9;
   assign ADDR[173] = 8'hFA;
   assign ADDR[174] = 8'hFB;
   assign ADDR[175] = 8'hFC;
   assign ADDR[176] = 8'hFD;
   assign ADDR[177] = 8'hFE;

   assign ADDR[178] = 8'h01;
   assign ADDR[179] = 8'h02;
   assign ADDR[180] = 8'h03;
   assign ADDR[181] = 8'h15;
   assign ADDR[182] = 8'h16;
   assign ADDR[183] = 8'h17;
   assign ADDR[184] = 8'h18;
   assign ADDR[185] = 8'h40;
   assign ADDR[186] = 8'h41;
   assign ADDR[187] = 8'h48;
   assign ADDR[188] = 8'h49;
   assign ADDR[189] = 8'h4C;
   assign ADDR[190] = 8'h55;
   assign ADDR[191] = 8'h56;
   assign ADDR[192] = 8'h96;
   assign ADDR[193] = 8'h98;
   assign ADDR[194] = 8'h99;
   assign ADDR[195] = 8'h9C;
   assign ADDR[196] = 8'h9D;
   assign ADDR[197] = 8'hA2;
   assign ADDR[198] = 8'hA3;
   assign ADDR[199] = 8'hA5;
   assign ADDR[200] = 8'hAB;
   assign ADDR[201] = 8'hAF;
   assign ADDR[202] = 8'hBA;
   assign ADDR[203] = 8'hD1;
   assign ADDR[204] = 8'hDE;
   assign ADDR[205] = 8'hE4;

   reg [7:0]  DATA[0:205];
   assign DATA[0] = 8'h00;
   assign DATA[1] = 8'h00;
   assign DATA[2] = 8'h00;
   assign DATA[3] = 8'h00;
   assign DATA[4] = 8'h00;
   assign DATA[5] = 8'h00;
   assign DATA[6] = 8'h01;
   assign DATA[7] = 8'h0E;
   assign DATA[8] = 8'hBC;
   assign DATA[9] = 8'h18;
   assign DATA[10] = 8'h01;
   assign DATA[11] = 8'h13;
   assign DATA[12] = 8'h25;
   assign DATA[13] = 8'h37;
   assign DATA[14] = 8'h00;
   assign DATA[15] = 8'h00;
   assign DATA[16] = 8'h00;
   assign DATA[17] = 8'h00;
   assign DATA[18] = 8'h00;
   assign DATA[19] = 8'h00;
   assign DATA[20] = 8'h46;
   assign DATA[21] = 8'h62;
   assign DATA[22] = 8'h04;
   assign DATA[23] = 8'hA8;
   assign DATA[24] = 8'h00;
   assign DATA[25] = 8'h00;
   assign DATA[26] = 8'h1C;
   assign DATA[27] = 8'h84;
   assign DATA[28] = 8'h1C;
   assign DATA[29] = 8'hBF;
   assign DATA[30] = 8'h04;
   assign DATA[31] = 8'hA8;
   assign DATA[32] = 8'h1E;
   assign DATA[33] = 8'h70;
   assign DATA[34] = 8'h02;
   assign DATA[35] = 8'h1E;
   assign DATA[36] = 8'h00;
   assign DATA[37] = 8'h00;
   assign DATA[38] = 8'h04;
   assign DATA[39] = 8'hA8;
   assign DATA[40] = 8'h08;
   assign DATA[41] = 8'h12;
   assign DATA[42] = 8'h1B;
   assign DATA[43] = 8'hAC;
   assign DATA[44] = 8'h00;
   assign DATA[45] = 8'h00;
   assign DATA[46] = 8'h00;
   assign DATA[47] = 8'h00;
   assign DATA[48] = 8'h00;
   assign DATA[49] = 8'h00;
   assign DATA[50] = 8'h00;
   assign DATA[51] = 8'h00;
   assign DATA[52] = 8'h00;
   assign DATA[53] = 8'h00;
   assign DATA[54] = 8'h00;
   assign DATA[55] = 8'h80;
   assign DATA[56] = 8'h00;
   assign DATA[57] = 8'h00;
   assign DATA[58] = 8'h50;
   assign DATA[59] = 8'h7E;
   assign DATA[60] = 8'h79;
   assign DATA[61] = 8'h70;
   assign DATA[62] = 8'h00;
   assign DATA[63] = 8'h00;
   assign DATA[64] = 8'h00;
   assign DATA[65] = 8'hA8;
   assign DATA[66] = 8'h80;
   assign DATA[67] = 8'h00;
   assign DATA[68] = 8'h00;
   assign DATA[69] = 8'h00;
   assign DATA[70] = 8'h00;
   assign DATA[71] = 8'h00;
   assign DATA[72] = 8'h00;
   assign DATA[73] = 8'h02;
   assign DATA[74] = 8'h0D;
   assign DATA[75] = 8'h00;
   assign DATA[76] = 8'h00;
   assign DATA[77] = 8'h00;
   assign DATA[78] = 8'h00;
   assign DATA[79] = 8'h00;
   assign DATA[80] = 8'h00;
   assign DATA[81] = 8'h00;
   assign DATA[82] = 8'h00;
   assign DATA[83] = 8'h00;
   assign DATA[84] = 8'h00;
   assign DATA[85] = 8'h00;
   assign DATA[86] = 8'h00;
   assign DATA[87] = 8'h00;
   assign DATA[88] = 8'h00;
   assign DATA[89] = 8'h00;
   assign DATA[90] = 8'h00;
   assign DATA[91] = 8'h00;
   assign DATA[92] = 8'h00;
   assign DATA[93] = 8'h00;
   assign DATA[94] = 8'h00;
   assign DATA[95] = 8'h00;
   assign DATA[96] = 8'h00;
   assign DATA[97] = 8'h00;
   assign DATA[98] = 8'h00;
   assign DATA[99] = 8'h00;
   assign DATA[100] = 8'h00;
   assign DATA[101] = 8'h00;
   assign DATA[102] = 8'h00;
   assign DATA[103] = 8'h01;
   assign DATA[104] = 8'h0A;
   assign DATA[105] = 8'h00;
   assign DATA[106] = 8'h00;
   assign DATA[107] = 8'h00;
   assign DATA[108] = 8'h00;
   assign DATA[109] = 8'h00;
   assign DATA[110] = 8'h00;
   assign DATA[111] = 8'h00;
   assign DATA[112] = 8'h00;
   assign DATA[113] = 8'h00;
   assign DATA[114] = 8'h00;
   assign DATA[115] = 8'h00;
   assign DATA[116] = 8'h00;
   assign DATA[117] = 8'h00;
   assign DATA[118] = 8'hC0;
   assign DATA[119] = 8'h00;
   assign DATA[120] = 8'h00;
   assign DATA[121] = 8'h00;
   assign DATA[122] = 8'h0B;
   assign DATA[123] = 8'h02;
   assign DATA[124] = 8'h00;
   assign DATA[125] = 8'h18;
   assign DATA[126] = 8'h5A;
   assign DATA[127] = 8'h60;
   assign DATA[128] = 8'h00;
   assign DATA[129] = 8'h00;
   assign DATA[130] = 8'h80;
   assign DATA[131] = 8'h80;
   assign DATA[132] = 8'h08;
   assign DATA[133] = 8'h04;
   assign DATA[134] = 8'h00;
   assign DATA[135] = 8'h00;
   assign DATA[136] = 8'h00;
   assign DATA[137] = 8'h00;
   assign DATA[138] = 8'h00;
   assign DATA[139] = 8'h40;
   assign DATA[140] = 8'h14;
   assign DATA[141] = 8'h00;
   assign DATA[142] = 8'h10;
   assign DATA[143] = 8'h00;
   assign DATA[144] = 8'h00;
   assign DATA[145] = 8'h00;
   assign DATA[146] = 8'h00;
   assign DATA[147] = 8'h03;
   assign DATA[148] = 8'h00;
   assign DATA[149] = 8'h01;
   assign DATA[150] = 8'h04;
   assign DATA[151] = 8'h30;
   assign DATA[152] = 8'hFF;
   assign DATA[153] = 8'h80;
   assign DATA[154] = 8'h80;
   assign DATA[155] = 8'h80;
   assign DATA[156] = 8'h00;
   assign DATA[157] = 8'h00;
   assign DATA[158] = 8'h00;
   assign DATA[159] = 8'h00;
   assign DATA[160] = 8'h00;
   assign DATA[161] = 8'h00;
   assign DATA[162] = 8'h00;
   assign DATA[163] = 8'h00;
   assign DATA[164] = 8'h00;
   assign DATA[165] = 8'h10;
   assign DATA[166] = 8'h01;
   assign DATA[167] = 8'h80;
   assign DATA[168] = 8'h78;
   assign DATA[169] = 8'h00;
   assign DATA[170] = 8'h00;
   assign DATA[171] = 8'h60;
   assign DATA[172] = 8'h7C;
   assign DATA[173] = 8'h00;
   assign DATA[174] = 8'h00;
   assign DATA[175] = 8'h00;
   assign DATA[176] = 8'h00;
   assign DATA[177] = 8'h00;

   
   assign DATA[178] = 8'h00;
   assign DATA[179] = 8'h18;
   assign DATA[180] = 8'h00;
   assign DATA[181] = 8'h00;
   assign DATA[182] = 8'h70;
   assign DATA[183] = 8'h00;
   assign DATA[184] = 8'h46;
   assign DATA[185] = 8'h80;
   assign DATA[186] = 8'h10;
   assign DATA[187] = 8'h08;
   assign DATA[188] = 8'hA8;
   assign DATA[189] = 8'h00;
   assign DATA[190] = 8'h00;
   assign DATA[191] = 8'h08;
   assign DATA[192] = 8'h20;
   assign DATA[193] = 8'h03;
   assign DATA[194] = 8'h02;
   assign DATA[195] = 8'h30;
   assign DATA[196] = 8'h61;
   assign DATA[197] = 8'hA4;
   assign DATA[198] = 8'hA4;
   assign DATA[199] = 8'h44;
   assign DATA[200] = 8'h40;
   assign DATA[201] = 8'h16;
   assign DATA[202] = 8'h60;
   assign DATA[203] = 8'hFF;
   assign DATA[204] = 8'h9C;
   assign DATA[205] = 8'h60;

   
/**************************************************************************
  OUR REGISTER WRITES 
 **************************************************************************/
   
   /* register addresses */
   //reg [7:0]   ADDR [0:62];

   /* CONFIGURATION REGISTERS */
   //assign ADDR[ 0] = 8'h41;     /* 00 - power-up power-down */
   //assign ADDR[ 1] = 8'h0B;     /* 01 - SPDIF config */
   //assign ADDR[ 2] = 8'h14;     /* 02 - audio sample word length */
   //assign ADDR[ 3] = 8'h15;     /* 03 - input video format */
   //assign ADDR[ 4] = 8'h16;     /* 04 - color depth, video input edge, RGB */
   //assign ADDR[ 5] = 8'h17;     /* 05 - vsync hsync polarity */
   //assign ADDR[ 6] = 8'h3C;     /* 06 - VIC to send to Rx */
   //assign ADDR[ 7] = 8'h0A;     /* 07 - audio type select */
   //assign ADDR[ 8] = 8'h55;     /* 08 - video output format */
   //assign ADDR[ 9] = 8'h73;     /* 09 - audio channel count */
   //assign ADDR[10] = 8'h9D;     /* 10 - input pixel clock divide */
   //assign ADDR[11] = 8'hAF;     /* 11 - HDCP encryption, HDMI mode */
   //assign ADDR[12] = 8'hD7;     /* 12 - vsync hsync durations */
   //assign ADDR[13] = 8'hD8;     /* 13 - */
   //assign ADDR[14] = 8'hD9;     /* 14 - */
   //assign ADDR[15] = 8'hDA;     /* 15 - */
   //assign ADDR[16] = 8'hDB;     /* 16 - */
   //assign ADDR[17] = 8'hF9;     /* 17 - fixed I2C address */

   /* REQUIRED REGISTERS (reserved) */
   //assign ADDR[18] = 8'h3B;     /* 18 - */
   //assign ADDR[19] = 8'h44;     /* 19 - */
   //assign ADDR[20] = 8'h48;     /* 20 - */
   //assign ADDR[21] = 8'h94;     /* 21 - */
   //assign ADDR[22] = 8'h96;     /* 22 - */
   //assign ADDR[23] = 8'h98;     /* 23 - */
   //assign ADDR[24] = 8'h99;     /* 24 - */
   //assign ADDR[25] = 8'h9A;     /* 25 - */
   //assign ADDR[26] = 8'h9B;     /* 26 - */
   //assign ADDR[27] = 8'h9C;     /* 27 - */
   //assign ADDR[28] = 8'h9F;     /* 28 - */
   //assign ADDR[29] = 8'hA1;     /* 29 - */
   //assign ADDR[30] = 8'hA2;     /* 30 - */
   //assign ADDR[31] = 8'hA3;     /* 31 - */
   //assign ADDR[32] = 8'hA4;     /* 32 - */
   //assign ADDR[33] = 8'hA5;     /* 33 - */
   //assign ADDR[34] = 8'hA6;     /* 34 - */
   //assign ADDR[35] = 8'hA7;     /* 35 - */
   //assign ADDR[36] = 8'hA8;     /* 36 - */
   //assign ADDR[37] = 8'hA9;     /* 37 - */
   //assign ADDR[38] = 8'hAA;     /* 38 - */
   //assign ADDR[39] = 8'hAB;     /* 39 - */
   //assign ADDR[40] = 8'hB9;     /* 40 - */
   //assign ADDR[41] = 8'hBA;     /* 41 - */
   //assign ADDR[42] = 8'hBB;     /* 42 - */
   //assign ADDR[43] = 8'hC7;     /* 43 - */
   //assign ADDR[44] = 8'hCD;     /* 44 - */
   //assign ADDR[45] = 8'hCE;     /* 45 - */
   //assign ADDR[46] = 8'hCF;     /* 46 - */
   //assign ADDR[47] = 8'hD0;     /* 47 - */
   //assign ADDR[48] = 8'hD1;     /* 48 - */
   //assign ADDR[49] = 8'hD2;     /* 49 - */
   //assign ADDR[50] = 8'hD3;     /* 50 - */
   //assign ADDR[51] = 8'hD4;     /* 51 - */
   //assign ADDR[52] = 8'hD5;     /* 52 - */
   //assign ADDR[53] = 8'hD6;     /* 53 - */
   //assign ADDR[54] = 8'hDC;     /* 54 - */
   //assign ADDR[55] = 8'hDD;     /* 55 - */
   //assign ADDR[56] = 8'hDE;     /* 56 - */
   //assign ADDR[57] = 8'hDF;     /* 57 - */
   //assign ADDR[58] = 8'hE0;     /* 58 - */
   //assign ADDR[59] = 8'hE2;     /* 59 - */
   //assign ADDR[60] = 8'hE3;     /* 60 - */
   //assign ADDR[61] = 8'hE4;     /* 61 - */
   //assign ADDR[62] = 8'hFA;     /* 62 - */
   
   /* values that have to be written to above registers */
   //reg [7:0]   DATA [0:62];
   
   /* CONFIGURATION REGISTERS */
   //assign DATA[ 0] = 8'h10;     /* 00 - power on ADV7511 */
   //assign DATA[ 1] = 8'hCE;     /* 01 - */
   //assign DATA[ 2] = 8'h02;     /* 02 - 16-bit */
   //assign DATA[ 3] = 8'h00;     /* 03 - 24-bit RGB 4:4:4 */
   //assign DATA[ 4] = 8'h32;     /* 04 - color depth 8-bit, rising edge */
   //assign DATA[ 5] = 8'h60;     /* 05 - low polarity */
   //assign DATA[ 6] = 8'h02;     /* 06 - */
   //assign DATA[ 7] = 8'h10;     /* 07 - SPDIF, MCLK */
   //assign DATA[ 8] = 8'h00;     /* 08 - RGB output */
   //assign DATA[ 9] = 8'h01;     /* 09 - 2-channel audio */
   //assign DATA[10] = 8'h60;     /* 10 - clock not divided */
   //assign DATA[11] = 8'h06;     /* 11 - disable encryption, HDMI */
   //assign DATA[12] = 8'h04;     /* 12 - hsync front porch = 16 */
   //assign DATA[13] = 8'h03;     /* 13 - hsync duration    = 62 */
   //assign DATA[14] = 8'hE0;     /* 14 - vsync front porch = 9  */
   //assign DATA[15] = 8'h24;     /* 15 - vsync duration    = 6  */
   //assign DATA[16] = 8'h06;     /* 16 - */
   //assign DATA[17] = 8'h00;     /* 17 - set to a non-conflicting address */
   
   /* REQUIRED REGISTERS (reserved) */
   //assign DATA[18] = 8'hE0;     /* 18 - */
   //assign DATA[19] = 8'h00;     /* 19 - */
   //assign DATA[20] = 8'h00;     /* 20 - */
   //assign DATA[21] = 8'hC0;     /* 21 - */
   //assign DATA[22] = 8'h00;     /* 22 - */
   //assign DATA[23] = 8'h03;     /* 23 - */
   //assign DATA[24] = 8'h02;     /* 24 - */
   //assign DATA[25] = 8'hE0;     /* 25 - */
   //assign DATA[26] = 8'h18;     /* 26 - */
   //assign DATA[27] = 8'h30;     /* 27 - */
   //assign DATA[28] = 8'h00;     /* 28 - */
   //assign DATA[29] = 8'h00;     /* 29 - */
   //assign DATA[30] = 8'hA4;     /* 30 - */
   //assign DATA[31] = 8'hA4;     /* 31 - */
   //assign DATA[32] = 8'h08;     /* 32 - */
   //assign DATA[33] = 8'h04;     /* 33 - */
   //assign DATA[34] = 8'h00;     /* 34 - */
   //assign DATA[35] = 8'h00;     /* 35 - */
   //assign DATA[36] = 8'h00;     /* 36 - */
   //assign DATA[37] = 8'h00;     /* 37 - */
   //assign DATA[38] = 8'h00;     /* 38 - */
   //assign DATA[39] = 8'h40;     /* 39 - */
   //assign DATA[40] = 8'h00;     /* 40 - */
   //assign DATA[41] = 8'h00;     /* 41 - */
   //assign DATA[42] = 8'h00;     /* 42 - */
   //assign DATA[43] = 8'h00;     /* 43 - */
   //assign DATA[44] = 8'h00;     /* 44 - */
   //assign DATA[45] = 8'h01;     /* 45 - */
   //assign DATA[46] = 8'h04;     /* 46 - */
   //assign DATA[47] = 8'h3C;     /* 47 - */
   //assign DATA[48] = 8'hFF;     /* 48 - */
   //assign DATA[49] = 8'h80;     /* 49 - */
   //assign DATA[50] = 8'h80;     /* 50 - */
   //assign DATA[51] = 8'h80;     /* 51 - */
   //assign DATA[52] = 8'h00;     /* 52 - */
   //assign DATA[53] = 8'h00;     /* 53 - */
   //assign DATA[54] = 8'h00;     /* 54 - */
   //assign DATA[55] = 8'h00;     /* 55 - */
   //assign DATA[56] = 8'h10;     /* 56 - */
   //assign DATA[57] = 8'h01;     /* 57 - */
   //assign DATA[58] = 8'h3C;     /* 58 - */
   //assign DATA[59] = 8'h00;     /* 59 - */
   //assign DATA[60] = 8'h00;     /* 60 - */
   //assign DATA[61] = 8'h60;     /* 61 - */
   //assign DATA[62] = 8'h00;     /* 62 - */
 
   
   /* i2c core registers */
   reg [2:0]   wb_adr_i, next_wb_adr;
   reg [7:0]   wb_dat_i, next_wb_dat;
   reg [7:0]   wb_dat_o;
   reg 	       wb_we_i;
   reg 	       wb_stb_i;
   reg 	       wb_cyc_i;
   reg 	       wb_ack_o;
   reg 	       wb_inta_o;
   reg 	       scl_pad_i;
   reg 	       scl_pad_o;
   reg 	       scl_padoen_o;
   reg 	       sda_pad_i;
   reg 	       sda_pad_o;
   reg 	       sda_padoen_o;

   reg 	       wb_rst_i;
   
   /* internal registers */
   reg 	       IIC_RST_out;
   reg 	       done_out;
   reg 	       switch_reset;
   reg [1:0]   count;
   reg [7:0]   adv_reg, next_adv_reg;
   reg [7:0]   error_out;
   
   /* state variables */
   iic_fsm_t   curr_state, next_state;

   
   /* outputs */
   assign IIC_RST = IIC_RST_out;
   assign done    = done_out;
 
   assign error   = error_out;   
 /*assign error_1 = ADDR[adv_reg];
   assign error_2 = DATA[adv_reg];
   assign error_3 = wb_dat_o;*/
   
   /* setup tri-state buffers for SDA and SCL */
   assign SCL       = scl_padoen_o ? 1'bz : scl_pad_o;
   assign SDA       = sda_padoen_o ? 1'bz : sda_pad_o;
   assign scl_pad_i = SCL;
   assign sda_pad_i = SDA;

   /* we are not using the sync reset */
   assign wb_rst_i  = 1'b0;

   
   /* i2c core top module */
   i2c_master_top i2c_core(.wb_clk_i     (clk),
			   .wb_rst_i     (wb_rst_i),
			   .arst_i       (rst),
			   .wb_adr_i     (wb_adr_i),
			   .wb_dat_i     (wb_dat_i),
			   .wb_dat_o     (wb_dat_o),
			   .wb_we_i      (wb_we_i),
			   .wb_stb_i     (wb_stb_i),
			   .wb_cyc_i     (wb_cyc_i),
			   .wb_ack_o     (wb_ack_o),
			   .wb_inta_o    (wb_inta_o),
			   .scl_pad_i    (scl_pad_i),
			   .scl_pad_o    (scl_pad_o),
			   .scl_padoen_o (scl_padoen_o),
			   .sda_pad_i    (sda_pad_i),
			   .sda_pad_o    (sda_pad_o),
			   .sda_padoen_o (sda_padoen_o),
			   .*);
   
   
   /* reset IIC switch (pull low for one clock) */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 switch_reset <= 1'b0;
	 IIC_RST_out  <= 1'b0;
      end
      else begin
	 IIC_RST_out <= 1'b1;
	 if (~switch_reset)
	   switch_reset <= 1'b1;
      end
   end // always @ (posedge clk, posedge rst)

   /* counter to allow time for IIC core to complete internal tasks */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 count <= 2'b00;
      end
      else begin
	 count <= count + 1;
      end
   end

 /*always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 error_out <= 0;
      end
      //else if (error_incr) begin
	 //error_out <= error_out + 1;
      //end
      else if (curr_state == ERROR) begin
	 //error_out <= wb_dat_o;
	 
	 error_out[5:0] <= adv_reg;
	 error_out[6]   <= (curr_state == ERROR);
	 error_out[7]   <= done;
      end
   end*/

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state <= STB_CYC;
	 wb_adr_i   <= 3'b000;
	 wb_dat_i   <= 8'b00000000;
	 adv_reg    <= 'd0;
      end
      else begin
	 curr_state <= next_state;
	 wb_adr_i   <= next_wb_adr;
	 wb_dat_i   <= next_wb_dat;
	 adv_reg    <= next_adv_reg;
      end
   end

   
   
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state   = curr_state;
      next_wb_adr  = wb_adr_i;
      next_wb_dat  = wb_dat_i;
      next_adv_reg = adv_reg;

      wb_stb_i = 1'b1;
      wb_cyc_i = 1'b1;
      wb_we_i  = 1'b0;
      
      done_out  = 1'b0;
      error_out = 1'b0;

      case (curr_state)
	/* prepare the core with correct clock and parameters */
	STB_CYC: begin
	   wb_stb_i = 1'b0;
	   wb_cyc_i = 1'b0;
	   next_state = CORE;
	end
	CORE: begin
	   wb_we_i = 1'b1;
	   
	   if (wb_adr_i <= 3'b010) begin
	      case (wb_adr_i)
		3'b000: begin // PRER low
		   next_wb_dat = PRER_LO;
		   if (wb_dat_o == PRER_LO) begin
		      next_wb_adr = 3'b001;
		   end
		end
		3'b001: begin // PRER high
		   next_wb_dat = PRER_HI;
		   if (wb_dat_o == PRER_HI) begin
		      next_wb_adr = 3'b010;
		   end
		end
		3'b010: begin // enable core
		   next_wb_dat = CTRL_REG;
		   if (wb_dat_o == CTRL_REG) begin
		      next_state = SWITCH_RESET;
		   end
		end
	      endcase // case (config_count)
	
	   end // if (~core_config && wb_adr_i <= 3'b010)
	end

/***********************************************************
 *      CONFIGURATION OF THE IIC SWITCH ON THE VC707       *
 ***********************************************************/
	
	/* reset the IIC bust switch */
	SWITCH_RESET: begin
	   if (switch_reset && count == 0) begin
	      next_state = SWITCH_INIT_W1;
	      next_wb_adr = 3'b011;
	      next_wb_dat = { SWITCH_ADDR, WRITE };
	   end
	end

	/* write destination address to i2c core */
	SWITCH_INIT_W1: begin
	   wb_we_i = 1'b1;
	   
	   if (count == 0) begin
	      next_state = SWITCH_WAIT_W1;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;  // set START and WR bits
	   end
	end

	/* give commands to i2c core */
	SWITCH_WAIT_W1: begin
	   wb_we_i = 1'b1;
	   
	   if (wb_dat_o[1] && count == 0) begin
	      next_state = SWITCH_TIP_W1;
	   end
	end

	/* wait for tip to negate */
	SWITCH_TIP_W1: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = SWITCH_ACK_W1;
	   end
	end
	
	/* check for ack */
	SWITCH_ACK_W1: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = SWITCH_INIT_W2;
	      next_wb_adr = 3'b011;
	      next_wb_dat = SWITCH_DATA;
	   end
	end

	/* write value to be sent to switch */
	SWITCH_INIT_W2: begin
	   wb_we_i = 1'b1;
	   
	   if (count == 0) begin
	      next_state = SWITCH_WAIT_W2;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h50;  // set STOP and WR bits
	   end
	end

	/* tell i2c core to write data to switch */
	SWITCH_WAIT_W2: begin
	   wb_we_i = 1'b1;
	   
	   if (wb_dat_o[1] && count == 0) begin
	      next_state = SWITCH_TIP_W2;
	   end
	end

	/* wait for top to negate */
	SWITCH_TIP_W2: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = SWITCH_ACK_W2;
	   end
	end

	/* check for ack */
	SWITCH_ACK_W2: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_INIT;
	      next_wb_adr = 3'b011;
	      next_wb_dat = { SWITCH_ADDR, READ };
	   end
	end

	/* write address to read from */
	CHECK_INIT: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = CHECK_WAIT;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;  // set START and WR bits
	   end
	end

	/* wait for transfer to begin */
	CHECK_WAIT: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_TIP;
	   end
	end

	/* wait for transfer to complete */
	CHECK_TIP: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_ACK;
	   end
	end

	/* confirm ACK signal */
	CHECK_ACK: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_READ_1;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h68;
	   end
	end

	/* read from address */
	CHECK_READ_1: begin
	   wb_we_i = 1'b1;

	   /* wait for tip and proceed */
	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_READ_2;
	   end
	end

	CHECK_READ_2: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = SWITCH_VERIFY;
	      next_wb_adr = 3'b011;
	   end
	end

	/* verify write to switch was correct */
	SWITCH_VERIFY: begin
	   if (wb_dat_o == SWITCH_DATA && count == 0) begin
	      next_state = CHECK_HPD_SI_1;
	      next_wb_dat = { HDMI_ADDR, WRITE };
	   end

	   else if (wb_dat_o != SWITCH_DATA && count == 0) begin
	      next_state = ERROR;
	   end
	end

/***********************************************************
 *               WAIT FOR HOT PLUG DETECT                  *
 ***********************************************************/

	CHECK_HPD_SI_1: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = CHECK_HPD_SW_1;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;
	   end
	end
	
	CHECK_HPD_SW_1: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HPD_ST_1;
	   end
	end

	CHECK_HPD_ST_1: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HPD_SA_1;
	   end
	end

	CHECK_HPD_SA_1: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HPD_AI;
	      next_wb_adr = 3'b011;
	      next_wb_dat = HDMI_HPDA;
	   end
	end

	CHECK_HPD_AI: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = CHECK_HPD_AW;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h10;
	   end
	end

	CHECK_HPD_AW: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HPD_AT;
	   end
	end

	CHECK_HPD_AT: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HPD_AA;
	   end
	end

	CHECK_HPD_AA: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HPD_SI_2;
	      next_wb_adr = 3'b011;
	      next_wb_dat = { HDMI_ADDR, READ };
	   end
	end

	CHECK_HPD_SI_2: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = CHECK_HPD_SW_2;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;
	   end
	end
	
	CHECK_HPD_SW_2: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HPD_ST_2;
	   end
	end

	CHECK_HPD_ST_2: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HPD_SA_2;
	   end
	end

	CHECK_HPD_SA_2: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HPD_READ_1;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h68;
	   end
	end

	CHECK_HPD_READ_1: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HPD_READ_2;
	   end
	end

	CHECK_HPD_READ_2: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = HPD_VERIFY;
	      next_wb_adr = 3'b011;
	   end
	end

	HPD_VERIFY: begin
	   /* check if MSB is set - this indicates HPD */
	   if (wb_dat_o[7] && count == 0) begin
	      next_state = SLAVE_INIT;
	      next_wb_dat = { HDMI_ADDR, WRITE };
	   end

	   else if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HPD_SI_1;
	      next_wb_dat = { HDMI_ADDR, WRITE };
	   end
	end
	
/***********************************************************
 *              CONFIGURATION OF THE ADV7511               *
 ***********************************************************/
	
	/* confirm the write is same as read */
	HDMI_VERIFY: begin
	   /* check if data is correct */
	   if (count == 0) begin
	      if (wb_dat_o == DATA[adv_reg]) begin
		 next_wb_dat = { HDMI_ADDR, WRITE };
		 next_state = SLAVE_INIT;
	      end

	      /* incorrect value */
	      else begin
		 if (adv_reg == 22 || adv_reg == 11) begin
		    next_state = SLAVE_INIT;
		    next_wb_dat = { HDMI_ADDR, WRITE };
		 end
		 else begin
		    next_state = ERROR;
		 end
	      end
	   end // if (count == 0)
	end

	SLAVE_INIT: begin
	   /* done writing registers */
	   if (adv_reg == REG_COUNT) begin
	      next_state = IDLE;
	   end
	   
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = SLAVE_WAIT;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;  // set START and WR bits
	      next_adv_reg = adv_reg + 1;
	   end
	end

	SLAVE_WAIT: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = SLAVE_TIP;
	   end
	end

	SLAVE_TIP: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = SLAVE_ACK;
	   end
	end

	SLAVE_ACK: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = ADDR_INIT;
	      next_wb_adr = 3'b011;
	      next_wb_dat = ADDR[adv_reg];
	   end
	end

	ADDR_INIT: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = ADDR_WAIT;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h10;  // set WR bit only
	   end
	end

	ADDR_WAIT: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = ADDR_TIP;
	   end
	end

	ADDR_TIP: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = ADDR_ACK;
	   end
	end

	ADDR_ACK: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = DATA_INIT;
	      next_wb_adr = 3'b011;
	      next_wb_dat = DATA[adv_reg];
	   end
	end

	DATA_INIT: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = DATA_WAIT;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h50;  // set STOP and WR bits 
	   end
	end

	DATA_WAIT: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = DATA_TIP;
	   end
	end

	DATA_TIP: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = DATA_ACK;
	   end
	end

	DATA_ACK: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HDMI_SI_1;
	      next_wb_adr = 3'b011;
	      next_wb_dat = { HDMI_ADDR, WRITE };
	   end
	end

	CHECK_HDMI_SI_1: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = CHECK_HDMI_SW_1;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;
	   end
	end
	
	CHECK_HDMI_SW_1: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HDMI_ST_1;
	   end
	end

	CHECK_HDMI_ST_1: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HDMI_SA_1;
	   end
	end

	CHECK_HDMI_SA_1: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HDMI_AI;
	      next_wb_adr = 3'b011;
	      next_wb_dat = ADDR[adv_reg];
	   end
	end

	CHECK_HDMI_AI: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = CHECK_HDMI_AW;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h10;
	   end
	end

	CHECK_HDMI_AW: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HDMI_AT;
	   end
	end

	CHECK_HDMI_AT: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HDMI_AA;
	   end
	end

	CHECK_HDMI_AA: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HDMI_SI_2;
	      next_wb_adr = 3'b011;
	      next_wb_dat = { HDMI_ADDR, READ };
	   end
	end

	CHECK_HDMI_SI_2: begin
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = CHECK_HDMI_SW_2;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;
	   end
	end
	
	CHECK_HDMI_SW_2: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HDMI_ST_2;
	   end
	end

	CHECK_HDMI_ST_2: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HDMI_SA_2;
	   end
	end

	CHECK_HDMI_SA_2: begin
	   if (~wb_dat_o[7] && count == 0) begin
	      next_state = CHECK_HDMI_READ_1;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h68;
	   end
	end

	CHECK_HDMI_READ_1: begin
	   wb_we_i = 1'b1;

	   if (wb_dat_o[1] && count == 0) begin
	      next_state = CHECK_HDMI_READ_2;
	   end
	end

	CHECK_HDMI_READ_2: begin
	   if (~wb_dat_o[1] && count == 0) begin
	      next_state = HDMI_VERIFY;
	      next_wb_adr = 3'b011;
	   end
	end
	
/***********************************************************
 *                     END CONFIGURATION                   *
 ***********************************************************/ 
	ERROR: begin
	 /*if (skip && count == 0) begin
	      next_state = SLAVE_INIT;
	      next_wb_dat = { HDMI_ADDR, WRITE };
	   end*/
	   error_out = 1'b1;
	end
	
	IDLE: begin
	   done_out = 1'b1;
	end

	default:
	  next_state = curr_state;

      endcase // case (curr_state)

   end // always_comb
 
endmodule // iic_config

