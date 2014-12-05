module mux5Bit(input0, input1, select, mux_output);

input [4:0] input0, input1;
input select;
output [4:0] mux_output;
reg [4:0] mux_output;

always @(input0 or input1 or select)
	if(select == 5'b0)
		mux_output = input0;
	else
		mux_output = input1;

endmodule