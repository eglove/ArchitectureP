`timescale 1ns/100ps
module mux_tb;
wire [4:0] mux_output;
reg [4:0] input0, input1;
reg select;

mux mydut(.mux_output(mux_output),.input0(input0),.input1(input1),.select(select));
	initial
	begin
		select = 0; input0 = 0; input1 = 0;
			#10 input0 = 5'b1;
			#10 select = 5'b1;
			#10 input1 = 5'b1;
	end
	
	initial
        #70 $finish;
		
	initial
      $monitor($time, " input0 = %h",input0," input1 = %h",input1," select = %h",select," mux_output = %h",mux_output);
endmodule