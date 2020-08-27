`timescale 1ns / 1ps

module anode_control(
    input [1:0]refresh_counter,
    output reg [3:0] anode
    );


    initial 
    begin
        anode = 4'b1110;
    end
    
    always@(refresh_counter)
    begin
        case(refresh_counter)
            2'b00:begin
                    anode = 4'b1110;
                  end
            2'b01:begin
                    anode = 4'b1101;
                  end
            2'b10:begin
                    anode = 4'b1011;
                  end
            2'b11:begin
                    anode = 4'b0111;
                  end
        endcase
        
    end
        
         
endmodule
