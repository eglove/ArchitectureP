module CPU(clk, reset);

input clk, reset;

wire RegDST, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Branch_Zero;
wire [2:0] ALUOp, ALUCtrl;
wire [4:0] mux_RegDST;
wire [31:0] mux_ALUSrc, mux_Branch, mux_MemtoReg, Instr, pc, PC_4, Rs_Data, Rt_Data, Immediate, Offset, PC_Offset, ALUResult, MemData, 
	instruction;

assign Offset = Immediate << 2;
assign Branch_Zero = Branch & Zero;

pc pc(.clk(clk),.reset(reset),.count(pc));

adder PC_Add_4(.in1(pc), .in2(32'd4), .out(PC_4));

imem imem(.Address(pc), .Instruction(instruction));

control_unit control_unit(.opcode(Instr[31:26]), .RegDst(RegDST),
    .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg),
    .ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc),
    .RegWrite(RegWrite));

mux5Bit MUX_RegDst(.input0(Instr[20:16]), .input1(Instr[15:11]),
	.select(RegDST), .mux_output(mux_RegDST));
	
rfile Register_File(.clk(), .read_reg_1(Instr[25:21]),
	.read_reg_2(Instr[20:16]), .write_reg(mux_RegDST),
	.read_data_1(mux_MemtoReg), .read_data_2(mux_MemtoReg),
	.write_data(Rt_Data));
	
signext signeext (.input1(Instr[15:0]),.signext(1'b1),
	.output1(Immediate));

adder PC_Add_Offset(.in1(PC_4), .in2(Offset), .out(PC_Offset));

mux MUX_ALUsrc(.input0(Rt_Data), .input1(Immediate),
	.select(ALUSrc), .mux_output(mux_ALUSrc));
	
mipsalu alu_control(.funct(Instr[5:0]), .ALUOp(ALUOp),
    .ALUCtrl(ALUCtrl));

mipsalu ALU(.A(Rs_Data), .B(mux_ALUSrc), .ALUctl(ALUCtrl),
	.ALUOut(ALUResult), .Zero(Zero));
	
mux MUX_Branch(.input0(PC_4), .input1(PC_Offset),
	.select(Branch_Zero), .mux_output(mux_Branch));

dmem Data_Memory(.readAddress(ALUResult), .writeAddress(Rt_Data),
	.writeData(MemWrite), .readData(MemRead),
	.dataMemory(MemData));

mux MUX_MemtoReg(.input0(ALUResult), .input1(MemData),
	.select(MemtoReg), .mux_output(mux_MemtoReg));
	
endmodule