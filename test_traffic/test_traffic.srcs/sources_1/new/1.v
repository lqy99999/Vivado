`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/16 14:17:51
// Design Name: 
// Module Name: TrafficBoy
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


module TrafficBoy(reset,clk_in,light);
    input reset;
    input clk_in;
    reg [3:0] clk_o;
    reg [1:0] state;
    output reg [2:0] light;
    
    parameter s0 = 2'd0,
              s1 = 2'd1,
              s2 = 2'd2;
    wire clk;
    wire locked;
              
    clk_wiz_0 clk_wiz
   (.clk_out1(clk),
    .reset(reset),
    .locked(locked),
    .clk_in1(clk_in));
                          
    initial begin
        state <= s0; //red
        clk_o <= 0;
        cnt <= 0;
        
    end

    
    always @(state) begin
        case(state)
            s0: light =3'b100;
            s1: light =3'b010;
            s2: light =3'b001;
        endcase
    end

      reg [31:0]cnt = 0;
      
      always @(posedge clk) begin
         cnt <= cnt+1;
        if(cnt == 9999999)begin
            cnt <= 0;
            clk_o <= clk_o+1;
            if(!reset) begin
                case (state)
                    s0: begin if(!(clk_o < 9))begin
                                state <= s1; // green
                                clk_o <= 0;
                              end 
                        end
                        
                    s1:begin if(!(clk_o < 6))begin
                                state <= s2; // yellow
                                clk_o <= 0;
                            end
                       end
                    
                    s2:begin if(!(clk_o < 1))begin
                                state <= s0;
                                clk_o <= 0;
                            end
                       end
                    endcase
                    
            end else begin
                state <= s0;
                clk_o <= 0;
            end
        end
      end
      
endmodule
