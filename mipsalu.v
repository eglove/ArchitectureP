`timescale 1ns / 1ps
`define LEN 32
module MIPSALU( ALUOut, Zero, ALUctl, A, B);
    input [3:0] ALUctl;
    input [`LEN-1:0] A, B;
    output reg [`LEN-1:0] ALUOut;
    output Zero;
 
    assign Zero = (ALUOut == 0);    // Zero is true if ALUOut is 0
 
    always @(ALUctl, A, B) begin
        case (ALUctl)
            0:        ALUOut <= A & B;
            1:        ALUOut <= A | B;
            2:        ALUOut <= A + B;
            3:        ALUOut <= A - B;
            4:        ALUOut <= (A < B)?1:0;
            5:    ALUOut <=  ~(A | B);    // result is nor
            default: ALUOut <= 0;
        endcase
    end
endmodule
