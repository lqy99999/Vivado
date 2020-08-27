`timescale 1ns / 1ps

module controller(
    reset,
    clk, //10k
    counter
    );

input reset;
input clk;
output reg [1:0] counter;

/* ===========Sequential circuits============ */
always@(posedge clk or posedge reset)begin
    if(reset)begin
        counter <= 2'd0;
    end
    else begin
        counter = counter + 2'd1;
    end
end


endmodule
