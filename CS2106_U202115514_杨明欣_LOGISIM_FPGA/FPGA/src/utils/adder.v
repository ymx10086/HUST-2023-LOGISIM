module Adder 
#(
    parameter WIDTH = 32
) (
    input [WIDTH - 1 : 0] a, b,
    output [WIDTH - 1 : 0] out  // no need to consider the carry   
);
    assign out = a + b;
    
endmodule 