library verilog;
use verilog.vl_types.all;
entity mux4 is
    generic(
        WIDTH           : integer := 8
    );
    port(
        data0           : in     vl_logic_vector;
        data1           : in     vl_logic_vector;
        data2           : in     vl_logic_vector;
        data3           : in     vl_logic_vector;
        src             : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector
    );
end mux4;
