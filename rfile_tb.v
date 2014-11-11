module rfile_tb;
    reg clk, rst;

    //read
    reg [4:0] read_reg_1;
    reg [4:0] read_reg_2;
    wire [31:0] read_data_1;
    wire [31:0] read_data_2;

    //write
    reg write_en;
    reg [4:0] write_reg;
    reg [31:0] write_data;

    rfile u0(clk, rst, read_reg_1, read_reg_2, write_en,
                write_reg, write_data, read_data_1, read_data_2);
    initial
        begin
            rst = 1;
            clk = 0;
            @(negedge clk);
            @(negedge clk);
            @(negedge clk);
            @(negedge clk);
            rst = 0;
        end

    always #50 clk = ~clk;
    initial
    begin
        read_reg_1 = 0;
        read_reg_2 = 0;
        write_en = 0;
        write_reg = 0;
        write_data = 0;
        @(negedge rst);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

        //writing data into register file
        write_en = 1;
        write_reg = 0;
        write_data = 32'b0000_0000_0000_0000_0000_0000_0101_0101;

        @(posedge clk);
        write_reg = 1;
        write_data = 32'b0000_0000_0000_0000_0000_0000_0111_0101;

        @(posedge clk);
        write_reg = 2;
        write_data = 32'b0000_0000_0000_0000_0000_0000_1101_0101;

        @(posedge clk);
        write_reg = 3;
        write_data = 32'b0000_0000_0000_0000_0000_0000_0101_0111;

        //stop writing data into register file
        @(posedge clk);
        write_en = 0;

        @(posedge clk);
        //reading data from register file
        read_reg_1 = 0;
        read_reg_2 = 1;

        @(posedge clk);
        read_reg_1 = 2;
        read_reg_2 = 3;
    end
    
    initial 
        #2000 $finish;
        
    initial 
        $monitor($time, " read_reg_1 = %d", read_reg_1,
                        " read_reg_2 = %d", read_reg_2,
                        " write_en = %d", write_en,
                        " write_reg = %d", write_reg,
                        " write_data = %d", write_data
                        );        
        
endmodule
