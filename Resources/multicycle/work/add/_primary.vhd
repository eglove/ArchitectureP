library verilog;
use verilog.vl_types.all;
entity add is
    port(
        srca            : in     vl_logic_vector(31 downto 0);
        srcb            : in     vl_logic_vector(31 downto 0);
        sum             : out    vl_logic_vector(31 downto 0)
    );
end add;
