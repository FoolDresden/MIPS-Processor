`timescale 1ns / 1ps

module Instfetch(
    input clk,
    input rst,
    output [7:0] instrcode
    );
    
    wire [7:0] newaddr;
    wire [7:0] finaladdr;
    wire [7:0] instraddr;
    wire [7:0] adderout;
    wire [7:0] extended_addr;
    
    
    PC pc(newaddr, clk, rst, instraddr);
    Instrmem instrmem(rst, instraddr, instrcode);
    PCadder pcadder(instraddr, adderout);
    Extend_addr extends_addr(adderout[7:6], instrcode[5:0], extended_addr);
    PCMux pcmux(instrcode[7], extended_addr, adderout, newaddr);
    
endmodule
