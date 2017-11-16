`timescale 1ns / 1ps
// 注意时钟上升沿还是下降沿触发
module PC(
    input CLK,
    input Reset,// 0 初始化PC�?0�? 1 接受新地�?
    input PCWre,// 0 不更�?  1 更改
    input [31:0] PCData,
    output reg [31:0] Addr
);
    always@(posedge CLK) begin
        if(Reset == 0)
            Addr = 0;
        else begin 
            if (PCWre == 0)
                Addr = Addr;
            else 
                Addr = PCData;
        end
    end
endmodule

