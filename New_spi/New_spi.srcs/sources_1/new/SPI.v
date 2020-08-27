`timescale 1ns / 1ps

module SPI(
    input      clk,
    input      rst,
    
    // SPI port
    output reg  CSN,
    output reg SCLK,
    output reg  MOSI,
    input       MISO,
    
    // Control port
    input            ready,
    input      [7:0] inst,
    input            rdh_wrl, //read=high; write=low
    input      [7:0] reg_addr,
    input      [7:0] dout,
    output reg [7:0] din,
    output reg       din_valid //high: din is ready
);

/*=====================================*/
// SCK generator, 5MHz output
reg         SCLK_en;
reg         SCLK_d;
reg  [7:0]  SCLK_count;
wire        SCLK_posedge;
wire        SCLK_negedge;

always @(posedge clk or posedge rst) begin
	if(rst || ~SCLK_en) begin
		SCLK <= 1'b0;
        SCLK_count <= 8'd0;
	end
	else if(SCLK_en && (SCLK_count<8'd10)) begin
        SCLK_count <= SCLK_count + 8'd1;
	end
    else begin
        SCLK <= ~SCLK;
        SCLK_count <= 8'd0;
    end
end

/*==============Check ready=================*/
always @(posedge clk) begin
    SCLK_d <= SCLK;
end
assign SCLK_posedge = ({SCLK_d, SCLK}==2'b01) ? 1'b1 : 1'b0;
assign SCLK_negedge = ({SCLK_d, SCLK}==2'b10) ? 1'b1 : 1'b0;

// Ready rising edge detection
reg  ready_d;
wire ready_posedge;
always @(posedge clk) begin
    ready_d <= ready;
end
assign ready_posedge = ({ready_d, ready} == 2'b01) ? 1'b1 : 1'b0;

/*==============State machine==============*/ 
reg [3:0] state;
reg [3:0] next_state;
reg [7:0] MOSI_buf;
reg [6:0] MISO_buf;
reg [3:0] counter;

parameter IDLE       = 4'd0;
parameter START      = 4'd1;
parameter INST_OUT   = 4'd2;
parameter ADDR_OUT   = 4'd3;
parameter WRITE      = 4'd4;
parameter READ       = 4'd5;
parameter END        = 4'd6;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end
end


always@(posedge clk)begin
    case(state)
        IDLE:
        begin
            next_state <= START;
            CSN <= 1'b1;
            MOSI <= 1'b0;
            MOSI_buf <= inst;
            MISO_buf <= 7'd0;
            counter <= 4'd0;
            din <= 8'd0;
            din_valid <= 1'b0;
        end
        START:
        begin
            if(ready_posedge)begin
               next_state <= INST_OUT;
               CSN <= 1'b0;
               MOSI_buf <= {inst[6:0], 1'b0};
               MOSI <= inst[7]; 
            end
        end
        INST_OUT:
        begin
            if(counter < 4'd7)begin
                {MOSI, MOSI_buf} <= {MOSI_buf, 1'b0};
                counter <= counter + 4'd1; //Latch
            end
            else begin
                next_state <= ADDR_OUT;
                {MOSI, MOSI_buf} <= {reg_addr, 1'b0};
                counter <= 4'd0;
            end
        end
        ADDR_OUT:
        begin
            if(counter < 4'd7)begin
                {MOSI, MOSI_buf} <= {MOSI_buf, 1'b0};
                counter <= counter + 4'd1;
            end
            else begin
                next_state <= (rdh_wrl)? READ : WRITE;
                {MOSI, MOSI_buf} <= {dout, 1'b0}; // still output 1 bits fo write mode
                counter <= 4'd0;
            end
        end
        WRITE:
        begin
            if(counter < 4'd7)begin
                {MOSI, MOSI_buf} <= {MOSI_buf, 1'b0};
                counter <= counter + 1'd1;
            end
            else begin
                next_state <= END;
                counter <= 4'd0;
                {MOSI, MOSI_buf} <= 9'd0;
            end
        end
        READ:
        begin
            if(counter < 4'd7)begin
                MISO_buf <= {MISO_buf[5:0], MISO};
                counter <= counter + 1'd1;
            end
            else begin
                next_state <= END;
                counter <= 1'd0;
                din <= {MISO_buf, MISO};
                din_valid <= 1'd1;
            end
        end
        END:
        begin
           CSN <= 1'd1;
           next_state <= IDLE;
           din_valid <= 1'd0; 
        end
    endcase
end

/*=====================================*/

endmodule
