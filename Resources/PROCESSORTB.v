// Martin Edrington; Brett Nowlin; Joe Huston; Steven Tomkins
// Group Project
// Computer Archetecture
// 10:00 MWF
// Professor: Anshuman Sing
module PROCESSORTB(Clock);
	always begin #500 Clock = !Clock; end
		output reg Clock=0;

 	initial begin

		end
	endmodule
