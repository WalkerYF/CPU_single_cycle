`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 09:50:55
// Design Name: 
// Module Name: RegFile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegFile(
    input CLK, 
    input RegWre,// 寄存器写使能端
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg, // 写寄存器号
    input [31:0] WriteData, // 写寄存器的数据
    output [31:0] ReadData1,
    output [31:0] ReadData2,
    input RST // 清零，重置
);
    reg [31:0] regFile[1:31]; // 寄存器定义必须用 reg 类型
    integer i;
    assign   ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1]; // 读寄存器数据 // 可随时读
    assign   ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];

    always @ (negedge CLK or negedge RST) begin   // 必须用时钟边沿触发 // 时钟下降沿
        if (RST==0) begin
            for(i=1;i<32;i=i+1) regFile[i] <= 0;
        end
        else if(RegWre == 1 && WriteReg != 0) // WriteReg != 0，$0 寄存器不能修改
            regFile[WriteReg] <= WriteData;  // 写寄存器
    end
endmodule

