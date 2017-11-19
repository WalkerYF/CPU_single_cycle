`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 10:33:48
// Design Name: 
// Module Name: debouncing
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


module debouncing(
    input in_button,
    output reg out_button
    );
    always@(*) begin
        out_button = in_button;
    end
endmodule


//module RMV_BJ (
//BJ_CLK, //采集时钟，40Hz
//RESET, //系统复位信号
//BUTTON_IN, //按键输入信号
//BUTTON_OUT //消抖后的输出信号
//);
//input B_CLK;
//input RESET;
//input BUTTON_IN;
//output BUTTON_OUT;
//reg BUTTON_IN_Q, BUTTON_IN_2Q, BUTTON_IN_3Q;
//always @(posedge BJ_CLK or negedge RESET)
//begin
//if(~RESET)
//begin
//BUTTON_IN_Q <= 1'b1;
//BUTTON_IN_2Q <= 1'b1;
//BUTTON_IN_3Q <= 1'b1;
//end
//else
//begin
//BUTTON_IN_Q <= BUTTON_IN;
//BUTTON_IN_2Q <= BUTTON_IN_Q;
//BUTTON_IN_3Q <= BUTTON_IN_2Q;
//end
//end
//wire BUTTON_OUT = BUTTON_IN_2Q | BUTTON_IN_3Q;
//endmodule
