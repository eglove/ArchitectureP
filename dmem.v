module dmem(readAddress, readData, writeAddress, writeData);
input [8:0] readAddress;
input [8:0] writeAddress;
input [31:0] writeData;
output reg [31:0] readData;
reg [31:0] dataMemory[0:512];

always@(*)
begin
	dataMemory[writeAddress] = writeData;
	readData = dataMemory[readAddress];
end
endmodule