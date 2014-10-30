library verilog;
use verilog.vl_types.all;
entity Mem is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        irwrite         : in     vl_logic;
        Addr            : in     vl_logic_vector(6 downto 0);
        wd              : in     vl_logic_vector(31 downto 0);
        rd              : out    vl_logic_vector(31 downto 0);
        instr           : out    vl_logic_vector(31 downto 0)
    );
end Mem;
