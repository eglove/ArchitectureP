module pc (clk, reset, in, out);

input clk;
input reset;
input [31:0] in;

output [31:0] out;
reg [31:0] out;

always @(posedge clk)
	begin if(~reset)
		begin
			out <= 32'b0;
		end
	else
		begin
			out <= in;
		end
	end

endmodule