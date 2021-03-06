//Implementation of MUX
module mux2 #	(parameter WIDTH = 8)
(
	input		[WIDTH-1:0]	data0, data1, 
	input		src, 
	output	[WIDTH-1:0]	y
);

assign y = src ? data1 : data0;

endmodule
