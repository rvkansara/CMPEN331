`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 12:49:02 AM
// Design Name: 
// Module Name: leftshift
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


module leftshift(
        input [25:0] immOut,
        output [27:0] lsOut
    );
    reg [31:0] temp;
    always @(*) begin
        temp = immOut << 2'b10;
    end
    assign lsOut = temp;
endmodule
