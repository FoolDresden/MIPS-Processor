`timescale 1ns / 1ps

module Instrfetch_tb(
    
    );
    reg clk;
    reg rst;
    wire [7:0] instrcode;
    
    Instfetch uut(clk,rst,instrcode);
    
    initial
    begin
    clk=0;
    rst=1;
    #30
    rst=0;
//    #210
//    $finish;
    end
    
    always
    begin
    #20 clk=~clk;
    end
    
    
    
endmodule
