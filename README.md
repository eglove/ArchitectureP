ArchitectureP
=============

Project Phase II

Implement a single cycle processor in Verilog supporting the following MIPS instructions:

add
sub
and
or
nor
andi
ori
addi
lw
sw
slt
 

~~Write a processor module in Verilog that instantiates all the modules you wrote in the Phase-I as well as the control modules provided with this phase. More about module instantiation can be found here:

http://verilog.renerta.com/mobile/source/vrg00027.htm ~~

The processor module will just use a clock input. Write a processor testbench to simulate the processor module by “ticking” the clock for appropriate number of cycles. **The processor should be tested with a short assembly program (stored in the instruction memory) involving five or more different instructions listed above.** The following information may be useful for implementing the processor.

~~You would need a control unit and an ALU control unit that reads as input the appropriate part of the instruction and generates control signals as output. The control unit module and the ALU control module are provided. You may use them in your project with or without modifications.~~
~~You also need to write a PC module to implement the program counter and a PCadder module to add 4 to PC.~~
~~You would need multiple instantiations of the multiplexor module. Also you would need a 5-bit multiplexor for deciding the input to "write register" in the register file.~~
