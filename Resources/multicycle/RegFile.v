//Implementation of Register File 32-bit
module regfile (input clk,
input we3,
input [4:0] ra1, ra2, wa3,
input [31:0] wd3,
output reg [31:0] rd1, rd2);

reg [31:0] rf[31:0];
// three ported register file
// read two ports combinationally
// write third port on rising edge of clock
// register 0 hardwired to 0
always @ (posedge clk)
begin 
   $display("<<wrenable=%b>><<regdstination=%b>><<content=%b>>",we3,wa3,wd3);
   if (we3) rf[wa3] <= wd3; 
   rd1 <= (ra1 !=0) ? rf[ra1] : 0;
   rd2 <= (ra2 !=0) ? rf[ra2] : 0;
  end  
endmodule