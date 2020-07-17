`timescale 1ns / 1ps

module If_id_reg(
    input clk,
    input rst,
    input regwrite,
    input wbsel,
    input [7:0] instrcode,
    output reg [2:0] read_reg1,
    output reg [2:0] read_reg2,
    output reg [2:0] write_reg,
    output reg [2:0] immdata,
    output reg regwriteout,
    output reg wbsel_out
    );
    
    always@(posedge clk)
    begin
        if(rst==0)
        begin
            read_reg1 = instrcode[5:3];
            read_reg2 = instrcode[2:0];
            write_reg = instrcode[5:3];
            immdata = instrcode[2:0];
            regwriteout=regwrite;
            wbsel_out=wbsel;
        end
        else
        begin
            read_reg1 = 0;
            read_reg2 = 0;
            write_reg = 0;
            immdata = 0;
            regwriteout=0;
            wbsel_out=0;
        end
     end
     
endmodule
