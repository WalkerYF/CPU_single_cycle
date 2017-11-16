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
    input RegWre,// �Ĵ���дʹ�ܶ�
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg, // д�Ĵ�����
    input [31:0] WriteData, // д�Ĵ���������
    output [31:0] ReadData1,
    output [31:0] ReadData2,
    input RST // 低电平有效 
);
    reg [31:0] regFile[1:31]; // 
    integer i;
    assign   ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1]; // ���Ĵ������� // ����ʱ��
    assign   ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];

    always @ (negedge CLK or negedge RST) begin   // ������ʱ�ӱ��ش��� // ʱ���½���
        if (RST==0) begin
            for(i=1;i<32;i=i+1) regFile[i] <= 0;
        end
        else if(RegWre == 1 && WriteReg != 0) // WriteReg != 0��$0 �Ĵ��������޸�
            regFile[WriteReg] <= WriteData;  // д�Ĵ���
    end
endmodule

