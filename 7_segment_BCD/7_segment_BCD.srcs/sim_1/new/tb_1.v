`timescale 1ns / 1ps

module tb_1();
    reg clk_in;
    wire [7:0] cnt;
    wire [1:0] r_cnt;
    wire clk;
    wire [3:0] anode;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;
    wire [3:0] thousands;
    wire [3:0] digit;
    wire [7:0] cathode;
    
    refresh_counter m1(clk_in, cnt, r_cnt, clk);
    anode_control m2(r_cnt, anode);    
    BCD_control m3(clk_in, cnt, ones, tens, hundreds, thousands);
    BCD_2 m4(r_cnt, ones, tens, hundreds, thousands, digit);
    BCD_cathode m5(digit, cathode);
    
    
    initial begin
        clk_in = 0;
    end
    
    always #10 begin
        clk_in <= clk_in + 1;
    end
    
endmodule
