`timescale 1ns / 1ps

module ALU(
    input [7:0] data1,
    input [7:0] data2,
    output [7:0] aluout
    );
    
    assign aluout = data1+data2;
    
endmodule
