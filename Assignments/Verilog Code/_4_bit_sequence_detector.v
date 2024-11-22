module _4_bit_sequence_detector (
    input clk,
    input reset,
    input in,
    output reg out
);
    // State Encoding using Parameters
    parameter Sin   = 3'b000; // Initial state
    parameter S1    = 3'b001; // '1' detected
    parameter S10   = 3'b010; // '10' detected
    parameter S101  = 3'b011; // '101' detected
    parameter S1011 = 3'b100; // '1011' detected

    reg [2:0] current_state, next_state;

    // State Transition Logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= Sin;
        else
            current_state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        case (current_state)
            Sin:   next_state = (in) ? S1 : Sin;       // Wait for '1'
            S1:    next_state = (in) ? S1 : S10;      // Wait for '0'
            S10:   next_state = (in) ? S101 : Sin;    // Wait for '1'
            S101:  next_state = (in) ? S1011 : S10;   // Wait for '1'
            S1011: next_state = (in) ? S1 : S10;      // Overlapping detection
            default: next_state = Sin;
        endcase
    end

    // Output Logic
    always @(*) begin
        case (current_state)
            S1011: out = 1;  // Sequence detected
            default: out = 0;
        endcase
    end

endmodule

