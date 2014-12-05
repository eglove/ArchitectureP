`timescale 1ns/1ps
module imem(clk, Address, Instruction);
input clk;
input [31:0] Address;
output reg[31:0] Instruction;
reg [31:0] words[0:7]; // 8 words of size 4

initial
	begin
		// Arbitrary initial instructions
		words[0] = 10;
		words[1] = 20;
		words[2] = 30;
		words[3] = 40;
		words[4] = 50;
		words[5] = 60;
		words[6] = 70;
		words[7] = 80;
	end
	
always@(posedge clk)
	begin
		Instruction <= words[Address];
	end
endmodule
