`timescale 1ns / 1ps

module PIPO_4_bit (
    input [3:0] data_in,
    input clk,
    input reset,
    output reg [3:0] data_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 4'b0000;
        else
            data_out <= data_in;
    end
endmodule
