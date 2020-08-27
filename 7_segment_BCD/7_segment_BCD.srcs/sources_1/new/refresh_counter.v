`timescale 1ns / 1ps

module refresh_counter(
    input stop,
    input clk_in,
    output reg [7:0] cnt,
    output reg [1:0] refresh_counter,
    output reg clk //10M
    );
    
reg [9:0] clk_cnt;
reg [13:0] clk_in_cnt;


initial 
begin
    refresh_counter = 0;
    clk = 0;
    cnt = 0;
    clk_cnt = 0;
    clk_in_cnt = 0;
end

    always@(posedge clk_in)
    begin
        clk_in_cnt <= clk_in_cnt+1;
        if(clk_in_cnt == 14'd20000) //10000 => 10kHz
        begin
            clk <= clk +1;
            clk_in_cnt <= 0;
        end
    end

    always@(posedge clk)
    begin
        refresh_counter <= refresh_counter + 1;
    end
    


    always@(posedge clk)
    begin
        clk_cnt <= clk_cnt + 1;
        if(clk_cnt == 10'd1000)begin // 1000 => every second
            if(cnt == 8'd255)begin
                cnt <= 0;
            end
            else begin
                if(stop) cnt <= cnt;
                else cnt <= cnt + 1;
            end
            clk_cnt <= 0;
        end
        
    end

endmodule
