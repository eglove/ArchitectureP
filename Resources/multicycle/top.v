module top (input clk, reset,
output [31:0]  pc
);
wire [31:0]  readdata, writedata,dataadr;  //dataaddr=aluout here
wire memwrite,IorD,IRWrite;
wire  [31:0]   instr;
wire  [6:0] memsrc;

// instantiate processor and memories
Processor ps(clk, reset,IorD,IRWrite, pc, instr, memwrite, dataadr,writedata, readdata);

mux2 #7 memsrcource(pc[8:2],dataadr[8:2],IorD,memsrc);
always @(memsrc,IorD)
   $display("<<memsrc=%b,IorD=%b>>",memsrc,IorD);
Mem memory(clk, memwrite,IRWrite, memsrc, writedata,readdata,instr);
endmodule
