`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2023 10:25:36 PM
// Design Name: 
// Module Name: Mux2
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


module Mux2(input [31:0] qa, input [4:0] sa, input sel_shift, output reg [31:0] a);
    always @(*) begin 
        if (sel_shift == 1'b0) begin
            a <= qa;
        end 
        else begin
            a <= sa;
        end
    end
endmodule
