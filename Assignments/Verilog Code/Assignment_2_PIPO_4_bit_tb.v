`timescale 1ns / 1ps

module PIPO_4_bit_tb();
    reg [3:0] data_in;
    reg clk;
    reg reset;
    wire [3:0] data_out;

    PIPO_4_bit uut (
        .data_in(data_in),
        .clk(clk),
        .reset(reset),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        data_in = 4'b0000;
        #10 reset = 0;
        #10 data_in = 4'b1010;
        #10 data_in = 4'b1100;
        #10 data_in = 4'b0011;
        #10 reset = 1;
        #10 reset = 0;
        #10 data_in = 4'b1111;
        #10 $stop;
    end
endmodule
