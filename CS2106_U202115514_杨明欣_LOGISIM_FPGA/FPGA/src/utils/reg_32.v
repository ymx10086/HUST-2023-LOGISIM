module register(
    input clk, rst, en,
    input [31:0] din, 
    output reg [31:0] dout
);
    initial dout = 'b0;
	always @(posedge clk or negedge rst) begin
        if (rst) dout <= 0;
        else if (en) dout <= din;
        else dout <= dout;
	end
endmodule