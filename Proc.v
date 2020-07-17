`timescale 1ns / 1ps
module Proc(
    input clk,
    input rst
    );
    
    wire [7:0] instrcode;
    wire regwrite;
    wire wbsel;
    wire [2:0] read_reg1;
    wire [2:0] read_reg2;
    wire [2:0] write_reg;
    wire [2:0] immdata;
    wire regwriteout;
    wire wbsel_out;
    wire [2:0] write_reg_last;
    wire [7:0] wb_data;
    wire regwrite_last;
    wire [7:0] read_data1;
    wire [7:0] read_data2;
    wire [7:0] extended_data;
    wire [2:0] rs1out;
    wire [2:0] rs2out;
    wire [2:0] rdout;
    wire [7:0] ext_data_out;
    wire [7:0] data1out;
    wire [7:0] data2out;
    wire regwriteout2;
    wire wbselout2;
    wire [7:0] fwd_data;
    wire [7:0] sel_src1;
    wire sel1;
    wire [7:0] sel_src2;
    wire sel2;
    wire [7:0] aluout;
    wire [2:0] rs1out2;
    wire [2:0] rs2out2;
    wire [2:0] rdout2;
    wire [7:0] ext_data_out2;
    wire [7:0] aluout_out;
    wire regwriteout3;
    wire wbselout3;
    
    // Instruction fetch unit        
    Instfetch instrfetch(clk, rst, instrcode);
    // Control unit taking instruction code as input
    Control control(instrcode, regwrite, wbsel);
    // IF/ID pipeline register  
    If_id_reg ifidreg(clk, rst, regwrite, wbsel, instrcode, read_reg1, read_reg2, write_reg, immdata, regwriteout, wbsel_out);
    // Register memory instantiation
    Regfile regfile(clk, rst, read_reg1, read_reg2, rdout2, wb_data, regwriteout3, read_data1, read_data2);
    // Extends the instrcode[5:0] i.e. the constant
    Extend_data extend_data(immdata, extended_data);
    // ID/EX pipeline register
    Id_ex_reg idexreg(clk, rst, read_reg1, read_reg2, write_reg, extended_data, read_data1, read_data2, regwriteout, wbsel_out, 
    rs1out, rs2out, rdout, ext_data_out, data1out,data2out, regwriteout2,wbselout2);
    // Multiplexers that connect to ALU input and allow data forwarding
    ALUmux alumuxsrc1(wb_data, data1out, sel1, sel_src1);
    ALUmux alumuxsrc2(wb_data, data2out, sel2, sel_src2);
    // ALU unit
    ALU alu(sel_src1, sel_src2, aluout);
    // EX/WB register file 
    Ex_wb_reg exwebreg(clk,rst,rs1out,rs2out,rdout,ext_data_out,aluout,regwriteout2,wbselout2,
    rs1out2,rs2out2,rdout2,ext_data_out2,aluout_out,regwriteout3,wbselout3);
    // Forwarding unit (checks forwarding condition and decides select lines for the 2 multiplexers above) 
    Forward forward(rdout2,rs1out,rs2out,regwriteout3,sel1,sel2);
    // Writeback multiplexer that sends the write_data for the registor memory
    Wbmux wbmux(wbselout3,aluout_out,ext_data_out2,wb_data);


    
endmodule
