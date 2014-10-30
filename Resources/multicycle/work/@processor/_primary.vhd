library verilog;
use verilog.vl_types.all;
entity Processor is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        IorD            : in     vl_logic;
        IRWrite         : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        memwrite        : out    vl_logic;
        aluout          : out    vl_logic_vector(31 downto 0);
        writedata       : out    vl_logic_vector(31 downto 0);
        readdata        : in     vl_logic_vector(31 downto 0)
    );
end Processor;
