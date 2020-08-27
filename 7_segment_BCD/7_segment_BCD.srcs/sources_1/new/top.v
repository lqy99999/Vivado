`timescale 1ns / 1ps


module top( 
    input stop,
    input clk_in,
    output wire [3:0] anode,
    output wire [7:0] cathode
);
   
    wire [7:0] cnt;
    wire [1:0] r_cnt;
    wire clk;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;
    wire [3:0] thousands;
    wire [3:0] digit;
    
    refresh_counter m1(stop, clk_in, cnt, r_cnt, clk);
    anode_control m2(r_cnt, anode);    
    BCD_control m3(clk_in, cnt, ones, tens, hundreds, thousands);
    BCD_2 m4(r_cnt, ones, tens, hundreds, thousands, digit);
    BCD_cathode m5(digit, cathode);
    
    
endmodule
