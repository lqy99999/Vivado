`timescale 1ns / 1ps

module state(
    clk,
    reset,
    button,
    o_number
    );
input clk;
input reset;
input button;
output reg [7:0] o_number;

/* =============================== */
reg [1:0] state;
reg [1:0] next_state;
reg [22:0] cnt;
reg [22:0] next_cnt;
reg [7:0] number;

parameter idle = 2'd0, s1 = 2'd1, s2 = 2'd2, s3 = 2'd3;
parameter run_times = 23'd5000000;

//multiple 5
//parameter run_20 = 10'd10;
//parameter run_10 = 10'd15;
//parameter run_5 = 10'd20;

/* ============number=================== */
wire [12:0] rnd;
LFSR lfsr_1(clk, reset, rnd);

/* =============================== */
always@(posedge clk or posedge reset)begin
    if(reset)begin
        state <= idle;
        cnt <= 23'd0;
        o_number <= 8'd0;
    end
    else begin
        state <= next_state;
        cnt <= next_cnt;
        o_number <= number;
    end
end

/* blocking */
/* ==========Conbinational circuit=========== */
always@(*)begin
    case(state)
        idle:
            if(button)begin
                next_state = s1;
                next_cnt = 23'd0;
                number = 8'd0;
            end
            else begin
                next_state = idle;
                next_cnt = 23'd0;
                number = 8'd0;
            end
        s1:
            if(cnt == run_times)begin
            //20HZ
                next_cnt = 23'd0;
                next_state = s2;
            end
            else begin
                next_cnt = cnt + 23'd1;
                if(cnt % 5 == 23'd0)begin
                    number = rnd[7:0] % 15;
                end
            end
        s2:
            if(cnt == run_times)begin
            //10HZ
                next_cnt = 23'd0;
                next_state = s3;
            end
            else begin
                next_cnt = cnt + 23'd1;
                if(cnt % 10 == 23'd0)begin
                    number = rnd[7:0] % 15;
                end
            end
        s3:
            if(cnt == run_times)begin
            //5HZ
                next_cnt = 23'd0;
                next_state = idle;
            end
            else begin
                next_cnt = cnt + 23'd1;
                if(cnt % 20 == 23'd0)begin
                    number = rnd[7:0] % 15;
                end
            end
    endcase
end


endmodule
