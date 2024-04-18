module PCSelector (
    input jal, jalr, branch,
    input [31:0] pc_next_0, pc_next_1, pc_next_2, pc_next_3,
    output reg [31:0] pc_next
);
    always @(*) begin
        if (branch) pc_next = pc_next_1;
        else if (jal) pc_next = pc_next_2;
        else if (jalr) pc_next = pc_next_3;
        else pc_next = pc_next_0;
    end
    
endmodule