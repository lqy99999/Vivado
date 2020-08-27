`timescale 1ns / 1ps

module Cathode(
    digit,
    cathode
    );
input [3:0] digit;
output reg[7:0] cathode;


/* =============================== */
always@(digit)begin
    case(digit)
        4'd0: cathode = 8'b11000000; // 0
        4'd1: cathode = 8'b11111001; // 1
        4'd2: cathode = 8'b10100100; // 2
        4'd3: cathode = 8'b10110000; // 3
        4'd4: cathode = 8'b10011001; // 4
        4'd5: cathode = 8'b10010010; // 5
        4'd6: cathode = 8'b10000010; // 6
        4'd7: cathode = 8'b11111000; // 7
        4'd8: cathode = 8'b10000000; // 8
        4'd9: cathode = 8'b10010000; // 9
        default: cathode = 8'b11000000; // 0
    endcase
end
    
endmodule