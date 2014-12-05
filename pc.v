module pc(clk, reset, count);

input           clk;
input           reset;
output  [31:0]  count;
reg     [31:0]  count;

always @(posedge clk or negedge reset)
begin
    if (reset)
		count = 32'b0;
    else
    begin
        count = count + 4;
    end
end

endmodule
