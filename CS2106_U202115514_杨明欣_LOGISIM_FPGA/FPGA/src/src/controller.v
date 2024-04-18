module Controller (
    input [6:0] funct7,
    input [2:0] funct3,
    input [4:0] op_code,
    output [3:0] op,
    output mem_to_reg, mem_write, alu_src, reg_write, ecall, s_type, beq, bne, jal, jalr
);

    ArithController arith_controller(
        .funct7     (funct7),
        .funct3     (funct3),
        .op_code    (op_code),
        .op         (op)
    );

    ControlControler control_controller(
        .funct7         (funct7),
        .funct3         (funct3),
        .op_code        (op_code),
        .mem_to_reg     (mem_to_reg),
        .mem_write      (mem_write),
        .alu_src        (alu_src),
        .reg_write      (reg_write),
        .ecall          (ecall),
        .s_type         (s_type),
        .beq            (beq),
        .bne            (bne),
        .jal            (jal),
        .jalr           (jalr)
    );
endmodule