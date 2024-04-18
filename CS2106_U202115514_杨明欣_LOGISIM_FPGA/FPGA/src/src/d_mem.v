module DMem (
    input [9:0] addr,
    input [31:0] mem_in,
    input store, load, clr, clk,
    output reg[31:0] dout
);
    reg [31:0] mem[2**11 - 1 : 0];
    integer i;

    initial begin
        for (i = 0; i < 2**11; i = i + 1) begin
            mem[i] = 32'b0;
        end
    end
    
    always @(posedge clk) begin
        // if (clr) mem =  TODO: how to set 0?
        if (store) mem[addr] <= mem_in;
    end

    always @(*) begin  // note: read memory don't need clk signal
        if (clr) begin
            for (i = 0; i < 2**11; i = i + 1) begin
                mem[i] = 32'b0;
            end
        end
        if (load) dout <= mem[addr];
    end
endmodule