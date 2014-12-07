`timescale 1ns / 1ps
module processor_tb;

	// Inputs
	reg clk;
	reg rst;
	wire [31:0] result,writeData;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk),
		.rst(rst),
		.result(result),
		.writeData(writeData)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		#1;clk = 1;
		#1;clk = 0;
		#1;clk = 1;
		rst = 0;
		#1;clk = 0;
		repeat(5)
		begin
		#1;clk = 1;
	    #1;
	    $display("Results %h Load Data %h", result,writeData);
		clk = 0;
		end
		
		#10; $finish;

	end
      
endmodule

