   `timescale 1ns/100ps
//
// Test Bench for the mips alu
//
module test_mipsalu;
   wire Zero;             // ALU bit output
   wire [31:0] ALUOut;    // ALU word output
   reg  [31:0] A,B;       // ALU word inpus
   reg  [3:0]  ALUctl;
 
// instantiate the alu and control
 
   MIPSALU U0(.ALUctl(ALUctl), .A(A), .B(B), .ALUOut(ALUOut), .Zero(Zero));
 
// generate test signals
 
   initial 
   begin
        // Set 1
//      A=32'b0000_0000_0000_0000_0000_0000_0101_0101;
//      B=32'b0000_0000_0000_0000_0000_0000_0101_0101;
//      #10 ALUctl=4'd0;
//      #10 ALUctl=4'd1;
//      #10 ALUctl=4'd2;
//      #10 ALUctl=4'd6;
//      #10 ALUctl=4'd7;
//      #10 ALUctl=4'd12;
        // Set 2
//      A=32'b0000_0000_0000_0000_0010_0000_0101_0101;
//      B=32'b0000_0000_0000_0000_0000_0000_0101_0101;
//      #10 ALUctl=4'd0;
//      #10 ALUctl=4'd1;
//      #10 ALUctl=4'd2;
//      #10 ALUctl=4'd6;
//      #10 ALUctl=4'd7;
//      #10 ALUctl=4'd12;
        // Set 3
      A=32'b0000_0000_0000_0000_0000_0000_0101_0101;
      B=32'b0000_0000_0000_0000_0000_0100_0101_0101;
      #10 ALUctl=4'd0;
      #10 ALUctl=4'd1;
      #10 ALUctl=4'd2;
      #10 ALUctl=4'd6;
      #10 ALUctl=4'd7;
      #10 ALUctl=4'd12;
    end
 
// finish
    initial
        #70 $finish;
 
// output result
 
   initial
      $monitor($time, " A = %h",A," B = %h",B," ALUOut = %h",ALUOut," Zero = %b",Zero);
 
// the following generates vcd file for GTKwave
   initial
      begin
      $dumpfile("MIPSAlu.vcd");
      $dumpvars;
   end
 
endmodule
