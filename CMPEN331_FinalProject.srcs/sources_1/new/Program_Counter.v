`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2023 06:09:54 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(input clk, input [31:0] muxResult, output reg [31:0] PC);
    initial begin 
        PC = 32'b0;
    end 
    
    always @(posedge clk) begin 
        PC <= muxResult;
    end 
endmodule
