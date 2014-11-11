`timescale 1ns/1ps
module imem_tb;
	// Inputs
	reg clk;
	reg [2:0] Address;
	reg [3:0] index;
	// Outputs
	wire [31:0] Instruction;
	
	imem dut(.clk(clk),
		.Address(Address),
		.Instruction(Instruction)
	);
	
	initial begin
		clk = 0;
		Address = 0;
		
		// Read and display all instructions currently in memory
		for(index = 0; index < 8; index = index+1) begin
			Address = index;
			#10;
			$display($time," Address = %d",Address," Instruction = %d",Instruction);
		end
	end
	always#1 clk = ~clk; // clk is always current
	
	initial
		#80 $finish;
endmodule
