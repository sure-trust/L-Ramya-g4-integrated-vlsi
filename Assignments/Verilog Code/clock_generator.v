module clock_generator(
    output reg clk_out,
    output reg [31:0] rising_edge_count
);
    reg [31:0] count; // Counter for time division
    reg [31:0] total_count; // Counter for 5-second duration
    initial begin
        clk_out = 0;
        count = 0;
        rising_edge_count = 0;
        total_count = 0;
    end

    always begin
        // Generate a clock with 10 MHz frequency and 30% duty cycle
        #30 clk_out = 1; // HIGH for 30 ns
        #70 clk_out = 0; // LOW for 70 ns
    end

    always @(posedge clk_out) begin
        rising_edge_count = rising_edge_count + 1; // Increment edge count
        total_count = total_count + 1;

        // Stop after 5 seconds (5 * 10^6 ns = 50,000,000 cycles)
        if (total_count == 50000000) $stop;
    end
endmodule
