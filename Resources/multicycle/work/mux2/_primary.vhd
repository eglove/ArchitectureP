library verilog;
use verilog.vl_types.all;
entity mux2 is
    generic(
        WIDTH           : integer := 8
    );
    port(
        data0           : in     vl_logic_vector;
        data1           : in     vl_logic_vector;
        src             : in     vl_logic;
        y               : out    vl_logic_vector
    );
end mux2;
