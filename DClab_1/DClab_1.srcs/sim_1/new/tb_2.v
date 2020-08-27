`timescale 1ns / 1ps

// test random_number.v
module tb_2();
   
reg clk;
reg reset;
wire [7:0] number;

random_number random1(
    .clk    (clk),
    .reset  (reset),
    .number (number)
    );


initial begin
    clk <= 0;
    reset <= 1;
    #100 reset <= 0;
end

//100M
always #5 begin
    clk = ~clk;
end

endmodule
