`timescale 1ns / 1ps

module Multiplier_3x3(
  input A2, A1, A0, B2, B1, B0,
  output [5:0]P
);
  wire [14:0]w ;
  
  and a1 (P[0], A0, B0);
  and a2 (w[0], A1, B0);
  and a3 (w[1], A2, B0);
  and a4 (w[2], A0, B1);
  and a5 (w[3], A1, B1);
  and a6 (w[4], A2, B1);
  and a7 (w[8], A0, B2);
  and a8 (w[9], A1, B2);
  and a9 (w[11], A2, B2);
  
  HA_GL HA0 (w[0] , w[2] , P[1], w[5] );
  HA_GL HA1 (w[1] , w[3] , w[6], w[7] );
  HA_GL HA2 (w[12], w[13], P[3], w[14]);
  
  FA_GL FA0 (w[5] , w[6] , w[8] , P[2] , w[12]);
  FA_GL FA1 (w[7] , w[4] , w[9] , w[13], w[10]);
  FA_GL FA2 (w[10], w[11], w[14], P[4] , P[5] );
  
endmodule


//Half adder
module HA_GL(
    input A,
    input B,
    output Sum,
    output Carry
    );
    xor x1 (Sum,A,B);
    and a1 (Carry,A,B);
endmodule


//full adder
module FA_GL(
    input A,
    input B,
    input C,
    output Sum,
    output Carry
    );
    wire w0,w1,w2;
    xor x1(w0,A,B);
    xor x2(Sum,w0,C);
    and a1(w1,w0,C);
    and a2(w2,A,B);
    or o1(Carry,w1,w2);
endmodule

