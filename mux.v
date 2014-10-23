module mux(input0, input1, select, mux_output);

input input0, input1;
input select;
output mux_output;
reg mux_output;

always @(input0 or input1 or select)
	if(select == 1'b0)
		mux_output = input0;
	else
		mux_output = input1;

endmodule