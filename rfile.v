// read register 1
// read register 2
// write register
// write data
// read data 1
// read data 2

`timescale 1ns / 1ns
module rfile(clk, rst,read_reg_1, read_reg_2,write_en, write_reg, write_data, read_data_1, read_data_2);
    input clk, rst;

    // read port 1
    input [4:0] read_reg_1;
    output [31:0]  read_data_1;

    // read port 2
    input [4:0] read_reg_2;
    output  [31:0]  read_data_2;

    // write port
    input write_en;
    input [4:0]write_reg;
    input [31:0] write_data;


    // a 32 x 32 memory file
    reg [31:0] memory[0:31];

    assign read_data_1 = memory[read_reg_1];
    assign read_data_2 = memory[read_reg_2];

    // We only write data on clock edge to prevent race condition
    integer i;
    always @(posedge clk)
    begin
        if(rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                memory[i] <= i;
            end
        end
        else begin
            if (write_en) begin
                memory[write_reg] <= write_data;
            end
        end
    end
endmodule

