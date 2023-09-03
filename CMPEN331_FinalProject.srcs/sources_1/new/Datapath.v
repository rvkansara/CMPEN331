`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2023 05:54:31 PM
// Design Name: 
// Module Name: Datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(
    input clk,
    input clrn,
    output wire [31:0] PC,
    output wire [31:0] instOut_reg,
    output wire [31:0] aluOut,
    output wire [31:0] do 
);
    
    wire [1:0] wreg;
    wire [2:0] pcsrc;
    wire [3:0] aluc_1;
    wire [31:0] qa;
    wire [31:0] qb;
    wire [31:0] muxResult;
    wire [31:0] d; 
    wire [4:0] wn;
    wire [31:0] a;
    wire [31:0] b; 
    wire [31:0] nextPC;
    wire [31:0] lsOut;
    wire [27:0] lsAddressOut;
    wire [31:0] one;
    wire [31:0] immOut;
    wire [1:0] aluimm;
    wire [1:0] regrt;
    wire [1:0] sext;
    wire [31:0] z;
    wire [1:0] wmem;
    wire [1:0] m2reg;
    
    wire [31:0] dMux;
    wire [4:0] f1;
    wire sel_shift;
    

    InstMem fetch(PC,instOut_reg); // fetch the instruction and store it in instOut_reg

    wire [5:0]op = instOut_reg[31:26]; 
    wire [4:0]rs = instOut_reg[25:21];
    wire [4:0]rt = instOut_reg[20:16];
    wire [4:0]rd = instOut_reg[15:11];
    wire [4:0]sa = instOut_reg[10:6];
    wire [5:0]func = instOut_reg[5:0];
    wire [15:0]imm = instOut_reg[15:0];
    wire [25:0]addr = instOut_reg[25:0];
    wire [1:0] jal;

    adder pcadder(PC,nextPC);
    Program_Counter programcounter(clk,muxResult,PC);
    Mux mux4by1(nextPC,one, qa, lsAddressOut, pcsrc, muxResult);
    Mux2 mux2by1(qa, sa, sel_shift, a);
    aluc ALU(aluc_1, a, b, aluOut, z);
    Control_Unit controlunit(z, op,func,m2reg, pcsrc, wmem, aluc_1,sel_shift,aluimm,wreg, regrt, sext, jal);
    RegMux regmux2by1(rt,rd,regrt,f1);
    Regfile registerfile(rs,rt,d,wn,wreg,clk,clrn,qa,qb); 
   
    ImmExt immediateExtender(imm,sext,immOut);
    qbmuxinput qbmux(qb,immOut, aluimm, b);
    lsAdderShift lsAdder(immOut, lsOut);
    leftshift lsAddress(addr, lsAddressOut);
    adder4Mux adder4by1(nextPC, lsOut, one);
    datamem DataMemory(clk, do, qb, aluOut, wmem);
    dataMemMux datamemmux(aluOut, do, m2reg, dMux);
    regDataMux regdatamux(jal, nextPC, dMux, d);
    f fMod(jal,f1,wn);
endmodule

