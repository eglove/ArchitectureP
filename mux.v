module mux# 
(parameter DATA_SIZE = 32 )
(
output [DATA_SIZE - 1:0] outdata ,  // MUX out
input [DATA_SIZE - 1:0]  in1,       // MUX input 1
input [DATA_SIZE - 1:0]  in2,       // MUX input 2
input                    select     // input1: Select = 1 , input2: Select = 0
); 

assign outdata = select ? in1 : in2;
endmodule
