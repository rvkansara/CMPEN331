`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2023 06:09:54 PM
// Design Name: 
// Module Name: Regfile
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


module Regfile(rna,rnb,d,wn,we,clk,clrn,qa,qb); // 32x32 regfile
    input [31:0] d; // data of write port
    input [4:0] rna; // reg # of read port A
    input [4:0] rnb; // reg # of read port B
    input [4:0] wn; // reg # of write port
    input [1:0] we; // write enable
    input clk, clrn; // clock and reset
    output [31:0] qa, qb; // read ports A and B
    
    reg [31:0] register [0:31]; // 31 32-bit registers
    assign qa = (rna == 0)? 0 : register[rna]; // xread port A
    assign qb = (rnb == 0)? 0 : register[rnb]; // read port B
     
    integer i;
    
    initial begin
        register[0] <= 32'h00000000;
        register[1] <= 32'h00000000;
        register[2] <= 32'h00000000;
        register[3] <= 32'h00000000;
        register[4] <= 32'h00000000;
        register[5] <= 32'h00000000;
        register[6] <= 32'h00000000;
        register[7] <= 32'h00000000;
        register[8] <= 32'h00000000;
        register[9] <= 32'h00000000;
        register[10] <= 32'h00000000;
        register[11] <= 32'h00000000;
        register[12] <= 32'h00000000;
        register[13] <= 32'h00000000;
        register[14] <= 32'h00000000;
        register[15] <= 32'h00000000;
        register[16] <= 32'h00000000;
        register[17] <= 32'h00000000;
        register[18] <= 32'h00000000;
        register[19] <= 32'h00000000;
        register[20] <= 32'h00000000;
        register[21] <= 32'h00000000;
        register[22] <= 32'h00000000;
        register[23] <= 32'h00000000;
        register[24] <= 32'h00000000;
        register[25] <= 32'h00000000;
        register[26] <= 32'h00000000;
        register[27] <= 32'h00000000;
        register[28] <= 32'h00000000;
        register[29] <= 32'h00000000;
        register[30] <= 32'h00000000;
        register[31] <= 32'h00000000;
    end
    
    always @(posedge clk or negedge clrn) // write port
        
        if ((wn != 0) && we) begin // not reg[0] & enabled
                register[wn] <= d; // write d to reg[wn]
        end
        else if (!clrn)
            for (i = 1; i < 32; i = i + 1)
                register[i] <= 0; // reset
endmodule
