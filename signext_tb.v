`timescale 1ns / 1ps
module signext_tb;
reg signed [15:0] input1;
reg signext;
wire signed [31:0] output1;

signext mydut(.input1(input1), .output1(output1),.signext(signext));

initial begin
    input1 = 0; signext = 1;
    #10 input1 = 16'b0000_0000_0000_0101;
	#10 input1 = 16'b0000_0000_0000_1000;
	#10 input1 = -6;
end

	initial
        #70 $finish;
		
	initial
      $monitor($time, " input1 = %d",input1," output1 = %d",output1);	
endmodule