

module addr_interpreter(input  logic clk, rst,
                        input  logic [31:0] addr,
                        input  logic [31:0] data_i,
                        input  logic        ren, wen,
                        output logic        ack,
                        output logic [31:0] data_o,
                        output logic [ 6:0] addr_interpreter_state,

                        /* BLOCKRAM INTERFACE */
                        input  logic [31:0] blk_data,
                        output logic [16:0] blk_addr,

                        /* SDRAM INTERFACE */
                        input  logic [31:0] sd_data_o,
                        input  logic        sd_valid,
                        input  logic        sd_waitrequest,
                        output logic [24:0] sd_addr,
                        output logic [31:0] sd_data_i,
                        output logic        sd_wen,
                        output logic        sd_ren,

                        /* SCRATCH PAD BLOCKRAM INTERFACE */
                        input  logic [31:0] sc_data_o,
                        output logic [ 7:0] sc_addr,
                        output logic [31:0] sc_data_i,
                        output logic        sc_wen//,

                        /* HW REGISTER INTERFACE */
                        input  logic [31:0] hw_data_o,
                        input  logic        hw_ack,
                        output logic [31:0] hw_data_i,
                        output logic [31:0] hw_addr,
                        output logic [ 3:0] hw_be,
                        output logic        hw_wen,
                        output logic        hw_ren
                        );

   /* PARAMETERS - state declatations */
   localparam IDLE      = 7'b0000001;
   localparam READ      = 7'b0000010;
   localparam READ_ACK  = 7'b0000100;
   localparam LATCH     = 7'b0001000;
   localparam WRITE     = 7'b0010000;
   localparam WRITE_ACK = 7'b0100000;
   localparam WAIT      = 7'b1000000;
   
   /* PARAMETERS - constants */
   localparam BIOS_TAG_1 = 32'h1FC0_0000;   // start addresses for BIOS
   localparam BIOS_TAG_2 = 32'h9FC0_0000;
   localparam BIOS_TAG_3 = 32'hBFC0_0000;
   localparam BIOS_SIZE  = 20'h0008_0000;

   localparam MAIN_TAG_1  = 32'h0000_0000;  // KUSEG
   localparam MAIN_TAG_2  = 32'h8000_0000;  // KSEG0
   localparam MAIN_TAG_3  = 32'hA000_0000;  // KSEG1
   localparam MAIN_SIZE   = 32'h0020_0000;  // 2 megabytes
   localparam MAIN_OFFSET = 24'h000000;

   localparam PPORT_TAG_1 = 32'h1F00_0000;  // parallel port start addresses
   localparam PPORT_TAG_2 = 32'h9F00_0000;
   localparam PPORT_TAG_3 = 32'hBF00_0000;
   localparam PPORT_SIZE  = 32'h0001_0000;

   localparam SCPAD_TAG_1 = 32'h1F80_0000;  // scratch pad start addresses
   localparam SCPAD_TAG_2 = 32'h9F80_0000;
   localparam SCPAD_SIZE  = 32'h0000_0400;

   localparam HWREG_TAG_1 = 32'h1F80_1000;  // mem map I/O start addresse
   localparam HWREG_TAG_2 = 32'h9F80_1000;
   localparam HWREG_TAG_3 = 32'hBF80_1000;
   localparam HWREG_SIZE  = 32'h0000_2000;

   /* INTERNAL LINES */
   reg [6:0]   curr_state,  next_state;
   reg         curr_ack,    next_ack;
   reg [24:0]  curr_addr,   next_addr;
   reg [31:0]  curr_data_i, next_data_i;

   reg [7:0]   timeout_counter; 
   
   reg         sd_wen_out, sd_ren_out;
   reg         hw_wen_out, hw_ren_out;
   reg         sc_wen_out;
   reg [31:0]  data_out;
   
   wire        in_BIOS, in_MAIN, in_PPORT, in_SCPAD, in_HWREG;
   
   assign in_BIOS  = ((addr >= BIOS_TAG_1  & addr <  BIOS_TAG_1+BIOS_SIZE) ||
                      (addr >= BIOS_TAG_2  & addr <  BIOS_TAG_2+BIOS_SIZE) ||
                      (addr >= BIOS_TAG_3  & addr <  BIOS_TAG_3+BIOS_SIZE));
   assign in_MAIN  = ((addr >= MAIN_TAG_1  & addr <  MAIN_TAG_1+MAIN_SIZE) ||
                      (addr >= MAIN_TAG_2  & addr <  MAIN_TAG_2+MAIN_SIZE) ||
                      (addr >= MAIN_TAG_3  & addr <  MAIN_TAG_3+MAIN_SIZE));
   assign in_PPORT = ((addr >= PPORT_TAG_1 & addr < PPORT_TAG_1+PPORT_SIZE) ||
                      (addr >= PPORT_TAG_2 & addr < PPORT_TAG_1+PPORT_SIZE) ||
                      (addr >= PPORT_TAG_3 & addr < PPORT_TAG_1+PPORT_SIZE));
   assign in_SCPAD = ((addr >= SCPAD_TAG_1 & addr < SCPAD_TAG_1+SCPAD_SIZE) ||
                      (addr >= SCPAD_TAG_2 & addr < SCPAD_TAG_1+SCPAD_SIZE));
   assign in_HWREG = ((addr >= HWREG_TAG_1 & addr < HWREG_TAG_1+HWREG_SIZE) ||
                      (addr >= HWREG_TAG_2 & addr < HWREG_TAG_1+HWREG_SIZE) ||
                      (addr >= HWREG_TAG_3 & addr < HWREG_TAG_1+HWREG_SIZE));

   assign data_o = data_out;
   assign ack    = curr_ack;
   
   assign sc_data_i = data_i;
   assign sd_data_i = data_i;
   
   assign sc_addr = addr[9:2];
   assign sd_addr = {5'd0, addr[20:2]};
   
   assign blk_addr = addr[18:2];
   
   assign sc_wen = sc_wen_out;
   assign sd_wen = sd_wen_out;
   assign sd_ren = sd_ren_out;
   assign hw_wen = hw_wen_out;
   assign hw_ren = hw_ren_out;
   
   assign addr_interpreter_state = curr_state;

   /* timeout counter for sd_valid (resend command if timeout)*/
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         timeout_counter <= 6'd0;
      end
      else begin
         if (curr_state != READ_ACK || curr_state != WRITE_ACK) begin
            timeout_counter <= 6'd0;
         end
         else begin
            timeout_counter <= timeout_counter + 6'd1;
         end
      end
   end
   
   /* READ - latch value from memory */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         data_out <= 32'd0;
      end
      else begin
         if (curr_state == LATCH && in_BIOS) begin
            data_out <= blk_data;
         end
         else if (curr_state == LATCH && in_MAIN) begin
            data_out <= 32'd0;//sd_data_o;
         end
         else if (curr_state == LATCH && in_SCPAD) begin
            data_out <= sc_data_o;
         end
         else if (curr_state == LATCH && in_HWREG) begin
            data_out <= hw_data_o;
         end
         else if (curr_state == LATCH) begin
            data_out <= 32'd0;
         end
      end
   end

   /* FSM next state logic */
   always @ (posedge clk, posedge rst) begin
      if (rst) begin
         curr_state  = IDLE;
         curr_ack    = 1'd0;
      end
      else begin
         curr_state  = next_state;
         curr_ack    = next_ack;
      end 
   end
   
   /* FSM */
   always_comb begin
      /* Defaults */
      next_state  = curr_state;
      next_ack    = curr_ack;
      
      sd_wen_out = 1'b0;
      sd_ren_out = 1'b0;
      sc_wen_out = 1'b0;
      hw_wen_out = 1'b0;
      hw_ren_out = 1'b0;

      case (curr_state)
        /* wait for memory request */
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
        end      
        
        /* READ STATE */
        READ: begin
           if (in_MAIN) begin
              next_state = LATCH;
              //sd_ren_out = 1'b1;
              //if (sd_waitrequest) begin
              //   sd_ren_out = 1'b0;
              //   next_state = READ;
              //end
              //else begin     
              //   next_state = READ_ACK;
              //end
           end
           else if (in_HWREG) begin
              hw_ren_out = 1'b1;
              next_state = READ_ACK;
           end
           else begin
              next_state = LATCH;
           end
        end
        READ_ACK: begin
           if (in_MAIN) begin
              if (sd_valid) begin
                 next_state = LATCH;
              end
              else if (timeout_counter == 100) begin
                 next_state = IDLE;
              end
              else begin
                 next_state = READ_ACK;
              end
           end
           else if (in_HWREG) begin
              hw_ren_out = 1'b1
              if (hw_ack) begin
                 hw_ren_out = 1'b0;
                 next_state = LATCH;
              end
              else begin
                 next_state = READ_ACK;
              end
           end 
           else begin
              next_state = READ_ACK;
           end
        end
        LATCH: begin
           next_state = WAIT;
           next_ack = 1'b1;
        end
        
        /* WRITE STATE */
        WRITE: begin
           if (in_MAIN) begin
              //sd_wen_out = 1'b1;
              //if (sd_waitrequest) begin
              //   sd_wen_out = 1'b0;
              //   next_state = WRITE;
              //end
              //else begin
                 next_state = WRITE_ACK;
              //end
           end
           else if (in_SCPAD) begin
              next_state = WAIT;
              next_ack = 1'b1;
              sc_wen_out = 1'b1;
           end
           else if (in_HWREG) begin
              next_state = WRITE_ACK;
              hw_wen_out = 1'b1;
           end
           else begin
              /* error */
              next_state = IDLE;
           end
        end
        WRITE_ACK: begin
           if (in_MAIN) begin
              next_state = WAIT;
              next_ack = 1'b1;
           end
           else if (in_HWREG) begin
              hw_wen_out = 1'b1
              if (hw_ack) begin
                 next_state = WAIT;
                 hw_wen_out = 1'b0;
                 next_ack = 1'b1;
              end
              else begin
                 next_state = WRITE_ACK;
              end
           end 
        end
        
        /* WAIT for ren-wen to fall */
        WAIT: begin
           if (~ren && ~wen) begin
              next_ack = 1'b0;
              next_state = IDLE;
           end
           else begin
              next_state = WAIT;
           end
        end
      endcase // case (curr_state)
   end
   
endmodule // addr_interpreter

        
           
        
