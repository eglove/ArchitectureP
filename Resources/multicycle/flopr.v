module flopr
(
	input				clk, reset,
	input       pcwrite,      //write enable
	input				[31:0]	in,
	output	reg	 [31:0]	out
);

	always @ (negedge clk, posedge reset)
	begin
	   $display("<<pcwrite=%b>><<pcnext=%b>>",pcwrite,in);
		if (reset) out <=0;
		else if(pcwrite) out <=in;
		
   end
endmodule
