`timescale 1ns / 1ps

//test state.v 
module tb_3();

reg clk;
reg reset;
reg button;
wire [7:0] o_number;

state state1(
    .clk    (clk),
    .reset  (reset),
    .button (button),
    .o_number(o_number)
    );
    
initial begin
        clk <= 0;
        button <= 0;
        reset <= 1;
        #100 reset <= 0;
        #1000 button <= 1;
        #1001 button <= 0;
end 

//100M
always #5 begin
    clk = ~clk;
end
  
endmodule
