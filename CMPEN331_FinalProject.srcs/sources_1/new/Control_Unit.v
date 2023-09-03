`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2023 06:09:54 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
        input [31:0] z,
        input [5:0] op,
        input [5:0] func,
        output reg [1:0] m2reg,
        output reg [2:0] pcsrc,
        output reg [1:0] wmem,
        output reg [3:0] aluc,
        output reg shift,   
        output reg [1:0] aluimm,
        output reg [1:0] wreg,
        output reg [1:0] regrt,
        output reg [1:0] sext,
        output reg [1:0] jal
    );
    always @(*) begin
        case(op)
            6'b000000:
            begin
                case(func)
                    6'b100000: //add
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b0;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'bx000;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                    6'b100010: //sub
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b0;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'bx100;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                    6'b100100: //and
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b0;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'bx001;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                    6'b100101: //or
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b0;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'bx101 ;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                    6'b100110: //xor
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b0;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'bx010;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                    6'b000000: //sll
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b1;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'b0011;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                    6'b000010: //srl
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b1;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'b0111;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                    6'b000011: //sra
                        begin
                            wreg <= 1'b1;
                            regrt <= 1'b0;
                            jal <= 1'b0;
                            m2reg <= 1'b0;
                            shift <= 1'b1;
                            aluimm <= 1'b0;
                            sext <= 1'bx;
                            aluc <= 4'b1111;
                            wmem <= 1'b0;
                            pcsrc <= 2'b00;
                        end
                   6'b001000: //jr
                        begin
                            wreg <= 1'b0;
                            regrt <= 1'bx;
                            jal <= 1'bx;
                            m2reg <= 1'bx;
                            shift <= 1'bx;
                            aluimm <= 1'bx;
                            sext <= 1'bx;
                            aluc <= 4'bxxxx;
                            wmem <= 1'b0;
                            pcsrc <= 2'b10;
                        end
                endcase
            end
            6'b001000: //addi
            begin
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b1;
                aluc <= 4'bx000;
                wmem <= 1'b0;
                pcsrc <= 2'b00;
            end
            6'b001000: //andi
            begin
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b0;
                aluc <= 4'bx001;
                wmem <= 1'b0;
                pcsrc <= 2'b00;
            end
            6'b001101: //ori
            begin
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b0;
                aluc <= 4'bx101;
                wmem <= 1'b0;
                pcsrc <= 2'b00;
            end
            6'b001110: //xori
            begin
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b0;
                aluc <= 4'bx010;
                wmem <= 1'b0;
                pcsrc <= 2'b00;
            end
            6'b100011: //lw
            begin
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b1;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b1;
                aluc <= 4'bx000;
                wmem <= 1'b0;
                pcsrc <= 2'b00;
            end
            6'b101011: //sw
            begin
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'bx;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b0;
                aluc <= 4'bx010;
                wmem <= 1'b1;
                pcsrc <= 2'b00;
            end
            6'b000100: //beq
            begin
                wreg <= 1'b0;
                regrt <= 1'bx;
                jal <= 1'bx;
                m2reg <= 1'bx;
                shift <= 1'b0;
                aluimm <= 1'b0;
                sext <= 1'b1;
                aluc <= 4'bx010;
                wmem <= 1'b0;
                pcsrc <= 2'b01;
                case(z)
                    1'b0:
                    begin
                        wreg <= 1'b0;
                        regrt <= 1'bx;
                        jal <= 1'bx;
                        m2reg <= 1'bx;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        sext <= 1'b1;
                        aluc <= 4'bx010;
                        wmem <= 1'b0;
                        pcsrc <= 2'b01;
                    end
                    1'b1:
                    begin
                        wreg <= 1'b0;
                        regrt <= 1'bx;
                        jal <= 1'bx;
                        m2reg <= 1'bx;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        sext <= 1'b1;
                        aluc <= 4'bx010;
                        wmem <= 1'b0;
                        pcsrc <= 2'b01;
                    end
                endcase
            end
            6'b000101: //bne
            begin
                wreg <= 1'b0;
                regrt <= 1'bx;
                jal <= 1'bx;
                m2reg <= 1'bx;
                shift <= 1'b0;
                aluimm <= 1'b0;
                sext <= 1'b1;
                aluc <= 4'bx010;
                wmem <= 1'b0;
                pcsrc <= 2'b01;
                case(z)
                    1'b0:
                    begin
                        wreg <= 1'b0;
                        regrt <= 1'bx;
                        jal <= 1'bx;
                        m2reg <= 1'bx;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        sext <= 1'b1;
                        aluc <= 4'bx010;
                        wmem <= 1'b0;
                        pcsrc <= 2'b01;
                    end
                    1'b1:
                    begin
                        wreg <= 1'b0;
                        regrt <= 1'bx;
                        jal <= 1'bx;
                        m2reg <= 1'bx;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        sext <= 1'b1;
                        aluc <= 4'bx010;
                        wmem <= 1'b0;
                        pcsrc <= 2'b01;
                    end
                endcase
            end
            6'b001111: //lui
            begin
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'bx;
                aluimm <= 1'b1;
                sext <= 1'bx;
                aluc <= 4'bx110;
                wmem <= 1'b0;
                pcsrc <= 2'b00;
            end
            6'b000010: //j
            begin
                wreg <= 1'b0;
                regrt <= 1'bx;
                jal <= 1'bx;
                m2reg <= 1'bx;
                shift <= 1'bx;
                aluimm <= 1'bx;
                sext <= 1'bx;
                aluc <= 4'bxxxx;
                wmem <= 1'b0;
                pcsrc <= 2'b11;
            end
            6'b000011: //jal
            begin
                wreg <= 1'b1;
                regrt <= 1'bx;
                jal <= 1'b1;
                m2reg <= 1'bx;
                shift <= 1'bx;
                aluimm <= 1'bx;
                sext <= 1'bx;
                aluc <= 4'bxxxx;
                wmem <= 1'b0;
                pcsrc <= 2'b11;
            end
        endcase
    end
    
endmodule
