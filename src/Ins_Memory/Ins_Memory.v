`timescale 1ns / 1ps

module Ins_Memory(
    // input nRD,// 读使能端有效 低电平有效
    // input [31:0] IDataIn, //  [31:24], [23:16], [15:8], [7:0]
    input [31:0] IAddr,
    output [31:0] IDataOut // [31:24], [23:16], [15:8], [7:0]
);
    reg [7:0] ram [0:240]; // 指令存储器
    initial begin
        $readmemh("D:/code/CPU_single_cycle/src/code.mem", ram);
    end
    
    // MIPS是大端法
    assign IDataOut[7:0] = ram[IAddr + 3];
    assign IDataOut[15:8] = ram[IAddr + 2];
    assign IDataOut[23:16] = ram[IAddr + 1];
    assign IDataOut[31:24] = ram[IAddr];


endmodule
