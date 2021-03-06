`timescale 1ns/1ns
module top_tb  ; 

  parameter CLK_CYCLE =50;
  reg    clk   ; 
  wire  [31:0]  pc   ; 
  reg    reset   ; 

  top  
   DUT  ( 
       .clk (clk ) ,
      .pc (pc ) ,
      .reset (reset ) ); 
  initial
   begin
       force pc='b0;
       reset=1'b0;
       clk=1'b0;
       #100 release pc;
      //#CLK_CYCLE reset=1'b1;
      
  end
  
  
  always #CLK_CYCLE clk=~clk;
       

endmodule

