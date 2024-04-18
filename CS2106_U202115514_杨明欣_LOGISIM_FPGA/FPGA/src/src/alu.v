module Alu (
    input [31:0] a, b,
    input [3:0] op,
    output reg[31:0] result1, result2,
    output eq, 
    output reg greater_eq, lesser
);
    initial begin
        result1 <= 32'b0;
        result2 <= 32'b0;
    end
    
    assign eq = (a == b);

    always@(a, b, op) begin
        case(op)
            4'b0000: begin
                result1 = a << b[4:0];
                result2 = 0;
            end
            4'b0001: begin
                result1 = ($signed(a)) >>> b[4:0];
                result2 = 0;
            end
            4'b0010: begin
                result1 = a >> b[4:0];
                result2 = 0;
            end
            4'b0011: {result2, result1} = a * b;
            4'b0100: begin
                result1 = a / b;
                result2 = a % b;
            end
            4'b0101: begin
                result1 = a + b;
            end
            4'b0110: begin
                result1 = a - b;
            end
            4'b0111: result1 = a & b;
            4'b1000: result1 = a | b;
            4'b1001: result1 = a ^ b;
            4'b1010: result1 = ~(a | b);
            4'b1011: begin
                result1 = ($signed(a) < $signed(b)) ? 1 : 0;
                lesser = (result1==1) ? 1 : 0;
                greater_eq = ~lesser;
            end
            4'b1100: begin
                result1 = (a<b) ? 1 : 0;
                lesser = (result1==1) ? 1 : 0;
                greater_eq = ~lesser;
            end
        endcase
        
    end
endmodule