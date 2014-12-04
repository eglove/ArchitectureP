`timescale 1ns/100ps
module pc_tb;
wire [31:0] count;
reg clk, reset;
reg [31:0] in;

pc mydut(.count(count),.reset(reset));
	initial begin
		reset = 1; in = 32'd0;
		#10 reset = 1'b1;
		#10 in = 32'd0;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b1;
		#10 in = 32'd4;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b1;
		#10 in = 32'd8;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b1;
		#10 in = 32'd0;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b1;
		#10 in = 32'd4;
		$display("Reset = %d",reset," Counter = %d",count);
	end
	
	initial
		#100 $finish;
		
	// initial
		// $monitor("Reset = %d",reset," Counter = %d",count);
endmodule