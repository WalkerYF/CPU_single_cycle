`timescale 1ns / 1ps

module mux2to1(
    input sel,
    input [31:0] DataIn1,
    input [31:0] DataIn2,
    output [31:0] DataOut
);
    assign  DataOut = (sel == 0)?DataIn1:DataIn2; 
endmodule