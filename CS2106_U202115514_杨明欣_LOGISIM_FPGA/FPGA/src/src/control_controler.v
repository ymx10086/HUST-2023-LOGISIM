module ControlControler (
    input [6:0] funct7,
    input [2:0] funct3,
    input [4:0] op_code,
    output reg mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr
);
    always @(funct7, funct3, op_code) begin
        if (funct7 == 'd0 && funct3 == 'd0 && op_code == 'hc) begin  // add
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0100_0000;
        end

        else if (funct7 == 'd32 && funct3 == 'd0 && op_code == 'hc) begin  // sub
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0100_0000;
        end

        else if (funct7 == 'd0 && funct3 == 'd7 && op_code == 'hc) begin  // and
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0100_0000;
        end

        else if (funct7 == 'd0 && funct3 == 'd6 && op_code == 'hc) begin  // or
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b0001000000;
        end

        else if (funct7 == 'd0 && funct3 == 'd2 && op_code == 'hc) begin  // slt
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0100_0000;
        end

        else if (funct7 == 'd0 && funct3 == 'd3 && op_code == 'hc) begin  // sltu
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0100_0000;
        end

        else if (funct3 == 'd0 && op_code == 'h4) begin  // addi
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct3 == 'd7 && op_code == 'h4) begin  // andi
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct3 == 'd6 && op_code == 'h4) begin  // ori
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct3 == 'd4 && op_code == 'h4) begin  // xori
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct3 == 'd2 && op_code == 'h4) begin  // slti
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct7 == 'd0 && funct3 == 'd1 && op_code == 'h4) begin  // slli
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct7 == 'd0 && funct3 == 'd5 && op_code == 'h4) begin  // srli
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct7 == 'd32 && funct3 == 'd5 && op_code == 'h4) begin  // srai
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0000;
        end

        else if (funct3 == 'd2 && op_code == 'h0) begin  // lw
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b10_1100_0000;
        end

        else if (funct3 == 'd2 && op_code == 'h8) begin  // sw
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b01_1001_0000;
        end

        else if (funct7 == 'd0 && funct3 == 'd0 && op_code == 'h1c) begin  // ecall
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0010_0000;
        end

        else if (funct3 == 'd0 && op_code == 'h18) begin  // beq
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0000_1000;
        end

        else if (funct3 == 'd1 && op_code == 'h18) begin  // bne
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0000_0100;
        end

        else if (op_code == 'h1b) begin  // jal
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0100_0010;
        end

        else if (funct3 == 'd0 && op_code == 'h19) begin  // jalr
            {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_1100_0001;
        end

        else {mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr} <= 10'b00_0000_0000;
    end
endmodule