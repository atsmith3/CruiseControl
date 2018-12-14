-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.2
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mat_mul_wrap is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    matA_address0 : OUT STD_LOGIC_VECTOR (13 downto 0);
    matA_ce0 : OUT STD_LOGIC;
    matA_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    matB_address0 : OUT STD_LOGIC_VECTOR (13 downto 0);
    matB_ce0 : OUT STD_LOGIC;
    matB_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    matC_address0 : OUT STD_LOGIC_VECTOR (13 downto 0);
    matC_ce0 : OUT STD_LOGIC;
    matC_we0 : OUT STD_LOGIC;
    matC_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of mat_mul_wrap is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "mat_mul_wrap,hls_ip_2017_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.508000,HLS_SYN_LAT=20202,HLS_SYN_TPT=none,HLS_SYN_MEM=96,HLS_SYN_DSP=0,HLS_SYN_FF=665,HLS_SYN_LUT=389}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal matC_local_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_copy_mat_fu_28_ap_start : STD_LOGIC;
    signal grp_copy_mat_fu_28_ap_done : STD_LOGIC;
    signal grp_copy_mat_fu_28_ap_idle : STD_LOGIC;
    signal grp_copy_mat_fu_28_ap_ready : STD_LOGIC;
    signal grp_copy_mat_fu_28_src_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_28_src_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_28_dest_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_28_dest_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_28_dest_we0 : STD_LOGIC;
    signal grp_copy_mat_fu_28_dest_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_copy_mat_fu_36_ap_start : STD_LOGIC;
    signal grp_copy_mat_fu_36_ap_done : STD_LOGIC;
    signal grp_copy_mat_fu_36_ap_idle : STD_LOGIC;
    signal grp_copy_mat_fu_36_ap_ready : STD_LOGIC;
    signal grp_copy_mat_fu_36_src_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_36_src_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_36_dest_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_36_dest_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_36_dest_we0 : STD_LOGIC;
    signal grp_copy_mat_fu_36_dest_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_copy_mat_fu_44_ap_start : STD_LOGIC;
    signal grp_copy_mat_fu_44_ap_done : STD_LOGIC;
    signal grp_copy_mat_fu_44_ap_idle : STD_LOGIC;
    signal grp_copy_mat_fu_44_ap_ready : STD_LOGIC;
    signal grp_copy_mat_fu_44_src_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_44_src_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_44_dest_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_44_dest_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_44_dest_we0 : STD_LOGIC;
    signal grp_copy_mat_fu_44_dest_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_reg_grp_copy_mat_fu_28_ap_start : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_reg_grp_copy_mat_fu_36_ap_start : STD_LOGIC := '0';
    signal ap_reg_grp_copy_mat_fu_44_ap_start : STD_LOGIC := '0';
    signal ap_block_state2_on_subcall_done : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component copy_mat IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        src_address0 : OUT STD_LOGIC_VECTOR (13 downto 0);
        src_ce0 : OUT STD_LOGIC;
        src_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        dest_address0 : OUT STD_LOGIC_VECTOR (13 downto 0);
        dest_ce0 : OUT STD_LOGIC;
        dest_we0 : OUT STD_LOGIC;
        dest_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component mat_mul_wrap_matCbkb IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (13 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component mat_mul_wrap_matBcud IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (13 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    matC_local_U : component mat_mul_wrap_matCbkb
    generic map (
        DataWidth => 32,
        AddressRange => 10000,
        AddressWidth => 14)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_copy_mat_fu_44_src_address0,
        ce0 => grp_copy_mat_fu_44_src_ce0,
        q0 => matC_local_q0);

    matB_local_U : component mat_mul_wrap_matBcud
    generic map (
        DataWidth => 32,
        AddressRange => 10000,
        AddressWidth => 14)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_copy_mat_fu_36_dest_address0,
        ce0 => grp_copy_mat_fu_36_dest_ce0,
        we0 => grp_copy_mat_fu_36_dest_we0,
        d0 => grp_copy_mat_fu_36_dest_d0);

    matA_local_U : component mat_mul_wrap_matBcud
    generic map (
        DataWidth => 32,
        AddressRange => 10000,
        AddressWidth => 14)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_copy_mat_fu_28_dest_address0,
        ce0 => grp_copy_mat_fu_28_dest_ce0,
        we0 => grp_copy_mat_fu_28_dest_we0,
        d0 => grp_copy_mat_fu_28_dest_d0);

    grp_copy_mat_fu_28 : component copy_mat
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_copy_mat_fu_28_ap_start,
        ap_done => grp_copy_mat_fu_28_ap_done,
        ap_idle => grp_copy_mat_fu_28_ap_idle,
        ap_ready => grp_copy_mat_fu_28_ap_ready,
        src_address0 => grp_copy_mat_fu_28_src_address0,
        src_ce0 => grp_copy_mat_fu_28_src_ce0,
        src_q0 => matA_q0,
        dest_address0 => grp_copy_mat_fu_28_dest_address0,
        dest_ce0 => grp_copy_mat_fu_28_dest_ce0,
        dest_we0 => grp_copy_mat_fu_28_dest_we0,
        dest_d0 => grp_copy_mat_fu_28_dest_d0);

    grp_copy_mat_fu_36 : component copy_mat
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_copy_mat_fu_36_ap_start,
        ap_done => grp_copy_mat_fu_36_ap_done,
        ap_idle => grp_copy_mat_fu_36_ap_idle,
        ap_ready => grp_copy_mat_fu_36_ap_ready,
        src_address0 => grp_copy_mat_fu_36_src_address0,
        src_ce0 => grp_copy_mat_fu_36_src_ce0,
        src_q0 => matB_q0,
        dest_address0 => grp_copy_mat_fu_36_dest_address0,
        dest_ce0 => grp_copy_mat_fu_36_dest_ce0,
        dest_we0 => grp_copy_mat_fu_36_dest_we0,
        dest_d0 => grp_copy_mat_fu_36_dest_d0);

    grp_copy_mat_fu_44 : component copy_mat
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_copy_mat_fu_44_ap_start,
        ap_done => grp_copy_mat_fu_44_ap_done,
        ap_idle => grp_copy_mat_fu_44_ap_idle,
        ap_ready => grp_copy_mat_fu_44_ap_ready,
        src_address0 => grp_copy_mat_fu_44_src_address0,
        src_ce0 => grp_copy_mat_fu_44_src_ce0,
        src_q0 => matC_local_q0,
        dest_address0 => grp_copy_mat_fu_44_dest_address0,
        dest_ce0 => grp_copy_mat_fu_44_dest_ce0,
        dest_we0 => grp_copy_mat_fu_44_dest_we0,
        dest_d0 => grp_copy_mat_fu_44_dest_d0);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_grp_copy_mat_fu_28_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_copy_mat_fu_28_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_reg_grp_copy_mat_fu_28_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_copy_mat_fu_28_ap_ready)) then 
                    ap_reg_grp_copy_mat_fu_28_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_grp_copy_mat_fu_36_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_copy_mat_fu_36_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_reg_grp_copy_mat_fu_36_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_copy_mat_fu_36_ap_ready)) then 
                    ap_reg_grp_copy_mat_fu_36_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_grp_copy_mat_fu_44_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_copy_mat_fu_44_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_reg_grp_copy_mat_fu_44_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_copy_mat_fu_44_ap_ready)) then 
                    ap_reg_grp_copy_mat_fu_44_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_block_state2_on_subcall_done = ap_const_boolean_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state2_on_subcall_done_assign_proc : process(grp_copy_mat_fu_28_ap_done, grp_copy_mat_fu_36_ap_done, grp_copy_mat_fu_44_ap_done)
    begin
                ap_block_state2_on_subcall_done <= ((ap_const_logic_0 = grp_copy_mat_fu_28_ap_done) or (ap_const_logic_0 = grp_copy_mat_fu_36_ap_done) or (ap_const_logic_0 = grp_copy_mat_fu_44_ap_done));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_block_state2_on_subcall_done = ap_const_boolean_0))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_block_state2_on_subcall_done = ap_const_boolean_0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_copy_mat_fu_28_ap_start <= ap_reg_grp_copy_mat_fu_28_ap_start;
    grp_copy_mat_fu_36_ap_start <= ap_reg_grp_copy_mat_fu_36_ap_start;
    grp_copy_mat_fu_44_ap_start <= ap_reg_grp_copy_mat_fu_44_ap_start;
    matA_address0 <= grp_copy_mat_fu_28_src_address0;
    matA_ce0 <= grp_copy_mat_fu_28_src_ce0;
    matB_address0 <= grp_copy_mat_fu_36_src_address0;
    matB_ce0 <= grp_copy_mat_fu_36_src_ce0;
    matC_address0 <= grp_copy_mat_fu_44_dest_address0;
    matC_ce0 <= grp_copy_mat_fu_44_dest_ce0;
    matC_d0 <= grp_copy_mat_fu_44_dest_d0;
    matC_we0 <= grp_copy_mat_fu_44_dest_we0;
end behav;
