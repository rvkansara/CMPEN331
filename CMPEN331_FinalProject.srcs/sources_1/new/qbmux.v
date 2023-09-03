`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2023 07:21:27 PM
// Design Name: 
// Module Name: qbmux
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


module qbmuxinput( 
        input [31:0] qb,
        input [31:0] imm32,
        input [1:0] aluimm,
        output reg [31:0] b
    );
    
    always @(*) begin 
        if (aluimm == 1'b0) begin
            b <= qb;
        end 
        else begin
            b <= imm32;
        end
    end
endmodule
