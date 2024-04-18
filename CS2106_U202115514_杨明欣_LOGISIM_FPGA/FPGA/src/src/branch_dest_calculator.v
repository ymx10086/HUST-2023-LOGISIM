module BranchDestCalculator (
    input [11:0] imm_B,
    input [31:0] cur_pc,
    output [31:0] next_pc
);
    wire [31:0] imm_B_32_, imm_B_32;


    ExtenderSign #(.INPUT_WIDTH(12), .OUTPUT_WIDTH(32)) ext(
        .in     (imm_B),
        .out    (imm_B_32_)
    );

    ShifterLeft #(.WIDTH(32)) shifter(
        .in     (imm_B_32_),
        .shift  ('b0_0001),
        .out    (imm_B_32)
    );

    Adder #(.WIDTH(32)) adder(
        .a(imm_B_32),
        .b(cur_pc),
        .out(next_pc)
    );
    
endmodule