module aludec (input [5:0] funct,
			   input [2:0] aluop,
			   output reg [3:0] alucontrol);
	always @ (*)
	begin
		case (aluop)
				3'b000: alucontrol <= 4'b0010; // addi&addiu&lw&sw
				3'b001: alucontrol <= 4'b0000; // andi
				3'b011: alucontrol <= 4'b0001; // ori
				3'b100: alucontrol <= 4'b1001; // slti
				3'b101: alucontrol <= 4'b1010; // sltiu
				3'b110: alucontrol <= 4'b1101; // beq
				3'b111: alucontrol <= 4'b1111; // bne
				default: case(funct) // RTYPE
						6'b100000: alucontrol <= 4'b0010; // ADD
						6'b100001: alucontrol <= 4'b0010; // ADDU
						6'b100010: alucontrol <= 4'b0110; // SUB
						6'b100011: alucontrol <= 4'b0110; // SUB
						6'b100100: alucontrol <= 4'b0000; // AND
						6'b100101: alucontrol <= 4'b0001; // OR
						6'b100111: alucontrol <= 4'b0101; // NOR
						6'b000000: alucontrol <= 4'b0011; // SLL
						6'b000010: alucontrol <= 4'b0100; // SRL
						6'b100110: alucontrol <= 4'b1011; // XOR 
						6'b101010: alucontrol <= 4'b1001; // SLT
						6'b101011: alucontrol <= 4'b1010; // SLTU
						
			default: alucontrol <= 4'bxxxx; // ???
		endcase
	endcase
	end
endmodule
