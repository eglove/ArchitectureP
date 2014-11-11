`timescale 1ns/1ps
module imem_tb;

reg [31:0] Address; 
wire [31:0] Instruction;

imem dut(.Address(Address), .Instruction(Instruction));

initial begin
	#10
	Address = 0;
	#10
	Address = 4;
	#10
	Address = 8;
	#10
	Address = 12;
	#10
	Address = 16;
	#10
	Address = 20;
end

initial 
	#70 $finish;

initial 
	$monitor($time, "Address = %d", Address, "Instruction = %d", Instruction);

endmodule
