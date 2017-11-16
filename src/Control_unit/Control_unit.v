`timescale 1ns / 1ps

module Control_unit(
    input [5:0] Opcode,
    input zero,
    input sign,
    output reset,// 0 pc=0 1 pc接受新地址
    output ALUsrcA,
    output ALUsrcB,
    output DBDataSrc,
    output RegWre,
    output InsMemRW,
    output RD, // 读数据存储器
    output WD, // 写数据存储器
    output RegDst,// 写寄存器选择
    output ExtSel,// 0扩展符号拓展
    output [1:0] PCsrc, // 选择PC输入端 
    output [2:0] ALUop // ALU八种功能的说明
);


endmodule