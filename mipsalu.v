`timescale 1ns / 1ps
`define LEN 32
module MIPSALU( ALUOut, Zero, ALUctl, op1, op2);
    input [3:0] ALUctl;
    input [`LEN-1:0] op1, op2;
    output reg [`LEN-1:0] ALUOut;
    output Zero;
 
    assign Zero = (ALUOut == 0);    // Zero is true if ALUOut is 0
 
    always @(ALUctl, op1, op2) begin
        case (ALUctl)
            0:        ALUOut <= op1 & op2;
            1:        ALUOut <= op1 | op2;
            2:        ALUOut <= op1 + op2;
            6:        ALUOut <= op1 - op2;
            7:        ALUOut <= (op1 < op2)?1:0;
            12:       ALUOut <=  ~(op1 | op2);    // result is nor
            default: ALUOut <= 0;
        endcase
    end
endmodule
