`timescale 1ns / 1ps

module PCadder(
    input [7:0] addr,
    output [7:0] newaddr
    );
    
    assign newaddr = addr+1;
    
endmodule
