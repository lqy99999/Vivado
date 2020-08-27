`timescale 1ns / 1ps

module Binary_to_BCD(
    reset,
    clk, // 100M
    number,
    ones,
    tens,
    hundreds,
    thousands
    );
    
input reset;
input clk;
input [7:0] number;
output reg [3:0] ones;
output reg [3:0] tens;
output reg [3:0] hundreds;
output reg [3:0] thousands;

/* =============================== */
reg [3:0] i;
reg [3:0] tmp_ones;
reg [3:0] tmp_tens;
reg [3:0] tmp_hundreds;
reg [7:0] tmp_digits;
reg [19:0] shift_tmp;
    
    
/* =============Blocking================== */
always@(posedge clk)begin
    if(reset)begin
        ones = 4'd0;
        tens = 4'd0;
        hundreds = 4'd0;
        thousands = 4'd0;
        i = 4'd0;
        tmp_ones = 4'd0;
        tmp_tens = 4'd0;
        tmp_hundreds = 4'd0;
        tmp_digits = 8'd0;
        shift_tmp = 20'd0;
    end
    else begin
        //input number
        if( i == 0 && (tmp_digits != number))begin
            shift_tmp = 20'd0;
            tmp_digits = number;
            shift_tmp[7:0] = number;
            tmp_ones = shift_tmp[11:8];
            tmp_tens = shift_tmp[15:12];
            tmp_hundreds = shift_tmp[19:16];
            i = i + 4'd1;
        end
        //split into[hundreds,tens,ones,number]
        //if segment exceeds 5, add 3
        //and shift every clk
        else if(i < 9 && i > 0)begin
            if(tmp_ones >= 5) tmp_ones = tmp_ones + 4'd3;
            else tmp_ones = tmp_ones;
            
            if(tmp_tens >= 5) tmp_tens = tmp_tens + 4'd3;
            else tmp_tens = tmp_tens;
            
            if(tmp_hundreds >= 5) tmp_hundreds = tmp_hundreds + 4'd3;
            else tmp_hundreds = tmp_hundreds;
            
            shift_tmp[19:8] = {tmp_hundreds, tmp_tens, tmp_ones};
            shift_tmp = shift_tmp << 1;
            tmp_ones = shift_tmp[11:8];
            tmp_tens = shift_tmp[15:12];
            tmp_hundreds = shift_tmp[19:16];
            i = i + 4'd1;
        end
        //output the number
        else if(i == 9)begin
           i = 4'd0;
           ones = tmp_ones;
           tens = tmp_tens;
           hundreds = tmp_hundreds;
        end
    end
end


endmodule