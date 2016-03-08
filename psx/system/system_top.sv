module system_top(
    /* MISC SIGNALS */
    input  logic        CLOCK_50,
    input  logic [3:0]  KEY,
    input logic  [17:0] SW,
    output logic [17:0] LEDR,
	 inout logic   [35:0] GPIO,

    /* SDRAM CHIP INTERFACE */
    output logic [12:0] DRAM_ADDR,
    output logic [1:0]  DRAM_BA,
    output logic        DRAM_CAS_N, DRAM_RAS_N, DRAM_CLK,
    output logic        DRAM_CKE, DRAM_CS_N, DRAM_WE_N,
    output logic [3:0]  DRAM_DQM,
    inout  wire  [31:0] DRAM_DQ,

    /* SRAM CHIP INTERFACE */
    inout wire   [15:0] SRAM_DQ,
    output logic        SRAM_CE_N, SRAM_OE_N, SRAM_WE_N,
    output logic        SRAM_LB_N, SRAM_UB_N,
    output logic [19:0] SRAM_ADDR,

    /* VGA CHIP INTERFACE */
    output logic        VGA_HS, VGA_VS,
    output logic        VGA_BLANK_N, VGA_SYNC_N, VGA_CLK,
    output logic [7:0]  VGA_R, VGA_G, VGA_B
    );

    // processor signals
    wire        clk, inst_excpt, mem_excpt, halted, rst;
    wire [29:0] pc, mem_addr;
    wire [31:0] inst, mem_data_in, mem_data_out;
    wire [3:0]  mem_write_en;
    reg  [10:0] psx_int;
    wire        inst_read, mem_data_read;
    reg         inst_ready, mem_data_ready;

    // DRAM signals
    wire [31:0] dram_dq_out;
    wire [31:0] dram_dq_in;
    wire        dram_oe_out;

    /* GPU lines */
    logic [9:0]       dis_w, dis_h, dis_x, dis_y;
    logic             clk_33MHz, clk_50MHz, clk_100MHz;
    logic             locked, c0, c1;
    
    logic             VGA_re;
	 logic VGA_we;
   logic [18:0] VGA_addr;
   
    logic [9:0]      VGA_x;
	 logic [8:0] VGA_y;
    logic [23:0]      VGA_data;
    logic             GPU_re, GPU_we;
    logic [18:0]      GPU_addr;
    wire  [15:0]      GPU_data_in, GPU_data_out;
    wire  [15:0]      sram_dq_out, sram_dq_in;
    logic [15:0]      GPU_data_v;
    logic             color_mode;
    logic             v_blk, h_blk;
    logic             GPU_en;
    logic             enable;
    logic [31:0]      gpu_main_bus;
    logic             gpu_main_bus_rdy, gpu_main_bus_re;
    logic             to_gp0, to_gp1;
    logic [31:0]      gp0, gp1;
    logic             gpu_fifo_full;
    logic [31:0]      gpu_read, gpu_stat;
    logic [19:0]      inst_addr, inst_addr_n;
    logic [19:0]      inst_count, inst_count_n;
    logic [4095:0]    inst_type, inst_type_n;

   logic 	      h_blk_o, v_blk_o;
   
   logic [7:0] 	      mem_controller_state;
   logic [6:0] 	      addr_interp_state;
   logic [4:0] 	      io_controller_state;
   
    // Output assignments signals
    assign rst          = ~KEY[0];
    assign DRAM_DQ      = dram_oe_out ? dram_dq_in : {32{1'bz}};
    assign dram_dq_out  = DRAM_DQ;
    assign SRAM_DQ      = (~SRAM_WE_N) ? sram_dq_out : 16'bz;
    assign sram_dq_in   = SRAM_DQ;
    assign gpu_main_bus = to_gp0 ? gp0 : gp1;
    assign clk          = clk_33MHz;

    // PLL
    pll_psx pl(
            .areset(rst),
            .inclk0(CLOCK_50),
            .c0(c0),
            .c1(c1),
            .locked(locked));
    
    assign clk_50MHz = CLOCK_50 & locked;
    assign clk_33MHz = c0 & locked;
    assign clk_100MHz = c1 & locked;
   
//    always_ff@(posedge clk, posedge rst) begin
//        if (rst)
//            LEDR[15:0] <= 16'h0;
//        else begin
//	   if (SW[0] == 1'b1)
//	     LEDR[15:0] <= {10'd0, mem_controller_state};
//	   else if (SW[1] == 1'b1)
//	     LEDR[15:0] <= {11'd0, addr_interp_state};
//	   else if (SW[2] == 1'b1)
//	     LEDR[15:0] <= {13'd0, io_controller_state};
//	   else if({pc, 2'b0} == 32'h80057AA4)
//             LEDR[15:0] <= 16'hFF;
//	end
//    end
    
   // MIPS core
    Processor core (
            .clock(clk), .reset(rst),

            // interrupts; IP is for diagnostics
            .Interrupts(5'h0), .NMI(1'b0), .IP(),
            .PSX_Interrupts(psx_int),

            // data access
            .DataMem_Ready(mem_data_ready), .DataMem_Read(mem_data_read),
            .DataMem_In(mem_data_out), .DataMem_Write(mem_write_en),
            .DataMem_Address(mem_addr), .DataMem_Out(mem_data_in),

            // instruction access
            .InstMem_In(inst), .InstMem_Address(pc),
            .InstMem_Ready(inst_ready), .InstMem_Read(inst_read),
            .halted(halted));
    
    // Memory
    mem_controller memory(
            .clk(clk), .clk_50(CLOCK_50), .rst(rst),

            /* SDRAM CHIP INTERFACE */
            .dram_addr      (DRAM_ADDR),
            .dram_bank      (DRAM_BA),
            .dram_cas_n     (DRAM_CAS_N),
            .dram_cke       (DRAM_CKE),
            .dram_clk       (DRAM_CLK),
            .dram_cs_n      (DRAM_CS_N),
            .dram_dqm       (DRAM_DQM),
            .dram_ras_n     (DRAM_RAS_N),
            .dram_we_n      (DRAM_WE_N),
            .dram_dq_in     (dram_dq_in),
            .dram_dq_out    (dram_dq_out),
            .dram_oe_out    (dram_oe_out),

            /* CPU DATA */
            .data_addr      ({mem_addr, 2'b0}),
            .data_data_i    (mem_data_in),
            .data_ren       (mem_data_read), 
            .data_wen       (mem_write_en),
            .data_ack       (mem_data_ready),
            .data_data_o    (mem_data_out),

            /* CPU INSTRCTION */
            .inst_addr      ({pc, 2'b0}),
            .inst_ren       (inst_read),
            .inst_ack       (inst_ready),
            .inst_data_o    (inst),

            /* GPU SIGNALS */
            .to_gp0         (to_gp0),
            .to_gp1         (to_gp1),
            .gpu_ren        (gpu_main_bus_re),
            .gpu_rdy        (gpu_main_bus_rdy),
            .gpu_fifo_full  (gpu_fifo_full),
            .gpu_stat       (gpu_stat), 
            .gpu_read       (gpu_read),
            .gp0            (gp0),
			   .gp1            (gp1),
				
				/* GPIO */
				.gpio_o				(GPIO),
				.ledr_o				(LEDR),
				
			  /* controller */
			  .joy_ack       (),
			  .joy_data      (),
			  .joy_att       (),
			  .joy_cmd       (),
			  .joy_clk       (),

            /* HW REGISTER CONNECTIONS */
            .hblank         (h_blk),
            .vblank         (v_blk),
            .dotclock       (VGA_CLK),

            /* INTERRUPTS */
            .interrupts     (psx_int),
	    .*
            );

    /* VRAM Controller */
    vram_control vc(.clk(clk_33MHz),
	 .x_tl(dis_x),
	 .dis_w(dis_w),
            .*);

    /* Display Controller */
    display_out dc
      (.clk_50MHz(clk_50MHz),
       .clk_33MHz(clk_33MHz),
       .enable(enable),
       .vram_out(VGA_data),
       .vram_we(VGA_we),
       .vram_re(VGA_re),
       .vram_y(VGA_y),
       .vram_x(VGA_x),
       .y_tl(dis_y),
       .dis_h(dis_h),
       .v_blk(v_blk),
       .h_blk(h_blk),
       .*);
			  
    /* GPU */
    gpu gp(
            .clk            (clk_33MHz),
            .rst            (rst),
            .vram_bus_in    (GPU_data_out),
            .vram_bus_out   (GPU_data_in),
            .vram_addr      (GPU_addr),
            .gpu_en         (GPU_en),
            .vram_re        (GPU_re),
            .vram_we        (GPU_we),
            .display_x      (dis_x),
            .display_y      (dis_y),
            .display_w      (dis_w),
            .display_h      (dis_h),
            .display_color_mode(color_mode),
            .display_enable (enable),
            .fifo_full      (gpu_fifo_full),
            .main_bus_re    (gpu_main_bus_re),
            .main_bus_rdy   (gpu_main_bus_rdy),
            .main_bus       (gpu_main_bus),
            .*);
endmodule
