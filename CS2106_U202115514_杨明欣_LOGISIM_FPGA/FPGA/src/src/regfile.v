module RegFile (
    input [31:0] din,
    input [4:0] r1_addr, r2_addr, w_addr,
    input clk, write_en,
    output [31:0] r1, r2
);
    reg [31:0] regfile[31:0];
    integer i;
    
    initial begin
        for(i = 0; i <= 31; i = i + 1) begin
            regfile[i] = 32'b0;
        end
    end

    assign r1 = regfile[r1_addr];
    assign r2 = regfile[r2_addr];

    always @(posedge clk) begin
        if (write_en && w_addr != 0) regfile[w_addr] <= din;
    end

    // always @(r1_addr, r2_addr) begin
    //     r1 <= regfile[r1_addr];
    //     r2 <= regfile[r2_addr];
    // end
endmodule