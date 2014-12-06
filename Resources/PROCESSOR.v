// Martin Edrington; Brett Nowlin; Joe Huston; Steven TomPkins
// Group Project
// Computer Archetecture
// 10:00 MWF
// Professor: Anshuman Sing
module PROCESSOR();
	
	ALU ALU (ALU_OUT, ALU_ZERO, ALU_CTRL, ALU_A, ALU_B);
		wire  	signed	[31:0]	ALU_OUT;
		output	reg	[3:0]	ALU_CTRL;
		wire			ALU_ZERO;
		output	reg	signed	[31:0]	ALU_A;
		output	reg	signed	[31:0]	ALU_B;

	ALUCONTROL ALUCONTROL(ALUCTRL_FUNCT,ALUCTRL_ALUOP,ALUCTRL_ALUCTRL);
		output	reg	[5:0]	ALUCTRL_FUNCT;
		output	reg	[2:0]	ALUCTRL_ALUOP;
		wire		[2:0]	ALUCTRL_ALUCTRL;

	CONTROLUNIT CONTROLUNIT (CONTROLUNIT_opcode,CONTROLUNIT_RegDst,CONTROLUNIT_MemRead,CONTROLUNIT_MemtoReg,CONTROLUNIT_ALUOp,CONTROLUNIT_MemWrite,CONTROLUNIT_ALUSrc,CONTROLUNIT_RegWrite);
		output 	reg	[5:0]  	CONTROLUNIT_opcode;
		wire			CONTROLUNIT_RegDst; 
		wire			CONTROLUNIT_MemRead; 
		wire			CONTROLUNIT_MemtoReg; 
		wire			CONTROLUNIT_MemWrite; 
		wire			CONTROLUNIT_ALUSrc;
		wire			CONTROLUNIT_RegWrite;
   		wire 		[2:0] 	CONTROLUNIT_ALUOp;

	DMEM DMEM(DMEM_address,DMEM_dout,DMEM_din,DMEM_write,Clock,DMEM_read);
		output	reg	[9:0] 	DMEM_address;
		output 	reg	signed [31:0] 	DMEM_din;
		output	reg		DMEM_write;
		output	reg		DMEM_read;
		wire 		signed [31:0] 	DMEM_dout;

	IMEM IMEM(Clock, IMEM_Address, IMEM_Instruction);
		output reg 	[31:0]	IMEM_Address=0;
		input		[31:0]	IMEM_Instruction;

	MUXALU1 MUXALU1(Clock,MUXALU1_Ctrl,MUXALU1_Input1,MUXALU1_Input2,MUXALU1_Output);
		output	reg		MUXALU1_Ctrl;	
		output	reg signed	[31:0]	MUXALU1_Input1;	
		output	reg signed	[31:0]	MUXALU1_Input2;		
		wire 	signed	[31:0]	MUXALU1_Output;

	MUXALU2 MUXALU2(Clock,MUXALU2_Ctrl,MUXALU2_Input1,MUXALU2_Input2,MUXALU2_Output);
		output	reg		MUXALU2_Ctrl;	
		output	reg signed	[31:0]	MUXALU2_Input1;	
		output	reg signed	[31:0]	MUXALU2_Input2;		
		wire 	signed	[31:0]	MUXALU2_Output;

	MUXMEM MUXMEM(Clock,MUXMEM_Ctrl,MUXMEM_Input1,MUXMEM_Input2,MUXMEM_Output);
		output	reg		MUXMEM_Ctrl;	
		output	reg 	[4:0]	MUXMEM_Input1;	
		output	reg 	[4:0]	MUXMEM_Input2;		
		wire 		[4:0]	MUXMEM_Output;

	REGFILE REGFILE(REGFILE_Read1,REGFILE_Read2,REGFILE_WriteReg,REGFILE_WriteData,REGFILE_RegWrite,REGFILE_Data1,REGFILE_Data2,Clock);
		output	reg	[4:0]	REGFILE_Read1;
		output	reg	[4:0]	REGFILE_Read2;
		output	reg	[4:0]	REGFILE_WriteReg;
		output	reg signed	[31:0]	REGFILE_WriteData;
		output	reg		REGFILE_RegWrite;
		wire	signed	[31:0]	REGFILE_Data1;
		wire	signed	[31:0]	REGFILE_Data2;

	SIGNEXT SIGNEXT(Clock,SIGNEXT_Input,SIGNEXT_Output);
		output	reg signed	[15:0]	SIGNEXT_Input;	
		wire 	signed	[31:0]	SIGNEXT_Output;	

	PROCESSORTB PROCESSORTB(SystemClock);
		input		SystemClock;

	PC PC (Clock,PC_Next,PC_Count);
		output	reg		PC_Next;
		wire		[5:0]	PC_Count;

		assign Clock = SystemClock;
		reg	[5:0]	Count=0;
		reg	[2:0]	Phase=0;
		reg 	[5:0]	Check;

	initial 
		begin
		Count=0;
		end
	always @ (posedge Clock)
		begin
	
		end
endmodule
