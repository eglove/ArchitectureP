module Processor 
(
	input 						clk, reset,
	input    IorD,IRWrite,   //for multicycle
	output 	[31:0]	pc,
	input 	 [31:0] 	instr,
	output					memwrite,
	output 	[31:0] 	aluout, writedata,
	input 		[31:0] 	readdata
);

	wire 					memtoreg, branch, alusrca, regdst, regwrite, jump;
	wire           count,over,zero,sign,signext;
	wire           PCWriteCond,PCWrite;   //for multicycle
	wire  [1:0]   alusrcb,pcsrc;  //for multicycle
	wire 	[3:0] 		alucontrol;
	
	datapath dp(clk, reset, memtoreg,	pcsrc,alusrca, alusrcb,regdst, regwrite, jump,signext,branch,	alucontrol, count,over,zero,sign, pc, instr, aluout, writedata, readdata,PCWriteCond,PCWrite);
	controller c(clk,reset,instr[31:26], instr[5:0], memtoreg, memwrite, 	alusrca,alusrcb, regdst, regwrite, jump,signext,	alucontrol,branch,PCWriteCond,PCWrite,IorD,IRWrite,pcsrc);
	

endmodule
