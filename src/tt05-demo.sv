`default_nettype none

module tt_um_Petros-Emmanouilidis-example 
    (input  logic clock,
     input  logic reset_L,
     input  logic [1:0] operation,
     input  logic [3:0] operand,
     output logic [3:0] result);

    logic [3:0] state, nextState;

    always_comb begin
        case (operation)
            2'b0: nextState = state + operand;
            2'b1: nextState = state - operand;
            2'd2: nextState = state | operand;
            2'd3: nextState = state ^ operand;
            default: nextState = state;
        endcase     
    end

    always_ff @ (posedge clock, negedge reset_L) begin
        if (~reset_L) state <= 4'b0;
        else state <= nextState;
        
    end

endmodule: ALU
