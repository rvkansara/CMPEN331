`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 08:40:22 PM
// Design Name: 
// Module Name: f
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


module f(
    input [1:0] jal,
    input [4:0] f,
    output [4:0] wn
    );
    
    assign wn = f | {5{jal}};
    
endmodule
