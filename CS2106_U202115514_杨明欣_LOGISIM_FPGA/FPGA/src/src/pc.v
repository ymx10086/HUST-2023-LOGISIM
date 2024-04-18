module PC (
    input [31:0] pc_in,
    input clk, rst, pause,
    output [31:0] pc_out
);
    register reg_32(
        .clk    (clk),
        .rst    (rst),
        .en     (~pause),  // when en == 0, register are ineffective
        .din    (pc_in), 
        .dout   (pc_out)
    );
endmodule