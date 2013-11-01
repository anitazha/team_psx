module comparator
 #(parameter   WIDTH = 8)
  (output logic             AltB, AeqB, AgtB,
   input  logic [WIDTH-1:0] A, B);

  assign AeqB = (A == B);
  assign AltB = (A <  B);
  assign AgtB = (A >  B);

endmodule: comparator

module adder
 #(parameter WIDTH=8)
  (input  logic [WIDTH-1:0] A, B,
   input  logic             Cin,
   output logic [WIDTH-1:0] Sum,
   output logic             Cout);
   
   assign {Cout, Sum} = A + B + Cin;
   
endmodule : adder

module mux
 #(parameter WIDTH=8)
  (input  logic [WIDTH-1:0]         I,
   input  logic [$clog2(WIDTH)-1:0] Sel,
   output logic                     Y);
   
   assign Y = I[Sel];
   
endmodule : mux

module mux2to1
 #(parameter WIDTH = 8)
  (input  logic [WIDTH-1:0] I0, I1,
   input  logic             Sel,
   output logic [WIDTH-1:0] Y);
   
  assign Y = (Sel) ? I1 : I0;
  
endmodule : mux2to1

module decoder
 #(parameter WIDTH=8)
  (input  logic [$clog2(WIDTH)-1:0] I,
   input  logic                     en,
   output logic [WIDTH-1:0]         D);
   
  always_comb begin
    D = 0;
    if (en)
      D = 1'b1 << I;
  end
  
endmodule : decoder

module priority_encoder
  (output logic [2:0] Y,
//   output logic       valid,
    input logic [7:0] A);

  always_comb begin
//    valid = 1;
    casex (A)
      8'b1???_???? : Y=3'b111;
      8'b01??_???? : Y=3'b110;
      8'b001?_???? : Y=3'b101;
      8'b0001_???? : Y=3'b100;
      8'b0000_1??? : Y=3'b011;
      8'b0000_01?? : Y=3'b010;
      8'b0000_001? : Y=3'b001;
      8'b0000_0001 : Y=3'b000;
      8'b0000_0000 : begin
                       Y=3'bxxx;
 //                      valid = 0;
                     end
    endcase
  end
      
endmodule : priority_encoder

module register
 #(parameter WIDTH=8)
  (input  logic [WIDTH-1:0] D,
   input  logic             en, clr, clk,
   output logic [WIDTH-1:0] Q);
   
  always_ff @(posedge clk)
    if (clr)
      Q <= 0;
    else if (en)
      Q <= D;
      
endmodule : register

module counter
 #(parameter WIDTH = 8)
  (input  logic [WIDTH-1:0] D,
   input  logic             clk, up, en, clr, load, reset,
   output logic [WIDTH-1:0] Q);

  always_ff @(posedge clk, posedge reset)
    if (reset)
      Q <= 0;
    else if (clr)
      Q <= 0;
    else if (load)
      Q <= D;
    else if (en)
      Q <= (up) ? Q + 1'b1 : Q - 1'b1;

endmodule : counter

module count_by_2
 #(parameter WIDTH = 8)
  (input  logic [WIDTH-1:0] D,
   input  logic             clk, up, en, clr, load, reset,
   output logic [WIDTH-1:0] Q);

  always_ff @(posedge clk, posedge reset)
    if (reset)
      Q <= 0;
    else if (clr)
      Q <= 0;
    else if (load)
      Q <= D;
    else if (en)
      Q <= (up) ? Q + 2'd2 : Q - 2'd2;

endmodule : count_by_2
 

module simple_counter
 #(parameter WIDTH = 8)
  (input  logic             clk, en, clr, reset,
   output logic [WIDTH-1:0] Q);

  always_ff @(posedge clk, posedge reset)
    if (reset)
      Q <= 0;
    else if (clr)
      Q <= 0;
    else if (en)
      Q <= Q + 1'b1;

endmodule : simple_counter

module shift_register
 #(parameter WIDTH = 8)
  (input  logic             s_in, en, left, clk,
   output logic [WIDTH-1:0] Q);

  always_ff @(posedge clk)
    if (en)
      Q <= (left) ? {Q[WIDTH-2:0], s_in} : {s_in, Q[WIDTH-1:1]};

endmodule : shift_register

module range_check
 #(parameter WIDTH=10)
  (input  logic [WIDTH-1:0] val, low, high,
   output logic             is_between);

  assign is_between = (val >= low) & (val <= high);

endmodule : range_check

module offset_check
 #(parameter WIDTH=10)
  (input  logic [WIDTH-1:0] val, low, delta,
   output logic             is_between);

  assign is_between = (val >= low) & (val < low+delta);

endmodule : offset_check

module game_clock_generator
  (input  logic CLOCK_50M, reset,
   output logic game_clock);
   
  // game_clock is to be a 50% duty cycle, 11.92Hz signal (i.e. period of 83892617 nS)
  // Input is 50MHz (i.e. period of 20nS)
  // Output is 4194630 times slower (close, so close to 2^22)
  
  logic [21:0] count;
  
  always_ff @(posedge CLOCK_50M, posedge reset)
    if (reset)
      count <= 23'b0;
    else
      count <= count + 1;
    
  assign game_clock = count[21];
   
endmodule : game_clock_generator
