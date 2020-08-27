`timescale 1ns / 1ps

module counter_10k(
    reset,
    clk,
    clk_10k
    );
    
input clk;
input reset;
output reg clk_10k;

/* =============================== */
wire clk_10m;
wire locked;
reg [8:0] clk_cnt;

/* =============================== */
clk_wiz_0 clk_wiz_1
(
.clk_out1(clk_10m),            
.reset(reset), 
.locked(locked),
.clk_in1(clk)
);

/* =============================== */
always@(posedge clk_10m)begin
    if(reset)begin
        clk_cnt <= 9'd0;
        clk_10k <= 1'd0;
    end
    else begin
        if(clk_cnt == 9'd499)begin
            clk_10k = clk_10k + 1;
            clk_cnt = 9'd0;
        end
        else clk_cnt = clk_cnt + 9'd1;
    end
end



endmodule
