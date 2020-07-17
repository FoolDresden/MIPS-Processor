`timescale 1ns / 1ps


module PC(
    input [7:0] newaddr,
    input clk,
    input rst,
    output reg [7:0] instraddr
    );
    
    always@(posedge clk)
    begin
        if(rst==1'b1)
        begin
            instraddr=0;
        end
        else
        begin
            instraddr=newaddr;
        end
    end
    
endmodule
