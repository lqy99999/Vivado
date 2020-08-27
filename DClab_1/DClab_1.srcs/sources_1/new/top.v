`timescale 1ns / 1ps

module top(
    clk,
    reset,
    button,
    cathode,
    anode
    );
input clk;
input reset;
input button; // restart

output wire [7:0] cathode;
output wire [3:0] anode;

/* =============================== */
wire [1:0] counter;
wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hundreds;
wire [3:0] thousands;
wire [3:0] digit;
wire clk_10k;
wire [7:0] number;

/* =============================== */
controller controller_1(reset, clk_10k, counter);
Binary_to_BCD bcd_1(reset, clk, number, ones, tens, hundreds, thousands);
counter_10k counter_1(reset, clk, clk_10k);

seven_controller seven_1(counter, ones, tens, hundreds, thousands, digit);
Cathode cathode_1(digit, cathode);
Anode anode_1(counter, anode);
/* =============================== */
state state_1(clk_10k, reset, button, number);
       
endmodule
