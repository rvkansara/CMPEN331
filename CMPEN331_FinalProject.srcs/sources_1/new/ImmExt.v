`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2023 06:21:04 PM
// Design Name: 
// Module Name: ImmExt
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


module ImmExt(
        input [15:0] imm,
        input [1:0] sext,
        output reg [31:0]imm32
    );
    
    always @(*) begin
        if(sext == 1) begin
            imm32 = {{16'b0}, imm}; 
        end
        else begin
            imm32 = {16'b0, imm};
        end
    end
endmodule
