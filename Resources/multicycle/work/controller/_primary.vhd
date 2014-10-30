library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        op              : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        memtoreg        : out    vl_logic;
        memwrite        : out    vl_logic;
        alusrca         : out    vl_logic;
        alusrcb         : out    vl_logic_vector(1 downto 0);
        regdst          : out    vl_logic;
        regwrite        : out    vl_logic;
        jump            : out    vl_logic;
        signext         : out    vl_logic;
        alucontrol      : out    vl_logic_vector(3 downto 0);
        branch          : out    vl_logic;
        PCWriteCond     : out    vl_logic;
        PCWrite         : out    vl_logic;
        IorD            : out    vl_logic;
        IRWrite         : out    vl_logic;
        pcsrc           : out    vl_logic_vector(1 downto 0)
    );
end controller;
