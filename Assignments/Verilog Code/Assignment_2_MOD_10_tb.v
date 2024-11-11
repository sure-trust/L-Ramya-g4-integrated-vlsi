`timescale 1ns / 1ps
module MOD_10_tb();
    reg clk;
    reg reset;
    wire [3:0] count;
    
    MOD_10 uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        #10 reset = 0;
        #100 reset = 1;
        #10 reset = 0;
        #100 $stop;
    end
endmodule
