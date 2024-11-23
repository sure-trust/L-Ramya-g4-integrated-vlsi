module tb_clock_generator;
    wire clk_out;
    wire [31:0] rising_edge_count;

    // Instantiate the clock generator module
    clock_generator uut(
        .clk_out(clk_out),
        .rising_edge_count(rising_edge_count)
    );

    initial begin
        // Monitor values
        $monitor("Time = %0t, Clock = %b, Rising Edge Count = %d", 
                 $time, clk_out, rising_edge_count);

        // Run simulation for 5 seconds (50,000,000 ns)
        #50000000;
        $finish;
    end
endmodule
