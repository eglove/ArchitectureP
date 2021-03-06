//Implementation of Datapath 32-bit. Including output to PC(Segment 1), Register File (32 registers, Segment 2) and ALU (Segment 3).

module datapath
(
	input			clk, reset,			//clock, reset
	input 			memtoreg, 
	input [1:0] pcsrc,	//control signal: memory-to-register, PC-source
	input			alusrca,
	input [1:0] alusrcb,
	input    regdst,		//control signal: ALU-source, register-destination
	input			regwrite, jump, signExt,	branch,	//control signal: register-write, jump, sign-extend
	input	[3:0]	aluctrl,			//control signal: ALU-control
	
	//************************************************
	output			cout,	//Flag carry
	output 			ov,		//Flag overflow
	output 			zero,	//Flag zero
	output 			sign,	//Flag sign
	
	//************************************************
	//We can put these flags in a Flag Register, after careful discussion together.

	output	[31:0]   pc,			//next adress of PC
	input 		[31:0]	instr,		//instruction from Instruction Memory
	output	[31:0]	aluout, writedata,	//result: ALU-out; control signal: write-signal
	input		[31:0]	readdata,
	input pcwritecond,pcwrite
);	//data resource: read-data
	
	wire	[4:0]		writereg;
	wire	[31:0]	pcnext;   //pcplus4 is calculated by ALU,so it's aluresult in fact;
	wire	[31:0]	signimm, signimmsh;
	wire	[31:0]	regsrca,srca, srcb;
	wire	[31:0]	result,aluresult;
	wire writepc;      //write enable
	
	//wire pcsrc1;
	//reg		[31:0]	instr;
	//initial
	always @(instr)
	begin
		//instr = instr;
		$display ("datapath<<<<<<<<<instr = %b>>>>>>>>>>",instr);
	end
	
	
	//Segment 1, next PC logic
	flopr 	 pcreg(clk, reset,writepc, pcnext, pc);
	SL2 				immsh(signimm, signimmsh);

	
	mux3 #(32) 	pcbrmux(aluout,aluresult,{pc[31:28], instr[25:0], 2'b00}, pcsrc,pcnext);
// jump signal is in fact nonsense in multicycle!!!!!should be left out later!!!!
   assign writepc=(pcwritecond&zero)|pcwrite;
   
	//Segment 2, register file logic
	regfile			rf(clk, regwrite, instr[25:21], instr[20:16], writereg, result, regsrca, writedata);
	mux2	#(5)	wrmux(instr[20:16], instr[15:11], regdst, writereg);
	mux2	#(32)	resmux(aluout, readdata,memtoreg, result);
	signExt			se(instr[15:0], signExt, signimm);
   
	//Segment 3, ALU logic
	mux2 #(32) srcamux(pc,regsrca,alusrca,srca);
	mux4	#(32)	srcbmux(writedata,'d4, signimm,signimmsh, alusrcb, srcb);
	ALU				alu(clk,srca, srcb,cin, aluctrl, instr[10:6],aluresult,aluout, cout, ov, zero, sign);

endmodule
