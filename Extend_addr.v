`timescale 1ns / 1ps

module Extend_addr(
    input [1:0] adderoutmsb,
    input [5:0] const,
    output [7:0] extended_addr
    );
    
    assign extended_addr = {adderoutmsb, const};
endmodule
