module InsMem (input clk,input [5:0] A ,output  [31:0] RD);

reg	[31:0]	RAM[63:0];

initial
	begin
		$readmemb ("F:\\Quartus\\altera\\72\\exeicese\\work\\memoryfile.dat", RAM);
		end
		

 assign  RD = RAM[A];


endmodule
