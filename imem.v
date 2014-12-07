`timescale 1ns/1ps
module imem(Instruction,clk, Address );
input clk;
input [4:0] Address;
output reg[31:0] Instruction;
reg [31:0] words[0:31]; // 8 words of size 4

initial
	begin
		//  initial instructions
		words[0]  = 00;
		words[1]  = 00;
		words[2]  = 00;		
		words[4]  = 32'h622020;    // add 
		words[8]  = 32'hac440000;  // sw
		words[12] = 32'h8c450000;  // lw
		words[16] = 32'h623022;    // Sub 
		words[20] = 32'h623824;    // And
	end
	
always@(posedge clk)
	begin
		Instruction <= words[Address];
	end
endmodule
