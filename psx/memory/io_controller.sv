
module io_controller(input  logic clk, rst,
                     
                     input logic [31:0]  addr,
                     input logic [31:0]  data_i,
                     input logic         wen, ren,
                     input logic [ 3:0]  ben,
                     output logic        ack,
                     output logic [31:0] data_o,
                     
                     //input logic [31:0]  DMA_PCR,

                     /* GPU signals */
                     //output logic      to_gp0, to_gp1,
                     //output logic [31:0] gp0, gp1,
                     //input logic       gpu_rdy,
                     //input logic       gpu_fifo_full,
                     //input logic [31:0]  gpu_stat, gpu_read,

                     /* MDEC signals */
                     //output logic [31:0] mdec_cmd_param,
                     //output logic [31:0] mdec_ctrl_rst,
                     //input logic [31:0]  mdec_data_response,
                     //input logic [31:0]  mdec_stat,

                     /* CONTROLLER & MEMORY CARD */
                     //input logic [ 7:0]  controller_rx_data,
                     //output logic [ 7:0] controller_tx_data,
                     //input logic       controller_ack,

                     /* TIMER SIGNALS */
                     input logic         hblank, vblank,
                     input logic         dotclock
                     );

   /* PARAMETERS */
                            // 18'h   1    F    8    0  ~
   localparam HW_ADDR_HEADER = 18'b0001_1111_1000_0000_00;

   /* states */
   localparam IDLE  = 5'b00001;
   localparam READ  = 5'b00010;
   localparam LATCH = 5'b00100;
   localparam WRITE = 5'b01000;
   localparam WAIT  = 5'b10000;

   /* Memory Mapped I/O Virtual Addresses */
   localparam MEM_CTRL_1_ADDR = 32'h1F80_1000;
   
   localparam EX1_BASE_ADDR  = 32'h1F80_1000;
   localparam EX2_BASE_ADDR  = 32'h1F80_1004;
   localparam EX1_DELY_SIZE  = 32'h1F80_1008;
   localparam EX3_DELY_SIZE  = 32'h1F80_100C;
   localparam BIOS_DELY_SIZE = 32'h1F80_1010;
   localparam SPU_DELY_SIZE  = 32'h1F80_1014;
   localparam CDRM_DELY_SIZE = 32'h1F80_1018;
   localparam EX2_DELY_SIZE  = 32'h1F80_101C;
   localparam COMMON_DELAY   = 32'h1F80_1020;

   localparam JOY_DATA = 32'h1F80_1040;
   localparam JOY_STAT = 32'h1F80_1044;
   localparam JOY_MODE = 32'h1F80_1048;
   localparam JOY_CTRL = 32'h1F80_104A;
   localparam JOY_BAUD = 32'h1F80_104E;
   localparam SIO_DATA = 32'h1F80_1050;
   localparam SIO_STAT = 32'h1F80_1054;
   localparam SIO_MODE = 32'h1F80_1058;
   localparam SIO_CTRL = 32'h1F80_105A;
   localparam SIO_MISC = 32'h1F80_105C;
   localparam SIO_BAUD = 32'h1F80_105E;

   localparam RAM_SIZE = 32'h1F80_1060;

   localparam I_STAT_ADDR = 32'h1F80_1070;
   localparam I_MASK_ADDR = 32'h1F80_1074;

   localparam DMA0_ADDR = 32'h1F80_1080;
   localparam DMA1_ADDR = 32'h1F80_1090;
   localparam DMA2_ADDR = 32'h1F80_10A0;
   localparam DMA3_ADDR = 32'h1F80_10B0;
   localparam DMA4_ADDR = 32'h1F80_10C0;
   localparam DMA5_ADDR = 32'h1F80_10D0;
   localparam DMA6_ADDR = 32'h1F80_10E0;
   localparam DPCR_ADDR = 32'h1F80_10F0;
   localparam DICR_ADDR = 32'h1F80_10F4;

   localparam TIMER0_ADDR = 32'h1F80_1100;
   localparam TIMER1_ADDR = 32'h1F80_1110;
   localparam TIMER2_ADDR = 32'h1F80_1120;
   

   /* PSX I/O REGISTERS */
   // - Memory Control 1
   reg [31:0] MEM_CTRL_1 [0:8];    // 0x1F801000 - 0x1F801023
   // - Peripheral I/O
   reg [31:0] PERIPHERAL_IO [0:7]; // 0x1F801040 - 0x1F80105F
   // - Memory Control 2
   reg [31:0] MEM_CTRL_2;          // 0x1F801060
   // - Interrupt Control
   reg [31:0] I_STAT;              // 0x1F801070
   reg [31:0] I_MASK;              // 0x1F801074
   // - DMA Registers
   reg [31:0] DMA_MDEC_i_MADR;     // 0x1F801080
   reg [31:0] DMA_MDEC_i_BCR;
   reg [31:0] DMA_MDEC_i_CHCR;
   reg [31:0] DMA_MDEC_o_MADR;     // 0x1F801090
   reg [31:0] DMA_MDEC_o_BCR;
   reg [31:0] DMA_MDEC_o_CHCR;
   reg [31:0] DMA_GPU_MADR;        // 0x1F8010A0
   reg [31:0] DMA_GPU_BCR;
   reg [31:0] DMA_GPU_CHCR;
   reg [31:0] DMA_CDROM_MADR;      // 0x1F8010B0
   reg [31:0] DMA_CDROM_BCR;
   reg [31:0] DMA_CDROM_CHCR;
   reg [31:0] DMA_SPU_MADR;        // 0x1F8010C0
   reg [31:0] DMA_SPU_BCR;
   reg [31:0] DMA_SPU_CHCR;
   reg [31:0] DMA_PIO_MADR;        // 0x1F8010D0
   reg [31:0] DMA_PIO_BCR;
   reg [31:0] DMA_PIO_CHCR;
   reg [31:0] DMA_OTC_MADR;        // 0x1F8010E0
   reg [31:0] DMA_OTC_BCR;
   reg [31:0] DMA_OTC_CHCR;
   reg [31:0] DMA_CTRL;            // 0x1F8010F0
   reg [31:0] DMA_INTERRUPT;       // 0x1F8010F4
   // - Timers
   reg [31:0] DOT_CLK_VALUE;       // 0x1F801100
   reg [31:0] DOT_CLK_CMODE;       //  - Dotclock
   reg [31:0] DOT_CLK_TARGT;
   reg [31:0] HZT_CLK_VALUE;       // 0x1F801110
   reg [31:0] HZT_CLK_CMODE;       //  - Horizontal Retrace
   reg [31:0] HZT_CLK_TARGT;
   reg [31:0] CLK_1_8_VALUE;       // 0x1F801120
   reg [31:0] CLK_1_8_CMODE;       //  - 1/8 System Clock
   reg [31:0] CLK_1_8_TARGT;
   
   /* Internal Lines */
   reg        timer_wen, timer_ren;
   reg        int_wen;
   
   reg [4:0]  curr_state, next_state;
   
   wire [31:0] shift_addr;

   reg [31:0]  data_out;
   reg         ack_out;
   
   assign shift_addr = {HW_ADDR_HEADER, addr[17:0]};

   assign data_o = data_out;
   assign ack_o = ack_out;
   
   /* TIMER CONTROLLER */
   psx_timers timers(.sys_clk      (clk),
                     .rst          (rst),
                     .dotclock     (dotclock),
                     .hblank       (hblank),
                     .vblank       (vblank),
                     .timer_sel    (addr[7:0]),
                     .wen          (timer_wen),
                     .ren          (timer_ren),
                     .data_i       (data_i[15:0]),
                     .ben          (ben[1:0]),
                     .timer0_value (DOT_CLK_VALUE[15:0]),
                     .timer0_cmode (DOT_CLK_CMODE[15:0]),
                     .timer0_targt (DOT_CLK_TARGT[15:0]),
                     .timer1_value (HZT_CLK_VALUE[15:0]),
                     .timer1_cmode (HZT_CLK_CMODE[15:0]),
                     .timer1_targt (HZT_CLK_TARGT[15:0]),
                     .timer2_value (CLK_1_8_VALUE[15:0]),
                     .timer2_cmode (CLK_1_8_CMODE[15:0]),
                     .timer2_targt (CLK_1_8_TARGT[15:0]));

   /* PSX INTERRUPT CONTROLLER */
   psx_interrupts interrupts(.sys_clk    (clk),
                             .rst        (rst),
                             .wen        (int_wen),
                             .ben        (ben[1:0]),
                             .irq_vblank (),
                             .irq_gpu    (),
                             .irq_cdrom  (),
                             .irq_dma    (),
                             .irq_timer0 (DOT_CLK_CMODE[10]),
                             .irq_timer1 (HZT_CLK_CMODE[10]),
                             .irq_timer2 (CLK_1_8_CMODE[10]),
                             .irq_ctlmem (),
                             .irq_sio    (),
                             .irq_spu    (),
                             .irq_ctrl   (),
                             .addr       (addr[2]),
                             .data_i     (data_i[15:0]),
                             .stat_o     (I_STAT),
                             .mask_o     (I_MASK));
   
   
   /* set registers to default values on reset */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         /* Memory Control 1 */          // --(all 4 bytes)--
         MEM_CTRL_1[0] <= 32'h1F00_0000; // Expansion 1 base addr
         MEM_CTRL_1[1] <= 32'h1F80_2000; // Expansion 2 base addr
         MEM_CTRL_1[2] <= 32'h0013_243F; // Expansion 1 delay & size
         MEM_CTRL_1[3] <= 32'h0000_3022; // Expansion 3 delay & size
         MEM_CTRL_1[4] <= 32'h0013_243F; // BIOS ROM delay & size
         MEM_CTRL_1[5] <= 32'h2009_31E1; // SPU delay & size
         MEM_CTRL_1[6] <= 32'h0002_0843; // CDROM delay & size
         MEM_CTRL_1[7] <= 32'h0007_0777; // Expansion 2 delay & size
         MEM_CTRL_1[8] <= 32'h0003_1125; // Common delay
         /* Peripheral I/O */
         PERIPHERAL_IO[0] <= 32'd0; // JOY_DATA(1/4)
         PERIPHERAL_IO[1] <= 32'd0; // JOY_STAT(4)
         PERIPHERAL_IO[2] <= 32'd0; // JOY_MODE(2) & JOY_CTRL(2)
         PERIPHERAL_IO[3] <= 32'd0; // --------(2) & JOY_BAUD(2)
         PERIPHERAL_IO[4] <= 32'd0; // SIO_DATA(1/4)
         PERIPHERAL_IO[5] <= 32'd0; // SIO_STAT(4)
         PERIPHERAL_IO[6] <= 32'd0; // SIO_MODE(2) & SIO_CTRL(2)
         PERIPHERAL_IO[7] <= 32'd0; // SIO_MISC(2) & SIO_BAUD(2)
         /* Memory Control 2 */
         MEM_CTRL_2 <= 32'h0000_0B88; // (4)
         /* DMA Registers */
         DMA_MDEC_i_MADR <= 32'd0;
         DMA_MDEC_i_BCR  <= 32'd0;
         DMA_MDEC_i_CHCR <= 32'd0;
         DMA_MDEC_o_MADR <= 32'd0;
         DMA_MDEC_o_BCR  <= 32'd0;
         DMA_MDEC_o_CHCR <= 32'd0;
         DMA_GPU_MADR    <= 32'd0;
         DMA_GPU_BCR     <= 32'd0;
         DMA_GPU_CHCR    <= 32'd0;
         DMA_CDROM_MADR  <= 32'd0;
         DMA_CDROM_BCR   <= 32'd0;
         DMA_CDROM_CHCR  <= 32'd0;
         DMA_SPU_MADR    <= 32'd0;
         DMA_SPU_BCR     <= 32'd0;
         DMA_SPU_CHCR    <= 32'd0;
         DMA_PIO_MADR    <= 32'd0;
         DMA_PIO_BCR     <= 32'd0;
         DMA_PIO_CHCR    <= 32'd0;
         DMA_OTC_MADR    <= 32'd0;
         DMA_OTC_BCR     <= 32'd0;
         DMA_OTC_CHCR    <= 32'd0;
         DMA_CTRL        <= 32'd0;
         DMA_INTERRUPT   <= 32'd0;
         
      end 
      else begin
         if (curr_state == WRITE) begin
            case (addr)
              // lots of cases

              
            endcase // case (addr)
         end
      end 
   end


   /* Latch output value */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         data_out <= 32'b0;
      end
      else begin
         if (curr_state == LATCH) begin
            case (addr)
              // lots of cases

              /* Memory Control 1 */
              MEM_CTRL_1_ADDR + 8'h00:
                data_out <= MEM_CTRL_1[0];
              MEM_CTRL_1_ADDR + 8'h04:
                data_out <= MEM_CTRL_1[1];
              MEM_CTRL_1_ADDR + 8'h08:
                data_out <= MEM_CTRL_1[2];
              MEM_CTRL_1_ADDR + 8'h0C:
                data_out <= MEM_CTRL_1[3];
              MEM_CTRL_1_ADDR + 8'h10:
                data_out <= MEM_CTRL_1[4];
              MEM_CTRL_1_ADDR + 8'h14:
                data_out <= MEM_CTRL_1[5];
              MEM_CTRL_1_ADDR + 8'h18:
                data_out <= MEM_CTRL_1[6];
              MEM_CTRL_1_ADDR + 8'h1C:
                data_out <= MEM_CTRL_1[7];
              MEM_CTRL_1_ADDR + 8'h20:
                data_out <= MEM_CTRL_1[8];

              /* Timers */
              TIMER0_ADDR + 4'b0:
                data_out <= DOT_CLK_VALUE;
              TIMER0_ADDR + 4'b4:
                data_out <= DOT_CLK_CMODE;
              TIMER0_ADDR + 4'b8:
                data_out <= DOT_CLK_TARGT;
              TIMER1_ADDR + 4'b0:
                data_out <= HZT_CLK_VALUE;
              TIMER1_ADDR + 4'b4:
                data_out <= HZT_CLK_CMODE;
              TIMER1_ADDR + 4'b8:
                data_out <= HZT_CLK_TARGT;
              TIMER2_ADDR + 4'b0:
                data_out <= CLK_1_8_VALUE;
              TIMER2_ADDR + 4'b4:
                data_out <= CLK_1_8_CMODE;
              TIMER2_ADDR + 4'b8:
                data_out <= CLK_1_8_TARGT;

              /* Interrupts */
              I_STAT_ADDR:
                data_out <= I_STAT;
              I_MASK_ADDR:
                data_out <= I_MASK;
              
              
              default:
                data_out <= 32'b0;
              
            endcase // case (addr)
         end
      end
   end
   
   
   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         curr_state <= IDLE;
      end
      else begin
         curr_state <= next_state;
      end
   end

   /* FSM */
   always_comb begin
      /* Defaults */
      next_state = curr_state;

      ack_out = 1'b0;
      timer_wen = 1'b0;
      timer_ren = 1'b0;
      int_wen = 1'b0;
      
      case (curr_state)
        IDLE: begin
           if (ren) begin
              next_state = READ;  
           end
           else if (wen) begin
              next_state = WRITE;
           end
           else begin
              next_state = IDLE;
           end
        end // case: IDLE

        READ: begin
           // branch to special read cases
           next_state = LATCH;
        end
        LATCH: begin
           /* if a timer address -> pull timer_ren high
            * - should be during READ state, but we need a delay */
           if (addr == TIMER0_ADDR + 0 ||
               addr == TIMER0_ADDR + 4 ||
               addr == TIMER0_ADDR + 8 ||
               addr == TIMER1_ADDR + 0 ||
               addr == TIMER1_ADDR + 4 ||
               addr == TIMER1_ADDR + 8 ||
               addr == TIMER2_ADDR + 0 ||
               addr == TIMER2_ADDR + 4 ||
               addr == TIMER2_ADDR + 8  ) begin
              timer_ren = 1'b1;
           end

           ack_out = 1'b1;
           next_state = WAIT;
        end

        WRITE: begin
           // branch to special write cases
           
           /* if interrupt address -> pull int_wen high */
           if (addr == I_STAT_ADDR || addr == I_MASK_ADDR) begin
              int_wen = 1'b1;
           end
           /* if a timer address -> pull timer_wen high */
           else if (addr == TIMER0_ADDR + 0 ||
                    addr == TIMER0_ADDR + 4 ||
                    addr == TIMER0_ADDR + 8 ||
                    addr == TIMER1_ADDR + 0 ||
                    addr == TIMER1_ADDR + 4 ||
                    addr == TIMER1_ADDR + 8 ||
                    addr == TIMER2_ADDR + 0 ||
                    addr == TIMER2_ADDR + 4 ||
                    addr == TIMER2_ADDR + 8  ) begin
              timer_wen = 1'b1;
           end
           
           ack_out = 1'b1;
           next_state = WAIT;
        end

        WAIT: begin
           if (~ren && ~wen) begin
              next_state = IDLE;
           end
           else begin
              next_state = WAIT;
           end
        end
      endcase // case (curr_state)
   end

endmodule // io_controller
