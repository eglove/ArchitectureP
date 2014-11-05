// read register 1
// read register 2
// write register
// write data
// read data
// read data 2




module rfile(clk, read_reg_1, read_reg_2, write_reg, write_data, read_data_1, read_data_2);
    input clk;

    // port 1
    input [4:0] read_reg_1;
    output [31:0]  read_data_1;

    // port 2
    input [4:0] read_reg_2;
    output  [31:0]  read_data_2;

    input [4:0]write_reg;

    // a 32 x 32 memory register
    reg [31:0] memory[31:0];

    // initialize all the memory locations with binary 0
     initial
     begin
       for(i=0 ; i<32 ; i=i+1)
       begin
              for(j=0 ; j<32 ; j= j+1)
                memory[i][j] = 1'b0;
       end
     end

   // always @(negedge clk)
   // begin
   //     if( rdwrite != 0 )          // this is  read only register
   //         RAM[rdwrite] = rd;      // write rd data to this cell
  //  end

  //  always @(RAM[rssread])
  //  begin
  //      rs = RAM[rssread]           // fetch rs data
  //  end

 //   always @(RAM[rstread])
  //  begin
 //       rt = RAM[rstread]           // fetch rt
 //   end
endmodule

