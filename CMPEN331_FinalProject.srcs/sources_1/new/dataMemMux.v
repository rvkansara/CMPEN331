`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 01:53:37 AM
// Design Name: 
// Module Name: dataMemMux
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


module dataMemMux( 
        input [31:0] r,
        input [31:0] do,
        input [1:0] m2reg,
        output reg [31:0] dMux
    );
    
    always @(*) begin 
        if (m2reg == 1'b0) begin
            dMux <= r;
        end 
        else begin
            dMux <= do;
        end
    end
endmodule
