`timescale 1ns / 1ps

module Anode(
    counter,
    anode
    );
input [1:0] counter;
output reg[3:0] anode;


/* =============================== */
always@(counter)begin
    case(counter)
        2'b00: anode = 4'b1110;
        2'b01: anode = 4'b1101;
        2'b10: anode = 4'b1011;
        2'b11: anode = 4'b0111;
        default: anode = 4'b0000;
    endcase
end
    
endmodule
