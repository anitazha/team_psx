module vga
  (input  logic CLOCK_50, reset,
   output logic HS, VS, blank,
   output logic [9:0] row,
   output logic [9:0] col);

   logic [10:0] col_count;
   logic        col_clear, col_enable;
   logic [9:0] row_count;
   logic       row_clear, row_enable;
   logic       h_blank, v_blank;
   
  // Row counter counts from 0 to 520   
  //     count of   0 - 479 is display time (and thus row_count is correct here)
  //     count of 480 - 489 is front porch
  //     count of 490 - 491 is VS=0 pulse width
  //     count of 492 - 520 is back porch

  simple_counter #(10) row_counter(.clk(CLOCK_50), .en(row_enable), 
                                   .clr(row_clear), .Q(row_count), 
                                   .reset(reset));
  assign row = row_count;
  assign row_clear = (row_count >= 10'd520);
  assign row_enable = (col_count == 11'd1599);
  assign VS = (row_count < 10'd490) | (row_count > 10'd491);
  assign v_blank = (row_count >= 10'd480);

  // Col counter counts from 0 to 1599
  //     count of    0 - 1279 is display time (col is div by 2)
  //     count of 1280 - 1311 is front porch
  //     count of 1312 - 1503 is HS=0 pulse width
  //     count of 1504 - 1599 is back porch
  
  simple_counter #(11) col_counter(.clk(CLOCK_50), .en(col_enable), 
                                   .clr(col_clear), .Q(col_count), 
                                   .reset(reset));
  assign col = col_count[10:1];
  assign col_clear = (col_count >= 11'd1599);
  assign col_enable = 1'b1;
  assign HS = (col_count < 11'd1312) | (col_count > 11'd1503);
  assign h_blank = col_count > 11'd1279;

  assign blank = h_blank | v_blank;
   
endmodule : vga

module test_pattern
  (input  logic [9:0] row,
   input  logic [9:0] col,
   output logic [7:0] red, green, blue);
   
   logic [7:0] tp_column;
   offset_check #(10) oc_0(.val(col), .low(  10'd0), .delta(10'd80), 
                           .is_between(tp_column[0]));
   offset_check #(10) oc_1(.val(col), .low( 10'd80), .delta(10'd80), 
                           .is_between(tp_column[1]));
   offset_check #(10) oc_2(.val(col), .low(10'd160), .delta(10'd80), 
                           .is_between(tp_column[2]));
   offset_check #(10) oc_3(.val(col), .low(10'd240), .delta(10'd80), 
                           .is_between(tp_column[3]));
   offset_check #(10) oc_4(.val(col), .low(10'd320), .delta(10'd80), 
0                           .is_between(tp_column[4]));
   offset_check #(10) oc_5(.val(col), .low(10'd400), .delta(10'd80), 
                           .is_between(tp_column[5]));
   offset_check #(10) oc_6(.val(col), .low(10'd480), .delta(10'd80), 
                           .is_between(tp_column[6]));
   offset_check #(10) oc_7(.val(col), .low(10'd560), .delta(10'd80), 
                           .is_between(tp_column[7]));
   
   logic [2:0] colors;
   priority_encoder pe(.Y(colors), .A(tp_column));

   assign red[7:0]   = {colors[2], colors[2], colors[2], colors[2], 
                        colors[2], colors[2], colors[2], colors[2]};
   assign green[7:0] = {colors[1], colors[1], colors[1], colors[1], 
                        colors[1], colors[1], colors[1], colors[1]}; 
   assign blue[7:0]  = {colors[0], colors[0], colors[0], colors[0], 
                        colors[0], colors[0], colors[0], colors[0]}; 
   
endmodule : test_pattern

module ChipInterface
  (input  logic CLOCK_50,
   input  logic  [3:0] KEY,
   input  logic [17:0] SW,
   output logic  [7:0] LEDG,
   output logic  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
   output logic  [7:0] VGA_R, VGA_G, VGA_B,
   output logic        VGA_BLANK_N, VGA_CLK, VGA_SYNC_N,
   output logic        VGA_VS, VGA_HS);
  
  logic reset;
  assign reset = ~KEY[0]; 

  logic blank;
  assign VGA_BLANK_N = ~blank;

  logic [3:0] BCD7, BCD6, BCD5, BCD4, BCD3, BCD2, BCD1, BCD0;
  assign BCD7 = 4'd0;
  assign {BCD5, BCD4, BCD3, BCD2} = 16'd0; 
  assign BCD1 = 4'd0;
  SevenSegmentControl ssc(.turn_on(8'b11_0000_11), .*);

  logic [9:0] row;
  logic [9:0] col;
  vga v(.reset(reset), .HS(VGA_HS), .VS(VGA_VS), .*);

  logic [7:0] tp_red, tp_green, tp_blue;
  logic [7:0] pong_red, pong_green, pong_blue;
  mux2to1 mr(.I0(tp_red),   .I1(pong_red),   .Sel(SW[8]), .Y(VGA_R));
  mux2to1 mg(.I0(tp_green), .I1(pong_green), .Sel(SW[8]), .Y(VGA_G));
  mux2to1 mb(.I0(tp_blue),  .I1(pong_blue),  .Sel(SW[8]), .Y(VGA_B));

  test_pattern tp(.red(tp_red), .green(tp_green), .blue(tp_blue), .*);
  pong pong(.red(pong_red), .green(pong_green), .blue(pong_blue), 
            .paddle_l_u(SW[17]), .paddle_l_d(SW[16]), 
            .paddle_r_u(SW[ 1]), .paddle_r_d(SW[ 0]), .serve(~KEY[3]),
            .score_l(BCD6), .score_r(BCD0), 
            .debug(LEDG), .*);
  
  assign VGA_SYNC_N = 1'b0;
  assign VGA_CLK = ~CLOCK_50;

  
  
endmodule : ChipInterface

module Tester();
  logic CLOCK_50;
  logic [3:0] KEY;
  logic [17:0] SW;
  logic [7:0] LEDG;
  logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
  logic [7:0] VGA_R, VGA_G, VGA_B;
  logic       VGA_BLANK_N, VGA_CLK, VGA_SYNC_N;
  logic       VGA_VS, VGA_HS;
  
  ChipInterface dut(.*);
  
  initial begin
    CLOCK_50 = 0;
    KEY[0] = 1;
    #1 KEY[0] = 0;
    forever #10 CLOCK_50 = ~CLOCK_50; // #1 is one nS
  end
  
  initial begin
    #40000000 $finish;
  end
  
endmodule : Tester
  
