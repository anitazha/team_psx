

typedef struct packed {
   logic       interlaced_parity;
   logic [1:0] DMA_direction;
   logic       DMA_rdy;
   logic       VRAM2CPU_rdy;
   logic       CMD_rdy;
   logic       DMA_fifo_state;
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
