module ExtenderSign 
#(
    parameter INPUT_WIDTH = 12,
    parameter OUTPUT_WIDTH = 32
) (
    input [INPUT_WIDTH - 1 : 0] in,
    output [OUTPUT_WIDTH - 1 : 0] out
);

    assign out = { { (OUTPUT_WIDTH - INPUT_WIDTH){ in[INPUT_WIDTH - 1] } }, in };

endmodule