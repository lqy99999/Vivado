`timescale 1ns / 1ps

module seven_controller(
    counter,
    ones,
    tens,
    hundreds,
    thousands,
    digit
    );
input [1:0] counter;
input [3:0] ones;
input [3:0] tens;
input [3:0] hundreds;
input [3:0] thousands;
output reg [3:0] digit;

/* =============================== */
always@(counter)begin
    case(counter)
        2'b00: digit = ones;
        2'b01: digit = tens;
        2'b10: digit = hundreds;
        2'b11: digit = thousands;
    endcase
end

endmodule
