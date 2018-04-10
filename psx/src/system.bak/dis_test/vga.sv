module vga
  (input  logic CLOCK_50, reset,
   output logic HS, VS, v_blank, h_blank, col_porch,
   output logic [9:0] row,
   output logic [9:0] col);

   logic [10:0] col_count;
   logic        col_clear, col_enable;
   logic [9:0] row_count;
   logic       row_clear, row_enable;
   
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
  assign col_porch = (col_count >= 11'd1595);
  assign col_enable = 1'b1;
  assign HS = (col_count < 11'd1312) | (col_count > 11'd1503);
  assign h_blank = col_count > 11'd1279;
   
endmodule : vga
