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




module debouncing (
    clk,
    rst,// 低电平有�?
    key,
    key_pulse
);


    parameter       N  =  1;                      //要消除的按键的数�?
 
	input             clk;
        input             rst;
        input 	[N-1:0]   key;                        //输入的按�?					
	output  [N-1:0]   key_pulse;                  //按键动作产生的脉�?	
 
        reg     [N-1:0]   key_rst_pre;                //定义�?个寄存器型变量存储上�?个触发时的按键�??
        reg     [N-1:0]   key_rst;                    //定义�?个寄存器变量储存储当前时刻触发的按键�?
 
        wire    [N-1:0]   key_edge;                   //�?测到按键由高到低变化是产生一个高脉冲
 
        //利用非阻塞赋值特点，将两个时钟触发时按键状�?�存储在两个寄存器变量中
        always @(posedge clk  or  negedge rst)
          begin
             if (!rst) begin
                 key_rst <= {N{1'b1}};                //初始化时给key_rst赋�?�全�?1，{}中表示N�?1
                 key_rst_pre <= {N{1'b1}};
             end
             else begin
                 key_rst <= key;                     //第一个时钟上升沿触发之后key的�?�赋给key_rst,同时key_rst的�?�赋给key_rst_pre
                 key_rst_pre <= key_rst;             //非阻塞赋值�?�相当于经过两个时钟触发，key_rst存储的是当前时刻key的�?�，key_rst_pre存储的是前一个时钟的key的�??
             end
           end
 
        assign  key_edge = key_rst_pre & (~key_rst);//脉冲边沿�?测�?�当key�?测到下降沿时，key_edge产生�?个时钟周期的高电�?
 
        reg	[17:0]	  cnt;                       //产生延时�?用的计数器，系统时钟12MHz，要延时20ms左右时间，至少需�?18位计数器     
 
        //产生20ms延时，当�?测到key_edge有效是计数器清零�?始计�?
        always @(posedge clk or negedge rst)
           begin
             if(!rst)
                cnt <= 18'h0;
             else if(key_edge)
                cnt <= 18'h0;
             else
                cnt <= cnt + 1'h1;
             end  
 
        reg     [N-1:0]   key_sec_pre;                //延时后检测电平寄存器变量
        reg     [N-1:0]   key_sec;                    
 
 
        //延时后检测key，如果按键状态变低产生一个时钟的高脉冲�?�如果按键状态是高的话说明按键无�?
        always @(posedge clk  or  negedge rst)
          begin
             if (!rst) 
                 key_sec <= {N{1'b1}};                
             else if (cnt==18'h3ffff)
                 key_sec <= key;  
          end
       always @(posedge clk  or  negedge rst)
          begin
             if (!rst)
                 key_sec_pre <= {N{1'b1}};
             else                   
                 key_sec_pre <= key_sec;             
         end      
       assign  key_pulse = key_sec_pre & (~key_sec);     
 
endmodule