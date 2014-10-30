library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        memtoreg        : in     vl_logic;
        pcsrc           : in     vl_logic_vector(1 downto 0);
        alusrca         : in     vl_logic;
        alusrcb         : in     vl_logic_vector(1 downto 0);
        regdst          : in     vl_logic;
        regwrite        : in     vl_logic;
        jump            : in     vl_logic;
        signExt         : in     vl_logic;
        branch          : in     vl_logic;
        aluctrl         : in     vl_logic_vector(3 downto 0);
        cout            : out    vl_logic;
        ov              : out    vl_logic;
        zero            : out    vl_logic;
        sign            : out    vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        writedata       : out    vl_logic_vector(31 downto 0);
        readdata        : in     vl_logic_vector(31 downto 0);
        pcwritecond     : in     vl_logic;
        pcwrite         : in     vl_logic
    );
end datapath;
