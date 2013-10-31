



module mem_controller
  (input logic  clk, rst,

   /* Main Memory to CPU */
   input  logic [9:0]  MAINMEM_CPU_ADDR,
   input  logic [31:0] MAINMEM_CPU_DATA_I,
   output logic [31:0] MAINMEM_CPU_DATA_O, 
   /* Main Memory to GPU */
   input  logic [9:0]  MAINMEM_GPU_ADDR, 
   input  logic [31:0] MAINMEM_GPU_DATA_I,
   output logic [31:0] MAINMEM_GPU_DATA_O,
   /* VRAM to GPU */
   input  logic [9:0]  VRAM_GPU_ADDR,
   input  logic [31:0] VRAM_GPU_DATA_I,
   output logic [31:0] VRAM_GPU_DATA_O,

   /* DDR3 interface */
   
   );
   
