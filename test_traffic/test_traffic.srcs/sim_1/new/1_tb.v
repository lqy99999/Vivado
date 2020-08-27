`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/16 14:35:13
// Design Name: 
// Module Name: TrafficBoy_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TrafficBoy_tb();
   reg reset;
   reg clk_in;
   wire [3:0] clk_o;
   wire [1:0] state;
   wire [2:0] light;
   
   
   TrafficBoy t1(reset,clk_in,light);
   
   initial begin
       reset = 0;
       clk_in = 0;
   end
   
   always #4 begin
       clk_in = clk_in + 1;
   end
   


endmodule
