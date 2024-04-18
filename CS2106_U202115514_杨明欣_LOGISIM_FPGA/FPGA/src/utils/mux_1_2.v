module Mux_1_2
#(
    parameter WIDTH = 32
) (
    input [WIDTH - 1 : 0] in1, in2,
    input sel,
    output [WIDTH - 1 : 0] out
);
    reg [WIDTH - 1 : 0] out_t;
    always @(*) begin
        if (sel == 0) out_t = in1;
        else out_t = in2;
    end
    assign out = out_t;
endmodule 