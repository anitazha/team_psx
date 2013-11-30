
/* MDEC Status Register */
typedef struct packed {
   logic         out_fifo_empty;
   logic 	 in_fifo_full;
   logic 	 busy;
   logic 	 in_req;
   logic 	 out_req;
   logic [1:0] 	 depth;
   logic 	 sign;
   logic 	 mask;
   logic [3:0] 	 reserved;
   logic [2:0] 	 block;
   logic [15:0]  params_remaining;
} MDEC_status_t;

/* Decode FSM state */
