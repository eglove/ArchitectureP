`timescale 1ns/100ps
module pc_tb;
wire [31:0] count;
reg clk, reset;

pc mydut(.count(count),.reset(reset));
	initial begin
		reset = 0;
		#10 reset = 1'b1;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b1;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b1;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b0;
		$display("Reset = %d",reset," Counter = %d",count);
		#10 reset = 1'b0;
		$display("Reset = %d",reset," Counter = %d",count);
	end
	
	initial
		#100 $finish;
endmodule