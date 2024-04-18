module JalDestCalculator (
    input [19:0] imm_J,
    input [31:0] cur_pc,
    output [31:0] next_pc
);
    wire [31:0] imm_J_32_, imm_J_32;


    ExtenderSign #(.INPUT_WIDTH(20), .OUTPUT_WIDTH(32)) ext(
        .in     (imm_J),
        .out    (imm_J_32_)
    );

    ShifterLeft #(.WIDTH(32)) shifter(
        .in     (imm_J_32_),
        .shift  ('b0_0001),
        .out    (imm_J_32)
    );

    Adder #(.WIDTH(32)) adder(
        .a(imm_J_32),
        .b(cur_pc),
        .out(next_pc)
    );
    
endmodule