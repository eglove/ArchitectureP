module processor (clk,rst,result,writeData);
input clk,rst;
output [31:0] result,writeData;
wire [4:0] read_address2,write_address;
wire [31:0] ALUOut,op2,sign_ext,readAddress,writeAddress,writeData,rf_write_data;
wire [4:0]  pc_in = 0; 
wire [4:0]  p_counter;
wire [31:0] Instruction;
wire [31:0] read_data_1, read_data_2;
wire [31:0] readData;
wire        Zero;
wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [2:0]  ALUOp;
wire [3:0]  ALUCtrl;
assign pc_in = p_counter;
assign result = rf_write_data;
//////////////////////Program Counter/////////////////////
PC program_counter(
                   .clk       (clk), 
				   .rst       (rst),
				   .pc_in     (pc_in), 
				   .p_counter (p_counter));

//////////////////////instruction Memory/////////////////////
imem ins_mem(
             .Instruction (Instruction),
			 .clk         (clk), 
			 .Address     (p_counter));
			 
//////////////////////5bit 2x1 Mux/////////////////////
mux # 
  (.DATA_SIZE (5)) 
  mux1 (
        .outdata (write_address),
        .in1     (Instruction[15:11]),
        .in2     (Instruction[20:16]),
        .select  (RegDst));

		
//////////////////////Register File/////////////////////		
rfile reg_file(
              .clk         (clk), 
			  .rst         (rst),
			  .read_reg_1  (Instruction[25:21]), 
			  .read_reg_2  (Instruction[20:16]),
			  .write_en    (RegWrite), 
			  .write_reg   (write_address), 
			  .write_data  (rf_write_data), 
			  .read_data_1 (read_data_1), 
			  .read_data_2 (read_data_2));
			  
//////////////////////Sign Extend unit/////////////////////			  
signext signext1 (
               .input1  (Instruction[15:0]), 
			   .signext (0), 
			   .output1 (sign_ext) );
			   
//////////////////////32bit 2x1 Mux////////////////////////
mux # (32) mux2 (
               .outdata (op2),
               .in1     (sign_ext),
               .in2     (read_data_2),
               .select  (ALUSrc));
		
//////////////////////ALU/////////////////////////////////// 		
MIPSALU alu( 
           .ALUOut (ALUOut), 
		   .Zero   (Zero), 
		   .ALUctl (ALUCtrl), 
		   .op1    (read_data_1), 
		   .op2    (op2));

//////////////////////Data Memory///////////////////// 		   
assign readAddress = ALUOut;
assign writeAddress = ALUOut;
assign writeData   = read_data_2;
dmem Data_mem(
           .readData     (readData), 
		   .readAddress  (readAddress),  
		   .writeAddress (writeAddress), 
		   .writeData    (writeData), 
		   .MemRead      (MemRead),
		   .MemWrite     (MemWrite));
		   
//////////////////////32bit 2x1 Mux////////////////////////		   
mux # (32) mux3 (
           .outdata (rf_write_data),
           .in1     (readData),
           .in2     (ALUOut),
           .select  (MemtoReg));
		   
//////////////////////Control Unit////////////////////////
 Control control_unit(
           .opcode   (Instruction[31:26]),
           .RegDst   (RegDst),
           .Branch   (Branch),
           .MemRead  (MemRead),
           .MemtoReg (MemtoReg),
           .ALUOp    (ALUOp),
           .MemWrite (MemWrite), 
           .ALUSrc   (ALUSrc),
           .RegWrite (RegWrite)
);

//////////////////////ALU Control Unit////////////////////////
ALU_Control alu_control(
		   .funct   (Instruction[5:0]),
		   .ALUOp   (ALUOp),
		   .ALUCtrl (ALUCtrl)
		   );

endmodule















