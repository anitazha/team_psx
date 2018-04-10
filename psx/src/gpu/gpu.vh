
/* Defines the number of pixels a single pipeline stage processes at once */
`define GPU_PIPELINE_WIDTH 1

/* Typedefs for internal CMD register things */
typedef enum logic [1:0] {TRI, RECT, LINE} shape_t;
typedef enum logic {SEMI, OPAQ} trans_t;
typedef enum logic {SHADE, NONE} shade_t;
typedef enum logic {TEXT, MONO} text_t;
typedef enum logic {BLEND, RAW} text_mode_t;
typedef enum logic {VRM, GPUREAD} mem_dest_t;
typedef enum logic [1:0] {FIFO, VRAM, CLR} mem_src_t;

/* CMD struct */
typedef struct packed {
   logic [11:0]                     x0, x1, x2;
   logic [11:0] 		    y0, y1, y2;
   logic [7:0] 			    r0, g0, b0;
   logic [7:0] 			    r1, g1, b1;
   logic [7:0] 			    r2, g2, b2;
   logic [7:0] 			    u0, u1, u2; // Texture page coords
   logic [7:0] 			    v0, v1, v2; //    "     "     "
   logic [9:0] 			    clut_x;
   logic [8:0] 			    clut_y;
   logic [3:0] 			    text_x;
   logic 			    text_y;
   logic [1:0] 			    semi_trans_mode;
   logic [1:0] 			    text_mode;
   logic 			    text_en;
   shape_t                          shape;
   trans_t                          transparency;
   shade_t                          shade;
   text_t                           texture;
   text_mode_t                      texture_mode;
   mem_dest_t                       mem_dest;
   mem_src_t                        mem_src;
} CMD_t;
   
/* Decode stage FSM states */
typedef enum logic [5:0] {WAIT, GET_XY0, GET_XY1, GET_XY2, 
                          GET_TX0, GET_TX1, GET_TX2, GET_CL1,
                          GET_CL2, GET_CLUT, WAIT_MEM, 
			  DRAWING, GO_MEM, GO_CLUT} DECODE_t;

/* XY generator FSM states */
typedef enum logic [1:0] {SIT_AROUND, CHURN_BUTTER, COMPLETE} XYGEN_t;

/* CLUT getting FSM states */
typedef enum logic [1:0] {WAIT_CLUT, GETMEM_CLUT} CLUT_t;

/* Fill FSM states */
typedef enum logic [1:0] {WAIT_FILL, TOMEM_FILL} FILL_t;

/* V2V FSM states */
typedef enum logic [2:0] {WAIT_V2V, GETMEM1_V2V, GETMEM2_V2V, TOMEM_V2V} V2V_t;

/* V2C FSM states */
typedef enum logic [1:0] {WAIT_V2C, GETMEM1_V2C, GETMEM2_V2C} V2C_t;

/* C2V FSM states */
typedef enum logic [1:0] {WAIT_C2V, GETMEM_C2V, TOMEM_C2V} C2V_t;

/* WB FSM states */
typedef enum logic [2:0] {WAIT_WB, GETMEM_WB, GETTX_WB, HOLDTX_WB, TOMEM_WB} WB_t;

/* GPU Status register struct */
typedef struct packed {
   logic       interlaced_parity;
   logic [1:0] dma_direction;
   logic       dma_rdy;
   logic       VRAM2CPU_rdy;
   logic       cmd_rdy;
   logic       dma_fifo_state;
   logic       irq;
   logic       display_en;
   logic       interlaced;
   logic       depth;
   logic       video_mode;
   logic       vertical_res;
   logic [1:0] horizontal_res_1;
   logic       horizontal_res_2;
   logic       text_en;
   logic       reverse;
   logic       reserved;
   logic       mask_en;
   logic       set_mask;
   logic       draw_to_display;
   logic       dither_mode;
   logic [1:0] text_mode;
   logic [1:0] semi_trans_mode;
   logic       text_y;
   logic [3:0] text_x;
} GPU_status_t;

/* Draw Stage barrier regs */
typedef struct packed {
   logic                                   valid;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   x;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   y;
} drawing_stage_t;

/* Color Stage barrier regs */
typedef struct packed {
   logic                                   valid;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   x;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   y;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	   in_shape;
} color_stage_t;

/* Color Stage barrier regs */
typedef struct packed {
   logic       valid;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0] x;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0] y;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	 in_shape;
   logic [`GPU_PIPELINE_WIDTH-1:0][7:0]  m_u, m_v;
} color_sub_stage_t;

/* Shade Stage barrier regs */
typedef struct packed {
   logic                                   valid;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   x;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   y;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	   in_shape;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	   transparency;
   logic [`GPU_PIPELINE_WIDTH-1:0][7:0]    r, g, b;
} shader_stage_t;

/* Shade Sub Stage barrier regs */
typedef struct packed {
   logic                                 valid;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0] x;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0] y;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	 in_shape;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	 transparency;
   logic [`GPU_PIPELINE_WIDTH-1:0][31:0] int_r, int_g, int_b;
   logic [`GPU_PIPELINE_WIDTH-1:0][7:0]  r, g, b;
} shader_sub_stage_t;

/* Writeback Stage barrier regs */
typedef struct packed {
   logic                                   valid;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   x;
   logic [`GPU_PIPELINE_WIDTH-1:0][11:0]   y;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	   in_shape;
   logic [`GPU_PIPELINE_WIDTH-1:0] 	   transparency;
   logic [`GPU_PIPELINE_WIDTH-1:0][7:0]    r, g, b;
} wb_stage_t;
