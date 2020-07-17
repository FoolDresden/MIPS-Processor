`timescale 1ns / 1ps

module ALUmux(
    input [7:0] fwd_data,
    input [7:0] data,
    input sel,
    output reg [7:0] sel_data
    );
    
    always@(sel, fwd_data, data)
    begin
        if(sel==1)
        begin
            sel_data=fwd_data;
        end
        else
        begin
            sel_data=data;
        end
    end
endmodule
