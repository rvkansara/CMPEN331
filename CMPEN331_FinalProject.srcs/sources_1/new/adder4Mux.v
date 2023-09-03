`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 12:44:21 AM
// Design Name: 
// Module Name: adder4Mux\
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


module adder4Mux(
        input [31:0] nextPC, 
        input [31:0] lsOut,
        output [31:0] one
    );
    reg [15:0] y;
    always @(*) begin
        y = nextPC + lsOut;
    end
    assign one = y;
endmodule
