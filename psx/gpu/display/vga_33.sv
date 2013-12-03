module vga
  (input  logic clk_33MHz, rst,
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
