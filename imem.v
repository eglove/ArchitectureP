`timescale 1ns/1ps
module imem(Address, Instruction);

input [31:0] Address; 
output [31:0] Instruction;

reg[31:0] word1 = 10;
reg[31:0] word2 = 20;
reg[31:0] word3 = 30;
reg[31:0] word4 = 40;
reg[31:0] word5 = 50;
reg[31:0] word6 = 60;

always@(Address)
begin
	case(Address)
		0: Instruction = word1;
		4: Instruction = word2;
		8: Instruction = word3;
		12: Instruction = word4;
		16: Instruction = word5;
		20: Instruction = word6;
	endcase
end
endmodule
