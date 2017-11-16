`timescale 1ns / 1ps

module Control_unit(
    input [5:0] Opcode,
    input zero,
    input sign,
    output reset,// 0 pc=0 1 pc接受新地�?
    output ALUsrcA,
    output ALUsrcB,
    output DBDataSrc,
    output PCWre,
    output RegWre,
    output InsMemRW,
    output RD, // 读数据存储器
    output WD, // 写数据存储器
    output RegDst,// 写寄存器选择
    output ExtSel,// 0扩展符号拓展
    output [1:0] PCsrc, // 选择PC输入�? 
    output [2:0] ALUop // ALU八种功能的说�?
);
    always@(*)
    begin
        case(Opcode)
            6'b000000: begin
                PCWre <= 1;
                // InsMemRW <= 1;
                RegDst <= 1;
                RegWre <= 1;
                ALUsrcA <= 0;
                ALUsrcB <= 0;
                ALUop <= 3'b000;
                DBDataSrc <= 0;
                // ExtSel <= ;
                // RD
                // WD
                PCSrc <= 0;
            end
            6'b000001: begin
                PCWre <= 1;
                // InsMemRW <= 1;
                RegDst <= 0;
                RegWre <= 1;
                ALUsrcA <= 0;
                ALUsrcB <= 0;
                ALUop <= 3'b000;
                DBDataSrc <= 0;
                ExtSel <= 1; // 符号拓展
                // RD
                // WD
                PCSrc <= 0;
            end
            6'b000010: begin
                PCWre <= 1;
                // InsMemRW <= 1;
                RegDst <= 1;
                RegWre <= 1;
                ALUsrcA <= 0;
                ALUsrcB <= 0;
                ALUop <= 3'b001;
                DBDataSrc <= 0;
                // ExtSel <= ;
                // RD
                // WD
                PCSrc <= 0;
            end

            6'b010000: begin
                PCWre <= 1;
                // InsMemRW <= 1;
                RegDst <= 0;
                RegWre <= 1;
                ALUsrcA <= 0;
                ALUsrcB <= 0;
                ALUop <= 3'b011;
                DBDataSrc <= 0;
                ExtSel <= 0; // 0拓展
                // RD
                // WD
                PCSrc <= 0;
            end
            6'b010001: begin
                PCWre <= 1;
                // InsMemRW <= 1;
                RegDst <= 1;
                RegWre <= 1;
                ALUsrcA <= 0;
                ALUsrcB <= 0;
                ALUop <= 3'b100;
                DBDataSrc <= 0;
                // ExtSel <= ;
                // RD
                // WD
                PCSrc <= 0;
            end
            6'b010010: begin
                PCWre <= 1;
                // InsMemRW <= 1;
                RegDst <= 1;
                RegWre <= 1;
                ALUsrcA <= 0;
                ALUsrcB <= 0;
                ALUop <= 3'b011;
                DBDataSrc <= 0;
                // ExtSel <= ;
                // RD
                // WD
                PCSrc <= 0;
            end
            6'b011000: begin
                PCWre <= 1;
                // InsMemRW <= 1;
                RegDst <= 1;
                RegWre <= 1;
                ALUsrcA <= 1;// Sa_number
                ALUsrcB <= 0;
                ALUop <= 3'b010;
                DBDataSrc <= 0;
                // ExtSel <= ;
                // RD
                // WD
                PCSrc <= 0;
            end
            6'b111111: begin
                PCWre <= 0;
                // InsMemRW <= 1;
                // RegDst <= 0;
                // RegWre <= 1;
                // ALUsrcA <= 0;
                // ALUsrcB <= 0;
                // ALUop <= 3'b011;
                // DBDataSrc <= 0;
                // ExtSel <= 0; // 0拓展
                // RD
                // WD
                // PCSrc <= 0;
            end
            defulat: PCWre <= 0;
        endcase
    end

endmodule