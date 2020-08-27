`timescale 1ns / 1ps

module BCD_2(
    input [1:0] refresh_counter,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    output reg [3:0] digit
    );
    
    initial begin
        digit = 0;
    end
    
    always@(refresh_counter) begin
        case (refresh_counter)
            2'b00: digit <= ones;
            2'b01: digit <= tens;
            2'b10: digit <= hundreds;
            2'b11: digit <= thousands;
            default: digit <= 4'b0000;
        endcase
    end
    
endmodule
