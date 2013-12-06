/* Status register types */
typedef struct packed {
   logic [1:0] port;
   logic       xa_fifo_empty;
   logic       param_fifo_empty;
   logic       param_fifo_full;
   logic       resp_fifo_empty;
   logic       data_fifo_empty;
   logic       busy;
} STATUS_t;

/* Decode FSM states */
typedef enum logic [1:0] {WAIT_D, WAIT_DATA_D, SEND_D} DECODE_STATE_t;

/* Send FSM states */
typedef enum logic [3:0] {WAIT_S, SET_CMDL_S, SET_ENL_S, WAIT_ACKL_S, WAIT_NACK_S,
                          SET_CMDH_S, SET_ENH_S, WAIT_ACKH_S, WAIT_NACKH_S,
                          DONE_S} SEND_STATE_t;

/* Receive FSM states */
typedef enum logic [2:0] {WAIT_R, WAIT_DATA_R, GET_DATA_R, WAIT_NACK_R, WAIT_CANCEL_R} RECV_STATE_T;
