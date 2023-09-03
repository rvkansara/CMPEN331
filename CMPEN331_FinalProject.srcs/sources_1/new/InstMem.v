`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2023 04:18:55 PM
// Design Name: 
// Module Name: InstMem
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


module InstMem(
        input [31:0] PC,
        output reg [31:0] instruction
    );
    
    reg[31:0] mem [0:31];
    
    initial begin
        mem[0] = 32'h3c010000; // (00) main: lui $1, 0
        mem[1] = 32'h34240050; // (04) ori $4, $1, 80
        mem[2] = 32'h20050004; // (08) addi $5, $0, 4
        mem[3] = 32'h0c000018; // (0c) call: jal sum
        mem[4] = 32'hac820000; // (10) sw $2, 0($4)
        mem[5] = 32'h8c890000; // (14) lw $9, 0($4)
        mem[6] = 32'h01244022; // (18) sub $8, $9, $4
        mem[7] = 32'h20050003; // (1c) addi $5, $0, 3
        mem[8] = 32'h20a5ffff; // (20) loop2: addi $5, $5, -1
        mem[9] = 32'h34a8ffff; // (24) ori $8, $5, 0xffff
        mem[10] = 32'h39085555; // (28) xori $8, $8, 0x5555
        mem[11] = 32'h2009ffff; // (2c) addi $9, $0, -1
        mem[12] = 32'h312affff; // (30) andi $10,$9, 0xffff
        mem[13] = 32'h01493025; // (34) or $6, $10, $9
        mem[14] = 32'h01494026; // (38) xor $8, $10, $9
        mem[15] = 32'h01463824; // (3c) and $7, $10, $6
        mem[16] = 32'h10a00001; // (40) beq $5, $0, shift
        mem[17] = 32'h08000008; // (44) j loop2
        mem[18] = 32'h2005ffff; // (48) shift: addi $5, $0, -1
        mem[19] = 32'h000543c0; // (4c) sll $8, $5, 15
        mem[20] = 32'h00084400; // (50) sll $8, $8, 16
        mem[21] = 32'h00084403; // (54) sra $8, $8, 16
        mem[22] = 32'h000843c2; // (58) srl $8, $8, 15
        mem[23] = 32'h08000017; // (5c) finish: j finish
        mem[24] = 32'h00004020; // (60) sum: add $8, $0, $0
        mem[25] = 32'h8c890000; // (64) loop: lw $9, 0($4)
        mem[26] = 32'h20840004; // (68) addi $4, $4, 4
        mem[27] = 32'h01094020; // (6c) add $8, $8, $9
        mem[28] = 32'h20a5ffff; // (70) addi $5, $5, -1
        mem[29] = 32'h14a0fffb; // (74) bne $5, $0, loop
        mem[30] = 32'h00081000; // (78) sll $2, $8, 0
        mem[31] = 32'h03e00008; // (7c) jr $31
    end 
    
    always @(*) begin
        instruction = mem[PC[31:2]];
    end
endmodule
