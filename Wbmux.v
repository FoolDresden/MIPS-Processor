`timescale 1ns / 1ps

module Wbmux(
    input wbsel,
    input [7:0] aludata,
    input [7:0] extdata,
    output reg [7:0] seldata
    );
    
    always@(wbsel,extdata,extdata)
    begin
        if(wbsel==0)
        begin
            seldata=extdata;
        end
        else
        begin
            seldata=aludata;
        end
    end
endmodule
