`timescale 1ns / 1ps

module Extend_data(
    input [2:0] immdata,
    output [7:0] extended_data
    );
    
    wire sign;
    assign sign  = immdata[2];
    wire [5:0]ext_sign;
    assign ext_sign = {5{sign}};
    assign extended_data={ext_sign,immdata};
    
     
endmodule
