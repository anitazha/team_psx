

module timer0(input logic         sys_clk, rst,
	      input logic 	  dotclock,
	      input logic 	  hblank,
	      input logic [ 1:0]  wen, ren,
	      input logic [ 1:0]  ben,
	      input logic [15:0]  value_i,
	      input logic [15:0]  cmode_i,
	      input logic [15:0]  targt_i,
   
	      output logic [15:0] value_o,
	      output logic [15:0] cmode_o,
	      output logic [15:0] targt_o);
   
   /* internal lines */
   reg [15:0] value, cmode, targt;
   reg [ 9:0] cmode_reg;
   reg [ 5:0] cmode_irq;
   
   reg 	      set_val;
   reg 	      counter_rst;
   reg 	      target_reached;
   reg 	      overflow_reached;
   reg 	      pulsed;
   reg 	      toggle_wait;
   reg [3:0]  pulse_counter;
   
   reg 	      hblank_flag;
   
   wire       sync_en;
   wire [1:0] sync_mode;
   wire       target_flag;
   wire       src_clk;
   
   assign target_flag = cmode[3];
   assign sync_en = cmode[0];
   assign sync_mode = cmode[2:1];
   assign src_clk = ((cmode_o[9:8] == 2'b00) || (cmode_o[9:8] == 2'b10)) ?
                    // 0 or 2 uses system clock
                    // 1 or 3 uses the dotclock
                    sys_clk : dotclock;
   assign cmode_irq[5:3] = 3'b0;
   assign cmode = {cmode_irq, cmode_reg};
   
   /* Outputs */
   assign value_o = value;
   assign cmode_o = cmode;
   assign targt_o = targt;
   
   /* handle write requests */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         cmode_reg <= 10'b0;
         targt <= 16'b0;
	 
         set_val <= 1'b0;
         counter_rst <= 1'b0;
      end
      else begin
         if (set_val) set_val <= 1'b0;
         if (counter_rst) counter_rst <= 1'b0;
	 
         case (wen)
           /* write to current value */
           2'b01: begin
              set_val <= 1'b1;
           end
           /* write to counter mode */
           2'b10: begin
              if (ben[0]) cmode_reg[7:0] <= cmode_i[7:0];
	      if (ben[1]) cmode_reg[9:0] <= cmode_i[9:0];
              counter_rst <= 1'b1;
           end
           /* write to counter target */
           2'b11: begin
	      if (ben[0]) targt[ 7:0] <= targt_i[ 7:0];
	      if (ben[1]) targt[15:8] <= targt_i[15:8];
           end
           /* default */
           default: begin
              set_val <= 1'b0;
              counter_rst <= 1'b0;
           end
         endcase // case (wen)
      end
   end
   
   /* -- IRQ logic --
    * """""""""""""""
    * 4  IRQ when Counter=Target (0=Disable, 1=Enable)
    * 5  IRQ when Counter=FFFFh  (0=Disable, 1=Enable)
    * 6  IRQ Once/Repeat Mode    (0=One-shot, 1=Repeatedly)
    * 7  IRQ Pulse/Toggle Mode   (0=Short Bit10=0 Pulse, 1=Toggle Bit10)
    * 
    * 10 Interrupt Request    (0=Yes, 1=No ) (Set after Writing)    (W=1) (R)
    * 11 Reached Target Value (0=No,  1=Yes) (Reset after Reading)        (R)
    * 12 Reached FFFFh Value  (0=No,  1=Yes) (Reset after Reading)        (R)
    *
    *  In one-shot mode, the IRQ is pulsed/toggled only once (one-shot mode 
    * doesn't stop the counter, it just suppresses any further IRQs until a 
    * new write to the Mode register occurs; if both IRQ conditions are 
    * enabled in Bit4-5, then one-shot mode triggers only one of those 
    * conditions; whichever occurs first).
    * 
    *  Normally, Pulse mode should be used (Bit10 is permanently set, except 
    * for a few clock cycles when an IRQ occurs). In Toggle mode, Bit10 is 
    * set after writing to the Mode register, and becomes inverted on each 
    * IRQ (in one-shot mode, it remains zero after the IRQ) (in repeat mode 
    * it inverts Bit10 on each IRQ, so IRQ4/5/6 are triggered only each 2nd 
    * time, ie. when Bit10 changes from 1 to 0).
    */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         cmode_irq[2:0] <= 3'b001;
         pulsed <= 1'b0;
	 toggle_wait <= 1'b0;
      end
      else begin
	 if (value == 16'b0) toggle_wait <= 1'b0;
	 
         /* BIT 10 */
         /* Set bit10 after writing */
         if (wen[1]) begin
            cmode_irq[0] <= 1'b1;
            pulsed <= 1'b0;
         end
         else begin
            case (cmode[7:6])
              /* One-shot & Pulse */
              2'b00: begin
                 if (~pulsed) begin
                    case (cmode[5:4])
                      // no IRQ triggers 
                      2'b00: begin
                      end
                      // trigger on Counter = Target
                      2'b01: begin
                         if (value == targt) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on Counter = FFFFh
                      2'b10: begin
                         if (value == 16'hFFFF) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on either
                      2'b11: begin
                         if ((value == 16'hFFFF) | (value == targt)) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                    endcase
		 end
		 /* IRQ held for only a few clocks */
		 else begin
                    if (pulse_counter == 4'b1111) begin
		       if (( cmode_reg[3] && value != targt) ||
			   (~cmode_reg[3] && value != 16'hFFFF)) begin
			  cmode_irq[0] <= 1'b1;
		       end
                    end
                 end
	      end
	      /* Repeat & Pulse */
	      2'b01: begin
                 if (~pulsed) begin
                    case (cmode[5:4])
		      // no IRQ triggers
		      2'b00: begin
		      end
		      // trigger on Counter = Target
		      2'b01: begin
                         if (value == targt) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on Counter = FFFFh
                      2'b10: begin
                         if (value == 16'hFFFF) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on either
                      2'b11: begin
                         if ((value == 16'hFFFF) | (value == targt)) begin
			    cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                    endcase 
                 end
		 /* IRQ held for only a few clocks */
		 else begin
                    if (pulse_counter == 4'b1111) begin
		       if (( cmode_reg[3] && value != targt) ||
			   (~cmode_reg[3] && value != 16'hFFFF)) begin
			  cmode_irq[0] <= 1'b1;
			  pulsed <= 1'b0;
                       end
                    end
                 end
              end
              /* One-shot & Toggle */
              2'b10: begin
		 if (~pulsed) begin
                    case (cmode[5:4])
                      // no IRQ triggers
                      2'b00: begin
                      end
                      // trigger on Counter = Target
                      2'b01: begin
			 if (value == targt) begin
                            if (~toggle_wait) begin
			       toggle_wait <= 1'b1;
			       cmode_irq[0] <= 1'b0;
                               pulsed <= 1'b1;
			    end
			 end
                      end
                      // trigger on Counter = FFFFh
                      2'b10: begin
			 if (value == 16'hFFFF) begin
                            if (~toggle_wait) begin
			       toggle_wait <= 1'b1;
			       cmode_irq[0] <= 1'b0;
                               pulsed <= 1'b1;
			    end
			 end
                      end
                      // trigger on either
                      2'b11: begin
			 if ((value == 16'hFFFF) | (value == targt)) begin
                            if (~toggle_wait) begin
			       toggle_wait <= 1'b1;
			       cmode_irq[0] <= 1'b0;
                               pulsed <= 1'b1;
			    end
			 end
                      end
                    endcase
		 end
              end
              /* Repeat & Toggle */
              2'b11: begin
		 case (cmode[5:4])
		   // no IRQ triggers
		   2'b00: begin
		   end
		   // trigger on Counter = Target
		   2'b01: begin
		      if (value == targt) begin
			 if (~toggle_wait) begin
			    toggle_wait <= 1'b1;
			    cmode_irq[0] <= ~cmode_irq[0];
			 end
		      end
		   end
		   // trigger on Counter = FFFFh
		   2'b10: begin
		      if (value == 16'hFFFF) begin
			 if (~toggle_wait) begin
			    toggle_wait <= 1'b1;
			    cmode_irq[0] <= ~cmode_irq[0];
			 end
		      end
		   end
		   // trigger on either
		   2'b11: begin
		      if ((value == 16'hFFFF) | (value == targt)) begin
			 if (~toggle_wait) begin
			    toggle_wait <= 1'b1;
			    cmode_irq[0] <= ~cmode_irq[0];
			 end
		      end
		   end
		 endcase
              end
            endcase // case (IRQ TRIGGERS)
         end
	 
         /* BIT 11 & BIT 12 */
         /* Clear bit11 ad bit12 after reading */
         if (ren[1]) begin
            cmode_irq[2:1] <= 2'b00;
         end
         else begin
            /* Reached Target Value */
            if (target_reached) begin
               cmode_irq[1] <= 1'b1;
            end
            /* Reached FFFFh Value */
            if (overflow_reached) begin
               cmode_irq[2] <= 1'b1;
            end
         end
      end
   end
   
   /* pulse counter */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         pulse_counter <= 4'b0;
      end
      else begin
         if (pulsed) begin
            pulse_counter <= pulse_counter + 4'b1;
         end
         else begin
            pulse_counter <= 4'b0;
         end
      end
   end
   
   /* increment counter
    * reset value at overflow or target value depending on mode register 
    */
   always @ (posedge src_clk, posedge rst) begin
      if (rst) begin
         value <= 16'b0;
         hblank_flag <= 1'b0;
         target_reached <= 1'b0;
         overflow_reached <= 1'b0;
      end
      else begin
         if (target_reached) target_reached <= 1'b0;
         if (overflow_reached) overflow_reached <= 1'b0;
         
         if (set_val) begin
            if (ben[0]) value[ 7:0] <= value_i[ 7:0];
            if (ben[1]) value[15:8] <= value_i[15:8];
            hblank_flag <= 1'b0;
         end
         else if (counter_rst) begin
            value <= 16'b0;
         end
         else begin
            /* overflow flag */
            if (value == 16'hFFFF) begin
               overflow_reached <= 1'b1;
            end
	    /* target flag */
	    if (value == targt) begin
	       target_reached <= 1'b1;
	    end
	    
            /* if configured to reset at target do so */
            if ((value >= targt) & target_flag) begin
               value <= 16'b0;
            end
            else if (sync_en) begin
               /* -- SYNC MODE logic --
                * """""""""""""""""""""
                * Synchronization Modes for Counter 0:
                * - 0 = Pause counter during Hblank(s)
                * - 1 = Reset counter to 0000h at Hblank(s)
                * - 2 = Reset counter to 0000h at Hblank(s) and pause outside 
                *       of Hblank
                * - 3 = Pause until Hblank occurs once, then switch to Free 
                *       Run
                * Synchronization Modes for Counter 1:
                * - Same as above, but using Vblank instead of Hblank
                */
               case (sync_mode)
                 /* Pause counter during Hblank(s) */
                 2'b00: begin
                    if (hblank) begin
                       value <= value;
                    end
                    else begin
                       value <= value + 16'b1;
                    end
                 end
                 /* Reset to 0000h at Hblank(s) */
                 2'b01: begin
                    if (~hblank) begin
		       hblank_flag <= 1'b0;
		       value <= value + 16'b1;
		    end
		    else if (hblank & ~hblank_flag) begin
		       hblank_flag <= 1'b1;
		       value <= 16'b0;
		    end
		    else if (hblank & hblank_flag) begin
		       value <= value + 16'b1;
		    end
		    else begin
		       value <= value + 16'b1;
		    end
                 end
                 /* Reset to 0000h at Hblank(s) and pause outside Hblank(s) */
                 2'b10: begin
                    if (~hblank) begin
                       hblank_flag <= 1'b0;
                       value <= value;
                    end
                    else if (hblank & ~hblank_flag) begin
                       hblank_flag <= 1'b1;
                       value <= 16'b0;
                    end
                    else if (hblank && hblank_flag) begin
                       value <= value + 16'b1;
                    end
                    else begin
                       value <= value + 16'b1;
                    end
                 end
                 /* Pause until Hblank occurs once, then switch to free run */
                 2'b11: begin
                    if (~hblank && ~hblank_flag) begin
                       value <= value;
                    end
                    else if (hblank && ~hblank_flag) begin
                       hblank_flag <= 1'b1;
		       value <= value + 16'b1;
                    end
                    else if (hblank_flag) begin
                       value <= value + 16'b1;
                    end
                    else begin
                       value <= value + 16'b1;
                    end
                 end
               endcase // case (sync_mode)
            end
            else begin
               value <= value + 16'b1;
            end
         end
      end
   end
endmodule // timer0


module timer2(input logic         sys_clk, rst,
              input logic [ 1:0]  wen, ren,
              input logic [ 1:0]  ben,
              input logic [15:0]  value_i,
              input logic [15:0]  cmode_i,
              input logic [15:0]  targt_i,
  
              output logic [15:0] value_o,
              output logic [15:0] cmode_o,
              output logic [15:0] targt_o);
   
   /* internal lines */
   reg [15:0] 	      value, cmode, targt;
   reg [ 9:0] 	      cmode_reg;
   reg [ 5:0] 	      cmode_irq;
   
   reg [2:0] 	      clock_counter;
   reg 		      sys_clk_1_8;
   
   reg 		      set_val;
   reg 		      counter_rst;
   reg 		      target_reached;
   reg 		      overflow_reached;
   reg 		      pulsed;
   reg 		      toggle_wait;
   reg [3:0] 	      pulse_counter;
   
   wire 	      sync_en;
   wire [1:0] 	      sync_mode;
   wire 	      target_flag;
   wire 	      src_clk;
   
   assign target_flag = cmode[3];
   assign sync_en = cmode[0];
   assign sync_mode = cmode[2:1];
   assign src_clk = ((cmode_o[9:8] == 2'b00) || (cmode_o[9:8] == 2'b10)) ?
                    // 0 or 2 uses system clock
                    // 1 or 3 uses the dotclock
                    sys_clk : sys_clk_1_8;
   assign cmode_irq[5:3] = 3'b0;
   assign cmode = {cmode_irq, cmode_reg};
   
   assign sys_clk_1_8 = clock_counter[2];
   
   /* Outputs */
   assign value_o = value;
   assign cmode_o = cmode;
   assign targt_o = targt;
   
   /* clock divider counter */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
	 clock_counter <= 3'b0;
      end
      else begin
	 clock_counter <= clock_counter + 3'b1;
      end
   end
   
   /* handle write requests */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         cmode_reg <= 10'b0;
         targt <= 16'b0;
	 
         set_val <= 1'b0;
         counter_rst <= 1'b0;
      end
      else begin
         if (set_val) set_val <= 1'b0;
         if (counter_rst) counter_rst <= 1'b0;
	 
         case (wen)
           /* write to current value */
           2'b01: begin
              set_val <= 1'b1;
           end
           /* write to counter mode */
           2'b10: begin
              if (ben[0]) cmode_reg[7:0] <= cmode_i[7:0];
	      if (ben[1]) cmode_reg[9:0] <= cmode_i[9:0];
              counter_rst <= 1'b1;
           end
           /* write to counter target */
           2'b11: begin
	      if (ben[0]) targt[ 7:0] <= targt_i[ 7:0];
	      if (ben[1]) targt[15:8] <= targt_i[15:8];
           end
           /* default */
           default: begin
              set_val <= 1'b0;
              counter_rst <= 1'b0;
           end
         endcase // case (wen)
      end
   end
   
   /* -- IRQ logic --
    * """""""""""""""
    * 4  IRQ when Counter=Target (0=Disable, 1=Enable)
    * 5  IRQ when Counter=FFFFh  (0=Disable, 1=Enable)
    * 6  IRQ Once/Repeat Mode    (0=One-shot, 1=Repeatedly)
    * 7  IRQ Pulse/Toggle Mode   (0=Short Bit10=0 Pulse, 1=Toggle Bit10)
    * 
    * 10 Interrupt Request    (0=Yes, 1=No ) (Set after Writing)    (W=1) (R)
    * 11 Reached Target Value (0=No,  1=Yes) (Reset after Reading)        (R)
    * 12 Reached FFFFh Value  (0=No,  1=Yes) (Reset after Reading)        (R)
    *
    *  In one-shot mode, the IRQ is pulsed/toggled only once (one-shot mode 
    * doesn't stop the counter, it just suppresses any further IRQs until a 
    * new write to the Mode register occurs; if both IRQ conditions are 
    * enabled in Bit4-5, then one-shot mode triggers only one of those 
    * conditions; whichever occurs first).
    * 
    *  Normally, Pulse mode should be used (Bit10 is permanently set, except 
    * for a few clock cycles when an IRQ occurs). In Toggle mode, Bit10 is 
    * set after writing to the Mode register, and becomes inverted on each 
    * IRQ (in one-shot mode, it remains zero after the IRQ) (in repeat mode 
    * it inverts Bit10 on each IRQ, so IRQ4/5/6 are triggered only each 2nd 
    * time, ie. when Bit10 changes from 1 to 0).
    */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         cmode_irq[2:0] <= 3'b001;
         pulsed <= 1'b0;
	 toggle_wait <= 1'b0;
      end
      else begin
	 if (value == 16'b0) toggle_wait <= 1'b0;
	 
         /* BIT 10 */
         /* Set bit10 after writing */
         if (wen[1]) begin
            cmode_irq[0] <= 1'b1;
            pulsed <= 1'b0;
         end
         else begin
            case (cmode[7:6])
              /* One-shot & Pulse */
              2'b00: begin
                 if (~pulsed) begin
                    case (cmode[5:4])
                      // no IRQ triggers 
                      2'b00: begin
                      end
                      // trigger on Counter = Target
                      2'b01: begin
                         if (value == targt) begin
                           cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on Counter = FFFFh
                      2'b10: begin
                         if (value == 16'hFFFF) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on either
                      2'b11: begin
                         if ((value == 16'hFFFF) | (value == targt)) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                    endcase
		 end
                 /* IRQ held for only a few clocks */
		 else begin
                    if (pulse_counter == 4'b1111) begin
		       if (( cmode_reg[3] && value != targt) ||
			   (~cmode_reg[3] && value != 16'hFFFF)) begin
			  cmode_irq[0] <= 1'b1;
		       end
                    end
                 end
              end
              /* Repeat & Pulse */
              2'b01: begin
                 if (~pulsed) begin
                    case (cmode[5:4])
                      // no IRQ triggers
                      2'b00: begin
                      end
                      // trigger on Counter = Target
                      2'b01: begin
                         if (value == targt) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on Counter = FFFFh
                      2'b10: begin
                         if (value == 16'hFFFF) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                      // trigger on either
                      2'b11: begin		 
                         if ((value == 16'hFFFF) | (value == targt)) begin
                            cmode_irq[0] <= 1'b0;
                            pulsed <= 1'b1;
                         end
                      end
                    endcase
		 end
                 /* IRQ held for only a few clocks */ 
                 else begin
                    if (pulse_counter == 4'b1111) begin
		       if (( cmode_reg[3] && value != targt) ||
			   (~cmode_reg[3] && value != 16'hFFFF)) begin
			  cmode_irq[0] <= 1'b1;
			  pulsed <= 1'b0;
                       end
                    end
                 end
              end
              /* One-shot & Toggle */
              2'b10: begin
		 if (~pulsed) begin
                    case (cmode[5:4])
                      // no IRQ triggers
                      2'b00: begin
                      end
                      // trigger on Counter = Target
                      2'b01: begin
			 if (value == targt) begin
                            if (~toggle_wait) begin
			       toggle_wait <= 1'b1;
                               cmode_irq[0] <= 1'b0;
                               pulsed <= 1'b1;
			    end
			 end
                      end
                      // trigger on Counter = FFFFh
                      2'b10: begin
			 if (value == 16'hFFFF) begin
                            if (~toggle_wait) begin
			       toggle_wait <= 1'b1;
                               cmode_irq[0] <= 1'b0;
                               pulsed <= 1'b1;
			    end
			 end
                      end
                      // trigger on either
                      2'b11: begin
			 if ((value == 16'hFFFF) | (value == targt)) begin
                            if (~toggle_wait) begin
			       toggle_wait <= 1'b1;
                               cmode_irq[0] <= 1'b0;
                               pulsed <= 1'b1;
			    end
			 end
                      end
                    endcase
		 end
              end
              /* Repeat & Toggle */
              2'b11: begin
		 case (cmode[5:4])
		   // no IRQ triggers
		   2'b00: begin
		   end
		   // trigger on Counter = Target
		   2'b01: begin
		      if (value == targt) begin
                         if (~toggle_wait) begin
			    toggle_wait <= 1'b1;
			    cmode_irq[0] <= ~cmode_irq[0];
			 end
		      end
		   end
		   // trigger on Counter = FFFFh
		   2'b10: begin
		      if (value == 16'hFFFF) begin
                         if (~toggle_wait) begin
			    toggle_wait <= 1'b1;
			    cmode_irq[0] <= ~cmode_irq[0];
			 end
		      end
		   end
		   // trigger on either
		   2'b11: begin
		      if ((value == 16'hFFFF) | (value == targt)) begin
                         if (~toggle_wait) begin
			    toggle_wait <= 1'b1;
			    cmode_irq[0] <= ~cmode_irq[0];
			 end
		      end
		   end
		 endcase
              end
            endcase // case (IRQ TRIGGERS)
         end

         /* BIT 11 & BIT 12 */
         /* Clear bit11 ad bit12 after reading */
         if (ren[1]) begin
            cmode_irq[2:1] <= 2'b00;
         end
         else begin
            /* Reached Target Value */
            if (target_reached) begin
               cmode_irq[1] <= 1'b1;
            end
            /* Reached FFFFh Value */
            if (overflow_reached) begin
               cmode_irq[2] <= 1'b1;
            end
         end
      end
   end

   /* pulse counter */
   always @ (posedge sys_clk, posedge rst) begin
      if (rst) begin
         pulse_counter <= 4'b0;
      end
      else begin
         if (pulsed) begin
            pulse_counter <= pulse_counter + 4'b1;
         end
         else begin
            pulse_counter <= 4'b0;
         end
      end
   end
   
   /* increment counter
    * reset value at overflow or target value depending on mode register 
    */
   always @ (posedge src_clk, posedge rst) begin
      if (rst) begin
         value <= 16'b0;
         target_reached <= 1'b0;
         overflow_reached <= 1'b0;
      end
      else begin
         if (target_reached) target_reached <= 1'b0;
         if (overflow_reached) overflow_reached <= 1'b0;
         
         if (set_val) begin
            if (ben[0]) value[ 7:0] <= value_i[ 7:0];
            if (ben[1]) value[15:8] <= value_i[15:8];
         end
         else if (counter_rst) begin
            value <= 16'b0;
         end
         else begin
            /* overflow flag */
            if (value == 16'hFFFF) begin
               overflow_reached <= 1'b1;
            end
            
            /* if configured to reset at target do so */
            if ((value >= targt) & target_flag) begin
               target_reached <= 1'b1;
               value <= 16'b0;
            end
            else if (sync_en) begin
               /* -- SYNC MODE logic --
                * """""""""""""""""""""
		* Synchronization Modes for Counter 2:
		* - 0 or 3 = Stop counter at current value 
		*            (forever, no h/v-blank start)
		* - 1 or 2 = Free Run (same as when Synchronization Disabled)
		*/
               case (sync_mode)
                 /* Stop counter at current value */
                 2'b00: begin
                    value <= value;
                 end
                 /* Free Run */
                 2'b01: begin
                    value <= value + 16'b1;
                 end
		 /* Free Run */
		 2'b10: begin
                    value <= value + 16'b1;
                 end
		 /* Stop counter at current value */
		 2'b11: begin
                    value <= value;
                 end
               endcase // case (sync_mode)
            end
            else begin
               value <= value + 16'b1;
            end
         end
      end
   end
endmodule // timer2


module psx_timers(input logic         sys_clk, rst,
                  input logic         dotclock,
                  input logic         hblank,
                  input logic         vblank,
                  input logic [7:0]   timer_sel,
                  input logic         wen, ren,
                  input logic [15:0]  data_i,
                  input logic [ 1:0]  ben,
                  output logic [15:0] timer0_value,
                  output logic [15:0] timer0_cmode,
                  output logic [15:0] timer0_targt,
                  output logic [15:0] timer1_value,
                  output logic [15:0] timer1_cmode,
                  output logic [15:0] timer1_targt,
                  output logic [15:0] timer2_value,
                  output logic [15:0] timer2_cmode,
                  output logic [15:0] timer2_targt);

   /* Internal Lines */
   reg [1:0]      timer0_wen, timer1_wen, timer2_wen;
   reg [1:0] 	  timer0_ren, timer1_ren, timer2_ren;

   assign timer0_wen = (timer_sel == 8'h00) ? {1'b0, wen } :
		       (timer_sel == 8'h04) ? {wen,  1'b0} :
		       (timer_sel == 8'h08) ? {wen,  wen } : 2'b0;
   assign timer1_wen = (timer_sel == 8'h10) ? {1'b0, wen } :
		       (timer_sel == 8'h14) ? {wen,  1'b0} :
		       (timer_sel == 8'h18) ? {wen,  wen } : 2'b0;
   assign timer2_wen = (timer_sel == 8'h20) ? {1'b0, wen } :
		       (timer_sel == 8'h24) ? {wen,  1'b0} :
		       (timer_sel == 8'h28) ? {wen,  wen } : 2'b0;
   assign timer0_ren = (timer_sel == 8'h00) ? {1'b0, ren } :
		       (timer_sel == 8'h04) ? {ren,  1'b0} :
		       (timer_sel == 8'h08) ? {ren,  ren } : 2'b0;
   assign timer1_ren = (timer_sel == 8'h10) ? {1'b0, ren } :
		       (timer_sel == 8'h14) ? {ren,  1'b0} :
		       (timer_sel == 8'h18) ? {ren,  ren } : 2'b0;
   assign timer2_ren = (timer_sel == 8'h20) ? {1'b0, ren } :
		       (timer_sel == 8'h24) ? {ren,  1'b0} :
		       (timer_sel == 8'h28) ? {ren,  ren } : 2'b0;
   
   /* DOTCLOCK TIMER */
   timer0 timer_0(.sys_clk  (sys_clk),
                  .rst      (rst),
                  .dotclock (dotclock),
                  .hblank   (hblank),
                  .wen      (timer0_wen),
                  .ren      (timer0_ren),
                  .ben      (ben),
                  .value_i  (data_i),
                  .cmode_i  (data_i),
                  .targt_i  (data_i),
                  .value_o  (timer0_value),
                  .cmode_o  (timer0_cmode),
                  .targt_o  (timer0_targt));
   /* HORIZONTAL RETRACE TIMER */
   timer0 timer_1(.sys_clk  (sys_clk),
                  .rst      (rst),
                  .dotclock (hblank),
                  .hblank   (vblank),
                  .wen      (timer1_wen),
                  .ren      (timer1_ren),
                  .ben      (ben),
                  .value_i  (data_i),
                  .cmode_i  (data_i),
                  .targt_i  (data_i),
                  .value_o  (timer1_value),
                  .cmode_o  (timer1_cmode),
                  .targt_o  (timer1_targt));
   /* 1/8 SYSTEM CLOCK TIMER */
   timer2 timer_2(.sys_clk (sys_clk),
                  .rst     (rst),
                  .wen     (timer2_wen),
                  .ren     (timer2_ren),
                  .ben     (ben),
                  .value_i (data_i),
                  .cmode_i (data_i),
                  .targt_i (data_i),
                  .value_o (timer2_value),
                  .cmode_o (timer2_cmode),
                  .targt_o (timer2_targt));
   
endmodule // psx_timers
