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
			  IDLE,
			  ERROR } iic_fsm_t;



module iic_config(input logic  clk,
		  input logic  rst,
		  inout logic  SDA,
		  inout logic  SCL,
		  output logic IIC_RST,
		  output logic done,
		  output logic [5:0] error);

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
   
   /* register addresses */
   reg [7:0]   ADDR [0:62];

   /* CONFIGURATION REGISTERS */
   assign ADDR[ 0] = 8'h41;     /* 00 - power-up power-down */
   assign ADDR[ 1] = 8'h0B;     /* 01 - SPDIF config */
   assign ADDR[ 2] = 8'h14;     /* 02 - audio sample word length */
   assign ADDR[ 3] = 8'h15;     /* 03 - input video format */
   assign ADDR[ 4] = 8'h16;     /* 04 - color depth, video input edge, RGB */
   assign ADDR[ 5] = 8'h17;     /* 05 - vsync hsync polarity */
   assign ADDR[ 6] = 8'h3C;     /* 06 - VIC to send to Rx */
   assign ADDR[ 7] = 8'h0A;     /* 07 - audio type select */
   assign ADDR[ 8] = 8'h55;     /* 08 - video output format */
   assign ADDR[ 9] = 8'h73;     /* 09 - audio channel count */
   assign ADDR[10] = 8'h9D;     /* 10 - input pixel clock divide */
   assign ADDR[11] = 8'hAF;     /* 11 - HDCP encryption, HDMI mode */
   assign ADDR[12] = 8'hD7;     /* 12 - vsync hsync durations */
   assign ADDR[13] = 8'hD8;     /* 13 - */
   assign ADDR[14] = 8'hD9;     /* 14 - */
   assign ADDR[15] = 8'hDA;     /* 15 - */
   assign ADDR[16] = 8'hDB;     /* 16 - */
   assign ADDR[17] = 8'hF9;     /* 17 - fixed I2C address */

   /* REQUIRED REGISTERS (reserved) */
   assign ADDR[18] = 8'h3B;     /* 18 - */
   assign ADDR[19] = 8'h44;     /* 19 - */
   assign ADDR[20] = 8'h48;     /* 20 - */
   assign ADDR[21] = 8'h94;     /* 21 - */
   assign ADDR[22] = 8'h96;     /* 22 - */
   assign ADDR[23] = 8'h98;     /* 23 - */
   assign ADDR[24] = 8'h99;     /* 24 - */
   assign ADDR[25] = 8'h9A;     /* 25 - */
   assign ADDR[26] = 8'h9B;     /* 26 - */
   assign ADDR[27] = 8'h9C;     /* 27 - */
   assign ADDR[28] = 8'h9F;     /* 28 - */
   assign ADDR[29] = 8'hA1;     /* 29 - */
   assign ADDR[30] = 8'hA2;     /* 30 - */
   assign ADDR[31] = 8'hA3;     /* 31 - */
   assign ADDR[32] = 8'hA4;     /* 32 - */
   assign ADDR[33] = 8'hA5;     /* 33 - */
   assign ADDR[34] = 8'hA6;     /* 34 - */
   assign ADDR[35] = 8'hA7;     /* 35 - */
   assign ADDR[36] = 8'hA8;     /* 36 - */
   assign ADDR[37] = 8'hA9;     /* 37 - */
   assign ADDR[38] = 8'hAA;     /* 38 - */
   assign ADDR[39] = 8'hAB;     /* 39 - */
   assign ADDR[40] = 8'hB9;     /* 40 - */
   assign ADDR[41] = 8'hBA;     /* 41 - */
   assign ADDR[42] = 8'hBB;     /* 42 - */
   assign ADDR[43] = 8'hC7;     /* 43 - */
   assign ADDR[44] = 8'hCD;     /* 44 - */
   assign ADDR[45] = 8'hCE;     /* 45 - */
   assign ADDR[46] = 8'hCF;     /* 46 - */
   assign ADDR[47] = 8'hD0;     /* 47 - */
   assign ADDR[48] = 8'hD1;     /* 48 - */
   assign ADDR[49] = 8'hD2;     /* 49 - */
   assign ADDR[50] = 8'hD3;     /* 50 - */
   assign ADDR[51] = 8'hD4;     /* 51 - */
   assign ADDR[52] = 8'hD5;     /* 52 - */
   assign ADDR[53] = 8'hD6;     /* 53 - */
   assign ADDR[54] = 8'hDC;     /* 54 - */
   assign ADDR[55] = 8'hDD;     /* 55 - */
   assign ADDR[56] = 8'hDE;     /* 56 - */
   assign ADDR[57] = 8'hDF;     /* 57 - */
   assign ADDR[58] = 8'hE0;     /* 58 - */
   assign ADDR[59] = 8'hE2;     /* 59 - */
   assign ADDR[60] = 8'hE3;     /* 60 - */
   assign ADDR[61] = 8'hE4;     /* 61 - */
   assign ADDR[62] = 8'hFA;     /* 62 - */
   
   /* values that have to be written to above registers */
   reg [7:0]   DATA [0:62];
   
   /* CONFIGURATION REGISTERS */
   assign DATA[ 0] = 8'h10;     /* 00 - power on ADV7511 */
   assign DATA[ 1] = 8'hC7;     /* 01 - */
   assign DATA[ 2] = 8'h02;     /* 02 - 16-bit */
   assign DATA[ 3] = 8'h00;     /* 03 - 24-bit RGB 4:4:4 */
   assign DATA[ 4] = 8'h32;     /* 04 - color depth 8-bit, rising edge */
   assign DATA[ 5] = 8'h60;     /* 05 - low polarity */
   assign DATA[ 6] = 8'h02;     /* 06 - */
   assign DATA[ 7] = 8'h10;     /* 07 - SPDIF, MCLK */
   assign DATA[ 8] = 8'h00;     /* 08 - RGB output */
   assign DATA[ 9] = 8'h01;     /* 09 - 2-channel audio */
   assign DATA[10] = 8'h60;     /* 10 - clock not divided */
   assign DATA[11] = 8'h06;     /* 11 - disable encryption, HDMI */
   assign DATA[12] = 8'h04;     /* 12 - hsync front porch = 16 */
   assign DATA[13] = 8'h03;     /* 13 - hsync duration    = 62 */
   assign DATA[14] = 8'hE0;     /* 14 - vsync front porch = 9  */
   assign DATA[15] = 8'h24;     /* 15 - vsync duration    = 6  */
   assign DATA[16] = 8'h06;     /* 16 - */
   assign DATA[17] = 8'h00;     /* 17 - set to come non-conflicting address */
   
   /* REQUIRED REGISTERS (reserved) */
   assign DATA[18] = 8'hE0;     /* 18 - */
   assign DATA[19] = 8'h00;     /* 19 - */
   assign DATA[20] = 8'h00;     /* 20 - */
   assign DATA[21] = 8'hC0;     /* 21 - */
   assign DATA[22] = 8'h00;     /* 22 - */
   assign DATA[23] = 8'h03;     /* 23 - */
   assign DATA[24] = 8'h02;     /* 24 - */
   assign DATA[25] = 8'hE0;     /* 25 - */
   assign DATA[26] = 8'h18;     /* 26 - */
   assign DATA[27] = 8'h30;     /* 27 - */
   assign DATA[28] = 8'h00;     /* 28 - */
   assign DATA[29] = 8'h00;     /* 29 - */
   assign DATA[30] = 8'hA4;     /* 30 - */
   assign DATA[31] = 8'hA4;     /* 31 - */
   assign DATA[32] = 8'h08;     /* 32 - */
   assign DATA[33] = 8'h04;     /* 33 - */
   assign DATA[34] = 8'h00;     /* 34 - */
   assign DATA[35] = 8'h00;     /* 35 - */
   assign DATA[36] = 8'h00;     /* 36 - */
   assign DATA[37] = 8'h00;     /* 37 - */
   assign DATA[38] = 8'h00;     /* 38 - */
   assign DATA[39] = 8'h40;     /* 39 - */
   assign DATA[40] = 8'h00;     /* 40 - */
   assign DATA[41] = 8'h00;     /* 41 - */
   assign DATA[42] = 8'h00;     /* 42 - */
   assign DATA[43] = 8'h00;     /* 43 - */
   assign DATA[44] = 8'h00;     /* 44 - */
   assign DATA[45] = 8'h01;     /* 45 - */
   assign DATA[46] = 8'h04;     /* 46 - */
   assign DATA[47] = 8'h3C;     /* 47 - */
   assign DATA[48] = 8'hFF;     /* 48 - */
   assign DATA[49] = 8'h80;     /* 49 - */
   assign DATA[50] = 8'h80;     /* 50 - */
   assign DATA[51] = 8'h80;     /* 51 - */
   assign DATA[52] = 8'h00;     /* 52 - */
   assign DATA[53] = 8'h00;     /* 53 - */
   assign DATA[54] = 8'h00;     /* 54 - */
   assign DATA[55] = 8'h00;     /* 55 - */
   assign DATA[56] = 8'h10;     /* 56 - */
   assign DATA[57] = 8'h01;     /* 57 - */
   assign DATA[58] = 8'h3C;     /* 58 - */
   assign DATA[59] = 8'h00;     /* 59 - */
   assign DATA[60] = 8'h00;     /* 60 - */
   assign DATA[61] = 8'h60;     /* 61 - */
   assign DATA[62] = 8'h00;     /* 62 - */
 
   
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
   reg [5:0]   reg_count;
   reg 	       reg_incr;
   reg [5:0]   error_out;
   reg 	       error_incr;
   
   /* state variables */
   iic_fsm_t   curr_state, next_state;

   
   /* outputs */
   assign IIC_RST = IIC_RST_out;
   assign done    = done_out;
   assign error   = error_out;   
   
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
			   .wb_tip_o     (tip_o),
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

   /* move to the next register if ready */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 reg_count <= 5'd0;
      end
      else if (reg_incr) begin
	 reg_count <= reg_count + 1;
      end
   end

   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 error_out <= 0;
      end
      else if (error_incr) begin
	 error_out <= error_out + 1;
      end
   end

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
	 curr_state <= STB_CYC;
	 wb_adr_i   <= 3'b000;
	 wb_dat_i   <= 8'b00000000;
      end
      else begin
	 curr_state <= next_state;
	 wb_adr_i   <= next_wb_adr;
	 wb_dat_i   <= next_wb_dat;
      end
   end

   
   
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state  = curr_state;
      next_wb_adr = wb_adr_i;
      next_wb_dat = wb_dat_i;

      wb_stb_i = 1'b1;
      wb_cyc_i = 1'b1;
      wb_we_i  = 1'b0;

      reg_incr = 1'b0;
      
      error_incr = 1'b0;
      done_out  = 1'b0;

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

	   else if (count == 0) begin
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
	   if (wb_dat_o == DATA[reg_count] && count == 0) begin
	      next_state = SLAVE_INIT;
	      next_wb_dat = { HDMI_ADDR, WRITE };
	      reg_incr = 1'b1;
	   end
	   
	   /* did not read correct data */
	   else if (wb_dat_o != DATA[reg_count] && count == 0) begin
	      //next_state = ERROR;
	      next_state = SLAVE_INIT;
	      next_wb_dat = { HDMI_ADDR, WRITE };
	      reg_incr = 1'b1;
	      error_incr = 1'b1;
	   end
	end

	SLAVE_INIT: begin
	   /* done writing registers */
	   if (reg_count == 63) begin
	      next_state = IDLE;
	   end
	   
	   wb_we_i = 1'b1;

	   if (count == 0) begin
	      next_state = SLAVE_WAIT;
	      next_wb_adr = 3'b100;
	      next_wb_dat = 8'h90;  // set START and WR bits
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
	      next_wb_dat = ADDR[reg_count];
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
	      next_wb_dat = DATA[reg_count];
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
	      next_wb_dat = ADDR[reg_count];
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

	IDLE: begin
	   done_out = 1'b1;
	end

	ERROR: begin
	   // do nothing
	end

	default:
	  next_state = curr_state;

      endcase // case (curr_state)

   end // always_comb
 
endmodule // iic_config

