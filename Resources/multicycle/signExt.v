module signExt 
(
	input		[15:0]	a,
	input		signExt,		//signal, whether to sign-extend
	output	reg	[31:0]	y
);
	
	always @ (*)
	begin
	//Switching of ALU operations
	$display("signExt<<<<<<<<<<<<a=%b,signExt=%b>>>>>>>",a,signExt);
		case (signExt)
			1'b0: y = {{16{1'b0}}, a};
			1'b1: y = {{16{a[15]}}, a};
		endcase
		$display("signExt<<<<<<<<<<<<y=%b>>>>>>>",y);
   end

	endmodule
