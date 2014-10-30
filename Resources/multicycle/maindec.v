module maindec(input clk,reset,
            input [5:0] op,
			   output memtoreg, memwrite,
			   output branch, alusrca,
			   output [1:0] alusrcb,
			   output regdst, regwrite,
			   output jump,signext,		
			   output [2:0] aluop,
			   output PCWriteCond,PCWrite,  //multicycle
			   output IorD,IRWrite,
			   output reg [15:0] state,
			   output [1:0] pcsrc
			   );        //multicycle
	reg [18:0] controls;
	assign {memtoreg,memwrite,branch,alusrca,alusrcb,regdst,regwrite,
	jump,signext,aluop,PCWriteCond,PCWrite,IorD,IRWrite,pcsrc
	} = controls;
	//Now define the FSM
	parameter idle='h0,ifetch='h1,
	decode='h2,adrcal='h3,
	lwmem='h4,rexec='h5,
	addiexec='h6,andiexec='h7,
	addiuexec='h8,oriexec='h9,
	sltiexec='hA,sltiuexec='hB;//multi,divide;
	initial
	   state=idle;   
	   always @(negedge clk)
	   begin
	       if(reset)
	          begin
	             state<=idle;
	          end
	       else
	          casex(state)
	              idle:begin
	                     state<=ifetch;
	                     controls<=19'bx000_01x0_0000_0x10_100;
	                     end
	              ifetch:begin
	                       state<=decode;
	                       controls<=19'bx000_11x0_0100_0x0x_0xx;
	                     end
	              decode:begin
	                       casex(op)
	                          6'b000010:begin   //jump
	                             state<=idle;    //jumpfinish actually
	                             controls<=19'bxxxx_xxxx_1xxx_xx1x_x10;
	                             end
	                          6'b10x011:begin //lw or sw
	                             state<=adrcal;
	                             controls<=19'bx001_1000_0100_0000_0xx;
	                             end
	        
	                          6'b000000:begin    //r-type
	                             state<=rexec;
	                             controls<=19'bx001_0010_0x01_0000_0xx;
	                             end
	                          6'b000100:begin    //beq 
	                             state<=idle;    //brcomplete actually
	                             controls<=19'bx011_00x0_0x11_010x_001;
	                             end
	                          6'b000101:begin     //bne
	                             state<=idle;     //brcomplete actually
	                             controls<=19'bx011_00x0_0x11_110x_001;
	                             end
	                          6'b001100:begin  //andi
	                             state<=andiexec;
	                             controls<=19'bx001_1000_0000_100x_0xx;
	                             end
	                          6'b001101:begin  //ori
	                             state<=oriexec;
	                             controls<=19'bx001_1000_0001_100x_0xx;
	                             end  
	                          6'b001000:begin
	                             state<=addiexec;  //addi    
	                             controls<=19'bx001_1000_0100_000x_0xx;
	                             end
	                          6'b001001:begin
	                             state<=addiuexec;  //addiu    
	                             controls<=19'bx001_1000_0000_000x_0xx;
	                             end
	                          6'b001010:begin     //slti
	                             state<=sltiexec;
	                             controls<=19'bx001_1000_0110_000x_0xx;
	                             end
	                          6'b001011:begin     //sltiu
	                             state<=sltiuexec;
	                             controls<=19'bx001_1000_0010_000x_0xx;
	                             end   
	                             
	                        endcase
	                      end
	                adrcal:begin
	                        casex(op)
	                          6'b100011:begin  //lw
	                             state<=lwmem;
	                             controls<=19'bx001_1000_0100_0001_0xx;
	                             end
	                          6'b101011:begin   //sw
	                             state<=idle;    //swmem actually
	                             controls<=19'bx101_10x0_0100_0001_0xx;
	                             end
	                         endcase
	                        end
	                 lwmem:begin
	                    state<=idle;   //lwwr  actually  
	                    controls<=19'b1001_1001_0100_000x_0xx;
	                    end
	                 rexec:begin
	                    state<=idle;   //rfinish actually              
	                    controls<=19'b0001_0011_0x01_000x_0xx;
	                    end
	                 andiexec:begin 
	                    state<=idle;     //andifinish actually     
	                    controls<=19'b0001_1001_0000_100x_0xx;
	                    end
	                 oriexec:begin
	                    state<=idle;   //orifinish actually       
	                    controls<=19'b0001_1001_0001_100x_0xx; 
	                    end
	                 addiexec:begin
	                    state<=idle;     //addifinish actually
	                    controls<=19'b0001_1001_0100_000x_0xx;
	                    end
	                 addiuexec:begin
	                    state<=idle;     //addiufinish actually
	                    controls<=19'b0001_1001_0000_000x_0xx; 
	                    end
	                 sltiexec:begin
	                    state<=idle;     //sltifinish  actually
	                    controls<=19'b0001_1001_0110_000x_0xx;
	                    end
	                 sltiuexec:begin
	                    state<=idle;      //sltiufinish  actually
	                    controls<=19'b0001_1001_0010_000x_0xx;
	                    end
	              endcase
	            $display("<<state=%h>><<<<con=%b_%b_%b_%b_%b>>",state,
	              controls[18:15],controls[14:11],controls[10:7],
	              controls[6:3],controls[2:0]);
	           end  
	                                   

	//end
endmodule
