`timescale 1ns/1ps
module dmem_tb;
	reg [8:0] readAddress;
	reg [8:0] writeAddress;
	reg [31:0] writeData;
	wire [31:0] readData;
	
	dmem mydut(.readAddress(readAddress),
		.readData(readData),
		.writeAddress(writeAddress),
		.writeData(writeData)
	);
	
	initial begin
		// Write data from 2 addresses, read data that was written
		readAddress = 0;
		writeAddress = 0;
		writeData = 0;
		
		// Write
		#10;
		readAddress = 0;
		writeAddress = 10;
		writeData = 12345;
		
		#10;
		readAddress = 0;
		writeAddress = 11;
		writeData = 6789;
		
		// Read data from above written addresses
		#10;
		readAddress = 10;
		writeAddress = 0;
		writeData = 0;
		
		#10;
		readAddress = 11;
		writeAddress = 0;
		writeData = 0;
	end
	
	initial
		#70 $finish;
		
	initial
		$monitor($time, " writeData = %d",writeData," readData = %d",readData);
endmodule