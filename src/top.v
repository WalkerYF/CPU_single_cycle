`timescale 1ns / 1ps

module top(
    input CLK,
    input clr,
    input Reset,
    input button,
    input [1:0] select_reg,
    output [3:0] pos_ctrl,
    output [7:0] num_ctrl
);

    wire CLK_190hz;
    reg [15:0] display_data;

    CPU_top my_cpu(
        .CLK(button),
        .Reset(Reset)
        // output some reg
    );

    clkdiv_190hz my_clkdiv_190hz(
        .CLK(CLK),
        .clr(clr),
        .CLK_190hz(CLK_190hz)
    );

    displayReg my_displayReg(
        .CLK_190hz(CLK_190hz),
        .disp_data(display_data),
        .nclr(clr),
        .pos_ctrl(pos_ctrl),
        .num_ctrl(num_ctrl)
    );



    always@(*) begin
        display_data = 16'habc7;
    end

endmodule