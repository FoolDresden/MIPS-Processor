`timescale 1ns / 1ps

module Regfile(
    input clk,
    input rst,
    input [2:0] read_reg1,
    input [2:0] read_reg2,
    input [2:0] write_reg,
    input [7:0] write_data,
    input regwrite,
    output [7:0] read_data1,
    output [7:0] read_data2
    );  
    reg [7:0] mem[7:0];
    //Read data independent of clock cyle
    assign read_data1 = mem[read_reg1];
    assign read_data2 = mem[read_reg2];
    //Write independent of clock cycle
    always@(regwrite, write_reg, write_data)
    begin
        if(regwrite==1)
        begin
            mem[write_reg]=write_data;
        end
    end
    //For reset 
    always@(posedge clk)
    begin
        if(rst==1)
        begin
            mem[0]=1;
            mem[1]=2;
            mem[2]=3;
            mem[3]=4;
            mem[4]=5;
            mem[5]=6;
            mem[6]=7;
            mem[7]=8;
        end
    end
endmodule
