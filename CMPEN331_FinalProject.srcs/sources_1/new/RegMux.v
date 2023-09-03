`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2023 06:20:33 PM
// Design Name: 
// Module Name: RegMux
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


module RegMux(
        input [4:0] rt,
        input [4:0] rd,
        input [1:0] regrt,
        output reg [4:0] f
    );
    
    always @(*) begin 
        if (regrt == 1'b1) begin
            f <= rt;
        end 
        else begin
            f <= rd;
        end
    end
endmodule
