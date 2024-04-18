module ShifterLeft #(
    parameter WIDTH = 32
) (
    input [WIDTH - 1 : 0] in,
    input [4:0] shift,  // max shift bits: 32
    output [WIDTH - 1 : 0] out
);
    assign out = in << shift;
endmodule