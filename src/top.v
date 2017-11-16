`timescale 1ns / 1ps


module CPU_single_cycle(
    input CLK,
    input Reset // 低电平有�?
);

    wire [31:0] PCData;
    wire [31:0] Addr;


    PC mypc(
        .CLK(CLK),
        .Reset(Reset),
        .PCWre(PCwre), // TODO:
        .PCData(PCData), // TODO: 
        .Addr(Addr)
    );

    reg [31:0] Ins_data;

    Ins_Memory ins(
        .IAddr(Addr),
        .IDataOut(Ins_Data)
    );

    reg [5:0] Op_code;
    reg [4:0] Rs_reg;
    reg [4:0] Rt_reg;
    reg [4:0] Rd_reg;
    reg [4:0] Sa_number;
    reg [15:0] Imm_number;
    
    always@(*) begin
        Op_code =  Ins_Data[31:26];// TODO:
        Rs_reg = Ins_Data[25:21];
        Rt_reg = Ins_Data[20:16];
        Rd_reg = Ins_Data[15:11];
        Sa_number = Ins_Data[10:6];
        Imm_number = Ins_Data[15:0];
    end
    

    wire [4:0] Wre_reg;

    mux2to1 mux2to1_1(
        .sel(RegDst),// TODO:
        .DataIn1(Rt_reg),
        .DataIn2(Rd_reg),
        .DataOut(Wre_reg)
    );

    wire [31:0] Re_Data_1;
    wire [31:0] Re_Data_2;
    wire [31:0] Wre_back_data;

    RegFile myregfile(
        .CLK(CLK),
        .RegWre(RegWre), // TODO:
        .ReadReg1(Rs_reg),
        .ReadReg2(Rt_reg),
        .WriteReg(Wre_reg),
        .WriteData(Wre_back_data), // TODO:
        .ReadData1(Re_Data_1),
        .ReadData1(Re_Data_2),
        .RST(Reset)
    );

    // Re_Data_1
    // Re_Data_2
    // Sa_number
    // Imm_number
    // TODO:
    wire [31:0] Ext_Sa_number = {27'b000000000000000000000000000, Sa_number};

    Extend MY_Extend(
        .Extsel(Extsel), // TODO:
        .DataIn(Imm_number),
        .DataOut(Ext_Imm_number)
    );

    wire [31:0] ALU_a;
    wire [31:0] ALU_b;


    mux2to1 Select_ALU_srcA(
        .sel(ALUSrcA), // TODO:
        .DataIn1(Re_Data_1),
        .DataIn2(Ext_Sa_number),
        .DataOut(ALU_a)
    );

    mux2to1 Select_ALU_srcB(
        .sel(ALUSrcB),  // TODO:
        .DataIn1(Re_Data_2),
        .DataIn2(Ext_Imm_number),
        .DataOut(ALU_b)
    );

    wire [31:0] ALU_result;
    wire sign;
    wire zero;

    ALU32 My_ALU32(
        .ALUopcode(ALUopcode), // TODO:
        .rega(ALU_a),
        .regb(ALU_b),
        .result(ALU_result),
        .sign(sign),// TODO:
        .zero(zero) // TODO:
    );

    wire [31:0] Re_Mem_Data;

    Data_Memory MY_Data_Memory(
        .CLK(CLK),
        .DAddr(ALU_result),
        .DataIn(Re_Data_2),
        .nRD(RD),// TODO:
        .nWR(WR), // TODO:
        .Dataout(Re_Mem_Data)
    );

    

    mux2to1 Select_Wre_back_data(
        .sel(DBDataSrc), // TODO:
        .DataIn1(ALU_result),
        .DataIn2(Re_Mem_Data),
        .DataOut(Wre_back_data)
    );

    // PC
    // PC+4
    // PC+4+偏移�?
    // PC+4与地�?拼接
    wire [31:0] PC4 = Addr+4;
    wire [31:0] PC4_move = PC4+(Ext_Imm_number << 2);
    wire [31:0] PC4_jump = {PC4[31:28], Ext_Imm_number,2'b00};

    mux4to1 My_mux4to1(
        .sel(PCSrc), // TODO:
        .DataIn1(PC4),
        .DataIn2(PC4_move),
        .DataIn3(PC4_jump),
        .DataOut(PCData)
    );

endmodule
