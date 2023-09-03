`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 01:42:43 AM
// Design Name: 
// Module Name: datamem
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


module datamem(clk,dataout,datain,addr,we);
    input clk; // clock
    input we; // write enable
    input [31:0] datain; // data in (to memory)
    input [31:0] addr; // ram address
    output [31:0] dataout; // data out (from memory)
    
    reg [31:0] ram [0:31]; // ram cells: 32 words * 32 bits
    
    assign dataout = ram[addr[6:2]]; // use word address to read ram
    always @ (posedge clk)
        if (we) ram[addr[6:2]] = datain; // use word address to write ram
            
    integer i;
    
    initial begin // initialize memory
        for (i = 0; i < 32; i = i + 1)
            ram[i] = 0;
            // ram[word_addr] = data // (byte_addr)
            ram[5'h14] = 32'h000000a3; // (50hex)
            ram[5'h15] = 32'h00000027; // (54hex)
            ram[5'h16] = 32'h00000079; // (58hex)
            ram[5'h17] = 32'h00000115; // (5chex)
            // ram[5'h18] should be 0x00000258, the sum stored by sw instruction
    end
endmodule
