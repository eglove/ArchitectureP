`define CYCLE_TIME 50

module testbench;

reg         clk;
reg         rst_n;
integer     i, outfile, counter;

always #(`CYCLE_TIME/2) clk = ~clk;    

CPU CPU(.clk(clk), .rst_n(rst_n));
  
initial begin
    // Initialize instruction memory
    for(i=0; i<9; i=i+1) begin
        CPU.imem.words[i] = 32'b0;
    end
    
    // Initialize data memory
    for(i=0; i<31; i=i+1) begin
        CPU.dmem.dataMemory[i] = 8'b0;
    end    
        
    // initialize Register File
    for(i=0; i<32; i=i+1) begin
        CPU.rfile.register[i] = 32'b0;
    end
    
    // Load instructions into instruction memory
    $readmemb("instruction.txt", CPU.imem.memory);
    
    // Open output file
    outfile = $fopen("output.txt") | 1;
    
    // Set Input n into data memory at 0x00
    CPU.dmem.dataMemory[0] = 8'h5;       // n = 5 for example
    
    counter = 0;
    clk = 0;
    rst_n = 0;
    
    #(`CYCLE_TIME/4) 
    rst_n = 1;
    
end
  
always@(posedge clk) begin
    if(counter == 60)    // stop after 60 cycles
        $stop;
        
    // print PC
    $fdisplay(outfile, "PC = %d", CPU.pc.count);
    
    // print Registers
    $fdisplay(outfile, "Registers");
    $fdisplay(outfile, "R0(r0) =%d, R8 (t0) =%d, R16(s0) =%d, R24(t8) =%d", CPU.rfile.register[0], CPU.rfile.register[8] , CPU.rfile.register[16], CPU.rfile.register[24]);
    $fdisplay(outfile, "R1(at) =%d, R9 (t1) =%d, R17(s1) =%d, R25(t9) =%d", CPU.rfile.register[1], CPU.rfile.register[9] , CPU.rfile.register[17], CPU.rfile.register[25]);
    $fdisplay(outfile, "R2(v0) =%d, R10(t2) =%d, R18(s2) =%d, R26(k0) =%d", CPU.rfile.register[2], CPU.rfile.register[10], CPU.rfile.register[18], CPU.rfile.register[26]);
    $fdisplay(outfile, "R3(v1) =%d, R11(t3) =%d, R19(s3) =%d, R27(k1) =%d", CPU.rfile.register[3], CPU.rfile.register[11], CPU.rfile.register[19], CPU.rfile.register[27]);
    $fdisplay(outfile, "R4(a0) =%d, R12(t4) =%d, R20(s4) =%d, R28(gp) =%d", CPU.rfile.register[4], CPU.rfile.register[12], CPU.rfile.register[20], CPU.rfile.register[28]);
    $fdisplay(outfile, "R5(a1) =%d, R13(t5) =%d, R21(s5) =%d, R29(sp) =%d", CPU.rfile.register[5], CPU.rfile.register[13], CPU.rfile.register[21], CPU.rfile.register[29]);
    $fdisplay(outfile, "R6(a2) =%d, R14(t6) =%d, R22(s6) =%d, R30(s8) =%d", CPU.rfile.register[6], CPU.rfile.register[14], CPU.rfile.register[22], CPU.rfile.register[30]);
    $fdisplay(outfile, "R7(a3) =%d, R15(t7) =%d, R23(s7) =%d, R31(ra) =%d", CPU.rfile.register[7], CPU.rfile.register[15], CPU.rfile.register[23], CPU.rfile.register[31]);

    // print Data Memory
    $fdisplay(outfile, "Data Memory: 0x00 =%d", {CPU.dmem.dataMemory[3] , CPU.dmem.dataMemory[2] , CPU.dmem.dataMemory[1] , CPU.dmem.dataMemory[0] });
    $fdisplay(outfile, "Data Memory: 0x04 =%d", {CPU.dmem.dataMemory[7] , CPU.dmem.dataMemory[6] , CPU.dmem.dataMemory[5] , CPU.dmem.dataMemory[4] });
    $fdisplay(outfile, "Data Memory: 0x08 =%d", {CPU.dmem.dataMemory[11], CPU.dmem.dataMemory[10], CPU.dmem.dataMemory[9] , CPU.dmem.dataMemory[8] });
    $fdisplay(outfile, "Data Memory: 0x0c =%d", {CPU.dmem.dataMemory[15], CPU.dmem.dataMemory[14], CPU.dmem.dataMemory[13], CPU.dmem.dataMemory[12]});
    $fdisplay(outfile, "Data Memory: 0x10 =%d", {CPU.dmem.dataMemory[19], CPU.dmem.dataMemory[18], CPU.dmem.dataMemory[17], CPU.dmem.dataMemory[16]});
    $fdisplay(outfile, "Data Memory: 0x14 =%d", {CPU.dmem.dataMemory[23], CPU.dmem.dataMemory[22], CPU.dmem.dataMemory[21], CPU.dmem.dataMemory[20]});
    $fdisplay(outfile, "Data Memory: 0x18 =%d", {CPU.dmem.dataMemory[27], CPU.dmem.dataMemory[26], CPU.dmem.dataMemory[25], CPU.dmem.dataMemory[24]});
    $fdisplay(outfile, "Data Memory: 0x1c =%d", {CPU.dmem.dataMemory[31], CPU.dmem.dataMemory[30], CPU.dmem.dataMemory[29], CPU.dmem.dataMemory[28]});
	
    $fdisplay(outfile, "\n");
    
    counter = counter + 1;
end

  
endmodule
