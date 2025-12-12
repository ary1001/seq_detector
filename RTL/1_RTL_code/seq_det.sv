
//====================================================
// 4-Pattern Overlapping Sequence Detector (Mealy FSM)
// Detects: 1101, 1010, 1001, 0110
// Author: Aryan Mahajan
//====================================================

package constants;
//begin : my_p
typedef enum  bit [3:0] {S[10]}   state;
typedef enum  bit       {GND,VDD} pwr;
//end  : my_p
endpackage : constants


module p4_O_SEQdet 
import constants::* ; 
(
    output logic out_o,          // Output: 1 when pattern detected
    input  logic in_i,           // Serial input bit
    input  logic clock_i,        // System clock
    input  logic areset_ni       // Active-low asynchronous reset
);

//typedef enum  bit [3:0] {S[10]}   state;
//typedef enum  bit       {GND,VDD} pwr; 

    //====================================================
    // State Encoding
    //====================================================
 /* 
    parameter S0 = 4'b0000,
              S1 = 4'b0001,
              S2 = 4'b0010,
              S3 = 4'b0011,
              S4 = 4'b0100,
              S5 = 4'b0101,
              S6 = 4'b0110,
              S7 = 4'b0111,
              S8 = 4'b1000,
              S9 = 4'b1001;

    parameter GND = '0;
*/
    state state_q, state_d;

    //====================================================
    // Sequential Block (State Register)
    //====================================================
    always_ff @(posedge clock_i or negedge areset_ni) 
    begin : sequential_block
        if (!areset_ni)
            state_q <= S0;
        else
            state_q <= state_d;
    end  : sequential_block

    //====================================================
    // Next-State Combinational Logic
    //====================================================
    always_comb 
    begin : next_state_logic
        // Default assignment prevents latch inference
        state_d = state_q;
        unique case (state_q)
            S0: priority if (in_i) state_d = S1; else state_d = S7;
            S1: priority if (in_i) state_d = S2; else state_d = S4;
            S2: priority if (in_i) state_d = S2; else state_d = S3;
            S3: priority if (in_i) state_d = S5; else state_d = S6;
            S4: priority if (in_i) state_d = S5; else state_d = S6;
            S5: priority if (in_i) state_d = S9; else state_d = S4;
            S6: priority if (in_i) state_d = S8; else state_d = S7;
            S7: priority if (in_i) state_d = S8; else state_d = S7;
            S8: priority if (in_i) state_d = S9; else state_d = S4;
            S9: priority if (in_i) state_d = S2; else state_d = S3;
            //default: state_d = S0;
        endcase
    end : next_state_logic

    //====================================================
    // Output Combinational Logic (Mealy Output)
    //====================================================
    always_comb
    begin : output_logic
        out_o = GND;  // Default
        unique case (state_q)
            S3,S6: out_o =  in_i;
            S5,S9: out_o = ~in_i;
            //default: out_o = GND;
        endcase
    end : output_logic

endmodule
