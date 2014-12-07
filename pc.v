module PC (clk, rst, pc_in, p_counter);
input clk,rst;
input [4:0] pc_in;
output reg [4:0] p_counter;

always@(posedge clk)
if(rst)
p_counter <= 0;
else
p_counter <= p_counter + 4;

endmodule
