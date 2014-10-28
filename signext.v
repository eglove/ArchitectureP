module signext (input [15:0] input1, input signext,	output reg [31:0] output1);
	
	always @ (*)
	begin
		case (signext)
			1'b0: output1 = {{16{1'b0}}, input1};
			1'b1: output1 = {{16{input1[15]}}, input1};
		endcase
   end

	endmodule