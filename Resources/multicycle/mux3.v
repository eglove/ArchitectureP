module mux3 #	(parameter WIDTH = 8)
(
	input		[WIDTH-1:0]	data0, data1, data2,
	input		[1:0] src, 
	output	reg [WIDTH-1:0]	y
);
always @(*)
case(src)
    2'b00:y <= data0;
    2'b01:y <= data1;
    2'b10:y <= data2;
endcase
endmodule
