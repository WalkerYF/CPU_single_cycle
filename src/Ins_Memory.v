`timescale 1ns / 1ps

module Ins_Memory(
    input nRD,// 写使能端有效 低电平有�?
    // input [31:0] IDataIn, //  [31:24], [23:16], [15:8], [7:0]
    input [31:0] IAddr,
    output [31:0] IDataOut // [31:24], [23:16], [15:8], [7:0]
);
    reg [7:0] ram [0:240]; 
    // MIPS是大端法
    initial begin
        $readmemh("D:/code/CPU_single_cycle/src/code.mem", ram);
    end
    
    assign IDataOut[7:0] = (nRD==0)?ram[IAddr + 3]:8'bz; 
    assign IDataOut[15:8] = (nRD==0)?ram[IAddr + 2]:8'bz;
    assign IDataOut[23:16] = (nRD==0)?ram[IAddr + 1]:8'bz;
    assign IDataOut[31:24] = (nRD==0)?ram[IAddr]:8'bz;

    // // 时钟下降�???
    // always@(negedge clk) begin 
    //     if( RW==0 ) begin
    //         ram[address] <= writeData[31:24];
    //         ram[address+1] <= writeData[23:16];
    //         ram[address+2] <= writeData[15:8];
    //         ram[address+3] <= writeData[7:0];
    //     end
    // end
endmodule
