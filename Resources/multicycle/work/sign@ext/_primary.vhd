library verilog;
use verilog.vl_types.all;
entity signExt is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        signExt         : in     vl_logic;
        y               : out    vl_logic_vector(31 downto 0)
    );
end signExt;
