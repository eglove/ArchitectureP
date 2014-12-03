`timescale 1ns/100ps
module adder_tb;
wire signed [31:0] out;
reg signed [31:0] in1, in2;

adder mydut(.out(out),.in1(in1),.in2(in2));
	initial begin
		in1 = 0; in2 = 0;
		#10 in1 = 1; in2 = 1;
		#10 in1 = 5; in2 = 5;
		#10 in1 = -1; in2 = 2;
		#10 in1 = -2; in2 = 1;
	end
	
	initial
		#70 $finish;
	
	initial
		$monitor($time, "%d",in1," + %d",in2," = %d",out);
endmodule