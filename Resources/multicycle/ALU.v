/******************************************Implementation of 32-bit ALU******************************************/

module ALU
(
	//Input and Output Ports
	input       clk,          //for multicycle
	input		 	 	[31:0]	srca, srcb,			//SrcA(R[rs]), SrcB(R[rt])
	input								cin,						//carryin
	input				[3:0]		aluctrl,					//ALUControl, ALU control signal
	input				[4:0]		shamt,
	output reg    [31:0]  aluresult,					//shift amount
	output	reg	[31:0]	aluout,				//ALUResult(R[rd]), ALU output
	output	reg 	cout, ov, zero, sign			//flags
);

assign cin=0;
/******************Add task. 完整超前进位加法器******************/
task add;	
	reg		[32:0]	shiftedcarry;	//temp
	reg		[31:0]	carrychain;
	integer				k;
	reg		[31:0]	g;
	reg		[31:0]	p;
	begin
		g = srca & srcb;
		p = srca ^ srcb;
      
		begin: carry_generation
		integer			k;
		carrychain[0] = g[0] + (p[0] & cin);
		for (k = 1; k <= 31; k = k+1)
			begin
				carrychain[k] = g[k] | (p[k] & carrychain[k-1]);
			end
		end
		shiftedcarry = {carrychain, cin};
    	aluout = p ^ shiftedcarry;
		cout = shiftedcarry[32];
   end
endtask

/******************Subtract task. The same implementation as "Add task" but with changed operants.******************/
task sub;	
	
	reg		[32:0]	shiftedcarry;	//temp
	reg   	[31:0] 	rsrcb;					//Temp for srcb, otherwise syntax errors may occur.
	reg		[31:0]	carrychain;
	integer				k;
	reg		[31:0]	g;
	reg		[31:0]	p;
	begin
		rsrcb = ~srcb + 1;
		g = srca & rsrcb;
		p = srca ^ rsrcb;

		begin: carry_generation
		integer			k;
		carrychain[0] = g[0] + (p[0] & cin);
		for (k = 1; k <= 31; k = k+1)
			begin
				carrychain[k] = g[k] | (p[k] & carrychain[k-1]);
			end
		end
		shiftedcarry = {carrychain, cin};
    	aluout = p ^ shiftedcarry;
		cout = shiftedcarry[32];
	end
endtask




/******************Main ALU Operations******************/
	always @ (*)
	begin
	    $display("alu<<<<<<<<srca=%b,srcb=%b>>>>>>>>>",srca,srcb);
	//Switching of ALU operations
		case (aluctrl)
			4'b0010: add();		//"+", add
			4'b0110: sub();		//"-", subtract
			//4'b0111: //"×", multiply
			//4'b1000: //"÷", divide
			4'b0000: aluout = srca & srcb;					//"AND", and
			4'b0001: aluout =srca | srcb;					//"OR", or

			4'b0101: aluout = ~(srca | srcb);				//"NOR", nor, 或非运算，可以当做非运算来使用，只要两个操作数取相同值即可
			4'b1011: aluout = srca ^ srcb;					//"XOR", xor, 异或运算
			4'b0011: aluout = srcb << shamt;				//"<<", shift left logical
			4'b0100: aluout = srcb >> shamt;				//">>", shift right logical	
			4'b1001: aluout = (srca < srcb) ? 1 : 0;	//"小于置1-1", Set Less Than
			//4'b1010: aluout = ????;							//"小于置1-2", Set Less Than
			4'b1101:					//BEQ, 等于置ZERO
				begin
					sub ();
					if (aluout == 0)
						zero = 1;
				end
			4'b1111:					//BNE, 不等于置ZERO
				begin
					sub ();
					if (aluout != 0)
						zero = 1;
				end
		endcase
		$display("alu<<<<<<aluout=%b>>>>>>",aluout);
   end

always @(negedge clk)
   begin
   aluresult<=aluout;
   $display("alu<<<<<<aluresult=%b>>>>>>",aluresult);
   end
 
endmodule
