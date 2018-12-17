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
    "mat_mul_wrap,hls_ip_2017_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.695667,HLS_SYN_LAT=860608,HLS_SYN_TPT=none,HLS_SYN_MEM=96,HLS_SYN_DSP=4,HLS_SYN_FF=1063,HLS_SYN_LUT=988}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal matC_local_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal matC_local_ce0 : STD_LOGIC;
    signal matC_local_we0 : STD_LOGIC;
    signal matC_local_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal matB_local_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal matB_local_ce0 : STD_LOGIC;
    signal matB_local_we0 : STD_LOGIC;
    signal matB_local_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal matA_local_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal matA_local_ce0 : STD_LOGIC;
    signal matA_local_we0 : STD_LOGIC;
    signal matA_local_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mat_mul_fu_30_ap_start : STD_LOGIC;
    signal grp_mat_mul_fu_30_ap_done : STD_LOGIC;
    signal grp_mat_mul_fu_30_ap_idle : STD_LOGIC;
    signal grp_mat_mul_fu_30_ap_ready : STD_LOGIC;
    signal grp_mat_mul_fu_30_matA_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_mat_mul_fu_30_matA_ce0 : STD_LOGIC;
    signal grp_mat_mul_fu_30_matB_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_mat_mul_fu_30_matB_ce0 : STD_LOGIC;
    signal grp_mat_mul_fu_30_matC_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_mat_mul_fu_30_matC_ce0 : STD_LOGIC;
    signal grp_mat_mul_fu_30_matC_we0 : STD_LOGIC;
    signal grp_mat_mul_fu_30_matC_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_copy_mat_fu_37_ap_start : STD_LOGIC;
    signal grp_copy_mat_fu_37_ap_done : STD_LOGIC;
    signal grp_copy_mat_fu_37_ap_idle : STD_LOGIC;
    signal grp_copy_mat_fu_37_ap_ready : STD_LOGIC;
    signal grp_copy_mat_fu_37_src_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_37_src_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_37_src_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_copy_mat_fu_37_dest_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_37_dest_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_37_dest_we0 : STD_LOGIC;
    signal grp_copy_mat_fu_37_dest_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_copy_mat_fu_45_ap_start : STD_LOGIC;
    signal grp_copy_mat_fu_45_ap_done : STD_LOGIC;
    signal grp_copy_mat_fu_45_ap_idle : STD_LOGIC;
    signal grp_copy_mat_fu_45_ap_ready : STD_LOGIC;
    signal grp_copy_mat_fu_45_src_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_45_src_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_45_dest_address0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_copy_mat_fu_45_dest_ce0 : STD_LOGIC;
    signal grp_copy_mat_fu_45_dest_we0 : STD_LOGIC;
    signal grp_copy_mat_fu_45_dest_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_reg_grp_mat_mul_fu_30_ap_start : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_reg_grp_copy_mat_fu_37_ap_start : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_reg_grp_copy_mat_fu_45_ap_start : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_state2_on_subcall_done : BOOLEAN;

    component mat_mul IS
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
    end component;


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


    component mat_mul_wrap_matCdEe IS
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
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    matC_local_U : component mat_mul_wrap_matCdEe
    generic map (
        DataWidth => 32,
        AddressRange => 10000,
        AddressWidth => 14)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => matC_local_address0,
        ce0 => matC_local_ce0,
        we0 => matC_local_we0,
        d0 => grp_mat_mul_fu_30_matC_d0,
        q0 => matC_local_q0);

    matB_local_U : component mat_mul_wrap_matCdEe
    generic map (
        DataWidth => 32,
        AddressRange => 10000,
        AddressWidth => 14)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => matB_local_address0,
        ce0 => matB_local_ce0,
        we0 => matB_local_we0,
        d0 => grp_copy_mat_fu_45_dest_d0,
        q0 => matB_local_q0);

    matA_local_U : component mat_mul_wrap_matCdEe
    generic map (
        DataWidth => 32,
        AddressRange => 10000,
        AddressWidth => 14)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => matA_local_address0,
        ce0 => matA_local_ce0,
        we0 => matA_local_we0,
        d0 => grp_copy_mat_fu_37_dest_d0,
        q0 => matA_local_q0);

    grp_mat_mul_fu_30 : component mat_mul
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_mat_mul_fu_30_ap_start,
        ap_done => grp_mat_mul_fu_30_ap_done,
        ap_idle => grp_mat_mul_fu_30_ap_idle,
        ap_ready => grp_mat_mul_fu_30_ap_ready,
        matA_address0 => grp_mat_mul_fu_30_matA_address0,
        matA_ce0 => grp_mat_mul_fu_30_matA_ce0,
        matA_q0 => matA_local_q0,
        matB_address0 => grp_mat_mul_fu_30_matB_address0,
        matB_ce0 => grp_mat_mul_fu_30_matB_ce0,
        matB_q0 => matB_local_q0,
        matC_address0 => grp_mat_mul_fu_30_matC_address0,
        matC_ce0 => grp_mat_mul_fu_30_matC_ce0,
        matC_we0 => grp_mat_mul_fu_30_matC_we0,
        matC_d0 => grp_mat_mul_fu_30_matC_d0);

    grp_copy_mat_fu_37 : component copy_mat
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_copy_mat_fu_37_ap_start,
        ap_done => grp_copy_mat_fu_37_ap_done,
        ap_idle => grp_copy_mat_fu_37_ap_idle,
        ap_ready => grp_copy_mat_fu_37_ap_ready,
        src_address0 => grp_copy_mat_fu_37_src_address0,
        src_ce0 => grp_copy_mat_fu_37_src_ce0,
        src_q0 => grp_copy_mat_fu_37_src_q0,
        dest_address0 => grp_copy_mat_fu_37_dest_address0,
        dest_ce0 => grp_copy_mat_fu_37_dest_ce0,
        dest_we0 => grp_copy_mat_fu_37_dest_we0,
        dest_d0 => grp_copy_mat_fu_37_dest_d0);

    grp_copy_mat_fu_45 : component copy_mat
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_copy_mat_fu_45_ap_start,
        ap_done => grp_copy_mat_fu_45_ap_done,
        ap_idle => grp_copy_mat_fu_45_ap_idle,
        ap_ready => grp_copy_mat_fu_45_ap_ready,
        src_address0 => grp_copy_mat_fu_45_src_address0,
        src_ce0 => grp_copy_mat_fu_45_src_ce0,
        src_q0 => matB_q0,
        dest_address0 => grp_copy_mat_fu_45_dest_address0,
        dest_ce0 => grp_copy_mat_fu_45_dest_ce0,
        dest_we0 => grp_copy_mat_fu_45_dest_we0,
        dest_d0 => grp_copy_mat_fu_45_dest_d0);





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


    ap_reg_grp_copy_mat_fu_37_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_copy_mat_fu_37_ap_start <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1)) or (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                    ap_reg_grp_copy_mat_fu_37_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_copy_mat_fu_37_ap_ready)) then 
                    ap_reg_grp_copy_mat_fu_37_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_grp_copy_mat_fu_45_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_copy_mat_fu_45_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_reg_grp_copy_mat_fu_45_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_copy_mat_fu_45_ap_ready)) then 
                    ap_reg_grp_copy_mat_fu_45_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_grp_mat_mul_fu_30_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_mat_mul_fu_30_ap_start <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    ap_reg_grp_mat_mul_fu_30_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_mat_mul_fu_30_ap_ready)) then 
                    ap_reg_grp_mat_mul_fu_30_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_mat_mul_fu_30_ap_done, grp_copy_mat_fu_37_ap_done, ap_CS_fsm_state4, ap_CS_fsm_state2, ap_CS_fsm_state6, ap_block_state2_on_subcall_done)
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
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_mat_mul_fu_30_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_copy_mat_fu_37_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_block_state2_on_subcall_done_assign_proc : process(grp_copy_mat_fu_37_ap_done, grp_copy_mat_fu_45_ap_done)
    begin
                ap_block_state2_on_subcall_done <= ((ap_const_logic_0 = grp_copy_mat_fu_37_ap_done) or (ap_const_logic_0 = grp_copy_mat_fu_45_ap_done));
    end process;


    ap_done_assign_proc : process(grp_copy_mat_fu_37_ap_done, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_copy_mat_fu_37_ap_done = ap_const_logic_1))) then 
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


    ap_ready_assign_proc : process(grp_copy_mat_fu_37_ap_done, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_copy_mat_fu_37_ap_done = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_copy_mat_fu_37_ap_start <= ap_reg_grp_copy_mat_fu_37_ap_start;

    grp_copy_mat_fu_37_src_q0_assign_proc : process(matA_q0, matC_local_q0, ap_CS_fsm_state2, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            grp_copy_mat_fu_37_src_q0 <= matC_local_q0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_copy_mat_fu_37_src_q0 <= matA_q0;
        else 
            grp_copy_mat_fu_37_src_q0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_copy_mat_fu_45_ap_start <= ap_reg_grp_copy_mat_fu_45_ap_start;
    grp_mat_mul_fu_30_ap_start <= ap_reg_grp_mat_mul_fu_30_ap_start;
    matA_address0 <= grp_copy_mat_fu_37_src_address0;

    matA_ce0_assign_proc : process(grp_copy_mat_fu_37_src_ce0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            matA_ce0 <= grp_copy_mat_fu_37_src_ce0;
        else 
            matA_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    matA_local_address0_assign_proc : process(grp_mat_mul_fu_30_matA_address0, grp_copy_mat_fu_37_dest_address0, ap_CS_fsm_state4, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            matA_local_address0 <= grp_copy_mat_fu_37_dest_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            matA_local_address0 <= grp_mat_mul_fu_30_matA_address0;
        else 
            matA_local_address0 <= "XXXXXXXXXXXXXX";
        end if; 
    end process;


    matA_local_ce0_assign_proc : process(grp_mat_mul_fu_30_matA_ce0, grp_copy_mat_fu_37_dest_ce0, ap_CS_fsm_state4, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            matA_local_ce0 <= grp_copy_mat_fu_37_dest_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            matA_local_ce0 <= grp_mat_mul_fu_30_matA_ce0;
        else 
            matA_local_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    matA_local_we0_assign_proc : process(grp_copy_mat_fu_37_dest_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            matA_local_we0 <= grp_copy_mat_fu_37_dest_we0;
        else 
            matA_local_we0 <= ap_const_logic_0;
        end if; 
    end process;

    matB_address0 <= grp_copy_mat_fu_45_src_address0;
    matB_ce0 <= grp_copy_mat_fu_45_src_ce0;

    matB_local_address0_assign_proc : process(grp_mat_mul_fu_30_matB_address0, grp_copy_mat_fu_45_dest_address0, ap_CS_fsm_state4, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            matB_local_address0 <= grp_copy_mat_fu_45_dest_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            matB_local_address0 <= grp_mat_mul_fu_30_matB_address0;
        else 
            matB_local_address0 <= "XXXXXXXXXXXXXX";
        end if; 
    end process;


    matB_local_ce0_assign_proc : process(grp_mat_mul_fu_30_matB_ce0, grp_copy_mat_fu_45_dest_ce0, ap_CS_fsm_state4, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            matB_local_ce0 <= grp_copy_mat_fu_45_dest_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            matB_local_ce0 <= grp_mat_mul_fu_30_matB_ce0;
        else 
            matB_local_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    matB_local_we0_assign_proc : process(grp_copy_mat_fu_45_dest_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            matB_local_we0 <= grp_copy_mat_fu_45_dest_we0;
        else 
            matB_local_we0 <= ap_const_logic_0;
        end if; 
    end process;

    matC_address0 <= grp_copy_mat_fu_37_dest_address0;

    matC_ce0_assign_proc : process(grp_copy_mat_fu_37_dest_ce0, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            matC_ce0 <= grp_copy_mat_fu_37_dest_ce0;
        else 
            matC_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    matC_d0 <= grp_copy_mat_fu_37_dest_d0;

    matC_local_address0_assign_proc : process(grp_mat_mul_fu_30_matC_address0, grp_copy_mat_fu_37_src_address0, ap_CS_fsm_state4, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            matC_local_address0 <= grp_copy_mat_fu_37_src_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            matC_local_address0 <= grp_mat_mul_fu_30_matC_address0;
        else 
            matC_local_address0 <= "XXXXXXXXXXXXXX";
        end if; 
    end process;


    matC_local_ce0_assign_proc : process(grp_mat_mul_fu_30_matC_ce0, grp_copy_mat_fu_37_src_ce0, ap_CS_fsm_state4, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            matC_local_ce0 <= grp_copy_mat_fu_37_src_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            matC_local_ce0 <= grp_mat_mul_fu_30_matC_ce0;
        else 
            matC_local_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    matC_local_we0_assign_proc : process(grp_mat_mul_fu_30_matC_we0, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            matC_local_we0 <= grp_mat_mul_fu_30_matC_we0;
        else 
            matC_local_we0 <= ap_const_logic_0;
        end if; 
    end process;


    matC_we0_assign_proc : process(grp_copy_mat_fu_37_dest_we0, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            matC_we0 <= grp_copy_mat_fu_37_dest_we0;
        else 
            matC_we0 <= ap_const_logic_0;
        end if; 
    end process;

end behav;