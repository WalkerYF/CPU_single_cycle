`timescale 1ns / 1ps

module Ins_memory_tb(
);

    reg [31:0] addr;
    reg nRD;
    wire [31:0] ins;
    Ins_Memory ins_mem(
        .IAddr(addr),
        .IDataOut(ins),
        .nRD(nRD)
    );

    initial begin
        nRD = 0;
        #10 
        addr = 0;
        #10
        addr = 4;
    end
endmodule
