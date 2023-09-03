`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2023 10:11:20 PM
// Design Name: 
// Module Name: Mux
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


module Mux(input [31:0] nextPC, input [31:0] one, input [31:0] qa, input[27:0] lsAddressOut, input [2:0] sel_pcsrc, output reg [31:0] muxResult);
    always @(*) begin 
        if(sel_pcsrc == 2'b00) begin
            muxResult <= nextPC;
        end
        else if (sel_pcsrc == 2'b01) begin
            muxResult <= one;
        end
        else if (sel_pcsrc == 2'b10) begin
            muxResult <= qa;
        end
        else if (sel_pcsrc == 2'b11) begin
            muxResult <= {nextPC[3:0],lsAddressOut};
        end
        
    end
endmodule
