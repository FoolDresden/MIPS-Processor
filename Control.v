`timescale 1ns / 1ps

module Control(
    input [7:0] instrcode,
    output regwrite,
    output wbsel
    );
    
    assign regwrite = ~instrcode[7];
    assign wbsel = instrcode[6];
endmodule
