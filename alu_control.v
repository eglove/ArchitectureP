module alu_control(funct, ALUOp, ALUCtrl);

input [5:0] funct;
input [2:0] ALUOp;
output [2:0] ALUCtrl;
reg [2:0] ALUCtrl;

always @(ALUOp or funct)
	case(ALUOp)
		0: ALUCtrl = 3'b0;
		1: ALUCtrl = 3'b1;
		2: ALUCtrl = 3'b10;
		3: ALUCtrl = 3'b110;
		4: ALUCtrl = 3'b100;
		5: ALUCtrl = 3'b101;
		3'b111:
	case(funct)
		0: ALUCtrl = 3'b0;
		1: ALUCtrl = 3'b1;
		2: ALUCtrl = 3'b10;
		3: ALUCtrl = 3'b110;
		4: ALUCtrl = 3'b100;
		5: ALUCtrl = 3'b101;
	endcase
	endcase
endmodule