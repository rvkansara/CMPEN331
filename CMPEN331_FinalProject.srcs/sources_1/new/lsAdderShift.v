`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 12:22:17 PM
// Design Name: 
// Module Name: lsAdderShift
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


module lsAdderShift(
        input [31:0] immOut,
        output [31:0] lsOut
    );
    
    reg [31:0] temp;
    
    always @(*) begin
        temp = immOut << 2'b10;
    end
    assign lsOut = temp;
endmodule
