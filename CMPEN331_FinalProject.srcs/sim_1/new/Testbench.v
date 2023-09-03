`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 06:36:41 PM
// Design Name: 
// Module Name: Testbench
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


module Testbench();
    reg clk_tb;
    reg clrn;
    wire [31:0] PC;
    wire [31:0] instOut;
    wire [31:0] aluOut;
    wire [31:0] do;
    initial
    begin
        clk_tb <= 0;
        clrn <= 1;
    end

    Datapath Datapath_tb(clk_tb,clrn,PC,instOut,aluOut,do);

    always @(*)
    begin
        #5;
        clk_tb <= ~clk_tb;
        
    end
endmodule
