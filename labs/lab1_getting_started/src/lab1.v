/* 18-545
 * Fall 2013
 * Team PSX
 * 
 * Lab 1 Top Module
 * Takes an input on the dip switches and, when a button is pressed,
 * Adds it to the previous value (16 bit)
 * 
 * CHANGELOG
 * 9-8-2013   Created
 */

typedef enum reg [4:0] {WAITINIT, CLR, WAITCLR, SENDTK, WAITTK, SENDOK, WAITOK, 
                        SENDHU, WAITHU, SENDTE, WAITTE, SENDON, WAITON,
                        SENDSP, WAITSP, WAITUP, WAITBTN} lcd_fsm_t; 

module lab1(
            input wire         SYSCLK_P, SYSCLK_N,
			input wire         GPIO_SW_S,
			input wire         GPIO_DIP_SW0, GPIO_DIP_SW1, GPIO_DIP_SW2, GPIO_DIP_SW3,
			input wire         GPIO_DIP_SW4, GPIO_DIP_SW5, GPIO_DIP_SW6, GPIO_DIP_SW7,
			input wire         GPIO_SW_C, GPIO_SW_N,			
			output wire        LCD_FPGA_RS, LCD_FPGA_RW, LCD_FPGA_E,
                               LCD_FPGA_DB7, LCD_FPGA_DB6, LCD_FPGA_DB5, LCD_FPGA_DB4,
            output wire        GPIO_LED_0_LS, GPIO_LED_1_LS, GPIO_LED_2_LS, GPIO_LED_3_LS,
                               GPIO_LED_4_LS, GPIO_LED_5_LS, GPIO_LED_6_LS, GPIO_LED_7_LS);

   /* Internal Lines */
   wire [2:0]   control_out;
   wire [3:0]   sf_d;
   wire         clk;
   reg [15:0]   sum;
   reg 			pressed;
   reg [3:0] 	tk, ok, hu, te, on;
   lcd_fsm_t    lcd_state, next_lcd_state;
   reg [7:0] 	lcd_space_count, next_lcd_space_count;
   reg [7:0] 	dt_in, val;
   reg 			wr_start, clr;
   reg [7:0]    led;
   wire 		init_done, wr_done;
   wire rstLCD;
   
   IBUFDS #(.DIFF_TERM("TRUE"),
               .IBUF_LOW_PWR("TRUE"),
               .IOSTANDARD("DEFAULT"))     
                        
   clk_ibufds (.O(sysclk),
               .I(SYSCLK_P),
               .IB(SYSCLK_N));
   
   clock_divider clkdiv (.out(clk), .clk(sysclk), .rst(rst));
   
   /* LCD module */
   lcd_control lcd(.rst(rstLCD),
				   .clk(clk),
				   .control(control_out),
				   .sf_d(sf_d),
				   .initDone(init_done),
				   .writeStart(wr_start),
				   .writeDone(wr_done),
				   .dataIn(dt_in),
				   .clearAll(clr));
				   			   
   assign rstLCD = GPIO_SW_N;
   assign do_it = GPIO_SW_S;
   assign val[0] = GPIO_DIP_SW0;
   assign val[1] = GPIO_DIP_SW1;
   assign val[2] = GPIO_DIP_SW2;
   assign val[3] = GPIO_DIP_SW3;
   assign val[4] = GPIO_DIP_SW4;
   assign val[5] = GPIO_DIP_SW5;
   assign val[6] = GPIO_DIP_SW6;
   assign val[7] = GPIO_DIP_SW7;
   
   assign led[0] = GPIO_DIP_SW0;
   assign led[1] = GPIO_DIP_SW1;
   assign led[2] = GPIO_DIP_SW2;
   assign led[3] = GPIO_DIP_SW3;
   assign led[4] = GPIO_DIP_SW4;
   assign led[5] = GPIO_DIP_SW5;
   assign led[6] = GPIO_DIP_SW6;
   assign led[7] = GPIO_DIP_SW7;
   
   assign rst = GPIO_SW_C;
   
   assign LCD_FPGA_DB7 = sf_d[3];
   assign LCD_FPGA_DB6 = sf_d[2];
   assign LCD_FPGA_DB5 = sf_d[1];
   assign LCD_FPGA_DB4 = sf_d[0];
                   
   assign LCD_FPGA_RS = control_out[2];
   assign LCD_FPGA_RW = control_out[1];
   assign LCD_FPGA_E  = control_out[0];
   
   assign GPIO_LED_0_LS = led[0];
   assign GPIO_LED_1_LS = led[1];
   assign GPIO_LED_2_LS = led[2];
   assign GPIO_LED_3_LS = led[3];
   assign GPIO_LED_4_LS = led[4];
   assign GPIO_LED_5_LS = led[5];
   assign GPIO_LED_6_LS = led[6];
   assign GPIO_LED_7_LS = led[7];
   
   /* Sum storaging reg */
   always @(posedge clk or posedge rst)
	 begin
		if (rst) begin
		   sum <= 16'd12345;
		   pressed <= 1'b0;
		end
		else if (do_it & ~pressed) begin
		   pressed <= 1'b1;
		   sum <= sum + {{8{1'b0}}, val};
		end
		else if (~do_it & pressed) begin
		   pressed <= 1'b0;
		end
	 end // always @ (posedge clk or posedge rst)

   /* Convert sum to 5 BCD values */
   assign tk = sum / 'd10000;
   assign ok = (sum / 'd1000) % 'd10;
   assign hu = (sum / 'd100) % 'd10;
   assign te = (sum / 'd10) % 'd10;
   assign on = sum % 'd10;

   /* LCD FSM */
   always_comb
	 begin
		   wr_start = 1'b0;
		   clr = 1'b0;
		   dt_in = 8'h5F;
		   next_lcd_state = lcd_state;
		   next_lcd_space_count = lcd_space_count;
		   
		   /* Next state + Output logic */
		   case (lcd_state)
		      WAITINIT: begin		        
				if (init_done) begin
				   next_lcd_state = CLR;
				end
			 end
			 CLR: begin
				next_lcd_state = WAITCLR;
				clr = 1'b1;
			 end
			 WAITCLR: begin
			     if (init_done) begin
			         next_lcd_state = SENDTK;
			     end
			 end
			 SENDTK: begin
				next_lcd_state = WAITTK;
				dt_in = {4'h3, tk};
				wr_start = 1'b1;
			 end
			 WAITTK: begin
			    dt_in = {4'h3, tk};
				if (wr_done) begin
				   next_lcd_state = SENDOK;
				end
			 end
			 SENDOK: begin
				next_lcd_state = WAITOK;
				dt_in = {4'h3, ok};
				wr_start = 1'b1;
			 end
			 WAITOK: begin
			 	dt_in = {4'h3, ok};
				if (wr_done) begin
				   next_lcd_state = SENDHU;
				end
			 end
			 SENDHU: begin
				next_lcd_state = WAITHU;
				dt_in = {4'h3, hu};
				wr_start = 1'b1;
			 end
			 WAITHU: begin
			 	dt_in = {4'h3, hu};
				if (wr_done) begin
				   next_lcd_state = SENDTE;
				end
			 end
			 SENDTE: begin
				next_lcd_state = WAITTE;
				dt_in = {4'h3, te};
				wr_start = 1'b1;
			 end
			 WAITTE: begin
			 	dt_in = {4'h3, te};
				if (wr_done) begin
				   next_lcd_state = SENDON;
				end
			 end
			 SENDON: begin
				next_lcd_state = WAITON;
				dt_in = {4'h3, on};
				wr_start = 1'b1;
			 end
			 WAITON: begin
			 	dt_in = {4'h3, on};
				if (wr_done) begin
				   next_lcd_state = SENDSP;
				end
			 end
			 SENDSP: begin
				next_lcd_state = WAITSP;
				wr_start = 1'b1;
				next_lcd_space_count = lcd_space_count + 5'd1;
			 end
			 WAITSP: begin			    
				if (wr_done) begin				   
				   if (lcd_space_count == 8'd51) begin
					  next_lcd_state = WAITUP;					  					  
					  next_lcd_space_count = 8'd0;
				   end
				   else begin
					  next_lcd_state = SENDSP;
				   end
				end
			 end
			 WAITUP: begin
			     if (~do_it) begin
			         next_lcd_state = WAITBTN;
			     end
			 end
			 WAITBTN: begin		     
			     if (do_it) begin			         
			         next_lcd_state = CLR;
			     end
			 end
		endcase
	end
		
	/* State + Counter reg */
	always @(posedge clk or posedge rst)
	   begin
	       if (rst) begin
	           lcd_state <= WAITINIT;
	           lcd_space_count <= 5'd0;
	       end
	       else begin
	           lcd_state <= next_lcd_state;
	           lcd_space_count <= next_lcd_space_count;
	       end
	   end
	           	 
endmodule // lab1

module clock_divider(
    out,
    clk, rst);
    
    input wire clk;
    input wire rst;
    output reg out;
    
    reg [1:0] count;        
        
    always @(posedge clk)
        if (rst) begin
            count <= 0;
            out <= 0;
        end
        else begin
            count <= count + 1;
            if (count == 2'd2) begin
                count <= 1;
                out <= ~out;
            end
        end
        
endmodule		