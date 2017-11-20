`timescale 1ns / 1ps

module top(
    input CLK,
    input clr,// 重置显示模块
    input Reset,// 重置CPU的状态，将地址置为0.将按键消抖模块重置
    input button_in, // 显示模块以及显示190分频清零
    input [1:0] select_sign,
    output [3:0] pos_ctrl,
    output [7:0] num_ctrl,
    output test_button
    // output [15:0] out_display_data
);
    assign test_button = button_in;
    // assign out_display_data = display_data;
    
    wire CLK_190hz;
    reg [15:0] display_data;
    wire button_out;

    debouncing my_debouncing(
        .clk(CLK),
        .rst(Reset),
        .key(button_in),// 应该是按键触发低电平
        .key_pulse(button_out)
    );

    wire [15:0] out_sign1;
    wire [15:0] out_sign2;
    wire [15:0] out_sign3;
    wire [15:0] out_sign4;
    
    test my_test( 
        .CLK(button_out),
        .Reset(Reset),
        .out_sign1(out_sign1),
        .out_sign2(out_sign2),
        .out_sign3(out_sign3),
        .out_sign4(out_sign4)       // output some reg
    );

    always@(*) begin
        case(select_sign)
            2'b00: display_data = out_sign1;
            2'b01: display_data = out_sign2;
            2'b10: display_data = out_sign3;
            2'b11: display_data = out_sign4;
        endcase
    end

    clkdiv_190hz my_clkdiv_190hz(//时钟不会因为clr置为1而置零
        .CLK(CLK),
        .clr(clr),
        .CLK_190hz(CLK_190hz)
    );

    displayReg my_displayReg(
        .CLK_190hz(CLK_190hz),
        .disp_data(display_data),
        .clr(clr),
        .pos_ctrl(pos_ctrl),
        .num_ctrl(num_ctrl)
    );
endmodule