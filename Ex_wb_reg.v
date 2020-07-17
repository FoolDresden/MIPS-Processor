`timescale 1ns / 1ps

module Ex_wb_reg(
    input clk, input rst, 
    input [2:0] rs1, input [2:0] rs2,
    input [2:0] rd,
    input [7:0] ext_data,
    input [7:0] aluout,
    input regwrite, input wbsel,
    output reg [2:0] rs1out, output reg [2:0] rs2out,
    output reg [2:0] rdout,
    output reg [7:0] ext_data_out,
    output reg [7:0] aluout_out,
    output reg regwriteout,
    output reg wbsel_out
    );
    
    always@(posedge clk)
    begin
        if(rst==1)
        begin
            rs1out=0;
            rs2out=0;
            rdout=0;
            ext_data_out=0;
            aluout_out=0;
            regwriteout=0;
            wbsel_out=0;
        end
        else
        begin
            rs1out=rs1;
            rs2out=rs2;
            rdout=rd;
            ext_data_out=ext_data;
            aluout_out=aluout; 
            regwriteout=regwrite;
            wbsel_out=wbsel;
        end
    end
endmodule
