`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 05:12:03 PM
// Design Name: 
// Module Name: regDataMux
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


module regDataMux(
        input [1:0] jal,
        input [31:0] nextPC,
        input [31:0] dMux,
        output reg [31:0] d
    );
    always @(*) begin
        if(jal == 1'b0) begin
            d <= dMux;
        end
        else begin
            d <= nextPC;
        end
    end
   
    
endmodule
