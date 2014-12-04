`timescale 1ns/100ps
module pc_tb;
wire [31:0] out;
reg clk, reset;
reg [31:0] in;

pc mydut(.out(out),.reset(reset),.in(in));
	initial begin
		reset = 0; in = 0;
		#10 in = 2;
		#10 in = 3;
		#10 reset = 1;
		in = 2;
		#10 in = 3;
	end
	
	initial
		#70 $finish;
		
	initial
		$monitor("Reset = %d",reset," In = %d",in," Out = %d",out);
endmodule