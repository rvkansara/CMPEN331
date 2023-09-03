`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2023 06:09:54 PM
// Design Name: 
// Module Name: aluc
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


module aluc(
    input [3:0] aluc1,
    input [31:0] a,
    input [31:0] b,
    output [31:0] r,
    output reg [31:0] z
);

    reg [31:0] temp_result;

    always @(*) begin
        casex(aluc1) 
            4'bx000: 
                temp_result = a + b; // add
            4'bx100: 
                temp_result = a - b; // sub
            4'bx001: 
                temp_result = a & b; // and
            4'bx101: 
                temp_result = a | b; // or
            4'bx010: 
                begin      
                   temp_result = a ^ b; // xor
                   if(a==b) begin
                        z = 1'b0;
                   end
                   else begin
                        z = 1'b1;
                   end
                end
                
            4'b0011: 
                temp_result = b << a; // sll
            4'bx110: 
                temp_result = {{16{b[16]}},16'b0}; // lui
       
        endcase
        
    end
    
    assign r = temp_result;
endmodule
