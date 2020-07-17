`timescale 1ns / 1ps

module PCMux(
    input sel,
    input [7:0] jaddr,
    input [7:0] nxtaddr,
    output reg [7:0] newaddr
    );
    
    always@(sel, jaddr, nxtaddr)
    begin
        if(sel==1'b1)
        begin
            newaddr = jaddr;
        end
        else
        begin
            newaddr = nxtaddr;
        end
    end
endmodule
