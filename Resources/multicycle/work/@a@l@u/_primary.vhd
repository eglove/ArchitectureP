library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        clk             : in     vl_logic;
        srca            : in     vl_logic_vector(31 downto 0);
        srcb            : in     vl_logic_vector(31 downto 0);
        cin             : in     vl_logic;
        aluctrl         : in     vl_logic_vector(3 downto 0);
        shamt           : in     vl_logic_vector(4 downto 0);
        aluresult       : out    vl_logic_vector(31 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        cout            : out    vl_logic;
        ov              : out    vl_logic;
        zero            : out    vl_logic;
        sign            : out    vl_logic
    );
end ALU;
