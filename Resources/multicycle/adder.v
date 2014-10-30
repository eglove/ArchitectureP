module add
(
	input		[31:0]	srca, srcb,
	output 	[31:0]	sum
);
	
	reg		[31:0]	carrychain;
	integer				k;
	wire	[31:0]	g = srca & srcb;
	wire	[31:0]	p = srca ^ srcb;
	
	always @ (srca or srcb or p or g)
		begin: carry_generation
		integer	k;
		carrychain[0] = g[0] + (p[0] & 1'b0);
		for (k = 1; k <= 31; k = k+1)
			begin
				carrychain[k] = g[k] | (p[k] & carrychain[k-1]);
			end
		end
		
		wire	[32:0]	shiftedcarry = {carrychain, 1'b0};
		assign	sum = p ^ shiftedcarry;

endmodule
