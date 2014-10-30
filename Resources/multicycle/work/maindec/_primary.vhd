library verilog;
use verilog.vl_types.all;
entity maindec is
    generic(
        idle            : integer := 0;
        ifetch          : integer := 1;
        decode          : integer := 2;
        adrcal          : integer := 3;
        lwmem           : integer := 4;
        rexec           : integer := 5;
        addiexec        : integer := 6;
        andiexec        : integer := 7;
        addiuexec       : integer := 8;
        oriexec         : integer := 9;
        sltiexec        : integer := 10;
        sltiuexec       : integer := 11
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        op              : in     vl_logic_vector(5 downto 0);
        memtoreg        : out    vl_logic;
        memwrite        : out    vl_logic;
        branch          : out    vl_logic;
        alusrca         : out    vl_logic;
        alusrcb         : out    vl_logic_vector(1 downto 0);
        regdst          : out    vl_logic;
        regwrite        : out    vl_logic;
        jump            : out    vl_logic;
        signext         : out    vl_logic;
        aluop           : out    vl_logic_vector(2 downto 0);
        PCWriteCond     : out    vl_logic;
        PCWrite         : out    vl_logic;
        IorD            : out    vl_logic;
        IRWrite         : out    vl_logic;
        state           : out    vl_logic_vector(15 downto 0);
        pcsrc           : out    vl_logic_vector(1 downto 0)
    );
end maindec;
