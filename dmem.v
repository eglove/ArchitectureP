`timescale 1ns/1ps
module dmem(readData, readAddress, writeAddress, writeData, MemRead,MemWrite);
input [8:0] readAddress;
input [8:0] writeAddress;
input [31:0] writeData;
input  MemRead, MemWrite; // 1 = Write, 0 = Read
output reg [31:0] readData;
reg [31:0] dataMemory[0:512];


// If MemWrite = 1 (Write), Write data to write address (in data memory)
// If MemRead  = 1 (Read ), Read data in read address (in data memory)
always@(*)
begin
	if(MemWrite)
		dataMemory[writeAddress] = writeData;
	else if (MemRead)
		readData = dataMemory[readAddress];
end
endmodule