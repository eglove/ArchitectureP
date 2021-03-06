module Mem (input clk, we,irwrite,
   input [6:0] Addr,
   input [31:0] wd,
   output reg [31:0] rd,instr
   );

reg [31:0] RAM[127:0];    //128 word shared memory,instruction starts from 0;
//assign rd = RAM[A];  //word aligned
always @(posedge clk)
   begin
      if (irwrite)
       instr<=RAM[Addr];
      rd<=RAM[Addr];
      $display("<<irwrite=%b>><<addr=%b>><<instr=%b>>",irwrite,Addr,instr);
          //egde triggering use non-blocking assignment
    end 
always@(posedge clk)
   begin
      if (we)
      RAM[Addr] <= wd;  
      $display("<<we=%b>><<addr=%b>><<wd=%b>>",we,Addr,wd); 
  end 
initial
	begin
		$readmemb ("E:\\test.dat", RAM);
	end
		
endmodule 