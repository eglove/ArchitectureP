// Copyright (C) 1991-2007 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

module \32-bitProcessor (
);


wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_37;





ALU	b2v_inst(.srca(SYNTHESIZED_WIRE_0),
.srcb(SYNTHESIZED_WIRE_1),.shamt(SYNTHESIZED_WIRE_40),.ALUControl(SYNTHESIZED_WIRE_3),.zero(SYNTHESIZED_WIRE_11),.ALUOut(SYNTHESIZED_WIRE_42));

datamemory	b2v_inst1(.Memwrite(SYNTHESIZED_WIRE_4),
.write_data(SYNTHESIZED_WIRE_41),.write_address(SYNTHESIZED_WIRE_42),.read_data(SYNTHESIZED_WIRE_9));

mux2	b2v_inst10(.src(SYNTHESIZED_WIRE_7),
.D0(SYNTHESIZED_WIRE_42),.D1(SYNTHESIZED_WIRE_9),.y(SYNTHESIZED_WIRE_40));
defparam	b2v_inst10.WIDTH = 32;
assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_10 & SYNTHESIZED_WIRE_11;

SL2	b2v_inst12(.a(SYNTHESIZED_WIRE_43),
.y(SYNTHESIZED_WIRE_21));

controller	b2v_inst13(.Op(SYNTHESIZED_WIRE_44),
.Funct(SYNTHESIZED_WIRE_44),.memtoreg(SYNTHESIZED_WIRE_7),.memwrite(SYNTHESIZED_WIRE_4),.branch(SYNTHESIZED_WIRE_10),.ALUCtrl(SYNTHESIZED_WIRE_3),.alusrc(SYNTHESIZED_WIRE_24),.signext(SYNTHESIZED_WIRE_32),.regdst(SYNTHESIZED_WIRE_37),.regwrite(SYNTHESIZED_WIRE_27),.jump(SYNTHESIZED_WIRE_18));

mux2	b2v_inst14(.src(SYNTHESIZED_WIRE_15),
.D0(SYNTHESIZED_WIRE_45),.D1(SYNTHESIZED_WIRE_17),.y(SYNTHESIZED_WIRE_19));
defparam	b2v_inst14.WIDTH = 32;

mux2	b2v_inst15(.src(SYNTHESIZED_WIRE_18),
.D0(SYNTHESIZED_WIRE_19),.D1(SYNTHESIZED_WIRE_20),.y(SYNTHESIZED_WIRE_35));
defparam	b2v_inst15.WIDTH = 32;

add	b2v_inst17(.srca(SYNTHESIZED_WIRE_21),
.srcb(SYNTHESIZED_WIRE_45),.Output(SYNTHESIZED_WIRE_17));

SL2	b2v_inst2(.a(SYNTHESIZED_WIRE_44),
.y(SYNTHESIZED_WIRE_20));

mux2	b2v_inst3(.src(SYNTHESIZED_WIRE_24),
.D0(SYNTHESIZED_WIRE_41),.D1(SYNTHESIZED_WIRE_43),.y(SYNTHESIZED_WIRE_1));
defparam	b2v_inst3.WIDTH = 32;

regfile	b2v_inst4(.werf(SYNTHESIZED_WIRE_27),
.RAddr1(SYNTHESIZED_WIRE_44),.RAddr2(SYNTHESIZED_WIRE_44),.WAddr(SYNTHESIZED_WIRE_30),.WData(SYNTHESIZED_WIRE_40),.RData1(SYNTHESIZED_WIRE_0),.RData2(SYNTHESIZED_WIRE_41));

signExt	b2v_inst5(.signExt(SYNTHESIZED_WIRE_32),
.a(SYNTHESIZED_WIRE_44),.y(SYNTHESIZED_WIRE_43));

instructionmemory	b2v_inst6(.A(SYNTHESIZED_WIRE_46),
.RD(SYNTHESIZED_WIRE_44));

flopr	b2v_inst7(.in(SYNTHESIZED_WIRE_35),
.out(SYNTHESIZED_WIRE_46));
defparam	b2v_inst7.WIDTH = 32;

add	b2v_inst8(.srca(SYNTHESIZED_WIRE_46),
.Output(SYNTHESIZED_WIRE_45));

mux2	b2v_inst9(.src(SYNTHESIZED_WIRE_37),
.D0(SYNTHESIZED_WIRE_44),.D1(SYNTHESIZED_WIRE_44),.y(SYNTHESIZED_WIRE_30));
defparam	b2v_inst9.WIDTH = 32;


endmodule
