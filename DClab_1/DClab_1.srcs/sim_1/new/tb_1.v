`timescale 1ns / 1ps

//test top.v
module tb_1();

reg clk;
reg reset;
reg button;
wire [7:0] cathode;
wire [3:0] anode;

top m1(
    .clk    (clk),
    .reset  (reset),
    .button (button),
    .cathode(cathode),
    .anode  (anode)
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
