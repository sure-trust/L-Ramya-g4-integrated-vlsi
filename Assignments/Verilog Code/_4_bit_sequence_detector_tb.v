//Testbench

module tb_4_bit_sequence_detector;

    // Inputs
    reg clk;
    reg reset;
    reg in;

    // Outputs
    wire out;

    // Instantiate the Design Under Test (DUT)
    _4_bit_sequence_detector (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period = 10 units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        in = 0;

        // Reset the machine
        #10 reset = 0;

        // Provide input sequence: 1011011
        #10 in = 1; // Input: 1
        #10 in = 0; // Input: 0
        #10 in = 1; // Input: 1
        #10 in = 1; // Input: 1 (1011 detected)
        #10 in = 0; // Input: 0
        #10 in = 1; // Input: 1
        #10 in = 1; // Input: 1 (overlap 1011 detected)

        // Finish simulation
        #20 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | Input: %b | Output: %b", $time, in, out);
    end

endmodule
