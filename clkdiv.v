`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/09 10:15:56
// Design Name: 
// Module Name: clkdiv
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

module clkdiv(
    input wire CLK,
    input wire clr,
    output wire CLK_190hz
);

reg [27:0] q = 0;
always@(posedge CLK or posedge clr) begin
    if (clr == 1)
        q = 0;
    else
        q = q + 1;
end

assign CLK_190hz = q[18];

endmodule // clkdiv
