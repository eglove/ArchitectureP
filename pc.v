module PC(clk, reset, in, count);

input           clk;
input           reset;
input   [31:0]  in;
output  [31:0]  count;

reg     [31:0]  count;

always @(posedge clk or negedge reset)
begin
    if (~reset)
    begin
        count <= 32'b0;
    end
    else
    begin
        count <= in;
    end
end

endmodule
