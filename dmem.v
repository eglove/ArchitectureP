`timescale 1ns/1ps
module dmem(readAddress, readData, writeAddress, writeData, readWrite);
input [8:0] readAddress;
input [8:0] writeAddress;
input [31:0] writeData;
input readWrite; // 1 = Write, 0 = Read
output reg [31:0] readData;
reg [31:0] dataMemory[0:512];


// If readWrite = 1 (Write), Write data to write address (in data memory)
// If readWrite = 0 (Read), Read data in read address (in data memory)
always@(*)
begin
	if(readWrite)
		dataMemory[writeAddress] = writeData;
	else
		readData = dataMemory[readAddress];
end
endmodule