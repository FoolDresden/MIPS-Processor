`timescale 1ns / 1ps

module Forward(
    input [2:0] rd,
    input [2:0] rs1,
    input [2:0] rs2,
    input regwrite,
    output reg sel1,
    output reg sel2
    );
    always@(rd,rs1,rs2,regwrite)
    begin
        if(regwrite==1)
        begin
            if(rd==rs1)
            begin
                sel1=1;
            end
            else
            begin
                sel1=0;
            end
            if(rd==rs2)
            begin
                sel2=1;
            end
            else
            begin
                sel2=0;
            end
        end
        else
        begin
            sel1=0;
            sel2=0;
        end
    end
    
endmodule
