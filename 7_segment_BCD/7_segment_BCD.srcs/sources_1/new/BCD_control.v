`timescale 1ns / 1ps


module BCD_control(
    input clk_in,
    input [7:0] counter256, //8-bit
    output reg [3:0] ones,
    output reg [3:0] tens,
    output reg [3:0] hundreds,
    output reg [3:0] thousands
    );
    
    reg[3:0] i = 0;
    reg[19:0] shift_register = 0;
    //temprary register
    reg[3:0] temp_hundreds = 0;
    reg[3:0] temp_tens = 0;
    reg[3:0] temp_ones = 0;
    //store [7:0] counter256 here until counter256 change 
    reg[7:0] OLD_eight_bit_value = 0;
    
    initial begin
        thousands = 0;
    end
    
    always@(posedge clk_in)
    begin
        if( i == 0 & (OLD_eight_bit_value != counter256))begin
            shift_register = 20'd0;
            OLD_eight_bit_value = counter256;
            shift_register[7:0] =  counter256;
            temp_hundreds = shift_register[19:16];
            temp_tens = shift_register[15:12];
            temp_ones = shift_register[11:8];
            i = i+1;
        end
        
        if(i>0&i<9)begin
            if(temp_hundreds >=5) temp_hundreds = temp_hundreds+3;
            if(temp_tens >=5) temp_tens = temp_tens+3;
            if(temp_ones >=5) temp_ones = temp_ones+3;
            shift_register[19:8] = {temp_hundreds,temp_tens,temp_ones};
            shift_register = shift_register<<1;
            temp_hundreds = shift_register[19:16];
            temp_tens = shift_register[15:12];
            temp_ones = shift_register[11:8];
            i = i+1;            
        end
        if(i==9)begin
            i = 0;
            hundreds = temp_hundreds;
            tens = temp_tens;
            ones = temp_ones;
        end
    end
endmodule
    
