`timescale 1ns / 1ps

module Proc_tb(
    
    );
    
    reg clk;
    reg rst;
    
    Proc uut(clk, rst);
    
    initial begin
        clk=0;
        rst=1;
        #30
        rst=0;
        #160
        $finish;
    end
    
    always
    begin
        #10 clk=~clk;
    end
endmodule
